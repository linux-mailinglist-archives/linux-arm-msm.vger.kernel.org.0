Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D18EA645765
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 11:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiLGKSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Dec 2022 05:18:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiLGKSJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Dec 2022 05:18:09 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACEC045EEC
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Dec 2022 02:18:00 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 1so14329423lfz.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Dec 2022 02:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGXMJjz+2boCG5TJb22HyqmB9GaN/vs7mLP9UWEibWA=;
        b=cKCponzWvvIu9wNcnUVlI6SLr2/gfKFZrZUbOWAl/2DzvZNWoq0tsO65o62GHwsYbl
         2zq7rlqNINGnLJJoEvofvUj9cX+mbF1QvTIFW6g381oAGd2ZYbbWL1ZQ6Tk6WabjuUha
         rvx4rTAAZsnDtp6peK8K9MDdFarhXQTGuRajYdPU3UQdWDsEUMRZlSdVrv5FPVAPnInY
         zJcHsDB9yz5mVzbZnH5T18hyJqqqratqRfr2p9rLD9JkwR/deu4AwTRNu/O9nZX8kfho
         8PiUWwRD23L43K6qRAOXT+xHxtZ4WQO4wjnKjt4z4Nkmh0VrscaGmJJ+rgbKkre/eZqa
         AmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BGXMJjz+2boCG5TJb22HyqmB9GaN/vs7mLP9UWEibWA=;
        b=IJcJ+p+VQWZFB1FLopQCJGMMUmOcOca+JC3QJp+LCON9qKJu7fkLqKSp8lHKs9wCGL
         6QzxLKj2Ly5+hlb6nIZFMyzxnRy0b+nGDlmepABQodKcNezjGlFKFtV7ggMfNIX3HEL3
         e0x7/HECI4HA+vXiVqJimgXkDRIrAMhk+Ei6rkU+vvUZvM1ToOiDMvGDfsaKmfGAsjIX
         pej3KRY89u9feLXrmj7paHOcq7fVrnO+uyyPxKZ8o2Wzt0xcQV5Dsr+zN44kKaGhp5De
         +yhdab+s4HmMArkvJqFC5USQEqtbNhIeZkHInGCIQgrIF1ffByTMgy/GHe/5OPwYLTpk
         1cTA==
X-Gm-Message-State: ANoB5pks2ut7/2kOZQIT1CbOH+3O1+NOQQYcTxf911clBU0gOer60IF6
        JXSBjxR6xqx0dXa7OYaKVffcKQ==
X-Google-Smtp-Source: AA0mqf5uSZ7JFlb3ZS9gsXQQkKQHhrXnMFX9JcpcDIu9LiDGpEh5+G1JVZ4RabjdtxgM7GNP50gAQA==
X-Received: by 2002:a05:6512:2c85:b0:4a2:5937:e9b with SMTP id dw5-20020a0565122c8500b004a259370e9bmr28743999lfb.11.1670408279176;
        Wed, 07 Dec 2022 02:17:59 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id o5-20020ac24e85000000b004aa255e2e66sm2787699lfr.241.2022.12.07.02.17.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Dec 2022 02:17:58 -0800 (PST)
Message-ID: <190ac5ef-d7fe-400a-f8a2-ec23c7a1ba1b@linaro.org>
Date:   Wed, 7 Dec 2022 11:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm670: add qfprom node
To:     Richard Acayan <mailingradian@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20221206231729.164453-1-mailingradian@gmail.com>
 <20221206231729.164453-2-mailingradian@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221206231729.164453-2-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 07/12/2022 00:17, Richard Acayan wrote:
> Some hardware quirks and capabilities can be determined by reading the
> fuse-programmable read-only memory. Add the QFPROM node so consumers
> know if they need to do anything extra to support the hardware.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> Changes since v1:
>   - offset address by 0x4000 and zero-pad regs
> 
>   arch/arm64/boot/dts/qcom/sdm670.dtsi | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> index f93705bc549f..c78156e03d93 100644
> --- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
> @@ -731,6 +731,13 @@ gcc: clock-controller@100000 {
>   			#power-domain-cells = <1>;
>   		};
>   
> +		qfprom: qfprom@784000 {
> +			compatible = "qcom,sdm670-qfprom", "qcom,qfprom";
> +			reg = <0 0x00784000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>   		sdhc_1: mmc@7c4000 {
>   			compatible = "qcom,sdm670-sdhci", "qcom,sdhci-msm-v5";
>   			reg = <0 0x007c4000 0 0x1000>,
