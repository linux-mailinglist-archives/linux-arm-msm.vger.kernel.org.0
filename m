Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D353E677B0D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 13:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjAWMfE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 07:35:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231287AbjAWMfD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 07:35:03 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E582BB97
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:35:02 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id v5so14391728edc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4+KUClQ0qkIGm4MUSZut5LiRn33cDlgrxS0MQDfslk=;
        b=mdp59eDBN45F1ORkm0FDXW8RZkcxCQdrrW/zgKu8wyb6Xf0MsVeWRdknox7Bf4GA9l
         ePuQDjvOLw/kpz1WZv7xyLOBDtCntn3wU1d4C0nRNBKTkFQmpkTZHfAbzFFAf6FIAw2D
         H2oTYV5pbpT26rwJbQrc5z3nkSAnEsgnANEs8lTqXGI7u/q+8Z0D8GTRjhJFC2Fh6hWL
         cWECUKVJE6r3NuYdDqBoUd6A5GkRLC0yBiKoGPK26XEy2VATQIRo4w64oR+kH5QBTFuh
         IHTXmG77s6Ty3sHTtnBhgA5RHPSutMl3ySoNWSHypYtuybIqKJ/r5i133pCjaWp5Jf44
         4YZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4+KUClQ0qkIGm4MUSZut5LiRn33cDlgrxS0MQDfslk=;
        b=8ME8fQEInQA2usDyoeVUnRpoLCSfdfZTyDBthhAhZsmR9Xh1y5Hl9xwnIrd2UK/MB0
         t6F4WSBNdRmPM0IzmdT4cU8jtpVbb052MfpxoTba+O2w0UtllGkaKD3csTHqDsCUm08J
         VAfUHDvRyUhoDtDUnqquIakJlKpgdAX1CMSzGyveIq2ieruP8ZjS/hR5B5pqYW5v5r6g
         uR69pPxBb69G5sEHxQWNZTthcxH/ykbIl5rmeGkyQhsXRsNHdU+FymVbh1k0K4v7Jhuq
         Ok3zzRYASLyufHWSycTz91feighrkxiEGF6PZvEAz0TRw5UsIUn3F7+v534cZpjeEh3a
         nl1A==
X-Gm-Message-State: AFqh2koIXjfJSQE6IW8DFPDgx2IOFG4QwnAkr8rEm+jUOsBBEDZJh9vV
        3bkId3QfModRYZRNICbdY9/+FQ==
X-Google-Smtp-Source: AMrXdXuo/91LTzUQh+IngNBNh6kfYJo9YB62kuFstBqw4VTGxkVtjkPijeYfEcHXugOQ/l9W8jQS4Q==
X-Received: by 2002:a05:6402:159:b0:49d:a87f:ba7b with SMTP id s25-20020a056402015900b0049da87fba7bmr24391582edu.39.1674477301059;
        Mon, 23 Jan 2023 04:35:01 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id v19-20020a509553000000b0046cbcc86bdesm21768965eda.7.2023.01.23.04.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 04:35:00 -0800 (PST)
Message-ID: <1c226b22-cc1a-7393-270f-330095c93872@linaro.org>
Date:   Mon, 23 Jan 2023 13:34:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: ipq8074: add QFPROM node
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, srinivas.kandagatla@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_kathirav@quicinc.com
References: <20230123101631.475712-1-robimarko@gmail.com>
 <20230123101631.475712-2-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123101631.475712-2-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 23.01.2023 11:16, Robert Marko wrote:
> IPQ8074 has efuses like other Qualcomm SoC-s that are required for
> determining various HW quirks which will be required later for CPR etc,
> so lets add the QFPROM node for start.
> 
> Individidual fuses will be added as they are required.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
> Changes in v2:
> * Enlarge the register space size due to info from Kathiravan T.
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/ipq8074.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> index 8eba586065a3..ff59a2f38293 100644
> --- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
> @@ -301,6 +301,13 @@ mdio: mdio@90000 {
>  			status = "disabled";
>  		};
>  
> +		qfprom: efuse@a4000 {
> +			compatible = "qcom,ipq8074-qfprom", "qcom,qfprom";
> +			reg = <0x000a4000 0x2000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		prng: rng@e3000 {
>  			compatible = "qcom,prng-ee";
>  			reg = <0x000e3000 0x1000>;
