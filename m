Return-Path: <linux-arm-msm+bounces-93730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IsOH5J3nGlfIAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:51:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F172179141
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 16:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E07263033D6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:51:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1D5307AD5;
	Mon, 23 Feb 2026 15:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bez0+ejt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4395304BDA
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 15:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771861899; cv=pass; b=LvXGGaAstYz8Xg/XXTDP08J19i6+yJVkktZoLg1bXfCZ8pSP15W6x1JsJ3CWLPOMMfOB4Y8LrlEbG/k6vFEiUYfxVath/zswXBVfWRA6Jv6GCQtsn2VE83ts3ee2T3BQUm25zaU8CbB47jYN791pypYWefFoQ56hByHkcGg3aiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771861899; c=relaxed/simple;
	bh=d5zCa3ysNLijKNaGOI7tuajauNFQ8GHfuuwERS7PUF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QUtrEeD9TQbRRpjAf2bcyAsAb+e9DxLmPmkX4BVE8fohck9zLPysQuxAwVvjuE1tjGBbNEJ7jgvRqdB/Swdlgq1IvwyQoXRppdpkPvKXuQufy+YqsuB//czZQf71IoVya2822HglEi87DukvWRRKX3PTuKL3l3dMYEJZedqAKbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bez0+ejt; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8849dc12f6so644111166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 07:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771861896; cv=none;
        d=google.com; s=arc-20240605;
        b=Y08n0AMQ1RK8wUD/kf5mP9qujhhgr0aZxrrrhcQ+eHAjO9bw9Wh9cc67C20S3n3XOE
         D5tEzb7vFUjLg54e/qcIsrfpUbRyeby4kPHyFzmXFxOGpz+yZNZMSL9pLH5trnfXV9vj
         NraiGP2Nx0SU+4QnvDOyKoQDT2unjF6zwKT1NWPb2xbFxCOkh/7ZaOSOrdYZrbiX+ph0
         kZJOtw6TOMBolcsqz1K/kfR77WPkM1vofiK5W9txAt1f5BCsezKAJP6dSvS7gLvLaRIu
         EKm9WkQCL2FrIoppeuxADD1V0mwzSiJfEd3avo4Re2uD9NMhpoed9c145XNvjLP2WAJN
         D77w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        fh=BPIGrrwHHOqIDRccdLsLCU112GopNLNonimbqlISO68=;
        b=Syg1fYDP5o6FzF7h7/MKei+8OsopYdISxI4yvvO3Gxo+5U9i9SQdKnMkGahL/FZo+h
         oiM6L3vULQRw22K6HFnvXYISp1tzuVVM+7kz6Ay+xrfQ6OQSqlUt76SrukNeHBSzmcEO
         PXSiYDwo44EgbI07+2lz31W9Pfm69Nh8x+GLcnnpIyQElvSESW+RdMOwrghI0ykHL/IA
         zJ6u4Xl9yqwAPIL+sKFbHYZ0CMCXiHi0jU4cBAEfkQFvoHq37tA7vYpok2erJax6q5aS
         mYKzVkEMM53bOA5My0r8DJ/Wl9YjQOQJm0am4+yOqlO9pU43Sf682rwDAKRE/N/d6bHo
         w2xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771861896; x=1772466696; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=Bez0+ejtvpYWPD6Kti1bkjLrHh/4ih0eYIM0CLxjHJVlyC5lHQHjEKF0CNkHaDuEqj
         cX2cnDEAf7qRrLs8/C3MibBqjq4NnO55kbXTfuH8/Nxx6jwnOMpahcd+BT6S/CdCi1JH
         KUJtx0cspJycQjPwSfacE7jXqTjOKa2T5ILFwWyAwyTfTP05EQrGoHDnILUdu9FWad3o
         qbEmW4NoUFk3SaZ6xWr4LES3oxs34gzL9jKWeuyFPeI3DkWSJDZv4Gpd6GKXlNwQMJpf
         nVxvrZuxvOrPFJhe7ZUNsnwKzjKRrU4q7YjLGxGI51cWL7miac2P1Y9+lB0iWh/Q5Nv6
         YUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771861896; x=1772466696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=npGY86N71VPo4TOfv73Omx9yZ3z0Eb9N82/SaZDWxbc=;
        b=fxDjMmw4/jg3YEMFZTVFZFYDCQKlHVu9foSSAZu+IAwliQe8XJSl4GK2g1hBSeH2d8
         aNLwZK0mXV7VOJvjZhNK0Ej7Tg1MEc26dLHaqjR48Er9M99F2KXCCwvQFwd8c6D4QdW7
         Dg0+uZUbGJ4rQdfrFFAU7rK8sI/Z68S0+LiLJtWDZI2odoVUD0iXVBLsV8lURT9IfqZc
         1dh+BZ3Siimha6Wo9qEP0bAG0f4NMv5bcKKrBdAMxEPnPRY1rNARh9MEo6veOEwI/Y+n
         a9OiXro/ZI1QVyuybtzXt/IPujP/RFnykHvRIV2fToVHCTvVIGv7xXBzfXdD4KWHMP+8
         YEuw==
