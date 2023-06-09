Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C2BD729EA2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jun 2023 17:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241588AbjFIPfG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jun 2023 11:35:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241663AbjFIPem (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jun 2023 11:34:42 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E05830FD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jun 2023 08:34:40 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso3353159a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jun 2023 08:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686324879; x=1688916879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GRwD3J1+C5LwwDdPQYTJ/JoGjdYn2DGh0TgdzpJsHaM=;
        b=vXJYPdW5z58WK2EdlQdtlvc/qLG4MLAvsf4USWwT0eko8Vub71g5XxQMuho25zRiGo
         o8pTYr4dYUAV9+ijoZtmeijzPrBWU4Ca11Ie38onEDSz62+JyvkhDGFAnzHbCARdjiCQ
         0CMnFpxwlKEfDtj9coKGflB0tqC33A/8wEsc0v3OXBgi7STUvZ04Ut+5+yf3uwQoPuIj
         ymbEzOXPsdPAPWqP6OgIygZyglR5lthSLEcpGyuZqPgGRh2QhnGz7rfjcrXm80ClMrzA
         ejLSC/3iUlxfECDdXOAmaCueHaXvexbyDLDMN3lrV1gmhZPW0VoK3W0aK6HYaAVa4Yff
         Flnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686324879; x=1688916879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GRwD3J1+C5LwwDdPQYTJ/JoGjdYn2DGh0TgdzpJsHaM=;
        b=Q+K4RghA8W68zq3ODCKS1Q+80OSx5Hf9BXWf3DtYWwRbmyYY/LLdv+nVp8TX+hxfIP
         NMpydGvOKJuMS+c5V7dAtYZ8UN58Xxxziv4RzMyC3I0TI+FKAvGBybAV6rPR2+KYXhEe
         FXTTwU0DnRSJj5HmCIAhTzPQMv6X2AW2c4WwspceS6MGjsK1gAxVWWXNED0mcsZDxHJ8
         ZAFa04cizGsd4nr8nLVs1hyxlbs0nrkT+hwJ2Nu/huXo4XyFtXa1YoYdso2YQ1c4V7a6
         eQYulu6rdmqht1rnUPSOMAGIVeIU5Hdcka12pFtum5XmQtXc87JxQlmDMUJd+i4tjp6w
         uYCQ==
X-Gm-Message-State: AC+VfDxHp9TyqijGH1ZXhkh2ApB2uq+vdHajx+qFeqhkmbfCISmIj9NM
        MbiiVHMBEuI/eJGIDk9foPc3bA==
X-Google-Smtp-Source: ACHHUZ6lEMuya5eSScRvVOaLR6k+8wlGACtuzPtKR8zyz36o/4vQVEl2ds0LP+EDY7AqQnXd9cIpgQ==
X-Received: by 2002:aa7:c155:0:b0:514:ab84:b72e with SMTP id r21-20020aa7c155000000b00514ab84b72emr1587908edp.18.1686324878771;
        Fri, 09 Jun 2023 08:34:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id o13-20020aa7d3cd000000b005083bc605f9sm1903851edr.72.2023.06.09.08.34.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 08:34:38 -0700 (PDT)
Message-ID: <166c0f84-9ce0-ec15-9176-4227820c3977@linaro.org>
Date:   Fri, 9 Jun 2023 17:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 1/3] dt-bindings: PCI: qcom: ep: Add interconnects path
Content-Language: en-US
To:     Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
        Rob Herring <robh@kernel.org>
Cc:     quic_vbadigan@quicinc.com,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        quic_ramkri@quicinc.com, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        manivannan.sadhasivam@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Andy Gross <agross@kernel.org>
References: <1686154687-29356-1-git-send-email-quic_krichai@quicinc.com>
 <1686154687-29356-2-git-send-email-quic_krichai@quicinc.com>
 <168615848698.3589455.9774241463877355430.robh@kernel.org>
 <25107dc2-fab3-2091-200d-7ed83dabecdf@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25107dc2-fab3-2091-200d-7ed83dabecdf@quicinc.com>
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

On 09/06/2023 13:55, Krishna Chaitanya Chundru wrote:
>>
>> Please check and re-submit after running the above command yourself. Note
>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>> your schema. However, it must be unset to test all examples with your schema.
>>
> Fixed the errors.

Then please test it before sending.

Best regards,
Krzysztof

