Return-Path: <linux-arm-msm+bounces-66725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC55B12084
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 17:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 389865884D9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFB12ECD25;
	Fri, 25 Jul 2025 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DkIOIGsn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1931B4121
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753455647; cv=none; b=bq8tYhNelHvzLz6mb3xmtWOBggRELmIpwMIYKT3apyhB2ymhO0Vx0XW87vf03CqLQcBQU1cIAep5GfwdqlTt8he2u5KiS1dD8I7XFxpp5ofk/L92WlTuajjo0RRyT4XS0Vob0NXe6Zvqq2p4EBOubJ0rZPDE4crOwTl1417zWxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753455647; c=relaxed/simple;
	bh=Ur7y09Z1+O7SAhqfU0l+0bhkFIVqiFXfGXLpvOTzEww=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IsDZIItQqr8DspwAAHnIIXyANaeQv6tWDqD3U+pVqAORYaH1Rl1T0q7nPJ4g3U5YCMeMmsNZVnJv9v3gGKkTjQiEtrB1GNuAUR1tdRChNtfb6kMv7ldDfrl1imK5yX5jWRWVN2K/KHEMnwg4KktssbQIVpuYHB8jh70or2dZGes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DkIOIGsn; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so2015694f8f.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753455644; x=1754060444; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rI9LR2cRzsXcwfbvdOvrXgKHQ7vsbcB6QBNYtkHWCP4=;
        b=DkIOIGsnX57qG2z5S9FR0nuPKt9OviXOPgzqt9JwBGAXV7KD0UdXpbWWUSDEgXY7dp
         v25PoOnpmtyCUX1ITnXQngfZpQk0GoRF1rhlOgRsH4isByrn59045rGQHQYX+qhgJLfs
         wLM3MpGt1in57XR9FIe59BWIB1thT8ugpU1hOJ1DCtbXljMW5hdOPnfb55iq2QP8i86B
         W5VpQiby/hxWSszI6jKjJvJ5McYE7MFmERhw70vYmQZPX6nHnG75uvvth0B0/oTZ+mol
         f7n175VcB3kEdkyt71DQMiM9HAAEapS2sKrPM0XbO5N98ZWQPKmLGbgfi2kcR0IoL+AW
         EVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753455644; x=1754060444;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rI9LR2cRzsXcwfbvdOvrXgKHQ7vsbcB6QBNYtkHWCP4=;
        b=lWwqQWV9/8eBsDvkVhOC/U1jA2aw+R8D1agyZFZPmhT7TAXXzkYHuJBhoHioksecLt
         Y7CWbpBPVtSebuBPVmV6eM6XkpXvZAHGUy65dgXwI1a695A+xdpYjm0x2lCPSQeu/HVo
         uVQH9EkPecjfJmgCLT2mQYpTXYKb+uRKLJV4cPiLlx1dyBz5vE4C+VEPp1h/UMwfV+Z+
         aSlUBdCsf38HGfYNO/0tSoiBG7ZLXnUQvA77Vx2swhF2AgMtO7d1YFEMvAWaBR5RJbRi
         SLx76uMmLP5ix4gxwbg6FwKUAdlNaD5FZUUbzKTUsMx5WEBH/pOfJT5sE09ziGcaAOzs
         R68A==
X-Forwarded-Encrypted: i=1; AJvYcCVa+mtm1o499OGsRXiLVqtSZcrYycmmHlLkPeNCls3o1iKWJBnk6XBJ+Lwb3rG+u3KO+F22T+Q8gLuPiU6V@vger.kernel.org
X-Gm-Message-State: AOJu0Yye/dYpbOYfh4aMEhgrpKK7IMwkc7AQry8TbYCE2BBI32+sneRg
	qSq1/OS71tZNa2HtcAyjJMMPlUfNWP5uzTWTnX8B3W3bWBLLG1u2Wz/j52Pgr8XZ25A=
