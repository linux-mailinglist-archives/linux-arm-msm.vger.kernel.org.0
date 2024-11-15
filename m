Return-Path: <linux-arm-msm+bounces-37966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECEB9CD9FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 08:36:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FD83282E39
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B631898ED;
	Fri, 15 Nov 2024 07:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lK+32Qas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1AC187876
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731656179; cv=none; b=aVY+7aAQTAk610A7j4FVHlAmrrZMX1W79cnwzdp0zq+/aSwrVBMWjxFN1fJ+CLp2vBqVQQ9eShXV7H1DhODDPf51vJAeRhAqg45TIVeL2CycM5R0/AHvlhM6ZyVT1IaH/6G5cPgB8X11U/+Dbp7JJAVyHvuiQKjHlkSfbFuG6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731656179; c=relaxed/simple;
	bh=SIEo8s5hFS6DUYrU3deosBF91zXunNrtoBkPt0/ZWIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THeBf7qoDnkUjw+ZU/H548DOM5lqNrgMldVrq/UKoG7hUJNQYBdpHOit9w4Oj5rYvdjJUAFsX8WgpOqzBYGHkSOMkwfFrohI2EhZYwdwQIx0sBMele94eRteLlOzlMnoWqWbrFNkwDXyPpUYDHxXLV08k8CW5O7YZVxo5Ah9+IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lK+32Qas; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53d9ff92b14so1545436e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 23:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731656175; x=1732260975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f/zaNJXsl01a5zNIwyl9L4dlmA9eGCe/qLUK5CKx19E=;
        b=lK+32QasuWXjOaanOgx+r4bgIECKTotq9nyq6CrRJpgSdUvF70mX5FYTmKenid80LL
         zB8E16rqLHV/kw5EheFruIGWpTMzu0edzj7AyEDn4VrxtFQOuCykg5pRf7Zk/UcpXGiz
         xv15QsGPz014I9eZvIUlad45uEzEoxMaoFuHD4P4bnUJiTyDW+c0g3ncKn4RH7GH5Scd
         LB47PSiq4wGqFTeHn9T2jjBMfOu/u83aE5FEMI0WVgE2hLLkqcjCzAAbFT/25KWXhatd
         oP7hZ01KX3iLYJockrYyheYawJWlSNdHRN19tn1BxusWpIxWc058ZyH1WDaDXrPEoIyy
         k+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731656175; x=1732260975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f/zaNJXsl01a5zNIwyl9L4dlmA9eGCe/qLUK5CKx19E=;
        b=GCTUj4TVZZbNlyI2D8Mfa08WqTtvOuXB8X6I5kh8C8aW5KEIWfG//yxK1VNVxP/cH+
         yntXifvPr83p80BzJobrSk+Psl38FtRjnwEeT/Iyek5j3i/VFBlGi+8x0rERm/+6zGpD
         cTocTXPMEd5xQu2JqzQuBbcT3Sa5Z2suv5xH/6d8t1iZIYPgqU0DZbVcxIzZCMDfHwR4
         fdqJ29aBNfh3SjOIV/XY03irh8tkDyhLTom+LNpZxSvgq71g5xL2BqYDF4T3Sf9OH9C1
         j0iwfpZCjjmz+5DnBToewV6m1u+a0POY699c3UCcdWmoikBaoKYZd15+p7yyxnwyjIP5
         vOOg==
X-Forwarded-Encrypted: i=1; AJvYcCWlvrTqfR/CpsB3JNSdAeXvTeZIMwQC01ygunIpAV43UqierGlLU8oJQ8VAN78dIewYyVSoQ4bGnunLnaZO@vger.kernel.org
X-Gm-Message-State: AOJu0YwMmR2ZF6xxOHdCyD2ym6o29+yEUwTjFbrlRHXJ4pn/5dJkW8ii
	LDpRRFuXdrBgg0H6eftUsqVFCwwqK6zAle4qmePiBcVkcmFcgGGYd6QRa2zJ6No=
X-Google-Smtp-Source: AGHT+IELxNr42kTGq86yNt7HpRgRuLDZHJp2+y0D3HJbNVFtEX+4EYZRDRiqgDM2tZ7bw4WDChznfA==
X-Received: by 2002:a05:6512:3b25:b0:536:554a:24c2 with SMTP id 2adb3069b0e04-53dab2a04dfmr512452e87.13.1731656174673;
        Thu, 14 Nov 2024 23:36:14 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da6530d32sm473369e87.139.2024.11.14.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:36:13 -0800 (PST)
Date: Fri, 15 Nov 2024 09:36:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Tingwei Zhang <quic_tingweiz@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Ziyue Zhang <quic_ziyuzhan@quicinc.com>, vkoul@kernel.org, kishon@kernel.org, robh+dt@kernel.org, 
	manivannan.sadhasivam@linaro.org, bhelgaas@google.com, kw@linux.com, lpieralisi@kernel.org, 
	quic_qianyu@quicinc.com, conor+dt@kernel.org, neil.armstrong@linaro.org, 
	andersson@kernel.org, konradybcio@kernel.org, quic_shashim@quicinc.com, 
	quic_kaushalk@quicinc.com, quic_tdas@quicinc.com, quic_aiquny@quicinc.com, 
	kernel@quicinc.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qcs8300: enable pcie0 for QCS8300
