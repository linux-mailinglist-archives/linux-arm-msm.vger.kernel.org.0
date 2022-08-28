Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9495A3C49
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Aug 2022 08:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231886AbiH1Gml (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Aug 2022 02:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231496AbiH1Gmk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Aug 2022 02:42:40 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E92452810
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 23:42:39 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id bq23so7188652lfb.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Aug 2022 23:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=sEMNhIcOlVKnYwk7ASfSWk7+WBtIO9W2J7suDApZ3Pc=;
        b=YsJKcrgNsJ8FZQ7PomNNTACGwo9EeISe6ePM9nwiyIrEk90Od/TeUdHvnn/LEHlf5R
         +pwh5ZAVHMrnGll+UcXBI7hleE4DZQxekkJIcYpptmUQ3geAeofrZNexRSLPjiNZWC/r
         A9FRsIa1HLNkJ8gumLSALLwUJX6dCOAF8zD0f9CG/sXDBPspQz335OGiKhme8Tp/05Fw
         Rb02fkHNOzG4nuE644MX7iNqdwTc+WvPHoY6CkcOXLUOC7wlLw3+kM/Ng0TjTjxpp9zD
         TsKY9WJZs0hWkpHvRDQtBdkKlrGCN0Fm8YpfZjoWHUV5WyqfzysrfkXsHaqFupIt3LL8
         cURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=sEMNhIcOlVKnYwk7ASfSWk7+WBtIO9W2J7suDApZ3Pc=;
        b=o2huZmNCABzxkrlgKEyqyZh96sh4dhx2UPunDLblFPp2Gth0HNSKE12ozinYZqsp8c
         Ygbm/ueIv5X5K3oJZTzZoDiYuHI7gIE0LIMIhB10axVtiqW2Hg+1x4klv6cBB8G4Z+lW
         BWVUNdYJKq01Ofqw+Qrn1LvNSGP5xOYugUvjoQ/P7co2hB9KxfH+0F2/0ixxOynFr4a6
         NajNEvKuBcbpAsu1Q/fFenrcFMlL2dX1D47iGclfw3ch13ZoWYZD9NC2SwOv6q0uEMFw
         N1hIjby/KoFgPKup0246Xe1WAgL7GXqqzEeqD3/W9XJfOA254YJ/ucNryZ40qdgjb/nb
         RzuA==
X-Gm-Message-State: ACgBeo1mdIu1UN8PvelOO4qjVQrf1Yl+Z1RjpESFtMWJF61M1lnb4CIQ
        qWdqWJh/oxtN3I/WbQBWIrsxIg==
X-Google-Smtp-Source: AA6agR6bht7J6KntKXSqBDwKtz1RNLoZViW2TULlmvnb7xG1bKZzIqFHj0nHzIjXQETHOb24oI9wEw==
X-Received: by 2002:a19:6b03:0:b0:492:c560:b733 with SMTP id d3-20020a196b03000000b00492c560b733mr4802862lfa.320.1661668957662;
        Sat, 27 Aug 2022 23:42:37 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id b5-20020a056512070500b0048a7ef09b22sm865260lfs.274.2022.08.27.23.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Aug 2022 23:42:37 -0700 (PDT)
Message-ID: <141fe8e3-9075-304c-3d93-151773356054@linaro.org>
Date:   Sun, 28 Aug 2022 09:42:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: pm8350c: Drop PWM reg
 declaration
Content-Language: en-US
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220827145640.3530878-1-bryan.odonoghue@linaro.org>
 <20220827145640.3530878-3-bryan.odonoghue@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220827145640.3530878-3-bryan.odonoghue@linaro.org>
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

On 27/08/2022 17:56, Bryan O'Donoghue wrote:
> The PWM is a part of the SPMI PMIC block and maps several different
> addresses within the SPMI block. It is not accurate to describe as pwm@reg
> as a result.
> 
> Fixes: 5be66d2dc887 ("arm64: dts: qcom: pm8350c: Add pwm support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
