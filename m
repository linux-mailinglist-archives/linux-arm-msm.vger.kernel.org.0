Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59BF1631CA8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 10:17:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiKUJRj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 04:17:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiKUJRh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 04:17:37 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CAF1A10549
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 01:17:34 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id g7so17905178lfv.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 01:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gp3IGQii0onhRL32oSXRirQKRZGP56ycvUwqVetzvJk=;
        b=W7/yQJgKbgEBDNGZP5YnMsgAucSIFk+F52Jx3LtQT9CEjypia/W8cLn/B3UeisZ9+8
         X3gSXq5mqqb3ubWs7BTXKKMdLuWuHpIQQdd7GDZS1M/04wRpSVLW5ers+KoDiHlyFluw
         GjAvVWCUV1wUcBS87XEImJR2P3XauCuuFt6qy7M52IIyLITR5rJhm1dDg/kejIM7MrSS
         mnsLnuMTFdTaEWLrb9rxTaeDBtmdXHoTDy3zF6DK0nXyINzvx/3vVLVaffnuFehEIRK6
         rjgbB3Of6WZEo8Z3+JvChdHjkIgIAtgH3/tdHzirQr14gEEYvnu3kBXXR8NF58yQ+qK2
         b2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gp3IGQii0onhRL32oSXRirQKRZGP56ycvUwqVetzvJk=;
        b=bSs7AmTPQrEBMaVDjIAmEdIitDCaz9XvA6WuJbSCdAj2kBOWeFK7jsqptEJRjdJDUz
         Qxul3u4RiAc+C2ZCsE3EzUdEoxHBSYgC3Jivn66bTqL5r3VYPnG4cWWENlpKizAsrotM
         U3Sf3CwzcyMYcg5qIcz43wP7jdH2E5XyGL3SxF/NjBMTdaZ+Y6ElwQcUCFsxHy3Bv7rg
         uG1fS+soC2EwGIGy8cO+wpScIJpGDJjkjcIsdADwN+5ogHl/h0oycYG0vFWDdYee70Ei
         G0hwdLo4aqkivBp5mFC6duDfF4Hug3UOvOs2BMwTeTH+681AaIrKkvmD32e+wa0i5MBT
         4EIQ==
X-Gm-Message-State: ANoB5pnhfsViZwff8eErioGysQN/F4WJBoGvtuKMGfipDQzqzhOJpyQW
        CNQm3VjfNYfgEHy35bks2i3R5A==
X-Google-Smtp-Source: AA0mqf5bbnEZuHv78qjWTwLGBDg6Qq+Vo3r0YRqJiT630QzBxJCJw90RmdR2tYAw/9HhA67ArtRz2w==
X-Received: by 2002:a19:3818:0:b0:4a2:4e8f:746 with SMTP id f24-20020a193818000000b004a24e8f0746mr594170lfa.528.1669022253207;
        Mon, 21 Nov 2022 01:17:33 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f10-20020a056512360a00b004aa0870b5e5sm1935424lfs.147.2022.11.21.01.17.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:17:32 -0800 (PST)
Message-ID: <e2c1d1a1-ea82-d225-1503-648e56fcd14e@linaro.org>
Date:   Mon, 21 Nov 2022 10:17:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/3] dt-bindings: qcom: Document bindings for new
 msm8916-acer-a7-724 device
Content-Language: en-US
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20221119194340.91789-1-linmengbo0689@protonmail.com>
 <20221119194709.91998-1-linmengbo0689@protonmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221119194709.91998-1-linmengbo0689@protonmail.com>
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

On 19/11/2022 20:48, Lin, Meng-Bo wrote:
> Document the new acer,a1-724 device tree bindings used in its device tree.
> 
> Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>

Same comments as for your other binding patch

Best regards,
Krzysztof

