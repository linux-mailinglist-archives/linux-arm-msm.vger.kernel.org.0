Return-Path: <linux-arm-msm+bounces-7000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D64182A761
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 07:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21DC1F246AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jan 2024 06:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97A752108;
	Thu, 11 Jan 2024 06:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VlrpjuF9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5E62101
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jan 2024 06:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5f68e2e1749so42233657b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jan 2024 22:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704952964; x=1705557764; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySHzwq8dArh41wbtGZhqWN/9T6QDBMF2vzUl/zhZMLY=;
        b=VlrpjuF9C+0pSL5uLMEvF8hdxOsqh2OYykReh1PdTPyvEyI/biagq1lrv+znS0wxrm
         KUv/tTLK+wMXS7OLintc++m+RyKnVZGgqtnzwfEBYV/MgcSStVlWbHdL6TDUc2QvdFW3
         44KcDx1DnAc9uwcc6GNkAc7fu3wXj2hezeRyTI/wpZ8CjnqAj/HCrjtZlESqvAkK0j4B
         HHeIOEQfQYXe82uJWgifrUKpL4MqaRxRexDu53tpdxDLkqUFz+drNqcnzoEEdkiirXep
         qFhxnKk5tDvS5cGz1iUykv767cdX7UfpM2WHJ8mvj8LZjNbkb9uhHPnRP1PoaEjD3jQ2
         8Xkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704952964; x=1705557764;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySHzwq8dArh41wbtGZhqWN/9T6QDBMF2vzUl/zhZMLY=;
        b=G+dy8VVi0XTBGJVS20ZECHXqvl8h6NOf+FByZzEigWLWxKqWaJox86HlXMSHk07n1q
         Rqoufj8y3CvnhnhbKmp8+K2AX+IXmOtlJ2hGr55hBMyXCsHM53X0dfUUwdkf9wiSOpkk
         4I9FY4hZh9b1/GfQCBcJ7hv9tsvk/WQ5x5EMy3PxfCc4SY2amcHINxTFKEMAvSZIoxiv
         3mqnhbDu86+yuDuXPC8pZiIu2KjZRrFXNld6xP2X6aLEWTMfWWdB/XoEEsI3UKMTDRbb
         WcEnRQbBBrOVTH8iUZvArgyUwsKXPbeLDIcBeq/mOZ1nRLMveOBe6s51d5ZE6KPK8nFX
         uGrA==
X-Gm-Message-State: AOJu0Yz4RWz/OF8OQM4Da01wVjmNEd6HZc73uWO6eBuneFgIhF+9NVDr
	dwZ+nG3FE2PhXkPNjeaUq6KSjWcuM/Kg0TCd7ZgSmVkPH92dUg==
X-Google-Smtp-Source: AGHT+IGuDiBtMY4/ypDlMkdqA3oJpXB3cTMlLMCSTpowgDMc7JMkgVnsbEwMIUUhX9GileAo0dWmq0OxUBnadUBxYgY=
X-Received: by 2002:a0d:e28c:0:b0:5f8:f213:a4e0 with SMTP id
 l134-20020a0de28c000000b005f8f213a4e0mr121140ywe.41.1704952963981; Wed, 10
 Jan 2024 22:02:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240111-qrb2210-rb1-no-cluster-idle-v1-1-cec14ec15b02@linaro.org>
 <20240111044508.GA3761@thinkpad>
In-Reply-To: <20240111044508.GA3761@thinkpad>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 11 Jan 2024 08:02:32 +0200
Message-ID: <CAA8EJpp+i58Z_QN4L1NRXoEcoRJNNu3S3JqeYgFP7LY-GBDP0w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: qrb2210-rb1: disable cluster power domains
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 11 Jan 2024 at 06:45, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Thu, Jan 11, 2024 at 04:01:14AM +0200, Dmitry Baryshkov wrote:
> > If cluster domain idle state is enabled on the RB1, the board becomes
> > significantly less responsive. Under certain circumstances (if some of
> > the devices are disabled in kernel config) the board can even lock up.
> >
> > It seems this is caused by the MPM not being pinged during CPU idle (in
> > the same way the RPMh is pinged when cluster idle is entered).
> >
>
> What does "ping" mean here? Please be more specific.

See rpmh_rsc_pd_callback(), rpmh_flush() and rpmh_rsc_write_next_wakeup().

RPMh driver (among other things) on entering the idle writes the next
wake up time to the RPMh. The MPM driver in the vendor kernel does the
same, see msm_mpm_timer_write() in msm-4.19

>
> - Mani
>
> > Disable cluster domain idle for the RB1 board until MPM driver is fixed
> > to cooperate with the CPU idle states.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/qrb2210-rb1.dts | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts b/arch/arm64/boot=
/dts/qcom/qrb2210-rb1.dts
> > index aa53b6af6d9c..9a0308ef8b0f 100644
> > --- a/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > +++ b/arch/arm64/boot/dts/qcom/qrb2210-rb1.dts
> > @@ -177,6 +177,24 @@ vph_pwr: regulator-vph-pwr {
> >       };
> >  };
> >
> > +&CPU_PD0 {
> > +     /delete-property/ power-domains;
> > +};
> > +
> > +&CPU_PD1 {
> > +     /delete-property/ power-domains;
> > +};
> > +
> > +&CPU_PD2 {
> > +     /delete-property/ power-domains;
> > +};
> > +
> > +&CPU_PD3 {
> > +     /delete-property/ power-domains;
> > +};
> > +
> > +/delete-node/ &CLUSTER_PD;
> > +
> >  &gpi_dma0 {
> >       status =3D "okay";
> >  };
> >
> > ---
> > base-commit: 39676dfe52331dba909c617f213fdb21015c8d10
> > change-id: 20240111-qrb2210-rb1-no-cluster-idle-7bf43b3a0452
> >
> > Best regards,
> > --
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D



--=20
With best wishes
Dmitry

