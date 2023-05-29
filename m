Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0D4B7150E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 23:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229457AbjE2VPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 17:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjE2VPl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 17:15:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F19D9
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 14:15:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3642F618A3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 21:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0313EC433EF;
        Mon, 29 May 2023 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685394937;
        bh=AQc/2J1bL8tbEuFnnKMkMMVF+jCCW5kSdQt1yKmA39Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YEzFQ/v0Ksne9Z3plR+N0baKbWnbd3juoy6tycyFhWrwqxLZgq0+/HrjXVwYc5Df8
         46qznC88LKR1FRoLBcROS4wYHl4y9YUxu6nFn1UlvKfnL20cEcBIGMFxInSVJXv8To
         55I9dHEURGjk6MSQsWMGH0QkPh+hHn3XfUea4nIGV8sRVqScg++Jgk3YHILJVaKkxr
         SynxRSNP0rqzi2J9uyTO6csVUXafCHndxhKTE1ZXUh+bwBfW+6PjSkgYjJ03ElkwKd
         kPZIGb4yocAMB3nlW4UJRMk9mjK1iO7ZzUXtSTZbeqcyWTWrTI2DX5up4koRmJ3gDE
         lXimeLqzYXGIQ==
Date:   Mon, 29 May 2023 14:19:21 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 2/2] phy: qcom-snps-femto-v2: Remove AHB2PHY
 interface clock
Message-ID: <20230529211921.imf6tttlrkza4lc3@ripper>
References: <20230529185638.32376-1-athierry@redhat.com>
 <20230529185638.32376-3-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529185638.32376-3-athierry@redhat.com>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 29, 2023 at 02:56:37PM -0400, Adrien Thierry wrote:
> The AHB2PHY interface clock cfg_ahb_clk is not assigned anywhere in the
> driver. Moreover, it's not used by any device tree, nor is present in
> the qcom,usb-snps-femto-v2 bindings. Remove it.
> 

The downstream driver deals with cfg_ahb as well, so I think it would be
more appropriate to ensure that it's actually wired up.

And in that case, I would find it preferable to switch to use the
clk_bulk API for the introduction of the ref clk - to clean up the error
paths if nothing else.

Regards,
Bjorn

> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
> I'm not 100% sure if the clock should be removed, or if it should be added
> to bindings and device trees that use this PHY. Better informed opinions
> on the topic are highly welcome.
> 
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 8abf482e81a8..2d9c1105e28c 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -113,7 +113,6 @@ struct phy_override_seq {
>   * @phy: generic phy
>   * @base: iomapped memory space for snps hs phy
>   *
> - * @cfg_ahb_clk: AHB2PHY interface clock
>   * @ref_clk: phy reference clock
>   * @phy_reset: phy reset control
>   * @vregs: regulator supplies bulk data
> @@ -125,7 +124,6 @@ struct qcom_snps_hsphy {
>  	struct phy *phy;
>  	void __iomem *base;
>  
> -	struct clk *cfg_ahb_clk;
>  	struct clk *ref_clk;
>  	struct reset_control *phy_reset;
>  	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
> @@ -165,7 +163,6 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  					   0, USB2_AUTO_RESUME);
>  	}
>  
> -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>  	clk_disable_unprepare(hsphy->ref_clk);
>  	return 0;
>  }
> @@ -176,12 +173,6 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  
>  	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
>  
> -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> -	if (ret) {
> -		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
> -		return ret;
> -	}
> -
>  	ret = clk_prepare_enable(hsphy->ref_clk);
>  	if (ret) {
>  		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
> @@ -381,16 +372,10 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> -	if (ret) {
> -		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> -		goto poweroff_phy;
> -	}
> -
>  	ret = clk_prepare_enable(hsphy->ref_clk);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto poweroff_phy;
>  	}
>  
>  	ret = reset_control_assert(hsphy->phy_reset);
> @@ -463,8 +448,6 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  
>  disable_ref_clk:
>  	clk_disable_unprepare(hsphy->ref_clk);
> -disable_ahb_clk:
> -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>  poweroff_phy:
>  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>  
> @@ -476,7 +459,6 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
>  
>  	reset_control_assert(hsphy->phy_reset);
> -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>  	clk_disable_unprepare(hsphy->ref_clk);
>  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>  	hsphy->phy_initialized = false;
> -- 
> 2.40.1
> 
