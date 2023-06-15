Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A44EE7322B3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 00:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbjFOWZc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Jun 2023 18:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbjFOWZb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Jun 2023 18:25:31 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 721E826AA
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:25:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f849a0e371so826883e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jun 2023 15:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686867927; x=1689459927;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dfI1EdPP2Z33NdgbRaS7GlRwJg6hlYDBJr0ZiMCsIA=;
        b=QMkAzTt3eKtgeMKnj2jdBMgUrC3Q8SVStwF/CGL34fbCq9Z5czhHZ3zN4Tkn7I2Pab
         AYe7EK+++MR4PWWrpXRq5y39WFLjf39nbMJklbwLdo2TkAi3cam2kp1aRMJqP2SWCVZO
         flNrLByUqPYkMX496Zmbx/9kNnzVen1VWjyo4SrXUf5P6jbqYCOQnpvU0lCk+ZGmBfdr
         1qmyjqp866I4uSoAOtKwkwYaDfunTA8O2q3N0nENEM8Pr1CFuK00AELAfyXXUfiqSQ3I
         jL8M4s/TPM7XpicgS3eheG2KQjCqjWXV/sgcHBqRAdAjw9rwtXnJYOolzsTHj/5ySDEq
         +YnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686867927; x=1689459927;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dfI1EdPP2Z33NdgbRaS7GlRwJg6hlYDBJr0ZiMCsIA=;
        b=PUB+Nkct1mgkEr2Gi6J5oBE9v/jpJnkWOf9xA5AmNKksQoTaXkyHDSxTPuvFthjtqg
         ve5qiAYfnrWwWpmTnyGw7UkxodT/PxOEb9N/ata12z2IAWL613NKdGmIi+23FavxwvZc
         UtspQBHeqauscy1Mb8z//UPPe/3/JXP//y1lM462wXXtWF/rKuHbOxPSwojiEMTuX6e0
         fw5TW1VyIugKOEa6LZnnlMYgFhrXAjWsVF+iU5jD1IGkpQYi6aXXkT9lMK0RJM1g2Cat
         TF0oevSVPsQrSztJT/C0BI2eRJo6kZVrx4aoGg5LkTxcpBgV7+CRNoKnbt6xBoM8/PDq
         x4mQ==
X-Gm-Message-State: AC+VfDyfE6MTFnewwnYy0RKNxZTm0Tt4LS7j5VC22ETZghXX55T9S7Kx
        Pz5xAP1t8yaXa4GAK89K/n8zzg==
X-Google-Smtp-Source: ACHHUZ7fccECczRiubap4GsFX8wL/3Xt9h7FkCdHhn37nN1jC6dIulGHWbqXOORIfiDmvbSrzVueMA==
X-Received: by 2002:a05:6512:32b1:b0:4ef:f09c:c505 with SMTP id q17-20020a05651232b100b004eff09cc505mr43426lfe.37.1686867927543;
        Thu, 15 Jun 2023 15:25:27 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id p23-20020a19f017000000b004edc9da63bdsm243174lfc.160.2023.06.15.15.25.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jun 2023 15:25:26 -0700 (PDT)
Message-ID: <93f2fa24-c3a6-bf56-3fb6-0d47f8b37df2@linaro.org>
Date:   Fri, 16 Jun 2023 00:25:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Mark SCM as dma-coherent for
 trogdor
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>, andersson@kernel.org
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        konrad.dybcio@somainline.org, sumit.semwal@linaro.org,
        Will Deacon <will@kernel.org>, amit.pundir@linaro.org,
        Sibi Sankar <quic_sibis@quicinc.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        linux-arm-kernel@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Clark <robdclark@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230615145253.1.Ic62daa649b47b656b313551d646c4de9a7da4bd4@changeid>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230615145253.1.Ic62daa649b47b656b313551d646c4de9a7da4bd4@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15.06.2023 23:52, Douglas Anderson wrote:
> Trogdor devices use firmware backed by TF-A instead of Qualcomm's
> normal TZ. On TF-A we end up mapping memory as cachable. Specifically,
> you can see in Trogdor's TF-A code [1] in qti_sip_mem_assign() that we
> call qti_mmap_add_dynamic_region() with MT_RO_DATA. This translates
> down to MT_MEMORY instead of MT_NON_CACHEABLE or MT_DEVICE. Apparently
> Qualcomm's normal TZ implementation maps the memory as non-cachable.
> 
> Let's add the "dma-coherent" attribute to the SCM for trogdor.
> 
> Adding "dma-coherent" like this fixes WiFi on sc7180-trogdor
> devices. WiFi was broken as of commit 7bd6680b47fa ("Revert "Revert
> "arm64: dma: Drop cache invalidation from
> arch_dma_prep_coherent()"""). Specifically at bootup we'd get:
> 
>  qcom_scm firmware:scm: Assign memory protection call failed -22
>  qcom_rmtfs_mem 94600000.memory: assign memory failed
>  qcom_rmtfs_mem: probe of 94600000.memory failed with error -22
> 
> From discussion on the mailing lists [2] and over IRC [3], it was
> determined that we should always have been tagging the SCM as
> dma-coherent on trogdor but that the old "invalidate" happened to make
> things work most of the time. Tagging it properly like this is a much
> more robust solution.
> 
> [1] https://chromium.googlesource.com/chromiumos/third_party/arm-trusted-firmware/+/refs/heads/firmware-trogdor-13577.B/plat/qti/common/src/qti_syscall.c
> [2] https://lore.kernel.org/r/20230614165904.1.I279773c37e2c1ed8fbb622ca6d1397aea0023526@changeid
> [3] https://oftc.irclog.whitequark.org/linux-msm/2023-06-15
> 
> Fixes: 7bd6680b47fa ("Revert "Revert "arm64: dma: Drop cache invalidation from arch_dma_prep_coherent()""")
> Fixes: 7ec3e67307f8 ("arm64: dts: qcom: sc7180-trogdor: add initial trogdor and lazor dt")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Please also add a comment in the dt

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> 
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 4 ++++
>  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index ca6920de7ea8..5e1e7c5bd474 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -1194,6 +1194,10 @@ &pm6150l_gpios {
>  			  "";
>  };
>  
> +&scm {
> +	dma-coherent;
> +};
> +
>  &tlmm {
>  	/*
>  	 * pinctrl settings for pins that have no real owners.
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index f479cab8ab45..a65be760d1a7 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -369,7 +369,7 @@ CLUSTER_SLEEP_0: cluster-sleep-0 {
>  	};
>  
>  	firmware {
> -		scm {
> +		scm: scm {
>  			compatible = "qcom,scm-sc7180", "qcom,scm";
>  		};
>  	};
