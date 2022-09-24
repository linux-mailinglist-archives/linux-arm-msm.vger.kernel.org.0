Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48DFA5E8D88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Sep 2022 16:48:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233529AbiIXOss (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Sep 2022 10:48:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233426AbiIXOsq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Sep 2022 10:48:46 -0400
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [IPv6:2001:4b7a:2000:18::163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89ADD8E0D
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Sep 2022 07:48:45 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 16E5E1F8F0;
        Sat, 24 Sep 2022 16:48:43 +0200 (CEST)
Message-ID: <f06d06a2-0631-2be6-a45a-86895c4c08f9@somainline.org>
Date:   Sat, 24 Sep 2022 16:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3 2/2] drm/msm/dsi: Add phy configuration for QCM2290
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Loic Poulain <loic.poulain@linaro.org>
References: <20220924121900.222711-1-dmitry.baryshkov@linaro.org>
 <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220924121900.222711-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 24.09.2022 14:19, Dmitry Baryshkov wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> The QCM2290 SoC a the 14nm (V2.0) single DSI phy. The platform is not
> fully compatible with the standard 14nm PHY, so it requires a separate
> compatible and config entry.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> [DB: rebased and updated commit msg]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

(sorry I didn't notice earlier that there was a v2)

Konrad
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 17 +++++++++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> index 7fc0975cb869..ee6051367679 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
> @@ -549,6 +549,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
>  #ifdef CONFIG_DRM_MSM_DSI_14NM_PHY
>  	{ .compatible = "qcom,dsi-phy-14nm",
>  	  .data = &dsi_phy_14nm_cfgs },
> +	{ .compatible = "qcom,dsi-phy-14nm-2290",
> +	  .data = &dsi_phy_14nm_2290_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-660",
>  	  .data = &dsi_phy_14nm_660_cfgs },
>  	{ .compatible = "qcom,dsi-phy-14nm-8953",
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> index 60a99c6525b2..1096afedd616 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
> @@ -50,6 +50,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_20nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_28nm_8960_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_660_cfgs;
> +extern const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_cfgs;
>  extern const struct msm_dsi_phy_cfg dsi_phy_10nm_8998_cfgs;
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 0f8f4ca46429..9f488adea7f5 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -1081,3 +1081,20 @@ const struct msm_dsi_phy_cfg dsi_phy_14nm_8953_cfgs = {
>  	.io_start = { 0x1a94400, 0x1a96400 },
>  	.num_dsi_phy = 2,
>  };
> +
> +const struct msm_dsi_phy_cfg dsi_phy_14nm_2290_cfgs = {
> +	.has_phy_lane = true,
> +	.regulator_data = dsi_phy_14nm_17mA_regulators,
> +	.num_regulators = ARRAY_SIZE(dsi_phy_14nm_17mA_regulators),
> +	.ops = {
> +		.enable = dsi_14nm_phy_enable,
> +		.disable = dsi_14nm_phy_disable,
> +		.pll_init = dsi_pll_14nm_init,
> +		.save_pll_state = dsi_14nm_pll_save_state,
> +		.restore_pll_state = dsi_14nm_pll_restore_state,
> +	},
> +	.min_pll_rate = VCO_MIN_RATE,
> +	.max_pll_rate = VCO_MAX_RATE,
> +	.io_start = { 0x5e94400 },
> +	.num_dsi_phy = 1,
> +};
