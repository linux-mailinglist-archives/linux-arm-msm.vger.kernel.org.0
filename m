Return-Path: <linux-arm-msm+bounces-23617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D220912999
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 17:27:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F19E1C21F55
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 15:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553F55FB8A;
	Fri, 21 Jun 2024 15:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A/9z+zCw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1D6E619
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 15:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983619; cv=none; b=QzOqOCxr5CssQnDYzKkGkYfSgzxJclm9Z0jIXdCnHWGRGQk5oNHzhPXcOlanWQXAR19CRTslGRMsMUFoxazH5fbc1b5kBkCTMYKuBxBAEQ6colnt9cU+z/dJE888ehIbiyZWG6y740dJGL3Ty0LDDhGH2Rtgp6CXakDoO491waY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983619; c=relaxed/simple;
	bh=YiXUoRydHF94lmyooJRgeUSN12E4zkqY2DFQsZtgdZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ek11A0BGos5UBhGGQ6bg4mFlPH09eiaNtzGbTErDx47J4A9b7b1lbCU5RWMAhdOEGmUtMG1/m5mia+7+lfl+qR63ezOwYVSc8k1AtKJsrqGvHMV5RZTlMdIs0WU2z3rRNHnhm5AFiQ0urRyAkRoIzbzot5Xzm/BlMFkOOsoT3fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A/9z+zCw; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e02c4983bfaso2096926276.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Jun 2024 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718983616; x=1719588416; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sbi54k1BCdu8WFR/Tlc4MACpNabu6e6B0tEbW4QkoJA=;
        b=A/9z+zCwl10gCmoXuotennI0XHsSPbbWOFGqO17mFZhkV6ZyPDot5HHyj2rRZz3ZQa
         I81Vuy4F3zshAULOHgFyQ3vYz0MdBg2jthRDWZCHFEvyrUwWdZflgo1a6aIzN0rhzrxV
         MDrpJop93gLRCGyHH0vVXG9kFrCR2eq5a2aUgLNEXeHM0Ynw0/+rOQc72zuClAodQQoU
         4oP+SRgk43tHBfPy6z1eTyzDgG8rRXvgDsHbqQsmM71CyxmSM7wkMWeRTq68I2FxB+4m
         1+wnDu8m0cGMc9IrT5q1uIldOiIFBzmgDnrYhd42Y1JIo1bWSHaaynF3ML7s1Bwc8iVw
         zCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718983616; x=1719588416;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sbi54k1BCdu8WFR/Tlc4MACpNabu6e6B0tEbW4QkoJA=;
        b=atuvwqrygO3rYiHAK6oLlmEZcah+j2bD9ct5mpfaPoFtxQ/qiUXptHEJF+3JkQ64y7
         lU4TUXeRcwJwXbI6kMn6I+/9jxIaBIPUr8GrQJdeCwNp2qbpyCeKYSK+ZksPvvhh+GNk
         f5EMmIlVo4U2SHTrq3kxLtEp7x7eq4tSjI45HsmymghohJ3Jy7u1jeMzbpoF/wh+677l
         0cVNX6zukono+bNk01rtIVSOFvE/v8n2vduCYa+g061jVHm4c6mPhtwB8zU1CKub7YhF
         rFgUZfqCrJsf1Srr3w22I+r8k0Pd3muXXzr8YFFPS1M6DuZ04MrFcvoohvdzlgCCBjFl
         KqYg==
X-Forwarded-Encrypted: i=1; AJvYcCWvNil1Ie1SjesUrZBxSKMNCR2Kjwim5p93EFmPrpMm2nzoYDsNp1vFaOMMtDy/5HyKB57/BAV8mC58hbbN+gvSM978QQwaApbh4sT/pQ==
X-Gm-Message-State: AOJu0YyRAhRqGDj5x0mHEjnyp9mTE4EVN3q9N7Rl6MDi0s0XrYFfpcET
	xY6eco3H0INaGSSdHlRJQdVCP/dxLkufehbGZ2B2QsEq2wpqb4FB6fr/ag3FoVh8eIyUF9sm0ck
	0KpJ/uAG2RGFojUiy5xPXs0P0VG0u7erD0LYQsg==
