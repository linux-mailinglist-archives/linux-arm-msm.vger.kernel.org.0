Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2388D73ABB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 23:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbjFVVjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 17:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjFVVjJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 17:39:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 736E91FEF
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 14:39:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0B4E06190D
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 21:39:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C536EC433C0;
        Thu, 22 Jun 2023 21:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687469947;
        bh=Z2zTt75aFcGtbth62mIt/vvQjlX+GrHqMyjPeIFN970=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jOP/MthUTyOSgLyggUl97x3Lf/lwzkl4IVLDnHp90GLDkZBh8Diw8GN990JHot2Eu
         l1K0z4Ge+a1f9q6PKpMbCZMDQlBNB5D87BQ2prIVWQbtqjX5OfgkFnLBsVnbQhwcNm
         zXcnQtg/gbfW0p1L1xxgshRQpp01q3IsthF5t5jCYpgtbCoiIOiZQfJt9fL7Bkps88
         8/xpBSX8WkOKT3UPJsTmmeX3GVMkGGmE1ShBcKlXl+VNJ8N8A77/SsjlDWbpx6snIP
         8P9xn0u0tYlGW4TlD8xtbaJvPUrLGomwQpxSgGlj2NBa+uefzA0h9vsXVI7tleTNdg
         DNTRehXJus1Yw==
Date:   Thu, 22 Jun 2023 14:43:07 -0700
From:   Bjorn Andersson <andersson@kernel.org>
To:     Adrien Thierry <athierry@redhat.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 2/3] phy: qcom-snps-femto-v2: add system sleep PM ops
Message-ID: <52qapxj7sdearduro3iiqqpekrltc5zviwgq3gz4j4lne6cp5b@phikpenjras3>
References: <20230622194021.80892-1-athierry@redhat.com>
 <20230622194021.80892-3-athierry@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622194021.80892-3-athierry@redhat.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 22, 2023 at 03:40:19PM -0400, Adrien Thierry wrote:
> The downstream driver [1] implements set_suspend(), which deals with
> both runtime and system sleep/resume. The upstream driver already has
> runtime PM ops, so add the system sleep PM ops as well, reusing the same
> code as the runtime PM ops.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/LV.AU.1.2.1.r2-05300-gen3meta.0/drivers/usb/phy/phy-msm-snps-hs.c
> 
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index ce1d2f8b568a..378a5029f61e 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -179,7 +179,7 @@ static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>  	readl_relaxed(base + offset);
>  }
>  
> -static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
> +static int qcom_snps_hsphy_do_suspend(struct qcom_snps_hsphy *hsphy)
>  {
>  	dev_dbg(&hsphy->phy->dev, "Suspend QCOM SNPS PHY\n");
>  
> @@ -199,7 +199,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  	return 0;
>  }
>  
> -static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
> +static int qcom_snps_hsphy_do_resume(struct qcom_snps_hsphy *hsphy)
>  {
>  	int ret;
>  
> @@ -214,25 +214,25 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  	return 0;
>  }
>  
> -static int __maybe_unused qcom_snps_hsphy_runtime_suspend(struct device *dev)
> +static int __maybe_unused qcom_snps_hsphy_suspend(struct device *dev)
>  {
>  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
>  
>  	if (!hsphy->phy_initialized)
>  		return 0;
>  
> -	qcom_snps_hsphy_suspend(hsphy);
> +	qcom_snps_hsphy_do_suspend(hsphy);
>  	return 0;
>  }
>  
> -static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
> +static int __maybe_unused qcom_snps_hsphy_resume(struct device *dev)
>  {
>  	struct qcom_snps_hsphy *hsphy = dev_get_drvdata(dev);
>  
>  	if (!hsphy->phy_initialized)
>  		return 0;
>  
> -	qcom_snps_hsphy_resume(hsphy);
> +	qcom_snps_hsphy_do_resume(hsphy);
>  	return 0;
>  }
>  
> @@ -518,8 +518,10 @@ static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
>  MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
>  
>  static const struct dev_pm_ops qcom_snps_hsphy_pm_ops = {
> -	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_runtime_suspend,
> -			   qcom_snps_hsphy_runtime_resume, NULL)
> +	SET_RUNTIME_PM_OPS(qcom_snps_hsphy_suspend,
> +			   qcom_snps_hsphy_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(qcom_snps_hsphy_suspend,
> +				qcom_snps_hsphy_resume)

Won't this cause issues if you system suspend the device while it's
already runtime suspended?

Regards,
Bjorn

>  };
>  
>  static void qcom_snps_hsphy_override_param_update_val(
> -- 
> 2.40.1
> 
