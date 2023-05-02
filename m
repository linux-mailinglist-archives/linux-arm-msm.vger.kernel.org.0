Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 511546F4275
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 May 2023 13:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233805AbjEBLQh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 May 2023 07:16:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233850AbjEBLQg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 May 2023 07:16:36 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEA99558F
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 May 2023 04:16:33 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3062c1e7df8so1524308f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 May 2023 04:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683026192; x=1685618192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s817+XhrEg864Iqg3Xcty8Ttwo371gDLoynkgJ6CeeI=;
        b=rNUVMF3BvxXL0xQpPwhYfDlOuzSLJPGWxOLslPhlJfzm1rInIcckmOpDjO5f9SaPKZ
         w5neFb1yP0MUarZyFtMqPU6Rer7hHTDD2arXUQAMr3q+FbVfXg4Aq1zZROR2qOi8npUX
         YiXt4glqUy6isPnxaPcwxAdTiQY+SeNIELbOzIxOhz+ArTzlF/SnheDeBmJCDeV/6gHd
         q7z3NhuttC6rqRA2JEw9ApWJ0D8jTAl6iYjZZFeWZyWZjTOuIW8HoCajJOXa8et3jq5q
         LSyhYm0yWYg0XxNS8PyUs3p8WFOiCyE5W6owqoEvlJdsXcoEsMylZf4cCNkkuVD0yqkV
         VNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683026192; x=1685618192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s817+XhrEg864Iqg3Xcty8Ttwo371gDLoynkgJ6CeeI=;
        b=Uckk9MenRu4+TsirUQfm9hWvwAdZ/EN2jDrURAxQNaXgRPwj4E1dmtTCRZ2Hcqaa7x
         5nVgVyBzuAMpJJ2aJT1s6QH1QhQVfjHLJubpVUrTqI3IBv44tZyzCm45yH5pPuxjgyHL
         AUq19gRoSsBEAXWrjldPvycw2ftvl/7kfiRsxjN+uYp6R8z/WX+Sb7dJX5ueP1d/5JF2
         pCykTRKWmL6AESCeg/9wdGN0Ydf3t96EWBTubL983lyJUBLqkIGQ/lAHLCAWWO0yxGIw
         P9aHNhP/GSncyIm0Fa+GkhjgkTDivU1XeBwC1KFoz+6xNwAMpiGodc/XLo6QbtD5HbCk
         2sig==
X-Gm-Message-State: AC+VfDwqgAA0f8KnEc5N+unOQcLPicdNxm4ueAidHhqB+QQZaD4XUwNz
        5bBXqAAWmPqxvCgxwT3fXNaRceHhoskzC6nTwdo=
X-Google-Smtp-Source: ACHHUZ5R1xHiewsaYowCn7zk4jCqNu7AvXQJZf7mGtVWVa5QPXWRuaUeerGoCYNzzkiBRWlm1Hq/PA==
X-Received: by 2002:adf:da47:0:b0:2f4:4e1a:bea2 with SMTP id r7-20020adfda47000000b002f44e1abea2mr12468916wrl.59.1683026192325;
        Tue, 02 May 2023 04:16:32 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id a18-20020a056000101200b002e61e002943sm30697474wrx.116.2023.05.02.04.16.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 May 2023 04:16:31 -0700 (PDT)
Message-ID: <378d0ec8-5ce1-57d3-eccf-8e053d647f47@linaro.org>
Date:   Tue, 2 May 2023 12:16:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v6 12/13] arm64: dts: qcom: qrb5165-rb5: Switch on TCPM
 usb-role-switching for usb_1
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, luca.weiss@fairphone.com,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     caleb.connolly@linaro.org, subbaram@quicinc.com, jackp@quicinc.com,
        robertom@qti.qualcomm.com
References: <20230501121111.1058190-1-bryan.odonoghue@linaro.org>
 <20230501121111.1058190-13-bryan.odonoghue@linaro.org>
 <109dc9fe-5ca7-1a98-3222-8c2297f4e8ce@linaro.org>
 <b4bfe2f6-7ea3-fca5-9dc6-12270b3bbc42@linaro.org>
 <41581143-2caa-bac1-479c-c8feaf2de1b9@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <41581143-2caa-bac1-479c-c8feaf2de1b9@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/05/2023 12:13, Konrad Dybcio wrote:
> 
> 
> On 2.05.2023 13:03, Bryan O'Donoghue wrote:
>> On 02/05/2023 12:00, Konrad Dybcio wrote:
>>>> +            #address-cells = <1>;
>>>> +            #size-cells = <0>;
>>>> +
>>>> +            port@0 {
>>>> +                reg = <0>;
>>>> +                pm8150b_role_switch_out: endpoint {
>>> Similarly to the QMPPHY, the port definition can be moved to
>>> the common node in the SoC DTSI
>>
>> But then the connector would have to be defined in the SoC dtsi and not all derivatives of SoC can be assumed to have a usb-c-connector.
> Not quite!
> 
> You can define an empty endpoint (like we do with DSI<->panel ones) and
> fill it in on the device side.

Sorry you're saying to define as an example the port here in the dtsi

&usb_1_dwc3 {
         dr_mode = "otg";
         usb-role-switch;
         port {
                 dwc3_role_switch_in: endpoint {
                         remote-endpoint = <&pm8150b_role_switch_out>;
                 };
         };
};

and to leave the reciprocal definition in the connector to the dts ?

&pm8150b_typec {

         connector {
                 compatible = "usb-c-connector";
                 ports {
                         #address-cells = <1>;
                         #size-cells = <0>;

                         port@0 {
                                 reg = <0>;
                                 pm8150b_role_switch_out: endpoint {
                                         remote-endpoint = 
<&dwc3_role_switch_in>;
                                 };
                         };

