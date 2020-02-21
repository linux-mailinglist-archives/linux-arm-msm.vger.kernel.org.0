Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D49E216841D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2020 17:51:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726927AbgBUQvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 11:51:38 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:39444 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbgBUQvi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 11:51:38 -0500
Received: by mail-pj1-f67.google.com with SMTP id e9so1003095pjr.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2020 08:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=tEM+tesVTVelhRXwBYSeP4xDuDSKuUzJHlaSkE25t30=;
        b=DtEiys/4qhH8hyv+tP020VfRN3Jsc8PfosTjpDz8jJXXoNQnmpflnAl/Z/Ke1pMVx4
         klW6vkgnfzp1+C9/Auk+0R6WmKjTSn0QrhLR/7oGTUXilWZQIpq77IHSeel/LOEsMBJA
         EzjW1Bbrq19YEytPpTAeh44rz9FuRnjIO6MR/Z+uQ4qCVnCOWJrV01+sTWhKsWex8p8i
         IzOEFbINdr1njk6bCmzgrHVWnrEjoWNrn1GmiRoYWeQma7l3xjNJZAVpgMoPmiSFCnJw
         Gt6hzyCQmp8mKZf0da3x1LAz7MFh+KHPSoWwgotDTLtYCMlvuqb+/w0Ld2lLcBfAtqkc
         YwzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=tEM+tesVTVelhRXwBYSeP4xDuDSKuUzJHlaSkE25t30=;
        b=Pcfb/TduxTsziAUB0vqpNy7XjbrAWjYaV8o5VtvJoL2rwh+c7/D9AFPQLK5n1JL+k3
         itixE9b5jnstrykQjHvTMmuhSn2HVCzu9rJuD/K4CDqbnri8UvTBawSain2rq+fjLYsu
         qNnIWUG4s+E9W0YX70naPn4IKakcwaG60tS7MTKsCkVdntO2iX/fiuoA6rpOnBCIP9O8
         T75o7QQdvH9WM/LHmACYDaLD8s6zwZG8A0FIoZMbER9AUKVZv1DCLg8bPYmAGNABEvVC
         iubyIelE7j1XbYf7IbxKQHEJN/0Qdmhh+k4yTq7Y3sj2iEAG1+mXEyejx5MWqx5uOmzr
         yHGA==
X-Gm-Message-State: APjAAAWtyYwFy9Xnb6kHgLGOfiKKCW5DLQsJtZsRKevslMLIkmN00Hwh
        l85qO5WiSxNCzofabMDJ6syIJg==
X-Google-Smtp-Source: APXvYqzT+t3dCacWeKeKTixALPmwUeIlG7vCIxzI6q77A91pVv1ZgKkZhV/aajDg05G9jtXbeNxFcQ==
X-Received: by 2002:a17:90a:c214:: with SMTP id e20mr4039464pjt.98.1582303897356;
        Fri, 21 Feb 2020 08:51:37 -0800 (PST)
Received: from xps15 (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id ev5sm3104850pjb.4.2020.02.21.08.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2020 08:51:36 -0800 (PST)
Date:   Fri, 21 Feb 2020 09:51:34 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     mike.leach@linaro.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, coresight@lists.linaro.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, maxime@cerno.tech, liviu.dudau@arm.com,
        sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, agross@kernel.org,
        corbet@lwn.net
Subject: Re: [PATCH v9 08/15] coresight: cti: Enable CTI associated with
 devices.
Message-ID: <20200221165134.GA25043@xps15>
References: <20200210213924.20037-1-mike.leach@linaro.org>
 <20200210213924.20037-9-mike.leach@linaro.org>
 <04b739fd-7bb3-bd28-8013-918e7d4dfcb7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04b739fd-7bb3-bd28-8013-918e7d4dfcb7@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Feb 21, 2020 at 12:20:17AM +0000, Suzuki K Poulose wrote:
> Hi Mike
> 
> Sorry for the delay. one minor comment below.
> 
> On 02/10/2020 09:39 PM, Mike Leach wrote:
> > The CoreSight subsystem enables a path of devices from source to sink.
> > Any CTI devices associated with the path devices must be enabled at the
> > same time.
> > 
> > This patch adds an associated coresight_device element to the main
> > coresight device structure, and uses this to create associations between
> > the CTI and other devices based on the device tree data. The associated
> > device element is used to enable CTI in conjunction with the path elements.
> > 
> > CTI devices are reference counted so where a single CTI is associated with
> > multiple elements on the path, it will be enabled on the first associated
> > device enable, and disabled with the last associated device disable.
> > 
> > Signed-off-by: Mike Leach <mike.leach@linaro.org>
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> > ---
> >   drivers/hwtracing/coresight/coresight-cti.c  | 129 +++++++++++++++++++
> >   drivers/hwtracing/coresight/coresight-cti.h  |   1 +
> >   drivers/hwtracing/coresight/coresight-priv.h |  12 ++
> >   drivers/hwtracing/coresight/coresight.c      |  71 +++++++++-
> >   include/linux/coresight.h                    |   4 +
> >   5 files changed, 212 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-cti.c b/drivers/hwtracing/coresight/coresight-cti.c
> > index 77c2af247917..c4494923d030 100644
> > --- a/drivers/hwtracing/coresight/coresight-cti.c
> > +++ b/drivers/hwtracing/coresight/coresight-cti.c
> > @@ -4,6 +4,7 @@
> >    * Author: Mike Leach <mike.leach@linaro.org>
> >    */
> > +#include <linux/property.h>
> >   #include "coresight-cti.h"
> >   /**
> > @@ -440,6 +441,131 @@ int cti_channel_setop(struct device *dev, enum cti_chan_set_op op,
> >   	return err;
> >   }
> > +/*
> > + * Look for a matching connection device name in the list of connections.
> > + * If found then swap in the csdev name, set trig con association pointer
> > + * and return found.
> > + */
> > +static bool
> > +cti_match_fixup_csdev(struct cti_device *ctidev, const char *node_name,
> > +		      struct coresight_device *csdev)
> > +{
> > +	struct cti_trig_con *tc;
> > +	const char *csdev_name;
> > +
> > +	list_for_each_entry(tc, &ctidev->trig_cons, node) {
> > +		if (tc->con_dev_name) {
> > +			if (!strcmp(node_name, tc->con_dev_name)) {
> > +				/* match: so swap in csdev name & dev */
> > +				csdev_name = dev_name(&csdev->dev);
> > +				tc->con_dev_name =
> > +					devm_kstrdup(&csdev->dev, csdev_name,
> > +						     GFP_KERNEL);
> 
> In the extreme rare case of an allocation failure, we may want to
> check if the allocation was successful or not, rather than silently
> ignoring it. With that fixed,

Line 419 and 423 in patch 1 need the same attention.

> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
