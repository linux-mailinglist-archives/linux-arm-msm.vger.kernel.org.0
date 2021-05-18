Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 463573878C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 14:31:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349123AbhERMck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 08:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349118AbhERMcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 08:32:39 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7819C061756
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 05:31:18 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id f29so9083193qka.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 05:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8KpdGODC+6W+h70Bn52fBpiD5+xoT0ToV/SJ11FYfsQ=;
        b=KlHz40SEuolT6VvDspFQTkqixDDoA6ln3CVymJ54y1JkIuYxbETd6WNfiDHYzWuovm
         C/hmIb3Cr4v3cmgh6yAC+9KtatDrBb+Qz9f6Hced0no8wfSOPzjTMCIeJW8hraDNxmMM
         4qsuZ46iaqu5R0g6DkXXHYRFDHBXCB6y9FUZ6RrZfJ+kygG1GuZZYoVRHyZ06iC9XUlo
         Fi6e3rLstz4U9Pj1Os2m4M0YCmfZH66EiIQ0hElTamaKlHvOfIgUPjT6zZpmBMo4hZVJ
         HmjfeqvDqdrKqT1Q4DpmIc7reUpix1CYEDC2Xy37xcClOAax8hIHcOSP00WtFQbFLymn
         IqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8KpdGODC+6W+h70Bn52fBpiD5+xoT0ToV/SJ11FYfsQ=;
        b=hsqJhuEbmlm6o8V/KjbrjTT1IkZfclWMG6cEYc9H52BQEB4X+7JHT6ZTLv0r02U+fn
         exrpfTKzDT9VkWRw/7k7Cm1+2UU0EcwF/P/UNRfzQBrhB8pFi6+vLiwxyKffUNn6yFNB
         r3AS1LhjSqzo/Lqq2IpZK7iEkkrrOIazQG+Xe/v516ju3QI01VREK4H9bXUxpBJ/XJr3
         MNZveksAyZa5gT7cJ0Ej2ScErUaANLHakZa4rxhB2iUhEVDlJi9R2FENg6v8yxGSuts1
         VAWp+w1pXkLvj0A4hQOdHYZX15M328NHv9KHxa3/LFEKdvw1wQZ9a+4TXBloL5vpfcrM
         KXwg==
X-Gm-Message-State: AOAM531quK1kRyU81J63R53xOxjYyGUj4cJeH1G5huu+D1Lx8Zlt1F65
        pmJCs864ecUzLl5X1SUTYcMjdhQAPynw3ySy
X-Google-Smtp-Source: ABdhPJynYD8djQWbOagq875GAONhhPs1vKmOsGsm77iRv9lnz9Jiq8PKbhK5O+m/w6WyIDWZvW2Pqw==
X-Received: by 2002:a05:620a:14b5:: with SMTP id x21mr5090074qkj.336.1621341077879;
        Tue, 18 May 2021 05:31:17 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id p17sm11684712qtq.87.2021.05.18.05.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 05:31:17 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: qcom: add support for SM8350 DISPCC
To:     Robert Foss <robert.foss@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210513195617.15068-1-jonathan@marek.ca>
 <CAG3jFyvn8Jn2hCgWYunB_=_jKYJ9GpDZyP+Pqjdxx_0n32rJtw@mail.gmail.com>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <1ab8d444-97b1-d14d-0088-80a027e1ec1a@marek.ca>
