Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3ACB28A330
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Oct 2020 01:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgJJW5W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Oct 2020 18:57:22 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:15247 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728489AbgJJVbf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Oct 2020 17:31:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602365492; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=++PfaktQtqZUoZFwJpMwbqOFzMy3ofIWwLzgFnK9zpo=;
 b=UQwzeh/ZQyZ9LhPr334MQg31d7TZ0WojvTnxXHhtSvydIbH9xu+7wmpAtNfr7bHCoLOOONaw
 J9UlX+loG2nIuwlBhxGKk9jJcVWYiij4llZTYv6gUVo7AZdXbrvs3V03FPykJIwIXQPQZBJA
 csTy9zvflT02y9L3ACS8m024AsY=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f82283457b88ccb5636a3ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Oct 2020 21:31:32
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0FC7BC43382; Sat, 10 Oct 2020 21:31:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE4C8C433CB;
        Sat, 10 Oct 2020 21:31:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 10 Oct 2020 14:31:30 -0700
From:   khsieh@codeaurora.org
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
        tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dp: add opp_table corner voting support base
 on dp_ink_clk rate
In-Reply-To: <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
References: <20201003222652.32671-1-khsieh@codeaurora.org>
 <717f90f2-4148-9fc0-c772-13f101f916a8@codeaurora.org>
