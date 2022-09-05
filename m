Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3AAA5AD678
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Sep 2022 17:29:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238840AbiIEP0W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Sep 2022 11:26:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238838AbiIEPZa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Sep 2022 11:25:30 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 955701A81C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Sep 2022 08:25:27 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u18so1272684lfo.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Sep 2022 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Ru2tm0kR2vepgKH9ZiwFYlO66rNm/idkjsmEouaw8r4=;
        b=DrRv2fdA4zL0soru/dqFPu4kpj1RC001i6+7oEI+1i+uwykJRltb8bksiCtN7mmLSz
         lSgHWvAHp8CHB5CPo9hVMpUs/8WvU0Rk4D4wvejT1+c7zKh4LRgvWQ1RBTTGlJYTSn+O
         dUz9fB644+b71pSmoU02k2dCGTALo86BMJuFgapjo6jSXGo73LQ4RV7r64ekyil+UTRR
         11oOiLbb8MVFwcVwJxptRJtEavsSb0rd7BuFFK/fzGAArUG8A2uopDHtdJ1ocrGHaHni
         n7Sx22VHN+HmddeT3tPNSSDfge40ht/jtytYKmqUua+pg/snVqzEy2ZG48iVIaSw4VKE
         5LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Ru2tm0kR2vepgKH9ZiwFYlO66rNm/idkjsmEouaw8r4=;
        b=DjSLAKqjK2su2muvq63PdER2s+kgmvqNzTjyyQq0cfBtgM8HaD5th2dxnwjeXIjh4p
         3GltUoaYIC70KW4+eWtALdVeGEaHu87h8cNX1VWdLHC+7WQQPJ4H7ftaFIhWSJZlQN+d
         1kqPexO9UwdUYtAn+NPsScg1b5nHOx1vjIVsA68WJT+HtbpDwzm5nMlUyANw7fuLowGA
         UHRW4S00j7qHXdQ0hOs+ZeNZndsmxho6tbW5KFzJ4zAGWbQQEn2r984PRSmBCc3GQ1qq
         xj92fJhBsKyX0l0U0L50jjlRqeYaMxUwOLHA4TQlE6R0P1Fq0li3Qcyn5x9gnqnqKirl
         2v/A==
X-Gm-Message-State: ACgBeo2It+HRnpAuM69+PmNb7vsgOxyYreU8RkGfQ2uzpNxgIH1EZK/Q
        0Y445wpKQRgFWiV2TfBUFgyZ/Q==
X-Google-Smtp-Source: AA6agR5nqGKZs+z06gFJ2UgHftc7LK7SI1PEvyJdKVU8PMrCm/BawFxKQK4aUL0Hu46ivneflP7Ynw==
X-Received: by 2002:a05:6512:b86:b0:494:abaa:c10d with SMTP id b6-20020a0565120b8600b00494abaac10dmr4712919lfv.108.1662391525924;
        Mon, 05 Sep 2022 08:25:25 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id n20-20020ac242d4000000b00494813c689dsm1216325lfl.219.2022.09.05.08.25.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 08:25:25 -0700 (PDT)
Message-ID: <55bedc10-5c81-c39f-7ab1-58d4cb438c46@linaro.org>
Date:   Mon, 5 Sep 2022 17:25:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RFT PATCH v3 01/16] dt-bindings: mfd: qcom,tcsr: add several
 devices
Content-Language: en-US
To:     Lee Jones <lee@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220819083209.50844-1-krzysztof.kozlowski@linaro.org>
 <20220819083209.50844-2-krzysztof.kozlowski@linaro.org>
 <YxYSfbpINDvDffGQ@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <YxYSfbpINDvDffGQ@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/09/2022 17:15, Lee Jones wrote:
> On Fri, 19 Aug 2022, Krzysztof Kozlowski wrote:
> 
>> Document existing (MSM8996, SC7280) and new compatibles for TCSR syscon
>> registers (QCS404, SC7180, SDM630, SDM845, SM8150, MSM8998).
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> What does RFT mean?

Request For Test, but I should be more specific: testing is welcomed for
DTS. Bindings were tested by me, but I just used one git format-patch
command.

I don't see blockers for this patch and Bjorn took DTS already.

Best regards,
Krzysztof
