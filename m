Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 902466CA107
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Mar 2023 12:14:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbjC0KOb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Mar 2023 06:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233536AbjC0KO2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Mar 2023 06:14:28 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3244A5266
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:14:22 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id q16so10648443lfe.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Mar 2023 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679912060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q/ExcHKxJq69sl8W7PMViChgzotjBz2UGdEzIpXe8ec=;
        b=Hngo9t2B5cVSpOGD54+y2hTk18YJq2g9dKybQxqqT1EAe1jP9p+2F1oKhZJvPyUax1
         d4862Qbw9dLg681A1TAbiDnScPc5ZOec1qlGXeh9xfpLqCno03c81m/bDYB33430pInF
         ui9JRA2Gc0UCyRnH/L/Xs49zSOZ8CYjvWmXHnlI2KR8Ym0HrE8NJ6nEKYJVqd0EZg2Nr
         HH0ntZ/Uwe2yTZ9TNLJWSC4DjGc/fclLj+6fn4Z3AYUGDyLAU8dFVX3LCJEAmoEbhVAA
         AWK+VUPYuO9N2CSYflk+9mbQt160pRnddxFBo4fitLcgOyIorrnNW8QITawMVDZ+SB3S
         FEHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679912060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/ExcHKxJq69sl8W7PMViChgzotjBz2UGdEzIpXe8ec=;
        b=bfOwhmZ2VWfaC6BPUFrRvdXXfXsMO911B+6UvjTl4R6asTpyJ+fnRbxzFSfzo/8+T4
         LpzOdIfIQupgVnCGz2/9T2yeCzbT+knmkmqwevN/EI4StApEeGLmfOQo5y/7cdYV92Sn
         634dNKMTZT0MRk+FSo/yMwRH3MZMxb+Tdd3tl6CNIBCCIIcpGD3TOCfjLnppDThhYaYW
         cwd0Ubp2v8fhyeKzkMM8+fQW0hiQTO3tZz1iEC9gZ7xSbXfBla/CCcMDO1xd9dF9o9w/
         4zqOck4Ke8UL4821Srzbcok3pPJT5uK8ajH4igljnUSSL8FpG4mHq4Z3GyewC7d4GPlX
         mHhQ==
X-Gm-Message-State: AAQBX9diZskcb4DsmokUBcmUkOO2znYcFrkzIkzQyqYh+aUkvUU0QyED
        fYvvNI5YYMdkcxv2pw3h1/hXUw==
X-Google-Smtp-Source: AKy350bcRtso4dzJxPb8m95F1N+pXUaytvkQUwpB3IIgz4S3WIPT6D99/shJgqDLSRTDr7rmL++BoA==
X-Received: by 2002:ac2:596d:0:b0:4dd:a633:2ae4 with SMTP id h13-20020ac2596d000000b004dda6332ae4mr3496214lfp.39.1679912060436;
        Mon, 27 Mar 2023 03:14:20 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id h11-20020ac250cb000000b004db3d57c3a8sm4606981lfm.96.2023.03.27.03.14.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 03:14:20 -0700 (PDT)
Message-ID: <85d75550-66f4-2680-c6fe-9c575e916b40@linaro.org>
Date:   Mon, 27 Mar 2023 13:14:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sm8150: turn first USB PHY into
 USB+DP PHY
Content-Language: en-GB
To:     neil.armstrong@linaro.org, Andy Gross <agross@kernel.org>,
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
 <cfa6af3e-c7bc-894a-119c-5c6c5ea82ec0@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cfa6af3e-c7bc-894a-119c-5c6c5ea82ec0@linaro.org>
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

On 27/03/2023 11:05, Neil Armstrong wrote:
> On 27/03/2023 09:59, Neil Armstrong wrote:
>> On 24/03/2023 22:55, Dmitry Baryshkov wrote:
>>> The first USB PHY on the sm8150 platform is really the USB+DP combo
>>> PHY. Add the DP part of the PHY.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 17 +++++++++++++----
>>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi 
>>> b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>> index 9491be4a6bf0..a618218f7b68 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>>> @@ -3392,20 +3392,19 @@ usb_2_hsphy: phy@88e3000 {
>>>           };
>>>           usb_1_qmpphy: phy@88e9000 {
>>> -            compatible = "qcom,sm8150-qmp-usb3-phy";
>>> +            compatible = "qcom,sm8150-qmp-usb3-dp-phy";
>>>               reg = <0 0x088e9000 0 0x18c>,
>>> -                  <0 0x088e8000 0 0x10>;
>>> +                  <0 0x088e8000 0 0x38>,
>>> +                  <0 0x088ea000 0 0x40>;
>>>               status = "disabled";
>>>               #address-cells = <2>;
>>>               #size-cells = <2>;
>>>               ranges;
>>> -
>>>               clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>>                    <&rpmhcc RPMH_CXO_CLK>,
>>>                    <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
>>>                    <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>>>               clock-names = "aux", "ref_clk_src", "ref", "com_aux";
>>> -
>>>               resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>>                    <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>>               reset-names = "phy", "common";
>>> @@ -3423,6 +3422,16 @@ usb_1_ssphy: phy@88e9200 {
>>>                   clock-names = "pipe0";
>>>                   clock-output-names = "usb3_phy_pipe_clk_src";
>>>               };
>>> +
>>> +            usb_1_dpphy: phy@88ea200 {
>>> +                reg = <0 0x088ea200 0 0x200>,
>>> +                      <0 0x088ea400 0 0x200>,
>>> +                      <0 0x088eaa00 0 0x200>,
>>> +                      <0 0x088ea600 0 0x200>,
>>> +                      <0 0x088ea800 0 0x200>;
>>> +                #clock-cells = <1>;
>>> +                #phy-cells = <0>;
>>> +            };
>>
>> Is there a reason why the new flat bindings from 
>> qcom,sc8280xp-qmp-usb43dp-phy.yaml are not used instead ?
>>
> 
> Oh ok I see "phy: qcom-qmp-combo: convert to newer style of bindings" is 
> the followup of this serie,
> please specify it because it wasn't obvious...

I thought that a note in the cover letter was good enough, but yeah, 
maybe it should be more explicit. Do you think it warrants v2? I can 
send one.

-- 
With best wishes
Dmitry

