Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282B2166B65
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 01:15:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729420AbgBUAPy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Feb 2020 19:15:54 -0500
Received: from foss.arm.com ([217.140.110.172]:54118 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729410AbgBUAPx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Feb 2020 19:15:53 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC99531B;
        Thu, 20 Feb 2020 16:15:52 -0800 (PST)
Received: from [10.37.12.72] (unknown [10.37.12.72])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27B4B3F6CF;
        Thu, 20 Feb 2020 16:15:49 -0800 (PST)
Subject: Re: [PATCH v9 08/15] coresight: cti: Enable CTI associated with
 devices.
To:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
References: <20200210213924.20037-1-mike.leach@linaro.org>
 <20200210213924.20037-9-mike.leach@linaro.org>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <04b739fd-7bb3-bd28-8013-918e7d4dfcb7@arm.com>
Date:   Fri, 21 Feb 2020 00:20:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200210213924.20037-9-mike.leach@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mike

Sorry for the delay. one minor comment below.

On 02/10/2020 09:39 PM, Mike Leach wrote:
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
>   drivers/hwtracing/coresight/coresight-cti.c  | 129 +++++++++++++++++++
>   drivers/hwtracing/coresight/coresight-cti.h  |   1 +
>   drivers/hwtracing/coresight/coresight-priv.h |  12 ++
>   drivers/hwtracing/coresight/coresight.c      |  71 +++++++++-
>   include/linux/coresight.h                    |   4 +
>   5 files changed, 212 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> index 77c2af247917..c4494923d030 100644
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
> +	struct cti_trig_con *tc;
> +	const char *csdev_name;
> +
> +	list_for_each_entry(tc, &ctidev->trig_cons, node) {
> +		if (tc->con_dev_name) {
> +			if (!strcmp(node_name, tc->con_dev_name)) {
> +				/* match: so swap in csdev name & dev */
> +				csdev_name = dev_name(&csdev->dev);
> +				tc->con_dev_name =
> +					devm_kstrdup(&csdev->dev, csdev_name,
> +						     GFP_KERNEL);

In the extreme rare case of an allocation failure, we may want to
check if the allocation was successful or not, rather than silently
ignoring it. With that fixed,

Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
