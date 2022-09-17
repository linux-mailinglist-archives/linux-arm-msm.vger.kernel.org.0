Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 556D45BB862
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Sep 2022 15:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229527AbiIQNM0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Sep 2022 09:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbiIQNMZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Sep 2022 09:12:25 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [5.144.164.166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48A32A70F
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Sep 2022 06:12:24 -0700 (PDT)
Received: from [192.168.1.101] (95.49.30.72.neoplus.adsl.tpnet.pl [95.49.30.72])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id DE2853F30D;
        Sat, 17 Sep 2022 15:12:22 +0200 (CEST)
Message-ID: <8cd3c0c3-41c4-79f1-9419-6859f126f087@somainline.org>
Date:   Sat, 17 Sep 2022 15:12:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [RFC PATCH 6/7] arm64: qcom: dts: pdx223: correct firmware paths
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
 <20220915152630.133528-7-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <20220915152630.133528-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 15.09.2022 17:26, Dmitry Baryshkov wrote:
> Correct firmware paths for the Sony Xperia 1 IV to include the SoC name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
SONY/not-SONY discussion from my Sagami email aside, it's fine to
change pdx223 to nagara here, as its cousin, the 5 IV was announced
like 2 weeks ago and looking at the fw that was uploaded to their
OTA servers, I can tell they are still using a single key for
devices sharing the same SoC, as they always has been.

Konrad
>  .../boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
> index d68765eb6d4f..ae867dbe4762 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
> @@ -523,17 +523,17 @@ &pcie0_phy {
>  };
>  
>  &remoteproc_adsp {
> -	firmware-name = "qcom/adsp.mbn";
> +	firmware-name = "qcom/sdm8450/pdx223/adsp.mbn";
>  	status = "okay";
>  };
>  
>  &remoteproc_cdsp {
> -	firmware-name = "qcom/cdsp.mbn";
> +	firmware-name = "qcom/sdm8450/pdx223/cdsp.mbn";
>  	status = "okay";
>  };
>  
>  &remoteproc_slpi {
> -	firmware-name = "qcom/slpi.mbn";
> +	firmware-name = "qcom/sdm8450/pdx223/slpi.mbn";
>  	status = "okay";
>  };
>  
