Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1785A5F8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Aug 2022 11:36:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbiH3JgS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Aug 2022 05:36:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231331AbiH3Jfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Aug 2022 05:35:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16561E0954
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:33:32 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b26so3797040ljk.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Aug 2022 02:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=8jLhtnIVjN/sROM6rGUEJSLxhjc41TVh4VC82bHwbSY=;
        b=z13p8nSsHlnc2WlRI3gE1BGc+ZZF+OEOnqIGGnp/9JM+rMpBm5njAyfuLFD6hBGzMK
         83NaOvwJBC/1HbFRiwRka/5Xxe+wqRJDM0oAwH22vBmKEZFI/EeTEfrBMXmTMAzRuuRA
         fqIjWuygbjf+MYU5d07gEEny4azu0sMuewlszqX0Apr/TALpZiGDiJy5p7Dwd4lILeiF
         DKIbKNljhX3dim3EDesV3mCjOIzwnXvq/yyJHHX6KfOsGkRd1QQJZhX1mjE1XU3yKBg+
         AU//NNFT8jsyF1bYGoTvu2kHYFY5aB8BpLrWhrcf7/Sez9rPCXOAsLX900qAGw3Y3u2k
         k5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=8jLhtnIVjN/sROM6rGUEJSLxhjc41TVh4VC82bHwbSY=;
        b=rVU8ABMXZI5EHRdpdGfVtAJlCqSvT5eX+BNZ/Y6mWHozf10bhrvyKUUgRK9F6tDSSM
         LVPys+Bk9/DKIlysKDFDERkqWveIVrokx+pVvueix3X5ZBqBuPne/AB4d8l2oC7W+qaY
         iTrYaLbsN3L3iaZmnOYakOQHsL4cVIBvx24wqGBsUVoASDXtBsTKPoJteXdeCQFS3uHg
         bjtqG0E0qUZeItyvPWiWWYbBgdzPsZx5+OlnSej+xU1w/54GM3vUnnh3xJsQ2/sC7oPe
         ARXA5mRzNmWeBSp2VQfeK06O4CExLeYMeOzRWyK3a3my59IzMDo/5mEKKvhTumESV7Wd
         RQ/A==
X-Gm-Message-State: ACgBeo1gADeadLNM9e92BkkD2cluSYLJn5zxt5W9tSs+y54pVtgNgGWM
        MlDH+RsD5WI/GuQBfgIYl0gmxA==
X-Google-Smtp-Source: AA6agR5rDpXTINB0t6CY1m8qyUHEvTl7b7yra5ZZrgOSbhUtIvb+lpGvcayneP88lZdREf5a7J99Gw==
X-Received: by 2002:a2e:a1c8:0:b0:261:e4e5:1cc3 with SMTP id c8-20020a2ea1c8000000b00261e4e51cc3mr7107767ljm.248.1661852010357;
        Tue, 30 Aug 2022 02:33:30 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id f6-20020a056512360600b0049288e0bd61sm1561420lfs.58.2022.08.30.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 02:33:29 -0700 (PDT)
Message-ID: <74aa8d80-c176-7c8e-e80e-8d8910d10d8c@linaro.org>
Date:   Tue, 30 Aug 2022 12:33:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/1] arm64: dts: qcom: sc7280: Add device tree for
 herobrine evoker
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     mka@chromium.org, dianders@chromium.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20220830053307.3997495-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20220830133300.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220830133300.1.I7dd7a79c4cc5fe91c3feb004473feb3b34b7b2d8@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/08/2022 08:33, Sheng-Liang Pan wrote:
> Add a basic device tree for the herobrine evoker board.
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
> 
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../dts/qcom/sc7280-herobrine-evoker-r0.dts   | 333 ++++++++++++++++++
>  2 files changed, 334 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 1d86a33de528c..59c22ba54a366 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -103,6 +103,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-villager-r0.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-evoker-r0.dtb

Why breaking ordering?

Best regards,
Krzysztof
