Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA2CD65B1FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 13:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232546AbjABMYk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 07:24:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbjABMYi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 07:24:38 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83FE5FD5
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 04:24:37 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m6so30990372lfj.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 04:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zPyATCLDlZAicz4nRCSCHXME5SLIGat3WCVrAa7Y5aI=;
        b=HdMC/O+L8iME4BVm100zIlIrPPAElT2BH4v7ZAZgcdyVNqlq1+ASe6vHH8j7Dxh6DP
         wIua7SW+mxxLT+qHfv9IrUH+dUBESFfl2MCpgWvReH+IFyBGxNqyNuMfcHgWnuN7216k
         NT4pjuR1Iqp4zNWLxDpQXo7VmYtA1rVysOyuMHP7SDqM6JLJGBpvY5QlLPlPEMG48ZE3
         vU8WrlP1Tch2jiz0EsAQCDyHerpa89iEYS28EwAAak03Ts/sSXT5dwxqpxKXffTfp8K8
         LaPhhpHDLSKQVjfgD1rGtFyJzSWwqKufIuTTq7mzrmZB1GKx96zlySvJZk+q7E4cSNY9
         DRwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zPyATCLDlZAicz4nRCSCHXME5SLIGat3WCVrAa7Y5aI=;
        b=dcrxsbjy7WCQf+nVW1sHm20rMhp4FJw8LIinfHtY1VujcM1zs/fK/Y8xqjm47uao/M
         iDmZVqT7pCZT+EC0ZCjnq411RrlDbZoLUFjmP3Zt5gqLH73yYO486qhK0/4p9ntpvONZ
         +jNynzRDld62cg/VGiWYcdVElurW+NlD5hDJoVN9XApO+AvPL29I25fZmbhYFvnaNFyU
         BgF02sIMxV8yDrwyH0S9UGV3Nf3v7LGLxsTlmvoD4ZWXqt5sGRd9A4fCJreqoF24PRdu
         igHFjC2iaA+oU++h4y5Bv6DmuEB3N8EQ65uu3pDQHHdoAPjoc2k7m+JDGqQAQb7fAZ5+
         YdcQ==
X-Gm-Message-State: AFqh2kpdWeZLb0a/7VUw2SdHYWSOOxA96+3Hjb0JK2HbRi4lv4/ZcflY
        JFeK3pEzqbLiKivtOcipr8ccVw==
X-Google-Smtp-Source: AMrXdXvIH/smTyiJFm+lTyDjKfVRib7YqDRnhztTDDxRcbNd9aGyTjy3R437aYjbppzTc59cpTXV6g==
X-Received: by 2002:a05:6512:3b22:b0:4a4:68b9:19e1 with SMTP id f34-20020a0565123b2200b004a468b919e1mr12938323lfv.9.1672662276366;
        Mon, 02 Jan 2023 04:24:36 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b55075f813sm4472430lfc.227.2023.01.02.04.24.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 04:24:35 -0800 (PST)
Message-ID: <791c0e37-f825-c324-7a99-163b0566c758@linaro.org>
Date:   Mon, 2 Jan 2023 13:24:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8450-hdk: fix wcd938x codec node
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230102105038.8074-1-johan+linaro@kernel.org>
 <20230102105038.8074-7-johan+linaro@kernel.org>
 <c2a32bd3-90cf-6d1b-1ca7-76071232c81b@linaro.org>
In-Reply-To: <c2a32bd3-90cf-6d1b-1ca7-76071232c81b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/01/2023 13:23, Krzysztof Kozlowski wrote:
> On 02/01/2023 11:50, Johan Hovold wrote:
>> The wcd938x codec is not a memory-mapped device and does not belong
>> under the soc node.
>>
>> Move the node to the root node to avoid DT validation failures.
>>
>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 52 ++++++++++++-------------
>>  1 file changed, 25 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> index 4de3e1f1c39c..217b2c654745 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
>> @@ -17,6 +17,31 @@ aliases {
>>  		serial0 = &uart7;
>>  	};
>>  
>> +	wcd938x: codec {
> 
> Let's call it audio-codec and put it somewhere ordered alphabetically.
> This avoids useless reshuffles immediately. Moving things back and forth
> does not make sense.

Eh, on the other hand SM8250-MTP uses name codec so maybe the rename in
SC8280xp should be dropped.

Best regards,
Krzysztof

