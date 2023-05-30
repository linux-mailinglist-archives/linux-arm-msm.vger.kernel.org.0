Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 077D0716196
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 May 2023 15:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjE3NWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 May 2023 09:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231178AbjE3NWo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 May 2023 09:22:44 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B16B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:22:40 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-973bf581759so808170466b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 May 2023 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685452959; x=1688044959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/24UxPBfR0sgEFqt/O6F91wFOQpVVQfus6oLh21Y0t0=;
        b=DmIrPMnOuyRs7Z/Y5MO/vMwytCqh3Klgp3OWWvqhoHTcsmrb22wZ6jSH8ZJpiDIb4F
         YBoOWQoH4MbBZJjKE7wBFfGyp9OktLQBP5LvaqZKvz3GD8iwxAVrLEj1piYY//GU8NVX
         9Qf/yEY/7MGUvANSTn+Sit+uQGkM2weDAZq+Z8d7cfLK4qVHMb+B1jewFuS5hUHarEWD
         vF2do19OHGTWt0Om1/iy6MBEr6fQ6xhN5B6rWsZvSHKfP/go6CxxSGaahZffpDFGpQq6
         VGFPLziUXUkhcXQWfF9c/S9BT6g3sPZEatKZzH+Wrwn/L3rMFKaJfAX+Cf4oH+CUbHKZ
         U2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685452959; x=1688044959;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/24UxPBfR0sgEFqt/O6F91wFOQpVVQfus6oLh21Y0t0=;
        b=lacYAU+UvpF/PDGEYHkh5D6Z9WIw5STcZI3m1YsGaeo0ltmAJsz8DRnxpD2OV/MT9M
         zXL7sKo/AYnJbcWXB7cw2GCiM3GjHaMxHqudBzk1otoyA60pNCljfroe+MTg70b9pSon
         TKlwhxsfcVta26YYBNJs+5r++V/x/uYSCiVXL+0IojAFbA8QT8+4LNDeNw5IR8s7RHJA
         pnJiu5a5uUOCCBypPX6U23TdCmvgCsMF4ChHcJn9ZvflOCheJPobTFsl9hBwojfkZZpl
         0NdOd4iXLW/kQz6ucvZ8GlQszxDG2mRBVW8VVTRBzft1zz/vS6blERIjNIC8uCkI2Uxc
         U2Xw==
X-Gm-Message-State: AC+VfDztJ1S0S4eLIRSWi/02W8BUq8IH8C1IljuJDwU5eYzetjImwCcm
        rWS0s/D1UB+ecRlHTMVkNg2Tbw==
X-Google-Smtp-Source: ACHHUZ5XdM462+bLqkMo9j64utn6Epv2miFRV1JBcRRR1jwxLR2ZzYktlryXRxelMtBLc0cubiaRrQ==
X-Received: by 2002:a17:907:7206:b0:974:1eeb:1ab7 with SMTP id dr6-20020a170907720600b009741eeb1ab7mr1891024ejc.24.1685452958920;
        Tue, 30 May 2023 06:22:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id la11-20020a170906ad8b00b00965f5d778e3sm7380051ejb.120.2023.05.30.06.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 06:22:38 -0700 (PDT)
Message-ID: <20845b22-9250-c4fe-376f-d0d600679c8e@linaro.org>
Date:   Tue, 30 May 2023 15:22:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/4] ARM: dts: qcom: msm8960: Add USB node
Content-Language: en-US
To:     Rudraksha Gupta <guptarud@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-4-guptarud@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230528001010.47868-4-guptarud@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/05/2023 02:10, Rudraksha Gupta wrote:
> Add the required nodes to support USB on the MSM8960 SoC. As it's very
> similar to the APQ8064 SoC, the nodes are almost identical
> 
> Add a label to sleep_clk for the USB node to reference
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>


> +		usb1: usb@12500000 {
> +			compatible = "qcom,ci-hdrc";
> +			reg = <0x12500000 0x200>,
> +			      <0x12500200 0x200>;
> +			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
> +			clock-names = "core", "iface";
> +			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
> +			assigned-clock-rates = <60000000>;
> +			resets = <&gcc USB_HS1_RESET>;
> +			reset-names = "core";
> +			phy_type = "ulpi";
> +			ahb-burst-config = <0>;
> +			phys = <&usb_hs1_phy>;
> +			phy-names = "usb-phy";
> +			status = "disabled";

status is the last

> +			#reset-cells = <1>;
> +
> +			ulpi {
> +				usb_hs1_phy: phy {
> +					compatible = "qcom,usb-hs-phy-msm8960",
> +						     "qcom,usb-hs-phy";
> +					clocks = <&sleep_clk>, <&cxo_board>;
> +					clock-names = "sleep", "ref";
> +					resets = <&usb1 0>;
> +					reset-names = "por";
> +					#phy-cells = <0>;
> +				};
> +			};
> +		};
> +

Don't add stray blank lines.

Best regards,
Krzysztof

