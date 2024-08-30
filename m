Return-Path: <linux-arm-msm+bounces-30191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB6965C27
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 10:54:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B2CAB22D1E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Aug 2024 08:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DABB16EBF7;
	Fri, 30 Aug 2024 08:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tULGSbLv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE9916EBE0
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725008074; cv=none; b=lyi3AZVo6f6SUdAPjAUz50Oj5NffT5ckrLEdDVWkOW+EZu8yoYSXXlPYxs/BnyRomGsvohIVKtfFiRJrTZNVnUdeyZi7KrBThb8UU+hVMXltFyROaUmgrec38aLRkRN9/9Itkuh7b4aH3ivmFdBDcOl3vTePUbOs/Y/Rma1f+xQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725008074; c=relaxed/simple;
	bh=HDIME7t6dWh6Y/SJ6jARFKoMpQBsQiZFHIm/1CUWZ68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A0XA9tPxCESG4BwSchZFl49VxVMvY2IGRscrf9hNnuoyGpVKOZuC06e+ulmZAfDe/5kgOnlJTkV/NgYyvlU9J3s5KET+S/83p41VrSuttnfOFMoq3fNyQcuNrGcf2T0wjq9HGsVNTAYRtYlzs9513NmjyCPmn10FGJ8RQSTUNv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tULGSbLv; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6c130ffa0adso15915137b3.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Aug 2024 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725008071; x=1725612871; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iOs+ydvRJ2qhJNCxQ73aTsVT+NTo9Ltkz1jj00XSnt4=;
        b=tULGSbLvDjopNRFtNSi1GTVZUN0sn4LN/iQtKrEM0PtuDaaw5gFybVzbdwNOOzRY3t
         y3Cg79rXhTI1b5rdrbRk0WkQ7QFLJ3LAiAB+yAY7w2/RZDUe9XdylKdeeWW8XeFrZUNi
         sio0vmUCIoPewWzTJSgo6DxJSb3yXAlODkUw0ZtiXjqFWhwMkQzvPyxpAqAmhWZ/TREm
         0kj/cKxuBM4y1Lch13013iwv2ow7K+locYmP27CldeffRNSOMc2TNlJoTqLnWyckaIS1
         63WswQO4FDVKLnIVn2PQhRj/I9KxcTyyBvVQpkCVhsmfoNxiaWM632kq11GN0+GLSVmw
         R5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725008071; x=1725612871;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOs+ydvRJ2qhJNCxQ73aTsVT+NTo9Ltkz1jj00XSnt4=;
        b=UhIxF00EmnDY8BdAUTxbngIuMar6JHMH7F0vbsTo5uQsp1Juf2mI/0ykhFBSj/RoXh
         tj0xRzXlfK2NFDXAXGz/KiAwTW9nbnEDTjh8w7yO3s0aZTLAF4qz4E+qahx3ayfJwjWK
         E9uhTZOODj0hb66EBqIihzVEJGIG2kN70stbOEm+fp48CFPYRlWmeOlG5EFJYESzvtV/
         4hpIPWR8uQf+dDE7jyf9uKHuBbESOXTKV845gwOoM2SFBsu8wFDvUDNURFdrfdDC6UND
         7/Kqa15KzBSLDIk44Yahc8Vr2By46SL4Nr0XTk2t+LmSo9bEQhaWSM8EsLL19yxNg04m
         3/oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHBQvv7BoxljdTb7l13eI+vj/577+xj2/iWcDc8W/DjuGcDQFJg7up74TikNNXdVlmSIzvNsCNvQQlSJU3@vger.kernel.org
X-Gm-Message-State: AOJu0Yy65tNOBq1zWWrd4vnGC6SsXl4fhNDFAFMJT1EVqpPoDkhxeKMV
	W2GNX8iEy95mjPOxy7p/IQrWLEu9FrbL3UmyP2GLi9BwC+4mP9YpKeHjqkmKHQveCdSBZ2kOYSm
	PdiOSptelT/J1CfB33odI+SYfyjjgkjm1IHJSXQ==
X-Google-Smtp-Source: AGHT+IHpCk9Ie3tjfELqhlCu2x/52PgQgPKGQSoJw/xeowtbhkwR5jsEK8Pk9v8JuuAsJqiDSu6hAEek5J+97ycmVZE=
X-Received: by 2002:a05:690c:3412:b0:6b1:3bf8:c161 with SMTP id
 00721157ae682-6d40de6aceemr10973717b3.13.1725008070745; Fri, 30 Aug 2024
 01:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240818192905.120477-1-danila@jiaxyga.com> <5gmsbbnuc7sbkpptomvpl6aarw5poutvjfav5rilgogb7727vi@nhtr5m24tkmt>
 <ZtGCJincjO7z-WFm@linaro.org>
In-Reply-To: <ZtGCJincjO7z-WFm@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 30 Aug 2024 11:54:19 +0300
Message-ID: <CAA8EJpopMPSBmxJHbatfF+fNoSWipbepyj+7qJRG23WYOCCWzg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: sc7280.dtsi: Fix PMU nodes for Cortex
 A55 and A78
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Danila Tikhonov <danila@jiaxyga.com>, andersson@kernel.org, konradybcio@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@mainlining.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2024 at 11:26, Stephan Gerhold
<stephan.gerhold@linaro.org> wrote:
>
> On Fri, Aug 30, 2024 at 11:13:28AM +0300, Dmitry Baryshkov wrote:
> > On Sun, Aug 18, 2024 at 10:29:05PM GMT, Danila Tikhonov wrote:
> > > The SC7280, SM7325, and QCM6490 platforms feature an 8-core setup
> > > consisting of:
> > > - 1x Kryo 670 Prime (Cortex-A78) / Kryo 670 Gold Plus (Cortex-A78)
> > > - 3x Kryo 670 Gold (Cortex-A78)
> > > - 4x Kryo 670 Silver (Cortex-A55)
> > > (The CPU cores in the SC7280 are simply called Kryo, but are
> > > nevertheless based on the same Cortex A78 and A55).
> > >
> > > Use the correct compatibility.
> > >
> > > Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> > > ---
> > >  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > index 91cc5e74d8f5..ab024a3c3653 100644
> > > --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > @@ -845,8 +845,13 @@ wlan_smp2p_in: wlan-wpss-to-ap {
> > >             };
> > >     };
> > >
> > > -   pmu {
> > > -           compatible = "arm,armv8-pmuv3";
> > > +   pmu-a55 {
> > > +           compatible = "arm,cortex-a55-pmu";
> > > +           interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> > > +   };
> > > +
> > > +   pmu-a78 {
> > > +           compatible = "arm,cortex-a78-pmu";
> > >             interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> >
> > Shouldn't these two entries have GIC_CPU_MASK_RAW(), limiting interrupts
> > to the corresponding cores? I see that in [1] Rob used masks for older
> > SoCs, but skipped them for newer ones.
> >
> > [1] https://lore.kernel.org/all/20240417204247.3216703-1-robh@kernel.org/
> >
>
> According to the bindings, the cpu mask bits apply only to gic-v2, but
> not gic-v3. It looks correct in Rob's changes. And here too, since
> SC7280 uses gic-v3.

Ack, thanks for the clarification.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

