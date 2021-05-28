Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD3CE39492F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 May 2021 01:40:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbhE1Xm2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 19:42:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14851 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229500AbhE1Xm2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 19:42:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622245253; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=ObCt7FLVUSqowY1LQ9oBhYcHVdMypKRBt0IQ8qdhFjM=;
 b=U/iPCF774cIHBCJOsf5JzLmgbOut7vmVA+FnhpcbNbAoYwlta+Y8ETWKg2in96W7QmCaOncb
 mK5Cxt9w9Vd88kXTfi38VfKiqq9UCRaZoRsDArN0b23Grz4W8MbW2z1+P6hO1Soy77fsDhAH
 JFYxryGgWJKw70LsFJILxRiURYU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60b17f718491191eb319c726 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 May 2021 23:40:33
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 354B7C4360C; Fri, 28 May 2021 23:40:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45190C4338A;
        Fri, 28 May 2021 23:40:32 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 28 May 2021 16:40:32 -0700
From:   abhinavk@codeaurora.org
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>, sbillaka@codeaurora.org,
        Tanmay Shah <tanmay@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Chandan Uddaraju <chandanu@codeaurora.org>
Subject: Re: [Freedreno] [PATCH 4/4] drm/msm/dp: Add support for SC8180x eDP
In-Reply-To: <20210511042043.592802-5-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
 <20210511042043.592802-5-bjorn.andersson@linaro.org>
Message-ID: <a1a8221a44edc3a509bdc1bb89bb5a97@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-10 21:20, Bjorn Andersson wrote:
> The eDP controller found in SC8180x is at large compatible with the
> current implementation, but has its register blocks at slightly
> different offsets.
> 
> Add the compatible and the new register layout.
> 
I am not able to completely recall the history of why in the DP bindings
we added DP register base as a big hunk and let catalog handle the 
submodule
offsets.

I guess earlier that made sense because DP sub-block offsets were fixed.
But if we plan to re-use the DP driver for eDP as well like this series, 
then maybe it might be
better if this comes from device tree like the earlier version was 
planning to

https://patchwork.kernel.org/project/dri-devel/patch/0101016ec6ddf446-e87ab1ce-5cbf-40a0-a0bb-cd0151cd577a-000000@us-west-2.amazonses.com/


+- reg:                  Base address and length of DP hardware's memory 
mapped regions.
+- cell-index:           Specifies the controller instance.
+- reg-names:            A list of strings that name the list of regs.
+			"dp_ahb" - DP controller memory region.
+			"dp_aux" - DP AUX memory region.
+			"dp_link" - DP link layer memory region.
+			"dp_p0" - DP pixel clock domain memory region.
+			"dp_phy" - DP PHY memory region.
+			"dp_ln_tx0" - USB3 DP PHY combo TX-0 lane memory region.
+			"dp_ln_tx1" - USB3 DP PHY combo TX-1 lane memory region.

Now there is more reason to separate the sub-module offsets like 
ahb/aux/link/p0
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 28 ++++++++++++++++++++--------
>  2 files changed, 21 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index d1319b58e901..0be03bdc882c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -121,6 +121,7 @@ struct dp_display_private {
> 
>  static const struct of_device_id dp_dt_match[] = {
>  	{.compatible = "qcom,sc7180-dp"},
> +	{ .compatible = "qcom,sc8180x-edp" },
>  	{}
>  };
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c
> b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 51ec85b4803b..47cf18bba4b2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -251,6 +251,7 @@ static int dp_parser_clock(struct dp_parser 
> *parser)
>  static int dp_parser_parse(struct dp_parser *parser)
>  {
>  	struct dss_io_data *io = &parser->io.dp_controller;
> +	struct device *dev = &parser->pdev->dev;
>  	int rc = 0;
> 
>  	if (!parser) {
> @@ -276,14 +277,25 @@ static int dp_parser_parse(struct dp_parser 
> *parser)
>  	 */
>  	parser->regulator_cfg = &sdm845_dp_reg_cfg;
> 
> -	io->ahb = io->base + 0x0;
> -	io->ahb_len = 0x200;
> -	io->aux = io->base + 0x200;
> -	io->aux_len = 0x200;
> -	io->link = io->base + 0x400;
> -	io->link_len = 0x600;
> -	io->p0 = io->base + 0x1000;
> -	io->p0_len = 0x400;
> +	if (of_device_is_compatible(dev->of_node, "qcom,sc8180x-edp")) {
> +		io->ahb = io->base + 0x0;
> +		io->ahb_len = 0x200;
> +		io->aux = io->base + 0x200;
> +		io->aux_len = 0x200;
> +		io->link = io->base + 0x400;
> +		io->link_len = 0x600;
> +		io->p0 = io->base + 0xa00;
> +		io->p0_len = 0x400;
> +	} else {
> +		io->ahb = io->base + 0x0;
> +		io->ahb_len = 0x200;
> +		io->aux = io->base + 0x200;
> +		io->aux_len = 0x200;
> +		io->link = io->base + 0x400;
> +		io->link_len = 0x600;
> +		io->p0 = io->base + 0x1000;
> +		io->p0_len = 0x400;
> +	}
> 
>  	return 0;
>  }
