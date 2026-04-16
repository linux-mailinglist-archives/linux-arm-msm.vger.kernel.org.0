Return-Path: <linux-arm-msm+bounces-103375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HrHN8bC4GkFlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:06:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933940D261
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 13:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7730E300EFB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 11:04:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D0F38D6A9;
	Thu, 16 Apr 2026 11:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Moijb+2p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch [79.135.106.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87D527B357
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Apr 2026 11:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776337494; cv=none; b=ZRQB+475Ii3zGryhx92wUvJK7173MPNboiAebXfrLIx1ArR1S934fHBFJJCbiIAY1lQRPl9r5ubrTXUUorQau+JoXMhV+13iaLHWi9ZX3cAPGf4kPlJIB9ViL40NQdTW044T8GkCZfiZta/3wq7pOALCLrcxvJOnylgl0HBBEVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776337494; c=relaxed/simple;
	bh=v9dZUijvKbwEj6cICPn2Bfzs4TG9TBtGp5Pd+DQtyGE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wi4eGxROVXSRy1NMxZZFHWbf/4U8VXQ3j2S+06TcKlyb3jalVB73zox9reegAvlpSAb/xPfe/bls1NJr0DjcuWH4bzKutFwqARacf1imF4ySEBuQ3jAO/ADMf8zHw8dhkl76A3C2OAppfWL75tE//JrCxzYNWOFEHkxhf5zrV+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Moijb+2p; arc=none smtp.client-ip=79.135.106.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776337484; x=1776596684;
	bh=ND45yB22FWjIji9RmDjY8g6tzsg5Y5+t9sZmH4XvSKU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=Moijb+2pzfp8N/wXiwy0bwgPqgVdkJhMePsB+FlxuG1uwUPrPdeBbQYc0ECTTGOrT
	 Ja+ruK/Mab3a7h2o74GGBRE0HX5xKs1hxoJzmoXqMQ1btDOvADD/69RZG1IOu6GDkh
	 Ese1Fqb0qcV43l+bifDkT4nstPml/LWbXjasOR05CT05M+LPCS518qFzjIzpoSz/9t
	 EefaZcK/DbS8myFgpV6S6Lcmi5vkqRPAKvLVTzGQ3xR3LFEgUydJkVvrVFRGai6Xwm
	 /cm/ZhW6RDJcisnkHJ3pMOKzHzfiVuHb0LLx+RIeyK7ZeMhWmtbo2kZ7aYIR8B3Wue
	 u1E2MC5Dn/ZZQ==
Date: Thu, 16 Apr 2026 11:04:36 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v4 0/7] Add support for Adreno 810 GPU
Message-ID: <20260416-adreno-810-v4-0-61676e073f8a@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 9198165a4acde663ff75ac413a75938d5f73a19c
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103375-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[26];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email,pm.me:dkim,pm.me:mid]
X-Rspamd-Queue-Id: 4933940D261
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 810 is present in the Milos SoC and is the first GPU to be released =
in
the A8x family.

This series is marked as RFC because it depends on a few other in review
series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2] and the GXCLKC=
TL
block for Milos [3].

Also depends on A8x batch 2 but it looks like that made it into linux-next.

[1]: https://lore.kernel.org/linux-arm-msm/20260407-gfx-clk-fixes-v1-0-4bb5=
583a5054@oss.qualcomm.com
[2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017=
cc642db@pm.me
[3]: https://lore.kernel.org/linux-arm-msm/20260403-milos-gxclkctl-v2-0-95e=
b94a7d0a4@fairphone.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v4:
- Add 1150MHz speedbin
- Rebase on next-20260415
- Add dep on efuse patchset
- Link to v3: https://lore.kernel.org/r/20260407-adreno-810-v3-0-30cb7f196e=
d4@pm.me

Changes in v3:
- Drop DEMET from GMU clocks (not required on A810)
- Document qcom,adreno-44010000 compatible (regex is gone in 7.0+)
- Drop zeroed out CP_PROTECT_REG[46, 62] range, not required
- Add a810_protect to __build_asserts
- Add UCHE_CCHE_TRAP_BASE_[LO|HI] and UCHE_CCHE_WRITE_THRU_BASE_[LO|HI] to =
a810_pwrup_reglist_regs
- Move TPL1 registers to a810_pwrup_reglist_regs
- Include all protect registers in a810_ifpc_reglist_regs
- Revert pipe reg comment, just copied it from downstream but original also=
 works
- Link to v2: https://lore.kernel.org/r/20260402-adreno-810-v2-0-ce337ca87a=
9e@pm.me

Changes in v2:
- Mark as RFC due to dependency on in-review changes
- Explain in DTS commit why qcom,kaanapali-gxclkctl.h and not qcom,milos-gx=
clkctl.h
- cx_mmio -> cx_misc_mmio
- Sync a810_nonctxt_regs with GRAPHICS.LA.14.0.r5-03100-lanai.0
- Link to v1: https://lore.kernel.org/r/20260331-adreno-810-v1-0-725801dbb1=
2b@pm.me

---
Alexander Koskovich (7):
      dt-bindings: display/msm/gmu: Document Adreno 810 GMU
      dt-bindings: display/msm/gpu: Document A810 GPU
      drm/msm/adreno: rename llc_mmio to cx_misc_mmio
      drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
      drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
      drm/msm/adreno: add Adreno 810 GPU support
      arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes

 .../devicetree/bindings/display/msm/gmu.yaml       |  30 +++
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                | 166 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 296 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 532 insertions(+), 38 deletions(-)
---
base-commit: 5fe4fcc47bbe1ee4474e743378c1b296a0b40e4c
change-id: 20260330-adreno-810-5a47525522cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



