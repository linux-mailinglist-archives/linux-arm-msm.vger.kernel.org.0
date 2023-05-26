Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F88E713058
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 May 2023 01:22:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235125AbjEZXWM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 May 2023 19:22:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbjEZXWL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 May 2023 19:22:11 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B93FF3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 16:22:07 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2af29e51722so13314531fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 May 2023 16:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685143326; x=1687735326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tgay1i2mWfKJgLUSALT2q6Por12IQIn4tLKG1lgFbi8=;
        b=N6LNyydRX5rVJVxgw8IZEXoyjVATYEhuoVGRLpIVZIwbSipsrLf00upF2dDbB8w6pQ
         TMj4CU1fw5rDFlTDzN09lYo27tehACTJ891pcWiyxNZz2UBTQDF+cGHYTUtYSGE7zZmS
         SqOjA5l5gU6n155LMVT3JgvWF9sv3oF0/xG/N0DQOzxB66jlgYxG+81q/VecwPUxXd3A
         ZxR6rn/BE3RE+vU5ALqA0wZ2sobeYlpQzF1Q3N4kgH8j05IbZPMuEEc4mzWwGYT8PYCI
         QB8/u+s2D6N0fdYA4Z7t/tTpZMLKIIaucY/ocukPdBDbMr7UaUgyxqmbWYAzKe/qRZ5B
         wdvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685143326; x=1687735326;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tgay1i2mWfKJgLUSALT2q6Por12IQIn4tLKG1lgFbi8=;
        b=gYBndoPSgyzTYWDFgc8QpWPCG0YUVHn85vnbBCx+msf7THkSUNzr8uTJ7wfXAQHy3W
         ueSN+o8X14PyQGnClTjoszIcwNviTHfl5ASdksR6d2zWs+3MUMWRk6ZB0wL7rZOzM8t6
         Ff1QBUA8x7g8q9znM/K1OAkdeOUzQkvVEkssneFkM3+gBkA7lsDCV9yhAPYPdZWZjGya
         XHVreuQ7MpTc2cwJ7u4WIFSHBi4UJlYxt2/heRAqVWS2y8ejYt3u4C86IAtOhwQpb9pI
         s69XeNu1aOWBCXr61ZARAqu/473X1Pj/3d8eYh03ZHhbXHoTlZmycobakpSyBbQLkVKc
         jBxw==
X-Gm-Message-State: AC+VfDx8H4LmKr+ivUYmo9fKFLAH2Py9UccpMDy/YLzz4IkuNqNGckLt
        fkCetwQHFCPcpxwXKN8sN6jtjQ==
X-Google-Smtp-Source: ACHHUZ6gC0bFFFu7SfxVR6S+NbDsKo/pEXKrvN6NrzxUpnp0s3GKZfASwFUpkED6hwxU5CHA6VQ+4A==
X-Received: by 2002:a19:f719:0:b0:4ef:ec6a:198c with SMTP id z25-20020a19f719000000b004efec6a198cmr948279lfe.26.1685143325692;
        Fri, 26 May 2023 16:22:05 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id r2-20020ac24d02000000b004f3b1dd7989sm832962lfi.172.2023.05.26.16.22.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 16:22:05 -0700 (PDT)
Message-ID: <76513a6b-a8c1-0bc3-a094-2cce1aa8ef87@linaro.org>
Date:   Sat, 27 May 2023 01:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qdu1000-idp: add SDHCI for emmc
Content-Language: en-US
To:     Komal Bajaj <quic_kbajaj@quicinc.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230523135733.3852-1-quic_kbajaj@quicinc.com>
 <20230523135733.3852-5-quic_kbajaj@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523135733.3852-5-quic_kbajaj@quicinc.com>
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



On 23.05.2023 15:57, Komal Bajaj wrote:
> Add sdhci node for emmc in qdu1000-idp.
> 
> Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qdu1000-idp.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> index 9e9fd4b8023e..6e988e90aa50 100644
> --- a/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/qdu1000-idp.dts
> @@ -448,6 +448,29 @@
>  	status = "okay";
>  };
> 
> +&sdhc {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc_on_state>;
> +	pinctrl-1 = <&sdc_off_state>;
Please do

property-n
property-names

we've had a little bit of a mess over the years but we're trying
to unify that.

With that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	supports-cqe;
> +
> +	vmmc-supply = <&vreg_l10a_2p95>;
> +	vqmmc-supply = <&vreg_l7a_1p8>;
> +
> +	status = "okay";
> +};
> +
>  &uart7 {
>  	status = "okay";
>  };
> --
> 2.17.1
> 
