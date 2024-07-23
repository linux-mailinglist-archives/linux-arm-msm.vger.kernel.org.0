Return-Path: <linux-arm-msm+bounces-26927-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BBC93A8B5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 23:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BAAD28324D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 21:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B22F1448FB;
	Tue, 23 Jul 2024 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="JfALzp6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3EA13DDDB
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 21:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721770180; cv=none; b=PW9exyfIe9yeCv1cdWKJD/+w/OYWo0MKK9XRXP4XyyAy7FC0FEG0ytYo5dxbDpdLL8EpTqJ5qZkSFzrJjzf2XR3U8b+UkgSI35QSC8tw0keUz15zz7yo3ip4RHu3y1lSW2KU5eAkwrUS0SdT+DWSGapzd6mdU5YBVNoyQpiZaiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721770180; c=relaxed/simple;
	bh=BF+/ulIrf3NeCJiog2h20GMJf2Iy1ETSW2T66ZJGjME=;
	h=Date:Message-Id:From:To:Cc:In-Reply-To:Subject:References:
	 MIME-version:Content-type; b=Wru07upSE7iXc4DBv0r/72mTUp/qx2HtrRtYB4Fyxtz7r0eXuwGytj29fJtln7LM8Y+n7iZP6boH86piNGqzHEO8QdyMn5tw437qUiN5FvkXxZSAXJRWPw4PlB+/LEj3RprB9REydJWU/lzfpmMKn4kMiViCbCbPW9q4u7JlreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=JfALzp6p; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
X-KPN-MessageId: 811f0f83-493a-11ef-82de-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 811f0f83-493a-11ef-82de-005056999439;
	Tue, 23 Jul 2024 23:28:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:mime-version:subject:to:from:message-id:date;
	bh=0Vu3ze/keYxRxKLu9/o8MA7JBuEEGG0nnCZ6m2Ca/BE=;
	b=JfALzp6pwJFMDARBjSIhLcyzs4xIjLZvXQpnho3rdiQN2ObxL7eqioUfeycz5htFAhANu3Hu4BjuP
	 XLjFBENk4wESky4UOmkpgBGcXtoC1UpCv5si2a+bgiJy+2hNGelFxsMmC/Z8kKquXNNtF+w9UU+Fyj
	 7McS6eJ4zAo2piAj7kB4YcxjaI9S3ZCeMdOGFe8xMW6UPuaLo8beWnIEK9rmr3mURMGL/2nRrH2IaF
	 LLH3061KVr5rpskKMnatUABNUlbBvdXsxsRQj+HTNOgl1HTfjNDvWPqTRDgtl4xkvqtRTi59UZKFBg
	 wshYN+xFc+V7Z0T4LNLvyzhyUw0C2Ow==
X-KPN-MID: 33|bUp06XSWQnrEBN55lO1qBC9x4Uc0xl+AcSyeFSd/65/Pah0/ZOBj+m/lsWSpDa6
 zIGSWOq69yQPfzj/fTx8dXXxNKao3mW6aIO3WUqAciHQ=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|7RYISMR0KnNiBzoURgc3uB0yGr9DLm4q2ufUhOoThkw/fuguBejmHhc87wx3qwm
 ZlHDlYg/XT/Ocb3Hh2MHRAg==
Received: from bloch.sibelius.xs4all.nl (80-61-163-207.fixed.kpn.net [80.61.163.207])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 807a771e-493a-11ef-912a-00505699b758;
	Tue, 23 Jul 2024 23:28:29 +0200 (CEST)
Date: Tue, 23 Jul 2024 23:28:28 +0200
Message-Id: <87o76ng5mr.fsf@bloch.sibelius.xs4all.nl>
From: Mark Kettenis <mark.kettenis@xs4all.nl>
To: Bjorn Andersson <andersson@kernel.org>
Cc: dmitry.baryshkov@linaro.org, robdclark@gmail.com,
	abel.vesa@linaro.org, konrad.dybcio@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	marijn.suijten@somainline.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	johan@kernel.org, patrick@openbsd.org
In-Reply-To: <atjcj5qnetxilrnoom7xisqbl5yhq5ktg3jb7dfnkdnzbqblb5@qbkqupznvrua>
	(message from Bjorn Andersson on Tue, 23 Jul 2024 13:55:20 -0500)
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org>
 <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
 <Zp4vghH5SK/rLEce@linaro.org>
 <CAF6AEGszzRFiW16VzQQVF21U79uLcTNwwuGsHs98Zp_UGGTEBA@mail.gmail.com>
 <4w4b5pjrrl7jnanx3uodsjxw4cfenc3i6tgmp6kblgn6gavn45@uu2milys4n2z> <atjcj5qnetxilrnoom7xisqbl5yhq5ktg3jb7dfnkdnzbqblb5@qbkqupznvrua>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

