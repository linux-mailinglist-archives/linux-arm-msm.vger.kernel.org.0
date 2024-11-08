Return-Path: <linux-arm-msm+bounces-37335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246FD9C18AF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 10:03:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE368282ECD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 09:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42DFF1CFEC0;
	Fri,  8 Nov 2024 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SVT1cdzd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E551D1F4B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Nov 2024 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731056595; cv=none; b=ntH2mW8F2lM8mkz3DTCrHzIZw2Ykaqc0NBq8w2lICaEIFAm55dOYMEwFnX8WBloHPiKm6Z2wXmVZehaij4CcGBNjg7ufoIIUSnEYYZsXODUaQlDR57aIkixeXnjntOXzBH2bACBKSSKbbozDSwgmi65ZkGYleDujQXFR9UiiRhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731056595; c=relaxed/simple;
	bh=mM1q+PpNsdlYYSy0+MS7uMGw3FOxO3A/2cgbrpd+lLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WX8mCeiFBGFy9SerpfSjd3r7IP9bxEhLvxQSCqJDghPtzWZQEEdjwKIUhBxrOkBegooy5WduWBjy6hQyHz6LZZBxGeotDXi85Nyzk8xRbcvBzvJA9nKYBpDdTeuOgFDj/z3WFVDMPfN6gh1U9X4dzOoMOBD+5rKN5IM4szRHRHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SVT1cdzd; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso17608561fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Nov 2024 01:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731056592; x=1731661392; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mM1q+PpNsdlYYSy0+MS7uMGw3FOxO3A/2cgbrpd+lLQ=;
        b=SVT1cdzdHhk8J4vvzGfl0QSWqf9+mWHG3SdlfAcDe9PjrxutdF5yiF8H95Z1PFjvVR
         GTmsbsD0XnFwCGEKTzto5xvS2OxItki3d1o1cm8eUr+gZLdGA+sAFnuHWk3w8sbcNC+3
         b9wLr0OBz1fgjWSD53mNY6LbkFSyahQAcf4Z4qO63FdHY+L+7DHZMtDLrMbnQ+94DPGK
         CAQYHFb5eiloltk+gXe+2L3cxVcYB1LOHMX2k3f+acxunE1gpqKlW7is/68uX04CrIFU
         fWwYS5kjAFp6Ts3Q1F+ya1tUp4jTozE573WTZiPx1j/fvRj2+FnTUFy5htVNjJjBSVrq
         Y+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731056592; x=1731661392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mM1q+PpNsdlYYSy0+MS7uMGw3FOxO3A/2cgbrpd+lLQ=;
        b=kchZd3OfmiRiix0iM9VnY3iYIhjnCIjvyhya6Qq7WwNIuRh5uxqZhsSjAhjAOzuALl
         BXReES40s5u0GSBLhIu9HJsFZqKI2/W7DM3lTtu/t71vLCiUV/ShZljnTAZPfjWnuGr9
         HuEK33NNBcnOwbClVrkDSTKcSKJ+6NSrIRHy4uDAzESpajVvBR2LK82cT5WzYTfWwoZg
         YQ//wxyqjvTjGrDcWcGXBnBdU694g2mBLYz3z3Ldw3NgNZ7FN0go7WcpIfjVpUg1Xrk+
         FYGkhOGSerOzJ/S5o7KgxH61u0gWKjtbcG7Usf/L6oudMwJy3GJCId4TLFbIBF33IPBV
         tJmw==
X-Forwarded-Encrypted: i=1; AJvYcCXNt/cEqQuOr+w/lwERTtUMgGdiqn0mBuUalMfe1AxRMLuRUrXdGQxIaanZx/NSftEZYcm8jgbtvIuM7DIz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4qcqj0mi73U9WDMT2o7fm/eH9C6185fkPrZBbYOX6ZxSit0mS
	BzZChIvvu0x1DLFFW6PIFaDbZDneZCtKPlxBONcHUbsuz+lNC3W+JKzb1pqN1peyEk/voI3vMZ7
	tyHwzGfPhwN2a2+GRquT4ZdtKBP/FB7C/hYe1LA==
X-Google-Smtp-Source: AGHT+IE8znKU2mORtpqCkmsGs3P+cyt3qFPqf5rFKSs3v09PAE6qN06MrjzRnmT+Va62FCJoM1OHaIoEnk1727lsx7Y=
X-Received: by 2002:a05:651c:554:b0:2fb:4ca9:8f4 with SMTP id
 38308e7fff4ca-2ff20209f08mr9538661fa.23.1731056591608; Fri, 08 Nov 2024
 01:03:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107-msm8917-v3-0-6ddc5acd978b@mainlining.org>
In-Reply-To: <20241107-msm8917-v3-0-6ddc5acd978b@mainlining.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Nov 2024 10:03:00 +0100
Message-ID: <CACRpkdamugexe6y24Tk2fDYPP_t7QLynibdGQrUMFMwF4y90cw@mail.gmail.com>
Subject: Re: [PATCH v3 00/14] Add MSM8917/PM8937/Redmi 5A
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Dang Huynh <danct12@riseup.net>, 
	=?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 7, 2024 at 6:02=E2=80=AFPM Barnab=C3=A1s Cz=C3=A9m=C3=A1n
<barnabas.czeman@mainlining.org> wrote:

> This patch series add support for MSM8917 soc with PM8937 and
> Xiaomi Redmi 5A (riva).
>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
.org>

I merged patch 1-4 from the v2 series, don't think the have any differences
in v3.

Yours,
Linus Walleij

