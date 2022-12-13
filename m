Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BD2864B463
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 12:43:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbiLMLny (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 06:43:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234787AbiLMLnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 06:43:52 -0500
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14F9721AE;
        Tue, 13 Dec 2022 03:43:51 -0800 (PST)
Received: from SoMainline.org (94-209-172-39.cable.dynamic.v4.ziggo.nl [94.209.172.39])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 72A1E3F114;
        Tue, 13 Dec 2022 12:43:49 +0100 (CET)
Date:   Tue, 13 Dec 2022 12:43:48 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org,
        patches@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150-kumano: Add NXP PN553 NFC
Message-ID: <20221213114348.utpbda336bmmpzm6@SoMainline.org>
References: <20221210142525.16974-1-konrad.dybcio@linaro.org>
 <20221210142525.16974-2-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210142525.16974-2-konrad.dybcio@linaro.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2022-12-10 15:25:24, Konrad Dybcio wrote:
> Add a node for NXP PN553 NFC (or PN557, unclear data), using the
> nxp-nci driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org> # On Xperia 1 and Xperia 5

Unfortunately I can only test this with neard-tools' nfctool, which
reports a tag (from another phone) has been detected but does not allow
me to show its contents (I may have simply not figured out /how/), and
the other phone with the "NFC Tools" app shows nothing when trying to
read from any of the kumano phones (but then I am also unsure how to
"present" a tag via nfctool, and expected it to be implicit when running
as "initiator").

Debug/testing advice appreciated :)

- Marijn

> ---
>  .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi     | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> index 2352dff213fc..9d667bb6f25b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi
> @@ -428,8 +428,18 @@ &i2c4 {
>  
>  	/* Qcom SMB1355 @ c */
>  	/* Qcom SMB1390 @ 10 */
> -	/* NXP PN553 NFC @ 28 */
>  	/* Qcom FSA4480 USB-C audio switch @ 43 */
> +
> +	nfc@28 {
> +		compatible = "nxp,nxp-nci-i2c";
> +		reg = <0x28>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <47 IRQ_TYPE_EDGE_RISING>;
> +
> +		enable-gpios = <&tlmm 41 GPIO_ACTIVE_HIGH>;
> +		firmware-gpios = <&tlmm 48 GPIO_ACTIVE_HIGH>;
> +	};
>  };
>  
>  &i2c7 {
> -- 
> 2.38.1
> 
