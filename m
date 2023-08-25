Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0367788518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Aug 2023 12:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244439AbjHYKkU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Aug 2023 06:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244494AbjHYKjx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Aug 2023 06:39:53 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32C6173F
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 03:39:50 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9a2a4a5472dso198775266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Aug 2023 03:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692959989; x=1693564789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T4bCjQrZ7ywE3HWQV7oP/6H4w62lITlc52ygpwYMfFI=;
        b=b/2B5kQNomuylgRRvXA3bIMXOMmpnHKBi9YGgMIqQniAJXNL347eXDGCMAp0rhbmRO
         8tqMO/CKkHgbEE6h39avWZO8CDh04lC/FXnhEengWH9W8mp+MVwM/d4voiT5PmImrwR/
         KJ4Z3izLAKR+bG5pvd2a/exarE0gImQCq1Atlaf67SB8Eji9IAERWhUX8JveT/gvLyE7
         56giynFtUCXqGUIg30/TjLxfdYU1NwT5XDTaWYcjHJhcwa/HDxVTe0UoJ0uwuPJLPfk3
         xcMeVChesfVvQBXtDrJ9U0P3o1+beJnptMamURKT8gHpWkeGeRFt/UCbxR9wk5J20BGs
         1UjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692959989; x=1693564789;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4bCjQrZ7ywE3HWQV7oP/6H4w62lITlc52ygpwYMfFI=;
        b=Jhdzi8Lvy7uikcZACpjbGFDikrWTXe0pQVk4a+vH77qynLIg4bOUqSJoLOoX0noPAi
         C7l6NeMVjXPan1n4TIAi8vNsYYmZI29VKpNAPWysr5/tpdeo/9wgm5Y8Lh+xOqzlegJo
         q1FP/PiCwPviGmc4bDQ2Gem/LsEC7qKqc1XN9lqYFQnwN/nD3j1v/S8M5VeSMf6tM4uC
         /ZczG0qGO3IdU5wU9AY3b4xvmUDdaqdZFyPaP+FFQ7Kifqcz7HoB06Yf/X+76jvm7/hS
         4hkdEOwGw27frK8W3ok4EOJjFY12QOgScq2MTYaGUTCqQgMUM/0zjbW15xod9J5bNTQw
         egmg==
X-Gm-Message-State: AOJu0YwGWqe1bBzR2D/BNcfgo6JLYroSVukTOk8mcnZRRJ+0eP6ovSA2
        aZiGqezgoTx1/e4+ILQNuB9VVw==
X-Google-Smtp-Source: AGHT+IEMrMlgr7JpaeTq/MvmU3/4a1WTA6huvdVoSFYPUJSKNZ2VXpw0Gy2tBVpvZnmyuzvs9XADfQ==
X-Received: by 2002:a17:907:2711:b0:9a1:df30:e158 with SMTP id w17-20020a170907271100b009a1df30e158mr6781455ejk.36.1692959989433;
        Fri, 25 Aug 2023 03:39:49 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id rs25-20020a170907037900b0099bd1a78ef5sm819588ejb.74.2023.08.25.03.39.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 03:39:48 -0700 (PDT)
Message-ID: <df519068-c9f0-1051-afb3-75f71ad31791@linaro.org>
Date:   Fri, 25 Aug 2023 12:39:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: ipq5018: Add USB related nodes
Content-Language: en-US
To:     Nitheesh Sekar <quic_nsekar@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, vkoul@kernel.org,
        kishon@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        gregkh@linuxfoundation.org, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, quic_wcheng@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc:     Amandeep Singh <quic_amansing@quicinc.com>
References: <20230825093531.7399-1-quic_nsekar@quicinc.com>
 <20230825093531.7399-5-quic_nsekar@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230825093531.7399-5-quic_nsekar@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/08/2023 11:35, Nitheesh Sekar wrote:
> Add USB phy and controller nodes.
> 
> Co-developed-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Amandeep Singh <quic_amansing@quicinc.com>
> Signed-off-by: Nitheesh Sekar <quic_nsekar@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 54 +++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 9f13d2dcdfd5..ff477923a823 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -238,6 +238,60 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		usbphy0: phy@5b000 {
> +			compatible = "qcom,ipq5018-usb-hsphy";
> +			reg = <0x0005b000 0x120>;
> +
> +			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>;
> +
> +			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
> +
> +			#phy-cells = <0>;
> +
> +			status = "disabled";
> +		};
> +
> +		usb: usb2@8a00000 {

Eee, where did you put these? Don't stuff things to the end of any list.
This applies to your entire code: Makefile, Kconfig, .c, .h, .dts, .dtsi
and other languages and projects as well.

Krzysztof

