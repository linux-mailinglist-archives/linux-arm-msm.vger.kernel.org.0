Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A06D718824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 19:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbjEaRKY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 13:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbjEaRKT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 13:10:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E47021A2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 10:10:16 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-96f5d651170so258469566b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 10:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685553015; x=1688145015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zpBJqIwBo/Nu/C67n+mvjWj82gMrvBIQFujOHL40XB8=;
        b=PaJB+Ng5ASA7xTgcSbUVpUXunxTc7VxQ2TefYHq5FUs6+2/Jl0hscxC9gtxPnYEh2P
         ieebqg+vkJGB/GYKvuOHiaKUn1dZfUC6uwW/7V+R1MwdWPTwfNA2WHA/mtPTeO70hWiO
         uoZO+E/i8aaWBLpoUe0UyhzzUuantqeVuoydLrPc5Z7un7aX/v/VPsjpU0pP+5BoXw9T
         R8fcLH1Kh+uWC2RuO+vT3CdQnPNrwSiNKvUlMRmLFsNFQknRr4kgA28CZjvFv+lK8oLy
         jDIjKreApep2oXmvDEA+kxYmf8g3WiMks3pQC4jnww8Kc+AJOkpK/qCnqAT/Xord0uEo
         FU3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685553015; x=1688145015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zpBJqIwBo/Nu/C67n+mvjWj82gMrvBIQFujOHL40XB8=;
        b=S+zAiKIqGCfpPti2FnbqGkvYLP1LzcOLTSTxhhvAVzUhjkhIEbSaRP6Z80EM6EEyJl
         ktGd9vGZ6VBs304k4f5RqWTcVevjKhXnD008G2K7qSrN7wkNhOC8NLpVYfEBUvOmivoB
         sVQAbisSZA8nEw8K5FWExwyuLczdRpitbBOqAviTdnX0FR0wutL2mzrm4euwEZ+dCA53
         k4jtNgIJOaE7In+dG5H1/vXZwqnUM4fOVU+WGRKk8mNlPJRHeKzsGRTPcuMMEbfEZ269
         vLm5alhBvxmAItLyyCYklFZFUGRwDWgRMPCofMtp4b75PwPNbvGW7W2ItcoqZb8xKGbP
         1vvw==
X-Gm-Message-State: AC+VfDxVwxxrA1GPYfuMF+j2yz8YPQYsetIUojzhz030kuv6f0i3xfUC
        DuI5H0h87zI38PiVaE/bJuD80ZbJRRUgYyrcz0t2gQ==
X-Google-Smtp-Source: ACHHUZ7TZwZNXK5uqe69QR9cTTnHMALGXf0usZ9T15HkEXXRZQbXWbmqk6khd6Ya+IxxETVZ9fpqhA==
X-Received: by 2002:a17:907:9721:b0:94f:2916:7d7 with SMTP id jg33-20020a170907972100b0094f291607d7mr6059751ejc.19.1685553015225;
        Wed, 31 May 2023 10:10:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id b8-20020a1709064d4800b00965f31ff894sm9200289ejv.137.2023.05.31.10.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 10:10:14 -0700 (PDT)
Message-ID: <d403e841-7a86-1f07-c634-1990902826f1@linaro.org>
Date:   Wed, 31 May 2023 19:10:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] soc: qcom: icc-bwmon: Fix MSM8998 count unit
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230531-topic-msm8998-bwmon-v1-1-454f9d550ee5@linaro.org>
 <693a36cf-e9d5-a6f1-3953-3a7c7567a754@linaro.org>
 <89faee17-7858-194e-8af7-953a2631eb8d@linaro.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <89faee17-7858-194e-8af7-953a2631eb8d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 31/05/2023 19:05, Konrad Dybcio wrote:
> 
> 
> On 31.05.2023 19:03, Krzysztof Kozlowski wrote:
>> On 31/05/2023 18:33, Konrad Dybcio wrote:
>>> MSM8998's BWMON counts in megabytes. Fix it.
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  drivers/soc/qcom/icc-bwmon.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> If this is
>> https://lore.kernel.org/all/33c61f23-6442-6d9b-492f-dd6e9c64a8c1@quicinc.com/
>> (and QLT 1872) then add reported-by tag.
> It's not, I fired up 8998, added debug prints and ran mybw.
> 
>>
>> Change seems logical, although not really documented (a bit
>> contradictory information for sdm845), so assuming this was really tested:
> It's not for sdm845, after the last cleanup both BWMONs on that
> one got its own driver data struct.

Ah, ok, Acks stays :)

Best regards,
Krzysztof

