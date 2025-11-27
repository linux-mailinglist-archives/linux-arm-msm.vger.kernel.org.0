Return-Path: <linux-arm-msm+bounces-83602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9916C8E9A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 14:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3F23B18A5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 13:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11E5B2BE047;
	Thu, 27 Nov 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Mqi7wt8o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1252405E3
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764251247; cv=none; b=m04KHO+eyqHDVSUWJSOxBl8czT+czIzAI1G2MUszF/zIUWcj2NNFJCYfY6Qvm4hecFM/NlkqYWaB6JfdzNAfTKC0YjK21aFjTF8Ol1uC1CNh9r/kDDs3wnXhfIKgLxuhj9Vhn8UhP9Q460MHGarFZ9UnYFQiJqXGAGqdPxEYQIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764251247; c=relaxed/simple;
	bh=27yd/l6012XaQH/g8Ixa+D6cMcVdfn8d9/IVn2JOVCI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm6KFixQnxaDe7yxwqjmykf6mBkIQR9d4wX5UZotPqN6NhdEtv0uUah8EDjMYHykr0qwkRaDeCmQeTsYF6wUPnKm1b/Ge8y7hackMtqnlQNLakToamx+bqk0DiFwLt9qi8KiGLA5ZC84QuYBctlzdWSZesUjd1VM32RBhILhIRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Mqi7wt8o; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5943b62c47dso816031e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 05:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764251243; x=1764856043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=27yd/l6012XaQH/g8Ixa+D6cMcVdfn8d9/IVn2JOVCI=;
        b=Mqi7wt8oNrr+2+e4XNhQBFHjbbJlNk2prXtZZdeiWDpubDuSNPjtqVuc6fFI7gQTNW
         vlhDRF8Ikv07ZhquMqzkqlRbUqUBvhhznOF0yf+VzMxYMKnOLOCd6txDRXhkTGnAwFfn
         9q/AFxkcnrl71n9rhoZuu/08jdMh/RFnG0Cl63G8H+FblB9m8ujHai9LfGR+WngJj2Dd
         TjMLWQA1KgMyWpako1U/QHpPDjlp8y4V15h620/0cvt4YsBCRXEygHzP/Lbbhj6NIsYB
         DsZitljR6hDpZnbRH3U5UlgO5Ha0pWvDDCPBmOt/Z+Dos4I7Or/n2AinAFdgzuAfJvVY
         hiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764251243; x=1764856043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27yd/l6012XaQH/g8Ixa+D6cMcVdfn8d9/IVn2JOVCI=;
        b=QtdpR4CAC5InDC3shDxPxIj7UHNHaPN+LutUj+lGY3E2X4aJFuCXGxlpb0Mrh91+fQ
         Vj4xgQwmpXDeenvYDsI56KPRstOM3M9kBbMD68I6sWutzsOaXX3KTfiyd25MWV97ZhKo
         +G37imJFRptTe3tsTNAqaRmkNAsLsaUysVHqniOaIYGuRbsX/r/x/VeYrgcxbYvPTwdR
         79f1PFqtJAmN7gLvPziZWnTyK8f1gv9BHnoM3HrgpEGbXVFiBCuK8/ESVazG8gTMv0FT
         X3nCKrzJ9dwhF0oAvs+14R3au6tZ68QjdWh2qtYSdx7MxlV7+HCYrj71SqfL+nuRACyg
         LVxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDcXLgqMg70d2nN9e+ZTNjdqgiDASV06C2iM5IQJdiNnxBgMn0qKbOyxQQw7y1FCWoctPtKM0jV51btiuS@vger.kernel.org
X-Gm-Message-State: AOJu0YwKixmKK7dCjXxLtZj7Z/46I/AbvLrbQX+B8GVyY/m9Qx3JDsCR
	0SEuqFchrVLfdQsycIIsfbHgbZPiX/yPFKQeDwaFmKDzggZD3OkgLtacuW+72xxFmlDgGZXqnqc
	u/HZ6dsoxxHgqbeFDkPvxSCldQHTORhrzeAmmSR3/+A==
X-Gm-Gg: ASbGnctJiOZMC3JSjCLSEfk5dP8JUS/XwcPGj9yV25/4e4cxoVJZK915M3G5M5hV1u8
	n6niNfoV3xvHznK4QtxbRuW1nnmmA0SwMn6WjPUeXdk9Br47+8DDX6xueilB8w53n4Gu6G9y8Vg
	1C5vy2VtCOXVQUmIS2i6wY1vSEqCQDx5uQehZPf/BI1OpmJi1LGrOWbn9YxwIaIYLr39xo4Ib69
	qHsL6iTONWBBGxUA0AOVOGk0OfwaQuvKcieeEhPhMPEiUEMr3peEfSfOjjfPk9kMArRzp2PBiKh
	K8uPhE0TtP8mBVnLMGlKcB9jY7k=
X-Google-Smtp-Source: AGHT+IHIByvzTN9XhwquV0dZ7CSOzT2wtZW2aRAexw9uGkGjWx9uXnsQQnkc0lHm6G8MnJ63g3o+AbKWIIpqZ/ETI6E=
X-Received: by 2002:a05:6512:2354:b0:594:36b3:d1f9 with SMTP id
 2adb3069b0e04-596a3ec4221mr8118131e87.25.1764251243268; Thu, 27 Nov 2025
 05:47:23 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 08:47:21 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 27 Nov 2025 08:47:21 -0500
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-e-v2-1-32826de07cc5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-e-v2-0-32826de07cc5@oss.qualcomm.com> <20251125-pci-m2-e-v2-1-32826de07cc5@oss.qualcomm.com>
Date: Thu, 27 Nov 2025 08:47:21 -0500
X-Gm-Features: AWmQ_blvAAM2uq578ciPVCG4M9rg3fVM1qAGhRvJTTtDZYm9qOnYz1mkG_i5iVY
Message-ID: <CAMRc=Me+mWYaa4ZKTmch-NtuvP-2ifbY1Zwi9E9KMyUgFSt0fA@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] serdev: Convert to_serdev_*() helpers to macros
 and use container_of_const()
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, 
	Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-pm@vger.kernel.org, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 25 Nov 2025 15:45:05 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> If these helpers receive the 'const struct device' pointer, then the cons=
t
> qualifier will get dropped, leading to below warning:
>
> warning: passing argument 1 of =E2=80=98to_serdev_device_driver=E2=80=99 =
discards 'const'
> qualifier from pointer target type [-Wdiscarded-qualifiers]
>
> This is not an issue as of now, but with the future commits adding serdev
> device based driver matching, this warning will get triggered. Hence,
> convert these helpers to macros so that the qualifier get preserved and
> also use container_of_const() as container_of() is deprecated.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

