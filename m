Return-Path: <linux-arm-msm+bounces-83251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D21C85265
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 14:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F1C13A48C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9ED8219A86;
	Tue, 25 Nov 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nxJ5ydf5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313D421D59C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 13:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076840; cv=none; b=PrT3n7acJjf9LvA7XumUAw8ql69yRgk+eOkNmM1o9MGj1lxtLoqTFVt3rR256xszzBFGXzS3J94sy/n9AahljxyfHqaXmK/K4bQYdT/ihM0zivHbfXDjsCJVpGaZKgRgq8hncaRFl93MPDI9NQZiOP58TFK0smAsEyw8+fEN/Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076840; c=relaxed/simple;
	bh=aFRgkj8+TshZ/N3ynI03tnObxJnOjZJE8U7i676X7qA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAmnr57r3wHr9oURKzdsBTMGLXcn/yZCKBVR953kVDpQYK8V9XUs+O4TPfTGBBgmvYTYy/y0fxicktmFZT9gH4EBPi7RFcp7AgSHqXneAPhrSKVbzCg0mP1HtonERVHQI8kSnfXRnh0C0L8AMhhgujuTuelkupAqQTlOOfhzjHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nxJ5ydf5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5958187fa55so4228929e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 05:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764076837; x=1764681637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aFRgkj8+TshZ/N3ynI03tnObxJnOjZJE8U7i676X7qA=;
        b=nxJ5ydf5C49DcNFNRGusxyfK6OTeLGzmH9vfiaUP2ZuLBXjzvhteZ1ufow3zf9Q1NK
         4I/BsP+D6GC3UY4Sssx/ngY3WqZrnadN9sERRDdqhFdBv8HdjGpMemwg7eq9g6IYA97O
         27P6hNCRFKbzn3nN8Jdf9A/gaLO0ncXKNqRqOFWC1JbAupMz9tsqc7Vw08xtNE4zMeIP
         gVQ4Ajyu/RsTDBVL5CiyqW9oQBpXH/BwDhYPR7pGt0bhsK9olu5qwzF1Iwtub2Zrg9X3
         ZfwuPfQaFrFgFUGAkLG2urEaJdCTfvLzPfxD7GkSE5WCDDb2RAwzBU0yLCW9ESS0Ma7R
         1/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076837; x=1764681637;
        h=cc:to:subject:message-id:date:references:mime-version:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFRgkj8+TshZ/N3ynI03tnObxJnOjZJE8U7i676X7qA=;
        b=R2z5wzKARIa22IRk6EL2+TzBiEEaFUP7Ns4Rg6YBIzY7U6d0jl+IjTkt3K3aMU4NCU
         Px0wsSlwUbN+rgnMGqOpK+fKjsG+Asl45p2wBhkG6JW4+5+KIz62gDmGVfVumPJw20P/
         FoyygmQrlI4W/Y9WRZFLMhhvhBZVSkxDtrVi6i32L5BxrMseMb/c1hCe8hCd9BpPS5ql
         YwA1Oe5fEOwosgKrASkst6fO5y5RWL0Ee/KdXPm9fWVhzd41MMwhDhLRPmLES1ah44vr
         abAHWufKoueEQmtt3SOfBCqsjL3VFgLz8H37oUoIXrCrW47A1MaFnVIgeqATBbZyegqj
         9HWw==
X-Forwarded-Encrypted: i=1; AJvYcCXeQ1N//iezcQkUhtBzBSYTFHsc1pzr0yiRiWNsSffnyKe5WLbm1FvFTOdBXuy4tNUJ0+s57JgAxAhx9164@vger.kernel.org
X-Gm-Message-State: AOJu0YxDqpl0539LtXGEQTLNXBVCBSMGg3ysybuwAM7PufZO9xsGNfaI
	u8AjFfho1a8zekdYnyCFVi/EP7zv/kqLQMugx1kH4l7C2mZiigf3W25VUAbo9+qzds4PXNH89Ia
	Pge1yZMkLUMEyHsDdjwm/D6Nql5aFCtMZ73NrKQwUbQ==
X-Gm-Gg: ASbGncupVCaY6azRKo6ECl0tUsEgZHwsgJ5cIygLoZDitalu7IFV1/ZwSQZu9Lsfqua
	Bsim9JmWPoP/oUNuHu7zoCfPrOgyn4dk3EnQNG8B7bJGUIxG6NSZtqJMe+Nrw95DNTxVGVZOUVN
	a1kyCGyAYD7i7EcBIn+Gxs768uQSPmdp6tQJLUxPeqLKlXRGamkhpflFlX1wVMtYm7Urh8C9zI7
	Z5i4bdMlAkW/ma+NVh/9x8HiAuXq73Ukh+xyeCekwP4+xdqC5hJKU6Sm2WvMl0MASSQ2P4bzCZR
	mcY/pB0yaCpUsloEOLhjWzneYWk=
X-Google-Smtp-Source: AGHT+IGdHck69+/UXTdbrnCO3t0qqfckfcVyyh/E5LbN6LZwR4x0zr2gNlwq8szXilSzX4To4fvr4kap32stEFrTPTM=
X-Received: by 2002:a05:6512:159c:b0:595:9152:b932 with SMTP id
 2adb3069b0e04-596b526c87bmr860812e87.47.1764076837373; Tue, 25 Nov 2025
 05:20:37 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 05:20:36 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 25 Nov 2025 05:20:36 -0800
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <20251125-pci-m2-v3-4-c528042aea47@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125-pci-m2-v3-0-c528042aea47@oss.qualcomm.com> <20251125-pci-m2-v3-4-c528042aea47@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 05:20:36 -0800
X-Gm-Features: AWmQ_bmikLZ0Y6IVR06BXpyKHGBWZgvGRHNBpTyF3etpWd-vOF7CyArxmGyFcVw
Message-ID: <CAMRc=MeutDAwisNUPB1Nkqq2TEifjho+4E3GZ7x2HtbEh=inog@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] power: sequencing: Add the Power Sequencing driver
 for the PCIe M.2 connectors
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>, Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 12:12:29 +0100, Manivannan Sadhasivam via B4 Relay
<devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org> said:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>
> This driver is used to control the PCIe M.2 connectors of different
> Mechanical Keys attached to the host machines and supporting different
> interfaces like PCIe/SATA, USB/UART etc...
>
> Currently, this driver supports only the Mechanical Key M connectors with
> PCIe interface. The driver also only supports driving the mandatory 3.3v
> and optional 1.8v power supplies. The optional signals of the Key M
> connectors are not currently supported.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>

This looks good now. Do you think it makes sense to take it for v6.19 (provided
the bindings get reviewed) or should it wait for the next cycle and go with the
other changes?

Bart

