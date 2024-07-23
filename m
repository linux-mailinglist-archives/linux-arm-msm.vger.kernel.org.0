Return-Path: <linux-arm-msm+bounces-26923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48DEA93A77D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 20:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06C121C226BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 18:55:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E978C13D636;
	Tue, 23 Jul 2024 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="se89imST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF2613C8EE;
	Tue, 23 Jul 2024 18:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721760924; cv=none; b=HxsAwqfKHU7YHW4UGxgvz/IioAa/bbGEFU8aJabeUIqFTFQPE7+9oRieUQyWgVc+Y8SYFDmeZVTZn5gQrOR7LR5/ggkTSDqVv0SafLgHoNacT+Qx94eBhL344VoUXmUY6WIkWTTnetiG7MHZeU/AXEwx1VZrKqudJPBf3zAs7rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721760924; c=relaxed/simple;
	bh=m8tanHBnyb3um660m/Fiay8fgOwQGavPrK7RhkThkVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAT1yJ238tpHwC2bEZ7TcEyIYdmFCnLQ0WkX28sh12PJPxyQjLHX0SMN3+m3Jah3CSKMQX/Ak9SC3FPb4Vxh2mndubd+mkeMoWxFPwKdODizx+j6O3vBW6+t+5ncmcZULMy+AauGAWcgq4DV2pMLnSrjKN2tRQ+S2OEpV11wDb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=se89imST; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24C46C4AF0A;
	Tue, 23 Jul 2024 18:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721760924;
	bh=m8tanHBnyb3um660m/Fiay8fgOwQGavPrK7RhkThkVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=se89imST6u7xu1WZpSLkDPr15gFfD+93NSJRdzfETxOBTqcckcLg5e2QtWu22CSYc
	 lbhcmIUiY2kOvzlI0x8lZiaf6iYmkKwHdqqLN3iL6rgs+VAhZA3mzCC47PbF1rjuSZ
	 q2FIkkAT4XOL5DLoCCuWkjmDW1k2Dzvgz/EKxkmzytQGveQGsBYJaLlleJVHsM9aB2
	 Kn1Vm8bbiyrfu/tiZ4VN8pojgP/h/XJaF0miCkpkhpUQMz6Lpxz7pnf+SK6V5mrdZo
	 o4oxJ6FgGN9lRkWcwlwGOU1IvY6VaupNQwJ/+J4Zj/MOGifo0YOud6H9oU605vIxib
	 ISnyfkLTiPYDg==
Date: Tue, 23 Jul 2024 13:55:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
Message-ID: <atjcj5qnetxilrnoom7xisqbl5yhq5ktg3jb7dfnkdnzbqblb5@qbkqupznvrua>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org>
 <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
 <Zp4vghH5SK/rLEce@linaro.org>
 <CAF6AEGszzRFiW16VzQQVF21U79uLcTNwwuGsHs98Zp_UGGTEBA@mail.gmail.com>
 <4w4b5pjrrl7jnanx3uodsjxw4cfenc3i6tgmp6kblgn6gavn45@uu2milys4n2z>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4w4b5pjrrl7jnanx3uodsjxw4cfenc3i6tgmp6kblgn6gavn45@uu2milys4n2z>

On Mon, Jul 22, 2024 at 07:03:43PM GMT, Dmitry Baryshkov wrote:
> On Mon, Jul 22, 2024 at 08:00:19AM GMT, Rob Clark wrote:
> > On Mon, Jul 22, 2024 at 3:11 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> > >
> > > On 24-07-22 10:42:57, Konrad Dybcio wrote:
> > > > On 21.07.2024 6:40 PM, Abel Vesa wrote:
> > > > > On 24-07-19 22:16:38, Konrad Dybcio wrote:
> > > > >> Add support for the aforementioned laptop. That includes:
> > > > >>
> > > > >> - input methods, incl. lid switch (keyboard needs the pdc
> > > > >>   wakeup-parent removal hack..)
> > > > >> - NVMe, WiFi
> > > > >> - USB-C ports
> > > > >> - GPU, display
> > > > >> - DSPs
> > > > >>
> > > > >> Notably, the USB-A ports on the side are depenedent on the USB
> > > > >> multiport controller making it upstream.
> > > > >>
> > > > >> At least one of the eDP panels used (non-touchscreen) identifies as
> > > > >> BOE 0x0b66.
> > > > >>
> > > > >> See below for the hardware description from the OEM.
> > > > >>
> > > > >> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> > > > >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > >
> > > > > Few comments below. Otherwise, LGTM.
> > > > >
> > > > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > > >
> > > > >> ---
> > > > >>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > > > >>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
> > > > >>  2 files changed, 793 insertions(+)
> > > > >>
> > > > >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > >> index 0e5c810304fb..734a05e04c4a 100644
> > > > >> --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > >> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)        += sm8650-hdk-display-card.dtb
> > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-hdk.dtb
> > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-mtp.dtb
> > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-qrd.dtb
> > > > >> +dtb-$(CONFIG_ARCH_QCOM)   += x1e78100-lenovo-thinkpad-t14s.dtb
> > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-asus-vivobook-s15.dtb
> > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-crd.dtb
> > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-lenovo-yoga-slim7x.dtb
> > > > >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> > > > >
> > > > > So what happens for SKUs of this model wil have x1e80100 ?
> > > > >
> > > > > Maybe we should stick to x1e80100 ?
> > > >
> > > > This one only ships with 78100
> > > >
> > >
> > > Sure, but then in upstream we only have 80100. Plus, it is included in
> > > this file as well.
> > >
> > > I don't know what's the right thing to do here. But I think it keeps
> > > things more simple if we keep everything under the x1e80100 umbrella.
> > 
> > plus sticking to x1e80100 will avoid angering tab completion :-P
> 
> This is an old argument, with no clear answer. For some devices we
> choose to use correct SoC name (sda660-inforce-ifc6560). For other we
> didn't (sdm845-db845c, which really is SDA845). However for most of the
> devices the goal is to be accurate (think about all the qcs vs qcm
> stories). So my 2c. would go to x1e78100.
> 

I agree, x1e78100 follows the naming scheme we have agreed upon - for
better or worse.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

