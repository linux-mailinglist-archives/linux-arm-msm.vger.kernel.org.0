Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E52E55811A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Jul 2022 13:09:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbiGZLJ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 26 Jul 2022 07:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbiGZLJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 26 Jul 2022 07:09:56 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB11B2F66D
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:09:55 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id b34so10916884ljr.7
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Jul 2022 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tC0Z50CsCZnh42CS5oUdYTqJdIKgbYv40oo/KzJkVjM=;
        b=HyR6sjNs1Bey1wg6zwissAhXgYNjjhCNGqwj7RA52YboIdJ0UeVfyDakEN/slp8TR8
         U5mBRKtXbpwh7sExD3XjpSO224m4scXU3UZUU7hkwdFYRN/1FNWeWqD/CG3c3EfpA7iB
         3BO+WVVu8wTZksBaJc8m90H/ocFRSbLhxEOc3Nalyb9ZxI1KOHrrWArCZOiwtM4UaHji
         PNbiwTWSfqqE+dsbD0FtKQafVUO5LydmfBDUXKvq3u58crz8f26dRr1OIf/UulP5PJvB
         E86ZTWE/adMIkYn2xh5+2aEeTBWnclMp/ae6XMS+8l4+VNbyboKPV6Spe8Oafr0v1HbR
         mz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tC0Z50CsCZnh42CS5oUdYTqJdIKgbYv40oo/KzJkVjM=;
        b=6FARAPIPcFMQccH2KHqao1pWjs9kvjzkQrynI/+yCsqEpC2m0cOLiGa0vL6HpM0Te2
         Fd4JXm/1XB8Tt2HDNfepvPZX5J7ogSJFBa19AFp7M5gOqq7yiy4mkfwaYUUd/pq8Vn8o
         o1YnTbVhOfWBn9R0aW3bnu3XNws8X6MDdA8kbDA+RDOM2NUPoiHjOH791a/2BycjyP1e
         rqS8RyrPi5jCUZOfllzGJyuP2VmmKzvh19OaUIWYAuS/iBAPhxudcUcqA/wNAftF4Jtj
         y6semwaeyCo3XupvcvvHgtEX6rRJdZQowxd1hbXec6E2XYRN5IN8z3wret80si+RUeDQ
         WalQ==
X-Gm-Message-State: AJIora9ce++mQPh0N7lYeFjN0uhpeJ2oiQFVBlac6RAJDD3YUASlY9Sm
        UaGl9uM5BjTJdajKZ4akrykJxhDh6C/MiO26
X-Google-Smtp-Source: AGRyM1ugIu3ck4Ni3v+Anl9ylXUNmokEld1ML51iJeUk/EVsUe4ucguPXefGINiXb46bw0wM1LpiZA==
X-Received: by 2002:a05:651c:1250:b0:25e:954:97b8 with SMTP id h16-20020a05651c125000b0025e095497b8mr2912150ljh.215.1658833794039;
        Tue, 26 Jul 2022 04:09:54 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id i17-20020a2ea231000000b0025a67779931sm3064408ljm.57.2022.07.26.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 04:09:53 -0700 (PDT)
Message-ID: <ac66e403-f0b4-de19-cafb-9b87ee37f0de@linaro.org>
Date:   Tue, 26 Jul 2022 13:09:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/7] arm64: dts: qcom: msm8996: Add MSM8996 Pro support
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
References: <20220724140421.1933004-1-dmitry.baryshkov@linaro.org>
 <20220724140421.1933004-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220724140421.1933004-3-dmitry.baryshkov@linaro.org>
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

On 24/07/2022 16:04, Dmitry Baryshkov wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Qualcomm MSM8996 Pro is a variant of MSM8996 with higher frequencies
> supported both on CPU and GPU. There are other minor hardware
> differencies in the CPU and GPU regulators and bus fabrics.
> 
> However this results in significant differences between 8996 and 8996
> Pro CPU OPP tables. Judging from msm-3.18 there are only few common
> frequencies supported by both msm8996 and msm8996pro. Rather than
> hacking the tables for msm8996, split msm8996pro support into a separate
> file. Later this would allow having additional customizations for the
> CBF, CPR, retulators, etc.
> 
> Fixes: 90173a954a22 ("arm64: dts: qcom: msm8996: Add CPU opps")
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> [DB: Realigned supported-hw to keep compat with current cpufreq driver]
> [DB: dropped all non-CPU-OPP changes]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8996.dtsi    |  82 +++----
>  arch/arm64/boot/dts/qcom/msm8996pro.dtsi | 266 +++++++++++++++++++++++
>  2 files changed, 307 insertions(+), 41 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8996pro.dtsi
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
