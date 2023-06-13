Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 200C872EEED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jun 2023 00:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbjFMWMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 18:12:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbjFMWMP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 18:12:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A3A010E9;
        Tue, 13 Jun 2023 15:12:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A622F61F35;
        Tue, 13 Jun 2023 22:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2937CC433C0;
        Tue, 13 Jun 2023 22:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686694334;
        bh=sKrQ7hdq4mSomL4LDC24g6oc1MHOuvi2wLr6vE0lxhU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cLiwMUlahN9DTyi23DbZ6NqIxjOb6N1knEUWKRKVTtnPtDYzzbQraEF4t0foek5ve
         GTEEBrrxCnfBK4XplQfmh1XS6Yxf3vk72uqDxfWOg1Ozi7GbSnSOzSBvFMkkQ0n+0n
         KD15Qsm5oJ6bBZQuPiMZ7EvIM/zYLyRbbd92TLZ7kI8YWvtxT+efgDI7AdQH54SmDP
         anH1OdDexSZ1PqSmnOgLApBCoN0JdLZdOkRvaC1MUIwiNSSzRoYzBKHPndwfI5ml0P
         eiXrm7VnPP3ZZBpIOmElsQ3jMp0pD2xLV9QD+n4TJno/EAJyfPLADZVFNb7swRHNfC
         i5KMJ7S4VGU2g==
Date:   Tue, 13 Jun 2023 15:15:36 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 02/11] phy: qcom-qmp-ufs: populate offsets
 configuration
Message-ID: <20230613221536.6tikam262jjvzcfx@ripper>
References: <20230523140622.265692-1-dmitry.baryshkov@linaro.org>
 <20230523140622.265692-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523140622.265692-3-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, May 23, 2023 at 05:06:13PM +0300, Dmitry Baryshkov wrote:
> Populate offsets configuration for the rest of UFS PHYs to make it
> possible to switch them to the new (single-node) bindings style.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index 8c877b668bb9..d99dc1043f74 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -833,6 +833,8 @@ static const struct qmp_ufs_offsets qmp_ufs_offsets_v6 = {
>  static const struct qmp_phy_cfg msm8996_ufsphy_cfg = {
>  	.lanes			= 1,
>  
> +	.offsets		= &qmp_ufs_offsets,
> +
>  	.tbls = {
>  		.serdes		= msm8996_ufsphy_serdes,
>  		.serdes_num	= ARRAY_SIZE(msm8996_ufsphy_serdes),
> @@ -924,6 +926,8 @@ static const struct qmp_phy_cfg sc8280xp_ufsphy_cfg = {
>  static const struct qmp_phy_cfg sdm845_ufsphy_cfg = {
>  	.lanes			= 2,
>  
> +	.offsets		= &qmp_ufs_offsets,
> +
>  	.tbls = {
>  		.serdes		= sdm845_ufsphy_serdes,
>  		.serdes_num	= ARRAY_SIZE(sdm845_ufsphy_serdes),
> @@ -1038,6 +1042,8 @@ static const struct qmp_phy_cfg sm8150_ufsphy_cfg = {
>  static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
>  	.lanes			= 2,
>  
> +	.offsets		= &qmp_ufs_offsets,
> +
>  	.tbls = {
>  		.serdes		= sm8150_ufsphy_serdes,
>  		.serdes_num	= ARRAY_SIZE(sm8150_ufsphy_serdes),
> @@ -1070,6 +1076,8 @@ static const struct qmp_phy_cfg sm8250_ufsphy_cfg = {
>  static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
>  	.lanes			= 2,
>  
> +	.offsets		= &qmp_ufs_offsets,
> +
>  	.tbls = {
>  		.serdes		= sm8350_ufsphy_serdes,
>  		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_serdes),
> @@ -1102,6 +1110,8 @@ static const struct qmp_phy_cfg sm8350_ufsphy_cfg = {
>  static const struct qmp_phy_cfg sm8450_ufsphy_cfg = {
>  	.lanes			= 2,
>  
> +	.offsets		= &qmp_ufs_offsets,
> +
>  	.tbls = {
>  		.serdes		= sm8350_ufsphy_serdes,
>  		.serdes_num	= ARRAY_SIZE(sm8350_ufsphy_serdes),
> -- 
> 2.39.2
> 
