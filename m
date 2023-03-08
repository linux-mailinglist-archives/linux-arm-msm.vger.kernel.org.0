Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 969A46B044F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:29:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbjCHK3i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231168AbjCHK3X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:29:23 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCFA9B9BC1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:28:54 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id da10so63767499edb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678271333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OEVT942PD83nNqCk0fNzH4LSM/KqPfrdg614FVBtfgs=;
        b=dUqx6XtGJet+8XKcnZ6IXhrXPe3uoJixdjDaLA57ZCaUxtTSbc9dggJVclzkYa/yLz
         7Fpr8juVvIOJcqEXjI0P41xFK3OryKqVv/YNvkLgPyfHxELJSG9e41Iy9YamVeVpm2Ef
         0RsIdSKx8AgYV3GdFal41HeMHUH6ssgBpPeDNB6RyS9sidt1kmnXgwQfUqtD4oN2gDVG
         DxowWsy/JIuQrH9L+NvO13sDQ8qXWOLc863SXv+2inOWCci1FUkVvKIE0T/jGjaqzQks
         36tY9zpjr4m+Yz/wh7j9FX8178UctgJehvx3tsuHnts1SBRRfdc2ljN8+DnJj5C4WMaA
         KWFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678271333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OEVT942PD83nNqCk0fNzH4LSM/KqPfrdg614FVBtfgs=;
        b=55G4GDo5Yl/TeLlk3ohZ+LpnXwnPW4tnhcVuhkERUpmk1mctn7lCshAFQigioKsIka
         DtaF2PwEpF/Tr+RQLK6+3LKZmZjqSi79dnnNN16uuHPL6gq/RAybZYSyVGBsAXSbUt6n
         ij2MRFS1HIa4Eqjr6fxyK4c97rBNHfQAI8n1VLVBPI6SYP7M16QdoJ61hHYRRin/k3/C
         MEne1aQaLNaWeCSJGloeHIqtm0+dxbj8btFnGXQ6iI0ZnTtIg+0XKiGpwgef/GozLY/l
         0bAXd6jVgZ9q3su/iwESfUoq4jCAb6UpNrzslwBnta+D3M2p+6oqORzp8+dZgMNh4NcS
         Kq7Q==
X-Gm-Message-State: AO0yUKX1fVDJ9r8aD6Et+AkBQKlXynml9rqjBu+07YWpXyAEqyM75DwQ
        vqT6bkn5lmrTd1DrVNMzYzB5AQ==
X-Google-Smtp-Source: AK7set+gCza7j9S3L/+TZBxxpTBrNe35gEezkD4tREgS5s5TNPkdZSpOa/heYH5kT6vk3tOWQqUmHg==
X-Received: by 2002:aa7:c44e:0:b0:4b8:9a32:ec07 with SMTP id n14-20020aa7c44e000000b004b89a32ec07mr14534597edr.39.1678271333127;
        Wed, 08 Mar 2023 02:28:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:ff33:9b14:bdd2:a3da? ([2a02:810d:15c0:828:ff33:9b14:bdd2:a3da])
        by smtp.gmail.com with ESMTPSA id s23-20020a50d497000000b004c8948162e8sm7573417edi.67.2023.03.08.02.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:28:52 -0800 (PST)
Message-ID: <1731df36-edf7-8c36-ec11-8c943c08e548@linaro.org>
Date:   Wed, 8 Mar 2023 11:28:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Allow
 #power-domain-cells
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230308011705.291337-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230308011705.291337-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 08/03/2023 02:17, Konrad Dybcio wrote:
> MPM provides a single genpd. Allow #power-domain-cells = <0>.
> 
> Fixes: 54fc9851c0e0 ("dt-bindings: interrupt-controller: Add Qualcomm MPM support")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,mpm.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

BTW, this can be also added to the example. Always useful to validate it.

Best regards,
Krzysztof

