Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162C1369B3D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 22:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhDWUX4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 16:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231721AbhDWUXz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 16:23:55 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F9AC061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 13:23:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id f195-20020a1c1fcc0000b029012eb88126d7so1838246wmf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 13:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MtqVrRfLRcfse1js+rBtVlc8EScx8csAi+g7P4/P7WU=;
        b=H10JzbKkgbxAJgXWaXFPaijz645Br4mFdEEm6w+Dzq36bD20BiaxJZaZE7tc/EL92h
         lUvvuDqnygnKr6Y+priE+1QuVkJZ//FeJjvfl1385zZ3wKa+ap7Oi0xN1P2Tu+M+3njv
         dDsqbkXU4cyJypDdVzY0rbi014aUkmDoYUuV9enn5DGBhXpOPdHFw3MAjQKJqVCcw351
         Z3MjDyCtE3iPK6Q3RUY/kN4jYi76+jJPtbaWCuAlyeXvhF/tkK7V9foM/VIQuSkxpUaR
         0VqzxRs/0EzrL9Ugcj+f23GCopaD+lV41TW3Yi5l6mUTmSlS8rpvndEQoew39m4mfjGh
         kELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MtqVrRfLRcfse1js+rBtVlc8EScx8csAi+g7P4/P7WU=;
        b=BN8x4VVl2RREocKm37mMotk/3wvOtgULIiNuYTQJ43HxZeQDHmz+c6EGp/AyauQmcj
         Bg8Ffr35Te2fOcYGup69lY2DuTREQiked9lbPqPGTTewTehag1V7bh/JbXJr+k7ORtkW
         ZJWetjecl+driYNziPsxBgSTu1WPraFwHdcc2xYKHHmy4HX3DZyqOsofYeB+xJEzzmTi
         o3dm4t077a2KuudbYsI0Fnqp97zoSpXuv6+dwYinCXW+DB919RJu3sGb87YUb05uQVC9
         D0QCb3uMorjfUT9T6cdr60N8DvjqaUYapMBv76SXKbuB/BEqZFUWXa/kR1P9QaR454UU
         w5tA==
X-Gm-Message-State: AOAM532MntqTB3l3U9Uum2lA9B2W+tIPOkV6AaWqohxen954mURFbFGT
        dXA1ZSVJie7qkzdRGSGGtGh2Vg==
X-Google-Smtp-Source: ABdhPJxr/1wzwPy4juudsQ/9EN6yue//PgYCa5seQ8y8VA2KpMLS462YZ+9ylQQ7GLxDz34qzDSlUw==
X-Received: by 2002:a1c:1f8d:: with SMTP id f135mr7535507wmf.30.1619209396517;
        Fri, 23 Apr 2021 13:23:16 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m14sm7677778wmq.44.2021.04.23.13.23.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 13:23:16 -0700 (PDT)
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
To:     Mark Brown <broonie@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
 <20210423163203.GF5507@sirena.org.uk>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
Date:   Fri, 23 Apr 2021 21:24:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423163203.GF5507@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/04/2021 17:32, Mark Brown wrote:
> On Fri, Apr 23, 2021 at 05:06:58PM +0100, Bryan O'Donoghue wrote:
> 
>> +	/* Set OTG current limit to 3000mA up from bootloader set 2000mA */
>> +	regmap_update_bits(regmap, base + OTG_CURRENT_LIMIT_CFG,
>> +			   OTG_CURRENT_LIMIT_MASK, OTG_CURRENT_LIMIT_3000MA);
> 
> This seems like something that needs to be configured per system, the
> system may not be physically capable of delivering an additional amp
> (150% of the current defaults) safely.  It's going to be better to be
> out of spec for high current USB devices than to exceed safe physical
> limits, there's a good solid reason why the regulator API never touches
> the hardware without explicit constraints allowing it to do so.

You're right that its per system.

- smb5_pmi632_params.otg_cl.max_u == 1000000
- smb5_pm8150b_params.otg_cl.max_u == 3000000

https://github.com/BeastRoms-Devices/kernel_realme_RMX1927/blame/master/drivers/power/supply/qcom/qpnp-smb5.c

See page 3 here

https://www.st.com/content/ccc/resource/sales_and_marketing/presentation/product_presentation/group0/5a/b1/8e/6c/2b/0d/46/3c/Apec/files/APEC_2016_USB_Power.pdf/_jcr_content/translations/en.APEC_2016_USB_Power.pdf

and section 1.2.2 here

https://cdn.sparkfun.com/assets/e/b/4/f/7/USB-C_Datasheet.pdf

For type-c 3 Amps at 5 Volts is correct or 1.5 Amps at 5 Volts, either 
way the default coming out of the bootloader at 2 Amps is wrong.

> I also thought there was support in the USB specs for negotiating how
> much power is drawn (not that everything will DTRT there but still)?

Right the Power-delivery stuff up to 100 watts is associated with Vconn 
which is driven on CC1 or CC2 depending on the orientation of the cable.

https://www.allaboutcircuits.com/uploads/articles/Fig1m11292018.png

This patch deals with the higher spec VBUS current that the pm8150b can 
drive, not the power-delivery protocol juice over VCONN.

---
bod
