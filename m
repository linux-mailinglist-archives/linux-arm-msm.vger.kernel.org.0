Return-Path: <linux-arm-msm+bounces-64814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A3CB03EBC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 14:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08B116A9EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 12:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6E462494D8;
	Mon, 14 Jul 2025 12:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="3gZln2wO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB67248891
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 12:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752496345; cv=none; b=d8zeq02b4utH1dtjOGfhuhd6ynDZhMe1xrkpFNK2xiTPsojM2lAqmcNkCyxFJKvFPdmmiTtFRZN+biM1DN/4V33tu63YPYHb51qSsRzXvyYMgkSNhS4Hvq0ZqG6Ew4eIRMYnQ+Pp9KtuPgX3Os2ExFZSBqtsxAF+Wo4yKmDc+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752496345; c=relaxed/simple;
	bh=qYiuoKRE2NxLGDxKz6WhuSPkGY9D7Tn+i7spILVLy8k=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=ru1K16ZMYxUbzFOGDNKn4IM3J1Gjq/KGAo4C/ZRHWl8mBKwq46WX2XUmmQ/1RPdfeRSrMQxuMSJQsQziC7jqR8ANQSF3ycrRbN1E6niJ9BXOOVRIuRV/7P0LzLLj/uw+gEHgX7FLPRUeJnb3vSiqW+88+zKTWFVhWLs5JI0+SbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=3gZln2wO; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ae3b336e936so852640966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jul 2025 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752496342; x=1753101142; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GT+QfWaXLUz2plhdm6tzk3KnJrg30pcNVb5s5dMBoo=;
        b=3gZln2wOOI7lo/l7dUww2B9kfi7qpXoKtRHky3EZuBYaRsEKbOD1gxKJ+KOzRTwEGw
         uxqeWFJP1S5LlA2+tHfxdWvH8VfMPVHseW865DX3UmLf61AuVZn/TIlDyy/1c5JLB0VK
         V7cSSNyVjqSxLe+VUJ1PuTTjdyUk6OwAP9lHdnuay1znB9Tk+s/GtHQSni4pzoYhby/v
         FFmAE3/lcu0FaNBdZoBtx7sLc+LJM7p/jGcd+OQ14e8Vfx5i4zVmY5CzPhNH73URBNCx
         LdXSO6WSC/CfdWtBxpd/t9WSmpmQvKz5kcOhNzBFCeQf4gVjRBa/lJS0zKqj9GOR73X4
         Lz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496342; x=1753101142;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GT+QfWaXLUz2plhdm6tzk3KnJrg30pcNVb5s5dMBoo=;
        b=E+P/moFnn3YF7hRsDMJY/ntPBji0C6xwsBKKpjZ2R1kqOQkJkpz7OfvugIyapsdAMI
         OXxzh7kkCv8Q3dCMBLYdHbOwCkc4RJEgA6Fzo8z4GA27BWXPA92I6d70xlKNIWeis3H2
         xAYH0WWSJVmDxZdPer5UEWPA5lghpeDFAqtRYYG8SEKj2ho4+JCwlAJlZ1dbEfip2tJC
         gl5MER3U9bUplOKsBf+nHHHxEtWjY/9E09EqXjU3kJo6bsyvRN9i0ETwgppl4lQ+IzSV
         1x/xgwvwo/Ey1icBRUi9qIIs2HytIxxFqs/o+/4XS9UV8T5mj+QjAz++/K1D5yacJROs
         zcYw==
X-Forwarded-Encrypted: i=1; AJvYcCUr+NusnAz+9sn2YXWifjkCqN59IczkLecot3kUiCxsUuL/5IQCLlYI07ppmJPbRN9DpT23EdPcy8UzNJr1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1TrMO42sDeXe/phQhbkah1hw6ZSEXemHq39D/5ChsVKmlM/gV
	1atL40cwyOsdAQjlPSQpUSyuuCmS3VFo28kT9D8Ceof+KJWntS6ZXEueWBMpjNQFqCE=
X-Gm-Gg: ASbGncuUpuqBZ/ulPbEn+cUfH7dpG0pEopQ1e6ut1WwsKkiBG6ZAvcjjxGZ2/CQJDqw
	QTmSzFgAwjGP4OP8kL9K3RN0mr5TQ+EAXh0gM5AAc5bY6pFiH148mn7VTjOjCBWMh67xkqh+mCt
	BQYExvb+FctT2kacmRlu9Cm/+REgnvZ23Rkl/6+bxy4IwzgLGRzwe/K3LYi3t/u/AVyg8pIOVbj
	InnjOruF3v0fdiBLj1EMDB21nyyszn2CKTQtD5p3XBU3H09eWWvLv3thQJWP8M6eAJCuxt+RIzS
	YUSF18zZhAL5hYi/ALTLpwXALafut8EiTTbLoO8UJmoe7mgrXxnppDjtQMMVxv8GIhv40ZoA37K
	/bqPlGnUlNdOmBevxNRLn/6R9ibkb+7si+4Z1RYttniZv+1bnSEKzMv94R925OmOEAbrLCb6Uxq
	YVoOON3AeOpVucfqWHuidkbvqvIjWhtUIv1w==
X-Google-Smtp-Source: AGHT+IEdIUlKAIUoH3odRS/w1x3zJL/78SxmRMa+QOLnmU3zwNSH9f5FMxlA1f2U3nn/eb6t4vkm0Q==
X-Received: by 2002:a17:906:7956:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae6fcbc356cmr1271518666b.36.1752496341821;
        Mon, 14 Jul 2025 05:32:21 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82962acsm818540766b.139.2025.07.14.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 05:32:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 14:32:19 +0200
Message-Id: <DBBS3S38CWTN.32RLYB9VEZAB@fairphone.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: Add The Fairphone (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-15-e8f9a789505b@fairphone.com>
 <6f8b86c7-96a5-4c7c-b54e-25b173084d95@oss.qualcomm.com>
In-Reply-To: <6f8b86c7-96a5-4c7c-b54e-25b173084d95@oss.qualcomm.com>

On Mon Jul 14, 2025 at 2:19 PM CEST, Konrad Dybcio wrote:
> On 7/13/25 10:05 AM, Luca Weiss wrote:
>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
>> on the Milos/SM7635 SoC.
>>=20
>> Supported functionality as of this initial submission:
>> * Debug UART
>> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
>> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
>> * Power Button, Volume Keys, Switch
>> * Display (using simple-framebuffer)
>> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
>> * Camera flash/torch LED
>> * SD card
>> * USB
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> [...]
>
>> +	reserved-memory {
>> +		/*
>> +		 * ABL is powering down display and controller if this node is
>> +		 * not named exactly "splash_region".
>> +		 */
>> +		splash_region@e3940000 {
>
> Was it not possible to arrange for a fw update after all?

I've made a patch to support both 'splash' and 'splash-region' but not
sure when it's going to be included, I've sent the patch to the correct
people internally last week. Since Android build cycles are always super
slow, it'll take a the very least a month I guess.

>
> fwiw the rest looks good

Thanks!

Regards
Luca

>
> Konrad


