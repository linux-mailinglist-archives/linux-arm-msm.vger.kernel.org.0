Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EFF367C897
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jan 2023 11:31:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbjAZKbf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Jan 2023 05:31:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbjAZKbe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Jan 2023 05:31:34 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5D734015
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 02:31:33 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id q8so801437wmo.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jan 2023 02:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w5KI1HfwZehVRZCGq9eIEmT6FtE92VCThGr2hKIL1AU=;
        b=RpcROijhZnixVsRVbtQU7mzqkw6dLIHWg8jcS2pTsxhoIM/nM3CaAheXllwTzvmgLa
         YV3+iZ8GgBj5rnsJvC4dL0ZaZi+mcipvxWVHj4v3N2nT0/vQrXWwVf4g50EcPPdku6gt
         JFxr/oXyOb2YFyjenshWTrvIhUIjLQ83h3c5td/ptSdB4l9fvdHoStWGQxohjf25tzVf
         km9DUcvSzZKxovAsrH2S7UTn8Loto1GxAamJpBtoOmp8B8n/r+EbWWFuHNBU8cinb6gH
         N4wQDVkdQqE6GUKD2UcMGog4fsF8ZjO+Z0+PLfe10DxqFgnh/Qi0MLr5QVWeUQifsa3T
         kT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w5KI1HfwZehVRZCGq9eIEmT6FtE92VCThGr2hKIL1AU=;
        b=xtyaN8wy3C/7qhGaH9zf1JUOMezauUkzf3KbeYJn+EwiGpLPwyhfHacTodShOgtl6n
         jxK3iQkdAIKvIgABnSmaN6NOv6wA6b8QOpoiNrdAFbShCHPYG40n3x8cTSi7wSVc+SO9
         x20KatsDQIN5ZlaDtbM+V43uKeQqaSx4I/mI6lYBWf2LGWCnSdU72OJYQ2hb0fGpkhkT
         ex5o/WqSPrkhjqivPlyWhawlsU1WKSXKYfgVgYZBMucV8kIgx2gU2z7z3436CSF9U0/I
         e5vBhtWREeidfTHtrDsHku+Ipwk9mVD/5jB9WO8pmkfj260R1x7Gt14CGYO601QRrRgs
         wPdA==
X-Gm-Message-State: AFqh2ko4zwGyQdsDh0QFKUjmQTvSnL4ucOY7cb1xB9rV46i7c+TlfnL4
        aezldr9bexS8OB4rLJVgAJWNvg==
X-Google-Smtp-Source: AMrXdXtg5Jkxnnjlzoz4W7gv8azVosHtM4Vq45Cb7Q+R/cBkuLpo8hAksiaeq5bunaf/ycP/7TddiQ==
X-Received: by 2002:a05:600c:4a27:b0:3da:fae5:7e2f with SMTP id c39-20020a05600c4a2700b003dafae57e2fmr34777603wmp.3.1674729091567;
        Thu, 26 Jan 2023 02:31:31 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i21-20020a1c5415000000b003dc23574bf4sm1088415wmb.7.2023.01.26.02.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 02:31:31 -0800 (PST)
Message-ID: <98938065-2678-bf0e-26fd-3ac8302431b4@linaro.org>
Date:   Thu, 26 Jan 2023 11:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [GIT PULL] pinctrl: dt-bindings: qcom: bindings for v6.3
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20230120174631.353345-1-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120174631.353345-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20/01/2023 18:46, Krzysztof Kozlowski wrote:
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:
> 
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/qcom-pinctrl-6.3
> 
> for you to fetch changes up to 5b8c304c94d79f44aea8ee273ce70ca380804156:
> 
>   dt-bindings: pinctrl: qcom,pmic-mpp: Rename "mpp" child node names to "-pins$" (2023-01-20 18:43:06 +0100)
> 
> ----------------------------------------------------------------
> Qualcomm pinctrl Devicetree bindings changes for v6.3
> 
> Set of cleanups and fixes for Qualcomm pin controller bindings, to match
> existing DTS and correct the schema.

Hi Linus,

Just reminding about this pull so it won't get lost.

Best regards,
Krzysztof

