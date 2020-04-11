Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D0401A4DC3
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 06:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgDKENK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Apr 2020 00:13:10 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:45365 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725853AbgDKENJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Apr 2020 00:13:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586578389; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=+sUFNmPugrx9OCnG3P/MWDj5UgVIIwaTrn/1HJ/r+Us=; b=UUbmnCC7oVxlpMNx867ls2po5U/Bismz1DiXu0qKX9JJ6rCXM1CWPYi+OwymvVSrxWEbj2Ak
 gULp4fGvPQEQf8G09igvuN8odsyHjrGgykxCkhgrSLfkHPpkVrtcD4c6BWHIZ06LPbNqxpsH
 cL92QXK2WKgrcz8i030oupeMgn0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9143d3.7f17cdb3c298-smtp-out-n03;
 Sat, 11 Apr 2020 04:13:07 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8B27CC432C2; Sat, 11 Apr 2020 04:13:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.110.2.190] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BEBAAC433CB;
        Sat, 11 Apr 2020 04:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BEBAAC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
Subject: Re: [PATCH v3 2/4] phy: qcom-snps: Add SNPS USB PHY driver for QCOM
 based SOCs
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org
References: <1586298209-4589-1-git-send-email-wcheng@codeaurora.org>
 <1586298209-4589-3-git-send-email-wcheng@codeaurora.org>
 <158657149111.199533.2451403004745553390@swboyd.mtv.corp.google.com>
From:   Wesley Cheng <wcheng@codeaurora.org>
Message-ID: <16fa7780-8901-f2f4-7633-b43f0e9ada90@codeaurora.org>
Date:   Fri, 10 Apr 2020 21:13:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <158657149111.199533.2451403004745553390@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 4/10/2020 7:18 PM, Stephen Boyd wrote:
> Quoting Wesley Cheng (2020-04-07 15:23:27)
>> diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
>> index e46824d..3158c14 100644
>> --- a/drivers/phy/qualcomm/Kconfig
>> +++ b/drivers/phy/qualcomm/Kconfig
>> @@ -85,6 +85,16 @@ config PHY_QCOM_USB_HS
>>           Support for the USB high-speed ULPI compliant phy on Qualcomm
>>           chipsets.
>>  
>> +config PHY_QCOM_USB_SNPS_HS_7NM
>> +       tristate "Qualcomm 7nm USB HS PHY module"
>> +       depends on OF && (ARCH_QCOM || COMPILE_TEST)
>> +       select GENERIC_PHY
>> +       help
>> +         Enable support for the USB high-speed SNPS phy on Qualcomm 7nm
>> +         chipsets.  This PHY has differences in the register map compared
>> +         to the 28nm variant.  The PHY is paired with a Synopsys DWC3 USB
>> +         controller on MSM SOCs.
> 
> s/MSM/Qualcomm/?
>

Hi Stephen,

Thanks for the catch.  Will replace with Qualcomm.

