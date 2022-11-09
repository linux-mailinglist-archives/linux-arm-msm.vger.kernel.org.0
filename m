Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30FB16228DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 11:46:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231224AbiKIKq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 05:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbiKIKq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 05:46:28 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63EA2497A
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 02:46:26 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id b9so25132721ljr.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 02:46:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SyydfT4fMrnMvYOxyiJE2t1fY7f34HXR/oj1c9VLQPc=;
        b=qIstpF0aFrE2EjEDM3IJeWQsd12WpA9VyOFsO3iO1CEPR0BQwDCgvTIPf99sM9DpWg
         Hbm7SA7jwGfjMkBPq3+pgdg7mmuA4c5VBghDG0M8dgc9Sz3i3vPEmJhQ9aEddje0sVHU
         J2lFN3WvAtesGurVIfUbLzpcOZrRTpeIzCU9bsJkRZsZmlWnCRKT4gW+AUkjQ5QC/SCq
         vgkoZPXi88U1ljKa8MgMOc2ftpU+5oPUPBmEZhOB5ZQwmYw6/YRdvGzRyyxkhbzez5h+
         VGxijFtry0YQ/JFjymrnwhEs3vQukF+ec+XGzhWaYsMv+vsRz5HBeGKaLcMb8gA7tPUe
         rsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SyydfT4fMrnMvYOxyiJE2t1fY7f34HXR/oj1c9VLQPc=;
        b=IIBQVxi/yDFMdlZg5PDK1uzTluHBUvZEjtCMD3phVmCCC9mQIwkPF4ZiaCzkHow8pc
         We711d2O8hQpUA5AryCC2h4VTo8Zl7ErVsca+GPOWdnyyCdkG4f4Zh0yKDqtDo13ySUb
         fMrWwV5L0FX176htwfUE/nWoqs1Yp6PKQzvuFmPAVxW/rzNIO8g7VFgi+iGUWmiecroX
         tEphRibgD2rzcqU7b8GwlQyp2iCksxGrwohUjtFrh/6jIc503Fv8upSDmkReG5ThI6nC
         l8YdfPNcVnl6OtIua/EwNcIigTZt9yAKRsnctl3hOXIBUOgda3n8s9YejRqzJLZVAqtK
         6CxA==
X-Gm-Message-State: ACrzQf31ZWnsp+JbkX+YqjNIVv0GqzTTk731s6+DBEaRfZ6uug8I/7BR
        gYOjzPDAy4TZ7gjSRtHsUEmHgA==
X-Google-Smtp-Source: AMsMyM5Jipz3tLiBVYGUtjX/K7dv4tEsfxFVL9tH6qCDxKUJgoQaD4lZ7qCmCnaa9061Hlf1pD1+TA==
X-Received: by 2002:a2e:1f01:0:b0:25f:ea3a:4ef0 with SMTP id f1-20020a2e1f01000000b0025fea3a4ef0mr19802628ljf.330.1667990785259;
        Wed, 09 Nov 2022 02:46:25 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id q24-20020a056512211800b0048af9576d30sm2166616lfr.83.2022.11.09.02.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 02:46:24 -0800 (PST)
Message-ID: <3389254c-0161-f95c-2996-364cb607c6f3@linaro.org>
Date:   Wed, 9 Nov 2022 11:46:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] arm64: dts: qcom: msm8916: align TLMM pin
 configuration with DT schema
Content-Language: en-US
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221109104402.45592-1-krzysztof.kozlowski@linaro.org>
 <20221109104402.45592-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221109104402.45592-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/11/2022 11:44, Krzysztof Kozlowski wrote:
> DT schema expects TLMM pin configuration nodes to be named with
> '-state' suffix and their optional children with '-pins' suffix.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Ignore please.

Best regards,
Krzysztof

