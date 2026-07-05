Return-Path: <linux-arm-msm+bounces-116577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1F0aGWmtSmrWFwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 109DE70AEF6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 21:15:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=TZE+3K1Z;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116577-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116577-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 931A23016493
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 19:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3CE3A641D;
	Sun,  5 Jul 2026 19:14:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07ADC3A6B6F
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 19:14:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783278881; cv=none; b=nyx78Mmu5XEZoGF+oL3xtZjbN4NX8vMj9aBbmd0OWZkZxJSG9C1MRPxmCziECsXw907kqoxzRza4I5gkLsg1yspx2edqEfjD9Ff22Hmxb+2vvuaRk2KaSyhxS6dHEatERzYMtmddD3+4iE5Pf3MDu2PLnWeeftpoGjQWFq//0OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783278881; c=relaxed/simple;
	bh=GNmboLcpB1u+4sbu+20YXtJhFgR6gBIC5iE7jNeRoQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zs3pR30pftIfHLyQaoYwCy9RlRXwmU9MHbs13MlLoZ/62LgbWwnGLeI1Oz5tpyoZBgO6q2ufMjxfkCTctPZOZ7tFzLJ+k/qM23+Ky6QT6eWocI9wSUvyhVOBpzSevalYUSdhbsxbfDAPdieaXkqnVQKWmmR5erdesIulGs/1WY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TZE+3K1Z; arc=none smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47d6c634f45so422214f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 12:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783278877; x=1783883677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=;
        b=TZE+3K1ZM/b+odEXRleMZZGmVRrAiU8q8s90auZdSliCzgJmukFnbc0xZv+XIgHm/O
         15bz4J/nCVCiL7jPfusgHxhU0oDVmIisLBpiUA0iJE3+23KNvZQgyzuQLK2mV0WfJNsh
         OYqZFxF/G9UilEpUJT/Y8SJO9Q/mMFYzdz1e6o4LNPR33qAzmZOIlGgfSgA37S/jy5sH
         3CZZ3qwfwHK7KbIySkiB6zLuOWg0FB1YSHTVG5bYbnuHXV3sEXEyR4VyuKYy1TDVB5DD
         CeqS2/w7WS6hJenDLev175BmCdlwhh+aZyDRiJR9swIy1uK0mWLikCyWabBakaLXGNZ3
         RKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783278877; x=1783883677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nZ84WH17cmaqhOLzZnVtdcV+4jwRY2Bo5WKI6TnLcX4=;
        b=b7L2wq0Z5yKXF+VDHGEVJHvhLZNcJxCOTxkeus6CaA07dC7xZwtYFgM4SZ2W+cYh+a
         jdrgke9Wz9f9Y5HAzHdSQWKF2y3+aS5zh1YZ62ngV3drQoWjeHMA/YzOXH9Uz/+cTPlt
         MrENNdlDvKmxcarBuadkHQN0WlYh1CW2e9wGwcyNlb1a1maE2R5AVu3NS+PUIc7Sy3fI
         1mwHBDHH6HIfmbngpdHtGWlQo5duYzK2epLSPkBv/yjS5J7NmTwy+N68Mp4txA/lSUwO
         sKpUxUiNfddUew9UmzDIxzaLWpF7KUk2/FUr/NSWnDeuW+T8s3cNgtRo+mHfGlItbVgS
         FjxQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVgZHs377LSC1CjDAgNERsbKPvZd6ASdQ/hPUFOQ6LNmr9cMwvg2/eAoriElRp+fZDup1S9OZqjqRoWFak@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy085juW0ECh1hRXQTf4i4/4nGrM4zzF3/3ejakjhjAYeSf72/
	heyy1Qz3m17uozHKhfQl1bGvoJKeVcU9j6EjbR2C1RdowQT13rwDr4o=
