Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D04474013F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 18:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjF0Qcf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 12:32:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbjF0Qb4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 12:31:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127671B0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:31:45 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4faaaa476a9so4434138e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687883503; x=1690475503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bauePcOtZ+EWi9plQW7xDmbFhAORWaDetr6LMDlu6RU=;
        b=uUOBk3N/f83axkX6v5eStt6K2ouFXfPDokCMptOZP/WxfzFH3XZh6VxQnvFVeqNru4
         M7N1n3prMcHagUrBBJrJIos6J4kX78B7MqUvHA27YdmQke1psZltLSnz2ZTDJfBx5nzX
         fO54KN1kZSJA3M2qeiYOR7OJt2UPaMn24oc1KQ2Qgc1RKH6JSAiCzKzv+oa0bP6iWg6J
         qtLvlNDDTvZVMqBXwoGV4wt7iBoJ5MciQxfSOQBQeSUGf4VPp+HQVn317zrd8+rXvmw8
         rKv301FE0aBU6r2jKpoE5lw1jgW7ldYZm5KGD9nK16rAnhAVmjv6JESVIYu7y+u5m0P6
         f4Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687883503; x=1690475503;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bauePcOtZ+EWi9plQW7xDmbFhAORWaDetr6LMDlu6RU=;
        b=h0TT8H47oJ7fCjRBcdlVEACmgAOkBeHa7euDNdksM7xrvxv0Io47r40wGsDzCBlGzW
         krHQAnQ9XieECT81omXG/uA2cj2vgvM/JW/jzFl5VTp+QZbeijmBfIzNaS6Tk9VMyo2m
         2xjg0CDrmPrTHWDFRWyzEqRruPlgent8ffe89RjB4Nl7oQpcI/Dw0SkBx0pCOGrY446r
         iJ4e6+xXV/rcdgv57INaVxPIvPDvowLGoPFGAZDK1/TItBPKPWlYBenc0AMjNe42/5IU
         SMPQipKlP57sxo4r+Pzow5ac1VIQxToURGNrY2s12FdYTA69QtTvAVFaZjIBQHB0xfDK
         FtLg==
X-Gm-Message-State: AC+VfDxULUihr8izOtwgbJJCnU2gHV7dW3DqJz7TokOQaN4ZvIkNxQkX
        0FMi4UGqpgGtzkTmwq8JTNH67g==
X-Google-Smtp-Source: ACHHUZ4le5rbMHhIweRiNkGPP0LiE+M+Kq9/B+8FCbQeh/eaqoBrYjgD5XRmN8HDFwXpwIQELwbDFQ==
X-Received: by 2002:a19:ca4e:0:b0:4f8:8be4:8a82 with SMTP id h14-20020a19ca4e000000b004f88be48a82mr12844823lfj.22.1687883503412;
        Tue, 27 Jun 2023 09:31:43 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id d30-20020ac25ede000000b004f3b4d17114sm1568171lfq.144.2023.06.27.09.31.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 09:31:43 -0700 (PDT)
Message-ID: <61c645f9-79cc-23f9-7df3-24cdec80d28a@linaro.org>
Date:   Tue, 27 Jun 2023 18:31:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] arm64: dts: qcom: c630: add debug uart
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230627-c630-uart-and-1p2-reg-v1-0-b48bfb47639b@linaro.org>
 <20230627-c630-uart-and-1p2-reg-v1-2-b48bfb47639b@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627-c630-uart-and-1p2-reg-v1-2-b48bfb47639b@linaro.org>
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

On 27.06.2023 17:32, Caleb Connolly wrote:
> The c630 exposes its debug UART via a connector on the PCB, enable it.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index 94e37e5d2177..090f73251994 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -33,6 +33,7 @@ / {
>  	chassis-type = "convertible";
>  
>  	aliases {
> +		serial0 = &uart9;
>  		hsuart0 = &uart6;
>  	};
>  
> @@ -708,6 +709,10 @@ bluetooth {
>  	};
>  };
>  
> +&uart9 {
> +	status = "okay";
> +};
> +
>  &ufs_mem_hc {
>  	status = "okay";
>  
> 
