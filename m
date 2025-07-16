Return-Path: <linux-arm-msm+bounces-65151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C847B06EAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 09:16:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F3A87B1BD0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 07:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E23328AAE9;
	Wed, 16 Jul 2025 07:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hBxU0FI6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D23328A1D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 07:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752650149; cv=none; b=IDJgIqBDXVW+UBw9lfqgzzKmAjLuEugRJggfUZh4juwkSyAUmUWHp3IvHgnY1r0uQVDytVOAy+2tfIEbyrneV7ytUR3pPiJKXgbXl1Lz/fE0tmZsi6Kqh8BvqWWxGW+9r/16ksHcU+T06wVPRgZ1ULRhonJmexCkWZCaU+ninPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752650149; c=relaxed/simple;
	bh=24Tb/LcZcpuEpFKIVKeMZB7NBtNKQTvEKsUhXdnCMXk=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=UVJpiWlP+byTDOik7Bgj5v+LWJI7WACqvJVW61ZFZ/ZbgfWqhxvgPTWu+UNnBbUVpvtZG+s8Td6rvS8/7yLGaSU/he/1nQXdMUUok0Cov3uGn1L+TCNYcD7/zwzJ1adpnO5QWvK9RdTT0Oxsnm9FO/bX6xXyHDvreDD6cq1bYmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hBxU0FI6; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60867565fb5so10186435a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jul 2025 00:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752650146; x=1753254946; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YfsjryOJJcheH9NBkSyCY8ER+5hEKLpu3+/ZdvPKIxw=;
        b=hBxU0FI6N4QyvB9ewq8YRKB58MORaqNgkMrhXYVmffHaIufzTUqBkT5pO9I8Vk7sVE
         72DJEvKxWuMuruygEKXhPttCZprFXvvhq/onoRMHK+fYnYSdR6nPotsCmeUcjpu33+bd
         SW28QC5rr8OhHWCFj3WjkAJEGVQuEzcaVWEhBawOZVZlR+TlMUybSl/eA9k/dkb7sQRp
         vyD6PszlSyymICoMdafqoXUgi8embFU2wiMtp/1pOQPcBf2u9Tk23JVIss5JvzxQV6mt
         KJUfr4UHgNhJfILhy5Y8HbMlMt+GiPBTPhOc2IfkdHjiCHrZcmqSCCKB6RzVlswHxfOU
         Elyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752650146; x=1753254946;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YfsjryOJJcheH9NBkSyCY8ER+5hEKLpu3+/ZdvPKIxw=;
        b=SZ2bQyLXsU2o0a1u76z5uxHL/iCD+203pAi6NyvtGzbmq3pEGOnUeSIgA/b1NXeod1
         BHdT49KWnh3E0/hwmEjlAhMDBDHH1+TKFPjlX36ZQ0598QKEnP4zrya8BgXB0z0PirYr
         7WouLbbNl5AzWicd8ERgIgv2VjMJfwBtPMJnoZlFoWznIWvTigA9Tc9wG1OtEJx3sP33
         EfFvI3I8j3QKALGoSCPotIDSzsiAKKJny1PyxVkBusY1mf67/Ak2J23zfRwBw+gHShUa
         7+twtpDSXdNsDbXxkcqSO/e3tJIdUXbwUgTC10Fs3yxkKjPnPnHiTC3zP91EKMgJARz1
         TnLA==
X-Forwarded-Encrypted: i=1; AJvYcCU7NGS+qWQI4bjfFr9iAoFEqtPl+p0m2h+z5D19LK2RnTrcfUqao1XbdNH+EEYB4yTpnvre2fNi3ATIkC1t@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQBPQG+sy3A9nOWgWaOi0VHwTeFN7Adz2g0RfhuukLAcuJXai
	rhSaE07FbTGORdcPhdwG1uL0F6we0+ctayl5ibnh896m23/hVlzXfeMKglSW5JcSp3A=
X-Gm-Gg: ASbGncsv85nVHysrTaYmuCpw7d2SzAyAZLZopo+w16oiEsPksx1stre9CpKK/E2jKqY
	wvNlW813orp91tIvjn6vlFv4R+9ALGyd/THWpMIdn0E2S+GznUP19xQve7+uX98q9aAbfIar3gm
	ifp8Up8m4Dih4H58GMRgkSuevO6Y8BXuZ4FkccS0BjNkgMVKBX2B9TCdozzu1ASWwqnYMEs8RgM
	fqwF2ZnF3085YNIrbuaAFI/hoEDbE3LltOLYA04Ni99OIYKsDcWpez3a+I7gu5CU3LEoV0cJoEJ
	x2/AEI8MdXXvGchrDbz01R2P6YECF0FnjRo0N57vsKjzJgUoWpogZrVKzwHxWFfLOSaXXe+xohX
	rIy6CbwLJ9+f0dlbMAJ7Rm7X9LfGN/5KYH3aWeLSUXqFHLvI3GUQ57+c=
X-Google-Smtp-Source: AGHT+IHh6O0xWZNdSmDIs+XRRgBqO1v1bLel1oaIRd2A4zdKO7Ksr9kC4ZbOvvs8AVHwGMBGLMFLbg==
X-Received: by 2002:a05:6402:2343:b0:606:9211:e293 with SMTP id 4fb4d7f45d1cf-61281ebe084mr1668193a12.9.1752650145562;
        Wed, 16 Jul 2025 00:15:45 -0700 (PDT)
Received: from localhost (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976ec04sm8197036a12.60.2025.07.16.00.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 00:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Jul 2025 09:15:43 +0200
Message-Id: <DBDAMGN9UQA0.J6KJJ48PLJ2L@fairphone.com>
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
Subject: Re: [PATCH 0/3] Fixes/improvements for SM6350 UFS
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>
In-Reply-To: <20250314-sm6350-ufs-things-v1-0-3600362cc52c@fairphone.com>

Hi Bjorn,

On Fri Mar 14, 2025 at 10:17 AM CET, Luca Weiss wrote:
> Fix the order of the freq-table-hz property, then convert to OPP tables
> and add interconnect support for UFS for the SM6350 SoC.
>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> Luca Weiss (3):
>       arm64: dts: qcom: sm6350: Fix wrong order of freq-table-hz for UFS
>       arm64: dts: qcom: sm6350: Add OPP table support to UFSHC
>       arm64: dts: qcom: sm6350: Add interconnect support to UFS

Could you please pick up this series? Konrad already gave his R-b a
while ago.

Regards
Luca

>
>  arch/arm64/boot/dts/qcom/sm6350.dtsi | 49 ++++++++++++++++++++++++++++--=
------
>  1 file changed, 39 insertions(+), 10 deletions(-)
> ---
> base-commit: eea255893718268e1ab852fb52f70c613d109b99
> change-id: 20250314-sm6350-ufs-things-53c5de9fec5e
>
> Best regards,


