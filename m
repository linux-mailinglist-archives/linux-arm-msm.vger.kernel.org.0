Return-Path: <linux-arm-msm+bounces-44906-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A3EA0C162
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 20:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F0F223A160C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 19:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972AA1C8FD7;
	Mon, 13 Jan 2025 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbASarBR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0B1C5D7E
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 19:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796485; cv=none; b=ceAKj7O0/Tu7ac2y3YH99kAywsBmpgnP3MiSdBViKskfI/e3XvbizhKqGhVIN85QRXGCe9t2/Piq8IhmFVc8NtcmHpCZK96uyWqeWFeKnt1cOlU0oftUq0wTE3PyXAZvyi+9jupelQGs9TZRovuo+bUX/9rFG3VavJD49QpTLQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796485; c=relaxed/simple;
	bh=Tg/3WwMFcmfwvtgPm/S+I3H7ynZIUHFvyD3k8HjH5+E=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kiKe9OiEGcGJCf5seZA+ps2FSpW3yUHfr0Sxuu7AjGGT6zEGzV385W91rzw7QSWUv7sw2vGl54VenNNCiM9UTO1oj/3AupzqkChUS1IESHWwmEFOzlsrrzuJDYtkExiEMpihW2poJSO146vMv0EbaV3awg0oV7ezn76Rho49ny8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbASarBR; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso4835373f8f.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 11:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736796482; x=1737401282; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Tg/3WwMFcmfwvtgPm/S+I3H7ynZIUHFvyD3k8HjH5+E=;
        b=VbASarBRTAB1n3H6dPgEFt/3gfTomuAXtYIKyHNjLknmi2IKRdo1wGtiWWC07XmGC5
         VGYNHLtEKNAW91A7gNLpX4Zw8+aILX8lD7hlL5mP6i0y8TmQgYOs38cIaNAC6QVzjORt
         P5y0oOSIPSY0euj8dwYpwSMPdSUplyc4fx9YfncavJj0oUxPAlLrWunoI+ZWG/x9OdOT
         uDDmdZfeXhknoPEenKxijaTVgEL4t62632qhSpGruLNBX9kwwyktHn47v7Qr+pKsNIuW
         hF37WIqZw2p0vhKZLxGBpkFMx1XSPSkG5lZRMZmdUnMuAJtmg/myDYie9CWk2NvSatQe
         4yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736796482; x=1737401282;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tg/3WwMFcmfwvtgPm/S+I3H7ynZIUHFvyD3k8HjH5+E=;
        b=GWLXQVadw/LnJUjk1T1gfnHomhrPZiX8PxCvTHH3yaHkAnwWmMMPxanaxpTMet5CEA
         R9/p7lI6WmRr+zMe9sc5TXNhUk+azL0FFkgAHy2Yw7rm2/MYP6nq2BiAm2pfZJScbTu3
         EXun5XSsRwL2y9YccPN1Ja9HNg+GEWXCOjKSpdwcxrvvqSZaB5hY/sV2USYgiXDasjvv
         yPOV98kCDF81en4Nn01QvNBVkx8kuKCpaC88Gzuelsh5Fy106755VK9WfnfGHfc6s4mE
         49+0N1LuLP0ALQZQIyYf4167GmAJuf5yRmj2SXbqTfWwc/y+1GCPs95fstssU8OCM8tY
         ktYA==
X-Forwarded-Encrypted: i=1; AJvYcCUVuW6KITcsd+CSFnjty5ON3sj5tErzghQhgG/F5NPxob8TWUtYsvVpomxtRovG6hoH8KSNIWXnd5wfGj6R@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg4bmHdEMrDFuB2oyZn9AOaPCnraf29D9AS9PB8lQYHahbVKJO
	Ef1staLOWp6Mw7PeSVP84qleJnXQ9hhZqM1Me3Dgon+10xGwRsWWPnixj6Orzqc=
X-Gm-Gg: ASbGncu0geVz9cTm5i31XhQRcs9V1JThUc3zZF46ELEZRM21p4nzXZ2Pf/Ejteoakt1
	OgH3gI7oFOs6qfNZSCMTQkgWx6KCwDw/qH3ECkDdiqdtxotmM1WrU49EMmp3olkZoMnhSYeuBta
	kj5W+eQMitcKYDiPMXaQptdETRHwzgqXPFjdDPZFOl5CtrR8ocvLltkvoGlB9iWjyw/chD59jed
	Ju3oVZh+DZWa+lC6ZdGHAvXeryVdpBH2J0PbmFT5TbUkOxa4mXI+jA6hSiI1Q==
