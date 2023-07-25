Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6EB8760F98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jul 2023 11:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233281AbjGYJn6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jul 2023 05:43:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbjGYJn5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jul 2023 05:43:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D9719F
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 02:43:55 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d95aed33aso7550117a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jul 2023 02:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690278233; x=1690883033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJ0gyd0imYZxtNgeAwrjMikUk2Nhj9kpohcspMSb54w=;
        b=cjOta9yDnQNDuEVvv2DxMIqTKbr2j1Fd0+mlyvGJ2v1uagWjNJLQSwB17tK/pKimbj
         lbVE8Ds5iItV2PqBcCFDKJgaJLRvelK3XBFi+pMc6AASF0L0jxXI8CB8jwBAUctfLiYD
         SEf8DgEjkLzs0/Waj8DnAJTGOWaOqQmec0L9DBeQRsi2FiPd591LyC9R+rm7ASWEAPoF
         39iSCvAptFPK8F5nywNYPnw+6ipTLoKpK0b218x7EBYaWWePS48YRSuWSSaFBn1eF/bJ
         W2CtuKW8mQ4NPv5JFruypaMtYTxlIr5Td0yWddIVMOFex5o9DmjMUWPM8c+PKXZR4seP
         Pmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690278233; x=1690883033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJ0gyd0imYZxtNgeAwrjMikUk2Nhj9kpohcspMSb54w=;
        b=ZFXbPyrTWStS0rwsI1l447Il1B0AMrLojpSURtCq5BtLe71nFImCVQReg/BlOXS5pI
         mEke2j1NtWjf1iEpnUbUx9CWpyWZLC/htSRnSUfvjzT81HRrj04WNlTdlbmAeJd4Ij9U
         jUOpah8S0pycgXysxAthe/z0MYwGkQhporsL19qjSiHr1TpSzGSuF84jllSi64YSY1VU
         uito/RofDrqGES7S6mDTKBPM8wyiOvaQs5QZQJb4wbrKKfDbrQpD6jz3NP6gePi8hjTx
         Ilf629HgNs+AHlTr+xJlGkizF8xsrY8aP5wJhNc4GKR3HlLebuCTuTqmRw4W2uCeCipv
         K4/w==
X-Gm-Message-State: ABy/qLb7TxOMaT7nPuC6bVpF5u6WZktTwQo4DHeeppfq1F7t8zzOtc0t
        +CIKCwhXU8gIxisof03+gCK4UA==
X-Google-Smtp-Source: APBJJlG7+H5VoxqMo/I/XtilID4a7wxTf6b+4M9y1I8SAU/UIle318oy////cWaNVHRaCTv925mijw==
X-Received: by 2002:a17:906:7a57:b0:983:cb6c:8aa3 with SMTP id i23-20020a1709067a5700b00983cb6c8aa3mr12250654ejo.59.1690278233546;
        Tue, 25 Jul 2023 02:43:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u26-20020a170906069a00b0094e7d196aa4sm7802452ejb.160.2023.07.25.02.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jul 2023 02:43:52 -0700 (PDT)
Message-ID: <a90461fa-8319-5b87-397f-53ba169a3d31@linaro.org>
Date:   Tue, 25 Jul 2023 11:43:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Add BQ Aquaris M5
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        =?UTF-8?Q?Andr=c3=a9_Apitzsch?= <git@apitzsch.eu>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230724-bq_m5-v1-0-17a0870a73be@apitzsch.eu>
 <20230724-bq_m5-v1-1-17a0870a73be@apitzsch.eu>
 <877c6d2c-430f-b1fb-4267-18be5d7256dc@linaro.org>
 <d51dee67-02f4-1256-877f-61629c04b08f@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <d51dee67-02f4-1256-877f-61629c04b08f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/07/2023 10:13, Konrad Dybcio wrote:
> On 25.07.2023 07:46, Krzysztof Kozlowski wrote:
>> On 24/07/2023 22:52, André Apitzsch wrote:
>>> Add a compatible for BQ Aquaris M5 (Longcheer L9100).
>>>
>>> Signed-off-by: André Apitzsch <git@apitzsch.eu>
>>> ---
>>>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>>
>> ---
>>
>> This is an automated instruction, just in case, because many review tags
>> are being ignored. If you do not know the process, here is a short
>> explanation:
>>
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions, under or above your Signed-off-by tag. Tag is "received", when
>> provided in a message replied to you on the mailing list. Tools like b4
>> can help here. However, there's no need to repost patches *only* to add
>> the tags. The upstream maintainer will do that for acks received on the
>> version they apply.
>>
>> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
> Krzysztof, update your bot to paste this link with s/v5.17/latest/g

Is there any difference? :) I would need to update links in all my
templates and re-check the links...

Best regards,
Krzysztof

