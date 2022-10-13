Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 081C55FE2E0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 21:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbiJMTqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 15:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiJMTqX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 15:46:23 -0400
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5507E18A3F0;
        Thu, 13 Oct 2022 12:46:22 -0700 (PDT)
Received: from [192.168.1.101] (95.49.31.41.neoplus.adsl.tpnet.pl [95.49.31.41])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 5EB461F67B;
        Thu, 13 Oct 2022 21:46:19 +0200 (CEST)
Message-ID: <4ffe4597-be6f-65c9-42cd-e2b0c70ce98a@somainline.org>
Date:   Thu, 13 Oct 2022 21:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: ipq8064-rb3011: fix nand node
 validation
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221013190657.48499-1-luca@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221013190657.48499-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.10.2022 21:06, Luca Weiss wrote:
> The devicetree documentation for the nand node requires the subnode be
> called nand@ and no compatible is needed.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> index 5a65cce2500c..86f895db9894 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> +++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
> @@ -264,8 +264,7 @@ &hs_phy_1 {
>  &nand {
>  	status = "okay";
>  
> -	nandcs@0 {
> -		compatible = "qcom,nandcs";
> +	nand@0 {
>  		reg = <0>;
>  
>  		nand-ecc-strength = <4>;
