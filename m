Return-Path: <linux-arm-msm+bounces-106566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GovAlRO/Wm1aQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 04:45:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AFC4F0E76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 04:45:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D472A30089A5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 02:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CC6282F08;
	Fri,  8 May 2026 02:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ODWmQijR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66F626A1AF
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 02:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778208335; cv=none; b=re2pailwn7jVH0RURnI94HSmXE1DeBYcFThxlygsrr+BWYq1blkGCqJC5EvONOaNs/NZaqmfE28X/xk2MQUEZ8oqgfUCaypmES7Al1pHO7c+0qNPmWpPjw7De2uHlSahJBrQaWkCkF2bXOqLC0bMrgTTDDddJGN5G/xB9l4bJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778208335; c=relaxed/simple;
	bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qjeG0sbFgQkon5T+hoj9/hmViYsDSYmtmU/jvWua2Opy5F2YYrC00j9UwZvRaeWjTV0EGYJ5PS6gYWEalF0Q8iBJBg0j4wksnET9lc6ogMcMQXeMGn8hOsjNI0imRsQMoLtQ1HzTtjmO8zKREaio/lKkbJEYqMon16LScam2Pfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ODWmQijR; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-42fc6923f38so1849220fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 19:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778208333; x=1778813133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
        b=ODWmQijR/5g1OUlUvDpypgfpilBU8K602ai2NUyBrr9M/7scQhKmf615y/89uP6LZI
         KwqoY0I8Lxafcj8e/nkm+RgQAOEsZ39CG0rS51thfr0gU6w2fDjYJbqWQFgYZqprL1Aj
         JYSwzIdont/o9HPqVk49HyV+GKKO2s19Kts29KeTuWIobkNsTTFZ4pKA7n/AF11b4HmH
         X4ZX+IrFe5D1i8v09UAPhbV3uYwR9quHdjy3lcYTl9eW9tahlqRawaHOWR5f0kQ5WPTD
         p9mb+xO+5WnnBpxg3M2maFnTYjYu5b75oS+DI9gsVxkukHyPhhnjQ/6cP3MTxGQzbtmn
         JNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778208333; x=1778813133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oEnT/UCXWeDB9vAKPoyngIcFubAI8zzoEf1ZMRsfegE=;
        b=JV2TMhuWQ2dN1JiP/rdH0MD+ePFgmyQ+wLXBqiPj63sNONcnI66Gn1dUwMLQSXPnSc
         hlj+kGS/7SyGwG30qmd+WWYKBF7CUd3FoZpf8qSzdFLEyE8gNKNbifi6Z0qBEUynWnZn
         Gx8KDPMV3aHuofPGU7ZgQRor1iYdr4hpLxfLC2vq9id/kV583b4h6nkILXq+5LKllPJO
         GOkMZiaxS1Ml6g0GexvlIv3RGWbGCAJBUDU+FtKFbFATtv+qaRYcDXM2xcgN96mYWN1t
         eLbQ7b0E6xV2/8o3BXnJhcEA3XRxRdxsS4sfpqNbPvsZpQrcxgIwwoM2mjvGZ5ZB7hIo
         OTeQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8DFXK2L4gu1nzg34frajQRtfCjwT0YmPPI5WRzq7UVB/bx3409ujigdiPnLJkLRwODeH8QA7rMp+NOFf2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6dmfiBgfreM942KCuIXtXK3ToAxLnMdWbjv38vLV72FNPo/P4
	cJ6C1Z17yvZ7V3GoBkfcDNhH85iLcGYeQp5mz0WOlKQDJgbCjDO5aSnY
X-Gm-Gg: AeBDiesmHEOBr0huNbCtGLysrLLhlA/96U9aYtz5h+qRW9CR2lFsUWUW3PPEBiJaEpA
	4pN/74DP1fibp/tbK02DhL68OMx9HyRX6+RS34umw2d99mZMEAfLdsWYB4Ey5/o7fKar3OoGDSO
	/W1nKa6TFXrvpbwwllkGQHwoTvllBVBM8cYzQrbP1q0UmBMrOw3QM7rDMMzbpf0UhP1BoWaZbl6
	/Qc7tQs3HDuqlQ9MsHGY4g0euxsr4+1Cf5nANKdSfIsWE79nlu2fky35ZCsvQQMWJ/j62DDHqDt
	PFBJfIzSegId36dwd6Dr4ztvgpM8i7GBwYNhSUjhRFfQ1QGRUf5HFTPPwQAOxveSiczUav/SOqP
	eH5gZms7w7z7N3xouYKvVWn/XabV5clLTDLjCawgS6+Zns1xTIQNq8SAox5+o0iQ32a2VVHZ/Fi
	re3Z1altrtKcUZh6GnewzCVEIfnaL7taWRbDuSZ8tJnWagOb9TbFKdDociQGM14vjjTu7ekuUpf
	RunA3ac4nKj8QoPOegURhv8973KsODORjKhsR9wTGyekVoc