Message-ID: <9978d4f12e7943b8223e2618f5fbb998@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-06 00:31, Rajendra Nayak wrote:
> On 10/4/2020 3:56 AM, Kuogee Hsieh wrote:
>> Set link rate by using OPP set rate api so that CX level will be set
>> accordingly based on the link rate.
>> 
>> Changes in v2:
>> -- remove dev from dp_ctrl_put() parameters
>> -- address review comments
> 
> This needs to go below '---' and should not be part of the
> change log.
> 
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 26 +++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_display.c |  2 +-
>>   drivers/gpu/drm/msm/dp/dp_power.c   | 44 
>> ++++++++++++++++++++++++++---
>>   drivers/gpu/drm/msm/dp/dp_power.h   |  2 +-
>>   4 files changed, 68 insertions(+), 6 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
>> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 2e3e1917351f..6eb9cdad1421 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -10,6 +10,7 @@
>>   #include <linux/delay.h>
>>   #include <linux/phy/phy.h>
>>   #include <linux/phy/phy-dp.h>
>> +#include <linux/pm_opp.h>
>>   #include <drm/drm_fixed.h>
>>   #include <drm/drm_dp_helper.h>
>>   #include <drm/drm_print.h>
>> @@ -76,6 +77,8 @@ struct dp_ctrl_private {
>>   	struct dp_parser *parser;
>>   	struct dp_catalog *catalog;
>>   +	struct opp_table *opp_table;
>> +
>>   	struct completion idle_comp;
>>   	struct completion video_comp;
>>   };
>> @@ -1836,6 +1839,7 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, 
>> struct dp_link *link,
>>   			struct dp_parser *parser)
>>   {
>>   	struct dp_ctrl_private *ctrl;
>> +	int ret;
>>     	if (!dev || !panel || !aux ||
>>   	    !link || !catalog) {
>> @@ -1849,6 +1853,19 @@ struct dp_ctrl *dp_ctrl_get(struct device *dev, 
>> struct dp_link *link,
>>   		return ERR_PTR(-ENOMEM);
>>   	}
>>   +	ctrl->opp_table = dev_pm_opp_set_clkname(dev, "ctrl_link");
>> +	if (IS_ERR(ctrl->opp_table)) {
>> +		dev_err(dev, "invalid DP OPP table in device tree\n");
> 
> You do this regardless of an OPP table in DT, so for starters the error
> message is wrong. Secondly this can return you a -EPROBE_DEFER if the
> clock driver isn't ready yet.
> So the ideal thing to do here, is return a PTR_ERR(ctrl->opp_table)
> 
>> +		ctrl->opp_table = NULL;
>> +	} else {
>> +		/* OPP table is optional */
>> +		ret = dev_pm_opp_of_add_table(dev);
>> +		if (ret && ret != -ENODEV) {
>> +			dev_pm_opp_put_clkname(ctrl->opp_table);
>> +			ctrl->opp_table = NULL;
>> +		}
>> +	}
>> +
>>   	init_completion(&ctrl->idle_comp);
>>   	init_completion(&ctrl->video_comp);
>>   @@ -1866,4 +1883,13 @@ struct dp_ctrl *dp_ctrl_get(struct device 
>> *dev, struct dp_link *link,
>>     void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
>>   {
>> +	struct dp_ctrl_private *ctrl;
>> +
>> +	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
>> +
>> +	if (ctrl->opp_table) {
>> +		dev_pm_opp_of_remove_table(ctrl->dev);
>> +		dev_pm_opp_put_clkname(ctrl->opp_table);
>> +		ctrl->opp_table = NULL;
>> +	}
>>   }
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c 
>> b/drivers/gpu/drm/msm/dp/dp_display.c
>> index e175aa3fd3a9..269f83550b46 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -698,7 +698,7 @@ static int dp_init_sub_modules(struct 
>> dp_display_private *dp)
>>   		goto error;
>>   	}
>>   -	dp->power = dp_power_get(dp->parser);
>> +	dp->power = dp_power_get(dev, dp->parser);
>>   	if (IS_ERR(dp->power)) {
>>   		rc = PTR_ERR(dp->power);
>>   		DRM_ERROR("failed to initialize power, rc = %d\n", rc);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_power.c 
>> b/drivers/gpu/drm/msm/dp/dp_power.c
>> index 17c1fc6a2d44..9c4ea00a5f2a 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.c
>> @@ -8,12 +8,14 @@
>>   #include <linux/clk.h>
>>   #include <linux/clk-provider.h>
>>   #include <linux/regulator/consumer.h>
>> +#include <linux/pm_opp.h>
>>   #include "dp_power.h"
>>   #include "msm_drv.h"
>>     struct dp_power_private {
>>   	struct dp_parser *parser;
>>   	struct platform_device *pdev;
>> +	struct device *dev;
>>   	struct clk *link_clk_src;
>>   	struct clk *pixel_provider;
>>   	struct clk *link_provider;
>> @@ -148,18 +150,51 @@ static int dp_power_clk_deinit(struct 
>> dp_power_private *power)
>>   	return 0;
>>   }
>>   +static int dp_power_clk_set_link_rate(struct dp_power_private 
>> *power,
>> +			struct dss_clk *clk_arry, int num_clk, int enable)
>> +{
>> +	u32 rate;
>> +	int i, rc = 0;
>> +
>> +	for (i = 0; i < num_clk; i++) {
>> +		if (clk_arry[i].clk) {
>> +			if (clk_arry[i].type == DSS_CLK_PCLK) {
>> +				if (enable)
>> +					rate = clk_arry[i].rate;
>> +				else
>> +					rate = 0;
>> +
>> +				rc = dev_pm_opp_set_rate(power->dev, rate);
> 
> I am not sure how this is expected to work when you have multiple link 
> clocks,
> since you can only associate one of them with the OPP table which ends 
> up
> getting scaled when you do a dev_pm_opp_set_rate()
> Do you really have platforms which will have multiple link clocks?
this clk_arry[] contains two entries, dp_link_clk and dp_link_intf_clk.
only dp_link_clk with DSS_CLK_PCLK type, hence only dp_link_clk use 
dev_pm_opp_set_rate()
to set link rate.

> 
>> +				if (rc)
>> +					break;
>> +			}
>> +
>> +		}
>> +	}
>> +	return rc;
>> +}
>> +
>>   static int dp_power_clk_set_rate(struct dp_power_private *power,
>>   		enum dp_pm_type module, bool enable)
>>   {
>>   	int rc = 0;
>>   	struct dss_module_power *mp = &power->parser->mp[module];
>>   -	if (enable) {
>> -		rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
>> +	if (module == DP_CTRL_PM) {
>> +		rc = dp_power_clk_set_link_rate(power, mp->clk_config, mp->num_clk, 
>> enable);
>>   		if (rc) {
>> -			DRM_ERROR("failed to set clks rate.\n");
>> +			DRM_ERROR("failed to set link clks rate\n");
>>   			return rc;
>>   		}
>> +	} else {
>> +
> 
> extra blank line
> 
>> +		if (enable) {
>> +			rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
>> +			if (rc) {
>> +				DRM_ERROR("failed to set clks rate\n");
>> +				return rc;
>> +			}
>> +		}
>>   	}
>>     	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
>> @@ -349,7 +384,7 @@ int dp_power_deinit(struct dp_power *dp_power)
>>   	return 0;
>>   }
>>   -struct dp_power *dp_power_get(struct dp_parser *parser)
>> +struct dp_power *dp_power_get(struct device *dev, struct dp_parser 
>> *parser)
>>   {
>>   	struct dp_power_private *power;
>>   	struct dp_power *dp_power;
>> @@ -365,6 +400,7 @@ struct dp_power *dp_power_get(struct dp_parser 
>> *parser)
>>     	power->parser = parser;
>>   	power->pdev = parser->pdev;
>> +	power->dev = dev;
>>     	dp_power = &power->dp_power;
>>   diff --git a/drivers/gpu/drm/msm/dp/dp_power.h 
>> b/drivers/gpu/drm/msm/dp/dp_power.h
>> index 76743d755833..7d0327bbc0d5 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_power.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_power.h
>> @@ -102,6 +102,6 @@ void dp_power_client_deinit(struct dp_power 
>> *power);
>>    * methods to be called by the client to configure the power related
>>    * modueles.
>>    */
>> -struct dp_power *dp_power_get(struct dp_parser *parser);
>> +struct dp_power *dp_power_get(struct device *dev, struct dp_parser 
>> *parser);
>>     #endif /* _DP_POWER_H_ */
>> 
>> base-commit: d1ea914925856d397b0b3241428f20b945e31434
> 
> ??
