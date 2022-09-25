Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72D9C5E92D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 13:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbiIYLye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 07:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiIYLyd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 07:54:33 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A802D76D
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:54:29 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id l12so4659183ljg.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 04:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Q46V3bJGY5zK2gbUyWGrQRsMlQhZzKF53118KkxntJ8=;
        b=n5CpgP2J1Z1DA5Itg2vYm43fttQpqbE/BycyCWdr1poja6mSAQfBJUaN7s1j5xR31j
         k494Hkw1628M3V4SKcYP2Z4KZUkrRPvnHUt4XVgXAtwjxjZPEriBxFd1TUEWPcnUmLzY
         zZun2J6E7Hl6iOp3rl8RiozOqiNHUbVyyGaUnKK1vOISsHj4e8/+LU+8l3+2gjyIFEB9
         2bQAozw+iVeIf+Mic47g7u9aD4ks0Z0suwOkZ4fAoqTQhm9TZXB78zlHszHagl4Rlb4K
         Anns1kkb2TyG19FTg1PbA8PmJy+izOLmYe0VPigHtjmv5uYZaSHtijZh6dKYjWcTGVT2
         dtXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Q46V3bJGY5zK2gbUyWGrQRsMlQhZzKF53118KkxntJ8=;
        b=e1xQCydK1MlRlK2WmFTN0sOUTpriiqW6kmZB6b/Qo8ccmRfSjUAba2hPmvC5zWq11Z
         z7eY7nmPdlz4mlM0dMGSjCt4g5H2rbw4UWo0tex/MD4CnxrjF/6oVVtnAVKUtFglGmbp
         7CqVQUQRdt6ej1hp96pqWj6/8+pmtTsRdBfJ8KjeJEvKILWQFE+PQlcnj9GfTIvjB03M
         KaLfena/6G2y2zoaWAywtH+nLsjoI/lLnMunCG+8QFvgGo6FXGCN+uOz9gDhnP5WMECh
         qFsB6r8jlNZ5QFs7SJG7EJyseIa7ESH0Op9LRL6E8kNprO3raJNaSI0utEjXGppYAE/t
         6bAg==
X-Gm-Message-State: ACrzQf2QRrZbclV/fR8KKByLcSiXPnmpkUJkAx5qoijBVGLEdc48fhMB
        HJch2OzqzZyqkGJK34cfPB4wfw==
X-Google-Smtp-Source: AMsMyM5XLWU55ymLsZdVdphhQDPQJN/T6CnftbdVvYYEq2iLQstLu/xbqjofALcr2z8IxLxOviUD9Q==
X-Received: by 2002:a05:651c:211:b0:26b:e743:b4b0 with SMTP id y17-20020a05651c021100b0026be743b4b0mr5919239ljn.527.1664106867404;
        Sun, 25 Sep 2022 04:54:27 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k20-20020a2eb754000000b0026c64fd8f0csm2015407ljo.71.2022.09.25.04.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 04:54:26 -0700 (PDT)
Message-ID: <441153f6-26ee-cbb2-fe42-101de91952c5@linaro.org>
Date:   Sun, 25 Sep 2022 13:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] pinctrl: qcom: restrict drivers per ARM/ARM64
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220925112103.148836-1-krzysztof.kozlowski@linaro.org>
 <08E290AD-C842-4BF2-9C57-2CE59A4C5D88@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <08E290AD-C842-4BF2-9C57-2CE59A4C5D88@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 13:43, Dmitry Baryshkov wrote:
> 
> 
> On 25 September 2022 14:21:03 GMT+03:00, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>> There is no point to allow selecting pin-controller drivers for Qualcomm
>> ARMv7 SoCs when building ARM64 kernel, and vice versa.  This makes
>> kernel configuration more difficult as many do not remember the Qualcomm
>> SoCs.  There won't be a single image for ARMv7 and ARMv8/9 SoCs, so no
>> features/options are lost.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> I haven't checked which restrictions apply to msm8916 at this moment, but it might be worth adding 'depends on ARM || ARM64 || COMPILE_TEST'

This is limited by ARCH_QCOM (top-level if in the file), so I am not
sure what would be benefits.

Best regards,
Krzysztof

