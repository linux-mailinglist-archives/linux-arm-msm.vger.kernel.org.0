Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4F9951B3A3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 01:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245362AbiEDXlz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 19:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380748AbiEDXcu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 19:32:50 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0A384EA0A;
        Wed,  4 May 2022 16:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1651706953; x=1683242953;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2EKl1pLEHQIzxhFCcd9eEsheg+eBfByZIiGcnxTBPkI=;
  b=LlbiymG4KdKBun/oGJ8TjpqJBzKywHS5jbC1HhXtOrY2V/QJ4HOqsnlM
   L1AGsX5+Noxgha8vcRNQIah3yE0C+WUc/UUKjRDi2ySXxIYRk8tMyU6oz
   7II1J36AbwA1evTCslACAeXPMusgsGqGYpcu6SCG0xmmy6uD7trzB7kPw
   Y=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 04 May 2022 16:29:13 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2022 16:29:12 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 4 May 2022 16:29:12 -0700
Received: from [10.38.244.235] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 4 May 2022
 16:29:07 -0700
Message-ID: <62426006-b5a1-cbe7-9c3a-16f94334208f@quicinc.com>
Date:   Wed, 4 May 2022 16:29:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm: Fix shutdown
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC:     Stephen Boyd <swboyd@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Sean Paul <sean@poorly.run>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Xu Wang <vulab@iscas.ac.cn>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220504154909.1.Iaebd35e60160fc0f2a50fac3a0bf3b298c0637c8@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5/4/2022 3:49 PM, Douglas Anderson wrote:
> When rebooting on my sc7280-herobrine based device, I got a
> crash. Upon debugging, I found that I was in msm_drv_shutdown() and my
> "pdev" was the one associated with mdss_probe().
> 
>  From source, I found that mdss_probe() has the line:
>    platform_set_drvdata(pdev, mdss);
> ...where "mdss" is of type "struct msm_mdss *".
> 
> Also from source, I saw that in msm_drv_shutdown() we have the line:
>    struct msm_drm_private *priv = platform_get_drvdata(pdev);
> 
> This is a mismatch and is the root of the problem.
> 
> Further digging made it apparent that msm_drv_shutdown() is only
> supposed to be used for parts of the msm display framework that also
> call msm_drv_probe() but mdss_probe() doesn't call
> msm_drv_probe(). Let's remove the shutdown functon from msm_mdss.c.
> 
> Digging a little further, code inspection found that two drivers that
> use msm_drv_probe() weren't calling msm_drv_shutdown(). Let's add it
> to them.
> 
> Fixes: ecb23f2e3009 ("drm/msm: split the main platform driver")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Makes sense to me, and issue should happen everytime we shutdown so not 
sure how it didnt hit?

> ---
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 1 +
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 1 +
>   drivers/gpu/drm/msm/msm_mdss.c           | 1 -
>   3 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 143d6643be53..2b9d931474e0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1350,6 +1350,7 @@ MODULE_DEVICE_TABLE(of, dpu_dt_match);
>   static struct platform_driver dpu_driver = {
>   	.probe = dpu_dev_probe,
>   	.remove = dpu_dev_remove,
> +	.shutdown = msm_drv_shutdown,
>   	.driver = {
>   		.name = "msm_dpu",
>   		.of_match_table = dpu_dt_match,
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 9b7bbc3adb97..3d5621a68f85 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -1009,6 +1009,7 @@ MODULE_DEVICE_TABLE(of, mdp5_dt_match);
>   static struct platform_driver mdp5_driver = {
>   	.probe = mdp5_dev_probe,
>   	.remove = mdp5_dev_remove,
> +	.shutdown = msm_drv_shutdown,
>   	.driver = {
>   		.name = "msm_mdp",
>   		.of_match_table = mdp5_dt_match,
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 20f154dda9cf..0454a571adf7 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -397,7 +397,6 @@ MODULE_DEVICE_TABLE(of, mdss_dt_match);
>   static struct platform_driver mdss_platform_driver = {
>   	.probe      = mdss_probe,
>   	.remove     = mdss_remove,
> -	.shutdown   = msm_drv_shutdown,

Question to doug/dmitry:

Now that we removed msm_drv_shutdown, perhaps we should have a 
mdss_shutdown instead and call msm_mdss_destroy() internally?

>   	.driver     = {
>   		.name   = "msm-mdss",
>   		.of_match_table = mdss_dt_match,
