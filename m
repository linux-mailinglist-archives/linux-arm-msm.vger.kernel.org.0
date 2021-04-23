Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F85369B60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 22:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243798AbhDWUhy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 16:37:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbhDWUhx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 16:37:53 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E79A8C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 13:37:14 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id z6so8870932wmg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 13:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rykdiO73dQpnygFvY5SQcJIceu5JAnrN/ZH0o9kX9+U=;
        b=lniPKMm3QZdVDR4BMd60nPL65Y6zK7e5BEdrWPhEv9ePiMLA2aBGWLS3U03LGSLJ10
         lX1H9f/VL3qgRbzU8X6A+8/uNk0VuMjZBlRXuvC6gjkNv7KHzmyKfLEkO3+zUzn6TNac
         8iiLrj4+gEpVOcBzwTyi7v4bECN+uKkZ+JVkq4y7hUa0je2GJD/4Dk8sTj2ytjWZVMgd
         DjRbXsFADTPf7kZXdUWcrT49Yco8w9uvIfz+5lzAIZkSg9nl4GjQ25WYAmAcfTlc8DuF
         Ymao3G/UwEAXMMGhI1Yq3vQUSydSuLEm9SB/9/7ZNCizluFB6MhMOu3WWJ+Vo5adxmSQ
         Ix7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rykdiO73dQpnygFvY5SQcJIceu5JAnrN/ZH0o9kX9+U=;
        b=Hz3ILH2buDnk5sdMazFBuKrNzQ3qSLxab8pGH7kFQ8Z9kQfNgDPa0OboVlV3IVlCbK
         DQWWwbOvIjyhV22gEYgB0IRcokd2nKUXIOOw61NR16nYeWGL2Gx7YTOstBtDsQlirrgS
         WfU5G3SzFi4GIauCvTDLEKGiFqwp6SRLpTPCZbp0nIxqqAq08e3MoJrnjwIJdDNRiuKZ
         ZcAJU585Jf7oE1F6mv+rwVfcxdgcVZBv5e58xVce6VIcFZ8MShUbJguxV0BOyywuVaXS
         eYzIavxnzb651CQJifLmCxT/tNgh17g+86XSOM5yks5/P4d30EKmvWUwGnvC9gbfmKFS
         I4Lg==
X-Gm-Message-State: AOAM533pSOn0Zt7KgCLVOrNRbd39Mo+V2r0NW2bm1rYM3GaWZTl35Scn
        tV+fNXRS7qQcKFBE4CRkXJcJvg==
X-Google-Smtp-Source: ABdhPJwHd12NLE8Z4gRXOtVO7ZO4AFohE3pXrcPaREq8tqBZfrgS4VM2BVbWgL1OiMqQQuTxALjCAA==
X-Received: by 2002:a1c:2b44:: with SMTP id r65mr7262994wmr.57.1619210233703;
        Fri, 23 Apr 2021 13:37:13 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l20sm9977281wmg.33.2021.04.23.13.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Apr 2021 13:37:13 -0700 (PDT)
Subject: Re: [PATCH] regulator: Fix current limit for QCOM PMIC VBUS
To:     Mark Brown <broonie@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        wcheng@codeaurora.org, linux-arm-msm@vger.kernel.org,
        dmitry.baryshkov@linaro.org
References: <20210423160658.1542090-1-bryan.odonoghue@linaro.org>
 <20210423163203.GF5507@sirena.org.uk>
 <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Message-ID: <894579a9-8ce0-affb-b6cb-4ce4b3d797ec@linaro.org>
Date:   Fri, 23 Apr 2021 21:38:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a2152494-4e8f-27ef-07e7-e575ce3ee653@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/04/2021 21:24, Bryan O'Donoghue wrote:
> On 23/04/2021 17:32, Mark Brown wrote:
>> On Fri, Apr 23, 2021 at 05:06:58PM +0100, Bryan O'Donoghue wrote:
>>
>>> +    /* Set OTG current limit to 3000mA up from bootloader set 2000mA */
>>> +    regmap_update_bits(regmap, base + OTG_CURRENT_LIMIT_CFG,
>>> +               OTG_CURRENT_LIMIT_MASK, OTG_CURRENT_LIMIT_3000MA);
>>
>> This seems like something that needs to be configured per system, the
>> system may not be physically capable of delivering an additional amp
>> (150% of the current defaults) safely.  It's going to be better to be
>> out of spec for high current USB devices than to exceed safe physical
>> limits, there's a good solid reason why the regulator API never touches
>> the hardware without explicit constraints allowing it to do so.
> 
> You're right that its per system.
> 
> - smb5_pmi632_params.otg_cl.max_u == 1000000
> - smb5_pm8150b_params.otg_cl.max_u == 3000000
> 
> https://github.com/BeastRoms-Devices/kernel_realme_RMX1927/blame/master/drivers/power/supply/qcom/qpnp-smb5.c 
> 
> 
> See page 3 here
> 
> https://www.st.com/content/ccc/resource/sales_and_marketing/presentation/product_presentation/group0/5a/b1/8e/6c/2b/0d/46/3c/Apec/files/APEC_2016_USB_Power.pdf/_jcr_content/translations/en.APEC_2016_USB_Power.pdf 
> 
> 
> and section 1.2.2 here
> 
> https://cdn.sparkfun.com/assets/e/b/4/f/7/USB-C_Datasheet.pdf
> 
> For type-c 3 Amps at 5 Volts is correct or 1.5 Amps at 5 Volts, either 
> way the default coming out of the bootloader at 2 Amps is wrong.
> 
>> I also thought there was support in the USB specs for negotiating how
>> much power is drawn (not that everything will DTRT there but still)?
> 
> Right the Power-delivery stuff up to 100 watts is associated with Vconn 
> which is driven on CC1 or CC2 depending on the orientation of the cable.
> 
> https://www.allaboutcircuits.com/uploads/articles/Fig1m11292018.png
> 
> This patch deals with the higher spec VBUS current that the pm8150b can 
> drive, not the power-delivery protocol juice over VCONN.
> 
> ---
> bod

Oh and I should mention the pm8150b is a type-c controller and battery 
charger block, so you wouldn't connect it to a USB 3.x type-a port.

The Qualcomm reference schematics drive VBUS for those ports from a 
current limiter - a SY6288F1ABC - which steps down 5v/4amp rail to 
5v/1.2amp.

So the pm8150b is exclusively for the type-c not type-a ports.

---
bod
