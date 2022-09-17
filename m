Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA5A65BB865
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 15:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbiIQNNJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 09:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229528AbiIQNNJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 09:13:09 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 010E72A258
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 06:13:06 -0700 (PDT)
Received: from [192.168.1.101] (95.49.30.72.neoplus.adsl.tpnet.pl [95.49.30.72])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2BCB03F6AA;
        Sat, 17 Sep 2022 15:13:05 +0200 (CEST)
Message-ID: <dc3e9a07-7476-b92e-bd2f-ed486446fad0@somainline.org>
Date:   Sat, 17 Sep 2022 15:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH 7/7] arm64: qcom: dts: nile: correct firmware paths
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
 <20220915152630.133528-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220915152630.133528-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.09.2022 17:26, Dmitry Baryshkov wrote:
> Correct firmware paths for the Sony Xperia Nile devices to include the
> SoC name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
SONY/non-SONY discussion aside again, nile is totally fine here

Konrad
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> index 09c07800793a..71b9e3170d63 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
> @@ -155,7 +155,7 @@ extcon_usb: extcon-usb {
>  };
>  
>  &adsp_pil {
> -	firmware-name = "adsp.mdt";
> +	firmware-name = "qcom/sdm630/nile/adsp.mdt";
>  };
>  
>  &blsp_i2c1 {
