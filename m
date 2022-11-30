Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F52563D424
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 12:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbiK3LRM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 06:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234308AbiK3LRF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 06:17:05 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51BB2C11C
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:17:03 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id r8so20496610ljn.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 03:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=93Fl7WiTCHJeIgakKDaYI1Qsq+II/EWb0Q1aTHCr7pA=;
        b=uL1Ic/P3fR5OXGJkEoD9BOkPINXKzVlvBXwRHreFGxX7vqQdYxlkqKhKU46HMaQ4SS
         9r/5h+zENHT7VKjhFy3k62I2oHurEg7Yy6DT6kKIiQpFad9GZLPzTJr3cVBVLqi5R5wv
         0/JSe2TJaa2kuX10sIjQ3u0bbU2S4ydAZsOByR2JNemAcPUbNVCdt/IalgIKjOaaYjY1
         HWKSZMOXfqvkSwuPCTcNMYXwVEBXljjoiR/8xSDxDYHEsH5K0cyLB2mRunlXz0JtZipQ
         iQesDJwc6oMQGp4UT9hQgTX5wk8LkCogzzqef2SiQHY7EBXY9qxMTbmjDwee+66MgliN
         9kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=93Fl7WiTCHJeIgakKDaYI1Qsq+II/EWb0Q1aTHCr7pA=;
        b=u8Yw/vLRdET553KycaQ7umLPpPFRDfyGw0U4B+M+Q5I4zDTokxr9Pz4YUUiXCIkNUy
         LWcXUp8FV+A8XIz8q4XaiGnryuFvVe1YY6LWtEKGKBRnUpXfawIpQif0xHPIDysYMo8O
         EvpDWc7VHpnYQKHBM01x0/pnCdFY0zO567O5EFt/4BXawK11I43updoYb+oE0B4TiZYj
         GJ7jVNYryYPbR0lxp/NaP67+z2hplH042ETi1QmxB74mNwzQu2QGS63PMMkwxiLRn7pz
         qgfS4G4LxgYcpwFxsOBLAC4sif5i5AmjbmKs/mnuYFV9YL0Lm1Ky1ZS8K1POXBHhF7sr
         /t5g==
X-Gm-Message-State: ANoB5pnvUYIPbwHrjJssXbvYiSK4B9Veh6pKcaAigiOBu0IFixhNtozt
        i71UBawYc49qe52Uk/Rj4WMFaQ==
X-Google-Smtp-Source: AA0mqf72zkzsX2t1JV2GlLC/Mt2x0wSRYPI7aozVNCnP7S0yBQycAUQytTfBHQ3TV8fKZr6qfgmiUA==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id h12-20020a05651c158c00b0026c090ff8femr20603495ljq.2.1669807022044;
        Wed, 30 Nov 2022 03:17:02 -0800 (PST)
Received: from [192.168.1.101] (95.49.125.236.neoplus.adsl.tpnet.pl. [95.49.125.236])
        by smtp.gmail.com with ESMTPSA id q15-20020a2e914f000000b0027706d22878sm104656ljg.94.2022.11.30.03.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 03:17:01 -0800 (PST)
Message-ID: <8a57c06c-e755-c298-a9d6-3f2a431b3f5d@linaro.org>
Date:   Wed, 30 Nov 2022 12:16:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 04/12] arm64: dts: qcom: sm6115: Add TSENS node
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>
Cc:     phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-5-a39.skl@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221129204616.47006-5-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.11.2022 21:46, Adam Skladowski wrote:
> Add nodes required for TSENS block using the common qcom,tsens-v2 binding.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> index 2003a2519a54..decbf7ca8a03 100644
> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
> @@ -515,6 +515,17 @@ spmi_bus: spmi@1c40000 {
>  			#interrupt-cells = <4>;
>  		};
>  
> +		tsens0: thermal-sensor@4410000 {
> +			compatible = "qcom,sm6115-tsens", "qcom,tsens-v2";
> +			reg = <0x04411000 0x1ff>, /* TM */
> +			      <0x04410000 0x8>; /* SROT */
> +			#qcom,sensors = <16>;
> +			interrupts = <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow", "critical";
> +			#thermal-sensor-cells = <1>;
> +		};
> +
>  		rpm_msg_ram: sram@45f0000 {
>  			compatible = "qcom,rpm-msg-ram";
>  			reg = <0x045f0000 0x7000>;
