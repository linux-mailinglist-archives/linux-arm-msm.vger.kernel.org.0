Return-Path: <linux-arm-msm+bounces-45185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B75E2A1309E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 02:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EF01888968
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 01:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E710B1CD1F;
	Thu, 16 Jan 2025 01:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xfyFxeK3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8822331
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736990268; cv=none; b=r5zlLY7JJBs70agpA/htnTDsraRFrCMvraUaUC+DGVDsyU2+9SzV/jL3PCZ5oTYMU9Doyiy/e6OglNmt8PI2vM+9FKkJTVw5AwHi+aOPJ5frG9PYMkicACETjp6EU+m7SwwDl7FGLh1UBZDXW4enuq5J0YnPlfsAn2bYUo8itBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736990268; c=relaxed/simple;
	bh=mOnubyS0GnJSfAnM1KwlKeEK9I0amurNeess9vv2aMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoRH5nkX1cH9wt+FSg6uN/hxXcAZxj4nFRlHFeXGl9pGDI1DwpDBdcGx8yeP0FKwL26WX1SBLfxrRGziJbJM6UYzfswgMN3YtZ9gTgPEi3OXgTQbt06HVN6fcXjRdNjgKDhVycMvg+uIfQ7Iy+cfM8QEScNjP7NxDeA8NGCpzqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xfyFxeK3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so375240e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 17:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736990265; x=1737595065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eNfPYyfZy53nY6eecpkazw5JP/hsMfuVMJ+lNdVWA44=;
        b=xfyFxeK3hfXEvTSIK2qyjd1JLnFAXkyUte2Ue1OfMSY4Y50yZZm/AxqKybT8DTNjdT
         mg+Ew7JmFik8TDlnLQhPYfxSxyQ2pmOyR19XvBvLNG52nwQCbsJg3+UhNBosCMABl2yW
         63O7U1/Ef8qqmVBTL+ySZWPakuFRe12EDUc4buFq+Xz92LM2yGso0/FEDjcd63gY8msE
         EKdBpzCXX9bLUCGU6MJCRe52aYXEBp6b3zwVjqIM2akIOU4V3hJyE69F0uP7ojDAhiFy
         Webuamv6mtRHKvgF3Kjb2RcVzKp+w1ISs17QPYosfuooa3LkDx9GrHWB9YONFPIe/jjH
         /ZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736990265; x=1737595065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNfPYyfZy53nY6eecpkazw5JP/hsMfuVMJ+lNdVWA44=;
        b=DpmIwisadooZ4Jq/7ANPWFe/csLS+AlPivlBLm8/5QQXDZX9OejV9+pg8RdFhcIZMT
         yPjwXHiuu65uoM2Bb20xfXNbXDURODF9ogHSaV2JYeN5L1tR03+TPWDGQ23v7LOKBxcW
         FTm6gmZrbZsCFsVDaiprcHJL6fGqJsB9EL4YKuz3PLG6eoWCvAUjqTJZv4PrjSot8r5G
         LLAnfNwfq7lvTqs4+xqCiquspSCIdkq53dKj4La0/SHfs+IeF2oNwAWvmqJ5gkYjPMmg
         X+n/PN2ShXMYhD5zt+l5Vyk3ObV8gsfZ8eTAzFaFG1Dj/Tz6xjzaMik0REnSdTp9wi2L
         DUtA==
X-Forwarded-Encrypted: i=1; AJvYcCVFjI5wCNDh3/uazJzdTlc61rDTw+5PjrBVZxcMN7qUImlJwSaJwRJIHmqhG+ITP1OOWye05wy8+OQhbORm@vger.kernel.org
X-Gm-Message-State: AOJu0YwMsNuoHlNZvCt+ciD7Z2dM7ZLegeDufWWgfYtXH2xWvCnf7T91
	0HmWI0rxo1X9WBgB+1UPufUVfJCQUhNOmybpC4MmStD9IVcAAlffqoN25jShgoM=
