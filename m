Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8891F6C3EC7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Mar 2023 00:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbjCUXwj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Mar 2023 19:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjCUXwi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Mar 2023 19:52:38 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E34258B50
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 16:52:36 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id l12so15355175wrm.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Mar 2023 16:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679442755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Zv291RLqrvxioxJX0RVTeF2Z5czhUbpRp3iyyUP2rZE=;
        b=l5W4fM/Vl6k8l4CrD0lxkEpheMeo4XDxKHxYW0xM2VN86RonThDeFET7if3a3n12No
         UddaRadbnbdM7iMX9D3shY0v61wYJLsgZqGcdKLr13c/2QphthGH1AB0RoZGy+aDEr9T
         cNKN7mTHGfjzgEQMrRmUDkE6e95SyJviUnnc2FR4qY4Gly/b42OZmsXDpGrDPX2u/J2k
         /6/CFFCTdHYr+S/02x57vY79uSEvogi1GdsYKgoiTL134untpUI2rWGouIuV3rvHfKQH
         OV8C+1OfpedfduOdHRZcaZk3iDD4+pz6ARbgSH0YxukB6/zepf7+2AI0SfT0+GxXVA0G
         K60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679442755;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zv291RLqrvxioxJX0RVTeF2Z5czhUbpRp3iyyUP2rZE=;
        b=A9DQa+1HY2xk5UkcnXaQfUjjThOKqvc0ff7/l5QexGwds0vigC3s4ujbkqukvBAqlu
         39icprLR7G34rzXcTmWmhZBxf4FYfYn86dlC5/bpprJYpk1fG31AnYhu1EfLZBWihun2
         S1S/11+OjgQrgRR2q2Vg7MYuCZEF4MbCF8nTUjnkDxPyq0MNEr9YbiST48wkJ07k4mlZ
         +x3JFme8MEuaS+GIiWym1b9HCUguaqH6bsBA5SG04+ETy9wbGftH4kYdO10enmDbtdeS
         anfrZ+vtMdKDPh/S2EwNZzjpjcQk9mjRzyOKeDlpnizqxL7Z1PQccBo/UADG6hOnaNH/
         vzYA==
X-Gm-Message-State: AO0yUKUIvdivf4TO0g2pDfEc3LqjMYkl4mG88iGBBi4ymZCMwubt3LTr
        1N+kFam2eXQOg1meEcoaVeT/3g==
X-Google-Smtp-Source: AK7set8Tbju7lmyp7KNRw4+1RjB7OwLCd/Ql/YeCyg7aWDQJV6lTSLynwbHAvjT8HzoBkRi9ORGRBw==
X-Received: by 2002:adf:e987:0:b0:2d2:3b59:cbd4 with SMTP id h7-20020adfe987000000b002d23b59cbd4mr3923227wrm.12.1679442754789;
        Tue, 21 Mar 2023 16:52:34 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j6-20020a5d5646000000b002d2f0e23acbsm12432127wrw.12.2023.03.21.16.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 16:52:33 -0700 (PDT)
Message-ID: <701e1b8c-7f71-ca8f-ad22-e86dedf3d7be@linaro.org>
Date:   Tue, 21 Mar 2023 23:52:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 10/18] dt-bindings: mfd: qcom,spmi-pmic: Add pdphy to
 SPMI device types
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, andersson@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        wcheng@codeaurora.org, caleb.connolly@linaro.org,
        konrad.dybcio@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230318121828.739424-1-bryan.odonoghue@linaro.org>
 <20230318121828.739424-11-bryan.odonoghue@linaro.org>
 <88ccb21c-4370-7132-b2c1-c74b1f865cec@linaro.org>
 <20230321205802.GA1540152-robh@kernel.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230321205802.GA1540152-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/03/2023 20:58, Rob Herring wrote:
> On Sun, Mar 19, 2023 at 12:58:48PM +0100, Krzysztof Kozlowski wrote:
>> On 18/03/2023 13:18, Bryan O'Donoghue wrote:
>>> The PDPHY sits inside of the PMIC SPMI block providing register-level
>>> ability to read/write USB Type-C Power Delivery protocol packets over the
>>> SBU pins.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
>>>   1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>>> index 8f076bb622b15..111aec53caeb5 100644
>>> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>>> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
>>> @@ -140,6 +140,10 @@ patternProperties:
>>>       type: object
>>>       $ref: /schemas/power/reset/qcom,pon.yaml#
>>>   
>>> +  "pdphy@[0-9a-f]+$":
>>
>> phy@
> 
> But it is not a phy which I would define as something doing digital to
> analog (or vice-versa) signal conversion/encoding. Sounds like an SBU
> controller or something...
> 
> Rob

Its an SBU controller.

---
bod
