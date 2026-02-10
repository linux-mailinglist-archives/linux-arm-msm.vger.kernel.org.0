Return-Path: <linux-arm-msm+bounces-92433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wqcCIfntimmUOwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:36:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C103611849B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E08B3038A54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 08:36:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8D4332917;
	Tue, 10 Feb 2026 08:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QAf7PFIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1876329C6D
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 08:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770712565; cv=none; b=dhceyzDxuFETtEtbbzsbt0WxMwT9lkP+XA5HygQcYIZG21raO6sl1YeSIc4/p2qjQhs/uxzL3DePOK0iHg7Wh/sYh1jS62eOzcodw2zEaKQjEpnVr26bZk7ipt6rWRvmqSZm3XjgFwuoO7Vu9jDAdCF4MLXUTPyyvIl/BD5zyFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770712565; c=relaxed/simple;
	bh=hlVnQjJ+uSVpH3lSq9FenbGENqqQaGOkrUPuxtaW9wQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7VOFyUVsH/7cnDFl2iCz7VKx0rMHkMNMdzWutL3K0Vbb7/o5OO1QkkqRa7AFANxGSslipljrPJ+9NY6FqS9e7COD/kbOcwVgeFjzXFvAD0FnZRMlUhgy9UyPO7GhOevOp5cHE75ZFyhXhntSd3xtPKHMxpy+MepvxSKFA4tS4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QAf7PFIC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-435a51abad1so684291f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 00:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770712563; x=1771317363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p6XI8q1fFGx5WhbwxSZeL59bQVB27jLicC8f3KiU06c=;
        b=QAf7PFIC1/H7AhGpQd6JIZM4GGCsxPju72lYBiMTrnswiH2SzV+wPb82TK+PQk2wm4
         9jWcfH+/9GoPI0wfPUrS5a2hFC9f86IfHrqA0YkgxxPsvbOxkGp0+JOiJ9yGSAwFMidX
         bKsMBMIrkqb4/aJ/l3Wt+RXfhcYfPPaEYn2bICQYKmzTNQSFl+nqJ50EX+fFjWZSz6KF
         wT0bhuTR425j80VNU3bMmj3tf4OKNz8iIm/yRTWc3IKeCWfIHBMX5k7yFME0xOhE9VFP
         m4GSjB2Quns7YopgvSMedOvyhQrM/6HGgeEhl3rBFaf0hIwzlPMXx2WNJdiX/gUdiuL1
         gUcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770712563; x=1771317363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p6XI8q1fFGx5WhbwxSZeL59bQVB27jLicC8f3KiU06c=;
        b=xFzZP7Tp2Dgzbn8KTbzHsiX+Xfz7YZXe1kWSFfdAyzRblG9CnLbxV0TWE737DMUD3I
         lfcA+RkB+FCGjyodZVpiU3qyRrTIAZSCYrZQsHUXw/rsqnaYcxd/rDzq9LPeH1LQ0AJo
         hDmtNXJu1aF5vpzCmaIaWo6KTgzaXHb9w98b5BUbwiIMkqQ4mGmm7UiDqKdD4XFjSY/I
         vl29CBz1Fb6nw5XCS24vc3kzVcYEO8XOOmPWABV7HN0obxjyHXkHvlCmWSy8B9CCmjug
         sl+urxXe888y5qOYyNkVbq0v6aVt2OOsvW1vDy34XE8e/7U6OFoTvPjip7mC2mKhpCGP
         bGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnyHLqUkq1vzNqkupByJgqWHABWe3s71kvZ1Jj0OALnXc9Eb0F9hpIedz+MEhVtXPKS5hzIm1IxnHRohN0@vger.kernel.org
X-Gm-Message-State: AOJu0YzkGnDg3LTOrCB784w48fUeixkXvkjHoJp5fiXNdeBI0qldJmnA
	Ck6FVB79tetH7a1cHPweGeJ4bAJyZkQ2ECecu4O2krTxbyuK5uTPrSkY0M2BJA==
X-Gm-Gg: AZuq6aJiUYC8AQgQ0RkmGvvqbxqbXGpYTHj5xwRlCZ8UZcn3DPZJM637mwm0af8IWqX
	adBBuk58WJXKa9VIUI9oIYoLV9zaZCPuTHMPlS88IReMTRwxBY7X/5HpG+Dx3Ef0n6GvlvyUeaB
	P3FgY/NV+f5vVFIxll0Rr0jlP3zKYosLEZS5oZYz7WFdaB9mKC1kgCSddyo+Pw2t6go/gy1WkmI
	XmrO7tn97dJAiZkT9pgxwrfZ5zfx0nLdKidESv61vcGVMonUQdkTlq/UlK0QwvCucbOLpoeRg/X
	4MwyoFMPm2odt82xGmDK1IkGTXbQdnX2CLwTa5Aar0L39/o6ULHZ0jdEVbZokm4QjFJHs0ZRVCT
	5wVGxTDJlu6HQjgyvJwB9w9Xyac5eTNnsaeW0qxzj2cHCnyiHUnnIqV8FRGS3nrLSUsLlqJpvqw
	I5hJkH3llhcIlQOl4vUjsSm7WiAiqW0B1c8lDYUPQF47UMgkUkW6cTUV1DvkjtRpukkKZLd7dS+
	WaWdX/atM7nZZLxn9E=
X-Received: by 2002:a05:600c:4f43:b0:477:a977:b8a0 with SMTP id 5b1f17b1804b1-483519c9dafmr7521405e9.3.1770712562678;
        Tue, 10 Feb 2026 00:36:02 -0800 (PST)
Received: from thomas-precision3591.. (cust-east-par-46-193-67-14.cust.wifirst.net. [46.193.67.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4834d5d8ebfsm71911485e9.2.2026.02.10.00.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 00:36:02 -0800 (PST)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	stable@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] accel/qaic: Fix dma_free_attrs() buffer size
Date: Tue, 10 Feb 2026 09:35:27 +0100
Message-ID: <20260210083529.22059-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92433-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C103611849B
X-Rspamd-Action: no action

The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
a2xx_gpummu_new() but freed with size TABLE_SIZE in
a2xx_gpummu_destroy().

Change the free size to match the allocation.

Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_gpummu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
index 0407c9bc8c1b..4467b04527cd 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpummu.c
@@ -78,7 +78,7 @@ static void a2xx_gpummu_destroy(struct msm_mmu *mmu)
 {
 	struct a2xx_gpummu *gpummu = to_a2xx_gpummu(mmu);
 
-	dma_free_attrs(mmu->dev, TABLE_SIZE, gpummu->table, gpummu->pt_base,
+	dma_free_attrs(mmu->dev, TABLE_SIZE + 32, gpummu->table, gpummu->pt_base,
 		DMA_ATTR_FORCE_CONTIGUOUS);
 
 	kfree(gpummu);
-- 
2.43.0


