Return-Path: <linux-arm-msm+bounces-51692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBABA66F1C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3B54164D21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE342046AF;
	Tue, 18 Mar 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NiTfdkSh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B629F1A3029;
	Tue, 18 Mar 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742288141; cv=none; b=sy0HFKUg3gQ3alImJIBYB8qHXxfbVPTBXH934nMWy6txPrXt8AAJCnexKTaCI7g8oXV80hui+MO7zgpsmWxq2lbGnJT08cf/rR0xPgiLypHdM0T1FsetNVarc19TSvZRQaCf2quI5v0Ar9JrpNq5pVIsBOlKeAJidf6jQkd3c3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742288141; c=relaxed/simple;
	bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beA2fl31SEMOCiqAZngZ7g3SaUnvCiTsFj0HOB5irY8KVvIzalli98Nbyhx/2E5Fxxj0d+zGtYhNTpjpkPNsEtAN+Dt9zu4wMKAv7HGTYPNbkMkJP72xFTyYQCp10DpuXJD4dKO7HbXyN5Y5TS6ZAK7/fFCcWV87KYJfIbGiMtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NiTfdkSh; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff85fec403so5123007a91.1;
        Tue, 18 Mar 2025 01:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742288139; x=1742892939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
        b=NiTfdkSh6NPf3f4gTGR/xEUwydhRHLSNuLqOGXOoR8wpeBi9QQc4ZgN/RzaRsO0d3T
         WpvbJXm1T+GYM8RZoDJPpotPPOEBE2lTjz0Mk53WTEq1nzWpikxp2SPSdqUnFbsMPE35
         CN0Iob3Z5wH1wZfFNhr9j9LbBSPEeIL0IYHpb+oc+fXY6vQR4jf57hsq5UIvfDSfFBNE
         4BFjqqrxGwiT/zEkJz1E+gFZg5cDM/Co3nr7qLoq7ufAeQVjlJ26SJAoQlApGVpHrRYx
         WrcIoSii5CaXwgqhniyMFkYiLTcHZnaxk3q9ig2+fDVl5kS4PBlLf/bglpxSofMfxwbU
         QQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742288139; x=1742892939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bcaaxFP1F23l0PdiW65JYiPYj/NqcM8962Z2DTxPBxc=;
        b=ftddwvY2b9sxaklMX1Fp3bcGxeh4WDfxx61mr1IoRGxXp5AbVprcBC6NOI94uUw9Q7
         4EjfmihGe8UP4ZjtX5+n/imjiFZ/QQMJorisOY20h+/4c+ZZW7CU/IpINbZBx9EzKZzW
         RDcDorxEY4sSZ3syDSpKSawsbEq+B7YRtCFPTGYqHk4SW/jApJ9VLGWhgbNIPaPPlDki
         ik0t9kiQoHKehwsJGeOsDA8gLETnGC72p5cRB/u+mIbfa8iajlnh2IvC5XfV4OIAyvzY
         Exq7phYih8eHb+0cpwgYW7LC1K3akgOUYo88THUwGa6nUHSKQEEfz4A5fzmzK6NRsXXu
         GDMw==
X-Forwarded-Encrypted: i=1; AJvYcCUlBElKyH4szZofpL2mX0iz6cD4eqJMKy1Ox8rxg4zq+8H1rT3xKtLSV2tdn4nnHLhfFB3R2x4/4FOscamo@vger.kernel.org, AJvYcCVZcc3DJ5Za6a1I/6FkKGq9dvE6jKjxS+0zlzIsFjFYS314iUhRX9qdW9BQJvS4A6RhX1nWHj6ZQvYz@vger.kernel.org, AJvYcCVa8IVNygWhkqT9HcwIKmMqJnA/uqKv5TT6b6EWTZGRjjGz0RVLOAhovFrG6yzph9mdb7RBmDHJSfAJgzvTCCHqNw==@vger.kernel.org, AJvYcCWijZnWXqo4m8O02fNuceyXGn98Jv9tPJOpIswit0yM80GBqWDHvM/zFqQje4BSswJNChbbMhordvzXlvHIUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqfbRZPsS0pwmwd9X+W1k8vSSE3oXOnFFm6eJ2IDPmhygrEAy8
	0mVHemgXTOAip0tzQQkfILNSp0t0CR1/4e36oUUVqE89Z1KsPTOeJ7qyTliXpXQOAmCLQd/iFsQ
	rFY/dUoda9Z9HgpSicnbXu4Q8JPg=
X-Gm-Gg: ASbGnctq99Kf6dAh2khFOWzCN4JkWCgD1Qt+GBZnglcp0uq9ZNXpabZDeOcptykihFL
	aA4NFro8xUwD+yOeUKHmi9x4pV1ulgO+rZ4FanciL/01k2e3dY6fyqZ1ktBywX5F+g1bWTaxP9z
	vf5Tl0lVCHdfWDX4mxCiycx90=
X-Google-Smtp-Source: AGHT+IGzUXTMu6+0f6gQ8j7WPO24H14DLLXfhIDYppHhvCBnMdLnrdfvlyQcetDDzARbEXc2mLoN0e/rL5Gkqv0Y5W8=
X-Received: by 2002:a17:90b:2250:b0:2fa:603e:905c with SMTP id
 98e67ed59e1d1-301a5b0441dmr2305847a91.2.1742288138990; Tue, 18 Mar 2025
 01:55:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250317232426.952188-1-robh@kernel.org> <20250317232426.952188-4-robh@kernel.org>
In-Reply-To: <20250317232426.952188-4-robh@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 10:57:11 +0200
X-Gm-Features: AQ5f1JoW0JUop4WUBf11_vConfYpr4BhM02aAcWePKMPfEFMJ9UWB8ZNiBwcNWg
Message-ID: <CAEnQRZA7jEA0V4T1JSam-vV-GcBAbynP0PCfQsyejScwdgd3pg@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: Use of_reserved_mem_region_* functions
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 1:25=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Use the newly added of_reserved_mem_region_to_resource() and
> of_reserved_mem_region_count() functions to handle "memory-region"
> properties.
>
> The error handling is a bit different in some cases. Often
> "memory-region" is optional, so failed lookup is not an error. But then
> an error in of_reserved_mem_lookup() is treated as an error. However,
> that distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

For IMX part:

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

