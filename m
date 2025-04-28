Return-Path: <linux-arm-msm+bounces-55915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF9A9F090
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 14:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B47BF17FB02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 12:23:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9192690E7;
	Mon, 28 Apr 2025 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KpyCaYsQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B087267B99;
	Mon, 28 Apr 2025 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745842994; cv=none; b=IVes3q7qEG3sUVuKBWInih48nO6cmh7Ph1UXAgGajojCNcBbXyzOz+vAmjFOukaQ3fuh80X0Rwv9JprfOMKqN7odrECkkkI/y+Yo/p6xHOTtgL6wtHWYkGm8MjRSCf16AisvtRYMjBrGJIWMe7nRbZbmuKK41/RukENXsDRJTgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745842994; c=relaxed/simple;
	bh=HCz8DLodaQbrm+46dctr2oR/E7+SUsbNqLwypXlR7Sg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrvpckNASzfW0uB3klojiHosuRwu7qbHGaabYWpbuHJsm4BdqINnS2ate+uo1sJRhPuULYRADcVlNvM855wtwMReeV2CyKQ8SGpWUkMEZd1rxukjwC8XW5HWWDtO+CCVQ1GbWqct4mYmQajuRmNNjZ+GF4VQpbvWXpPsXUvOdzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KpyCaYsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3272C4AF09;
	Mon, 28 Apr 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745842993;
	bh=HCz8DLodaQbrm+46dctr2oR/E7+SUsbNqLwypXlR7Sg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KpyCaYsQGtAyJOuUAwAEyx7KH4FWEFstaN/zDK8iSr8LyiS43doSjlzBK/wI1iEYm
	 tgltI8g4gMIx2MAeXNiOdykXknUzjTvpubM6ehz0yaVFKHzQXaQUOyFmCZx3k413BB
	 tfnURaLUnxKiRIyvL8DGHbkLk+Kx1ohTaHsH8g58pOmgiRdruSwPjKACmsGsVyTiVW
	 tZWZ/2y+8b0eCTHHogjd5Z0oblaXN4DIFernU+aFGPypp7eCO3ZmIM4EYpcEgN3I4s
	 4RXQk8u5PJhPyW3gWtw0gAuwQ6m9wsFEWVlC5Ydc945pAAkOLb023byD5wZcww8qzW
	 zsry93j2gntNw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so8601938a12.0;
        Mon, 28 Apr 2025 05:23:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUCA9d24UPXc/Jwt0LjwH0uJvlxndBqiyzdPC6XjsaZcE7i+RMPGVjB3QdLYiQBQnJI8EBpGh564tez@vger.kernel.org, AJvYcCUQG2ixjUZ0UcksnGdV0/wm5V45dJtFiw+AlkqX4AvgRJmH4lbgdjmTGrlAt7wC2XWm9DcDcG2qnqrhJa16Bw==@vger.kernel.org, AJvYcCVkkwx4a1UjYY6vRbaBQDuNwGIbeDhPLeS7g/+kF9ykeSfedQE7S/HJFz7vymPF4mCv6cot9/xhK4BKBlqgz6z+Ig==@vger.kernel.org, AJvYcCW18ta18AbuEm8eP6UFIiEqgn3p+72Peq3ivKNaGQCeQnOGZmt88RddMZWcasWgb0B8AZbpSXKyLPIs9Slr@vger.kernel.org
X-Gm-Message-State: AOJu0YzoXv+mdnen9fHUy6eszDetdQQ0YpSfShnmnoj2GGzs9OdFVAWY
	wCNYyW7BErae+RjgaERt+GStDwJPBCU9kws/aiF/R9CVvpJn4zht/JJYvXt+5zJp4olHlG2wppL
	fP5O0lOBgC8KfNKhZB3CONk/nnA==
X-Google-Smtp-Source: AGHT+IG+CACbiiD2abOkp8tXfXmRr505UnyuCRTrkEYyr07DsjIb1ktiKdJ4ARe6OcGznQb9vjFUFmdjHww0FD53lpk=
X-Received: by 2002:a05:6402:d08:b0:5f4:370d:96c4 with SMTP id
 4fb4d7f45d1cf-5f7394d37ccmr7705350a12.0.1745842992502; Mon, 28 Apr 2025
 05:23:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
 <CANLsYkxKHhCHYrbAGzQ48QGpL_DbuLnX3=ppmpyu0vjuuvvODg@mail.gmail.com> <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
