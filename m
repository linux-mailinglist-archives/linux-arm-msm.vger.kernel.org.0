Return-Path: <linux-arm-msm+bounces-45027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381BEA10CCA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F48188AAFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 16:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC1EC1C2324;
	Tue, 14 Jan 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hfme9WqA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C090B1D5154
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 16:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736873683; cv=none; b=F/pwbHfFpETEeQ/Utv2bpzDybs6P/h2zYTi6puQzNECZyC/FwZ4Hx0uNynfPW5/RgGmeRv2yWoBGSJqq8WWf8nTLjIRzk3ZAhCT1unUeG9JpXvQOB4FvZDQ9hQheCC4m3IycK9HZhZyv7aKVexAP1ZgN/TwGv66GCVqVWMHn21E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736873683; c=relaxed/simple;
	bh=80y0ZD2DqPk4N5CYZbDl0WM8yXhgHTstPGSnJZeMvKg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bdN+wL/qNjuxzGt/N1zG9K16yw7TeqXTFrMm62l05bU0rnDfcAmHQSRkhUHbuzOqV54lJkm/z3/WQLIBU/K9BTnsJnTYOuSOOv2x3/ACOQ8dMU3pRw63T3/bGWpp3/SyCcBkOYhIHDBcvGwl1zDMQBlc0i8mmflPCUwu6VJW82k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hfme9WqA; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso41444135e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 08:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736873680; x=1737478480; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=80y0ZD2DqPk4N5CYZbDl0WM8yXhgHTstPGSnJZeMvKg=;
        b=hfme9WqAO8VJ5hRd4rK1v4Aj6gHFzI2PZ7ne+cUFYpMIMwORpszE1c5jdS3IDRfNWS
         zpx943xdddO35083qM0WkmKC/68BsduiJNkj2ROP3m1RbFCBH/ek/DzCNbAV0E2rurFx
         /yvBi8Jh3QUiLeyeZFcvMOowxrLDEMvUR8ofjYBVPzqRr9rX1BgNlPQJMQhy87WdNEMu
         5Juh4x4szDS9dEzifvnDsgh2Nl7/lV41YArgymQmzwQv2ETBoT75zicIQk7FKEWNLq2g
         0fYgxqE74aQzbWq/PzDO0hvdBUjfNhq42h/A43NX5Px3SjkvIcf/Kh5NOxRv0lqU9s6L
         El6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873680; x=1737478480;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=80y0ZD2DqPk4N5CYZbDl0WM8yXhgHTstPGSnJZeMvKg=;
        b=KZajWMIiiDfWJZ0RzgEoNYDMDD4F70b33vlNv+oQAr40IgxYbivlD2vLaGi3w1y4Vr
         jJF1KttJV0dylMFqV5pJWqev657aK/XqXYwwlVUadgBxhyZkLTc4w1deec/pckjM/3ZG
         FR0J1HMKv1R/B5DfWqPelm+d965uOLlcvDKJwnqsmWRk8NteyMHV3joVj9rOrq++t/Mv
         AkhTnOY5TibPx1p5vAG+4UcpDpArHT8pFypjBJEZ2ebjObVsZaXPnQq0SQGxkD4ct2pQ
         Wv7EXHg/BKXVmu9rEgPVNo7VTTQJnj65DNKW2UtCMlGg3FwXUM5VfIYs0MNO9RrskkTt
         iP+w==
X-Forwarded-Encrypted: i=1; AJvYcCX+J76/Hza3RI81hUuSbN+tG1QMqacjlFf1WTWjk9LX54ifZCNVTAumJHtsI+qH5m1YxQbn5Xrwawux8e2v@vger.kernel.org
X-Gm-Message-State: AOJu0YwfZtGhrY2ZyoJvLmZF4FRjI/eoM/2PzQPKKtB9M01U/Zk8XBrN
	ihX9SKQujwlV5UWSDWi0HsaqRicGGDZ+dJXzJ1Ml40C7vkrdY3AqaFcEZzwK06k=
X-Gm-Gg: ASbGncv91+mq0Deal33DpKK03nlZ9taTsEIbcaznErYsBUlPQFZe/jkLodj+u2c0NoG
	gqjIvgIOJ4/NIAkXRURgBfSi7VV7Plho6k5oZbeojaAHj7aW5JJklm6BOaZwVBrxBHSDFuLxVo5
	BIEIQ0RtU2oBq8von6P82kLZiwsjbIsC0qvWc3bOR53l+bsNlb7YDVsng/zqvpiqe0o+AhZ2CLx
	OOjSAU8h1k0S5MwjGpMdpvY4mIx6YY19RGul9xz8UGmvBoPdy4loFn7Mu2ts3QVzQs=
X-Google-Smtp-Source: AGHT+IFiSz9B8Y/tFYQ0oTGPiQrOjEXpcMKzTOAox1qutsuyH4237qdiFg4uxD6I3EHJ58Yi2W/NwQ==
X-Received: by 2002:a05:600c:3d0c:b0:434:9e17:190c with SMTP id 5b1f17b1804b1-436e9c9c052mr164758145e9.0.1736873680089;
        Tue, 14 Jan 2025 08:54:40 -0800 (PST)
