Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E27F5911A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Aug 2022 15:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238994AbiHLNgv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Aug 2022 09:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238988AbiHLNgu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Aug 2022 09:36:50 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE6E9F0CC
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 06:36:48 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id bx38so958191ljb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Aug 2022 06:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=yKajFgqA9LCPMjtPdVJnnC8O+xs2E9xJBgChlA4S+78=;
        b=vXjOFsF0gE+TQeOzNb6csMqf1tmqDsrfApypwXBy6WylaS3lFMowP3OffYL2s9AElJ
         agZB3uUG2pS7lgdIz4kNe8LHX0MQtq1aKdMK/fHAZpSE5DrtPocZ2/6TWgucb9AS5Qbt
         /NPIF6zeqgAPSz92VtLiNgcgOEkcHado30Zs7wAgWJkRetiIHJUhJZvERtwX5Dfp+9fw
         fydjrXW6w3j/CEbOcAeRnC+v+ZxVUxih/BmAju97IFaWi3qan4RXvAN/lx/PQyaX+OR9
         Q2Xm/pUfEw23q84ODaloyXvyn9qBN9ne2wfyA9qAq5+Aj37t3DY6DIDzSeitjNS00kOd
         vuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=yKajFgqA9LCPMjtPdVJnnC8O+xs2E9xJBgChlA4S+78=;
        b=V81c2anq2UwYs5nogSwqaP6FF8w2ruhu9e1zcdWAhRSISaaXOQY0yKZKoiG14zQuVL
         vg2AJunJo1hKdk9A+LgrJVX0YVsyMJ46oR+GyeF4j2Akm+nKoOPzUbr/XFufqd07Spb0
         Zt0iI6xY0dHZDSDuCXYEaQgbO07Xa9bGzjZik4KFensvW2fGfAI6ZhEY4h8hB1SunWhg
         MVAm9hhe7dX5BH0Cig1/5TCDMhRB7OwAOPLEPbR/bWAM36aEe6ce6fMTuyJj9yjmswhO
         8trQddy0PKyC7OqOu+jx4iicKqgStf2UYFBzxYlM5lt8PtI28vT4CLRtaHIWuJnve5QR
         ZKCA==
X-Gm-Message-State: ACgBeo0b/par5byYBnHqhMMXw3BKFqN7Jjb5oeXkWmNUaDHsir0xfAE1
        bfu+okG/QaOYSCrSI2jus2at7g==
X-Google-Smtp-Source: AA6agR5PgU5SgucPEDFTmFEXoayTaIKrClk7PcXY11AbJBNssKpGE2bD62bnRk9ZnenQ+ddczAaqMA==
X-Received: by 2002:a2e:7a1a:0:b0:25e:52fe:952f with SMTP id v26-20020a2e7a1a000000b0025e52fe952fmr1278393ljc.519.1660311406593;
        Fri, 12 Aug 2022 06:36:46 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id bi34-20020a05651c232200b0025debf2a59asm349237ljb.108.2022.08.12.06.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 06:36:46 -0700 (PDT)
Message-ID: <81ae6a31-1f37-a677-f8f8-2340e37d3a63@linaro.org>
Date:   Fri, 12 Aug 2022 16:36:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] arm64: dts: qcom: pm6350: add temp sensor and thermal
 zone config
Content-Language: en-US
To:     Luca Weiss <luca.weiss@fairphone.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220812114421.1195044-1-luca.weiss@fairphone.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812114421.1195044-1-luca.weiss@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/08/2022 14:44, Luca Weiss wrote:
> Add temp-alarm device tree node and a default configuration for the
> corresponding thermal zone for this PMIC. Temperatures are based on
> downstream values.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> With this config I'm getting this in dmesg, not sure if it's a warning
> that should be solved or just an informative warning.
> 
> [    0.268256] spmi-temp-alarm c440000.spmi:pmic@0:temp-alarm@2400: No ADC is configured and critical temperature is above the maximum stage 2 threshold of 140 C! Configuring stage 2 shutdown at 140 C.
> 
> As far as I can tell, based on downstream dts this PMIC doesn't have an
> ADC.

You configure 145 and driver believes 140 is the limit, so it seems
warning should be addressed.

From where did you get 145 degrees as limit? Downstream DTS?

Best regards,
Krzysztof
