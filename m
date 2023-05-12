Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE282700387
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 11:22:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240156AbjELJWG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 May 2023 05:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240055AbjELJWF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 May 2023 05:22:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D63E72B
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 02:22:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9661a1ff1e9so1134891966b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 May 2023 02:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683883322; x=1686475322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XaOFds0l5Ck5Fhtl3tYvXoHE2wUSuYWOUmGFdptZZRc=;
        b=a9VGDSrb5b1a1+bIIcNmj26BHuadFcyooeqionjk9XEDea6C1JjuXB7vB00CAprK4p
         e/ZbVtsVDvP9QjDY3BgbW5Ru2RqfZlHRggwBJ4msTbxFPzy1+Pl+nA6Y3PHbbtaLpkxw
         LhUggjpJVYfG+T+Oe2e5AgoW5XPrrR4PRETN/TskrOhUFSGzWcStCwOvBiXoyhhcbc/e
         d8AD90ZeJ4v273YsCO+j/24EEf8MTcTts9ME71RV0/UgYjAuQzou9ri/0cQEAsvUvvPw
         Jh3vyCj9PK941+bkrBI5CWyPmXUi3YsJBWgXP10aQU1xddSR+BUiJqJzApcM1jDYauKG
         jCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683883322; x=1686475322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XaOFds0l5Ck5Fhtl3tYvXoHE2wUSuYWOUmGFdptZZRc=;
        b=G0fYnxvjBJRtzy3jTz5pOOgFH5OT8bwJZdl14Ug6DVHhF4ttTxdw3q62mmN5ORD9f9
         CFQJTLL3mXId2Nivrju3wILLeUl84YQBDllJQBMGW6+HRJnSSmUI9WR50Za3qbpnNmCa
         QIicWam/5QvP9bed55Moprv6r1JZwE44t9v2j8Ec0DNYRM+67InzACx6GjlF/7eVn8rH
         Qc8jHMAGWW17CKzfl8Qy2v/otdtN3K+hvFilOS5aCgW72gpNKlenHqpQOodj+c3MjFph
         bHNYRyl62j+idRnK1tv42jJv/RMSrfVXxwMYpOJOMXmQyROHiCnPLy3Y1Z/o/gcZiHKW
         qggA==
X-Gm-Message-State: AC+VfDzmZIpRlOQyEOwgoPtlurPPJFr+xj5Csc+R8i5CVWeLgFxCPlOb
        dk7mwVPMiJYaLNlYD1tQnxmf5Q==
X-Google-Smtp-Source: ACHHUZ7/NX1sqJLN2Di5caAqGxSNFPbL55veYHgJv7MDjiIqNglR1DvFCYW35GTFq02CS7EjI+F3TQ==
X-Received: by 2002:a17:907:934a:b0:958:772e:e926 with SMTP id bv10-20020a170907934a00b00958772ee926mr21059260ejc.24.1683883322001;
        Fri, 12 May 2023 02:22:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:7ede:fc7b:2328:3883? ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id mm30-20020a170906cc5e00b0096595cc87cesm5166105ejb.132.2023.05.12.02.22.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 May 2023 02:22:01 -0700 (PDT)
Message-ID: <845fc080-154f-6799-65e3-a62fc8652b80@linaro.org>
Date:   Fri, 12 May 2023 11:22:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: ipq9574: Enable crypto nodes
Content-Language: en-US
To:     Anusha Rao <quic_anusha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_poovendh@quicinc.com
References: <20230512090134.9811-1-quic_anusha@quicinc.com>
 <20230512090134.9811-3-quic_anusha@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512090134.9811-3-quic_anusha@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/05/2023 11:01, Anusha Rao wrote:
> Enable crypto support for ipq9574.
> 
> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9574.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> index fea15f3cf910..3cda5aa8d03c 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> @@ -123,6 +123,26 @@
>  			clock-names = "core";
>  		};
>  
> +		cryptobam: dma-controller@704000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x00704000 0x20000>;
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>;
> +			#dma-cells = <1>;
> +			qcom,ee = <1>;
> +			qcom,controlled-remotely;
> +		};
> +
> +		crypto: crypto@73a000 {
> +			compatible = "qcom,crypto-v5.1";

This compatible is deprecated. Take a look at the bindings - I think you
miss bindings for your SoC, which you should then use here.

Best regards,
Krzysztof

