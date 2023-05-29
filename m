Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3FCB7150E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 May 2023 23:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbjE2VMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 May 2023 17:12:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjE2VMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 May 2023 17:12:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF420CF
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 14:12:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BBA56283B
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 May 2023 21:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588FCC433D2;
        Mon, 29 May 2023 21:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685394764;
        bh=V9Uy9QyvxrxjT3ieh9GMUe7WiVs9FXgRrlL/rmhLfAs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eH1Sbrfni3PKJDhmLnkrHraoBW2TFL/7zHBHA8ws12SQ19coXQNY030DCb8vcaWL2
         bJBNIzB3o4Atq8EsD75Sgc39ahow5/R6aDLkWjPHL0LgCOswpHAdC8TNEW3Wb7j4lQ
         BFIIJeRvXDrERc4Z7KFQNQ/IeH5hEcBTXBeSWjdOMD2dQ4kHbpTAvVrmPe8p+Nsahn
         obeZqVap9cZ59TVEIzwluAv6UjVcMBebeYrxZaDrlIZnaXh0EzwOMSVoCwWI9xW60+
         UuS8PDXqdDuI3/OW7fawj1JF84RIbbMFrt0imzdgRTRMQG+lg2X/9ynHSYGJ/ZObtG
         k3aAG3uH6fukQ==
Date:   Mon, 29 May 2023 14:16:29 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RFC 1/2] phy: qcom-snps-femto-v2: properly enable ref
 clock
Message-ID: <20230529211629.7sw542tyyygv4tcs@ripper>
References: <20230529185638.32376-1-athierry@redhat.com>
 <20230529185638.32376-2-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230529185638.32376-2-athierry@redhat.com>
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 29, 2023 at 02:56:36PM -0400, Adrien Thierry wrote:
> The driver is not enabling the ref clock, which thus gets disabled by
> the clk_disable_unused initcall. This leads to the dwc3 controller
> failing to initialize if probed after clk_disable_unused is called, for
> instance when the driver is built as a module.
> 

Good catch!

A side note though, clk_disable_unused() has no way to take kernel
modules into consideration today, and it doesn't handle the case where
clock drivers are built as modules appropriately.
Work has started to address this, but as of todaybooting the system
without clk_ignore_unused is not recommended...

> To fix this, add calls to clk_prepare_enable/clk_disable_unprepare at
> the proper places.
> 

If I parse the downstream kernel correctly the refclock should be
turned off across runtime and system suspend as well.

Regards,
Bjorn

> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 20 +++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 6c237f3cc66d..8abf482e81a8 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -166,6 +166,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  	}
>  
>  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	clk_disable_unprepare(hsphy->ref_clk);
>  	return 0;
>  }
>  
> @@ -181,6 +182,12 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  		return ret;
>  	}
>  
> +	ret = clk_prepare_enable(hsphy->ref_clk);
> +	if (ret) {
> +		dev_err(&hsphy->phy->dev, "failed to enable ref clock\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -380,10 +387,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  		goto poweroff_phy;
>  	}
>  
> +	ret = clk_prepare_enable(hsphy->ref_clk);
> +	if (ret) {
> +		dev_err(&phy->dev, "failed to enable ref clock, %d\n", ret);
> +		goto disable_ahb_clk;
> +	}
> +
>  	ret = reset_control_assert(hsphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto disable_ref_clk;
>  	}
>  
>  	usleep_range(100, 150);
> @@ -391,7 +404,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  	ret = reset_control_deassert(hsphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto disable_ref_clk;
>  	}
>  
>  	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> @@ -448,6 +461,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  
>  	return 0;
>  
> +disable_ref_clk:
> +	clk_disable_unprepare(hsphy->ref_clk);
>  disable_ahb_clk:
>  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
>  poweroff_phy:
> @@ -462,6 +477,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>  
>  	reset_control_assert(hsphy->phy_reset);
>  	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	clk_disable_unprepare(hsphy->ref_clk);
>  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>  	hsphy->phy_initialized = false;
>  
> -- 
> 2.40.1
> 
