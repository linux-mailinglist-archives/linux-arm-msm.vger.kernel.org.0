Return-Path: <linux-arm-msm+bounces-67324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98129B17F39
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 11:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9643175395
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Aug 2025 09:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214C82253A7;
	Fri,  1 Aug 2025 09:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qrPrHVgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A064222582
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Aug 2025 09:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754040465; cv=none; b=eVzskyMIEDRapilDYI+upq+YpAkf/wHuLZvvyKHQx5UqtaN0ybwti2Qrm7QKFQiOrK334JUNsUZ1HGjAVWMm1DQ/xKtR7Fw3udCmNixl7ikwg8Hy6oHrmxwEGRmS/mRNWewnJk+5uTw9BJH/t64qED3DCwNhsrwostD+axtR8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754040465; c=relaxed/simple;
	bh=7rjGGi6sJRpSD6CPw0frSEqWEjsKA5TLzPnkb0vfgIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HaMu0E/ij7GtYifa+zMPCz/0/8DvmSzbyjQx+QxgytXIgcT/RgMIJWys3Ls8GXgvIzx0i/GCs9UIKGIjClUw8DHtf/yjGQqj6iEj0EnREhMN0NdrxbDdiH+FwMP/FJNPd70xgIypM+fJ4QGEjpHvm3BSGLDeRUcZD+XnwmBJoj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qrPrHVgS; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7682560a2f2so1949486b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Aug 2025 02:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754040463; x=1754645263; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aOzsaXGRbHTCJm/fkLtI1bRP1MDJ9mJ9tPK5q2Dho2g=;
        b=qrPrHVgSxLigcrcDdqMFvdc9hzxvPdLOv/PUceIFlTf07eHfb6cv9iNb0Kgaq0dmil
         N6m7UKACXHeEKBrneOxK7lNUMZZV/TH8D796zn2x60IgiV2F3f1azKW/ccZ1HSKZJv62
         DzvL/EVTybkgWA35hnb/hV6cFdjVvUJobuSVXT5aywfKgWpq+sBxbmqnONSSuycX3YAC
         AHX+0SbAbpdB3lccdUX1WKIKAkR2GRNLfJAnrGyRYEHJ1jYMnxDm0e58OtAgCBwn4Wz4
         HV7sB06k2lfPjZKRgI7cS36rsbHgQXB6yVOjyKx7DXLT6VipIa5TNhxkJEGUC7B6qjYa
         jmBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754040463; x=1754645263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aOzsaXGRbHTCJm/fkLtI1bRP1MDJ9mJ9tPK5q2Dho2g=;
        b=Om/M8ASphd7kFQfzdYsH255/P4wHQwjbhT/7cBB2hwU5KfO8+HXjAAul1MUXNJNVjE
         JenB/dKcSvF0JaqvcJWN+MJg+DPXvUPmVpgRpO06ySYywIJRE38qq8aTHv+XyK/Xk82T
         Dbnf/x7CE2xNHaqyxwrHEIR4rsAwax+oGPJC2y/3gR4tlOnTg/LPrOs8jEMnGuPLt/cN
         Gkbov90iFcOFmEC3SIMarh2HUKX0bCq2iGYWtjOFHPKIh66ZftJsXERAr7TIeaWyRiIg
         qU28P7KgH8ecXr5P7UV083UPERvnq2xbAHvFRMSyFpMsDZjebfc84m2ffE1kvv+RGOQl
         2Epg==
X-Forwarded-Encrypted: i=1; AJvYcCWEiM9LB64SvJm+09pJASq1uhiQXWhytU/z4EGi6u8r8ssM6M0JYdFWIdLQgNDKibj8y/zEuj6RTMVWfOwn@vger.kernel.org
X-Gm-Message-State: AOJu0YxPCymtZljgCgC+iMdW25B3P77WZjsfOdMuIEyuycQ+qcphMeVw
	GhTAMlbwvvCBNFiAzVabYUsFB0Ql+jUiOnJRTQ6hRMN/ceLbH1tSflh8Am7V0G1Vfyhwf58mFC0
	T6SFVFK4L9u+DTDMnBI7T91hLtYgjGrdHDSJwOwoqWg==
X-Gm-Gg: ASbGncuQ+lgyE3bTl0OCTx81FtmRL9TAgWjICq45YS/1PfrmZcAaK4yKsaBxDmOtiuN
	8gvfgzD2Q4F7/9YXGxmNMWP+gENpL/LKdv5Ujfc1BreAzebWe3xWR9Qf5RHkB3PqrC9nYndiE/X
	gWH0V+4m2GMkZm8iAiwh4p/dFKacG8/vpKQ2xUA6T1n3PVVeEzr41pvpdlfZtsJiPNQ0+KJBOti
	fel6g==
