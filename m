Return-Path: <linux-arm-msm+bounces-11954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39285CC60
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Feb 2024 00:59:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65E48B2234C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 23:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143E51552EF;
	Tue, 20 Feb 2024 23:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3YN/4fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CB1552E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 23:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708473534; cv=none; b=K2gqqIsD32cJ3SN9okM6rKRtw3zNLfPQCBJUBNkCtLQ9KRetrj5aT4xY+5g8IwAI4c2kmDDcnmTWtidOj655cvuZxAcMBAzYemQT1FSUE6I7Ob9Lm0zp7u7ZdNHeKJ35O60ajzI748H8Hp1g9gpmcc34M34D+ual4XQnh9DMTMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708473534; c=relaxed/simple;
	bh=/2E1dI20mlC8/4NkWi0ja8n1GkgznfvZg8EI+WshC0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S29iNRzT2dBvDznyr/XCnuiQc6GSiOyyw18Dqob12HuENtSwXtfFGrozwtyro3ZDY+DKKS6OI6CKR4ltnJ9RDYWQlx7uNBrm4ZgtzI8hireyd37EnKUvuWEv4pqxQ9F19jfDlSD12E4/j7pD8itWOiboEUXN4kWzVDx0AOwmSZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I3YN/4fr; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dcc71031680so4808097276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 15:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708473531; x=1709078331; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qWLcN9a9ompSRERy0rerQL4YJLev9LmdSeoyCodY8x8=;
        b=I3YN/4frvIvjgfHL8GW1C/X4El4VCnK1c4x5FYyCgF46hUcG0LxHYbTyiC6nuUjwzg
         vtWQct7flqQwDctPwWTit0s0jEg00T4zTFEJUUiSngt6j6kqNfMITC9Dfu4u+QYBQ/k5
         0yC3SgY5Bd8+WV2KrPM/5nRycuwFkuj7KlYJ/xhDNplJsrqHM7IzuOCABZx8eT1X08Pz
         u7eUrQ2gxlyPCtiipelQLJkuibEPS6aOCdkmIIXz2iATMjATNJ4KXHd0+AtDw82mM7nR
         3OX3WD10f9gDrzdBoVXIHYRGuSP0ANeotMuA8J3F5fRXVa5MZV55HDNmOO1GbEIn6KT9
         XcHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708473531; x=1709078331;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qWLcN9a9ompSRERy0rerQL4YJLev9LmdSeoyCodY8x8=;
        b=qmXVIdaQ7gxRdPK3PkXGBHYkD/PrgCf4s8co0uW9kqF8DWSiNU1FaZ9H/QKjERhCkP
         vxpnPsgsF7wDC5Safsf4Ily2hGb86VQa4/TcADCZnOdbJGva60n1/zHDLxltYH956YMk
         2moo0gWvclxh/9jOO7d6PSeHhb0CuhNkaDMeU8bu/PUYKcctJzH3tEhQPDPQ0TG1qc0o
         HKtxqxPwj8RDaiyPvCSRfq9FZZqTRA0NIwanZF1Y0Od1R9Tet7e4eTqwkRuIqz9/ub8Y
         tRNss33iBwY7FCOywqCbIBdWPib5bITGnf5qq02w3TMDm4yiutUwHSPWcH4Csczw+2L2
         NqoA==
X-Forwarded-Encrypted: i=1; AJvYcCXU0d+qrO016ceqU5yftnIewFuv22tcl3fpKtQINfNj8Ttlc+kShLKAUle4ebpRB21wW/z3+aIrSvXt/zSBRTMK1WiBaTl5sXcMbmdWUQ==
X-Gm-Message-State: AOJu0YyGgODL/zhm/DcpOQaypUhZsEDiSfmjYnmtFgIqlCRYXFmKbgTV
	4dTPuZ+iLkjOkbVTAwYUo9LVrVQ2B4nUjKF9F+2yWIQ0/KEaHyywC/xKeCvRoXMQvEcwTXrw5gj
	UCm1s+6NuPe6QuBz1PTxSmyCO+G4M9ZxJ/TRh4g==
X-Google-Smtp-Source: AGHT+IEYX5XxZmmo9sef97202jg0pEahQhP3i37ehPC6dExoWuBQvnOlPK2ahAYAetTNc+dq+us40BDsa5OA7E9lxso=
X-Received: by 2002:a25:aa84:0:b0:dc7:4b0a:589 with SMTP id
 t4-20020a25aa84000000b00dc74b0a0589mr15828426ybi.55.1708473531428; Tue, 20
 Feb 2024 15:58:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-pm4125-typec-v2-0-12771d85700d@linaro.org>
 <CAA8EJpoUHi8FDAKa+LO+2t7fXxXaFYhXAJzkUUPs_uJH9pvZWw@mail.gmail.com> <b72042b7-a500-460f-803a-c6f178bd9cb1@sirena.org.uk>
In-Reply-To: <b72042b7-a500-460f-803a-c6f178bd9cb1@sirena.org.uk>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:58:40 +0200
Message-ID: <CAA8EJprU-oC7ki1k98dpLn6xcsOa63EtOa678AcG0WiH=qy5xg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: qrb2210-rb1: enable Type-C support
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Feb 2024 at 01:45, Mark Brown <broonie@kernel.org> wrote:
>
> On Wed, Feb 21, 2024 at 12:40:32AM +0200, Dmitry Baryshkov wrote:
> > > Dmitry Baryshkov (4):
> > >       dt-bindings: regulator: qcom,usb-vbus-regulator: add support for PM4125
> > >       dt-bindings: usb: qcom,pmic-typec: add support for the PM4125 block
> > >       arm64: dts: qcom: pm4125: define USB-C related blocks
> > >       arm64: dts: qcom: qrb2210-rb1: enable USB-C port handling
>
> > Mark, Greg, granted that the dependency has landed, could you please
> > pick up patches 1 and 2 correspondingly.
>
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.

Ack, excuse me.

-- 
With best wishes
Dmitry