Date:   Tue, 18 May 2021 08:30:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAG3jFyvn8Jn2hCgWYunB_=_jKYJ9GpDZyP+Pqjdxx_0n32rJtw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 5/18/21 7:53 AM, Robert Foss wrote:
> Hey Jonathan,
> 
> Thanks for submitting this.
> 
> On Thu, 13 May 2021 at 21:56, Jonathan Marek <jonathan@marek.ca> wrote:
>>
>> Add support to the SM8350 display clock controller by extending the SM8250
>> display clock controller, which is almost identical but has some minor
>> differences.
>>
>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
>> ---
>>   drivers/clk/qcom/Kconfig         |  4 +-
>>   drivers/clk/qcom/dispcc-sm8250.c | 84 +++++++++++++++++++++++++++-----
>>   2 files changed, 75 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index 45646b867cdb..cc60e6ee1654 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -484,11 +484,11 @@ config SDX_GCC_55
>>            SPI, I2C, USB, SD/UFS, PCIe etc.
>>
>>   config SM_DISPCC_8250
>> -       tristate "SM8150 and SM8250 Display Clock Controller"
>> +       tristate "SM8150/SM8250/SM8350 Display Clock Controller"
>>          depends on SM_GCC_8150 || SM_GCC_8250
>>          help
>>            Support for the display clock controller on Qualcomm Technologies, Inc
>> -         SM8150 and SM8250 devices.
>> +         SM8150/SM8250/SM8350 devices.
>>            Say Y if you want to support display devices and functionality such as
>>            splash screen.
>>
>> diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
>> index de09cd5c209f..1fcf8085a109 100644
>> --- a/drivers/clk/qcom/dispcc-sm8250.c
>> +++ b/drivers/clk/qcom/dispcc-sm8250.c
>> @@ -36,6 +36,10 @@ static struct pll_vco vco_table[] = {
>>          { 249600000, 2000000000, 0 },
>>   };
>>
>> +static struct pll_vco lucid_5lpe_vco[] = {
>> +       { 249600000, 1750000000, 0 },
>> +};
>> +
>>   static struct alpha_pll_config disp_cc_pll0_config = {
>>          .l = 0x47,
>>          .alpha = 0xE000,
>> @@ -1039,6 +1043,7 @@ static const struct qcom_cc_desc disp_cc_sm8250_desc = {
>>   static const struct of_device_id disp_cc_sm8250_match_table[] = {
>>          { .compatible = "qcom,sm8150-dispcc" },
>>          { .compatible = "qcom,sm8250-dispcc" },
>> +       { .compatible = "qcom,sm8350-dispcc" },
>>          { }
>>   };
>>   MODULE_DEVICE_TABLE(of, disp_cc_sm8250_match_table);
>> @@ -1051,19 +1056,76 @@ static int disp_cc_sm8250_probe(struct platform_device *pdev)
>>          if (IS_ERR(regmap))
>>                  return PTR_ERR(regmap);
>>
>> -       /* note: trion == lucid, except for the prepare() op */
>> -       BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
>> -       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
> 
> I'm having a quick look at this patch, and of_device_is_compatible had
> 2 cases previously, sm8150 & sm8250. Now three cases (sm8150, sm8250 &
> sm8350) are possible, but sm8150 & sm8250 have been lumped together.
> Is this correct?
> 

This patch doesn't change the behavior for sm8150/sm8250, which are 
nearly identical. The check for qcom,sm8150-dispcc is just moved below.

(looking over it, I should've left it first and kept the diff smaller. I 
had "lumped" sm8150/sm8250 because initially I had separate 
"pll_configure" calls for sm8350 vs sm8150/sm8250).

>> -               disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
>> -               disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
>> -               disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
>> -               disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
>> -               disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
>> -               disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
>> -               disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
>> -               disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
>> +       /* SM8350 has _SRC clocks offset by 4, and some other differences */
>> +       if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8350-dispcc")) {
>> +               static struct clk_rcg2* const rcgs[] = {
>> +                       &disp_cc_mdss_byte0_clk_src,
>> +                       &disp_cc_mdss_byte1_clk_src,
>> +                       &disp_cc_mdss_dp_aux1_clk_src,
>> +                       &disp_cc_mdss_dp_aux_clk_src,
>> +                       &disp_cc_mdss_dp_link1_clk_src,
>> +                       &disp_cc_mdss_dp_link_clk_src,
>> +                       &disp_cc_mdss_dp_pixel1_clk_src,
>> +                       &disp_cc_mdss_dp_pixel2_clk_src,
>> +                       &disp_cc_mdss_dp_pixel_clk_src,
>> +                       &disp_cc_mdss_esc0_clk_src,
>> +                       &disp_cc_mdss_mdp_clk_src,
>> +                       &disp_cc_mdss_pclk0_clk_src,
>> +                       &disp_cc_mdss_pclk1_clk_src,
>> +                       &disp_cc_mdss_rot_clk_src,
>> +                       &disp_cc_mdss_vsync_clk_src,
>> +               };
>> +               static struct clk_regmap_div* const divs[] = {
>> +                       &disp_cc_mdss_byte0_div_clk_src,
>> +                       &disp_cc_mdss_byte1_div_clk_src,
>> +                       &disp_cc_mdss_dp_link1_div_clk_src,
>> +                       &disp_cc_mdss_dp_link_div_clk_src,
>> +               };
>> +               unsigned i;
>> +               static bool offset_applied = false;
>> +
>> +               /* only apply the offsets once (in case of deferred probe) */
>> +               if (!offset_applied) {
>> +                       for (i = 0; i < ARRAY_SIZE(rcgs); i++)
>> +                               rcgs[i]->cmd_rcgr -= 4;
>> +
>> +                       for (i = 0; i < ARRAY_SIZE(divs); i++) {
>> +                               divs[i]->reg -= 4;
>> +                               divs[i]->width = 4;
>> +                       }
>> +
>> +                       disp_cc_mdss_ahb_clk.halt_reg -= 4;
>> +                       disp_cc_mdss_ahb_clk.clkr.enable_reg -= 4;
>> +
>> +                       offset_applied = true;
>> +               }
>> +
>> +               disp_cc_mdss_ahb_clk_src.cmd_rcgr = 0x22a0;
>> +
>> +               disp_cc_pll0_config.config_ctl_hi1_val = 0x2A9A699C;
>> +               disp_cc_pll0_config.test_ctl_hi1_val = 0x01800000;
>> +               disp_cc_pll0_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
>> +               disp_cc_pll0.vco_table = lucid_5lpe_vco;
>> +               disp_cc_pll1_config.config_ctl_hi1_val = 0x2A9A699C;
>> +               disp_cc_pll1_config.test_ctl_hi1_val = 0x01800000;
>> +               disp_cc_pll1_init.ops = &clk_alpha_pll_lucid_5lpe_ops;
>> +               disp_cc_pll1.vco_table = lucid_5lpe_vco;
>> +       } else {
>> +               /* note: trion == lucid, except for the prepare() op */
>> +               BUILD_BUG_ON(CLK_ALPHA_PLL_TYPE_TRION != CLK_ALPHA_PLL_TYPE_LUCID);
>> +               if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8150-dispcc")) {
>> +                       disp_cc_pll0_config.config_ctl_hi_val = 0x00002267;
>> +                       disp_cc_pll0_config.config_ctl_hi1_val = 0x00000024;
>> +                       disp_cc_pll0_config.user_ctl_hi1_val = 0x000000D0;
>> +                       disp_cc_pll0_init.ops = &clk_alpha_pll_trion_ops;
>> +                       disp_cc_pll1_config.config_ctl_hi_val = 0x00002267;
>> +                       disp_cc_pll1_config.config_ctl_hi1_val = 0x00000024;
>> +                       disp_cc_pll1_config.user_ctl_hi1_val = 0x000000D0;
>> +                       disp_cc_pll1_init.ops = &clk_alpha_pll_trion_ops;
>> +               }
>>          }
>>
>> +       /* note for SM8350: downstream lucid_5lpe configure differs slightly */
>>          clk_lucid_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>>          clk_lucid_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll1_config);
>>
>> --
>> 2.26.1
>>
