Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D085674D57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jan 2023 07:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbjATGZj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Jan 2023 01:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229684AbjATGZi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Jan 2023 01:25:38 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AE1872B8
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:25:06 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id q10so3934496wrs.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 22:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GxQNp79R+XdyUWCcN7g4amNp/JsJi1+bDNVRhs+DKVA=;
        b=h3pmmoknuqFY6LkSoG2b9m1G2fI4oTQfwpfOF95O/vXYQjSnq8iQQ/krogHPVyRWyN
         xNLeAejsudG4WdJdsnB8sy7HyrM/t543hv+RfpXbAIr5dUUdiR8ADZF6Al+U/48543jE
         Ui8r4P8Bj0m7P0NvCpQn5HtRMSbkwEainVtT387LOU6xThDpgBHjjjP9Ztk559I9Tik5
         hRYYj2D/Xdtxk6/zQ8MJ27CZq0rfL6e1Pb642osulf1H7uN7ZgaznUexQlkH1GBNw27g
         luSZS/wL1qgHkINXetuFpv5NPWJw7i1yu1JM0raKod437FGd0duOog7rzTHGzFBQvnCY
         P1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxQNp79R+XdyUWCcN7g4amNp/JsJi1+bDNVRhs+DKVA=;
        b=jG3FuNUGz5PivPQ1mooI9wUO4fUBJFfZbnG5ZaFtdv8OVgLCX7aoO6fPVLgtudQi8W
         wNFjKi1D4yj03plUFdhZ8JNEWY8N15AKOqWl65NUpSk4K16/wmz2jjUUSjPZg5UZHvLK
         9TyKTHW7QDPL/wSmor2f2igylJ93dh/vSI2END/QVrwXb/7lVsFrgyFsd7FmjUj3Gty6
         2QvEo7s7fp4r20DeBIDrdZRT2RL6HByzQ4namHBVZ3wN/WSrhfwjX2/0e9RRXLl+MzkJ
         AnYoL/SGZ+MBKhVIvMpqyrMn2qDeZDsZzchRBVJFSt1jMoMXN/l0F4paqjk05c9rMvyj
         P9QA==
X-Gm-Message-State: AFqh2kqjVPsgRXsF+E41Y1pfh1bAib81Tvotmeef7O+vUpsGMXBwDV4Y
        2i724ON157HhTKXjz03k7UOZlw==
X-Google-Smtp-Source: AMrXdXuDBWLKar3I9BvLZ2J3NTR0GEVbcT550ZY+Iw5aK49ZYMf4i+OxkxUx3eLGCWxD+LNNCzf1sg==
X-Received: by 2002:a05:6000:1049:b0:2bb:ee8a:4282 with SMTP id c9-20020a056000104900b002bbee8a4282mr11173469wrx.34.1674195902101;
        Thu, 19 Jan 2023 22:25:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z12-20020adfd0cc000000b002bdff778d87sm12335144wrh.34.2023.01.19.22.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 22:25:01 -0800 (PST)
Message-ID: <7d874a5d-5a26-1ae1-58bc-dd819774190d@linaro.org>
Date:   Fri, 20 Jan 2023 07:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 4/7] arm64: dts: qcom: sc7280: Update VA/RX/TX macro
 clock nodes
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        vkoul@kernel.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        alsa-devel@alsa-project.org, quic_rjendra@quicinc.com,
        konrad.dybcio@somainline.org, mka@chromium.org
References: <1674131227-26456-1-git-send-email-quic_srivasam@quicinc.com>
 <1674131227-26456-5-git-send-email-quic_srivasam@quicinc.com>
 <17b895c0-3985-a012-9b02-94d5ebb11ff9@linaro.org>
 <9ae3b1b0-e9d6-6370-667b-88af5d0efa2e@quicinc.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9ae3b1b0-e9d6-6370-667b-88af5d0efa2e@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 05:47, Srinivasa Rao Mandadapu wrote:
> 
> On 1/19/2023 7:01 PM, Krzysztof Kozlowski wrote:
> Thanks for your time Krzysztof!!!
>> On 19/01/2023 13:27, Srinivasa Rao Mandadapu wrote:
>>> Update VA, RX and TX macro and lpass_tlmm clock properties and
>>> enable them.
>> Everything is an update and this does not explain what exactly you are
>> updating in the nodes and why.
>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> Tested-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
>>> ---
>>>   .../qcom/sc7280-herobrine-audioreach-wcd9385.dtsi  | 59 ++++++++++++++++++++++
>>>   1 file changed, 59 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> index 81e0f3a..674b01a 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-audioreach-wcd9385.dtsi
>>> @@ -8,8 +8,67 @@
>>>   
>>>   #include <dt-bindings/sound/qcom,q6afe.h>
>>>   
>>> +/delete-node/ &lpass_rx_macro;
>> Why?
> 
> Actually in SoC dtsi (sc7280.dtsi) power domains property used.
> 
> Which is not required for ADSP based solution. As there is no way to delete
> 
> individual property, deleting node and recreating it here.
> 

You can delete property - delete-property. However why in AudioReach
device comes without power domains? What does it mean "power domains
property is not required"? DTS describes the hardware and the rx macro
is powered, isn't it?

Best regards,
Krzysztof

