Return-Path: <linux-arm-msm+bounces-102249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLPVGzqz1Wmo8wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102249-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 03:45:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F73B604C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 03:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BED9E301DCDF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 01:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C95EB1E1C11;
	Wed,  8 Apr 2026 01:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="W0slEyYW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378C1465B4;
	Wed,  8 Apr 2026 01:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775612724; cv=none; b=dmFUuhyH21/X5FnjHFdgiW7zK8on231N9MHv5xVIHCQY/O63HBGSTGJONotRt1gXr6wogYveT/PgHAq38qMDGbnzbJ3SNvosrDZSefVK8dDvjOrxcEBFjOfek688JVTfQrJW2DD8Dt8ljzi/o+yXMigRKsp6N8YTeigYSC/0o4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775612724; c=relaxed/simple;
	bh=F3WE7r3LRSxotitrpVu72/kNQrdKiTrhxEMyk1zkOzk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=A8SYORHSslLkAw8vJY3CEWUbnIo2cHxyFoFfTpMY8gTWj+Z8lES9nWYZ7mRkSMCz7iUV4YqMRyLsIp/Ar556TEtxVXYFa1LGfppRFxUVUdB2MtSPN8XKNwpRrSHnhVelrxQ1ItmnIIp+bXxtcVD0cBRRr6u61XNJT2ocmTf1MqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=W0slEyYW; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1775612719; x=1775871919;
	bh=fE9MkNIaibxoVtQ1CV0/F30yF7RXoeODurTx0e2uyxk=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=W0slEyYWeN4PqsnwkXMGu3ywS14NMItgmXnmydRRxqMmSpk+TWfpdRrTLKJneyjMv
	 IcdCbrLayNj3ZUA7csk2h4rezKAiLDHzwWZQkrltWnE0hXCTZSeiFZhh4eMkO5nHZc
	 x3q6yLK2fIXoS/rbA6Vki8W2svR9OoqQy0qVQSfzREzPfap02YaL+H1X5jnZN9QCwk
	 AUqIG0AaW1KqnPLSX2NFkQ9ATBuyHIK4Tjt4vhA8KNfPmR/kOuC+XgFP6zNzLdpNh3
	 zdavcyyURjszYNrVY+uY6AAw2poGhF5qiCYkrZgrrQUs47nXnh5Jk2UQwXHBaaSuuG
	 QDRbEPYSeI/rQ==
Date: Wed, 08 Apr 2026 01:45:14 +0000
To: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH RFC v3 0/7] Add support for Adreno 810 GPU
Message-ID: <20260407-adreno-810-v3-0-30cb7f196ed4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 58a837a851972b74295a63e683535ba1f1f7d62f
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
	TAGGED_FROM(0.00)[bounces-102249-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[27];
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
X-Rspamd-Queue-Id: 153F73B604C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Adreno 810 is present in the Milos SoC and is the first GPU to be released =
in
the A8x family.

Note that the OPP table is limited to 1050MHz to start with as the only Mil=
os
device I have is limited to that speed in GPU_CC_FREQ_LIMIT_VAL.

This series is marked as RFC because it depends on a couple other in review
series, GPU GX GDSC handling [1] and the GXCLKCTL block for Milos [2].

Also depends on A8x batch 2 but it looks like that made it into linux-next.

[1]: https://lore.kernel.org/linux-arm-msm/20260407-gfx-clk-fixes-v1-0-4bb5=
583a5054@oss.qualcomm.com
[2]: https://lore.kernel.org/linux-arm-msm/20260403-milos-gxclkctl-v2-0-95e=
b94a7d0a4@fairphone.com

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
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
 arch/arm64/boot/dts/qcom/milos.dtsi                | 146 +++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 291 +++++++++++++++++=
++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  44 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |  14 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   6 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 9 files changed, 507 insertions(+), 38 deletions(-)
---
base-commit: afed2755f671a38114a907c0bff6d35c3a76ef40
change-id: 20260330-adreno-810-5a47525522cd

Best regards,
--=20
Alexander Koskovich <akoskovich@pm.me>



