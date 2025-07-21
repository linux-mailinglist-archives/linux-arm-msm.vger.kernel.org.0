Return-Path: <linux-arm-msm+bounces-65892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F4B0C3DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 14:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7BA31AA3AA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 12:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B9D82D12F4;
	Mon, 21 Jul 2025 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pZFWyXmD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0CE2C1587
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 12:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753099849; cv=none; b=MF9wqw/RXOaHXgaz597eibHeSZokStqA5F9++2LcXP7vzvIi71pW1uivwbgr3EgVkKQpxrfnJRFDa8lRGcRa3T14Y7QWWMhqtIHtR6G5aqNdnjEXK/1Id5nw6ste+qmLeoSHuHYUXKxpWtqFHPFyyu64pTo6koqshPqPRPULgXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753099849; c=relaxed/simple;
	bh=n2r3B6altUPpKltXRh6LT7irfPPbs+66nbggbg37vs4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=allyts+MxUhDu1hFjd+9v1iyT0jBwuGV+tERMVOr1g2iAWX/K5TXOu0U3CdN8RT99/J8h2ejpREnkUhUf/zP7F/speIF6mTFgoA6e1IYH8PrvCvzm1wk1uGuZdl+Z7kNvTTPeUbmSJkyejjvajSsPCMk09GNNv/gY8BoVYpcQuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pZFWyXmD; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a5257748e1so2329489f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Jul 2025 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753099845; x=1753704645; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IQGYtSjwm8ZBk8yiUr1gkmcZ3W0DPvO/dSFuH1qnolA=;
        b=pZFWyXmDMCIw1Pz54uBsxL5O/hbHgfShSMewwgV8mszkO68YOBIiYGQr3iwGZ4NwkN
         Sljvkh+yYlvET6fmkU3cV9e75o54kIoe/VrEmRkStzquFrXMvrzFHmQLykN4UAVhviJu
         LWGrdVQlio+VOe97rth/9fLisrHRgqsXPnmynWcLxNSebTBLo91L0Tnq8ga3X9Y2vlOg
         CCX4V8DAwyVjZvFWEnWu2bRQSMuywcJZBRsmiHgxR0NUHWAutAVmCyQf8kWaD44Q993V
         ZRMHAd0bYYpRy/cZt76Ul/s6NUREYHSfTOiVChiSOwj7A8HXbW8xNY1xHoEQLye2S8bS
         6hKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753099845; x=1753704645;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IQGYtSjwm8ZBk8yiUr1gkmcZ3W0DPvO/dSFuH1qnolA=;
        b=oCuXtYnXiqkeXFiIfojtwkfNlOszdvURbyxP1IhoG9Tlk/jbxDCMwsR+4OpE6QStEK
         D04LZMX2NsW5cZ4D9mX/dBognzynnnWVq3blm7u/ddIFoIC5hOdEqwZo139B0O5rBKIg
         rIgEt1a1NFKnM8CAgndtGIjS1UQDCkq8HwG0f9IFlXDiGCp4u6cNCUyOV1KJFI9cRGCF
         HJsDaP4ROK3ecfSxRY7mZXsbYTeBlFFdyEfTVCB1W4sbxRHfwgU076b3qqV1bEELHdpT
         30WZHl6l5KduaijZnFSNSYHDO/33Wv/zFcXTYI1k5Ltjn/5jEk9RbLt0BnV8M4rcWhl7
         5U/A==
X-Forwarded-Encrypted: i=1; AJvYcCV/Xanj30FQckfQGO0FS2MWIwrN38d9/tRnFkMzhdF2wLbOgrqFejnm31Dw5HaVHGM2hzo6ZuY+rZqUOwaq@vger.kernel.org
X-Gm-Message-State: AOJu0Yx35/EzcK88dbI+hWCyg6a9MLcK9cw+GNhwO4u7NwNZUMqH2ci/
	Uk2HFUwzTcSmCdV69ccFKHeToZVDfEqri/vecsaMpYBzRVOWb9wxn5SA/D0CxD/RMQuLcQk6p8h
	8RsoX
X-Gm-Gg: ASbGnctLle85OIjgxDeeANv8/fyXqiJftKlOFbMrn1kl/6r0aO0n3n939/40WsL3SdX
	LCzulAO8E6qxYmgmBMpIfH3WwXI6NtUtVFQQzvIqLUswsPI0SkDUzQG2CGQXanZVl3P0fP77y2O
	rRws1puvQNyuQSKBLps2S7mEkMRIUcjFRHLkeVQixzzapI5XCJM4V1+nj7zeSI+rmbFHu0PYgLM
	A4yN4Ms0uycL8mqLfK/0RSZJR3QCgoQPIMKYm0oGEVGo8GO/pGYMJ+xcC23oRtAoKcMQEIicEWX
	Vo14fiIxbZ72MW3siZC182/wSRZQaFWBZTMmPB10PlHElbJM9V0+jPEhiUU89H4D/RkTE31TYer
	aAgr2ST3tr0xgXfBwbhd/vdPg+g==
X-Google-Smtp-Source: AGHT+IFC0ohH6DhVvOUrM3tqnXguszZ6/TVXCACeW4yApUHn6usADv/+L6MBPOWG7pJVIWX8OuqrJw==
X-Received: by 2002:a05:6000:2c12:b0:3b4:9721:2b16 with SMTP id ffacd0b85a97d-3b60e523deamr17084415f8f.36.1753099845431;
        Mon, 21 Jul 2025 05:10:45 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca4d95esm10266983f8f.75.2025.07.21.05.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:10:44 -0700 (PDT)
