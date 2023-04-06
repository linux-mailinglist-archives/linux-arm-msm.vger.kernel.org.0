Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 332B46DA16E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 21:34:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjDFTez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 15:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237173AbjDFTev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 15:34:51 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DD935BE
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 12:34:49 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id h25so52191274lfv.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680809688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CdnpsOrgoGjdYkziuxbq+BkISgPwkT4U9SVDy3wVCLI=;
        b=SLTxumcWjQxvNhNknj20GCkzShumXcYtHG+x48pmtTW493W48vXMtEDj+gyk5A0dln
         OKG9BJjj6fOtGZLsYNN+7Cf+vq4J9FWPeTkXMx9VDnwBHnrFtnU0xB2D1tecp8Rcs1Bm
         PhjhPxY/bhcE3A1+IXU2uBJZl2eE0683CUksXJ6GEdnAr60oHsIqK5hHQgnweGZf9BsG
         lQu500FUU+TsMMwTpgpv7xXkB1CDisU0kMgfKrFRR32VR4M4aLvTAExXlWVzayxKEabd
         /aEb8z6FDdTClV/Jg0zoH97a0xHVKri84tPdz6DSOI8KbMETItazdEYEV12yAuy45O4v
         j7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680809688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CdnpsOrgoGjdYkziuxbq+BkISgPwkT4U9SVDy3wVCLI=;
        b=kjcT41zMLA640kJa39u7LDHIPiGB2nCej5tEVh25Pf0FJ2QbV9tr4XKoqd6vbfPUmr
         OA2690ksQOu1qrnHMZ3T3hGitGXwU/bNrdSh6RVoFH+BO2EmNBtkG0b6jwif9UjhVrEq
         Jlqan4dadWJeC4IK3xRTp8eGx1Ox6W00T7fvBqeBivSjzEq1JV5COptrnCSR2rAdXK2q
         mVqxViPoKG3qTmS4fYrA+7wPXC7t9N9was9FjWoMEr6wVLVUAQgR3u5jUohCiy3TsCcX
         WNuWxnERoCmt6pZoQvnJqX37jMTs9glDVZIhsteFRF+wT0sbKriMt1bJ9qe5hz0oqiEy
         1yaA==
X-Gm-Message-State: AAQBX9dI1khSGeJWuG9j0LxSgX00roBaA7TVgzVtPorjnx7F5YkdgPWG
        ZwU/kfp6xYv6kwlFbDHYO+j0Mw==
X-Google-Smtp-Source: AKy350YhFh6DXiaG3ELYfFHejqULqS2GvbrlZnrzDV7Gwyx0z/FBhgQGsvrGrW61z4B56HLtnVfuTw==
X-Received: by 2002:ac2:4827:0:b0:4b0:1305:6e02 with SMTP id 7-20020ac24827000000b004b013056e02mr54048lft.8.1680809687796;
        Thu, 06 Apr 2023 12:34:47 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id a17-20020a056512021100b00498f67cbfa9sm394147lfo.22.2023.04.06.12.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 12:34:47 -0700 (PDT)
Message-ID: <2edbb19a-aa0f-4ad7-2c83-e10f949b9d5c@linaro.org>
Date:   Thu, 6 Apr 2023 21:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add Acer Aspire 1
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, agross@kernel.org,
        andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        quic_srivasam@quicinc.com, judyhsiao@chromium.org,
        mka@chromium.org, dianders@chromium.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230406150633.83351-1-nikita@trvn.ru>
 <20230406150633.83351-5-nikita@trvn.ru>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230406150633.83351-5-nikita@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.04.2023 17:06, Nikita Travkin wrote:
> Acer Aspire 1 is a WoA laptop based on Snapdragon 7c gen1 platform.
> 
> The laptop design is similar to trogdor in the choice of primary
> components but the specifics on usage of those differ slightly.
> 
> Add the devicetree for the laptop with support for most of the
> hardware present.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> Changed in v2:
>  - Various styling, ordering and node naming issues fixed. (Krzysztof)
> 
> Changed in v3:
>  - Kepp camcc on, wakeup on touchpad, minor style issues. (Konrad)
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sc7180-acer-aspire1.dts     | 859 ++++++++++++++++++
>  2 files changed, 860 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index f6ff4024a60e..f0d92c47bc7f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sa8155p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8295p-adp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8540p-ride.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sa8775p-ride.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-acer-aspire1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> new file mode 100644
> index 000000000000..b4161f1f21a7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sc7180-acer-aspire1.dts
> @@ -0,0 +1,859 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +
> +#include "sc7180.dtsi"
> +
> +#include "pm6150.dtsi"
> +#include "pm6150l.dtsi"
> +
> +/delete-node/ &tz_mem;
> +/delete-node/ &ipa_fw_mem;
> +
> +/ {
> +	model = "Acer Aspire 1";
> +	compatible = "acer,aspire1", "qcom,sc7180";
> +	chassis-type = "laptop";
> +
> +	aliases {
> +		bluetooth0 = &bluetooth;
> +		hsuart0 = &uart3;
> +		serial0 = &uart8;
> +		wifi0 = &wifi;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reserved-memory {
> +		zap_mem: zap-shader@80840000 {
> +			reg = <0 0x80840000 0 0x2000>;
Please use 0x0 consistently as you did below.

> +			no-map;
> +		};
> +
> +		venus_mem: venus@85b00000 {
> +			reg = <0 0x85b00000 0 0x500000>;
> +			no-map;
> +		};
> +
> +		mpss_mem: mpss@86000000 {
> +			reg = <0x0 0x86000000 0x0 0x2000000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp@8e400000 {
> +			reg = <0x0 0x8e400000 0x0 0x2800000>;
> +			no-map;
> +		};
> +
> +		wlan_mem: wlan@93900000 {
> +			reg = <0x0 0x93900000 0x0 0x200000>;
> +			no-map;
> +		};
> +	};
> +

[...]

> +	sdc1_default: sdc1-default-state {
> +		clk-pins {
> +			pins = "sdc1_clk";
> +			bias-disable;
> +			drive-strength = <16>;
drive-strength
bias-

Just like you have in all other nodes, please.

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc1_cmd";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc1_data";
> +			bias-pull-up;
> +			drive-strength = <16>;
> +		};
> +
> +		rclk-pins {
> +			pins = "sdc1_rclk";
> +			bias-pull-down;
> +		};
> +	};
> +
> +	sdc1_sleep: sdc1-sleep-state {
> +		clk-pins {
> +			pins = "sdc1_clk";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +
> +		cmd-pins {
> +			pins = "sdc1_cmd";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +
> +		data-pins {
> +			pins = "sdc1_data";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +
> +		rclk-pins {
> +			pins = "sdc1_rclk";
> +			bias-pull-down;
> +		};
> +	};
> +
> +	ter_mi2s_active: ter-mi2s-active-state {
> +		pins = "gpio63", "gpio64", "gpio65";
> +		function = "mi2s_2";
> +	};
> +};
