Return-Path: <linux-arm-msm+bounces-112332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6lwfDmoYKWozQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:55:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88879666D1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 09:55:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=sFXCTkQF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112332-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112332-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3B223201E81
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 07:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064A1393DDA;
	Wed, 10 Jun 2026 07:49:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D622F2D9787;
	Wed, 10 Jun 2026 07:49:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781077759; cv=none; b=Og2VAwhtKRzsgooK8HZNX8vAzoPJYkavHa2RPJ3dDT42WVJU2CVHY54uMNyZhdeobtiptRF9jocvzvGAzEdLFx+GL+owhXkp27wIdU6Gv+V8xd8daRTJrQiK5uIax0WVp9az6zqI/vEUPx4fPgrDcNzXo3W+3r9Rb5/kLPYdTW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781077759; c=relaxed/simple;
	bh=lD1HUnZXDh8evB2ZyROS/+Exc/gYge+hONvXJRsg0UY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hicDlU2cFgzuZONSfH6rd5tn7CGyDslO7PW9U4TMpruMWdD+lcIJ3k6UUFwFQ/5rIn0RW60mkIDDSRZDrTDwDYN+uHXhi0V6XwArbcPWM+DrUX/EcXoArJQVk8haNcOV+J1IvUPJyY3r+job+s8KEtaajKPNxHSw/N8dcHznoqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFXCTkQF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79F6FC2BCB9;
	Wed, 10 Jun 2026 07:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781077759;
	bh=lD1HUnZXDh8evB2ZyROS/+Exc/gYge+hONvXJRsg0UY=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sFXCTkQFUj30kP12tXU3X+Elc6KPQMgHJy/S4wyg4uB3hHXD9VW+Sg5A1Y6rofwOD
	 PnBCCKSzLiLXGFa4/aNO8EPUNEtNNmtF8W8Is7GfsagbFj5hy2jLZgUIVS868osOQn
	 ItTmk51/M1OynqNhKQomyWevpLNHfI6ZwVuQoKnqZkjKdOaT+nzhe3OlCrSCOwKXU0
	 yLBg4h0mt22I3qfXyWEDVOEs8VaNC9xtdSKxciRZByL2VFWKWmjShGJvmXGs5QO7DX
	 HdOkNTFJjVldKzRyYL2UCrhHOeSUy8slR1e+LR5Tl6nxEBRUoWgXDLZuViDnBi5WEh
	 Pv+lx9/cFpuzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B98CD98C7;
	Wed, 10 Jun 2026 07:49:19 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Wed, 10 Jun 2026 09:49:17 +0200
Subject: [PATCH] drm/msm/a3xx: Drain VBIF before GPU suspend
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-mainline-fix-a3xx-gpu-hang-sending-v1-1-9282182840b5@alex-min.fr>
X-B4-Tracking: v=1; b=H4sIAPwWKWoC/yWNywrCQAxFf6VkbWAetYK/Ii6mnVgjGsuklYHSf
 zfV1eXA4dwVlAqTwrlZodCHld9i4A8NDPckIyFnYwgudK7zDl+J5clCeOOKKdaK47TgrqKSZLY
 NR9f2Mcfc+hNYaCpk8u/kcv2zLv2Dhnkvw7Z9AYguHeSGAAAA
X-Change-ID: 20260610-mainline-fix-a3xx-gpu-hang-sending-2504b3d3d417
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781077758; l=4188;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=U1m7+SxBVxKaqhEGJu1GKuE9XFcw724ySAWY6Dm6jt4=;
 b=nrWv/4C4ROSaessiJUfrFyLGL8vxGp7iEbTcPpIDVjzhm5GMPY2gubhvQdtpsE1HDsq0fRHUJ
 N8MMsl3qktVBuMTFr00w7oJnk+2lIfD+kdrBvz16faVmf2QzhyMn59s
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:contact@alex-min.fr,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-112332-lists,linux-arm-msm=lfdr.de,contact.alex-min.fr];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[contact@alex-min.fr];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,alex-min.fr:replyto,alex-min.fr:email,alex-min.fr:mid,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88879666D1D

From: Alexandre MINETTE <contact@alex-min.fr>

A3xx hangs after every runtime suspend on the Samsung Galaxy S4
GT-I9505. Even simple GPU workloads, such as drawing a single triangle,
hang reliably once the GPU has been suspended by runtime PM.

The generic MSM GPU suspend path disables clocks/power, but A3xx also
needs to ensure that pending VBIF transactions are drained before that
happens.

