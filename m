Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA78D6C9D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 10:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232513AbjC0IF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 04:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232554AbjC0IFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 04:05:25 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8884D49C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:05:23 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l15-20020a05600c4f0f00b003ef6d684102so1384342wmq.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 01:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679904322;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5TVkUFVOMpyQ5j/+7ELg9UktQUNIcDvw4sJrDeUhC3w=;
        b=faVB9Z0jEUZXN/ji25taT6vbqNYAzzMnD2/4Zeg7wK+aLGLTLKZoDu42faY42FYMTV
         4fEH04Dk6jw3GBuzoL+tGI41EKbMpuY6WCGi2jvo6iDznx4uXxEgzUZm54GEDywILCHU
         +w7LGn3BO2OrZ+QHYQs4G/0l54q58Zz7cjJmij0VqZcXC/pSbaau7HkUxj0LNxbNGuef
         5ChV/9/CTDayfbxK/Ki/NapuYKElICjZZyykfGHQ8/9O1W31UdMyYNChBVJ+kVuhpCIN
         59I2SpORKk3s/W7j4fBF0x8WAIUITvjsqeF3+M6apknp8HP1VTSuPsDLEGwuNpCXZPeX
         Fsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679904322;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :from:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5TVkUFVOMpyQ5j/+7ELg9UktQUNIcDvw4sJrDeUhC3w=;
        b=j7YyhAcqkBZPiYXOHX0qUwVNdIRsise13+9enWRbnD9t6nmfUxuYZRq6ZeJL7fT4vX
         N4TsHQUaL68dArC9SdTFoIzC14mmXPrO+dFZckTrNqqR4VUGLYlQO93FgH1qV6A9KGpG
         KUFhpvm1b9KLvvxVUtSKbmFiy8t6kf3/qythlk2z7rVBipqcdoAY8+u5+vHB2G4AS6Zv
         ddimLmrFqhhkEo0hvYxhR6wOqO7LAEqhcWJwpJmvHRu5GhRratCWoHbpLgTU3OwAlUgf
         /JFcchdLUTCvV29/ka0wnp090mp3j14eUOb5sw/zxZgFK1kDlIONS6HYwW+DESOB1WGP
         VJXQ==
X-Gm-Message-State: AO0yUKXLPoMF22sLKCaVushliIu5IRtBHK2iPTinvAGfSViNzHclpn0Z
        w00gQhuiPCeOsiQElggBof451s5yzV5JBBuNdXePoA==
X-Google-Smtp-Source: AK7set9R8avpeP4STULTSALcIChWKbBZXu9i79juFRFIZlo4Cvo5wEwJZOmrrnwD8vHfmz+vZzskAQ==
X-Received: by 2002:a05:600c:2110:b0:3ed:2b27:5bcc with SMTP id u16-20020a05600c211000b003ed2b275bccmr8493884wml.38.1679904322138;
        Mon, 27 Mar 2023 01:05:22 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id c26-20020a7bc01a000000b003ee44b2effasm12815256wmb.12.2023.03.27.01.05.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 01:05:21 -0700 (PDT)
Message-ID: <cfa6af3e-c7bc-894a-119c-5c6c5ea82ec0@linaro.org>
Date:   Mon, 27 Mar 2023 10:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into
 USB+DP PHY
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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
Organization: Linaro Developer Services
In-Reply-To: <70957e67-e570-3800-e679-d7c291295999@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 27/03/2023 09:59, Neil Armstrong wrote:
> On 24/03/2023 22:55, Dmitry Baryshkov wrote:
>> The first USB PHY on the sm8150 platform is really the USB+DP combo
>> PHY. Add the DP part of the PHY.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index 9491be4a6bf0..a618218f7b68 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -3392,20 +3392,19 @@ usb_2_hsphy: phy@88e3000 {
>>           };
>>           usb_1_qmpphy: phy@88e9000 {
>> -            compatible = "qcom,sm8150-qmp-usb3-phy";
>> +            compatible = "qcom,sm8150-qmp-usb3-dp-phy";
>>               reg = <0 0x088e9000 0 0x18c>,
>> -                  <0 0x088e8000 0 0x10>;
>> +                  <0 0x088e8000 0 0x38>,
>> +                  <0 0x088ea000 0 0x40>;
>>               status = "disabled";
>>               #address-cells = <2>;
>>               #size-cells = <2>;
>>               ranges;
>> -
>>               clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>                    <&rpmhcc RPMH_CXO_CLK>,
>>                    <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>>                    <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>>               clock-names = "aux", "ref_clk_src", "ref", "com_aux";
>> -
>>               resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>                    <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>               reset-names = "phy", "common";
>> @@ -3423,6 +3422,16 @@ usb_1_ssphy: phy@88e9200 {
>>                   clock-names = "pipe0";
>>                   clock-output-names = "usb3_phy_pipe_clk_src";
>>               };
>> +
>> +            usb_1_dpphy: phy@88ea200 {
>> +                reg = <0 0x088ea200 0 0x200>,
>> +                      <0 0x088ea400 0 0x200>,
>> +                      <0 0x088eaa00 0 0x200>,
>> +                      <0 0x088ea600 0 0x200>,
>> +                      <0 0x088ea800 0 0x200>;
>> +                #clock-cells = <1>;
>> +                #phy-cells = <0>;
>> +            };
> 
> Is there a reason why the new flat bindings from qcom,sc8280xp-qmp-usb43dp-phy.yaml are not used instead ?
> 

Oh ok I see "phy: qcom-qmp-combo: convert to newer style of bindings" is the followup of this serie,
please specify it because it wasn't obvious...

Neil

> Neil
> 
>>           };
>>           usb_2_qmpphy: phy@88eb000 {
> 

