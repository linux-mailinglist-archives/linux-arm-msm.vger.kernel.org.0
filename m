Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 89BFA13BE44
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 12:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729782AbgAOLOn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 06:14:43 -0500
Received: from foss.arm.com ([217.140.110.172]:35200 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726045AbgAOLOn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 06:14:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B04FD31B;
        Wed, 15 Jan 2020 03:14:42 -0800 (PST)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D2F83F6C4;
        Wed, 15 Jan 2020 03:14:40 -0800 (PST)
Subject: Re: [PATCH v8 08/15] coresight: cti: Enable CTI associated with
 devices.
To:     Mike Leach <mike.leach@linaro.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        coresight@lists.linaro.org, linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
References: <20200113213149.25599-1-mike.leach@linaro.org>
 <20200113213149.25599-9-mike.leach@linaro.org>
From:   Suzuki Kuruppassery Poulose <suzuki.poulose@arm.com>
Message-ID: <396fc3a2-083b-29ef-2bb6-2fca066ea0ef@arm.com>
Date:   Wed, 15 Jan 2020 11:14:39 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200113213149.25599-9-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/01/2020 21:31, Mike Leach wrote:
> The CoreSight subsystem enables a path of devices from source to sink.
> Any CTI devices associated with the path devices must be enabled at the
> same time.
> 
> This patch adds an associated coresight_device element to the main
> coresight device structure, and uses this to create associations between
> the CTI and other devices based on the device tree data. The associated
> device element is used to enable CTI in conjunction with the path elements.
> 
> CTI devices are reference counted so where a single CTI is associated with
> multiple elements on the path, it will be enabled on the first associated
> device enable, and disabled with the last associated device disable.
> 
> Signed-off-by: Mike Leach <mike.leach@linaro.org>
> Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> ---
>   drivers/hwtracing/coresight/coresight-cti.c   | 129 ++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-cti.h   |   1 +
>   .../hwtracing/coresight/coresight-platform.c  |   1 +
>   drivers/hwtracing/coresight/coresight-priv.h  |  12 ++
>   drivers/hwtracing/coresight/coresight.c       |  71 +++++++++-
>   include/linux/coresight.h                     |   4 +
>   6 files changed, 213 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> index 77c2af247917..2be1b310e854 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.c
> +++ b/drivers/hwtracing/coresight/coresight-cti.c
> @@ -4,6 +4,7 @@
>    * Author: Mike Leach <mike.leach@linaro.org>
>    */
>   
> +#include <linux/property.h>
>   #include "coresight-cti.h"
>   
>   /**
> @@ -440,6 +441,131 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
>   	return err;
>   }
>   
> +/*
> + * Look for a matching connection device name in the list of connections.
> + * If found then swap in the csdev name, set trig con association pointer
> + * and return found.
> + */
> +static bool
> +cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> +		      struct coresight_device *csdev)
> +{
> +	struct cti_trig_con *trig_con;

super minor nit: Please use "struct cti_trig_con *tc;" consistent with
the naming everywhere else. Helps a lot in reading the code, especially
which has a lot of different structures.

> +	const char *csdev_name;
> +
> +	list_for_each_entry(trig_con, &ctidev->trig_cons, node) {
> +		if (trig_con->con_dev_name) {

This was allocated via devm_* and ...

> +			if (!strcmp(node_name, trig_con->con_dev_name)) {
> +				/* match: so swap in csdev name & dev */
> +				kfree(trig_con->con_dev_name);

... we free it here using kfree() without devm_ being aware. This could
cause double-free when the device is removed. This should either be
devm_kfree() or simply overwritten with the new string and leave
the device cleanup to free it.

> +				csdev_name = dev_name(&csdev->dev);
> +				trig_con->con_dev_name =
> +					kstrdup(csdev_name, GFP_KERNEL);

Please use devm_kstrdup() here on the CTI device to have a consistent
allocation.


> +				trig_con->con_dev = csdev;
> +				return true;
> +			}
> +		}
> +	}
> +	return false;
> +}
> 


> +/*
> + * Removing the associated devices is easier.
> + * A CTI will not have a value for csdev->ect_dev.
> + */
> +void cti_remove_assoc_from_csdev(struct coresight_device *csdev)
> +{
> +	struct cti_drvdata *ctidrv;
> +	struct cti_trig_con *tc;
> +	struct cti_device *ctidev;
> +
> +	mutex_lock(&ect_mutex);
> +	if (csdev->ect_dev) {
> +		ctidrv = csdev_to_cti_drvdata(csdev->ect_dev);
> +		ctidev = &ctidrv->ctidev;
> +		list_for_each_entry(tc, &ctidev->trig_cons, node) {
> +			if (tc->con_dev == csdev->ect_dev) {
> +				tc->con_dev = NULL;

Should we clear/free the name too ?

> +				break;
> +			}
> +		}
> +		csdev->ect_dev = NULL;
> +	}
> +	mutex_unlock(&ect_mutex);
> +}
> +EXPORT_SYMBOL_GPL(cti_remove_assoc_from_csdev);
> +

...

> diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
> index 469a06a1bb78..578d7e9ac67e 100644
> --- a/drivers/hwtracing/coresight/coresight-cti.h
> +++ b/drivers/hwtracing/coresight/coresight-cti.h
> @@ -216,6 +216,7 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
>   		      u32 channel_idx);
>   struct coresight_platform_data *
>   coresight_cti_get_platform_data(struct device *dev);
> +const char *cti_plat_get_node_name(struct fwnode_handle *fwnode);
>   
>   /* cti powered and enabled */
>   static inline bool cti_active(struct cti_config *cfg)
> diff --git a/drivers/hwtracing/coresight/coresight-platform.c b/drivers/hwtracing/coresight/coresight-platform.c
> index 43418a2126ff..421d4fc95f41 100644
> --- a/drivers/hwtracing/coresight/coresight-platform.c
> +++ b/drivers/hwtracing/coresight/coresight-platform.c
> @@ -313,6 +313,7 @@ static int of_get_coresight_platform_data(struct device *dev,
>   
>   	return 0;
>   }
> +

nit : spurious hunk ?

>   #else
>   static inline int
>   of_get_coresight_platform_data(struct device *dev,

Otherwise looks good to me

Suzuki
