Return-Path: <linux-arm-msm+bounces-101587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFvYFhT3zmnqsAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 01:09:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B3038EF8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 01:09:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 437FA301F31E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 23:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 891173A0E80;
	Thu,  2 Apr 2026 23:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="dD8qYRc+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CF93D904B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 23:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775171345; cv=none; b=qOw9YtJ3BDck9CCSTWETGoZ068/66kGFY4L83iNp+E/P0NO+xHg0moom6z4adAyrZA/WF7I8iHj+ozCKm0TM+Op0tqR8rSFu5MINS/nh/+9JrFgrsb3KVD/HToi2J+j1KY7GQgd0XgDDhxLeVqcvs1Sh3dI6jv3ksSOResO5QKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775171345; c=relaxed/simple;
	bh=HLdKYEYD2vYJHOz0wYeSM7NlXVhV7L9FS+LbNlBa08w=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BYkgZKKQmZwBr0PkLM/0cB8VLVHjkgGU3sW5RgLZKyzfkn3yvnVFr8pt59geDefceP7P2wwYAySgHhldje+zITueY3AQOivNGHpd/oOldrJPW3CJV8FjdI8Xnn23DQo3NaSXmia3Bj4cBkV1D8gHXGhU3bthQY3hefD8lbZBmag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=dD8qYRc+; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775171335; x=1775430535;
	bh=rE2HoThd10HrNMs1tN5wmiHl/9YW42CnnLl89bF5KVo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dD8qYRc+UEc2kdgYua7bo4kXXJf3JrzhP4GMDfHc661wb+NSsg5U0RgLAHP5bEpxG
	 AWvUebIaw16g3n+YM4VrBt0DIszQUxrzExQcJ6284lyNWSkbs0f2jo8gVxQYVZ+0uz
	 lx1R+bRHeBOsOflpnrYepMeBA7d6busXGLAkbn1o8zjRlYMq2ip9X0klRj16jzOaQr
	 /g7y5zc3QZCSSXyKQERmxDxS4rHLAKf3RdSFhiX6dBuzoXHEowSCG+av4gAnnkXnPR
	 4TQ7wlrBznJToPjubF0um8wNKmtoNJsseppUd90Kik4nrZWCHSqfca4YMQ3aVMZ294
	 rFnbvl6cGjNcA==
Date: Thu, 02 Apr 2026 23:08:46 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v2 0/6] Add support for Adreno 810 GPU
Message-ID: <20260402-adreno-810-v2-0-ce337ca87a9e@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: c3904c3704a8bd0e583e522d202fad3a4e1bd19d
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101587-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:dkim,pm.me:email,pm.me:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 03B3038EF8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 810 is present in the Milos SoC and is the first GPU to be released =
in
the A8x family.

Note that the OPP table is limited to 1050MHz to start with as the only Mil=
os
device I have is limited to that speed in GPU_CC_FREQ_LIMIT_VAL.

This series is marked as RFC because it depends on a couple other in review
series, batch 2 for A8x [1] and the GXCLKCTL block for Milos [2].

There is also currently an issue on Milos with gx_clkctl_gx_gdsc being stuc=
k on
during runtime PM [3]. The proper fix is to only toggle the GX GDSC during =
GMU
recovery, as the firmware manages it in all other cases. This is the same i=
ssue
seen on SM8750 and is being worked on by Qualcomm. Right now I am just work=
ing
around this locally by not collapsing the GX GDSC during runtime suspend.

[1]: https://lore.kernel.org/linux-arm-msm/20260327-a8xx-gpu-batch2-v2-0-2b=
53c38d2101@oss.qualcomm.com
[2]: https://lore.kernel.org/linux-arm-msm/20260306-milos-gxclkctl-v1-0-00b=
09ee159a7@fairphone.com
[3]: https://lore.kernel.org/linux-arm-msm/5409e13e-280c-47b6-a29f-351cb609=
bc6f@oss.qualcomm.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v2:
- Mark as RFC due to dependency on in-review changes
- Explain in DTS commit why qcom,kaanapali-gxclkctl.h and not qcom,milos-gx=
clkctl.h
- cx_mmio -> cx_misc_mmio
- Sync a810_nonctxt_regs with GRAPHICS.LA.14.0.r5-03100-lanai.0
- Link to v1: https://lore.kernel.org/r/20260331-adreno-810-v1-0-725801dbb1=
2b@pm.me

---
Alexander Koskovich (6):
      dt-bindings: display/msm/gmu: Document Adreno 810 GMU
      drm/msm/adreno: rename llc_mmio to cx_misc_mmio
      drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
      drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
      drm/msm/adreno: add Adreno 810 GPU support
      arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes

 .../devicetree/bindings/display/msm/gmu.yaml       |  32 +++
 arch/arm64/boot/dts/qcom/milos.dtsi                | 148 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 271 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  11 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 8 files changed, 493 insertions(+), 40 deletions(-)
---
base-commit: 128d2eccd20bd74fd104b412d949d869aa48f108
change-id: 20260330-adreno-810-5a47525522cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