X-Google-Smtp-Source: AGHT+IGgOtxMNv3w2gTeOb0up6Yoa5r9Qms3B50WLanCUjQpoi+Zyq7SDjeMqsGVbHa9eNw3ZYp4yA==
X-Received: by 2002:a05:6000:186e:b0:385:dc45:ea22 with SMTP id ffacd0b85a97d-38a87338d84mr25061674f8f.39.1736796481789;
        Mon, 13 Jan 2025 11:28:01 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d012sm12885602f8f.8.2025.01.13.11.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 11:28:01 -0800 (PST)
Message-ID: <c4129ea9da39badb3a686f7f93c334ecbc6d83f6.camel@linaro.org>
Subject: Re: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>,  Bart Van Assche <bvanassche@acm.org>, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Tudor Ambarus
 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
 kernel-team@android.com,  linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,  linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-arm-msm@vger.kernel.org
Date: Mon, 13 Jan 2025 19:28:00 +0000
In-Reply-To: <20250113192235.GA1800842@google.com>
References: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
	 <20250113192235.GA1800842@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-13 at 19:22 +0000, Eric Biggers wrote:
> On Mon, Jan 13, 2025 at 07:13:45PM +0000, Andr=C3=A9 Draszik wrote:
> > devm_blk_crypto_profile_init() registers a cleanup handler to run when
> > the associated (platform-) device is being released. For UFS, the
> > crypto private data and pointers are stored as part of the ufs_hba's
> > data structure 'struct ufs_hba::crypto_profile'. This structure is
> > allocated as part of the underlying ufshd allocation.
> >=20
> > During driver release or during error handling in ufshcd_pltfrm_init(),
> > this structure is released as part of ufshcd_dealloc_host() before the
> > (platform-) device associated with the crypto call above is released.
> > Once this device is released, the crypto cleanup code will run, using
> > the just-released 'struct ufs_hba::crypto_profile'. This causes a
> > use-after-free situation:
> >=20
> > =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() fail=
ed -11
> > =C2=A0=C2=A0=C2=A0 exynos-ufshc 14700000.ufs: probe with driver exynos-=
ufshc failed with error -11
> > =C2=A0=C2=A0=C2=A0 Unable to handle kernel paging request at virtual ad=
dress 01adafad6dadad88
> > =C2=A0=C2=A0=C2=A0 Mem abort info:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ESR =3D 0x0000000096000004
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EC =3D 0x25: DABT (current EL), IL =3D 3=
2 bits
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SET =3D 0, FnV =3D 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EA =3D 0, S1PTW =3D 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 FSC =3D 0x04: level 0 translation fault
> > =C2=A0=C2=A0=C2=A0 Data abort info:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D =
0x00000000
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CM =3D 0, WnR =3D 0, TnD =3D 0, TagAcces=
s =3D 0
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0=
, Xs =3D 0
> > =C2=A0=C2=A0=C2=A0 [01adafad6dadad88] address between user and kernel a=
ddress ranges
> > =C2=A0=C2=A0=C2=A0 Internal error: Oops: 0000000096000004 [#1] PREEMPT =
SMP
> > =C2=A0=C2=A0=C2=A0 Modules linked in:
> > =C2=A0=C2=A0=C2=A0 CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 6.13.0-rc5-next-20250106+ #70
> > =C2=A0=C2=A0=C2=A0 Tainted: [W]=3DWARN
> > =C2=A0=C2=A0=C2=A0 Hardware name: Oriole (DT)
> > =C2=A0=C2=A0=C2=A0 pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSB=
S BTYPE=3D--)
> > =C2=A0=C2=A0=C2=A0 pc : kfree+0x60/0x2d8
> > =C2=A0=C2=A0=C2=A0 lr : kvfree+0x44/0x60
> > =C2=A0=C2=A0=C2=A0 sp : ffff80008009ba80
> > =C2=A0=C2=A0=C2=A0 x29: ffff80008009ba90 x28: 0000000000000000 x27: fff=
fbcc6591e0130
> > =C2=A0=C2=A0=C2=A0 x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: fff=
fbcc659539d80
> > =C2=A0=C2=A0=C2=A0 x23: ffff22e000940040 x22: ffff22e001539010 x21: fff=
fbcc65714b22c
> > =C2=A0=C2=A0=C2=A0 x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 000=
0000000000000
> > =C2=A0=C2=A0=C2=A0 x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: fff=
fbcc657a027f4
> > =C2=A0=C2=A0=C2=A0 x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: fff=
fbcc6579fb194
> > =C2=A0=C2=A0=C2=A0 x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : fff=
fbcc65714b22c
> > =C2=A0=C2=A0=C2=A0 x8 : ffff80008009b880 x7 : 0000000000000000 x6 : fff=
f80008009b940
> > =C2=A0=C2=A0=C2=A0 x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : fff=
f22e006f54f40
> > =C2=A0=C2=A0=C2=A0 x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : fff=
fc1ffc0000000
> > =C2=A0=C2=A0=C2=A0 Call trace:
> > =C2=A0=C2=A0=C2=A0=C2=A0 kfree+0x60/0x2d8 (P)
> > =C2=A0=C2=A0=C2=A0=C2=A0 kvfree+0x44/0x60
> > =C2=A0=C2=A0=C2=A0=C2=A0 blk_crypto_profile_destroy_callback+0x28/0x70
> > =C2=A0=C2=A0=C2=A0=C2=A0 devm_action_release+0x1c/0x30
> > =C2=A0=C2=A0=C2=A0=C2=A0 release_nodes+0x6c/0x108
> > =C2=A0=C2=A0=C2=A0=C2=A0 devres_release_all+0x98/0x100
> > =C2=A0=C2=A0=C2=A0=C2=A0 device_unbind_cleanup+0x20/0x70
> > =C2=A0=C2=A0=C2=A0=C2=A0 really_probe+0x218/0x2d0
> >=20
> > In other words, the initialisation code flow is:
> >=20
> > =C2=A0 platform-device probe
> > =C2=A0=C2=A0=C2=A0 ufshcd_pltfrm_init()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ufshcd_alloc_host()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 scsi_host_alloc()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocation of st=
ruct ufs_hba
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 creation of scsi=
-host devices
> > =C2=A0=C2=A0=C2=A0 devm_blk_crypto_profile_init()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devm registration of cleanup handler usi=
ng platform-device
> >=20
> > and during error handling of ufshcd_pltfrm_init() or during driver
> > removal:
> >=20
> > =C2=A0 ufshcd_dealloc_host()
> > =C2=A0=C2=A0=C2=A0 scsi_host_put()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 put_device(scsi-host)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 release of struct ufs_hba
> > =C2=A0 put_device(platform-device)
> > =C2=A0=C2=A0=C2=A0 crypto cleanup handler
> >=20
> > To fix this use-after free, register the crypto cleanup handler against
> > the scsi-host device instead, so that it runs before release of struct
> > ufs_hba.
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> > ---
> > In my case, as per above trace I initially encountered an error in
> > ufshcd_verify_dev_init(), which made me notice this problem. For
> > reproducing, it'd be possible to change that function to just return an
> > error.
> >=20
> > Other approaches for solving this issue I see are the following, but I
> > believe this one here is the cleanest:
> >=20
> > * turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
> > =C2=A0 pointer, in which case it doesn't matter if cleanup runs after
> > =C2=A0 scsi_host_put()
> > * add an explicit devm_blk_crypto_profile_deinit() to be called by API
> > =C2=A0 users when necessary, e.g. before ufshcd_dealloc_host() in this =
case
>=20
> Thanks for catching this.
>=20
> There's also the option of using blk_crypto_profile_init() instead of
> devm_blk_crypto_profile_init(), and calling blk_crypto_profile_destroy()
> explicitly.=C2=A0 Would that be any easier here?

Ah, yes, that was actually my initial fix for testing, but I dismissed
that due to needing more changes and potentially not knowing in all
situation if it needs to be called or not.

TBH, my preferred fix would actually be the alternative 1 outlined
above (dynamic allocation). This way future drivers can not make this
same mistake.

Any thoughts?

> Please also include a Fixes tag in the commit message.

Will do.

Cheers,
Andre'


