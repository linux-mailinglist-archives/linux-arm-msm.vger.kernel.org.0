Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 67E055ED711
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 10:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbiI1IEB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 04:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbiI1ID7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 04:03:59 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D0F1F0CEF
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:03:56 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id a10so13531608ljq.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Q+qofBWz+0h5soM+cd3c8OecdVeByx6iP98hMMfm5A4=;
        b=HhfGtaRfPvI7Dp1xpn3/+YngA18bQcoG3SFzdfeNjwcOJHDTBtAvjGhZr28Poy0tZA
         Rct7Xu4/1NNPcm8splB+XjEIlqJMr4sEt1NKMAHv+ZkkxPUcrMMJaZFc04F1Vk77ZfqN
         VkUd6rWMK4kdx6sn3H/U4+3wK/A6btmUBhy4rNKFbdndOtH3mjsD4vnFrZtbpvWt+Aww
         q1nlC/zkiLLVEFzWfCKxt+fXK/ho+JHgikNCu6m6TzcThfD+sJFQ3AZTBWCyXItNjith
         BU2Rgce8ukThlBdz0+Rp5/tcjDs5Q+YCrNbd5wBVM7qOnPGDv7H3GJ2isq4iCOimbDF5
         z4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Q+qofBWz+0h5soM+cd3c8OecdVeByx6iP98hMMfm5A4=;
        b=QXjUhx6KQeLM1ipGOAGbhpSfF29HY/KXkaSwbcK2mkRLmBNIBtmz4ch24xGOyjdLdT
         3JOOpZPVIxlQHD7HhC68iyOHl9tI+/aj761RkkpXBun/x6WU2gVabk9SRe8444cTYpDY
         nnytbT9c/l8aEWyWr/1VZ1PXBG556Rl6Rv12P1TmBcOCC5A8ILdd7HZYSt+LYvASGfPw
         656dcO90EyigzhhKR8rjnsiJ6Q7SLMJ+1ejGAB15aIoqprMTiBsHbykoGCRGc8u5b5NA
         MyFWvEQyTcTXhBy3q2LmLE0MoR5N4Dk4Z/qq4WeLlT5H4OYgfwbmaaXSVYAYH2JLgAZX
         x51Q==
X-Gm-Message-State: ACrzQf1gwobqwzd9MgJRFSUQrYKpR79YZarjjp7q1f/K7qqZPT/rpD97
        SqYopKqoOch4uu9WPUNNOXpSYw==
X-Google-Smtp-Source: AMsMyM43muVNeouI1iLWWmLpqW44zuLJ5rJoFJcAuiE0Ujmpx6tu8yA3J+wdDcCX2zYO9CD60p2wEw==
X-Received: by 2002:a2e:a602:0:b0:264:5132:f59 with SMTP id v2-20020a2ea602000000b0026451320f59mr11699153ljp.0.1664352235096;
        Wed, 28 Sep 2022 01:03:55 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b004a100c21eaesm403424lft.97.2022.09.28.01.03.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 01:03:54 -0700 (PDT)
Message-ID: <44bbb266-bb31-e036-ee37-ec52c33ef0a1@linaro.org>
Date:   Wed, 28 Sep 2022 10:03:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: cp01-c1: remove bootargs-append
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927201415.1265191-1-robimarko@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220927201415.1265191-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/09/2022 22:14, Robert Marko wrote:
> bootargs-append is a leftover from the vendor SDK, and does not exist
> in the mainline kernel at all, so remove it.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