X-Received: by 2002:a05:6820:190a:b0:696:1a98:bd5 with SMTP id 006d021491bc7-699ab62e838mr2720265eaf.19.1778208332600;
        Thu, 07 May 2026 19:45:32 -0700 (PDT)
Received: from nukework.gtech (c-98-34-199-138.hsd1.tx.comcast.net. [98.34.199.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c767d0sm349447eaf.5.2026.05.07.19.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 19:45:31 -0700 (PDT)
From: "Alex G." <mr.nuke.me@gmail.com>
To: andersson@kernel.org, krzk+dt@kernel.org, mturquette@baylibre.com,
 linux-remoteproc@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: mathieu.poirier@linaro.org, robh@kernel.org, conor+dt@kernel.org,
 konradybcio@kernel.org, sboyd@kernel.org, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject:
 Re: [PATCH v2 0/9] remoteproc: qcom_q6v5_wcss: add native ipq9574 support
Date: Thu, 07 May 2026 21:45:29 -0500
Message-ID: <6525179.vuYhMxLoTh@nukework.gtech>
In-Reply-To: <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
References:
 <20260109043352.3072933-1-mr.nuke.me@gmail.com>
 <27098742.6Emhk5qWAg@nukework.gtech>
 <1397ecd5-89a6-4666-bfe9-014ff8553a97@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Rspamd-Queue-Id: E1AFC4F0E76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-106566-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mrnukeme@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nukework.gtech:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Friday, April 24, 2026 7:17:05=E2=80=AFAM Central Daylight Time Konrad D=
ybcio=20
wrote:
> On 1/15/26 6:27 AM, Alex G. wrote:
> > On Wednesday, January 14, 2026 4:26:36 AM CST Konrad Dybcio wrote:
> >> On 1/14/26 4:54 AM, Alex G. wrote:
> >>> On Tuesday, January 13, 2026 8:28:11 AM CST Konrad Dybcio wrote:
> >>>> On 1/9/26 5:33 AM, Alexandru Gagniuc wrote:
> >>>>> Support loading remoteproc firmware on IPQ9574 with the qcom_q6v5_w=
css
> >>>>> driver. This firmware is usually used to run ath11k firmware and
> >>>>> enable
> >>>>> wifi with chips such as QCN5024.
> >>>>>=20
> >>>>> When submitting v1, I learned that the firmware can also be loaded =
by
> >>>>> the trustzone firmware. Since TZ is not shipped with the kernel, it
> >>>>> makes sense to have the option of a native init sequence, as not all
> >>>>> devices come with the latest TZ firmware.
> >>>>>=20
> >>>>> Qualcomm tries to assure us that the TZ firmware will always do the
> >>>>> right thing (TM), but I am not fully convinced
> >>>>=20
> >>>> Why else do you think it's there in the firmware? :(
> >>>=20
> >>> A more relevant question is, why do some contributors sincerely belie=
ve
> >>> that the TZ initialization of Q6 firmware is not a good idea for their
> >>> use case?
> >>>=20
> >>> To answer your question, I think the TZ initialization is an
> >>> afterthought
> >>> of the SoC design. I think it was only after ther the design stage th=
at
> >>> it was brought up that a remoteproc on AHB has out-of-band access to
> >>> system memory, which poses security concerns to some customers. I thi=
nk
> >>> authentication was implemented in TZ to address that. I also think th=
at
> >>> in order to prevent clock glitching from bypassing such verification,
> >>> they had to move the initialization sequence in TZ as well.
> >>=20
> >> I wouldn't exactly call it an afterthought.. Image authentication (as =
in,
> >> verifying the signature of the ELF) has always been part of TZ, because
> >> doing so in a user-modifiable context would be absolutely nonsensical
> >>=20
> >> qcom_scm_pas_auth_and_reset() which configures and powers up the rproc
> >> has been there for a really long time too (at least since the 2012 SoCs
> >> like MSM8974) and I would guesstimate it's been there for a reason - n=
ot
> >> all clocks can or should be accessible from the OS (from a SW standpoi=
nt
> >> it would be convenient to have a separate SECURE_CC block where all the
> >> clocks we shouldn't care about are moved, but the HW design makes more
> >> sense as-is, for the most part), plus there is additional access contr=
ol
> >> hardware on the platform that must be configured from a secure context
> >> (by design) which I assume could be part of this sequence, based on
> >> the specifics of a given SoC
> >=20
> > What was the original use case for the Q6 remoteproc? I see today's use
> > case is as a conduit for ath11k firmware to control PCIe devices. Was
> > that always the case? I imagine a more modern design would treat the
> > remoteproc as untrusted by putting it under a bridge or IOMMU with more
> > strict memory access control, so that firmware couldn't access OS memor=
y.
>=20
> There is an SMMU on this SoC.
>=20
> I don't know the original backstory, but if anything, the through-Q6
> approach is probably *more* secure, since there's additional access
> control hardware inbetween

My question is what to do with this series? I think I present a valid appro=
ach=20
which has its use cases, irrespective of which approach is better for a giv=
en=20
use case.

Alex

> Konrad