X-Gm-Gg: ASbGncsKkL4XUVHKMvkOBaxHEKGYIXrS78uS/q1lpDzuugNdzlItJITRTgnXijaL2AJ
	+f3jFNQ3o/qW0hMTqNGZwVR3t+jSy0vKSV10C2qsfEvxO5m4SECvApve9BkKznEFowqgPMKFRf2
	8nyR356v3sGvSVSNsoRJTi2BJOlgFwZEfkUl5VgRdIRY1FdjN8FKT22aYhBk3l8jx/23PG9Zl6p
	R7okOtMF81wQaZ0TF9TiEevXVBvTtA7CUwcs2FRr4SmMT/ro+h374oooL+7W0ku/MCfkEbvZui8
	ja48+1ukXWNfhirTh7AI22m0NkVo8UfKlAinfeuiF91FOmTqCAuX4dDDA3p8UyfVkK6BMqx2sth
	+ZacHk8P+SDNz0Ep7K4tWgdp1Sw==
X-Google-Smtp-Source: AGHT+IH1lZBQZz54Wo2dN2kyzN7dZPNkmJl+cdo/n5TC3R0Hp6JT1si9hRUAqGSlMvqiwpVRFDDeYA==
X-Received: by 2002:a05:6000:22c8:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3b776664d53mr2246131f8f.33.1753455644207;
        Fri, 25 Jul 2025 08:00:44 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb2a7asm160745f8f.1.2025.07.25.08.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:00:43 -0700 (PDT)
Message-ID: <bc14b93d49ee5ec022c29d5c5568c2c1d1c52ab1.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: core: move some irq handling back to hardirq
 (with time limit)
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Bart Van Assche <bvanassche@acm.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,  Avri Altman <avri.altman@wdc.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>, Neil Armstrong <neil.armstrong@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
 Manivannan Sadhasivam	 <mani@kernel.org>, kernel-team@android.com,
 linux-arm-msm@vger.kernel.org, 	linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Date: Fri, 25 Jul 2025 16:00:42 +0100
In-Reply-To: <2e7c2be8-dc58-4e18-9297-e8690565583b@acm.org>
References: <20250724-ufshcd-hardirq-v1-1-6398a52f8f02@linaro.org>
	 <2e7c2be8-dc58-4e18-9297-e8690565583b@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2025-07-24 at 09:02 -0700, Bart Van Assche wrote:
> On 7/24/25 2:54 AM, Andr=C3=A9 Draszik wrote:
> > @@ -5656,19 +5689,39 @@ static int ufshcd_poll(struct Scsi_Host *shost,=
 unsigned int queue_num)
> > =C2=A0=C2=A0	WARN_ONCE(completed_reqs & ~hba->outstanding_reqs,
> > =C2=A0=C2=A0		=C2=A0 "completed: %#lx; outstanding: %#lx\n", completed_=
reqs,
> > =C2=A0=C2=A0		=C2=A0 hba->outstanding_reqs);
> > -	if (queue_num =3D=3D UFSHCD_POLL_FROM_INTERRUPT_CONTEXT) {
> > -		/* Do not complete polled requests from interrupt context. */
> > +	if (time_limit) {
> > +		/* Do not complete polled requests from hardirq context. */
> > =C2=A0=C2=A0		ufshcd_clear_polled(hba, &completed_reqs);
> > =C2=A0=C2=A0	}
>=20
> This if-statement and the code inside the if-statement probably can be
> left out. This if-statement was introduced at a time when the block
> layer did not support completing polled requests from interrupt context.
> I think that commit b99182c501c3 ("bio: add pcpu caching for non-polling
> bio_put") enabled support for completing polled requests from interrupt
> context. Since this patch touches that if-statement, how about removing
> it with a separate patch that comes before this patch? Polling can be
> enabled by adding --hipri=3D1 to the fio command line and by using an I/O
> engine that supports polling, e.g. pvsync2 or io_uring.

Bart, thank you for taking the time to explain and the background info on
this, very helpful!

Cheers,
Andre'

