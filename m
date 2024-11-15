Return-Path: <linux-arm-msm+bounces-37959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D249CD9A3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 08:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72ECD1F2251B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 07:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4519A32;
	Fri, 15 Nov 2024 07:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NwgpjsJx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106E81F95A
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 07:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731654216; cv=none; b=ecisSyLnZtjR+6+CAz6VUKa2yP3mhkU89rQyg4KXUYlSW5Mx7dnE1NrqP/RM0vUN5ju8Hvp2KOE5Jjfcpz/V8TrIS7wKg1KCExEWJQvuD4cZWhNAZGlgm4CTUUzFVNGSA5h8/L9hLLALzrOR9pYqSJI/obw5D2KNKSQ9MZe8NZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731654216; c=relaxed/simple;
	bh=ndua2+XULZaUMxeUglwKWZQf7tWC3oqAw6/DBhtlG1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQBALhTQhd0qQhzH3G57fJ1ln9caCZ+EZy+HfVQf3ENPZI1+eAxGoS8ubgI8wArNRK1aLxBOUP7WrGhWPGxqTSm5BPPumGGUdQD0E65skAeep/tg6gJpOA5EVwnt0lwZkjXHj6UHjCJ+9TYDR1Et3vnAQKNmD+2VecH5hAvw1ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NwgpjsJx; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-53da4ff4d7fso1583570e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Nov 2024 23:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731654212; x=1732259012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=q+XXpl77AsqnMSW/X4uwuxdnVb5E7QETWZtbP20KJGw=;
        b=NwgpjsJx0Yr7oAOBxKBpPGZ2wBeTMyfglxn82hQEPOoDTsymPi2PY8hPJ+6/5VNG4+
         DiUNEWj4uVyGT/lC0AfnRJhOt8ohWqrAoung53KHaO1G2ot+XMFKZzewTc6tySMzR4sx
         uzSQ05pfgKBfPcD/WdfhwTVasFCgZ69TNN4CL2uG2ms2HMCqiIhM0vP2xFNVAu41CDea
         lcmxna5IKrh6QMzODiFL+kWrALOfU4mke6W7uVqqVs2uNnv8odNHjERfWXfEtEcSaqpa
         CxkIpu2+ZxVNrUTJcAiWuymzLdlyJeHaksGgYDtnbmLbpqHGovztioeuyxY2G72wQphS
         x/Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731654212; x=1732259012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+XXpl77AsqnMSW/X4uwuxdnVb5E7QETWZtbP20KJGw=;
        b=fmJMYWPj64ATbZt9BuVEZP3uEoPjQsc0kEYtqYUGaEkUxp/8HAij3lB6akoiTzhFBL
         oHk1H1CCsr7xYliNzzrd63Aq2jFY1hZUmdUiyOyQI+5XQQr+wvrPylShn+mIU6v5TBOc
         qrAEIo/TWtnSFZOYPrYyNQuEL1oUlMhK1ee9XQHsksb6K5rhETPUdTGY5aNpGxa4rjGW
         kjdwrnFDSUan1GSKP/Es+48LpUfWDtxxlSIeS4lISu0YQl+/DCVuuKVoEAn1lCsXW7Fy
         7uNVu6QTNrXiLpGnhK4vABDWoa7Y8jCIBWNmrCSsBaXZRFREz4QG3O/L8NPpJyt+V3N1
         zu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWEBnE1og9clmkAix65oZhY5KMo6ppbvnmSk02riZ8OYUs+iTBlyZMPWG3HWcLpChO1ldCKCalOepTyucbm@vger.kernel.org
X-Gm-Message-State: AOJu0YzFfCJTyEV/7a6FLGQsFCOcGU6+N+w0CqRHXCw60JfhsK0AWlqP
	CZgoN+YDib7TCsdQAjl90M1BA6HqBnb0Iz2zY/FaWP73dH30jXXpBsjq131gXqs=
X-Google-Smtp-Source: AGHT+IHM3zGQ1oqt1miJAq+kPUmZOKc2Lgbol5o9QIqKe1inLvN5UGopKJienSpRrvOBH9LrMKG0Iw==
X-Received: by 2002:a05:6512:3b12:b0:53d:a895:7fb9 with SMTP id 2adb3069b0e04-53dab03f96emr531496e87.26.1731654212135;
        Thu, 14 Nov 2024 23:03:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53da653125asm452597e87.154.2024.11.14.23.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 23:03:30 -0800 (PST)
