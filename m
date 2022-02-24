Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 794614C36B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Feb 2022 21:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiBXUOY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Feb 2022 15:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234083AbiBXUOX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Feb 2022 15:14:23 -0500
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F06E818021D
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Feb 2022 12:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1645733633; x=1677269633;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=gFLMuuUQDo4k8fwHc39aiIlGqPq4JMVmtIhUzaUVBe8=;
  b=VKFVVhgLhJKNbaUOxtZdge3RlmF9M8ZgvxHp4eN+mf7Rk6WxUuT3DMoX
   7Oa3dkd2N7Z2pS7NyZdSu8yWtollb08Rhol6wH9D3mrSI3Rx3WZ2BGIcx
   ITx7k6qERkhF2tGqAkNORgB84Wx9pfR1Rik08ENlTNDwaVB6KIh6CnoCd
   k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 24 Feb 2022 12:13:52 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2022 12:13:52 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Thu, 24 Feb 2022 12:13:51 -0800
Received: from [10.110.44.69] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15; Thu, 24 Feb
 2022 12:13:51 -0800
Message-ID: <9348028b-a898-428e-a855-9df18e577328@quicinc.com>
Date:   Thu, 24 Feb 2022 12:13:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RFC PATCH v2 3/5] drm/msm/dp: support finding next bridge even
 for DP interfaces
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
CC:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220211224006.1797846-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
> It is possible to supply display-connector (bridge) to the DP interface,
> add support for parsing it too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_parser.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 901d7967370f..1056b8d5755b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -301,17 +301,22 @@ static int dp_parser_parse(struct dp_parser *parser, int connector_type)
>   		return rc;
>   
>   	/*
> -	 * Currently we support external bridges only for eDP connectors.
> +	 * External bridges are mandatory for eDP interfaces: one has to
> +	 * provide at least an eDP panel (which gets wrapped into panel-bridge).
>   	 *
> -	 * No external bridges are expected for the DisplayPort connector,
> -	 * it is physically present in a form of a DP or USB-C connector.
> +	 * For DisplayPort interfaces external bridges are optional, so
> +	 * silently ignore an error if one is not present (-ENODEV).
>   	 */
> -	if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> -		rc = dp_parser_find_next_bridge(parser);
> -		if (rc) {
> -			DRM_ERROR("DP: failed to find next bridge\n");
> +	rc = dp_parser_find_next_bridge(parser);
> +	if (rc == -ENODEV) {
> +		if (connector_type == DRM_MODE_CONNECTOR_eDP) {
> +			DRM_ERROR("eDP: next bridge is not present\n");
>   			return rc;
>   		}
> +	} else if (rc) {
> +		if (rc != -EPROBE_DEFER)
> +			DRM_ERROR("DP: error parsing next bridge: %d\n", rc);
> +		return rc;
>   	}

How is this silently ignoring?

static int dp_display_bind(struct device *dev, struct device *master,
                void *data)
{
     int rc = 0;
     struct dp_display_private *dp = dev_get_dp_display_private(dev);
     struct msm_drm_private *priv = dev_get_drvdata(master);
     struct drm_device *drm = priv->dev;

     dp->dp_display.drm_dev = drm;
     priv->dp[dp->id] = &dp->dp_display;

     rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
     if (rc) {
         DRM_ERROR("device tree parsing failed\n");
         goto end;
     }

dp_display_bind will still fail if a bridge is not found.

If supplying a bridge is optional even this should succeed right?

>   
>   	/* Map the corresponding regulator information according to
