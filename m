Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31DAD5FE2D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Oct 2022 21:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229660AbiJMTpX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Oct 2022 15:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229516AbiJMTpU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Oct 2022 15:45:20 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0CBE89AC9;
        Thu, 13 Oct 2022 12:45:18 -0700 (PDT)
Received: from [192.168.1.101] (95.49.31.41.neoplus.adsl.tpnet.pl [95.49.31.41])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id CF73C2012D;
        Thu, 13 Oct 2022 21:45:13 +0200 (CEST)
Message-ID: <ef6ab3d9-8efa-63fb-7f7d-09df4fcb1c88@somainline.org>
Date:   Thu, 13 Oct 2022 21:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 3/4] ARM: dts: qcom: ipq4018-ap120c-ac: Add SoC compatible
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221013155418.47577-1-krzysztof.kozlowski@linaro.org>
 <20221013155418.47577-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20221013155418.47577-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 13.10.2022 17:54, Krzysztof Kozlowski wrote:
> Add qcom,ipq4018 compatible fallback for the SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

Konrad
>  arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
> index af9a26fb5d4a..a5a6f3ebb274 100644
> --- a/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi
> @@ -6,7 +6,7 @@
>  
>  / {
>  	model = "ALFA Network AP120C-AC";
> -	compatible = "alfa-network,ap120c-ac";
> +	compatible = "alfa-network,ap120c-ac", "qcom,ipq4018";
>  
>  	keys {
>  		compatible = "gpio-keys";