Message-ID: <273fm6dpwt3xzdm5khzipdqiqzpo7zy5jsc4iesd3dt72ldhdw@wd2urfqyt6fn>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
 <rg4isufmnhnbsiljm34rfdsn46gfpatbsiscynaqtsnykbhnm3@ovcaulkfj4nk>
 <26943ea3-109c-473d-818b-2a08dba859ab@oss.qualcomm.com>
 <288be342-952b-4210-afe7-6e194dfd54a9@quicinc.com>
 <cp2g6j43zlx2njou5qz5tmwsnnzahqtk2hsxkj2ftrzbcmy742@ysca5ica4mvr>
 <bb6ae010-5dbf-455c-a53c-6c0e688f0ebc@quicinc.com>
 <nr4xt5pefd3jngml6bkbgrfhsuxmre44v3qs6uyxz7qp5dzqad@6dss6lwhb35n>
 <af6ca3d2-54da-49bb-940a-69855ab2a7b0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af6ca3d2-54da-49bb-940a-69855ab2a7b0@quicinc.com>

On Fri, Nov 15, 2024 at 03:16:29PM +0800, Tingwei Zhang wrote:
> On 11/15/2024 3:03 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 15, 2024 at 02:42:47PM +0800, Tingwei Zhang wrote:
> > > On 11/15/2024 2:26 PM, Dmitry Baryshkov wrote:
> > > > On Fri, Nov 15, 2024 at 12:59:12PM +0800, Tingwei Zhang wrote:
> > > > > On 11/14/2024 9:03 PM, Konrad Dybcio wrote:
> > > > > > On 14.11.2024 1:10 PM, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Nov 14, 2024 at 05:54:08PM +0800, Ziyue Zhang wrote:
> > > > > > > > Add configurations in devicetree for PCIe0, including registers, clocks,
> > > > > > > > interrupts and phy setting sequence.
> > > > > > > > 
> > > > > > > > Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> > > > > > > > ---
> > > > > > > >     arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
> > > > > > > >     arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++
> > > > > > > >     2 files changed, 219 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > > > > > > index 7eed19a694c3..9d7c8555ed38 100644
> > > > > > > > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > > > > > > @@ -213,7 +213,7 @@ vreg_l9c: ldo9 {
> > > > > > > >     &gcc {
> > > > > > > 
> > > > > > > The patch doesn't seem to update the gcc node in qcs8300.dtsi. Is there
> > > > > > > any reason to have the clocks property in the board data file?
> > > > > > 
> > > > > > Definitely not. Ziyue, please move that change to the soc dtsi
> > > > > 
> > > > > Gcc node is updated in board device tree due to sleep_clk is defined in
> > > > > board device tree. Sleep_clk is from PMIC instead SoC so we were requested
> > > > > to move sleep_clk to board device tree in previous review [1].
> > > > 
> > > > Note, the review doesn't talk about sleep_clk at all. The recent
> > > > examples (sm8650, x1e80100, sa8775p) still pull the clocks into the SoC
> > > > dtsi, but without the freq.
> > > > 
> > > It's begining of the discussion of the PMIC clock for SoC. Sleep clock
> > > specific discussion is here [2].
> > > [2]https://lore.kernel.org/all/be8b573c-db4e-4eec-a9a6-3cd83d04156d@kernel.org/
> > 
> > Please note how the recent platforms describe those clocks: the node in
> > the SoC dtsi, the frequency in the board dtsi. X1E80100 is a step
> > backwards, the clock are completely defined in the x1e80100.dtsi. There
> > seems to be no strict rule on how to handle board clocks. I've sent an
> > RFC patchset, trying to move them to a single logical location. Let's
> > see what kind of response it will get. We probably need to define and
> > follow a common rule for all Qualcomm platforms. Please give it a couple
> > of days for the dust to settle. However, I think there should be no
> > reason to keep GCC's clock definitions in the board DTS.
> > 
> Thanks for the clean up patch and make it consistent.
> 
> Is it reasonable for GCC's clock definition to refer xo_clk/sleep_clk in
> board device tree? Theoretically, can we have another board has different
> xo_clk say xo1_clk defined in board device tree?

That's a question for that series. I'd say, no. Some older platforms had
separate CXO and PXO clocks, newer platforms have single CXO.

> > > > > 
> > > > > [1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
> > > > > > 
> > > > > > Konrad
> > > > > 
> > > > > 
> > > > > -- 
> > > > > Thanks,
> > > > > Tingwei
> > > > > 
> > > > > -- 
> > > > > linux-phy mailing list
> > > > > linux-phy@lists.infradead.org
> > > > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > > > 
> > > 
> > > 
> > > -- 
> > > Thanks,
> > > Tingwei
> > 
> 
> 
> -- 
> Thanks,
> Tingwei

-- 
With best wishes
Dmitry