Add an A3xx-specific pm_suspend callback. Wait for the GPU to become
idle, halt all VBIF XIN clients, wait for the corresponding
acknowledgment, and only then enter the generic MSM GPU suspend path.

This fixes reliable A3xx GPU hangs observed after runtime PM on the
Samsung Galaxy S4 GT-I9505, codename jflte. The failure is reported as:

  mdp4 5100000.display-controller: [drm:hangcheck_handler] *ERROR* 3.2.0.2: hangcheck detected gpu lockup rb 0!
  mdp4 5100000.display-controller: [drm:hangcheck_handler] *ERROR* 3.2.0.2:     completed fence: 4294967041
  mdp4 5100000.display-controller: [drm:hangcheck_handler] *ERROR* 3.2.0.2:     submitted fence: 4294967049
  mdp4 5100000.display-controller: [drm:recover_worker] *ERROR* 3.2.0.2: hangcheck recover!

Link: https://github.com/freedreno-zz/freedreno/issues/12
Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
Fix A3xx GPU hangs after runtime PM by draining pending VBIF
transactions before entering the generic MSM GPU suspend path.
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         | 36 ++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |  2 ++
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 018183e0ac3f..a37be1241271 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -25,6 +25,8 @@
 
 extern bool hang_debug;
 
+#define A3XX_VBIF_XIN_HALT_CTRL0_MASK	GENMASK(5, 0)
+
 static void a3xx_dump(struct msm_gpu *gpu);
 static bool a3xx_idle(struct msm_gpu *gpu);
 
@@ -502,6 +504,38 @@ static u64 a3xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
 	return busy_cycles;
 }
 
+static int a3xx_vbif_halt(struct msm_gpu *gpu)
+{
+	u32 ack;
+	int ret;
+
+	gpu_write(gpu, REG_A3XX_VBIF_XIN_HALT_CTRL0,
+		  A3XX_VBIF_XIN_HALT_CTRL0_MASK);
+	ret = spin_until(((ack = gpu_read(gpu, REG_A3XX_VBIF_XIN_HALT_CTRL1)) &
+			  A3XX_VBIF_XIN_HALT_CTRL0_MASK) ==
+			 A3XX_VBIF_XIN_HALT_CTRL0_MASK);
+	gpu_write(gpu, REG_A3XX_VBIF_XIN_HALT_CTRL0, 0);
+
+	if (ret)
+		return -EBUSY;
+
+	return 0;
+}
+
+static int a3xx_pm_suspend(struct msm_gpu *gpu)
+{
+	int ret;
+
+	if (!a3xx_idle(gpu))
+		return -EBUSY;
+
+	ret = a3xx_vbif_halt(gpu);
+	if (ret)
+		return ret;
+
+	return msm_gpu_pm_suspend(gpu);
+}
+
 static u32 a3xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
 	ring->memptrs->rptr = gpu_read(gpu, REG_AXXX_CP_RB_RPTR);
@@ -597,7 +631,7 @@ const struct adreno_gpu_funcs a3xx_gpu_funcs = {
 		.get_param = adreno_get_param,
 		.set_param = adreno_set_param,
 		.hw_init = a3xx_hw_init,
-		.pm_suspend = msm_gpu_pm_suspend,
+		.pm_suspend = a3xx_pm_suspend,
 		.pm_resume = msm_gpu_pm_resume,
 		.recover = a3xx_recover,
 		.submit = a3xx_submit,
diff --git a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
index 6717abc0a897..096de72b0b6c 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a3xx.xml
@@ -1499,6 +1499,8 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
 	<reg32 offset="0x3058" name="VBIF_OUT_AXI_AMEMTYPE_CONF0"/>
 	<reg32 offset="0x305e" name="VBIF_OUT_AXI_AOOO_EN"/>
 	<reg32 offset="0x305f" name="VBIF_OUT_AXI_AOOO"/>
+	<reg32 offset="0x3080" name="VBIF_XIN_HALT_CTRL0"/>
+	<reg32 offset="0x3081" name="VBIF_XIN_HALT_CTRL1"/>
 
 	<bitset name="a3xx_vbif_perf_cnt" inline="yes">
 		<bitfield name="CNT0" pos="0" type="boolean"/>

---
base-commit: 2d3090a8aeb596a26935db0955d46c9a5db5c6ce
change-id: 20260610-mainline-fix-a3xx-gpu-hang-sending-2504b3d3d417

Best regards,
--  
Alexandre MINETTE <contact@alex-min.fr>