>> +
>>  config PHY_QCOM_USB_HSIC
>>         tristate "Qualcomm USB HSIC ULPI PHY module"
>>         depends on USB_ULPI_BUS
>> diff --git a/drivers/phy/qualcomm/phy-qcom-snps-7nm.c b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
>> new file mode 100644
>> index 0000000..00a46cd
>> --- /dev/null
>> +++ b/drivers/phy/qualcomm/phy-qcom-snps-7nm.c
>> @@ -0,0 +1,294 @@
> [...]
>> +
>> +/**
>> + * struct qcom_snps_hsphy - structure holding snps hs phy attributes
> 
> snps hs phy attributes
> 
> structure and holding are redundant.
> 

Understood.

>> + *
>> + * @phy: generic phy
>> + * @base: iomapped memory space for qubs2 phy
>> + *
>> + * @cfg_ahb_clk: AHB2PHY interface clock
>> + * @ref_clk: phy reference clock
>> + * @iface_clk: phy interface clock
>> + * @phy_reset: phy reset control
>> + * @vregs: regulator supplies bulk data
>> +
>> + * @phy_initialized: if PHY has been initialized correctly
> 
> Please drop space between members in the kernel-doc.
> 

Vinod actually pointed this out already, and I fixed this in v6.

>> + *
>> + */
>> +struct qcom_snps_hsphy {
>> +       struct phy *phy;
>> +       void __iomem *base;
>> +
>> +       struct clk *cfg_ahb_clk;
>> +       struct clk *ref_clk;
>> +       struct reset_control *phy_reset;
>> +       struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
>> +
>> +       bool phy_initialized;
>> +};
>> +
>> +static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
>> +                                   u32 mask, u32 val)
>> +{
>> +       u32 reg;
>> +
>> +       reg = readl(base + offset);
>> +       reg &= ~mask;
>> +       reg |= val & mask;
>> +       writel(reg, base + offset);
> 
> Make these relaxed?
> 
>> +
>> +       /* Ensure above write is completed */
>> +       readl(base + offset);
> 
> And this one too?
> 

Agreed, using the _relaxed() variant for these will be fine.  I'll
replace them in the next revision.

>> +}
>> +
>> +static int qcom_snps_hsphy_init(struct phy *phy)
>> +{
>> +       struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
>> +       int ret;
>> +
>> +       dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
>> +
>> +       /* turn on regulator supplies */
> 
> These comments don't tell us anything besides what the code is doing so
> they don't seem useful.
> 

Will remove the comments.

>> +       ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* enable ahb interface clock to program phy */
>> +       ret = clk_prepare_enable(hsphy->cfg_ahb_clk);
>> +       if (ret) {
>> +               dev_err(&phy->dev, "failed to enable cfg ahb clock, %d\n", ret);
>> +               goto poweroff_phy;
>> +       }
>> +
>> +       /* Perform phy reset */
>> +       ret = reset_control_assert(hsphy->phy_reset);
>> +       if (ret) {
>> +               dev_err(&phy->dev, "failed to assert phy_reset, %d\n", ret);
>> +               goto disable_ahb_clk;
>> +       }
>> +
>> +       /* 100 us delay to keep PHY in reset mode */
>> +       usleep_range(100, 150);
>> +
>> +       ret = reset_control_deassert(hsphy->phy_reset);
>> +       if (ret) {
>> +               dev_err(&phy->dev, "failed to de-assert phy_reset, %d\n", ret);
>> +               goto disable_ahb_clk;
>> +       }
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
>> +                                                       UTMI_PHY_CMN_CTRL_OVERRIDE_EN,
>> +                                                       UTMI_PHY_CMN_CTRL_OVERRIDE_EN);
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
>> +                                                       POR, POR);
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
>> +                                                       FSEL_MASK, 0);
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
>> +                                       PLLBTUNE, PLLBTUNE);
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
>> +                                       REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
>> +                                       VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
>> +                                       VBUSVLDEXT0, VBUSVLDEXT0);
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2,
>> +                                       VREGBYPASS, VREGBYPASS);
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
>> +                                       USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
>> +                                       USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
>> +                                       SLEEPM, SLEEPM);
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
>> +                                       POR, 0);
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
>> +                                       USB2_SUSPEND_N_SEL, 0);
>> +
>> +       qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
>> +                                       UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
>> +
>> +       hsphy->phy_initialized = true;
>> +
>> +       return 0;
>> +
>> +disable_ahb_clk:
>> +       clk_disable_unprepare(hsphy->cfg_ahb_clk);
>> +poweroff_phy:
>> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>> +
>> +       return ret;
>> +}
>> +
>> +static int qcom_snps_hsphy_exit(struct phy *phy)
>> +{
>> +       struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
>> +
>> +       reset_control_assert(hsphy->phy_reset);
>> +       clk_disable_unprepare(hsphy->cfg_ahb_clk);
>> +       regulator_bulk_disable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
>> +       hsphy->phy_initialized = false;
>> +
>> +       return 0;
>> +}
>> +
>> +static const struct phy_ops qcom_snps_hsphy_gen_ops = {
>> +       .init           = qcom_snps_hsphy_init,
>> +       .exit           = qcom_snps_hsphy_exit,
>> +       .owner          = THIS_MODULE,
>> +};
>> +
>> +static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
>> +       {
>> +               .compatible     = "qcom,sm8150-usb-hs-phy",
>> +       },
>> +       {
>> +               .compatible     = "qcom,usb-snps-hs-7nm-phy",
>> +       },
>> +       { },
> 
> Can this be on one line?
> 
>           { .compatible     = "qcom,sm8150-usb-hs-phy", },
>           { .compatible     = "qcom,usb-snps-hs-7nm-phy", },
>           { }
> 
> Also drop comma on the last element so nothing can follow without
> causing compile error.
> 

