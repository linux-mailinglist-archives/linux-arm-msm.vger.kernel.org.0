Return-Path: <linux-arm-msm+bounces-39148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8979D8F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 01:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F32D828663C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 00:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B80C161;
	Tue, 26 Nov 2024 00:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ORbQMwZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B709C8F40
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 00:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732579678; cv=none; b=sQQzNKGrpD4r/J7hnAnNjUwNeBu/chAO+zAmrajw43+Q7hzfAmeADqh2az5ZXJKMW2j+5JgpEdPch1zTySU3QETOBwpe/wNnJ8LYTAcvUHSVrdlaws0EaKwVY8Tvp+VSGdpr6Z+bxMKLUdhbmBjb8sAktaaNuaoa1/BD7F2whSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732579678; c=relaxed/simple;
	bh=X6mpm+0aSH+yONFTblg/2zcjomYbcE73fIlBfI5RHMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugcujsLKapmbnrMeCu1xQR/qKM8OPYEEze5Nec2d3J8IabmWmvDjQra7+jvS82UF4OlTF5gXrSnWEHGEhnNhxjdbVxoQsgHiqSUgJemLUKKh3HbZzM6X0DBBdBz2DrZ15LkTNVJJuJ/VwH/0kt36SIfxhwRukpo4Wgetl4i8Na0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ORbQMwZE; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53de79c2be4so1053523e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Nov 2024 16:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732579675; x=1733184475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s0h1yJRyvRJoHgt/KNNsfZgVIwPLNDSnb2kihwUErsQ=;
        b=ORbQMwZEVk0ABiGLa8623WNatb027pWFXlY4SxlKYjZ7H6G48PI8e+vuX7z1lFFXnt
         +4e65DMtXe98gkorqTPk2CxKj4HwnSIJjZxkv92okceEmwZ46K9fjGl0Gf379ZWEyUq1
         9ueVSJKq9QrAkimIZNdXTsoua3dTFiCWbhBD0VrhrEgG4xazcme8RiEneHzQlJ733zWc
         b3+7oRqHaM30Z6A3l42U4lS58K17slfycpArKk4AF95MNw+qKGJwJOhkCCwpp0hPJq34
         NI7dZVzkLQYzoKsCM4El/VLhlp7hdirxc/rCPNYMruALCbIZd/0Cbx5Cblf0Q27OYHuT
         U84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732579675; x=1733184475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0h1yJRyvRJoHgt/KNNsfZgVIwPLNDSnb2kihwUErsQ=;
        b=vEheYiPwHNgrsqUz57/73PWW+7gCzJ+YthVVSiC0YwQ1cChXMpVhLlsBYSTzd+Fv+v
         xeUeC7ncn15uq7wRtwdDl9e8evh+KEM707oO4pUzfVkZgt3xTdROm0fKt657znJUoZty
         1FKihbq4RwNNN+/xihaIdf8SJdm0P3VlT8fW4gQDOUmMCYjtq5s2GG444HCt1jkfNfih
         m/bb3/VMcvStYDW0UceH7RPb/rdwZ2CZCuuengpuU8vi7dwgNDX2ZCbuGH0TdxjLrjkK
         Ox+vXsQB+/py1fGi+Oq6TDKcaDajk4TRMsv7sz4p0bmddfC/uqPdFN2KWkhMMTanBik9
         np9A==
X-Forwarded-Encrypted: i=1; AJvYcCUgbYIShFQu4S1dKvNhKu8rX8knVjGls8FvmX8vvY9O2GMKZzw5BbZSqTUDDanjB7gOnGGCSHspdradUjY+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1dGhb4mqkNIHHgAeMgHDUacKH9Z+027+aCW8RCIBSKlUWU632
	3TOWec+239PBK/uu5+N1fi3MBotM6E7S7NALmrzBpkbmwWg+fUtUefkO5c36DZw=
X-Gm-Gg: ASbGnctMIv9x00QYp6qmduCExBKoOENfMzqbZENXHCUhgdKboWb8I+34BGcWFPGdAGG
	LYdf8c47qOhIULplOb08RXb1HaCvTa6gP+KILkJXeJokGgxSiDp6JdfadwTaFq5DPGj+uNtNuxx
	d4ZArZFu0qDIXlSwcDKEcgWw7bQNtsqqCjs4QQu+PlLVuMB+buVF8IaLve69U+A4pxXDYWLoHct
	007hahHWERspIBh+0S858zMBgadOc7b+bKYSJAiksRl05QI/c3cEWAUzrHngMqa7lpt3WMVaZdx
	JJW4sHyVkr5Tnk1iMljz7i+KjLSZDg==
X-Google-Smtp-Source: AGHT+IHNAOdFRvV/LBBc9GEXqWd+CaGlgu2KPTG20eKSwEZ7/zIcGDm+IM+4HhB+6bbrWpaYrRfyCw==
X-Received: by 2002:a05:6512:118d:b0:53d:dc12:7cb4 with SMTP id 2adb3069b0e04-53ddc127db7mr3683910e87.29.1732579674934;
        Mon, 25 Nov 2024 16:07:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451f8csm1824556e87.79.2024.11.25.16.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 16:07:53 -0800 (PST)
Date: Tue, 26 Nov 2024 02:07:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Yuanjie Yang <quic_yuanjiey@quicinc.com>, ulf.hansson@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhupesh.sharma@linaro.org, andersson@kernel.org, konradybcio@kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, quic_tingweiz@quicinc.com
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: qcs615: add SDHC1 and SDHC2
Message-ID: <frjnnd7bvrdn5frfo4xnz35rb5zxa33eayu3oc5wux7casay64@t2tfbsf5jrva>
References: <20241122065101.1918470-1-quic_yuanjiey@quicinc.com>
 <20241122065101.1918470-2-quic_yuanjiey@quicinc.com>
 <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c0c1120-c2b2-40dd-8032-339cc4d4cda4@oss.qualcomm.com>

On Mon, Nov 25, 2024 at 02:13:22PM +0100, Konrad Dybcio wrote:
> On 22.11.2024 7:51 AM, Yuanjie Yang wrote:
> > Add SDHC1 and SDHC2 support to the QCS615 Ride platform.
> > 
> > Signed-off-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > ---
> >  arch/arm64/boot/dts/qcom/qcs615.dtsi | 198 +++++++++++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > index 590beb37f441..37c6ab217c96 100644
> > --- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
> > @@ -399,6 +399,65 @@ qfprom: efuse@780000 {
> >  			#size-cells = <1>;
> >  		};
> >  
> > +		sdhc_1: mmc@7c4000 {
> > +			compatible = "qcom,qcs615-sdhci", "qcom,sdhci-msm-v5";
> > +			reg = <0x0 0x007c4000 0x0 0x1000>,
> > +			      <0x0 0x007c5000 0x0 0x1000>;
> > +			reg-names = "hc",
> > +				    "cqhci";
> 
> There's an "ice" region at 0x007c8000

Shouldn't ice now be handled by a separate device?


-- 
With best wishes
Dmitry

