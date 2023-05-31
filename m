Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CA59717FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 14:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjEaMQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 08:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234726AbjEaMQs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 08:16:48 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E0210E
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 05:16:46 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f3bb61f860so6803064e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 05:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685535404; x=1688127404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hT8OWO/UkE0kJ6wTvhFLdugI0TrRyYIKyUCIvnylcuU=;
        b=FKhQ6M9DAU6XKeD3PQo9JSksHN0bjlsBy/f+P3kjxo2TXQMCaJabZjg+J24b+SLPO7
         IZMtOjgb+qwiMnLq+sP3pEph4cylsweJ1hfzp9eYzhbov2MIybYEFWthvdO5sUhJy7fe
         p6QhnTUMOm5gw0BiqYJfm6Y51MdD5+I3/a2fkNQxGcKnv+mv8pTJYsNFMOEQWy6AXDbN
         i3TncdeE2QZQadJLmwse+/WchATfZHYEMBR2192bczqZ6ZHr3WWNsR+ExuTVjpiboP+b
         smliWY7Z3IFs1C22Ko2fGLJGLYX9ULaTmmFihgYDXQ7D2E/q/5Hp4N9MEhygX8oqWSrX
         o+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685535404; x=1688127404;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hT8OWO/UkE0kJ6wTvhFLdugI0TrRyYIKyUCIvnylcuU=;
        b=gO4DMGdiDUWv7UU1OFX74gU1QaxPFx7d5RidJ9vH2rfl3UN/Wv5STlpbn9zbEtKiMO
         UlfDSrpeIP2HmCm+fGWAzPufAz8PUdIeb9kYvtl5hfAJftdhgSj4WtIbR0DrjchQnv/j
         6vGMMG5JTDtsw6txx4iGxkUDzkybL/3AyD8rBDCY7il0VIu4p4BAi8wM0OktRt9K1ECd
         aYxS9BY/x3VjBYAP0S20B2Nk0FBMrtzNJMN5sUa1TPmuDfG5mVLpfpOBU5/9tGliTnsx
         wrjbK9ZO3NkNhNsUO2rwVfpgWvleYTrYnUm6A+bvmle9k6AhFHeNkozwLoay7RwQyH78
         XRxw==
X-Gm-Message-State: AC+VfDwvN0hEklhkg64LeCjbmamHB2BE3F7lbDOV761KpH7KrjM2tsSi
        COxMUjbGNbdic6QdXUiT/46JKQ==
X-Google-Smtp-Source: ACHHUZ7cGiELVkb8DvCdytKB2IjLOgZ/B+AsDkxpI50GWOxdoI5c7ghiS9/UMkPHu+sEIgIio40VTA==
X-Received: by 2002:ac2:4c02:0:b0:4f3:a9d4:45f0 with SMTP id t2-20020ac24c02000000b004f3a9d445f0mr3046529lfq.17.1685535404440;
        Wed, 31 May 2023 05:16:44 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id g7-20020a19ee07000000b004f517c21ef4sm336041lfb.44.2023.05.31.05.16.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 05:16:44 -0700 (PDT)
Message-ID: <10388324-45c7-b8ae-fb48-64becff76e66@linaro.org>
Date:   Wed, 31 May 2023 14:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 2/5] phy: qcom-qmp-combo: add support for the USB+DP
 PHY on SM8150 platform
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20230531023415.1209301-1-dmitry.baryshkov@linaro.org>
 <20230531023415.1209301-3-dmitry.baryshkov@linaro.org>
 <47e84a3c-b457-7aff-ad6a-809178c08b62@linaro.org>
 <CAA8EJprDPzTQU1j6n17gYAeiXw1t6M_d4CciTtD8mHNksYGHow@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprDPzTQU1j6n17gYAeiXw1t6M_d4CciTtD8mHNksYGHow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.05.2023 14:13, Dmitry Baryshkov wrote:
> On Wed, 31 May 2023 at 14:35, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>> On 31.05.2023 04:34, Dmitry Baryshkov wrote:
>>> SM8150 and SC8180X are close relatives. Reuse sc8180x data to support
>>> USB+DP combo PHY on SM8150 platform.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> I'm not sure this is right. Downstream reuses SA8195 USB seq.
> 
> The upstream driver uses sm8150 data for sc8180x. So even if sc8180x
> data is not correct for sc8180x, it is definitely the one that we
> should use for sm8150:
Right sorry, this patch adds support for 81*5*0. I wanted to point out
that 8180 has a different set of init commands and one of them is probably
incorrect.

Konrad
> 
> static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
>         .serdes_tbl             = sm8150_usb3_serdes_tbl,
>         .serdes_tbl_num         = ARRAY_SIZE(sm8150_usb3_serdes_tbl),
>         .tx_tbl                 = sm8150_usb3_tx_tbl,
>         .tx_tbl_num             = ARRAY_SIZE(sm8150_usb3_tx_tbl),
>         .rx_tbl                 = sm8150_usb3_rx_tbl,
>         .rx_tbl_num             = ARRAY_SIZE(sm8150_usb3_rx_tbl),
>         .pcs_tbl                = sm8150_usb3_pcs_tbl,
>         .pcs_tbl_num            = ARRAY_SIZE(sm8150_usb3_pcs_tbl),
>         .pcs_usb_tbl            = sm8150_usb3_pcs_usb_tbl,
>         .pcs_usb_tbl_num        = ARRAY_SIZE(sm8150_usb3_pcs_usb_tbl),
> 
>         .dp_serdes_tbl          = qmp_v4_dp_serdes_tbl,
>         .dp_serdes_tbl_num      = ARRAY_SIZE(qmp_v4_dp_serdes_tbl),
>         .dp_tx_tbl              = qmp_v4_dp_tx_tbl,
>         .dp_tx_tbl_num          = ARRAY_SIZE(qmp_v4_dp_tx_tbl),
> 
> 
> 
>>
>> Konrad
>>>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> index 33cc99d9c77d..2bff1bbb8610 100644
>>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
>>> @@ -3614,6 +3614,10 @@ static const struct of_device_id qmp_combo_of_match_table[] = {
>>>               .compatible = "qcom,sm6350-qmp-usb3-dp-phy",
>>>               .data = &sm6350_usb3dpphy_cfg,
>>>       },
>>> +     {
>>> +             .compatible = "qcom,sm8150-qmp-usb3-dp-phy",
>>> +             .data = &sc8180x_usb3dpphy_cfg,
>>> +     },
>>>       {
>>>               .compatible = "qcom,sm8250-qmp-usb3-dp-phy",
>>>               .data = &sm8250_usb3dpphy_cfg,
> 
> 
> 