Message-ID: <4935395591bc8baef39d2acc491c6c40889090d9.camel@linaro.org>
Subject: Re: [PATCH RFT v3 3/3] ufs: core: delegate the interrupt service
 routine to a threaded irq handler
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, Alim Akhtar	
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, Bart Van
 Assche	 <bvanassche@acm.org>, "James E.J. Bottomley"	
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"	
 <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peter Griffin <peter.griffin@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, Tudor
 Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 21 Jul 2025 13:10:43 +0100
In-Reply-To: <1e06161bf49a3a88c4ea2e7a406815be56114c4f.camel@linaro.org>
References: 
	<20250407-topic-ufs-use-threaded-irq-v3-0-08bee980f71e@linaro.org>
		 <20250407-topic-ufs-use-threaded-irq-v3-3-08bee980f71e@linaro.org>
	 <1e06161bf49a3a88c4ea2e7a406815be56114c4f.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build1 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-07-21 at 13:04 +0100, Andr=C3=A9 Draszik wrote:
> Hi,
>=20
> On Mon, 2025-04-07 at 12:17 +0200, Neil Armstrong wrote:
> > On systems with a large number request slots and unavailable MCQ ESI,
> > the current design of the interrupt handler can delay handling of
> > other subsystems interrupts causing display artifacts, GPU stalls
> > or system firmware requests timeouts.
> >=20
> > Since the interrupt routine can take quite some time, it's
> > preferable to move it to a threaded handler and leave the
> > hard interrupt handler wake up the threaded interrupt routine,
> > the interrupt line would be masked until the processing is
> > finished in the thread thanks to the IRQS_ONESHOT flag.
> >=20
> > When MCQ & ESI interrupts are enabled the I/O completions are now
> > directly handled in the "hard" interrupt routine to keep IOPs high
> > since queues handling is done in separate per-queue interrupt routines.
>=20
> This patch adversely affects Pixel 6 UFS performance. It has a
> UFSHCI v3.x controller I believe (and therefore probably all
> devices with < v4) - if my limited understanding is correct,
> MCQ & ESI are a feature of v4 controllers only.
>=20
> On Pixel 6, fio reports following performance on linux-next with
> this patch:
>=20
> read [1] / write [2]:
> =C2=A0=C2=A0 READ: bw=3D17.1MiB/s (17.9MB/s), 17.1MiB/s-17.1MiB/s (17.9MB=
/s-17.9MB/s), io=3D684MiB (718MB), run=3D40001-40001msec
> =C2=A0 WRITE: bw=3D20.6MiB/s (21.5MB/s), 20.6MiB/s-20.6MiB/s (21.5MB/s-21=
.5MB/s), io=3D822MiB (862MB), run=3D40003-40003msec
>=20
> With this patch reverted, performance changes back to:
>=20
> read [1] / write [2]:
>=20
> =C2=A0=C2=A0 READ: bw=3D19.9MiB/s (20.8MB/s), 19.9MiB/s-19.9MiB/s (20.8MB=
/s-20.8MB/s), io=3D795MiB (833MB), run=3D40001-40001msec
> =C2=A0 WRITE: bw=3D28.0MiB/s (29.4MB/s), 28.0MiB/s-28.0MiB/s (29.4MB/s-29=
.4MB/s), io=3D1122MiB (1176MB), run=3D40003-40003msec
>=20
> all over multiple runs.
>=20
> which is a ~26% reduction for write and ~14% reduction for read.
>=20
> PCBenchmark even reports performance drops of ~41%.

Additional fio results (numjobs=3D8 instead of 1):

current linux-next:

fio --name=3Drandread --rw=3Drandread --ioengine=3Dlibaio --direct=3D1 --bs=
=3D4k --numjobs=3D8 --size=3D1g --runtime=3D30 --time_based --end_fsync=3D1=
 --
group_reporting --filename=3D/foo
   READ: bw=3D52.1MiB/s (54.6MB/s), 52.1MiB/s-52.1MiB/s (54.6MB/s-54.6MB/s)=
, io=3D1562MiB (1638MB), run=3D30001-30001msec
  WRITE: bw=3D74.7MiB/s (78.3MB/s), 74.7MiB/s-74.7MiB/s (78.3MB/s-78.3MB/s)=
, io=3D2242MiB (2351MB), run=3D30004-30004msec


with patch reverted:

fio --name=3Drandread --rw=3Drandread --ioengine=3Dlibaio --direct=3D1 --bs=
=3D4k --numjobs=3D8 --size=3D1g --runtime=3D30 --time_based --end_fsync=3D1=
 --
group_reporting --filename=3D/foo
   READ: bw=3D83.5MiB/s (87.6MB/s), 83.5MiB/s-83.5MiB/s (87.6MB/s-87.6MB/s)=
, io=3D2506MiB (2628MB), run=3D30001-30001msec
  WRITE: bw=3D83.3MiB/s (87.4MB/s), 83.3MiB/s-83.3MiB/s (87.4MB/s-87.4MB/s)=
, io=3D2501MiB (2622MB), run=3D30003-30003msec



which is an even higher 37% reduction for read.

A.

