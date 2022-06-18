Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2488255057B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Jun 2022 16:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236755AbiFROYE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 18 Jun 2022 10:24:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234641AbiFROXi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 18 Jun 2022 10:23:38 -0400
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BFDC64F1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jun 2022 07:23:37 -0700 (PDT)
Received: from g550jk.localnet (31-151-115-246.dynamic.upc.nl [31.151.115.246])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id D24AACD40E;
        Sat, 18 Jun 2022 14:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1655562214; bh=luy5YZGlZEEKjfBIkx9OpJ+p5eKHeGc9LiBC5Wfl1M0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=rSapFq4KF7xWO4KAgFobJPWoUo1kP2Pt/XB7HHfCLCRihd1IQsamIHMWCB7XK3aeZ
         csA1lEgaiJDlVRiqGGubs1uY1+Sf9572TpG5xMHp01pl1Mg1uEIG0yhMAFdSS0z9sC
         F+Q8BnOXnAVuA3j4I7tNbU/ICA9MLMeHKYxs98i8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        dri-devel@lists.freedesktop.org
Cc:     David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/5] drm/msm/mdss: enable optional core clock for MDP5 MDSS
Date:   Sat, 18 Jun 2022 16:23:33 +0200
Message-ID: <11998546.O9o76ZdvQC@g550jk>
In-Reply-To: <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
References: <20220615135935.87381-1-dmitry.baryshkov@linaro.org> <20220615135935.87381-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dmitry,

On Mittwoch, 15. Juni 2022 15:59:32 CEST Dmitry Baryshkov wrote:
> Enable (optional) core (MDP_CLK) clock that allows accessing HW_REV
> registers during the platform init.
> 

I believe you also need to update Documentation/devicetree/bindings/display/
msm/mdp5.txt with the new clock.

Regards
Luca

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index b41848bfff91..f7b4628986b8 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -288,7 +288,7 @@ static int msm_mdss_reset(struct device *dev)
>  /*
>   * MDP5 MDSS uses at most three specified clocks.
>   */
> -#define MDP5_MDSS_NUM_CLOCKS 3
> +#define MDP5_MDSS_NUM_CLOCKS 4
>  static int mdp5_mdss_parse_clock(struct platform_device *pdev, struct
> clk_bulk_data **clocks) {
>  	struct clk_bulk_data *bulk;
> @@ -305,6 +305,7 @@ static int mdp5_mdss_parse_clock(struct platform_device
> *pdev, struct clk_bulk_d bulk[num_clocks++].id = "iface";
>  	bulk[num_clocks++].id = "bus";
>  	bulk[num_clocks++].id = "vsync";
> +	bulk[num_clocks++].id = "core"; /* for hw_rev access */
> 
>  	ret = devm_clk_bulk_get_optional(&pdev->dev, num_clocks, bulk);
>  	if (ret)




