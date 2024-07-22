Return-Path: <linux-arm-msm+bounces-26816-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C513939239
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 18:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B7C282562
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 16:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09BC16D9A8;
	Mon, 22 Jul 2024 16:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzBt5Wow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85C616D9A2
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 16:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721664229; cv=none; b=joIcln+e/0ygr92/ccjvZ7DLhU4xgTdzUpsX4dp23sSxD3C+FT76yoYvtd6QeL0v2MaiXq4DBwy61fnSW4K30HnOzJfer0lpxdpFCpd2I+CVR8V5vzcRwntHg1FwcXgoWm7BLJqk+pmKbHfgiZQZqV6leFh8Fu7pCdRhDsB1p10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721664229; c=relaxed/simple;
	bh=KzgCofWjocBkzQAphXv6rA7vCk7eErxhoEfKd11ou9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cYzSB1Iq7lwZjJ0kuCZ3X4Q74spAQB8OBvaYlwXcNSGBkMsYUS8CyNk/VEQ3sG8Xf5svIAQVEUsCcCN84Vr6SlCPmumCRtD4lwlRAFRDga2ktDwQUS8yF9/LhaVGR0AHT/BfOaiSKM5UdgtnsDohcGuvCvbadcrXwt6SOgGJnqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzBt5Wow; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee920b0781so51838251fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721664226; x=1722269026; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XMfnvFagM5jXY4OmVFyt8MNr6j8P8gpPmPAEFY+SDc4=;
        b=UzBt5WowUExkJqozeTv9ZJeZdpn/0Ztu9/PozsEP4+56jFDUZY1ycGzUb65fjv621z
         fmw8sHTlRCA4A5C77ucxJPbf7LfIrVreaWdB/3LkstvkAEobCadiPuwZniwhwnfMrtCK
         v+GmnBnj4tfvl3uxpTtfj9RHfRV/WNu+G40u/iEazE04k8LzSboyOSbCJCo7Ocb/ynTt
         PjVzi/dvfiSdApXpMefFAjKpe9f1BtJaQlsWkE4sHcB7u7y1dwFKtjfASMnsHSH/Be1L
         WhYIA1J4rw/cfR+NdO1fcLzuZKNmMQeiBn/J3KdWx/dcoJCDxl6DeD9a4nu+/8lq+zub
         APBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721664226; x=1722269026;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMfnvFagM5jXY4OmVFyt8MNr6j8P8gpPmPAEFY+SDc4=;
        b=BAWMbkfH6SCuu70gyvps6UmTgkZDm0fLKKHv0czRfld2WvfjNzp18jMeH6w+IaUdOl
         anxQmvUoRxDsnNdZqqs6hu1DX1qfqDGDHTRMjwha/peJCD+wh1V60t9VCXLbZlk2MGML
         JBQ2mqrksDobj2118otGAGokKf3U+o6TQQcnCBbHMaNAUR19PP/xm3ed90LEGZB/HCd/
         k2UYbH4Uae3HHjen9Qy9EAaY/IdTsqIDGEiPhrVV6IlWcCc8L6YL2m4EOH5RncJi+CbT
         nLMF0dMD2tywu467vZLZiBL68lXkkfDbHR38Y8Ag2+TCeXUXhgaGhVx5kSX0t1NS79jZ
         3oSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUa+XmY/MH71GrtZv99aYgctd5HBvZ/qfq9iyAWeS+UmokFvaZf5MDARWGVDDm/W8OQgcpjum79AjXVgIxWDxoVlhIfFrAFTWcHzPYLtg==
X-Gm-Message-State: AOJu0YzaXqYwOFycqct+MjU9IacjqgxQorz6U4Bz3snaZGEvFgS067t/
	8jcM3O8N/9e+YPkRorVJOhyOhLbBupFNw6HVpAFKhM1CV+pjC24Rk3xcHmiu8VY=
X-Google-Smtp-Source: AGHT+IGObe1qRLvGOWHkj6zBsUO752eB04WToNf3Kb1tTFIw7U5c47c7/ki1OSMnG6oSK3at4d5rSg==
X-Received: by 2002:a2e:8e83:0:b0:2ef:1b1f:4b4f with SMTP id 38308e7fff4ca-2ef1b1f52bcmr44331031fa.34.1721664225802;
        Mon, 22 Jul 2024 09:03:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef0fcdd670sm13088851fa.76.2024.07.22.09.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 09:03:45 -0700 (PDT)