Got it.

>> +};
>> +MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
>> +
>> +static int qcom_snps_hsphy_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct qcom_snps_hsphy *hsphy;
>> +       struct phy_provider *phy_provider;
>> +       struct phy *generic_phy;
>> +       struct resource *res;
>> +       int ret, i;
>> +       int num;
>> +
>> +       hsphy = devm_kzalloc(dev, sizeof(*hsphy), GFP_KERNEL);
>> +       if (!hsphy)
>> +               return -ENOMEM;
>> +
>> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +       hsphy->base = devm_ioremap_resource(dev, res);
> 
> devm_platform_ioremap_resource()?
> 

Sure, will replace
+       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+       hsphy->base = devm_ioremap_resource(dev, res);

to:

+	hsphy->base = devm_platform_ioremap_resource(pdev, 0);

>> +       if (IS_ERR(hsphy->base))
>> +               return PTR_ERR(hsphy->base);
>> +
>> +       hsphy->ref_clk = devm_clk_get(dev, "ref");
>> +       if (IS_ERR(hsphy->ref_clk)) {
>> +               ret = PTR_ERR(hsphy->ref_clk);
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(dev, "failed to get ref clk, %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       hsphy->phy_reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
>> +       if (IS_ERR(hsphy->phy_reset)) {
>> +               dev_err(dev, "failed to get phy core reset\n");
>> +               return PTR_ERR(hsphy->phy_reset);
>> +       }
>> +
>> +       num = ARRAY_SIZE(hsphy->vregs);
>> +       for (i = 0; i < num; i++)
>> +               hsphy->vregs[i].supply = qcom_snps_hsphy_vreg_names[i];
>> +
>> +       ret = devm_regulator_bulk_get(dev, num, hsphy->vregs);
>> +       if (ret) {
>> +               if (ret != -EPROBE_DEFER)
>> +                       dev_err(dev, "failed to get regulator supplies: %d\n",
>> +                               ret);
>> +               return ret;
>> +       }
>> +
>> +       generic_phy = devm_phy_create(dev, NULL, &qcom_snps_hsphy_gen_ops);
>> +       if (IS_ERR(generic_phy)) {
>> +               ret = PTR_ERR(generic_phy);
>> +               dev_err(dev, "failed to create phy, %d\n", ret);
>> +               return ret;
>> +       }
>> +       hsphy->phy = generic_phy;
>> +
>> +       dev_set_drvdata(dev, hsphy);
>> +       phy_set_drvdata(generic_phy, hsphy);
>> +
>> +       phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
>> +       if (!IS_ERR(phy_provider))
>> +               dev_info(dev, "Registered Qcom-SNPS HS phy\n");
> 
> dev_dbg()? Or just remove it?
> 

I'd like to keep some kind of print here.  Will replace with dev_dbg so
it can be enabled when required.  Thanks again!

>> +
>> +       return PTR_ERR_OR_ZERO(phy_provider);
>> +}
>> +
>> +static struct platform_driver qcom_snps_hsphy_driver = {
>> +       .probe          = qcom_snps_hsphy_probe,
>> +       .driver = {
>> +               .name   = "qcom-snps-hs-7nm-phy",
>> +               .of_match_table = qcom_snps_hsphy_of_match_table,
>> +       },
>> +};
>> +
>> +module_platform_driver(qcom_snps_hsphy_driver);
>> +
>> +MODULE_DESCRIPTION("Qualcomm 7nm USB HS PHY driver");

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
