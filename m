Return-Path: <linux-arm-msm+bounces-94267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCZVDHwaoGmzfgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:03:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD3A1A3E98
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:03:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 757583002D50
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 09:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C115F22157B;
	Thu, 26 Feb 2026 09:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KwsTHl8N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC8239A7EE
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 09:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099877; cv=none; b=k8qfDIg8SMbXbsO/sDYt782gy5vDAC9RVIKWg2bIf2lOVqLNympdM4DpO6C4+GmRFJjUDA9tt6zmv2NGq+ytS68pool6B+BaMICY5I/HAW1ZYsobAcRnz91XQC5X9lVX16q7UjGD/u99cvx/iUD1YzJ0DRUYLEz3CzJpvxFiwpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099877; c=relaxed/simple;
	bh=KgxoeE94YfnQF4YHV1zLMb8C/XWeTglGt8+KlKtwE10=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OFHt4C8UFHUSUaHkHuTGuuK+09uDYu+9UaVL4f9vB/IUjdS5A5F40K9OxC6JtPq+OsY/agF3rXFewBXiKEM+MQmoDyYGt40Zj1+y4DEIj8G5Ch/kXrp8jE8KT0O2tCEqPgyPfdg4ChPKIODpiz5xMlqgOSGh6M6xYRXSNJOHyxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KwsTHl8N; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48378e60742so1028315e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 01:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772099875; x=1772704675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CuicWvo8UINIZwVGDJGQjXx8SMx76VGu5TdPPW4dolQ=;
        b=KwsTHl8Np7OIrXAbgZ8KUGzSlDCkbOcrtti9bQu9MhMKHB3TGlcY4RdxYtKwu1IVI2
         OoDW2jeSlj3c79SgAfcSh0u/DvVMZyvkuUdk079Hja4Ny2oWLzEctCGsS9Sl4Z9ky4D/
         GQIid8kgzUz25MfPiG4Oj+kkDyCZGuNQLQXRJYTkV+V6j7hssh/d1F5PzpB0ZfvidjVt
         zxHfejtQRt9Yn+c3pV+uCz1clRyaaxv0C3g+8C3WMqG91lWyHC6CVnG83T/UEiiPYZbL
         ePyS5PWSVTRzuEGnZA0FIxBk9gHgCbwx5O5N7pUaQS9lHyNfR63Mj+2TCEXnwdEb/cpL
         6jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772099875; x=1772704675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CuicWvo8UINIZwVGDJGQjXx8SMx76VGu5TdPPW4dolQ=;
        b=Ww9fNz5QE9uc0F0SzILwJMhXdtgCLNVbAqV7sILaMkE34y5Cb2+MpTokp61ZUF0NI3
         sx0/1j7hC0SwuC0UlS2MFuURpt/WE8ldZ/4FuA0XOgZ7HwncirzZXNfCAJ/r9yMocLgY
         +ETTUfJAi3Q5v5q6c2cpMsjFGirBdJdE2H7VDATUUstRBDUHO9tA9ldBogQm1amjQ6kh
         p+X0z4SevNNyEehnXt/ctAteOjgmt/Ql2Knz//NFYkYE040mSnm++oCJENum4zML3qTF
         aeZjBNJ/E8YuCtKzxiqtUMSR/DUTBSHilA2UvCNU+LieHcqiuZqFIIJGE/gCYwAEbIUz
         9FPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJJIUNGqd1E3mvPc+foYP7QY8VeA18uBGOeTEApWHCIHFETaDrYdqaIpwmwJvAQFiL/imFiDjgOFGLamqz@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+vWK0kUxAFO2cX9izkr3l9ksHOwIm7cA/7RAx6s46xsOBKkA
	1UbnSqF5RooXV9IfTL9cO7hl7x2vqnIx9fqMsZEC20fa/KdF23vk4Cuwoyw6Mg==
X-Gm-Gg: ATEYQzzk7aVD8GOgofaWz1fqwYT4T0bIiXIFqEj2wrcBoRkH4GAFrjL+Vbj0ueAqs24
	xmUHd4ii/vVfC8LpSMddY8QE/3si3aASVeKN6SPqe/M/ZAsl3aNl/XF37L1grtrTS5eFuZv7U+S
	h0U3mtplK3iGpfCVFcnduYgY5dHb+0rX/E/MiCNyV8W5miaGhQd7OmPF31XrMJUKxCELNuzcxug
	6K1RD4O3mIOEfexbX2Fd+LLdkgjz6JEF2KfPmiQqDEKquaQeyoCmumyAtuhL8PU5en4HoznZ8vv
	Sz+OcMQTc0YtGga1VP+PDJdISPd3UMkLZDAg4NIx67xj9cvbn6VumvLkpn8jLMmwLjxFlkCb4+D
	WtMfVM0T6m8JxdjY0lqY1ySDs4V46lW0hR93VS/+GUAAxuIiMsTQN9qmhowQpPmTkG5hSsUtLhE
	H5L6esO10/arNEljhYst52F1sUoDmY3V7FSr7fDKQ=
X-Received: by 2002:a05:600c:1c24:b0:477:5ca6:4d51 with SMTP id 5b1f17b1804b1-483a95dc5bfmr209342875e9.3.1772099874447;
        Thu, 26 Feb 2026 01:57:54 -0800 (PST)
Received: from fedora ([2a04:cec0:1000:5e88:ea60:cef2:e186:48df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b84023sm34015355e9.12.2026.02.26.01.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:57:54 -0800 (PST)
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
Subject: [PATCH v2] drm/msm: Fix dma_free_attrs() buffer size
Date: Thu, 26 Feb 2026 10:57:11 +0100
Message-ID: <20260226095714.12126-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.53.0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,oss.qualcomm.com,poorly.run,kernel.org,linux.dev,somainline.org,ffwll.ch,marek.ca,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94267-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fourierthomas@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AAD3A1A3E98
X-Rspamd-Action: no action

The gpummu->table buffer is alloc'd with size TABLE_SIZE + 32 in
a2xx_gpummu_new() but freed with size TABLE_SIZE in
a2xx_gpummu_destroy().

Change the free size to match the allocation.

Fixes: c2052a4e5c99 ("drm/msm: implement a2xx mmu")
Cc: <stable@vger.kernel.org>
Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
v1->v2:
  - Fix subject prefix

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
2.52.0


