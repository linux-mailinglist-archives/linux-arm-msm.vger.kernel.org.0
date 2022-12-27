Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25EDA656B25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 14:04:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiL0NEO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 08:04:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbiL0NEN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 08:04:13 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9540C6546
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 05:04:12 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b3so19570237lfv.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 05:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qzvnqvpfZxu7B6kg0qSsGJfAG0LQru6+OuRh723noP4=;
        b=lcM8TBfDGcFAIkWxg1oXJFAveTT1wDlhgbYoRMHLM32fkuXuk5cwJ0MwcnPOzaJQn9
         yPX4grQok8/rcQrLNHb2ItB7WyWFo/9dH8dUAzGsG0U1CjToL+ZNgEXWy2pJoCK6cL9i
         L5EEcP0qeiEkZe83BYl2OyVLNMS1UZfTy52faJ2s3vaJDBgx8WHYlp1/gXb381fpjRrw
         i/p89WkmiWpUtc4mCXxsSma2uWk/t4h70H5zFARfL7jJz+p5v3EWS+zQLpJtDATFr9bG
         x/BNmRKqR5HY/DqQsStLRHNMjo9hpOEvBWJw7qF9sLOGdecv6//4eMEwNR/QNyh7K4iR
         7vHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzvnqvpfZxu7B6kg0qSsGJfAG0LQru6+OuRh723noP4=;
        b=DK4TYPg1TdvA6ylIkWnJjC9a+r9E0XAm0felP6cz2rzpvQm2V5kUJkXPVNcw5ZL5ey
         2Lr3k25f6oV6Tie+EQNbIoor1ekRKHmomFacRgiekgzQa7D1piduC4+AKWt0ZLI8Woer
         e95BOfuP6JE6t8n7lJqzLOBiRM/lIaycA1+KIShy+kQGKaFUYJ7HmVVDZRsvht8sJpP6
         MKGc4ByhuNjBDIzjsE1o5xjya4dmjTTSLS2ovsrdbqDYQ4vukaJPaLNfPBEILA9umKtn
         2McDtr97WzP60CI9awLR0LSyCYN6pl5HjCBQUtrDojorl+kMli+hnRDI9JVhvdY3mVJB
         diOw==
X-Gm-Message-State: AFqh2krxOakElRyuRGxeE0Ichwhvy9L3VMrjgMnZBrC8haScfM7ginvr
        X84UJrRuNDDXMLERJvGxhJgLkw==
X-Google-Smtp-Source: AMrXdXvY7JMniZ9MhKJxM4RFSmwoLcWJ7DaLanG9fsVliw3zc2taRQ0iQ2th+W2Ktkt0tTyWoOfSdg==
X-Received: by 2002:ac2:5ec9:0:b0:4b5:b6e8:bb53 with SMTP id d9-20020ac25ec9000000b004b5b6e8bb53mr5742473lfq.24.1672146250976;
        Tue, 27 Dec 2022 05:04:10 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id be33-20020a056512252100b004b56de48f05sm2221142lfb.27.2022.12.27.05.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 05:04:10 -0800 (PST)
Message-ID: <cf82c812-eafa-aa55-3958-44080da1b1d5@linaro.org>
Date:   Tue, 27 Dec 2022 14:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 12/12] ARM: dts: qcom: apq8084: add clocks and
 clock-names to gcc device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-13-dmitry.baryshkov@linaro.org>
 <a6622a6c-7378-4f3a-a34b-1227c51a3326@linaro.org>
 <CAA8EJpp0PJgrCv1oaeaDfhVq36X-XgXDTHvXjO97rQfaKyiPng@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpp0PJgrCv1oaeaDfhVq36X-XgXDTHvXjO97rQfaKyiPng@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.12.2022 13:31, Dmitry Baryshkov wrote:
> On Tue, 27 Dec 2022 at 14:08, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 27.12.2022 02:32, Dmitry Baryshkov wrote:
>>> Add clocks and clock-names nodes to the gcc device to bind clocks using
>>> the DT links.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>
>> Though - again at the end of reviewing - I noticed you could have
>> gone .index instead, like with qcs404.
> 
> QCS404 driver was in a good shape, so I doubt there will be any
> significant changes for the bindings. On the other hand the apq8084 is
> in such a flux state, that I can easily imagine getting additional
> clock parents and/or removing existing parents. This can better be
> coped with by using the clock-names instead of indices. For example,
> see my comment regarding the pcie pipe clocks. I fear that apq8084 was
> not seriously touched for the last 5 years. And even back in those
> days not everything was plumbed together. None of MMCC (and thus
> display, camera, venus), SATA, PCIe are present in the
> qcom-apq8084.dtsi.
Sure, sounds reasonable!

Konrad
> 
>>
>> Konrad
>>
>>>  arch/arm/boot/dts/qcom-apq8084.dtsi | 18 ++++++++++++++++++
>>>  1 file changed, 18 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
>>> index fe30abfff90a..815b6c53f7b8 100644
>>> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
>>> @@ -388,6 +388,24 @@ gcc: clock-controller@fc400000 {
>>>                       #reset-cells = <1>;
>>>                       #power-domain-cells = <1>;
>>>                       reg = <0xfc400000 0x4000>;
>>> +                     clocks = <&xo_board>,
>>> +                              <&sleep_clk>,
>>> +                              <0>, /* ufs */
>>> +                              <0>,
>>> +                              <0>,
>>> +                              <0>,
>>> +                              <0>, /* sata */
>>> +                              <0>,
>>> +                              <0>; /* pcie */
>>> +                     clock-names = "xo",
>>> +                                   "sleep_clk",
>>> +                                   "ufs_rx_symbol_0_clk_src",
>>> +                                   "ufs_rx_symbol_1_clk_src",
>>> +                                   "ufs_tx_symbol_0_clk_src",
>>> +                                   "ufs_tx_symbol_1_clk_src",
>>> +                                   "sata_asic0_clk",
>>> +                                   "sata_rx_clk",
>>> +                                   "pcie_pipe";
>>>               };
>>>
>>>               tcsr_mutex: hwlock@fd484000 {
> 
> 
> 