> Date: Tue, 23 Jul 2024 13:55:20 -0500
> From: Bjorn Andersson <andersson@kernel.org>
> 
> On Mon, Jul 22, 2024 at 07:03:43PM GMT, Dmitry Baryshkov wrote:
> > On Mon, Jul 22, 2024 at 08:00:19AM GMT, Rob Clark wrote:
> > > On Mon, Jul 22, 2024 at 3:11 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > On 24-07-22 10:42:57, Konrad Dybcio wrote:
> > > > > On 21.07.2024 6:40 PM, Abel Vesa wrote:
> > > > > > On 24-07-19 22:16:38, Konrad Dybcio wrote:
> > > > > >> Add support for the aforementioned laptop. That includes:
> > > > > >>
> > > > > >> - input methods, incl. lid switch (keyboard needs the pdc
> > > > > >>   wakeup-parent removal hack..)
> > > > > >> - NVMe, WiFi
> > > > > >> - USB-C ports
> > > > > >> - GPU, display
> > > > > >> - DSPs
> > > > > >>
> > > > > >> Notably, the USB-A ports on the side are depenedent on the USB
> > > > > >> multiport controller making it upstream.
> > > > > >>
> > > > > >> At least one of the eDP panels used (non-touchscreen) identifies as
> > > > > >> BOE 0x0b66.
> > > > > >>
> > > > > >> See below for the hardware description from the OEM.
> > > > > >>
> > > > > >> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> > > > > >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > > > >
> > > > > > Few comments below. Otherwise, LGTM.
> > > > > >
> > > > > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > > > >
> > > > > >> ---
> > > > > >>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > > > > >>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
> > > > > >>  2 files changed, 793 insertions(+)
> > > > > >>
> > > > > >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > > > >> index 0e5c810304fb..734a05e04c4a 100644
> > > > > >> --- a/arch/arm64/boot/dts/qcom/Makefile
> > > > > >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > > > >> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)        += sm8650-hdk-display-card.dtb
> > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-hdk.dtb
> > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-mtp.dtb
> > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-qrd.dtb
> > > > > >> +dtb-$(CONFIG_ARCH_QCOM)   += x1e78100-lenovo-thinkpad-t14s.dtb
> > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-asus-vivobook-s15.dtb
> > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-crd.dtb
> > > > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-lenovo-yoga-slim7x.dtb
> > > > > >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> > > > > >
> > > > > > So what happens for SKUs of this model wil have x1e80100 ?
> > > > > >
> > > > > > Maybe we should stick to x1e80100 ?
> > > > >
> > > > > This one only ships with 78100
> > > > >
> > > >
> > > > Sure, but then in upstream we only have 80100. Plus, it is included in
> > > > this file as well.
> > > >
> > > > I don't know what's the right thing to do here. But I think it keeps
> > > > things more simple if we keep everything under the x1e80100 umbrella.
> > > 
> > > plus sticking to x1e80100 will avoid angering tab completion :-P
> > 
> > This is an old argument, with no clear answer. For some devices we
> > choose to use correct SoC name (sda660-inforce-ifc6560). For other we
> > didn't (sdm845-db845c, which really is SDA845). However for most of the
> > devices the goal is to be accurate (think about all the qcs vs qcm
> > stories). So my 2c. would go to x1e78100.
> > 
> 
> I agree, x1e78100 follows the naming scheme we have agreed upon - for
> better or worse.

So should the device trees for the Asus Vivobook S15 and the Lenovo
Yoga Slim 7x be renamed then?  Since those also (only) ship with
X1E-78-100 variants of the SoC.

There is supposed to be a variant of the Vivobook with the X1P-64-100
(I haven't seen it actually for sale yet).  Since that one has only 10
CPU cores, should that one gets its own device tree?  That may not be
possible.  I have a strong suspicion that all the variants are just
binned versions of the same SoC, where the X1P just has two of the
cores disabled.  If Qualcomm, like Apple, attempts to increase the
yield by binning SoCs with broken or badly performing cores as X1P it
might be a lottery which of the 12 cores get disabled.

And for the vendors that do offer models with different X1E variants,
are there going to multiple device trees, one for each variant?

I'm asking because on OpenBSD we load the device trees in our
bootloader and map SMBIOS vendor and product names to a device tree
name.  So a consistent naming scheme for the device trees is
desirable.

Thanks,

Mark

> Regards,
> Bjorn
> 
> > -- 
> > With best wishes
> > Dmitry
> 

