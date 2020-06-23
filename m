Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0538420682B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 01:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387704AbgFWXSl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jun 2020 19:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387465AbgFWXSk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jun 2020 19:18:40 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 053ACC061573
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:18:40 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id k6so134693pll.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2020 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0v96ac/leez1FdRm3ShEMVPeysWT8iB1v45wX2mCpIM=;
        b=aRORO8o+nqm0mE17Kc1Nc9GsbcGXWmVGCFNn9ZXXMn821qjSFWp7c8OnDP1jwDLgMH
         E13wrKo8PCLQp2Xsb8cluhdrpDe/FwwUqvkJ9sXF4hK7da04PDrd7mgWkieFE+3oteP6
         f7oFZaCoy91XPcUkhQLRzDFDM+vwCC1KRi91+e80brRRQpQAtmUTYQWvaXrNp/IEDvhN
         NKimV3EH/8GO2Gxy0gvmnhigASjTQcfqy5JkjtPS2IYLskBqHlZliyVC/B54hY+dLmzz
         BaIEtpzCQIfj05ZFL1tCbdab078xleDKh8yQkvWLFdul3nXpx+5DMXA9SaIT97hZJs4Q
         xNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0v96ac/leez1FdRm3ShEMVPeysWT8iB1v45wX2mCpIM=;
        b=nte+vfIN6nYCIoQTrwfzVTAXFVYqjZ15tLLeCV52uLGwwcXgqH2LNj72YusAhRimxR
         H7DRLQrmFIj2yeNox8Dw2FCHXIe3GpeQGuY9ZnHI6Meha5xBAw6Bbd/0fmD5prqxi3We
         zysKRN67Cw1q0phGVoGyuZAO1XU2xYzmONQ3q7Vj9Hl+UbAZAORMZoJNQ6JCOaJsFJXO
         DtcoZSEftRH2AMSmwIw77EqUnkYQSCWU5Vw9hCadnZ6uJ6rzYmHsQOWXnpmPvK1/HVbt
         oPuANgfZMyL2SkTi2NaVb3ze9XkAd9aa7faEG4n1iMzQTzcE3bm1Lm6hO8qGUdmg5Zl8
         8F2A==
X-Gm-Message-State: AOAM533uMV+1UZLGKTuumhUZ5BzQtAoNxigUjJXZ9nhPSVE7XStf/uWe
        FfWoCLQz0z0M5JiPen2ROXo3uw==
X-Google-Smtp-Source: ABdhPJwqwUenAMlMsZ6tp1FrBJrXVkaOur2qDdhej0ImlRcHJrseQcotofWyOJamvq1ST5/QPq+YCg==
X-Received: by 2002:a17:902:6ac2:: with SMTP id i2mr25300027plt.243.1592954319500;
        Tue, 23 Jun 2020 16:18:39 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r9sm18816543pfq.31.2020.06.23.16.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 16:18:38 -0700 (PDT)
Date:   Tue, 23 Jun 2020 16:15:56 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Konrad Dybcio <konradybcio@gmail.com>
Cc:     skrzynka@konradybcio.pl, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/12] arm64: dts: qcom: msm8994: Add SPMI PMIC
 arbiter device
Message-ID: <20200623231556.GI128451@builder.lan>
References: <20200623224813.297077-1-konradybcio@gmail.com>
 <20200623224813.297077-3-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200623224813.297077-3-konradybcio@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 23 Jun 15:48 PDT 2020, Konrad Dybcio wrote:

> Add SPMI PMIC arbiter device to communicate with PMICs
> attached to SPMI bus.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>

Applied, thanks

> ---
>  arch/arm64/boot/dts/qcom/msm8994.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> index 79e6e46798c8..23e50c30669b 100644
> --- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
> @@ -169,6 +169,22 @@ restart@fc4ab000 {
>  			reg = <0xfc4ab000 0x4>;
>  		};
>  
> +		spmi_bus: spmi@fc4c0000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0xfc4cf000 0x1000>,
> +			      <0xfc4cb000 0x1000>,
> +			      <0xfc4ca000 0x1000>;
> +			reg-names = "core", "intr", "cnfg";
> +			interrupt-names = "periph_irq";
> +			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
> +			qcom,ee = <0>;
> +			qcom,channel = <0>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			interrupt-controller;
> +			#interrupt-cells = <4>;
> +		};
> +
>  		tcsr_mutex_regs: syscon@fd484000 {
>  			compatible = "syscon";
>  			reg = <0xfd484000 0x2000>;
> -- 
> 2.27.0
> 
