Return-Path: <linux-arm-msm+bounces-107701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAHvMVuqBmq8mAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:08:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6325496B0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 07:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B623300DDF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 05:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C110A3DEAED;
	Fri, 15 May 2026 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="c5uGs2jF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90093CF67D;
	Fri, 15 May 2026 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778821717; cv=none; b=GcT0eq2pDDlN8M+AH4YIftCbd+U02+6kkE6dO1xecII0jROTzfTKQqTqpohPBU4UrJ2rltUHXoWCXfJLwYS1gGQQK6uiwj/HAJm7sArNzXkNFVThSmQOfsX4yY09OjXmO/JFbFBAyEnWjfgnF8txb57mAmzHXUE4oedUCMTbIaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778821717; c=relaxed/simple;
	bh=foPiAKtlim0IMGXBD6vjdgfAWPjrYOn9Kce7+yb/c4o=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XrChotpPFPlhtvwid3lSyvwea9fR+sYcJvQRFhD1qbXjGmFbrsgSVm3SDtz98O8SY2pNUUcoAH8NFAh4JPPafu7mPiqNuMTpUeHavffFJ0KTseHi6l1OfvEPEb1RbG3LTpzdk37TwSRZZ8ff3R3nWD3Cw67nCWfrURTB7CiLoRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=c5uGs2jF; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1778821699; x=1779080899;
	bh=bY8td5xPHQkAvs6MnLRddzsEhSM0rtjpwZSEz61U4/Y=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=c5uGs2jF/40+/AJP9iIBtqB3QbcPFLrmYuRLHxYWqG6Kdg39VdH0Ap5Kp51s3eoWj
	 g3gukyHr+TtHynPHBWxkRos6tyC0mdlKSA76XYtfQP1OqVxY+H3l89heiAXvAx4MTU
	 tL7xECOOcqbUoFmP8aD2CfKUomzojzzfjXxJ25pLfpQaDvlDqiyRmKmxYwbTGQryEx
	 xEsvtxoICUg3CUnFjMpWkB1cqLDd0I0BBI2XxTuEY887xqlZXVBt6xQtKtlRw6aB8z
	 v9ENHB80RZDHWURmEtESG7DxBkGcq1H+7XwFiZhuRW8dzCRwinpYR9ziiEltHovWOe
	 MFNIxJae6d5tQ==
Date: Fri, 15 May 2026 05:08:10 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH RFC v6 0/7] Add support for Adreno 810 GPU
Message-ID: <20260515-adreno-810-v6-0-fbe04c7203e1@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 359b81c8d6c56f79e141c4cc4d08652c6efd40a9
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4A6325496B0
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-107701-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Adreno 810 is present in the Milos SoC and is the first GPU to be released =
in
the A8x family.

This series is marked as RFC because it depends on a few other in review
series, GPU GX GDSC handling [1], QFPROM efuse for Milos [2], and devicetre=
e
support for Glymur [3] (for a8xx RSCC offset fix and X2-185 bindings change=
).

Also depends on the GXCLKCTL block for Milos [4], but this is no longer in
review and has been applied.

[1]: https://lore.kernel.org/linux-arm-msm/20260427-gfx-clk-fixes-v2-0-797e=
54b3d464@oss.qualcomm.com
[2]: https://lore.kernel.org/linux-arm-msm/20260331-milos-qfprom-v1-0-36017=
cc642db@pm.me
[3]: https://lore.kernel.org/linux-arm-msm/20260513-glymur-gpu-dt-v4-0-f838=
32c3bc9a@oss.qualcomm.com
[4]: https://lore.kernel.org/linux-arm-msm/20260417-milos-gxclkctl-v3-0-08f=
5988c43a2@fairphone.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
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

---
Alexander Koskovich (7):
      dt-bindings: display/msm/gmu: Document Adreno 810 GMU
      dt-bindings: display/msm/gpu: Document Adreno 810 GPU
      drm/msm/adreno: rename llc_mmio to cx_misc_mmio
      drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
      drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
      drm/msm/adreno: add Adreno 810 GPU support
      arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU nodes

 .../devicetree/bindings/display/msm/gmu.yaml       |  30 +++
 .../devicetree/bindings/display/msm/gpu.yaml       |   5 +-
 arch/arm64/boot/dts/qcom/milos.dtsi                | 165 ++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 298 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 536 insertions(+), 39 deletions(-)
---
base-commit: 2ca0470eca8b4cee27aeeb39bd93c1f4c96b7e7b
change-id: 20260330-adreno-810-5a47525522cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



