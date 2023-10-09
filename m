Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CC347BECB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 23:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378745AbjJIVRh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 17:17:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378761AbjJIVR2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 17:17:28 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61D2D6B
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 14:16:05 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c12ae20a5cso56866941fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 14:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696886164; x=1697490964; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QJllRkKfyLXLeIPvgYtOO8kIRJqQX9SQuociu6Txv4=;
        b=tjoCHSwboFvojO7WJ9P1KtKgXXEuu9Dd34hrx1QXPIA8Fo+l4FB/y5dmuUh8XstT/a
         pOV4JXPtqYAOyD469G5YFLIOinw9/BvzVi45xIELPwUVv2NV25A8LoFHpbKzhC8kbYW6
         B7GhTGJ1seWdKzIAUAc4FzPTfxLqll6wCLq2MpEOf/4Jagt9jyF3q5PzB8qxgxsWqbHY
         DQKpQY2Wk2yncLT1D17QxMwvU9VxsGWzu0bGJqmrXLpgDzFM6Cz26CjCLZkiZzdfrSlX
         I0z0aFBB1j8gY2UHhRa8ub29yYl71FGY6ARejw69jejupeeJg9bUkz7Soiqe5UXnQ/pD
         Cf+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696886164; x=1697490964;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1QJllRkKfyLXLeIPvgYtOO8kIRJqQX9SQuociu6Txv4=;
        b=EQ8gKGlFeBRaTBvRsSdRcp0ga8uiyJu47y0krkoqqXbjd2khOlYbwKv/m7SQOO2G5R
         mWedYpJPj3ffShKh31lTTBQgAyMOxm2xBqWA4Km0MLWHBU4fjJ8a48+k0G9nx6l1rHcf
         lVxKB1/SP9IY3NVddLyngWnfcAb5y5nfT31OXxu6XhGMgGJoWFBVa5HzvoYEo6/xXbWD
         nDjNUEienuZ4qO4FELnoI+r39PIUhgjPwmuMZ5T6rBzphznjd08u3QFgzn0GdzwhFCKK
         MQLlzgczUhXR6Gu1VZHekM56KKUnAvkDQNPeQqMDbZNDxrYYsLVK0nOEXABCoGC5IO64
         fb+g==
X-Gm-Message-State: AOJu0YwfF85PuYj3BOJ4rk7kjVlav1nW5pMe6AxbM4YwhbgMbjTAj0bN
        jNyVjDoU8cwOh/s3GLwJoDrcVg==
X-Google-Smtp-Source: AGHT+IFI+Nis6dD7nYVGj7SaBgIGgfknIUViG8EGepXxTPbJSHP5l8mwxp1h9hfC4Uz41QB9vPjQjQ==
X-Received: by 2002:a2e:9794:0:b0:2b9:e1dd:5756 with SMTP id y20-20020a2e9794000000b002b9e1dd5756mr14413302lji.45.1696886164263;
        Mon, 09 Oct 2023 14:16:04 -0700 (PDT)
Received: from [172.30.204.90] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n10-20020a2e86ca000000b002c029a4b681sm2175771ljj.15.2023.10.09.14.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Oct 2023 14:16:03 -0700 (PDT)
Message-ID: <c72cb819-ffdb-4f6a-8567-3f5bf3368a05@linaro.org>
Date:   Mon, 9 Oct 2023 23:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: Add support for Xiaomi Redmi Note
 9S
Content-Language: en-US
To:     David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Joe Mason <buddyjojo06@outlook.com>
Cc:     cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        hexdump0815@googlemail.com, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20231007140053.1731245-1-davidwronek@gmail.com>
 <20231007140053.1731245-8-davidwronek@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20231007140053.1731245-8-davidwronek@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/7/23 15:58, David Wronek wrote:
> From: Joe Mason <buddyjojo06@outlook.com>
> 
> Add a device tree for the Xiaomi Redmi Note 9S (curtana) phone, based on
> sm7125-xiaomi-common.dtsi.
> 
> Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                |  1 +
>   .../boot/dts/qcom/sm7125-xiaomi-curtana.dts      | 16 ++++++++++++++++
>   2 files changed, 17 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d6cb840b7050..57974fb0c580 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -207,6 +207,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-curtana.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm7125-xiaomi-joyeuse.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm7225-fairphone-fp4.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dts b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dts
> new file mode 100644
> index 000000000000..12f517a8492c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm7125-xiaomi-curtana.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: GPL-2.0
I have no idea if you can just include a bunch of bsd3 source and slap 
gpl2 atop your changes.. Somebody else could probably chime in

Konrad
