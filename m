Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CFDD5EC31E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 14:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbiI0MnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 08:43:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbiI0MnI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 08:43:08 -0400
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [IPv6:2001:4b7a:2000:18::167])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D01CB6D64;
        Tue, 27 Sep 2022 05:43:07 -0700 (PDT)
Received: from [192.168.1.101] (95.49.29.188.neoplus.adsl.tpnet.pl [95.49.29.188])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4D48B3F2E2;
        Tue, 27 Sep 2022 14:43:05 +0200 (CEST)
Message-ID: <c3a1d4a2-34fa-620e-fa28-33a102f4ec17@somainline.org>
Date:   Tue, 27 Sep 2022 14:43:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/2] ARM: dts: qcom: apq8084: add tsens interrupt
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925161317.76356-1-luca@z3ntu.xyz>
 <20220925161317.76356-2-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220925161317.76356-2-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 25.09.2022 18:13, Luca Weiss wrote:
> Add the interrupt for tsens, based on the information from downstream
> msm-3.4 dts.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-apq8084.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index defc0602d750..593672f827ed 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -264,6 +264,8 @@ tsens: thermal-sensor@fc4a8000 {
>  			nvmem-cells = <&tsens_calib>, <&tsens_backup>;
>  			nvmem-cell-names = "calib", "calib_backup";
>  			#qcom,sensors = <11>;
> +			interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "uplow";
>  			#thermal-sensor-cells = <1>;
>  		};
>  		timer@f9020000 {
