Return-Path: <linux-arm-msm+bounces-110073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAc8KeURGGrKbggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110073-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:59:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B77F45F013C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 11:59:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1455E3006D4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 09:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2811A3B2FE3;
	Thu, 28 May 2026 09:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="F3MaROyT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C205E3B2FCA
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 09:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961714; cv=none; b=FHzFJWHDndx02QWeznjMm/pdKNvQGLWjkn0zFhhTASRUHBlKmFiEf43daCSX+0pVCkEw20pfJM9LxMpdcnrSJ6sYI44qZsSDmarfDhKwc1NKwrZUmbGm4oaEzY48UyAwV4++zid+GoYCSKv3flHh35Y9I1pNk++wj3xaVrvh8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961714; c=relaxed/simple;
	bh=w1ZQF/6h/p04jWDjUOuDhu1IIgiMa8tkglm2QgKz26U=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=f1CwMfSD/dVapjRimdntN7ozWWQFP+XzKp6fwHdPpiNvrxg6FS24VIGQFxm2HHPPDWdfQnnMJvgbx8kgc/vfrlmHuuHPg86dd+lxGa2d8+ktQsMNbn1S5HzR7+ylyaqJfycBBvp0EG+rdOLUn/A6KIOapt5xJ56hIdnOAHTbJlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=F3MaROyT; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1779961709; x=1780220909;
	bh=tfF7ErDMrxdRhgOgujWqu0HGmuWG/rs9ZI2KGYCeqko=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=F3MaROyTYVBX8XfGs3x2ZW4OTuo8oHKeJ5zrjo7uliQ8Syari64xXMwQAcfWdJiWM
	 Za6F3vc28qyOpNt/8kQ1iJvnohs1sq08gDeyi8tyZBJQzLWD/bAqezMWvPj/hmIRXs
	 Cxo7aLjyoBQwszlur8bLmSQZ6RNtJyyG5ptAvqfqfV7aM3G6innMpaLHNfIIqFYO6R
	 2s+6/qvcDtAomcDN9a9Pg6eifWpTU6a9bzgGyf6wuVmtP2BcrVVcSey9HWs3Zlnvtg
	 hIDFi4rulyzCa9LSHJUnlvl15zjlUh69uWr+i34tMC3NdlyuDz46Y+KRIhdvmsJsJP
	 HkhdRFH4bHx0A==
Date: Thu, 28 May 2026 09:48:21 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v7 0/6] Add support for Adreno 810 GPU
Message-ID: <20260528-adreno-810-v7-0-7fe7fdd97fc2@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: f2cc03d8b1875ed52d0ad32bb6fca5fdc5a15cbe
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110073-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,pm.me:mid,pm.me:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,d0f39fc:email]
X-Rspamd-Queue-Id: B77F45F013C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 810 is present in the Milos SoC and is the first GPU to be released =
in
the A8x family.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Changes in v7:
- Rebased on msm-next-robclark@d0f39fc
- Drop dependency on GPU GX GDSC refactor
- Drop DTS nodes (will submit in a seperate change later)
- Drop RFC prefix
- Add reviews
- Link to v6: https://lore.kernel.org/r/20260515-adreno-810-v6-0-fbe04c7203=
e1@pm.me

Changes in v6:
- Re-jigged the register ranges for GPU/GMU to match Glymur
- Depend on RSCC offset fix
- Fix bindings to add constraints for reg list
- Link to v5: https://lore.kernel.org/r/20260502-adreno-810-v5-0-bc9fd2bb78=
8d@pm.me

Changes in v5:
- Sync with latest kgsl
- Link to v4: https://lore.kernel.org/r/20260416-adreno-810-v4-0-61676e073f=
8a@pm.me

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

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>

---
Alexander Koskovich (6):
      dt-bindings: display/msm/gmu: Document Adreno 810 GMU
      dt-bindings: display/msm/gpu: Document Adreno 810 GPU
      drm/msm/adreno: rename llc_mmio to cx_misc_mmio
      drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
      drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
      drm/msm/adreno: add Adreno 810 GPU support

 .../devicetree/bindings/display/msm/gmu.yaml       |  30 +++
 .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 298 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 8 files changed, 371 insertions(+), 39 deletions(-)
---
base-commit: d32ccd4535953951db6e7b2f476547bd18ee0b3c
change-id: 20260330-adreno-810-5a47525522cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