In-Reply-To: <322d366c-1564-4b06-9362-28fe451a35e7@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 28 Apr 2025 07:23:01 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
X-Gm-Features: ATxdqUFE1MZW4VzC8-fvJOOKPGQbbAo554PCqhNSEgkFv0dfgvJlVI74jm4fy4w
Message-ID: <CAL_JsqJemaAzx6v0kj52J=YFRGqLo5=xk8LXXk-8i=mAomTCWQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] of: Common "memory-region" parsing
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	"Andrew F. Davis" <afd@ti.com>, "Shah, Tanmay" <tanmay.shah@amd.com>, Saravana Kannan <saravanak@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Bjorn Andersson <andersson@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 6:34=E2=80=AFPM Iuliana Prodan <iuliana.prodan@nxp.=
com> wrote:
>
> Hello Mathieu, Rob,
>
> I've tested imx_dsp_rproc and it fails with:
>
> [   39.743770] Unable to handle kernel paging request at virtual address
> ffffffffffffffea
> ...
> [   39.805078] Hardware name: NXP i.MX8MPlus EVK board (DT)
> [   39.810390] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS
> BTYPE=3D--)
> [   39.817353] pc : __pi_memset_generic+0x50/0x188
> [   39.821892] lr : imx_dsp_rproc_prepare+0x3a4/0xea4 [imx_dsp_rproc]
> [   39.828079] sp : ffff8000853dbb10
> [   39.831396] x29: ffff8000853dbb90 x28: 0000000092400000 x27:
> ffff80007a36d3d8
> [   39.838540] x26: ffff0000d0a5e410 x25: ffff80007a36d3f0 x24:
> 0000000000000004
> [   39.845685] x23: ffff0000d5414880 x22: ffff0000d5e1dce8 x21:
> 0000000000000000
> [   39.852827] x20: ffff0000d5e1db98 x19: ffff0000d5414b80 x18:
> 00000000ffffffff
> [   39.859970] x17: 202c656c69687720 x16: 3e2074756f657672 x15:
> ffff800081f8d050
> [   39.867114] x14: ffff0000db584680 x13: 0000000000000003 x12:
> 00007fffa3330000
> [   39.874257] x11: 0000000000000004 x10: 0000000000000ab0 x9 :
> 0000000000000000
> [   39.881400] x8 : ffffffffffffffea x7 : 0000000000000000 x6 :
> 000000000000003f
> [   39.888546] x5 : 0000000000000040 x4 : 0000000000000006 x3 :
> 0000000000000004
> [   39.895689] x2 : 0000000000008000 x1 : 0000000000000000 x0 :
> ffffffffffffffea
> [   39.902837] Call trace:
> [   39.905284]  __pi_memset_generic+0x50/0x188 (P)
> [   39.909821]  rproc_boot+0x2c0/0x524
> [   39.913317]  state_store+0x40/0x100
> [   39.916812]  dev_attr_store+0x18/0x2c
> [   39.920478]  sysfs_kf_write+0x7c/0x94
> [   39.924146]  kernfs_fop_write_iter+0x120/0x1e8
> [   39.928598]  vfs_write+0x244/0x37c
> [   39.932008]  ksys_write+0x70/0x110
> [   39.935413]  __arm64_sys_write+0x1c/0x28
> [   39.939342]  invoke_syscall+0x48/0x104
> [   39.943094]  el0_svc_common.constprop.0+0xc0/0xe0
> [   39.947805]  do_el0_svc+0x1c/0x28
> [   39.951123]  el0_svc+0x30/0xcc
> [   39.954188]  el0t_64_sync_handler+0x10c/0x138
> [   39.958549]  el0t_64_sync+0x198/0x19c
> [   39.962222] Code: d65f03c0 cb0803e4 f2400c84 54000080 (a9001d07)
> [   39.968317] ---[ end trace 0000000000000000 ]---
>
> The problem seems to be when computing `cpu_addr =3D
> devm_ioremap_resource_wc(dev, &res);`, in patch 4.
> In `__devm_ioremap_resource` (see [1]), it's expecting the resource type
> to be `IORESOURCE_MEM`, which is not the case here (at least the flags
> are nowhere set for this).

Thanks for testing and diagnosing. IORESOURCE_MEM needs to be set. Can
you test with this change:

index f87915cce961..00c93585758f 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -771,6 +771,7 @@ int of_reserved_mem_region_to_resource(const
struct device_node *np,
                return -EINVAL;

        resource_set_range(res, rmem->base, rmem->size);
+       res->flags =3D IORESOURCE_MEM;
        res->name =3D rmem->name;
        return 0;
 }

