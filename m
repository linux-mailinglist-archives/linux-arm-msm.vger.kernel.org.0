Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEFBE6BAA71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Mar 2023 09:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231586AbjCOIIb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 04:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231480AbjCOII3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 04:08:29 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AAF206B5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 01:08:28 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id h12-20020a17090aea8c00b0023d1311fab3so1057282pjz.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 01:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678867708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zf3SxA1nvFsp+aFJOgDiIaFeqD0uKMLVMNAFYzhVXhY=;
        b=NddB9feiL1/IHj0GWjT60uDVka3Coer/8QqM++x5QCJ4AUdYzHQ1ZmXgIlgRBFmI8X
         vj4FdOqUWme3kwggjcL21D4384w100HngzyCxLHJjksA2CATht/g77//QzSpXm+dG3ke
         XaSwyEfJYikUNUn1MhOj7LZfqQtArIIRl1x0ABE+gZxtlNzkkQY9n3cDaDMAN/m4Lpdq
         FkK/yQH7Y2jtO9wWz++8rSM9cLdvJZ/2pKlJ4nJbdN191rRpgFbeAF9E02SQn7jHOtv8
         8f1B6GKwx297IGiqZbB9a8lkEYxk6iG1hnJhjdhWN8mW6niN5hY7kdQGGA7EXf/B9/Ae
         9CFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zf3SxA1nvFsp+aFJOgDiIaFeqD0uKMLVMNAFYzhVXhY=;
        b=O4c9oJZ1HWvIetabL/AxKKkEd9/ZEgNRyYueBhnbrUfc60XE0ZxbwlpJlsmrxfV0q2
         lkabrbQC4GwSwQqZn2OR85Na2i7MKTJYXNFUgwvYDC6BdKjQNdSLHmRVl7mkeo2mqDrO
         +RB6HLfKay3ODBGsBBgbGNbLVZdtKYsFiy/NImVIWO6QAoQx6Rt03tL1fgFKlChv+WFc
         GgWVjK7LLL9jN9DIx2tP+gLNs0cLdOv9aWEIf38O6geirOm7XFd25QFU6s1IpQDOpSIa
         vWq6aRl2hrDH+oNV93KOWZ+sbpd0FxgQWB96/NG9osyAFjPI+0wUSXDDhAmoKDy/IY1V
         YIfg==
X-Gm-Message-State: AO0yUKW+bGXFp+3b4zhnsMANIdNXmrwnvaYfXpj6tYgj89fhPbwbffYk
        eS5nN0zVhtI+rAjEOF41QDmClg==
X-Google-Smtp-Source: AK7set9WhF84SIf5aXDDBaPgWwRatZNX9vVlgGWyHt2WrilP2gD6F91uKuAeYewh/yYjTj8F8aXAgg==
X-Received: by 2002:a17:903:283:b0:1a0:4341:4cd9 with SMTP id j3-20020a170903028300b001a043414cd9mr2220842plr.31.1678867707615;
        Wed, 15 Mar 2023 01:08:27 -0700 (PDT)
Received: from ?IPV6:2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6? ([2401:4900:1c61:1acb:9af6:bd7f:78e7:7ae6])
        by smtp.gmail.com with ESMTPSA id p16-20020a170902ebd000b001994e74c094sm2961131plg.275.2023.03.15.01.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 01:08:27 -0700 (PDT)
Message-ID: <6d7f60b6-bdb4-a22d-4396-c72fd9114d84@linaro.org>
Date:   Wed, 15 Mar 2023 13:38:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document the Qualcomm
 qrb4210-rb2 board
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        linux-kernel@vger.kernel.org, bhupesh.linux@gmail.com,
        robh+dt@kernel.org
References: <20230314210828.2049720-1-bhupesh.sharma@linaro.org>
 <20230314210828.2049720-2-bhupesh.sharma@linaro.org>
 <3104977d-b93f-3c55-70d0-cb54cb48da81@linaro.org>
Content-Language: en-US
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
In-Reply-To: <3104977d-b93f-3c55-70d0-cb54cb48da81@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/15/23 12:07 PM, Krzysztof Kozlowski wrote:
> On 14/03/2023 22:08, Bhupesh Sharma wrote:
>> Document the Qualcomm qrb4210-rb2 board based on SM4250 SoC.
>>
>> Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
> 
> Subject: fix double space before "Qualcomm"

Sure, I will fix this in v2.

> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks.