X-Google-Smtp-Source: AGHT+IG+I31DzLceCazIw7M6Qo4beh+kZ5vRhPUkqyf/9QxJiflVj0d2qL03yK/OibBR7ZfsPrT4jqXE5tX6a25Gmi4=
X-Received: by 2002:a25:68c7:0:b0:dfb:f06:a657 with SMTP id
 3f1490d57ef6-e02be226b10mr8870122276.54.1718983616650; Fri, 21 Jun 2024
 08:26:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619-rb2-fixes-v1-0-1d2b1d711969@linaro.org>
 <20240619-rb2-fixes-v1-2-1d2b1d711969@linaro.org> <CAA8EJpo94qg0dDR-H64v0yC7jLKHuD9O59m3hG2tNR4v3NAkLA@mail.gmail.com>
 <c10b1343-921b-494b-94dd-6f5acc894e6d@linaro.org> <v3dgoeybewgegi2xuixhaq5c7jwju6wojrmzcq3rtb5f5r5nfu@6gj4tfz5blx7>
 <35d9f16d-c009-4383-a616-9b21f0819b46@linaro.org> <6fpp4noq76tphgsmkuacp6jcgy4b73emgt76wxain6jisiidxt@itj2hedhlea3>
In-Reply-To: <6fpp4noq76tphgsmkuacp6jcgy4b73emgt76wxain6jisiidxt@itj2hedhlea3>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 18:26:45 +0300
Message-ID: <CAA8EJpqKkM_MemiVdLQt7rZnmEKkiUboD_GT1QRTay039o+XdQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: qrb4210-rb2: set role-switch-default-mode
To: Bjorn Andersson <andersson@kernel.org>
Cc: Caleb Connolly <caleb.connolly@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Jun 2024 at 08:32, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Thu, Jun 20, 2024 at 06:49:46PM GMT, Caleb Connolly wrote:
> >
> >
> > On 20/06/2024 17:07, Dmitry Baryshkov wrote:
> > > On Thu, Jun 20, 2024 at 03:30:29PM GMT, Caleb Connolly wrote:
> > > >
> > > >
> > > > On 20/06/2024 15:15, Dmitry Baryshkov wrote:
> > > > > On Wed, 19 Jun 2024 at 23:33, Caleb Connolly <caleb.connolly@linaro.org> wrote:
> > > > > >
> > > > > > Give a hint to the OS which role we prefer. Host mode generally makes
> > > > > > the most sense.
> > > > >
> > > > > Why?
> > > >
> > > > I guess this is subjective, but on these boards the more common usecase is
> > > > host mode (before we had role switching we forced them to host mode...).
> > > > >
> > > > > >
> > > > > > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> > > > > > ---
> > > > > >    arch/arm64/boot/dts/qcom/qrb4210-rb2.dts | 4 ++++
> > > > > >    1 file changed, 4 insertions(+)
> > > > >
> > > > > Would it make sense to set this for all the RB and HDK boards?
> > > >
> > > > The rb1/2 are the only boards which lack multiple USB controllers. For
> > > > others it's fine to leave the default (peripheral mode).
> > >
> > > SM8450-HDK and SM8650-HDK also have just a single USB-C port. My logic
> > > was slightly different. We consider these devices to be SBCs, so I'd
> > > expect that they act as hosts _by_default_. If somebody plugs RB board
> > > into a laptop, then it's logical that it should work as a device, but
> > > between the phone and the RB board the RB is a host.
> >
> > Ahh I see, then yes perhaps it makes sense. I can send v2 with patches for
> > other boards too.
> >
> > * qrb2210-rb1
> > * qrb4210-rb2
> > * sm8450-hdk
> > * sm8650-hdk
> >
> > Any others?
>
> qcs6490-rb3gen2 please.

Seeing the list grow on and on. What about making a policy decision
that all non-phone-factor ARCH_QCOM devices should use the host role
by default? So HDK, IDP, RBn, DragonBoard, laptops => host. QRD,
phones => peripheral. Not sure about the tablets. Probably peripheral
too (unless it's a convertible / 2-in-1).

>
> I'm picking patch 1 for v6.10, no need to repost it.
>
> Regards,
> Bjorn
>
> > >
> >
> > --
> > // Caleb (they/them)



-- 
With best wishes
Dmitry