X-Google-Smtp-Source: AGHT+IHuKlUReo8BLBfNLWmArweL00LOxZR7uhUg6oyeIixMBD+kBAo6QhwVGBOeWx6hpJc7ym91L6wo5ave853cAD4=
X-Received: by 2002:a05:6a00:2485:b0:74a:d2a3:80dd with SMTP id
 d2e1a72fcca58-76bccff259dmr6577824b3a.3.1754040462719; Fri, 01 Aug 2025
 02:27:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250722081405.2947294-1-quic_jinlmao@quicinc.com>
 <20250722081405.2947294-2-quic_jinlmao@quicinc.com> <727fa9f4-fe25-495e-9d8d-48e504fbe6b0@arm.com>
 <20250722091425.GH3137075@e132581.arm.com> <CAJ9a7VhLLgAak_4FB=iW0izXprM4W+RsKfHUeo=XUHh9LwtUsA@mail.gmail.com>
 <20250722140659.GI3137075@e132581.arm.com> <CAJ9a7ViUoSMV_HHKKRMhcQX=isU+feJvwCaVhu-6EBK4QXJbVg@mail.gmail.com>
 <de702854-aca1-4c78-9555-f2139d5376af@quicinc.com> <CAJ9a7VjTYvFVz1fp2_hNkLrKBbBYkiHHyshgsVT98V8oB_bn8g@mail.gmail.com>
 <8d6a4c97-51a3-423f-9095-74347283d71b@quicinc.com>
In-Reply-To: <8d6a4c97-51a3-423f-9095-74347283d71b@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Fri, 1 Aug 2025 10:27:30 +0100
X-Gm-Features: Ac12FXxb0p9qM-DmIoa1tkbL88-z9uRmiixPI8Eab6j9wjkCgT_azXgWX96JPwI
Message-ID: <CAJ9a7VjYw5ExWV6DZBTTEWwmLmuhN0LZOFTiZq0xHekdAa41AA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add Qualcomm extended CTI
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Yingchao Deng <quic_yingdeng@quicinc.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Thu, 31 Jul 2025 at 07:40, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
>
>
>
> On 7/28/2025 5:52 PM, Mike Leach wrote:
> > Hi,
> >
> > On Wed, 23 Jul 2025 at 03:58, Jinlong Mao <quic_jinlmao@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 7/22/2025 10:56 PM, Mike Leach wrote:
> >>> On Tue, 22 Jul 2025 at 15:07, Leo Yan <leo.yan@arm.com> wrote:
> >>>>
> >>>> On Tue, Jul 22, 2025 at 01:00:18PM +0100, Mike Leach wrote:
> >>>>
> >>>> [...]
> >>>>
> >>>>> For a change of this magnitude to a CS component, that the ID
> >>>>> registers will also have to change. This is a requirement of the
> >>>>> Visible Component Architecture in the CoreSight specification.
> >>>>> External tools cannot see the device tree.
> >>>>>
> >>>>> This is effectively no longer an ARM designed component, so the
> >>>>> CoreSight specification requires that the DEVARCH register change to
> >>>>> show qualcomm as the designer, and the architecture value change to
> >>>>> represent this component.
> >>>>> DEVID should be used to allow the driver to pick up parameters such as
> >>>>> number of triggers as per the existing CTI component.
> >>>>>
> >>>>> If this component is Coresight compliant then the driver can use the
> >>>>> ID registers to configure to the extended trigger architecture.
> >>>>>
> >>>>> With complete remapping of most of the registers, and the dropping of
> >>>>> claim tag compatibility - which appears to be a breach of the
> >>>>> CoreSight specification - it may be better to have a completely
> >>>>> separate driver for this component.
> >>>>
> >>>> Good point. I'd like to confirm with the Qualcomm team: apart from the
> >>>> differences in register offsets and claim bits, does this CTI module
> >>>> have exactly the same bit layout and usage as CTI standard
> >>>> implementation?
> >>>>
> >>>> If yes, then from a maintenance perspective, we probably don't want to
> >>>> have two CTI drivers with identical register settings. It seems plausible
> >>>> to encapsulate register access and claim logic into several functions.
> >>>>
> >>>>     void cti_reg_writel(u32 val, struct cti_drvdata *drvdata, bool relax);
> >>>>     u32 cti_reg_readl(struct cti_drvdata *drvdata, bool relax);
> >>>>     int cti_claim_device(struct cti_drvdata *drvdata);
> >>>>     int cti_disclaim_device(struct cti_drvdata *drvdata, bool unlocked);
> >>>>
> >>>> Thanks,
> >>>> Leo
> >>>
> >>> The CTI supports 128 triggers  - which means many more registers to
> >>> enable / connect etc.
> >>> I need to study the changes to determine if there are functional
> >>> differences too.
> >>>
> >>> It might be feasible to divide the code into a common file and a pair
> >>> of variants so some is reused.
> >>>
> >>> Mike
> >> Thanks Mike & Leo & Suzuki.
> >>
> >> There is no register to show the version ID to distinguish between ARM
> >> CTI and QCOM extended CTI.I will double confirm with internal HW team.
> >>
> >
> > Can you clarify here please.
> > The CID0-3, PID0-7, DEVARCH and DEVTYPE registers are part of the
> > CoreSight specification for component identification.
> > Can you confirm they are present on your component and the values they have.
> >
> > If they are present then the CoreSight specification requires that
> > they be different than the standard ARM CTI.
> >
> > Regards
> >
> > Mike
>
> Hi Mike,
>
> These registers are present. I checked they are same as standard ARM
> CTI. Like CIDR1(0xFF4), both are 0x90.
>
> Thanks
> Jinlong Mao
>

This is not permitted under the CoreSight specification as the
register mappings are different to the standard ARM CTI. Any tools
(external debug tools, userspace scripts etc.) that use the CoreSight
ID registers to identify components will fail to work on your device.

Regards

Mike

> >
> >> For extended CTI, only trigger number changes and claim logic. Other
> >> functions are the same as ARM CTI(bit layout of the register and usage)
> >>
> >> Thanks
> >> Jinlong Mao>
> >>
> >>
> >
> >
>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK

