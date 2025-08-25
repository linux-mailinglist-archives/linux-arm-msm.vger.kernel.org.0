Return-Path: <linux-arm-msm+bounces-70595-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0FDB33A2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 11:10:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71605179E48
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 09:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6B6F2C08C0;
	Mon, 25 Aug 2025 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NqwNVgAU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF11190664
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 09:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113030; cv=none; b=p2Rp+vPyD9EMEiXv9SEQhWGLEY9QQjQLu7jmFoZ4nrhJSP1VDxnZI3L1EbRZ8t2FGd4Z0sMxc5jeetMq1CdgmNeeoANQEt19N82CNAzv/HWe9XpwOxoWfKHI3CD+ly70U8zKKSCvYFRO2C68y97bPhhqrQ/bIEXkfcyLN3nA7IY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113030; c=relaxed/simple;
	bh=K6PyU0GsbatkF2Dnw0veoFSf+BGczxcVhhUScrXAiLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pm+Kpub2qG9wpOD4ej2KIJc7jpS2ntuVJBTlXvRQU7DngG6uPs0dtMsUGyjVNLaDiXLCAwzGTx8swCvCO37LdMQWQMtknk76u+VMq8tpASF65PSBTKXQLjCmBP/IqGOr0pt4pHILn30i4m2cjBxTqdsd5/u5M/h/oRx0NN8APCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NqwNVgAU; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-333f901b2d2so32219811fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 02:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756113027; x=1756717827; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9+ip/B1cOdz45Ch9sh9CoC/HT80R58+cTC3VtE9YsY=;
        b=NqwNVgAUAs6RxU/7KvsowSaqE8na0dasiBxgEKRdgRogMWjbM8sWcYUj1su99UZQCK
         ZTqD/H8PzI0E/g49Z7O3qRqXXfjk0EpIQ7sqF2m5uzKQoXrEl0vKqjgh/gxpXTC3hG1t
         4reeeyxng4ZwvSnrJ4BwaP/m08LvLotWD4xLpqs4WvQmqxPGcbdMEa6oMUElMmeKl/7o
         VjruiJqUQwSa8IQta3UVnFAX5JOIDQreuskXdWkJHR6WQ0X9yshI1DZ2OGScgu/EUHHr
         2y4tn7KoUqIeQxXhpd6djpkQz1v3Zru+63hdfKtFovj6QXrBFqDSKtndwkjrhZjXi09Q
         jVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113027; x=1756717827;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9+ip/B1cOdz45Ch9sh9CoC/HT80R58+cTC3VtE9YsY=;
        b=GdRnS+GqczgBTTakFpvQJ8vYEa5yNd8vQlIjLKYp5r5WpDfPzTPmdbzQvHJ4oBOoDH
         Rior/iiMe58cgT/rhaa/3F7AYyL5M+HpcSLWAQaJhVmdro1UtsJYu8Bt60i6eVe+BIzk
         cwu1FK0NM+FTjLOXKnF8yiEfYtDwfCPbrBFOiy72N6IfPvJxTo8+Hm5QfSY7/s6Xtjve
         8ewVscwMc4O7FrG0VbURohGW+8kahgcNEnDttu8oymUHp12AEDsvJQ8bLt2lA9HTdVOs
         KSpmRGKVx8BMy/7Q74Bgaz5RM5ifDjbsoFcokauc9gy8zFM7Zu4fKDREhHQ/WXyR/WTR
         s0FQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2e6OfMM8r6COvCstUE9AGi6f1Bo9w9/NPrs/ul4E9r3FcvX4D55RhJGUyC9RM+STU3h28CrBnxoTF06wh@vger.kernel.org
X-Gm-Message-State: AOJu0YznQYYKmL+0rSoXcAM77qI+YqzyMzlcBnzKFMYRgOYcdm7cpvdt
	JjoinXX66UELHd91Gs/UXIlePJjZbZeJVV87EKHj5nP6yG28W+YFsjI2vMZlxMd2ANmE98bDLRI
	bxnCu6wGJvn3gb7Jevq8EhCeja0wvmmB2L5AMdo5DwA==
X-Gm-Gg: ASbGncucrokV1nVqxw1NX/HPeev0Pj7+ePyfUUVvIQIzsDfh6KdlTbFXlH1F5HjO89c
	rpx32EPo+oblSdsEhCNOyQd2T+XRsbHzXvlisVYGGDzdWZWIKBdIbsCLg7rzFwMvEWqJxReyjfd
	w4i10LJ9MzANwf3hoTA4KmVNVWBUYPMCeiJsqlyiEiS9KR7/7MVioIGbIzJtInluCPBUu8QP1l1
	7lQkFU=
X-Google-Smtp-Source: AGHT+IHDpAZbDBO+P1KWHMFH2puuWSDWYfqPFdD8RvYPD2rHyprBhEUNN62NBhXGRZs8RUFrVFKwGRZe7oYI+GC3DWY=
X-Received: by 2002:a05:651c:31d5:b0:32c:ab57:b03 with SMTP id
 38308e7fff4ca-33650de911dmr32208511fa.3.1756113027149; Mon, 25 Aug 2025
 02:10:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821044914.710044-1-quic_pkumpatl@quicinc.com>
 <CACRpkdYEzbM33HBAhHEmAg9f4Zpi=2WvqPdZ35=M2eVCqcTTFg@mail.gmail.com> <c81019f3-3570-4437-a10a-d49cabc4952d@quicinc.com>
In-Reply-To: <c81019f3-3570-4437-a10a-d49cabc4952d@quicinc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Aug 2025 11:10:15 +0200
X-Gm-Features: Ac12FXyjszIfUK2JZwcA6e7nLVD1sdGnLR4S34aGz88q5xxgv2NTEWTCwRbER78
Message-ID: <CACRpkdY0tva_Ss+GhAA99g8tMWhbFVJh0fbYakMh4AZG1K=c1A@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp boards
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, kernel@oss.qualcomm.com, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2025 at 7:33=E2=80=AFPM Prasad Kumpatla
<quic_pkumpatl@quicinc.com> wrote:
> On 8/21/2025 7:04 PM, Linus Walleij wrote:
> > On Thu, Aug 21, 2025 at 6:49=E2=80=AFAM Prasad Kumpatla
> > <quic_pkumpatl@quicinc.com> wrote:
> >
> >> Mohammad Rafi Shaik (9):
> >>    dt-bindings: pinctrl: qcom,sc7280-lpass-lpi-pinctrl: Document the
> >>      clock property
> >
> > Can I just apply this one patch to the pinctrl tree?
>
> yes, please go ahead.

Patch 2 applied!

Yours,
Linus Walleij

