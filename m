Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6043FE9FD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Sep 2021 09:27:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243377AbhIBH2z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Sep 2021 03:28:55 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:37571 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243180AbhIBH2u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Sep 2021 03:28:50 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DA8F03F35F;
        Thu,  2 Sep 2021 09:27:49 +0200 (CEST)
Subject: Re: [PATCH v2 1/2] drm/msm/dsi: Use "ref" fw clock instead of global
 name for VCO parent
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        phone-devel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>
References: <20210830182445.167527-1-marijn.suijten@somainline.org>
 <20210830182445.167527-2-marijn.suijten@somainline.org>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Message-ID: <18b7fbaf-a284-660d-09d7-e1191166efb8@somainline.org>
Date:   Thu, 2 Sep 2021 09:27:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210830182445.167527-2-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=iso-8859-15; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Il 30/08/21 20:24, Marijn Suijten ha scritto:
> All DSI PHY/PLL drivers were referencing their VCO parent clock by a
> global name, most of which don't exist or have been renamed.  These
> clock drivers seem to function fine without that except the 14nm driver
> for the sdm6xx [1].
> 
> At the same time all DTs provide a "ref" clock as per the requirements
> of dsi-phy-common.yaml, but the clock is never used.  This patchset puts
> that clock to use without relying on a global clock name, so that all
> dependencies are explicitly defined in DT (the firmware) in the end.
> 
> Note that msm8974 is the only board not providing this clock, and
> apq8064 was providing the wrong clock (19.2MHz cxo instead of 27MHz
> pxo).  Both have been been addressed in separate patches that are
> supposed to land well in advance of this patchset.
> 
> Furthermore not all board-DTs provided this clock initially but that
> deficiency has been addressed in followup patches (see the Fixes:
> below).  Those commits seem to assume that the clock was used, while
> nothing in history indicates that this "ref" clock was ever retrieved.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/386db1a6-a1cd-3c7d-a88e-dc83f8a1be96@somainline.org/
> 
> Fixes: 79e51645a1dd ("arm64: dts: qcom: msm8916: Set 'xo_board' as ref clock of the DSI PHY")
> Fixes: 6969d1d9c615 ("ARM: dts: qcom-apq8064: Set 'cxo_board' as ref clock of the DSI PHY")
> Fixes: 0c0e72705a33 ("arm64: dts: sdm845: Set 'bi_tcxo' as ref clock of the DSI PHYs")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>

> ---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 4 +++-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 4 +++-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 4 +++-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 4 +++-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 4 +++-
>   5 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index e46b10fc793a..3cbb1f1475e8 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -562,7 +562,9 @@ static int pll_10nm_register(struct dsi_pll_10nm *pll_10nm, struct clk_hw **prov
>   	char clk_name[32], parent[32], vco_name[32];
>   	char parent2[32], parent3[32], parent4[32];
>   	struct clk_init_data vco_init = {
> -		.parent_names = (const char *[]){ "xo" },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "ref",
> +		},
>   		.num_parents = 1,
>   		.name = vco_name,
>   		.flags = CLK_IGNORE_UNUSED,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index bb31230721bd..406470265408 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -804,7 +804,9 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
>   {
>   	char clk_name[32], parent[32], vco_name[32];
>   	struct clk_init_data vco_init = {
> -		.parent_names = (const char *[]){ "xo" },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "ref",
> +		},
>   		.num_parents = 1,
>   		.name = vco_name,
>   		.flags = CLK_IGNORE_UNUSED,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> index 2da673a2add6..8ee9c9c0548d 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c
> @@ -521,7 +521,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>   {
>   	char clk_name[32], parent1[32], parent2[32], vco_name[32];
>   	struct clk_init_data vco_init = {
> -		.parent_names = (const char *[]){ "xo" },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "ref",
> +		},
>   		.num_parents = 1,
>   		.name = vco_name,
>   		.flags = CLK_IGNORE_UNUSED,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> index aaa37456f4ee..9662cb236468 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c
> @@ -385,7 +385,9 @@ static int pll_28nm_register(struct dsi_pll_28nm *pll_28nm, struct clk_hw **prov
>   {
>   	char *clk_name, *parent_name, *vco_name;
>   	struct clk_init_data vco_init = {
> -		.parent_names = (const char *[]){ "pxo" },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "ref",
> +		},
>   		.num_parents = 1,
>   		.flags = CLK_IGNORE_UNUSED,
>   		.ops = &clk_ops_dsi_pll_28nm_vco,
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 7c23d4c47338..c77c30628cca 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -590,7 +590,9 @@ static int pll_7nm_register(struct dsi_pll_7nm *pll_7nm, struct clk_hw **provide
>   	char clk_name[32], parent[32], vco_name[32];
>   	char parent2[32], parent3[32], parent4[32];
>   	struct clk_init_data vco_init = {
> -		.parent_names = (const char *[]){ "bi_tcxo" },
> +		.parent_data = &(const struct clk_parent_data) {
> +			.fw_name = "ref",
> +		},
>   		.num_parents = 1,
>   		.name = vco_name,
>   		.flags = CLK_IGNORE_UNUSED,
> 