Received: from [192.168.243.26] ([80.233.75.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2dc0bb7sm213674845e9.16.2025.01.14.08.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 08:54:39 -0800 (PST)
Message-ID: <98bc4711aaf8d35f36435da8901e2805d3984db1.camel@linaro.org>
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker
 <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,  stable@vger.kernel.org
Date: Tue, 14 Jan 2025 16:54:37 +0000
In-Reply-To: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-14 at 16:16 +0000, Andr=C3=A9 Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshd allocation.
>=20
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
>=20
> =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed=
 -11
> =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: probe with driver exynos-uf=
shc failed with error -11
> =C2=A0=C2=A0=C2=A0 Unable to handle kernel paging request at virtual addr=
ess 01adafad6dadad88
> =C2=A0=C2=A0=C2=A0 Mem abort info:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =3D 32 =
bits
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fault
> =C2=A0=C2=A0=C2=A0 Data abort info:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x=
00000000
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =
=3D 0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, =
Xs =3D 0
> =C2=A0=C2=A0=C2=A0 [01adafad6dadad88] address between user and kernel add=
ress ranges
> =C2=A0=C2=A0=C2=A0 Internal error: Oops: 0000000096000004 [#1] PREEMPT SM=
P
> =C2=A0=C2=A0=C2=A0 Modules linked in:
> =C2=A0=C2=A0=C2=A0 CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 6.13.0-rc5-next-20250106+ #70
> =C2=A0=C2=A0=C2=A0 Tainted: [W]=3DWARN
> =C2=A0=C2=A0=C2=A0 Hardware name: Oriole (DT)
> =C2=A0=C2=A0=C2=A0 pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS =
BTYPE=3D--)
> =C2=A0=C2=A0=C2=A0 pc : kfree+0x60/0x2d8
> =C2=A0=C2=A0=C2=A0 lr : kvfree+0x44/0x60
> =C2=A0=C2=A0=C2=A0 sp : ffff80008009ba80
> =C2=A0=C2=A0=C2=A0 x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffb=
cc6591e0130
> =C2=A0=C2=A0=C2=A0 x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffb=
cc659539d80
> =C2=A0=C2=A0=C2=A0 x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffb=
cc65714b22c
> =C2=A0=C2=A0=C2=A0 x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 00000=
00000000000
> =C2=A0=C2=A0=C2=A0 x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffb=
cc657a027f4
> =C2=A0=C2=A0=C2=A0 x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffb=
cc6579fb194
> =C2=A0=C2=A0=C2=A0 x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffb=
cc65714b22c
> =C2=A0=C2=A0=C2=A0 x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff8=
0008009b940
> =C2=A0=C2=A0=C2=A0 x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff2=
2e006f54f40
> =C2=A0=C2=A0=C2=A0 x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc=
1ffc0000000
> =C2=A0=C2=A0=C2=A0 Call trace:
> =C2=A0=C2=A0=C2=A0=C2=A0 kfree+0x60/0x2d8 (P)
> =C2=A0=C2=A0=C2=A0=C2=A0 kvfree+0x44/0x60
> =C2=A0=C2=A0=C2=A0=C2=A0 blk_crypto_profile_destroy_callback+0x28/0x70
> =C2=A0=C2=A0=C2=A0=C2=A0 devm_action_release+0x1c/0x30
> =C2=A0=C2=A0=C2=A0=C2=A0 release_nodes+0x6c/0x108
> =C2=A0=C2=A0=C2=A0=C2=A0 devres_release_all+0x98/0x100
> =C2=A0=C2=A0=C2=A0=C2=A0 device_unbind_cleanup+0x20/0x70
> =C2=A0=C2=A0=C2=A0=C2=A0 really_probe+0x218/0x2d0
>=20
> In other words, the initialisation code flow is:
>=20
> =C2=A0 platform-device probe
> =C2=A0=C2=A0=C2=A0 ufshcd_pltfrm_init()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ufshcd_alloc_host()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scsi_host_alloc()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocation of stru=
ct ufs_hba
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 creation of scsi-h=
ost devices
> =C2=A0=C2=A0=C2=A0 devm_blk_crypto_profile_init()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm registration of cleanup handler using=
 platform-device
>=20
> and during error handling of ufshcd_pltfrm_init() or during driver
> removal:
>=20
> =C2=A0 ufshcd_dealloc_host()
> =C2=A0=C2=A0=C2=A0 scsi_host_put()
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(scsi-host)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release of struct ufs_hba
> =C2=A0 put_device(platform-device)
> =C2=A0=C2=A0=C2=A0 crypto cleanup handler
>=20
> To fix this use-after free, change ufshcd_alloc_host() to register a
> devres action to automatically cleanup the underlying SCSI device on
> ufshcd destruction, without requiring explicit calls to
> ufshcd_dealloc_host(). This way:
>=20
> =C2=A0=C2=A0=C2=A0 * the crypto profile and all other ufs_hba-owned resou=
rces are
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 destroyed before SCSI (as they've been reg=
istered after)
> =C2=A0=C2=A0=C2=A0 * a memleak is plugged in tc-dwc-g210-pci.c as a side-=
effect
> =C2=A0=C2=A0=C2=A0 * EXPORT_SYMBOL_GPL(ufshcd_dealloc_host) can be remove=
d fully as
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it's not needed anymore
> =C2=A0=C2=A0=C2=A0 * no future drivers using ufshcd_alloc_host() could ev=
er forget
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adding the cleanup
>=20
> Fixes: cb77cb5abe1f ("blk-crypto: rename blk_keyslot_manager to blk_crypt=
o_profile")
> Fixes: d76d9d7d1009 ("scsi: ufs: use devm_blk_ksm_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---
> Changes in v2:
> - completely new approach using devres action for Scsi_host cleanup, to
> =C2=A0 ensure ordering

As mentioned, I am not sure if this approach has wider implications
(in particular if there is any underlying assumption or requirement
for the Scsi_host device to clean up before the ufshcd device).

Simple testing using a few iteration of manual module bind/unbind
worked, as did the error handling / cleanup during init. But I'm
not sure if that is sufficient testing for the changed release
ordering.

Cheers,
Andre'


