Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DDED3A8EF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 04:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231949AbhFPCql (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 22:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbhFPCql (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 22:46:41 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2613C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 19:44:35 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so1041436otl.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 19:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HwCtW9mzNrTFzTVTLLl4a1dn/GxG157UPQhGmQ+cq3o=;
        b=m5EVuo+wUQkS73axNAP2TdcZi75zf4TqHvGr1dntHUprgPvuc0ErA0r8FWYS5rrmcJ
         m/Hy/Eq83y2fuag6zykevt0B8VoxbIxLVcS7qAD8oSeLmKozupcn3VC0Vqw3UquWUBOA
         jtF+5YR8HKiImpUTdxG8AvJr8E6DiqVQB1ykPXeOtfYLCL+HKYOoOxlIGxxkAIgQW+VD
         yzvQkzNV5u0bbYlMNa18tlCes0Zab8Kp9eC12c0ewvuWlv6uFsyqI3F8uykDN05dRLtv
         iFUBMPl8uGNFKGZbvnbfAEX5RyxvjfU0h/lOUWngap/SNWcsez9GB/h6abikGKkdbAiz
         ltKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HwCtW9mzNrTFzTVTLLl4a1dn/GxG157UPQhGmQ+cq3o=;
        b=qNmb7vSAEwDkhykMY/NGFwcWfQ6kgpauBFR34rWbOMDa0R8Hh/k2R6+CI6pn6czswu
         qIFSNpU8s8rhZ5TPnNwljFte+JAKQwiXnDyvW9gcJ2hyLiwSJtkp1O/RwtUv56KhSoXc
         ORcjtHBISd6Ut4aeWC3jhTT+w4eKiNr6ymKRl0VWN+Ttz8lSj3ItT/AMuW6A8voGU2WH
         NPMvnXVctWJnObUKV3Ue+Z5E9Fu+LYtiMqeSLYKyZQFgmwfP+Ww+EADudA8AsrAqjch0
         K2UrbpniGD7XoMxjxQOpKSVIz7K/0SaouZSBj3IVh1RVn4ckOb8DR429yDFWo4aCirZ9
         k5qA==
X-Gm-Message-State: AOAM532n/sn5FaX9Stv0bA2mRO08bin9UgQzMN+8Ud9RHmLDnqDKDB62
        FSPs51KSFucBYhCVq+741lIBqw==
X-Google-Smtp-Source: ABdhPJzPIQDc6hOnqT4eD17phVGCPWL3ZnCuFq1Q0VCStFCPJlDjB4kjdaHezmnK534wIA0hHneijA==
X-Received: by 2002:a9d:4d8d:: with SMTP id u13mr1785621otk.367.1623811475151;
        Tue, 15 Jun 2021 19:44:35 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v8sm84158oth.69.2021.06.15.19.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 19:44:34 -0700 (PDT)
Date:   Tue, 15 Jun 2021 21:44:32 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sm8250-edo: Enable ADSP/CDSP/SLPI
Message-ID: <YMllkBcLzrM3vdvM@builder.lan>
References: <20210616005843.79579-1-konrad.dybcio@somainline.org>
 <20210616005843.79579-4-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616005843.79579-4-konrad.dybcio@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Jun 19:58 CDT 2021, Konrad Dybcio wrote:

> Enabling the hardware thankfully comes down to a simple status = "okay".
> We assume that the firmware is provided by the Linux distribution, as it's
> signed and needs to come from the stock Android.
> 

Are you okay with the default firmware paths? Or perhaps would it be
better to shove them into qcom/sm8250/sony/<some-identifier>/* to avoid
moving them later?

Regards,
Bjorn

> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> index 0d7e3dbb12b1..82ae246694ad 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
> @@ -118,6 +118,10 @@ ramoops@ffc00000 {
>  	};
>  };
>  
> +&adsp {
> +	status = "okay";
> +};
> +
>  &apps_rsc {
>  	pm8150-rpmh-regulators {
>  		compatible = "qcom,pm8150-rpmh-regulators";
> @@ -410,6 +414,10 @@ vreg_l7f_1p8: ldo7 {
>  	};
>  };
>  
> +&cdsp {
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	status = "okay";
>  	clock-frequency = <400000>;
> @@ -516,6 +524,10 @@ &sdhc_2 {
>  	no-emmc;
>  };
>  
> +&slpi {
> +	status = "okay";
> +};
> +
>  &tlmm {
>  	gpio-reserved-ranges = <40 4>, <52 4>;
>  
> -- 
> 2.32.0
> 
