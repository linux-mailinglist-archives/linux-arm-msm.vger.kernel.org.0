Return-Path: <linux-arm-msm+bounces-110420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NcOAQ9FG2p5AgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:14:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A4E613310
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 22:14:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55C463045CA7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 20:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D1F2853E0;
	Sat, 30 May 2026 20:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qANfD7kr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2A21E098
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780172044; cv=none; b=NTANcnDyS10kGieTT22UD6/Ni9YF6EyN2RYikV8fE+8eoneozBYtOD/GwbZPvi3AoiCuYRpUCDiZsIcBm0pmtUhpHFmOWx68qktWYG5MAvEB0GkZTu3OmkqXnZY21mJ6HRs4hiTYaAG3FAgppLiasLrBby98+vuot7dK8Ws6WS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780172044; c=relaxed/simple;
	bh=BBwUdfSJWGqDjCkvp500eX+8L/dqyJ1xsFtphgob3zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t1IZQTy87O4FKS7S67OlroJxDayMfPgRgo9LsGjy+Zw2lBkF5h/EJaL9SjClYLFsUVFWeqFjeU0qGhJYkkF4PPQYK7KDFS+8TlcwN6r9eUeeQKZ7M3KRiRcbSjwSGm40fWzk3zRpMKCcKkFExRoZvtjZHB8GxlOio4siCpwj9H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qANfD7kr; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf30d530bdso13351125ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 13:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780172043; x=1780776843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1qf4f+BNxnhTmbM00ciJYT0JiSIbIcC/mWAQYQHmlYk=;
        b=qANfD7kr2mx9iK82UgP/yjf/Ripp6BoxKCbGkjro7h+5q3RJZwJpVXoHOLSCq7Wwfx
         du26Xohb6n1m1V8lpsW16c8+xyYD0wckZuLgDPgXgnOMUh+L4p7OGzeASsGUGwWuIZrS
         mfp8I/toVGOBg0UFR9NOB0//TsRFPlToYt2pKk7RvmLzsl84ehjdjPu9WvSU3B3+LMqj
         tkrXo0GkU4kKU93wG41CDCIdhVRHV7pYZaQH9CmpwHfYlS+fiYHq7O+ZyYforpsyBHgt
         9nN3W3VyL/DGcMq20pA/gNk3D8a4AfRipEubKhc1XA2Qou2X4UmoEkbSL/0bJ4TEzOvs
         c5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780172043; x=1780776843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qf4f+BNxnhTmbM00ciJYT0JiSIbIcC/mWAQYQHmlYk=;
        b=WDyMeCrXI6rTWY4MXgKWazVJ+B2WcPUAlt3CqHWefiPTO11YROTCoHSMfe9ztiESD6
         ikA9L7UvZ5gpeBb/WMM22/vJAfuPy36UoyDZdTGkFArYJKNHFDwK/Hh7QIG0QqfbOQr+
         GwI+QdjpNYHwEd4T8BXz09FwDi+J45IIth+sdnOh4Tc79FM/nAalUzoKKKbwC6URA7qe
         nmu1lHZFj/voL8PZ9qu3edG4ilVfMRUBhEhUbLWHEU8W6h9O62bfAnmWXNlMicJZniO1
         kk7Gxnoba1IH1r6J4yYrwJ80b/TAn+2u3k66z3b7wmVCTfBpjpF5q+I8NRmtgQBK7ta9
         jI+A==
X-Forwarded-Encrypted: i=1; AFNElJ8/vNzsgVkD+G9RmGE6D0PunNJd57uVvYQdL+FctNT79roEj6rR1PmLkMu8MnAIYImQdzFpQ5L9eS2K6oqj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq6C3WLQIrTQENMMyB2LlxA6Bqv/JNMJMaORLaRiPZalaL5NZh
	ZhGS/N4Tbk2fjBHpI2ADa7wujoKWbehSW5SkDcV+ABOTzlu3agI2l1eI
X-Gm-Gg: Acq92OHjIVNbD2GKx6Yfc0YA5TaUK98btyZutAzcvGFFs8kaO5H4kv/DnXXbEH30gVA
	FreRGfCPBu/vcY8jWFCa8t9xsfj32XJ3u1Lnk8FllK9aeRlFy2lsg6CrCB93vXGMvS9i44Yt3k7
	ESJY+5T+H7CLBz7rXyLuVvznb+8yg+onFB6lwcNrOiC4sQtiBWGnrgBrHxsB2Sek+2Lq2Sc+slT
	1EZRv9O1PU+y55H7/CGZlzoQsy/ZIDAN4NMIlQnyeyi9n5WCQvYJullUc53HDXw7gURLSEAdd3k
	I/NTH1zaOp7hv+Reexz+eHxDTyVblLcvvleb4C7QoXPFmC3K+gRp0xuwPm1NNYga93il5pGk6jg
	tvQIdHFJAFtqQeMWyXoDvyzArXeLMh60l446myJRurx5FblnTw6RbZa+4FI+yD2/27tbWnAx05v
	gCxGIlva34dnbaGYYU5jHxkV36uoxOOwbKTWo9hkbs+jZXtnFHdH83z51mKrVgH60b8hHTZrtdd
	I0Kq/PMjg2qqFjC4izlMCcG22d/vxdcul4QvEEN+n58ag==
X-Received: by 2002:a17:903:41ce:b0:2c0:bcff:e198 with SMTP id d9443c01a7336-2c0bcffe31cmr14256265ad.41.1780172042762;
        Sat, 30 May 2026 13:14:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a10165sm54712715ad.31.2026.05.30.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 13:14:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org (open list:DRM DRIVER for Qualcomm display hardware),
	freedreno@lists.freedesktop.org (open list:DRM DRIVER for Qualcomm display hardware),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: fix parameter name in dpu_core_perf_adjusted_mode_clk kernel-doc
Date: Sat, 30 May 2026 13:13:42 -0700
Message-ID: <20260530201342.10538-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-110420-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rosenp@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 74A4E613310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The kernel-doc referred to @crtc_clk_rate but the actual parameter is @mode_clk_rate.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 13cc658065c5..2ff255d7795e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -34,7 +34,7 @@ enum dpu_perf_mode {
 /**
  * dpu_core_perf_adjusted_mode_clk - Adjust given mode clock rate according to
  *   the perf clock factor.
- * @crtc_clk_rate - Unadjusted mode clock rate
+ * @mode_clk_rate: unadjusted mode clock rate
  * @perf_cfg: performance configuration
  */
 u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
--
2.54.0


