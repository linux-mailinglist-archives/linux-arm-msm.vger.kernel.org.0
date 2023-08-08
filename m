Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 031917741C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:28:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbjHHR2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234622AbjHHR1q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:27:46 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E77920D00
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:11:58 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-98377c5d53eso808014966b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511072; x=1692115872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SQTPnoKiIFHGykdzh3Jg/xVXffznXdQisKSdG+HDZEk=;
        b=UY+tMYPPaPbmoC1eP8biGMO+E7XNPbqkwfRZgB9XTgWGH6hVXvULUmcaKqC7RHSZ+j
         Lzr/5VVtvRxRXrhISu7ImbFJhTa9Cj92vkOvCQCf8XtA0k4gRyxK8GKIxle7jZTqv9rT
         ExWjYlxagbvpwf+NBaQktBwdiRNyeA/yHOLfzDkGc5OcLtEiaJgSfl3MMMIyXdS0ovZh
         pv+FIo+s1TwBUom53oDs4eKTvRkHxe0/UZnccGayHwiakO7y/vOxRWHz8Ut45il/sqkG
         wXB9Fc2V4HipuI19W/JPfX5nSTAp771Q+ek38hM6YfXEUfO+KNyVCwfI/8tKulM/CC5M
         3yTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511072; x=1692115872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQTPnoKiIFHGykdzh3Jg/xVXffznXdQisKSdG+HDZEk=;
        b=bvT0mUbOMTGi2uIRUhyLlJsRQM6dZYLWBHDcuGZFh7hp6hkeeYIUC86d0bOTXRStIj
         cHARrYoGw9BSWH25SV5ybdsBlb09Bx318eIEwiNvGkXM1no1D12a4tXhg6wsnwEuTLM/
         3d0/cZyROZTtJiJNdgsXOwywU9/j6/ZNe/hbZCT/wOaOip+lEkEZbvrObnaEn+9NlpvS
         OYaM9QxkkEXmSnD54WpFQwycq0IHjiJ+vtbxpl8bj59Sw1FnP0tyB6vLhDen4eAO/AIf
         CZxZXYUAa87cE3vCWBD0hFHrQc//NC+wGCyRn9cX+K1GJ05DDjFQ/Ae7cX1/HBGY2QMJ
         HN6A==
X-Gm-Message-State: AOJu0Yx8BN3872G2eTEwMQc/rovk5fvi2Kvbe0w2bY2Wh9Zkw5UP9OV4
        LjS+FZjHRpzZzBtUm0Cx1tSy7Q==
X-Google-Smtp-Source: AGHT+IEMsESLGQkXQx+kpgO+wxI+wDiplVtQniuxW5Cvb6B2vzZsyVQqK7MvxwG7hiy813KQia7yyA==
X-Received: by 2002:a17:906:5350:b0:993:eef2:5d59 with SMTP id j16-20020a170906535000b00993eef25d59mr83612ejo.0.1691511072541;
        Tue, 08 Aug 2023 09:11:12 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id rk22-20020a170907215600b00982a92a849asm6884385ejb.91.2023.08.08.09.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 09:11:12 -0700 (PDT)
Message-ID: <0c444142-3623-fa15-4bf6-df57d9804fdf@linaro.org>
Date:   Tue, 8 Aug 2023 18:11:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add board id for lazor/limozeen
Content-Language: en-US
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20230802095753.13644-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230802175628.3.Ie77732a87ab53d21bac47db309b75a796fa19337@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230802175628.3.Ie77732a87ab53d21bac47db309b75a796fa19337@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/08/2023 11:57, Sheng-Liang Pan wrote:
> add BRD_ID(0, Z, 0) = 10 for new board with ALC5682i-VS
> 
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
> ---
> 
>  arch/arm64/boot/dts/qcom/Makefile             |  5 ++
>  ...sc7180-trogdor-lazor-limozeen-nots-r10.dts | 39 +++++++++++++
>  .../sc7180-trogdor-lazor-limozeen-nots-r9.dts |  4 +-
>  .../sc7180-trogdor-lazor-limozeen-r10.dts     | 55 +++++++++++++++++++
>  .../qcom/sc7180-trogdor-lazor-limozeen-r9.dts |  4 +-
>  .../dts/qcom/sc7180-trogdor-lazor-r10-kb.dts  | 33 +++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r10-lte.dts | 37 +++++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r10.dts     | 29 ++++++++++
>  .../dts/qcom/sc7180-trogdor-lazor-r9-kb.dts   |  4 +-
>  .../dts/qcom/sc7180-trogdor-lazor-r9-lte.dts  |  4 +-
>  .../boot/dts/qcom/sc7180-trogdor-lazor-r9.dts |  4 +-
>  11 files changed, 208 insertions(+), 10 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r10.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-kb.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r10.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 337abc4ceb17..73e745fb1ff0 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -109,11 +109,16 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r9.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r9-kb.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r9-lte.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r10.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r10-kb.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r10-lte.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r4.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r9.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-r10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r4.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r5.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r9.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-limozeen-nots-r10.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pazquel-lte-parade.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pazquel-lte-ti.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pazquel-parade.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
> new file mode 100644
> index 000000000000..63602feceea6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r10.dts
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Google Lazor Limozeen board device tree source
> + *
> + * Copyright 2021 Google LLC.
> + */
> +
> +/dts-v1/;
> +
> +#include "sc7180.dtsi"
> +#include "sc7180-trogdor-parade-ps8640.dtsi"
> +#include "sc7180-trogdor-lazor.dtsi"
> +#include "sc7180-trogdor-lte-sku.dtsi"
> +
> +/ {
> +	model = "Google Lazor Limozeen without Touchscreen (rev10+, rt5682s)";
> +	compatible = "google,lazor-sku6", "google,lazor-sku18", "qcom,sc7180";
> +};
> +
> +/delete-node/&ap_ts;
> +
> +&panel {
> +	compatible = "edp-panel";
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +};
> +
> +&alc5682 {
> +	compatible = "realtek,rt5682s";
> +	realtek,dmic1-clk-pin = <2>;
> +	realtek,dmic-clk-rate-hz = <2048000>;
> +};
> +
> +&sound {

Overrides are ordered by name.

Best regards,
Krzysztof

