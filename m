Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59456CA1BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 12:53:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbjC0KxR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 06:53:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjC0KxQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 06:53:16 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7224215
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:53:09 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id by8so8456308ljb.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679914387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rVlxo50ZRMJpj54LYT8yYL0LIjvmZfFknzyZvuDRxc=;
        b=gQMxgFQhQ+XgCsTEZPe6WiIcpvJ6VrErfQjFx2qxsT0gPvNzngjf8A0ufcP/vawEPF
         xax9ZGva0ta5qZOV60Q0Z2f92VIfFUaD/WktSLX5DKN+yLVwewHwC5wPDB7+G3msV9H4
         V3wNCM9WcTkqKrE+Qj0j4HEZLp0cuJAW3ZOmOwdqf83NAlkQIriMy0rAvVt3RPk+5avv
         03mxIooubdoONc+X/0XQt1CfX94DHYktNSIX3M2Cy5qWwgyFIg9DqCGwgU5+dyKnJC/c
         tkVS/WyUfis2HjQKtJgG7ddQYnsqHtU2M1hx/9/ykvaDX183UyMJmqDTXcQHLnowWFWK
         25Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914387;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rVlxo50ZRMJpj54LYT8yYL0LIjvmZfFknzyZvuDRxc=;
        b=4fh48f6nVSe5aR7xjKkUpnUm4nFun8MsGdZR4N855XQE/oDYQRfhlu29syJdLX3heo
         IT3YGXEXagWYI41oDniuOklWfcDFd+F8M0eRIQBGZac7RJ66OhPKPh0JtA7rYHrQ9Rmx
         ecYGPmXvw6Sw+/jLgkJU1E3l4qi7Q9rnlqRa7E7sjfahnx/eMTOrf5hKzvm+xuCHOFrK
         KXXHb3HfOqDgOka1HA7ABTVla5sJ4cNB+WSzV7bUjQLNEOHDt/nbzE8X06nuPLeDKawU
         m/2tm7DpTv5BcGjOqWzLDhCYXr5J2vgiZimbC1lP+pgW6Gs3kfeQ2U9r1aP/T6W4bzFk
         YZWg==
X-Gm-Message-State: AAQBX9fnpJShJmqx1pI45jfm8M8VeAQ6vvfJZ0OuRSVjBcIhQSRF3gXt
        /eUBrLe6G1IusJmLJVjgrZtnwA==
X-Google-Smtp-Source: AKy350amcE3SNY/yZynqjrIkiRBpnixSxtejReSkObtAQp2PGBYuvkg9I0ohQG5IIIhrjEkLchD70w==
X-Received: by 2002:a05:651c:1052:b0:29e:e7b0:efb4 with SMTP id x18-20020a05651c105200b0029ee7b0efb4mr3369009ljm.11.1679914387624;
        Mon, 27 Mar 2023 03:53:07 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
        by smtp.gmail.com with ESMTPSA id o10-20020a2e730a000000b00294692d8645sm4635491ljc.17.2023.03.27.03.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:53:07 -0700 (PDT)
Message-ID: <6a545494-832b-d1d9-ad5a-9ed0a724703b@linaro.org>
Date:   Mon, 27 Mar 2023 12:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into
 USB+DP PHY
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        Johan Hovold <johan+linaro@kernel.org>,
        devicetree@vger.kernel.org
References: <20230324215550.1966809-1-dmitry.baryshkov@linaro.org>
 <20230324215550.1966809-4-dmitry.baryshkov@linaro.org>
 <70957e67-e570-3800-e679-d7c291295999@linaro.org>
 <cfa6af3e-c7bc-894a-119c-5c6c5ea82ec0@linaro.org>
 <85d75550-66f4-2680-c6fe-9c575e916b40@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <85d75550-66f4-2680-c6fe-9c575e916b40@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 27.03.2023 12:14, Dmitry Baryshkov wrote:
> On 27/03/2023 11:05, Neil Armstrong wrote:
>> On 27/03/2023 09:59, Neil Armstrong wrote:
>>> On 24/03/2023 22:55, Dmitry Baryshkov wrote:
>>>> The first USB PHY on the sm8150 platform is really the USB+DP combo
>>>> PHY. Add the DP part of the PHY.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
>>>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>>> index 9491be4a6bf0..a618218f7b68 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>>> @@ -3392,20 +3392,19 @@ usb_2_hsphy: phy@88e3000 {
>>>>           };
>>>>           usb_1_qmpphy: phy@88e9000 {
>>>> -            compatible = "qcom,sm8150-qmp-usb3-phy";
>>>> +            compatible = "qcom,sm8150-qmp-usb3-dp-phy";
>>>>               reg = <0 0x088e9000 0 0x18c>,
>>>> -                  <0 0x088e8000 0 0x10>;
>>>> +                  <0 0x088e8000 0 0x38>,
>>>> +                  <0 0x088ea000 0 0x40>;
>>>>               status = "disabled";
>>>>               #address-cells = <2>;
>>>>               #size-cells = <2>;
>>>>               ranges;
>>>> -
>>>>               clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>>>                    <&rpmhcc RPMH_CXO_CLK>,
>>>>                    <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>>>>                    <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>>>>               clock-names = "aux", "ref_clk_src", "ref", "com_aux";
>>>> -
>>>>               resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>>>                    <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>>>               reset-names = "phy", "common";
>>>> @@ -3423,6 +3422,16 @@ usb_1_ssphy: phy@88e9200 {
>>>>                   clock-names = "pipe0";
>>>>                   clock-output-names = "usb3_phy_pipe_clk_src";
>>>>               };
>>>> +
>>>> +            usb_1_dpphy: phy@88ea200 {
>>>> +                reg = <0 0x088ea200 0 0x200>,
>>>> +                      <0 0x088ea400 0 0x200>,
>>>> +                      <0 0x088eaa00 0 0x200>,
>>>> +                      <0 0x088ea600 0 0x200>,
>>>> +                      <0 0x088ea800 0 0x200>;
>>>> +                #clock-cells = <1>;
>>>> +                #phy-cells = <0>;
>>>> +            };
>>>
>>> Is there a reason why the new flat bindings from qcom,sc8280xp-qmp-usb43dp-phy.yaml are not used instead ?
>>>
>>
>> Oh ok I see "phy: qcom-qmp-combo: convert to newer style of bindings" is the followup of this serie,
>> please specify it because it wasn't obvious...
> 
> I thought that a note in the cover letter was good enough, but yeah, maybe it should be more explicit. Do you think it warrants v2? I can send one.
IMO it's unnecessary so long as both get in.

Konrad
> 
