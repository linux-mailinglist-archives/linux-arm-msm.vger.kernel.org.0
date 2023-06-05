Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E27FD723396
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jun 2023 01:14:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjFEXOL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Jun 2023 19:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233191AbjFEXOK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Jun 2023 19:14:10 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5B0D2
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jun 2023 16:14:04 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f4b2bc1565so6904818e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jun 2023 16:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686006843; x=1688598843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fglrneJgPq0OiD5qkA1ASIqwU5N6cXFR8XgLk734s/Y=;
        b=dM+ipUGm+Lgz/I+QA3j/+VPx5LJvJORb8MTX+ArxtZ97HRaYOI7dSqhyXVoY35ObSm
         WPJw2Ko+RzzQ4yG0nqC+XSEK1xigpkFISLibbHITEbAUsZncPlonvIXm/jRsAm1coNhl
         4IU2roEApaQglbCdN8zR83YbE/HTS/e1388x/FVRXwLxyGe8jn3WDPB0HxWTBfCYdTF8
         n3E8gy6vqtq//+nK1yIj99bufUBrnTVRRCbvt6rq0ipkOcZ908fpSzyWvhdQ9yRXFCid
         U94+d2jnrecx5H+9GGYv2jG0rTDMu3e46yIjGUK/41obx+pVkJBU5QnHC10nhRLi57Vn
         yk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686006843; x=1688598843;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fglrneJgPq0OiD5qkA1ASIqwU5N6cXFR8XgLk734s/Y=;
        b=AMkOLgFsDVan695hJExOKbfufXvHGTHTH27NUxpRMHgfn0H/ZaGBciHSfRuNiKKB/C
         zH+6XxGzq1bVfTRwLrc4iYlBo8W+KjM+X6gMkgBYtDr6wb3ai2FatiuAMyrxpV6wCJhz
         vlms035yxIrND5V/d1g5dVcZ3vzwr5EyV0Blapt/6O2RwuuufVhnmHXlpEdPIetSbvUv
         ovUuBSA++laNygA9ez5BjyGt+2DPOJsSjE3DKu5JDNz1XyhcLKXAjfd/rrN7FlNgTOjq
         px0OGTR7jhaYPWvFUPk/Noi6VNQJEnk/09y6HxV1SV0OHv4Y9TKi10EwzT3IHDqR8X9/
         gXIA==
X-Gm-Message-State: AC+VfDzPrN0fSoXQFMvrOCgYpduv+GulR73PccmtgEXkpob07lF1pA6x
        oFjPvXWQhu48DsbjKJFK96N/vA==
X-Google-Smtp-Source: ACHHUZ5Te+XUX1/CKkj+bCw159WdkwIYU6uMDTC1Qrj6ErShwleY0+eVsaKW1xWpkjPz38GLL1Hijw==
X-Received: by 2002:a19:a40e:0:b0:4f1:4504:2679 with SMTP id q14-20020a19a40e000000b004f145042679mr200436lfc.41.1686006842678;
        Mon, 05 Jun 2023 16:14:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
        by smtp.gmail.com with ESMTPSA id t12-20020ac2548c000000b004eb4074f40fsm1282304lfk.241.2023.06.05.16.14.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 16:14:02 -0700 (PDT)
Message-ID: <fe51f704-3d24-d184-0251-39dc64a25598@linaro.org>
Date:   Tue, 6 Jun 2023 01:14:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/2] phy: qcom-snps-femto-v2: properly enable ref clock
Content-Language: en-US
To:     Adrien Thierry <athierry@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Wesley Cheng <wcheng@codeaurora.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
References: <20230605184455.34832-1-athierry@redhat.com>
 <20230605184455.34832-2-athierry@redhat.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230605184455.34832-2-athierry@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 5.06.2023 20:44, Adrien Thierry wrote:
> The driver is not enabling the ref clock, which thus gets disabled by
> the clk_disable_unused initcall. This leads to the dwc3 controller
> failing to initialize if probed after clk_disable_unused is called, for
> instance when the driver is built as a module.
> 
> To fix this, switch to the clk_bulk API to handle both cfg_ahb and ref
> clocks at the proper places.
> 
> Note that the cfg_ahb clock is currently not used by any device tree
> instantiation of the PHY. Work needs to be done separately to fix this.
> 
> Link: https://lore.kernel.org/linux-arm-msm/ZEqvy+khHeTkC2hf@fedora/
> Fixes: 51e8114f80d0 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
> Signed-off-by: Adrien Thierry <athierry@redhat.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 67 ++++++++++++++-----
>  1 file changed, 49 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> index 6c237f3cc66d..ce1d2f8b568a 100644
> --- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
> @@ -110,11 +110,13 @@ struct phy_override_seq {
>  /**
>   * struct qcom_snps_hsphy - snps hs phy attributes
>   *
> + * @dev: device structure
> + *
>   * @phy: generic phy
>   * @base: iomapped memory space for snps hs phy
>   *
> - * @cfg_ahb_clk: AHB2PHY interface clock
> - * @ref_clk: phy reference clock
> + * @num_clks: number of clocks
> + * @clks: array of clocks
>   * @phy_reset: phy reset control
>   * @vregs: regulator supplies bulk data
>   * @phy_initialized: if PHY has been initialized correctly
> @@ -122,11 +124,13 @@ struct phy_override_seq {
>   * @update_seq_cfg: tuning parameters for phy init
>   */
>  struct qcom_snps_hsphy {
> +	struct device *dev;
> +
>  	struct phy *phy;
>  	void __iomem *base;
>  
> -	struct clk *cfg_ahb_clk;
> -	struct clk *ref_clk;
> +	int num_clks;
> +	struct clk_bulk_data *clks;
>  	struct reset_control *phy_reset;
>  	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
>  
> @@ -135,6 +139,32 @@ struct qcom_snps_hsphy {
>  	struct phy_override_seq update_seq_cfg[NUM_HSPHY_TUNING_PARAMS];
>  };
>  
> +static int qcom_snps_hsphy_clk_init(struct qcom_snps_hsphy *hsphy)
> +{
> +	struct device *dev = hsphy->dev;
> +
> +	hsphy->num_clks = 2;
> +	hsphy->clks = devm_kcalloc(dev, hsphy->num_clks, sizeof(*hsphy->clks), GFP_KERNEL);
> +	if (!hsphy->clks)
> +		return -ENOMEM;
> +
> +	/*
> +	 * HACK: For cfg_ahb clock, use devm_clk_get_optional() because currently no device
> +	 * tree instantiation of the PHY is using the clock. This needs to be fixed in order
> +	 * for this code to be able to use devm_clk_bulk_get().
> +	 */
> +	hsphy->clks[0].id = "cfg_ahb";
> +	hsphy->clks[0].clk = devm_clk_get_optional(dev, "cfg_ahb");
Hm, maybe you could first check if we can get this clock
properly (!IS_ERR_OR_NULL) and then allocate the second
slot..

> +
> +	hsphy->clks[1].id = "ref";
> +	hsphy->clks[1].clk = devm_clk_get(dev, "ref");
> +	if (IS_ERR(hsphy->clks[1].clk))
> +		return dev_err_probe(dev, PTR_ERR(hsphy->clks[1].clk),
> +				     "failed to get ref clk\n");
> +
> +	return 0;
> +}
> +
>  static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>  						u32 mask, u32 val)
>  {
> @@ -165,7 +195,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
>  					   0, USB2_AUTO_RESUME);
>  	}
>  
> -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
>  	return 0;
>  }
>  
> @@ -175,9 +205,9 @@ static int qcom_snps_hsphy_resume(struct qcom_snps_hsphy *hsphy)
>  
>  	dev_dbg(&hsphy->phy->dev, "Resume QCOM SNPS PHY, mode\n");
>  
> -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> +	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
Aren't you dereferencing NULL if the optional clock is absent?

Konrad
>  	if (ret) {
> -		dev_err(&hsphy->phy->dev, "failed to enable cfg ahb clock\n");
> +		dev_err(&hsphy->phy->dev, "failed to enable clocks\n");
>  		return ret;
>  	}
>  
> @@ -374,16 +404,16 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  	if (ret)
>  		return ret;
>  
> -	ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
> +	ret = clk_bulk_prepare_enable(hsphy->num_clks, hsphy->clks);
>  	if (ret) {
> -		dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
> +		dev_err(&phy->dev, "failed to enable clocks, %d\n", ret);
>  		goto poweroff_phy;
>  	}
>  
>  	ret = reset_control_assert(hsphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto disable_clks;
>  	}
>  
>  	usleep_range(100, 150);
> @@ -391,7 +421,7 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  	ret = reset_control_deassert(hsphy->phy_reset);
>  	if (ret) {
>  		dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
> -		goto disable_ahb_clk;
> +		goto disable_clks;
>  	}
>  
>  	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
> @@ -448,8 +478,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
>  
>  	return 0;
>  
> -disable_ahb_clk:
> -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +disable_clks:
> +	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
>  poweroff_phy:
>  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>  
> @@ -461,7 +491,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
>  	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
>  
>  	reset_control_assert(hsphy->phy_reset);
> -	clk_disable_unprepare(hsphy->cfg_ahb_clk);
> +	clk_bulk_disable_unprepare(hsphy->num_clks, hsphy->clks);
>  	regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>  	hsphy->phy_initialized = false;
>  
> @@ -554,14 +584,15 @@ static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>  	if (!hsphy)
>  		return -ENOMEM;
>  
> +	hsphy->dev = dev;
> +
>  	hsphy->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(hsphy->base))
>  		return PTR_ERR(hsphy->base);
>  
> -	hsphy->ref_clk = devm_clk_get(dev, "ref");
> -	if (IS_ERR(hsphy->ref_clk))
> -		return dev_err_probe(dev, PTR_ERR(hsphy->ref_clk),
> -				     "failed to get ref clk\n");
> +	ret = qcom_snps_hsphy_clk_init(hsphy);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to initialize clocks\n");
>  
>  	hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(hsphy->phy_reset)) {
