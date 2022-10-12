Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43A355FC5DE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Oct 2022 15:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiJLNFA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Oct 2022 09:05:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229969AbiJLNEs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Oct 2022 09:04:48 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AD3BB86D
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 06:04:46 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id g9so10809280qvo.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Oct 2022 06:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9U4fPi5GNAg/H+GrZPg2lsLynUd9fsNHOB+vFj+U9I=;
        b=qKI0Ur+UE5p/xiaydTpqCSSQieHcGXOkm2SqpzECXfcPDKwcUFMOnMnZHP2Z6q7B6U
         jnhi/UguNrWMVPYzLeGlduv/fbsJ6Hpxo3h9PdgF9X8COXFgxg1ICfHvLfkhp4m0fk+V
         Y8mB+7w98cXNJOiEcp/HXFs4uwG1pCXe09zZ6HNPh9qCor4Y7snCskyxl0Ghiob73ySy
         awlnT0aRK/X/xox5Jv+L+VX3hBr8eLvo+yTHPu4ohvDizgIJff1fTi3klEw1C0tp0RQJ
         lbqZDTNiRdnoqJJZG1UULMWl4+6pQfWg4jM+a9ZSi1jZ6431YLA84rfR1PhSCpy/lR10
         buJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M9U4fPi5GNAg/H+GrZPg2lsLynUd9fsNHOB+vFj+U9I=;
        b=sT0c1YKKbBSo9nRva8fUoo++olGkZo0fF+XwL6a0QAiDyL2BYfI6DmquCUBiumpsjg
         k4qcWjybDqUzHtAbiR2k2UYHcx3ULsVvnF3kBxxPolO019bEXuRHxkzEjQOcT+sdM7ls
         9S1DXJKcjNjkesojk5jK8KQ1Ga5HaHh9Xxsmh9OoXLC8cEIZSyeOHA/k2hOwtir/Btt1
         BKodX3xH4mc6CsEavwVgocm5uXy7DQU8VRJAl9e/tZdnVJd6gmOBpyZhf5xoMl11TaeS
         r2zYm/VqNF2s43lGYs+AIcNrm/A9bQR76O9jRp331gPuY3V6IKyrsFztd1s68xbBehry
         Be7w==
X-Gm-Message-State: ACrzQf3FAWFNelFN57d/Hex7r8XlTfJru+OzMCm1zrGLWRC2ih04+hqV
        bsgnhtB6csSh2uGYHG37aTTelw==
X-Google-Smtp-Source: AMsMyM4df3Hlk1yaiildPII8+BA5RljRoYu9EFFBUn6ZvtLDOEYluoJvE1GkwFaFhCb4wPGMdl5R/w==
X-Received: by 2002:a05:6214:224c:b0:4b1:811d:9a06 with SMTP id c12-20020a056214224c00b004b1811d9a06mr23509248qvc.19.1665579885369;
        Wed, 12 Oct 2022 06:04:45 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id j10-20020ac806ca000000b00359961365f1sm12324130qth.68.2022.10.12.06.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 06:04:44 -0700 (PDT)
Message-ID: <0829050b-8ef3-e210-9a40-fbec01bb4d21@linaro.org>
Date:   Wed, 12 Oct 2022 09:02:32 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add nodes to support WoW on
 WCN6750
Content-Language: en-US
To:     Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220926045735.719-1-quic_mpubbise@quicinc.com>
 <f1057c78-39a2-6b26-f3c9-51cd99450dd2@linaro.org>
 <a6e94553-c62f-128a-4122-94483b02bee7@quicinc.com>
 <f7ea53ce-421f-f608-ba50-f107a7f5cb87@linaro.org>
 <d215c841-987a-bf53-0c62-d8688cbd4e6b@quicinc.com>
 <fc390436-92a3-2b2a-0078-cf50a9073b8c@quicinc.com>
 <f9ecdb22-2827-989e-ada2-9eec95dba687@linaro.org>
 <8d43fd52-3bbe-d711-e025-b45a79451ae2@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8d43fd52-3bbe-d711-e025-b45a79451ae2@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/10/2022 02:22, Manikanta Pubbisetty wrote:
>> If you did it, you would see the check will fail. The bindings would
>> report error. There is no need to engage reviewers if bindings find the
>> errors for you, right?
>>
>> Nodes you added here are not allowed.
>>
> 
> Thanks for the inputs Krzysztof, I now see the following error
> "smp2p-wpss: 'wlan-ap-to-wpss', 'wlan-wpss-to-ap' do not match any of 
> the regexes: '^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap$'"
> 
> After making changes to the smp2p binding, I did not see this error.
> Following are the changes made.
> 
>   patternProperties:
> -  "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap$":
> + 
> "^master-kernel|slave-kernel|ipa-ap-to-modem|ipa-modem-to-ap|wlan-ap-to-wpss|wlan-wpss-to-ap$":
> 
> Shall I go ahead and make the smp2p binding change?

If it is correct change, then yes.

Best regards,
Krzysztof