X-Forwarded-Encrypted: i=1; AJvYcCWu7kexIHkQB+yWcGhRoKlJLaLIJ5ojpHD70HW+wEt9U96BtgkXJ/fsuOfu+U4Fg3uEWjXf1TRWcRxSgOzZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSMCOrUC+9V55A7xbscSIozP9OcCVojEmzAawSzhc1ofBFbjP
	nlPLg+Ed0gFMPiBDErlhzWsstQhg4uGPc30HSTelVzaq3c+TbwoWnrZy2QpdGhnBcQNg0Z/T+gW
	NfBArceJtDkKmuIW+sbyfkKCsBPop04I=
X-Gm-Gg: AZuq6aID0xyN7K44alIO2ql+TThXv28s54ZmzKWE7LlJRQkWFQJ2/9gLS86L2ymYQcA
	ZNsJv/FCrw9GsI3AO0mYXfVrfhlLHEecQb1TjsJ2XuHs2ZfXiFK3o/+bqwaHbSxknjQYQtRDd/e
	UErMo+fgHcy3F1gqyM/Zr8gErzRrCksGTzdSPYQKIBRNNrXE02E4uX98qd4rpcUMWlXpfL+qstY
	Va5di/kpfN39gqRF3sTYhmBGW9JFX2UMvBIJyx80rsYMfbBIiF83fsYNYHZnSEhIBriXQMr1lOy
	sbttK6gd29533TDOaiihz6m9Hpihz2ZfpobquN+IV1GChQ8prznx3fLOjzNdd3mSAyk9umMafSs
	eUREldCI=
X-Received: by 2002:a17:906:5ad6:b0:b8f:e424:ae56 with SMTP id
 a640c23a62f3a-b9081badd6emr413937066b.44.1771861895691; Mon, 23 Feb 2026
 07:51:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 23 Feb 2026 17:50:59 +0200
