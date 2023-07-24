Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D314D75F83A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jul 2023 15:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230289AbjGXN1K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jul 2023 09:27:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229972AbjGXN1J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jul 2023 09:27:09 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7A3E4E
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 06:26:53 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-992ace062f3so770681066b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jul 2023 06:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690205212; x=1690810012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j3RBb+0rdI0PV2BXiS1JbrEVU9RxO+lG8P/0tc+GO2k=;
        b=BgBI17fdQ/GbfAC+tyBQqZDxHUVtXE2gyuA+iY6fgjJRj2mM7rPqhup90hSQ0GMKuD
         7wQ2ysntk6ex6WlxX7SrnKsvpJs2XA6FdwaYllJ+DEfSaRXKA57bbjh0+H8WmO0PbduE
         hrODJiSi61B02+5Ei0iTz2CxXlU0gPoTvKGb/qskxos6EM8nX6Z0Zr5RWs/4S1ce0q/N
         ewa2Czwe1HfC8hwPsJJlRUA9Sga7nleuaCd3v6zKnmsf6dsxOFoGgEoNjtbEkbTeYVBV
         hMOsEi72t6F9OD58sdW77RkqaZzv0XJTAqv4tHh1PLqpdLK/NXeUG7khR0cxshjIisfl
         rRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690205212; x=1690810012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j3RBb+0rdI0PV2BXiS1JbrEVU9RxO+lG8P/0tc+GO2k=;
        b=J1D7N1K9NJ3LMdfgFWG0kpC159snedSUucmo0u2U7lJSiCQQSjhiwrAt0Upa4XAf/S
         A8pow9NtJ22mg2sfwxWOdSULL4EroDxgm1zsWdXJTct/IV80C9FJ4b8Ni6CTUM/fvIQa
         Uda0NiSYSw7Ohba75K8TzpO+z6MibESOV/sQxpgxL9qIp8n3yOKJkuaOfJQeCFWx873s
         b+aUXkUUVGz4c56W4E6U8JhphlHD1e9+gYtcJTjq5ubgx6aCZHxsaGLV4hq1OeFopVbw
         VdYLcIQaeiSXGqtM/x5ZjJigInfxYInm7Y30oWyYrKHOJZMqQKmh6cpjraBljG7+XTjc
         AM3g==
X-Gm-Message-State: ABy/qLZTF/lNHBdnM2tHsXKOfjFWYk3B7W51CXUsUPlJFqxB6ZkrWxWk
        pSHzZkcXrJ3bNin9PbvHa1uNXQ==
X-Google-Smtp-Source: APBJJlG+MYBK5sVdt/kiSQV3ZDPpauvV89+zavgwzbGMZNg+Lkas7YB/9OEJZ5Op6rZW781mBlqpIg==
X-Received: by 2002:a17:907:2bea:b0:98d:f4a7:71cf with SMTP id gv42-20020a1709072bea00b0098df4a771cfmr9317640ejc.62.1690205211882;
        Mon, 24 Jul 2023 06:26:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h19-20020a1709062dd300b0097073f1ed84sm6754521eji.4.2023.07.24.06.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 06:26:51 -0700 (PDT)
Message-ID: <aa2978d7-b0bb-e05c-6da1-3930e291643a@linaro.org>
Date:   Mon, 24 Jul 2023 15:26:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 2/6] soc: qcom: llcc: Refactor llcc driver to support
 multiple configuration
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>,
        Komal Bajaj <quic_kbajaj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230724084155.8682-1-quic_kbajaj@quicinc.com>
 <20230724084155.8682-3-quic_kbajaj@quicinc.com>
 <39b4bafd-410f-cae8-13ae-e18d751b51a2@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <39b4bafd-410f-cae8-13ae-e18d751b51a2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 24/07/2023 14:28, Mukesh Ojha wrote:
> On 7/24/2023 2:11 PM, Komal Bajaj wrote:
>> Refactor driver to support multiple configuration for llcc on a target.
>>
>> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
>> ---
>>   drivers/soc/qcom/llcc-qcom.c | 264 +++++++++++++++++++++++------------
>>   1 file changed, 178 insertions(+), 86 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
>> index 67c19ed2219a..321f8d2079f7 100644
>> --- a/drivers/soc/qcom/llcc-qcom.c
>> +++ b/drivers/soc/qcom/llcc-qcom.c
>> @@ -127,6 +127,12 @@ struct qcom_llcc_config {
>>   	bool no_edac;
>>   };
>>   
>> +struct qcom_sct_config
> 
> const ?

What (and how) should be const above?

Best regards,
Krzysztof

