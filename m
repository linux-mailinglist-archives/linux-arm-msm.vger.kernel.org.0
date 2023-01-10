Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6634663EDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jan 2023 12:02:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjAJLCg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Jan 2023 06:02:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238640AbjAJLAk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Jan 2023 06:00:40 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0235F54
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 03:00:27 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id bn26so11330993wrb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jan 2023 03:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/sqiSzZl7tdMGMHM9Gz+tcnXK/Rd5YLz0PHqdYF7LCk=;
        b=ZQXKT4wkWx65R4H1mNwPG5BEVzRem0IDMqI+AVwmlowlMKW5cNVfe0PCv8FvPI+hqm
         xESithyiznoZHNePFVUSFjYkRtcx0p6vPtxfBoWfgc/TRCDCQJFc9TZExuX3iFT9gnG2
         J1MV4C8FUc+RC3TjxKLBi40x27e2bKyZHlXOUETWSotP+owHeCjisXY4PIU9xOfmtzqd
         o2K9E63XyKMfKNWbXdODcXCDHscM9itobyiIwzaZKGpbwhI7Rbnrcz9h418QR+0EGLSY
         i3hfAYcPKkm2dNLISuf13jPzs3b0aM84S1Hf+c/GHiURJ8KnXQHTSp0gCCUSxRPZGxNw
         fXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/sqiSzZl7tdMGMHM9Gz+tcnXK/Rd5YLz0PHqdYF7LCk=;
        b=plaH2doyW7+ncToFrd8CAvsg9N50C5HEJktIGsF/T8QQBs3iGwS67wom5RXtWrmrIZ
         /lKMO/mmXwHBZFWlXsw5Cr5O+QdbvKIbC9Ul8r1y45E0KXxfsOyH8egMfApfg03zmK8f
         xvORuC5wjMpGVZDJ6YqdmrbmPhUKR0FRCAn7iR2gsURq5W7BvPWo3ZTi5HmSTjPNCgGE
         EuueWn3Jf5m57mbzooVMRHqj1Hu99M8XySbtNJXwoyWdqno5lLJE9SUEeYFYn3p2qcOv
         PecH1wQk8fqKoJLMDLPL9bPpCVWGBqsQ2yqfg2YNKV1MvBdQ1j5rphY51OceCZXd+XZ8
         JHGg==
X-Gm-Message-State: AFqh2krDfaYZu4bc/ias/s1asMZHgkvkvQg9vkGkTqbLTR81mZ+PdlRE
        YzH7BuASKQBfmYTSYOKIsWVZAg==
X-Google-Smtp-Source: AMrXdXsOjHmSfpTkgnzh7bn9JY2hWvnUyty612zsqrepGkZwnB14MBwUC1NHz0RvAPFuLyPtpC2hqg==
X-Received: by 2002:adf:e24d:0:b0:2a7:c412:ed22 with SMTP id bl13-20020adfe24d000000b002a7c412ed22mr14332009wrb.58.1673348426433;
        Tue, 10 Jan 2023 03:00:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g1-20020a056000118100b002755e301eeasm10664865wrx.100.2023.01.10.03.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 03:00:25 -0800 (PST)
Message-ID: <a6e0fce9-3a59-1014-9ae8-f07b50d122a2@linaro.org>
Date:   Tue, 10 Jan 2023 12:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/8] arm64: dts: qcom: sc7280: audioreach: Add sound
 node
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_rohkumar@quicinc.com, srinivas.kandagatla@linaro.org,
        dianders@chromium.org, swboyd@chromium.org, judyhsiao@chromium.org,
        konrad.dybcio@linaro.org, mka@chromium.org
References: <1672925875-2107-1-git-send-email-quic_srivasam@quicinc.com>
 <1672925875-2107-3-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1672925875-2107-3-git-send-email-quic_srivasam@quicinc.com>
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

On 05/01/2023 14:37, Srinivasa Rao Mandadapu wrote:
> Add sound node for sc7280 based audioreach platforms.
> 
> Include audioreach dtsi into crd-rev3 platform specific dts file.
> Also remove phandle to sound node, as audio routing is same as
> audioreach specific dtsi file.
> 

Thank you for your patch. There is something to discuss/improve.

> +#include <dt-bindings/sound/qcom,q6afe.h>
> +
> +/{
> +	/* BOARD-SPECIFIC TOP LEVEL NODES */
> +	sound: sound {
> +		compatible = "google,sc7280-herobrine";
> +		model = "SC7280-AUDIOREACH";
> +		adsp-mode;

There is no such property. Test DTS against your schema, so make
dtbs_check DT_SCHEMA_FILES=google,sc7280-herobrine

> +		audio-routing =
> +			"IN1_HPHL", "HPHL_OUT",
> +			"IN2_HPHR", "HPHR_OUT",
> +			"AMIC1", "MIC BIAS1",
> +			"AMIC2", "MIC BIAS2",
> +			"VA DMIC0", "MIC BIAS1",
> +			"VA DMIC1", "MIC BIAS1",
> +			"VA DMIC2", "MIC BIAS3",
> +			"VA DMIC3", "MIC BIAS3",
> +			"TX SWR_ADC0", "ADC1_OUTPUT",
> +			"TX SWR_ADC1", "ADC2_OUTPUT",
> +			"TX SWR_ADC2", "ADC3_OUTPUT",
> +			"TX SWR_DMIC0", "DMIC1_OUTPUT",
> +			"TX SWR_DMIC1", "DMIC2_OUTPUT",
> +			"TX SWR_DMIC2", "DMIC3_OUTPUT",
> +			"TX SWR_DMIC3", "DMIC4_OUTPUT",
> +			"TX SWR_DMIC4", "DMIC5_OUTPUT",
> +			"TX SWR_DMIC5", "DMIC6_OUTPUT",
> +			"TX SWR_DMIC6", "DMIC7_OUTPUT",
> +			"TX SWR_DMIC7", "DMIC8_OUTPUT";
> +
> +		qcom,msm-mbhc-hphl-swh = <1>;
> +		qcom,msm-mbhc-gnd-swh = <1>;
> +
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		#sound-dai-cells = <0>;
> +
> +		dai-link@0 {
> +			link-name = "WCD9385 Playback";
> +			reg = <0>;
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +			};
> +			codec {
> +				sound-dai = <&wcd9385 0>, <&swr0 0>, <&lpass_rx_macro 0>;
> +			};
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dai-link@1 {
> +			link-name = "WCD9385 Capture";
> +			reg = <1>;
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +			};
> +			codec {
> +				sound-dai = <&wcd9385 1>, <&swr1 0>, <&lpass_tx_macro 0>;
> +			};
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dai-link@2 {
> +			link-name = "Amplifier Playback";
> +			reg = <3>;

Missing dtbs W=1 build.

> +
> +			cpu {
> +				sound-dai = <&q6apmbedai SECONDARY_MI2S_RX>;
> +			};
> +

Use consistent style. Either blank line or not between the
cpu/codec/platform nodes.

> +			codec {
> +				sound-dai = <&max98360a>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		dai-link@3 {
> +			link-name = "DMIC";
> +			reg = <4>;

Same problem, wrong reg.

> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {
> +				sound-dai = <&lpass_va_macro 0>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
> +};

Best regards,
Krzysztof

