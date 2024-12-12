Return-Path: <linux-arm-msm+bounces-41811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C341E9EF80F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A700292BF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C56C222D72;
	Thu, 12 Dec 2024 17:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nPore93d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5C6215178
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 17:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734025146; cv=none; b=DyhlO4/fRZ9ntytN+vwtUIr/8LIMyg3E1F8pMgt32t06mzUEAgErIHYV+L6pAejdbFgcN7sT/F0x+ZgiAEPEbE9xB/fPQwc46994BxCaMIccpPNeD5Hm7GwyyHx6//tLhGnWazTSo45XgcVWAW6gERlhmTReU+YC6y869r1OO2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734025146; c=relaxed/simple;
	bh=eMaa+1s6Oic+vVrJQSezrnGXV/UwpVx0e4bkfGVOXxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETfCjDRqvYDkBCa3h+PCMUbkQy+Mkd43SBIbPemG+2dDZyPxTlrBoRlPiFrxT0tn1rbi3gPUhkGPzQKu8obKapNM1XN8Rb3JQorQU2QVtltXt28enamO3J1PynJg001M5jFsU1sYe9kYS8je+qmfAkdAVMKDVuqWnPo3ghJbhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nPore93d; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43624b2d453so11591665e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 09:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734025143; x=1734629943; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdPPbRbtOCRVKhqUGeFsn5kZ9oH7JqJR4etx+rwghdA=;
        b=nPore93dEANJsEg2OKBvSY3ymc8yyZlkD6KWRJof844YprztL46LhpnT4NcIn3Q9E9
         UT2vIO9AIZRUiz6vDK83dCrs5fLm8DGriEAzc1fHlB2i6fhhBOqdWiLWlpkjo6FwBo+5
         3hhT8X8CsJGv8yiYZhvhbGeo38KBglhRxjj7aYRWUyy+5kxmV3upcKwUkEZzO5ypNMz7
         BYh4fDt0Uq5T/9HbPc4U2zWMlkqYhJ13zszw05X/vZXSqqv5xWBP7WaCQM/S+Onpx0Pv
         flY/S5xFbjbeuIkGS94ttAZfILAJ85ny2S4UZskQCKPuz6SJ3fj6nEIZBLYWQRD4KJGX
         aMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734025143; x=1734629943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdPPbRbtOCRVKhqUGeFsn5kZ9oH7JqJR4etx+rwghdA=;
        b=SHJ2Tsw5IDD8GfdwfF0gm25mtvC3OLrxRMCbQlAXmKGwsi7cyqxU9C9+NXrNlap6ho
         miwidCNZjduRq2pKR69IO059CVvZBTYGpAoakKuKglJ5ZQkYPfJDNhROBWKniHAgd1Bh
         xZl6BjoUmE4grG5O+TIAK1pylgIzT5xs8eUCUVrPGnF+TcHXzYONHyVbRP9Gtdtdm5Dh
         jkHbgnhFJb1nFM7blUMA5HF/iiyRzscdVVSM9rufXOxp+feVvSszc9Vp1scOsi/SSuAQ
         Mp4G/VfG4MbMi7rw8Dw8dIzoDEtWGxtLwcheC7HwCwwW+PPI+XiykpF7rFRjDaaUPKHP
         GpUg==
X-Forwarded-Encrypted: i=1; AJvYcCVF52k8FeOPCIhtJ+VSdM6kYE5m6JNzichSbtkMDCI6/X+hJRSc7uin1f+ZJFvThiGwlrytQZbqgAha4cTz@vger.kernel.org
X-Gm-Message-State: AOJu0YwXypZWpwJweSBXK7v4z+Np+dm3gnAr0IVvCMdAcxXl9ZRdHoNV
	oSdRIj+6yqIDCVX7P1a6+4wLlINBPZpoJhYx0Hs2Kxr6wFMF6o7aBrtY1KUAOY8=
X-Gm-Gg: ASbGncv326eu+SosTAJwPUowSRe+i/eSzISqz+q9mcIvFJWAeGyYuvDRyMlyzNBWdU0
	FKAmDwKiPO+Yo3YaqUZuZlz7NkpDgrQlgZXRLdh6f/XQuHKkCHWBUs9Qt5SXI7tbORGga42aG3n
	HaWMbd4ODWLp2zwiph62+LXm3CF9nXHhg1bP0ArqKbc3szva2G9uvqVw92ZVs/vafg0MpK6YgJ+
	CzT2sGjeRP+Tp8q4MuH/5Gh0EgfzdsNvFjchoKpvZ5wSGWZx5SeU8k=
X-Google-Smtp-Source: AGHT+IE7M7KWizuTlmdXgepOOA1ZHa8E1i/d7gI8YHUlTjMROy7G2A2HxSU/h0+zZY2Hehz8nbuVQQ==
X-Received: by 2002:a05:600c:34cc:b0:434:fbe2:4f with SMTP id 5b1f17b1804b1-4361c430b5cmr72148245e9.23.1734025141596;
        Thu, 12 Dec 2024 09:39:01 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3878251bcabsm4731291f8f.87.2024.12.12.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 09:39:01 -0800 (PST)
Date: Thu, 12 Dec 2024 19:38:59 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: x1e80100: Describe the SDHC
 controllers
Message-ID: <Z1sfs2L49LqTtYSs@linaro.org>
References: <20241212-x1e80100-qcp-sdhc-v4-0-a74c48ee68a3@linaro.org>
 <20241212-x1e80100-qcp-sdhc-v4-1-a74c48ee68a3@linaro.org>
 <f2964623-63e9-44cd-b328-d502b5fddcd2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2964623-63e9-44cd-b328-d502b5fddcd2@oss.qualcomm.com>

On 24-12-12 18:34:37, Konrad Dybcio wrote:
> On 12.12.2024 5:50 PM, Abel Vesa wrote:
> > The X Elite platform features two SDHC v5 controllers.
> > 
> > Describe the controllers along with the pin configuration in TLMM
> > for the SDC2, since they are hardwired and cannot be muxed to any
> > other function. The SDC4 pin configuration can be muxed to different
> > functions, so leave those to board specific dts.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 142 +++++++++++++++++++++++++++++++++
> >  1 file changed, 142 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..1584df66ea915230995f0cf662cde813f4ae02a1 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -4094,6 +4094,108 @@ lpass_lpicx_noc: interconnect@7430000 {
> >  			#interconnect-cells = <2>;
> >  		};
> >  
> > +		sdhc_2: mmc@8804000 {
> > +			compatible = "qcom,x1e80100-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0 0x08804000 0 0x1000>;
> > +
> > +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "hc_irq", "pwr_irq";
> > +
> > +			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
> > +				 <&gcc GCC_SDCC2_APPS_CLK>,
> > +				 <&rpmhcc RPMH_CXO_CLK>;
> > +			clock-names = "iface", "core", "xo";
> > +			iommus = <&apps_smmu 0x520 0>;
> > +			qcom,dll-config = <0x0007642c>;
> > +			qcom,ddr-config = <0x80040868>;
> > +			power-domains = <&rpmhpd RPMHPD_CX>;
> > +			operating-points-v2 = <&sdhc2_opp_table>;
> > +
> > +			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
> > +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
> 
> The comment regarding ICC defines from v3 still stands

Urgh, missed that one. Will respin next week with that addressed as
well.

> 
> the rest of the patch looks good
> 
> Konrad

Thanks for reviewing!

Abel

