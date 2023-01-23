Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07395677D5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 15:01:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbjAWOBA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 09:01:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232125AbjAWOAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 09:00:55 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39CBD2749C
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 06:00:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CDE37B80DC8
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 14:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D37C433A7;
        Mon, 23 Jan 2023 14:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674482448;
        bh=z1pi/IomC8EbMbAbqgEQrD1QfIJq2govIDjeXv0JcDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BrTE4MYz90htuGhdMHozhf0qVOkhuiq5r1brfrFtCpxYIClm5y7YTCfdN+ftVTBkn
         7dkdNhIvEVdXqmKNN40xepQMrMXjmJDT1sEpF1X7W1+LvH6dMedMxd/op+sSTyoVyE
         nqc6wMpWk5jUiabZK9oQKsa3FLmP1kF+zLLk57uLmVGbotjnv5oW1WmTrQB7DmAsG3
         8SmRy/3Y+3jDuiIFMWCJrjcYHU3DkxJwWw4tFh+6+wCu8pqsPq/6ZaJwkAiTLDrdwQ
         eHa6sCeXj9wYttP/glug6wfbQuef1BVuI78PFBY/J6hXdvwHyDuFugvbr7B2I4BHgj
         QN4ePAXtLP6hQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pJxNN-0003Ns-IN; Mon, 23 Jan 2023 15:00:46 +0100
Date:   Mon, 23 Jan 2023 15:00:45 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH] phy: qcom-qmp-combo: correct DP register offsets
Message-ID: <Y86TDYOKtpcLdZYx@hovoldconsulting.com>
References: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123120807.3101313-1-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 23, 2023 at 02:08:07PM +0200, Dmitry Baryshkov wrote:
> Correct DP register offsets used with new DT bindings scheme. First, DP
> TX registers reside in separate regions, not in the same regions as USB
> TX registers do. Second, correct DP_PHY region offset to follow the
> offset used for earlier generations/bindings.

No, this patch is broken. SC8280XP is different, doesn't seem to have
separate DP TX regions and the DP_PHY registers lies at a different
offset than on previous generations.

You can't just pull these numbers out of your ... ;)

This is the only platform that I can test the DP part on and it is
working. If that happens to be by chance, then you need to blame the
commit adding support for sc8280xp (i.e. not the one that fixed the
binding). And note that this was added by Bjorn who do have access to
the documentation for this SoC (as well as actual hardware).

> Cc: Johan Hovold <johan+linaro@kernel.org>
> Fixes: 83a0bbe39b17 ("phy: qcom-qmp-combo: add support for updated sc8280xp binding")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 1f022e580407..c6634f92de19 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -807,6 +807,8 @@ struct qmp_combo_offsets {
>  	u16 usb3_pcs;
>  	u16 usb3_pcs_usb;
>  	u16 dp_serdes;
> +	u16 dp_txa;
> +	u16 dp_txb;
>  	u16 dp_dp_phy;
>  };
>  
> @@ -984,7 +986,9 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
>  	.usb3_pcs	= 0x1400,
>  	.usb3_pcs_usb	= 0x1700,
>  	.dp_serdes	= 0x2000,
> -	.dp_dp_phy	= 0x2200,
> +	.dp_txa		= 0x2200,
> +	.dp_txa		= 0x2600,

You added dp_txa twice.

> +	.dp_dp_phy	= 0x2a00,
>  };
>  
>  static const struct qmp_phy_cfg sc7180_usb3dpphy_cfg = {
> @@ -2639,8 +2643,8 @@ static int qmp_combo_parse_dt(struct qmp_combo *qmp)
>  	qmp->pcs_usb = base + offs->usb3_pcs_usb;
>  
>  	qmp->dp_serdes = base + offs->dp_serdes;
> -	qmp->dp_tx = base + offs->txa;
> -	qmp->dp_tx2 = base + offs->txb;
> +	qmp->dp_tx = base + offs->dp_txa;
> +	qmp->dp_tx2 = base + offs->dp_txb;
>  	qmp->dp_dp_phy = base + offs->dp_dp_phy;
>  
>  	qmp->pipe_clk = devm_clk_get(dev, "usb3_pipe");

Johan
