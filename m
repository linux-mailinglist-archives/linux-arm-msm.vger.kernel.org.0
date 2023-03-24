Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D876F6C78C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 08:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231713AbjCXHYR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 03:24:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbjCXHXs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 03:23:48 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A900722781
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 00:23:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 504FAB822F1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 07:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBF2C433D2;
        Fri, 24 Mar 2023 07:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679642607;
        bh=WavNANkGDDPowAZA0VJgVb0Xx0O3W/PtMhFB6+iYCIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=toczLOjIDvEFuvNl0CAk+3LGAQDSaBq/GTrn6u95XgD4XwFyNzFKxd53do7/QCace
         4RwFSDmRQn8UUKVhPfvaGtBpBHW4ifGz2V3xUC75tI1wQ2hWEpVzPluSnUzVwpUyqa
         FL29SJeMGVIbSETthlRjpT4MJZnhChU2cDrdQhPyPUFMNgiqnVrNsBbUaPvJ9hPWIT
         qEUsWkueQFY7crYbXZmrg1EB+eSMCQXB2i4CRMRckjBkP09n7UG4wfZqqGwNhbosNt
         5+ftzTNm4GtAIisBjuQhsU3GI4iYZ243a5rd3dTdapkSXKjeXXTdzCK5Jl7TMyGJmE
         yAb5mW2gZhNLw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pfblm-00031H-3v; Fri, 24 Mar 2023 08:23:26 +0100
Date:   Fri, 24 Mar 2023 08:23:26 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH 2/2] phy: qcom-qmp-pcie: sc8180x PCIe PHY has 2 lanes
Message-ID: <ZB1P7h0FdT66k/LG@hovoldconsulting.com>
References: <20230324001752.1768505-1-dmitry.baryshkov@linaro.org>
 <20230324001752.1768505-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230324001752.1768505-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Mar 24, 2023 at 03:17:52AM +0300, Dmitry Baryshkov wrote:
> All PCIe PHYs on sc8180x platform have 2 lanes, so change the number of
> lanes to 2.
> 
> Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")

This is not the right fixes tag either. This should have been 

Fixes: f839f14e24f2 ("phy: qcom-qmp: Add sc8180x PCIe support")

Should this also be backported (i.e. should you add a stable tag)?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> index d580f3d3e221..c95bf7ec2abe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
> @@ -2193,7 +2193,7 @@ static const struct qmp_phy_cfg msm8998_pciephy_cfg = {
>  };
>  
>  static const struct qmp_phy_cfg sc8180x_pciephy_cfg = {
> -	.lanes			= 1,
> +	.lanes			= 2,
>  
>  	.tbls = {
>  		.serdes		= sc8180x_qmp_pcie_serdes_tbl,

Johan
