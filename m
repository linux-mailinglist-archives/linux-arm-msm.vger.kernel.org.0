Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708B067363B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jan 2023 12:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbjASLAH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Jan 2023 06:00:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjASK76 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Jan 2023 05:59:58 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7106A4A1F4
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 02:59:56 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id v6so4642185ejg.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jan 2023 02:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N6nY6fJM75CZIoU135a8CNa43DlKeqBOKG/1r1pr9Zc=;
        b=l1Q0OgZxC/wqPUcBvYPapHVed2GEYi3QSgU/GlMVlJPpD94dS4rAK1/5cf/6mu+i7K
         V0+w+WUTnEmRIhqBwiaALN6resCrNtkcP0RYCtM6MQRVA2iWRbkvd/hNeKMF24Qq0Nf2
         Acvw1K7spBJYeklg8RWX/RH/b5Tab+gX5d250nLcim4rml7rhWVV5Cd1AtCag/2C9DRs
         fF1MIHW/FZKFxWR0Q1gZY/g80IqKTqKSaDzJB7UpImH7DCPKJP7JkEGc4VfKgR79Udhg
         yDs0yAEN6kxeW4ce5s0xwClceQ4O6o2XhYYZttRHAve6tqhIoOz6r2PEA6jzpexefyte
         0wTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N6nY6fJM75CZIoU135a8CNa43DlKeqBOKG/1r1pr9Zc=;
        b=K9N6voM9H7Tbofwi0gwp08OzEXrupk/OYvG6zcyVtnLcLaN+lFp7DJUXtJnQ4Tm0DJ
         mKnFLHybHG7m3fOL9REXjNpE0GOLwfyjPc7ydMkIdfIzRRmzKBD1hnBNiKyRWcl4/E6S
         t3JZLKF2AJQ5k+O6vlNOFnXVFYixSuuqKJX57VJ0VH0DBMS39L8OY5wwPUIbiOsVRDNg
         kETKpzgh3aes57KlfsKEZWrFgXLtE86017J9KCM56yM8UHVYC76/N/N6KES2QHrQP/3c
         p9sDnqKgS48oaN1mYqtxdWhdjPZJHXkC0jonVvzU9ncvmIv0kxEBQjTsdEKKRul499Xm
         d4GA==
X-Gm-Message-State: AFqh2krD9nDI0ngzqMTa98lfkkKl4hhs7YIuBsg07gP3++YDLL6ZPtbu
        IvQF9fWyit91h3foM1MsKyQt4w==
X-Google-Smtp-Source: AMrXdXuPQAXW8U8qbhjJ4DerHUf+TQm6y/3BGd/y7cLvlw8DdwWzgAqKfrVsxRvE4D/ocrxaHCIHaA==
X-Received: by 2002:a17:907:11cd:b0:870:b950:18e7 with SMTP id va13-20020a17090711cd00b00870b95018e7mr11316258ejb.19.1674125995029;
        Thu, 19 Jan 2023 02:59:55 -0800 (PST)
Received: from [192.168.1.101] (abyk37.neoplus.adsl.tpnet.pl. [83.9.30.37])
        by smtp.gmail.com with ESMTPSA id b2-20020a0564021f0200b0048c85c5ad30sm15370210edb.83.2023.01.19.02.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:59:54 -0800 (PST)
Message-ID: <c2dbe186-f338-5b76-b263-4c83c205089e@linaro.org>
Date:   Thu, 19 Jan 2023 11:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sm8350: fixup SDHCI interconnect
 arguments
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230119105434.51635-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230119105434.51635-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.01.2023 11:54, Krzysztof Kozlowski wrote:
> After switching interconnects to 2 cells, the SDHCI interconnects need
> to get one more argument.
> 
> Fixes: 4f287e31ff5f ("arm64: dts: qcom: sm8350: Use 2 interconnect cells")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
I think it may be worth including

include/dt-bindings/interconnect/qcom,icc.h

to get QCOM_ICC_TAG_ALWAYS (which is the default
one set when the tag is 0) which is more telling..

But for the change, of course:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> index e466dd839065..4efe79985186 100644
> --- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
> @@ -2549,8 +2549,8 @@ sdhc_2: mmc@8804000 {
>  				 <&rpmhcc RPMH_CXO_CLK>;
>  			clock-names = "iface", "core", "xo";
>  			resets = <&gcc GCC_SDCC2_BCR>;
> -			interconnects = <&aggre2_noc MASTER_SDCC_2 &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_SDCC_2>;
> +			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
>  			interconnect-names = "sdhc-ddr","cpu-sdhc";
>  			iommus = <&apps_smmu 0x4a0 0x0>;
>  			power-domains = <&rpmhpd SM8350_CX>;