X-Gm-Gg: AfdE7cn856dOovjoXwIm2a2bSQKcoskXHtY1epy3CVMSexPNAQR5ZrhNeWBlBP+zJv2
	JEZH2j5P88i8Cw/gHcsMzIp5U89gL53xqBnFKP+0IkJ+g8wtBKbflrFS5Ij51AYeIK18niF0Tbk
	zpRVJCSP5sd0SF8HNv7ZqN3cAB8Eh9NYzI39mZpi5T+oh7E9xr2hjM8Lua/7+iI5MJPFN2Ir9FO
	GvERXvKKz64USdA5NHhKLv9pinNyHIcnvD+ZR2KtSZC/rLgH/uLIORMPtJOCk8Bw91YvFPOmV0C
	b4FoOf0IWZXqlYvDnIJs+5Jx+C+YPuLBJUwMqeyZm5CPYckSMIwiNU9NRpSaueklhFrICmfolUa
	JfNYPYRdviFv57ypvYODJi2LOXyP1Kzme03YoGd97M0CSisVcrhz1/HDro5Vjqs7v4f7lsWOISM
	t3F6HMw4vSdm4yoc3WKwI6KaqaYUpEDw==
X-Received: by 2002:a05:6000:1846:b0:473:cefa:98da with SMTP id ffacd0b85a97d-47aaa60de86mr8534994f8f.10.1783278876921;
        Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
Received: from [192.168.1.67] ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960634sm19209528f8f.26.2026.07.05.12.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:14:36 -0700 (PDT)
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Date: Sun, 05 Jul 2026 21:13:46 +0200
Subject: [PATCH RFC 12/13] drm/msm: set ctxbank and asid based on ring
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-descriptive-name-lpac-upstream-v1-12-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Anna Maniscalco <anna.maniscalco2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783278851; l=1658;
 i=anna.maniscalco2000@gmail.com; s=20240815; h=from:subject:message-id;
 bh=GNmboLcpB1u+4sbu+20YXtJhFgR6gBIC5iE7jNeRoQc=;
 b=rmC2QQUsBeGBctekJrkX9Bu4XpWytNrOy081NaDsxEdKs3EL5tzPk65CpjizWt1u9+G71Ip0Z
 pqDS3aq7HVdCwtuw5G8Lc0fcU6h3n5cTjmCTycxplXu/JrouOa8zMbf
X-Developer-Key: i=anna.maniscalco2000@gmail.com; a=ed25519;
 pk=0zicFb38tVla+iHRo4kWpOMsmtUrpGBEa7LkFF81lyY=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-116577-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:anna.maniscalco2000@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:annamaniscalco2000@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,vger.kernel.org,lists.infradead.org,lists.freedesktop.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 109DE70AEF6

qcom-arm-smmu always maps asid and ctxbank 1:1 and lpac is always 1

Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 4417a9d04d7c..a8a061652ec2 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -247,7 +247,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	phys_addr_t ttbr;
 	bool is_lpac = ring == a6xx_gpu->base.base.lpac_rb;
-	u32 asid;
+	u32 asid, ctxbank;
 	u64 memptr = rbmemptr(ring, ttbr0);
 
 	if (ctx->seqno == ring->cur_ctx_seqno)
@@ -256,6 +256,9 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 	if (msm_iommu_pagetable_params(to_msm_vm(vm)->mmu, &ttbr, &asid))
 		return;
 
+	/* qcom-arm-smmu always maps asid and ctxbank 1:1 */
+	ctxbank = asid = is_lpac;
+
 	if (adreno_gpu->info->family >= ADRENO_7XX_GEN1) {
 		/* Wait for previous submit to complete before continuing: */
 		OUT_PKT7(ring, CP_WAIT_TIMESTAMP, 4);
@@ -313,7 +316,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		CP_SMMU_TABLE_UPDATE_1_TTBR0_HI(upper_32_bits(ttbr)) |
 		CP_SMMU_TABLE_UPDATE_1_ASID(asid));
 	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_2_CONTEXTIDR(0));
-	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(0));
+	OUT_RING(ring, CP_SMMU_TABLE_UPDATE_3_CONTEXTBANK(ctxbank));
 
 	/*
 	 * Write the new TTBR0 to the memstore. This is good for debugging.

-- 
2.54.0