Date: Mon, 22 Jul 2024 19:03:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add X1E78100 ThinkPad T14s Gen 6
Message-ID: <4w4b5pjrrl7jnanx3uodsjxw4cfenc3i6tgmp6kblgn6gavn45@uu2milys4n2z>
References: <20240719-topic-t14s_upstream-v1-0-d7d97fdebb28@linaro.org>
 <20240719-topic-t14s_upstream-v1-3-d7d97fdebb28@linaro.org>
 <Zp055OR+OzSgiHhX@linaro.org>
 <824edc08-f67f-4b2f-b4aa-da5df69b9df4@linaro.org>
 <Zp4vghH5SK/rLEce@linaro.org>
 <CAF6AEGszzRFiW16VzQQVF21U79uLcTNwwuGsHs98Zp_UGGTEBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAF6AEGszzRFiW16VzQQVF21U79uLcTNwwuGsHs98Zp_UGGTEBA@mail.gmail.com>

On Mon, Jul 22, 2024 at 08:00:19AM GMT, Rob Clark wrote:
> On Mon, Jul 22, 2024 at 3:11 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 24-07-22 10:42:57, Konrad Dybcio wrote:
> > > On 21.07.2024 6:40 PM, Abel Vesa wrote:
> > > > On 24-07-19 22:16:38, Konrad Dybcio wrote:
> > > >> Add support for the aforementioned laptop. That includes:
> > > >>
> > > >> - input methods, incl. lid switch (keyboard needs the pdc
> > > >>   wakeup-parent removal hack..)
> > > >> - NVMe, WiFi
> > > >> - USB-C ports
> > > >> - GPU, display
> > > >> - DSPs
> > > >>
> > > >> Notably, the USB-A ports on the side are depenedent on the USB
> > > >> multiport controller making it upstream.
> > > >>
> > > >> At least one of the eDP panels used (non-touchscreen) identifies as
> > > >> BOE 0x0b66.
> > > >>
> > > >> See below for the hardware description from the OEM.
> > > >>
> > > >> Link: https://www.lenovo.com/us/en/p/laptops/thinkpad/thinkpadt/lenovo-thinkpad-t14s-gen-6-(14-inch-snapdragon)/len101t0099
> > > >> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > >
> > > > Few comments below. Otherwise, LGTM.
> > > >
> > > > Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
> > > >
> > > >> ---
> > > >>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > > >>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts     | 792 +++++++++++++++++++++
> > > >>  2 files changed, 793 insertions(+)
> > > >>
> > > >> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > > >> index 0e5c810304fb..734a05e04c4a 100644
> > > >> --- a/arch/arm64/boot/dts/qcom/Makefile
> > > >> +++ b/arch/arm64/boot/dts/qcom/Makefile
> > > >> @@ -261,6 +261,7 @@ dtb-$(CONFIG_ARCH_QCOM)        += sm8650-hdk-display-card.dtb
> > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-hdk.dtb
> > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-mtp.dtb
> > > >>  dtb-$(CONFIG_ARCH_QCOM)   += sm8650-qrd.dtb
> > > >> +dtb-$(CONFIG_ARCH_QCOM)   += x1e78100-lenovo-thinkpad-t14s.dtb
> > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-asus-vivobook-s15.dtb
> > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-crd.dtb
> > > >>  dtb-$(CONFIG_ARCH_QCOM)   += x1e80100-lenovo-yoga-slim7x.dtb
> > > >> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dts
> > > >
> > > > So what happens for SKUs of this model wil have x1e80100 ?
> > > >
> > > > Maybe we should stick to x1e80100 ?
> > >
> > > This one only ships with 78100
> > >
> >
> > Sure, but then in upstream we only have 80100. Plus, it is included in
> > this file as well.
> >
> > I don't know what's the right thing to do here. But I think it keeps
> > things more simple if we keep everything under the x1e80100 umbrella.
> 
> plus sticking to x1e80100 will avoid angering tab completion :-P

This is an old argument, with no clear answer. For some devices we
choose to use correct SoC name (sda660-inforce-ifc6560). For other we
didn't (sdm845-db845c, which really is SDA845). However for most of the
devices the goal is to be accurate (think about all the qcs vs qcm
stories). So my 2c. would go to x1e78100.

-- 
With best wishes
Dmitry

