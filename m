Return-Path: <linux-arm-msm+bounces-11784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E6985B724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 10:19:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C8021F25D6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 09:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 696225FB84;
	Tue, 20 Feb 2024 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c3bxW6jq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7685D499
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708420762; cv=none; b=hDscEl8x8rTAH94q9retrPa9HnSq8+oczQVgXNe0SSAkxnNgsRe2nWII5SUR8TRbwxT+dkJYWwdEr+aMnelj7lwzt7f2/f/KsCBY6q0j4UKqfOJ4//9L3I/4ahe4cwU7IXx6M6Cj2lcpebIQ6PTjCoxGW6Bg6fsRfeLKslbXOT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708420762; c=relaxed/simple;
	bh=vHDeoeY6rVvgUPwaKy4miw3a+/4Wz+3FToMeykblxHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyLXaEwpD7b/D51Fa+hGid+Y1S9McNQSConcHmUcHsedW+wYImR0Yl8aD+YtbKmF89oKu2M96WcQgNpN0IQekGLocPqG0Fwbx6cH3gJ3Yl3D/xa/Cj7WTgPTr/dy+l55BVQQfoTUF+Y1jbu4E2PM7Jjqh+IHXPhcYF4VAXi9uB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c3bxW6jq; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dcc86086c9fso5132351276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 01:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708420759; x=1709025559; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0gsEdTOg81nU4mrHxMiAVDV5UIPBJ/nXolBaH3QcjCw=;
        b=c3bxW6jqw/kJ3PpXF2122zK1p8MtJvA6fxW/+qJw2S9Lhif/orfomP8Zk+5wG3/IQI
         /vM+PaaRHxMh/IxTwo4eZ7XXLBTYHMf0f1uND5TnYU41GRIfh2ByH3GedqP/TwM+8XUm
         D1yPHa8Eb2f0cqDwhJR4L6mhE7tUEACF1/MEbX0RTchrEH3Yo7I49UW9BIeuUV9Oj8jf
         JbNs3CBV9Pyu7hVt0/x9pq7OEtZVNkzetoVUwu8QbBHD3SCUGbWzQpYY/sD4Ujf6PTmq
         z9e8FudIrGU00xLVGFzFJ/enPynhVrELmpX/cvEdqzrAnK9vGPfcjkFkMg5JMpIhtP8r
         kAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708420759; x=1709025559;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gsEdTOg81nU4mrHxMiAVDV5UIPBJ/nXolBaH3QcjCw=;
        b=O2lwJxccnJZtb+XKV28xdMkEHeNkgAct8sXS6461rgLkyNnoxZuWS8lJ65RM4bHJhy
         PQhMQgeFrxY+7p7HPKzwxnWqEGCSq/g6LBVsz4moT3Uw0vWNJbeSj9woH7P5WqRTkPdA
         t6+gJJkITFUlSrLde8nVcRMOGbPT/c9jpMo8NgFD+D7xCX0x7xJb+3fxIFAksJd4+KhO
         U4vlOsGDdXJWfs1pjLel0dLWDYgYJl5rDNxUVFlOOHp83aP9dxi7LKXRm+yz16fl25BZ
         aYLVF5gaDlk1GiEWO1uFva9IDOU0rSQPQKUBc5yAl4g5BRkX9Wd9UymTi2kq28vOwVaU
         mNMw==
X-Gm-Message-State: AOJu0Yzc8C09Wo5krubcUzy/pwY4owXsYSoMi6f5+3U3J9txtA9uzhzg
	fIwPqV5P9RMCmlVX6UOrxSN8gqydhsdz06uPwDFhSiNpH4oKDR3L9FPL4SK4n1Z3XM3aEfdM9L7
	GbONs+ghVoUW0SqRR9jmP1ZcZDmS6J2akTyLslw==
X-Google-Smtp-Source: AGHT+IGPqn0qOwME5A5LSEqJGUhcBrK5loyFtiw5abc2EMucdzkO4malL/Si43SjYjBl925JQ1d2/Vm0i+Z9o5EXBFk=
X-Received: by 2002:a25:2f52:0:b0:dcb:de9b:175 with SMTP id
 v79-20020a252f52000000b00dcbde9b0175mr13753374ybv.6.1708420759119; Tue, 20
 Feb 2024 01:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240205115721.1195336-1-quic_jingyw@quicinc.com>
 <20240205115721.1195336-6-quic_jingyw@quicinc.com> <CAA8EJpr7tHXZHcH1Sbcy0-MCZfMxKBjaPXGdpg3cqyyFjTZOeA@mail.gmail.com>
 <9685991e-6577-4f96-a17f-b0a65d8d1260@quicinc.com>
In-Reply-To: <9685991e-6577-4f96-a17f-b0a65d8d1260@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 20 Feb 2024 11:19:08 +0200
Message-ID: <CAA8EJpqVQEktHuD5sYsRMiytPS+XfoHzVTBUuKqeavL4yW72Sg@mail.gmail.com>
Subject: Re: [RFC PATCH 5/6] arm64: dts: qcom: add base AIM500 dtsi
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	kernel@quicinc.com, Tingwei Zhang <quic_tingweiz@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Feb 2024 at 11:17, Jingyi Wang <quic_jingyw@quicinc.com> wrote:
>
> Hi Dmitry,
>
> On 2/5/2024 10:23 PM, Dmitry Baryshkov wrote:
> > On Mon, 5 Feb 2024 at 14:00, Jingyi Wang <quic_jingyw@quicinc.com> wrote:
> >>
> >> Introduce aim500 board dtsi.
> >
> > So, is it a board or a module?
> >
> aim500 is a module, will fix the descrption.
>
> >>
> >> AIM500 Series is a highly optimized family of modules designed to
> >> support AIoT and Generative AI applications based on sm8650p with
> >> PMIC and bluetooth functions etc.
> >>
> >> Co-developed-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
> >> Signed-off-by: Tingwei Zhang <quic_tingweiz@quicinc.com>
> >> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi | 409 +++++++++++++++++++
> >>  1 file changed, 409 insertions(+)
> >>  create mode 100644 arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi b/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> >> new file mode 100644
> >> index 000000000000..cb857da8653b
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/qcom/sm8650p-aim500.dtsi
> >> @@ -0,0 +1,409 @@
> >> +// SPDX-License-Identifier: BSD-3-Clause
> >> +/*
> >> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + */
> >> +
> >> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> >> +#include "sm8650p.dtsi"
> >> +#include "pm8550.dtsi"
> >> +#include "pm8550b.dtsi"
> >> +#define PMK8550VE_SID 8
> >> +#include "pm8550ve.dtsi"
> >> +#include "pm8550vs.dtsi"
> >> +#include "pmk8550.dtsi"
> >> +
> >> +/ {
> >> +       aliases {
> >> +               serial1 = &uart14;
> >> +       };
> >> +
> >> +       vph_pwr: vph-pwr-regulator { };
> >
> > Is this regulator a part of the module or a part of the carrier board?
> > If the latter is true, this must go to the carrier board DT file.
> >
>
> the vph_pwr regulator is defined in the aim500-aiot carrier board and used
> in aim500 module.

If it is defined in the carrier board, then please move it and
corresponding supply entries to the carrier board dts. Other devices
using the SoM can have different power tree.

While we are at it, could you please rename the node to regulator-vph-pwr?


-- 
With best wishes
Dmitry