X-Gm-Gg: ASbGncuMwr0J6APAqCxK55Y37dSxriS8Su+yFfwK+4xC0OdzC7dLnwqZyAAPoE+F1dM
	jOSUm8Nnc0AATfODf2ltNAp0L1ngK0W3lsHZRAQB3btDy81GmDXtdUceJn8GW20Z1M49eoFI7TG
	NuqJmEYlSkuLumK66xUq1mr8aTg4pEB5DBLIlKZDOZxcFypNAH1DuoQMbS9Shbpu7xxa+3MBvzS
	odjQ4w96jjdRYNY277fmC/J1C3g1UfQyJH3x4IEqVXdNtxSURCgHSl9kUSFp3p9KnAi3p26yhXT
	yVxKPujMYYkD295kGjDVmQdsjTtIA+Oj4GbW
X-Google-Smtp-Source: AGHT+IGre7SUCG88en2NKpNyc11/WQbgYt8BKjA6Aeude8fuHxTmSL2WOWwm4KnCuAjQVKdb5BXbhQ==
X-Received: by 2002:a05:6512:3b0d:b0:542:6f2a:946a with SMTP id 2adb3069b0e04-542845070a2mr8745892e87.6.1736990265285;
        Wed, 15 Jan 2025 17:17:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428cbfc85asm2164358e87.102.2025.01.15.17.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 17:17:44 -0800 (PST)
Date: Thu, 16 Jan 2025 03:17:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8750: Add LLCC node
Message-ID: <htmo2fk7uwwyqe6dgohoyrlcrwkfflf5lewx5pmuzoqu2v7noe@om4ynknmnkhu>
References: <20250113-sm8750_llcc_master-v1-0-5389b92e2d7a@quicinc.com>
 <20250113-sm8750_llcc_master-v1-4-5389b92e2d7a@quicinc.com>
 <7jo242e674fsqbia7udid4abq4euofishstmix6m7xqzdgcqiy@3zukruizim4n>
 <a81ca6f2-2f09-4836-b614-b169d5c65bfb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a81ca6f2-2f09-4836-b614-b169d5c65bfb@quicinc.com>

On Wed, Jan 15, 2025 at 02:47:52PM -0800, Melody Olvera wrote:
> 
> 
> On 1/14/2025 2:59 AM, Dmitry Baryshkov wrote:
> > On Mon, Jan 13, 2025 at 01:26:43PM -0800, Melody Olvera wrote:
> > > Add LLCC node for SM8750 SoC.
> > > 
> > > Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8750.dtsi | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > > index 3bbd7d18598ee0a3a0d5130c03a3166e1fc14d82..3cd7b40bdde68ac00c3dbe7fb3f20ebb2ba27045 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> > > @@ -2888,6 +2888,17 @@ gem_noc: interconnect@24100000 {
> > >   			#interconnect-cells = <2>;
> > >   		};
> > > +		cache-controller@24800000 {
> > > +			compatible = "qcom,sm8750-llcc";
> > > +			reg = <0x0 0x24800000 0x0 0x200000>, <0x0 0x25800000 0x0 0x200000>,
> > > +				<0x0 0x24C00000 0x0 0x200000>, <0x0 0x25C00000 0x0 0x200000>,
> > > +				<0x0 0x26800000 0x0 0x200000>, <0x0 0x26C00000 0x0 0x200000>;
> > > +			reg-names = "llcc0_base", "llcc1_base",
> > > +				"llcc2_base", "llcc3_base",
> > > +				"llcc_broadcast_base", "llcc_broadcast_and_base";
> > > +			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
> > > +		};
> > PLease take a look at sm8650 and change your patch accordingly.
> > 
> > NAK
> 
> Apologies; the contents of this patch are very similar to sm8650, just
> different offsets.
> Only major diffs I see here are the node namde (cache-controller vs
> system-cache-controller)
> and the formatting (two regs/line vs one reg/line). Is there anything else
> you mean by
> this comment that I'm missing?

Formatting mostly. And the use of the uppercase hex values.

> 
> Thanks,
> Melody
> 
> > 
> > > +
> > >   		nsp_noc: interconnect@320c0000 {
> > >   			compatible = "qcom,sm8750-nsp-noc";
> > >   			reg = <0x0 0x320c0000 0x0 0x13080>;
> > > 
> > > -- 
> > > 2.46.1
> > > 
> 

-- 
With best wishes
Dmitry