X-Gm-Features: AaiRm51McMZohKyigNQFIbQDImiJ8vF_g2F0DjapyVKPe6Rkgx4x17MorqEdw1M
Message-ID: <CAHp75VeWD5A0r7-Uayyte1ZXXxdhLixd+z_y0xNeki0N+Ro=jQ@mail.gmail.com>
Subject: Re: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by
 removing devres auto-free
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>, 
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, 
	Xinpeng Sun <xinpeng.sun@intel.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Longfang Liu <liulongfang@huawei.com>, Vinod Koul <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>, 
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, 
	Karol Wachowski <karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, 
	Lizhi Hou <lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, 
	Mika Westerberg <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>, 
	Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Srujana Challa <schalla@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>, Antoine Tenart <atenart@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Raag Jadav <raag.jadav@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Robert Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Nirmal Patel <nirmal.patel@linux.intel.com>, 
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Benjamin Tissoires <bentiss@kernel.org>, linux-input@vger.kernel.org, 
	linux-i3c@lists.infradead.org, dmaengine@vger.kernel.org, 
	Philipp Stanner <phasta@kernel.org>, netdev@vger.kernel.org, nic_swsd@realtek.com, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-usb@vger.kernel.org, iommu@lists.linux.dev, 
	linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-cxl@vger.kernel.org, linux-crypto@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, 
	mhi@lists.linux.dev, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jan Dabros <jsd@semihalf.com>, linux-i2c@vger.kernel.org, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, linux-spi@vger.kernel.org, 
	Jonathan Derrick <jonathan.derrick@linux.dev>, linux-pci@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[google.com,microchip.com,intel.com,linux.intel.com,kernel.org,bootlin.com,hisilicon.com,huawei.com,marvell.com,lunn.ch,gmail.com,davemloft.net,oss.qualcomm.com,amd.com,rivosinc.com,linaro.org,stgolabs.net,gondor.apana.org.au,linuxfoundation.org,microsemi.com,deltatee.com,arndb.de,vger.kernel.org,lists.infradead.org,realtek.com,lists.freedesktop.org,lists.linux.dev,ffwll.ch,semihalf.com,zonque.org,linux.dev];
	TAGGED_FROM(0.00)[bounces-93730-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[87];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 1F172179141
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 5:32=E2=80=AFPM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> This patch series addresses a long-standing design issue in the PCI/MSI
> subsystem where the implicit, automatic management of IRQ vectors by
> the devres framework conflicts with explicit driver cleanup, creating
> ambiguity and potential resource management bugs.
>
> =3D=3D=3D=3D The Problem: Implicit vs. Explicit Management =3D=3D=3D=3D
> Historically, `pcim_enable_device()` not only manages standard PCI resour=
ces
> (BARs) via devres but also implicitly triggers automatic IRQ vector manag=
ement
> by setting a flag that registers `pcim_msi_release()` as a cleanup action=
.
>
> This creates an ambiguous ownership model. Many drivers follow a pattern =
of:
> 1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
> 2. Also calling `pci_free_irq_vectors()` in their error paths or remove r=
outines.
>
> When such a driver also uses `pcim_enable_device()`, the devres framework=
 may
> attempt to free the IRQ vectors a second time upon device release, leadin=
g to
> a double-free. Analysis of the tree shows this hazardous pattern exists w=
idely,
> while 35 other drivers correctly rely solely on the implicit cleanup.

Is this confirmed? What I read from the cover letter, this series was
only compile-tested, so how can you prove the problem exists in the
first place?

> =3D=3D=3D=3D The Solution: Making Management Explicit =3D=3D=3D=3D
> This series enforces a clear, predictable model:
> 1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
>     pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed=
 IRQ
>     vectors should use these functions, which set the is_msi_managed flag=
 and
>     ensure automatic cleanup.
> 2.  Patches 2 through 36 convert each driver that uses pcim_enable_device=
() alongside
>     pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup t=
o instead
>     make an explicit call to pcim_alloc_irq_vectors().
> 3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim=
_setup_msi_release()
>     to check only the is_msi_managed flag. This decouples automatic IRQ c=
leanup from
>     pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors=
*()
>     are now solely the driver's responsibility to free with pci_free_irq_=
vectors().
>
> With these changes, we clear ownership model: Explicit resource managemen=
t eliminates
> ambiguity and follows the "principle of least surprise." New drivers choo=
se one model and
> be consistent.
> - Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit c=
ontrol.
> - Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.

Have you checked previous attempts? Why is your series better than those?

> =3D=3D=3D=3D Testing And Review =3D=3D=3D=3D
> 1. This series is only compiled test with allmodconfig.
> 2. Given the substantial size of this patch series, I have structured the=
 mailing
>    to facilitate efficient review. The cover letter, the first patch and =
the last one will be sent
>    to all relevant mailing lists and key maintainers to ensure broad visi=
bility and
>    initial feedback on the overall approach. The remaining subsystem-spec=
ific patches
>    will be sent only to the respective subsystem maintainers and their as=
sociated
>    mailing lists, reducing noise.

--=20
With Best Regards,
Andy Shevchenko

