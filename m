Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 084AD616E5A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 21:11:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230320AbiKBULG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 16:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiKBULG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 16:11:06 -0400
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BD4B1DE
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 13:11:04 -0700 (PDT)
Received: by mail-qk1-x734.google.com with SMTP id f8so12547866qkg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 13:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PUVAtCGY+L5ZZOK2imxO2wh6PqMe7F28+kHnTcIOl7g=;
        b=DwBYnkurDl7pjse/WoKnApGon6wbppx/aI0L7Wv5FtaAM/SwvB5uaY+ZuLmHhTzLbv
         l5n0Lgz86Wiaq6tx0foTyXtUWdgRiDR7eJSakpXbMoZoHP6xQVlaNdc6+FR8XGP6bufs
         MDDWZVq+465WisDvL78NRw5sj97vf3Kz6pyCbK/wj2Zmv3HXwtEXaQJCVHcRyJNwGt/Q
         OA54HQ6vhdU8CGuN/ov+FW4xawusmVvkdFsk3feqbcWBrdIkSkjpZRm9gXIChrwBFPjX
         hAnLXaO4oHHMKP5k8RD9OtB90YXF2XkR7DlqmH9SJ+dLhDiQKoA4+MBbAB5J3frzsAZl
         xXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PUVAtCGY+L5ZZOK2imxO2wh6PqMe7F28+kHnTcIOl7g=;
        b=5F3sc2ww4JWQnQtlyTsF/2ZUvUJoz5gTtyIqJEMnzehmei19m1DJlg4XQOonwVW9Qm
         N14rfRUQupHQEVuMhA6Wz1UzmL57G/sGQrLeaJ4IjdZ9+g5L/8WVGlUFU56cOlUe09P3
         hbqoHlX+HNGo4W5J3PH+JCrcB2ejG5yQybE/uHFCB+U8XBzHzuKJqBaWes+FKEOSKm+/
         1Womf4mlfiwuI6GTKmN0DYXZeG83+IPmMrazxG5sqZ4dbt6NsS7db0mkwcj57j1WJ1FZ
         qUUzsEftvXIaxnRGoXt5iEJsvi7Yrv/p31l0iYfICF8oZ38NUuiagdoUGFukl6HI0E+4
         fdnA==
X-Gm-Message-State: ACrzQf1E3ggVfzQopXFuNVXz3Z0nr38ym2KrRl3zixM7fl65rdh7TpIM
        13jrOtli/IApe/ws11D40WQVgA==
X-Google-Smtp-Source: AMsMyM4kQD6sgPCwQN6KrZN0u+qZwTvWQV5PAY4FU2x51ffz0zDxA1SJpqdvBV1G1A/DXPSWO9GF3A==
X-Received: by 2002:a05:620a:b14:b0:6fa:5e0b:d9fe with SMTP id t20-20020a05620a0b1400b006fa5e0bd9femr3796025qkg.594.1667419863399;
        Wed, 02 Nov 2022 13:11:03 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:28d9:4790:bc16:cc93? ([2601:586:5000:570:28d9:4790:bc16:cc93])
        by smtp.gmail.com with ESMTPSA id w16-20020a05620a425000b006e54251993esm9236040qko.97.2022.11.02.13.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 13:11:03 -0700 (PDT)
Message-ID: <0ad7ab3d-5eb7-b2f0-e75a-40c4743ae8a7@linaro.org>
Date:   Wed, 2 Nov 2022 16:11:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: Add MSM8976 device tree
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221101191659.172416-1-a39.skl@gmail.com>
 <20221101191659.172416-2-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221101191659.172416-2-a39.skl@gmail.com>
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

On 01/11/2022 15:16, Adam Skladowski wrote:
> Add a base DT for MSM8976 SoC.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/msm8976.dtsi | 1310 +++++++++++++++++++++++++
>  1 file changed, 1310 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8976.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8976.dtsi b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> new file mode 100644
> index 0000000000000..c073f16faa7ee
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8976.dtsi
> @@ -0,0 +1,1310 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/* Copyright (c) 2022, The Linux Foundation. All rights reserved. */
> +
> +#include <dt-bindings/clock/qcom,gcc-msm8976.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/thermal/thermal.h>
> +
> +/ {
> +	interrupt-parent = <&intc>;
> +
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	chosen { };
> +
> +	clocks {

You missed here Rob's feedback.

> +		xo_board_clk: xo_board_clk {

And for some reason this got worse from v1...


Best regards,
Krzysztof