Date: Fri, 15 Nov 2024 09:03:28 +0200
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
Message-ID: <nr4xt5pefd3jngml6bkbgrfhsuxmre44v3qs6uyxz7qp5dzqad@6dss6lwhb35n>
References: <20241114095409.2682558-1-quic_ziyuzhan@quicinc.com>
 <20241114095409.2682558-5-quic_ziyuzhan@quicinc.com>
 <rg4isufmnhnbsiljm34rfdsn46gfpatbsiscynaqtsnykbhnm3@ovcaulkfj4nk>
 <26943ea3-109c-473d-818b-2a08dba859ab@oss.qualcomm.com>
 <288be342-952b-4210-afe7-6e194dfd54a9@quicinc.com>
 <cp2g6j43zlx2njou5qz5tmwsnnzahqtk2hsxkj2ftrzbcmy742@ysca5ica4mvr>
 <bb6ae010-5dbf-455c-a53c-6c0e688f0ebc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb6ae010-5dbf-455c-a53c-6c0e688f0ebc@quicinc.com>

On Fri, Nov 15, 2024 at 02:42:47PM +0800, Tingwei Zhang wrote:
> On 11/15/2024 2:26 PM, Dmitry Baryshkov wrote:
> > On Fri, Nov 15, 2024 at 12:59:12PM +0800, Tingwei Zhang wrote:
> > > On 11/14/2024 9:03 PM, Konrad Dybcio wrote:
> > > > On 14.11.2024 1:10 PM, Dmitry Baryshkov wrote:
> > > > > On Thu, Nov 14, 2024 at 05:54:08PM +0800, Ziyue Zhang wrote:
> > > > > > Add configurations in devicetree for PCIe0, including registers, clocks,
> > > > > > interrupts and phy setting sequence.
> > > > > > 
> > > > > > Signed-off-by: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
> > > > > > ---
> > > > > >    arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  44 +++++-
> > > > > >    arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 176 ++++++++++++++++++++++
> > > > > >    2 files changed, 219 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > > > > index 7eed19a694c3..9d7c8555ed38 100644
> > > > > > --- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > > > > +++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
> > > > > > @@ -213,7 +213,7 @@ vreg_l9c: ldo9 {
> > > > > >    &gcc {
> > > > > 
> > > > > The patch doesn't seem to update the gcc node in qcs8300.dtsi. Is there
> > > > > any reason to have the clocks property in the board data file?
> > > > 
> > > > Definitely not. Ziyue, please move that change to the soc dtsi
> > > 
> > > Gcc node is updated in board device tree due to sleep_clk is defined in
> > > board device tree. Sleep_clk is from PMIC instead SoC so we were requested
> > > to move sleep_clk to board device tree in previous review [1].
> > 
> > Note, the review doesn't talk about sleep_clk at all. The recent
> > examples (sm8650, x1e80100, sa8775p) still pull the clocks into the SoC
> > dtsi, but without the freq.
> > 
> It's begining of the discussion of the PMIC clock for SoC. Sleep clock
> specific discussion is here [2].
> [2]https://lore.kernel.org/all/be8b573c-db4e-4eec-a9a6-3cd83d04156d@kernel.org/

Please note how the recent platforms describe those clocks: the node in
the SoC dtsi, the frequency in the board dtsi. X1E80100 is a step
backwards, the clock are completely defined in the x1e80100.dtsi. There
seems to be no strict rule on how to handle board clocks. I've sent an
RFC patchset, trying to move them to a single logical location. Let's
see what kind of response it will get. We probably need to define and
follow a common rule for all Qualcomm platforms. Please give it a couple
of days for the dust to settle. However, I think there should be no
reason to keep GCC's clock definitions in the board DTS.

> > > 
> > > [1]https://lore.kernel.org/all/10914199-1e86-4a2e-aec8-2a48cc49ef14@kernel.org/
> > > > 
> > > > Konrad
> > > 
> > > 
> > > -- 
> > > Thanks,
> > > Tingwei
> > > 
> > > -- 
> > > linux-phy mailing list
> > > linux-phy@lists.infradead.org
> > > https://lists.infradead.org/mailman/listinfo/linux-phy
> > 
> 
> 
> -- 
> Thanks,
> Tingwei

-- 
With best wishes
Dmitry

