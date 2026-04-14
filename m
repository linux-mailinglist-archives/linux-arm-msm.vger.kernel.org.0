Return-Path: <linux-arm-msm+bounces-103157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEY8KRFd3mn7CQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:28:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9AB3FBD58
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 17:28:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EAD1C307C7D5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 15:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4DD3E9590;
	Tue, 14 Apr 2026 15:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GtAYT0m0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122683E715C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776179677; cv=none; b=HNRGEdc/8GzsXrZttP1yi1DgYgEgxJMyTxpebdfjkVezQjE/ukMMOjqgu2sEocWdVMDUQv1kAHAV2QlQVChIY2amrEEkkP3h3/ITdyuDn72k+Tua0Af+dIO7aIOjNESw2YgdNLWNFdUOGX/IF2tLrdJXAseuFQm93hfTzRxrC6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776179677; c=relaxed/simple;
	bh=daNW5uhl4d69yIZFZewRQFFqst7fvn+JOIJGQIVovjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Vb1GzgqfKu1/nZGXRDfTqeQ2DCPxqcb6cMtKn50CO15fV3HxxVrko5Ul+0KgTbz8gez5/7CeKW1JCodcTxSp+ijLCDlnaRvI9G7w9Dl19FI4Q21VLSHr6NNbmmxa4G3HcHzxQolncNfXnn/xmKYtSW9IjIvBb2Y84pZY/kGgnqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GtAYT0m0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7a5e77b1so1364103f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776179673; x=1776784473; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TOwZpBzYvLqLifJr7F7A9849bw8ux30LzyeD+wX4bPE=;
        b=GtAYT0m0cS0xh2do8xawSDGnFdYRU2vb/fdDroi4NwvbHYaWVCa4LW1zNw5fOqQ5vg
         A20KXvElXQ63ipaFNapE+Op3K6Gz/3DEmn9rInkHIJbzCYZHt+3b9O2D336QHcc7DR7e
         slWyoi+lAlVv1w2QgstrWAror5oePjYPxAxNnjclgt1bkMnwAmhy7FI6hRpu3wupbeeq
         bkSJsU+bxwRuPWONfupF36qhbDxnJyYngmA7tYShXObufCiEK14Neb1RY+PebN1NnqFC
         zxq8LKz1vD1VRj5B/KTZ2T968ClY7yfxqsFG6EUdoJCa2GJlU/9+0EZKxRnZCcQGVmdc
         iQTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776179673; x=1776784473;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOwZpBzYvLqLifJr7F7A9849bw8ux30LzyeD+wX4bPE=;
        b=ETwhY1mNT4tmzM7mcVpKGmvdlQYknaQa/MPbpWs7/sU3iTQcZV+q2mx0nP8nSZsOPD
         N9++2cE2zTV/F/Js5KQLJQ/e8LOJMH4X0SdQesCqIrhQPWW/yC7+9fWeMhMzAM70skcQ
         7S4EEZ8u6xjKMw4UmDfQZOm7MvuTn+a50xNEiGbdxQRqhwaRLzpp7Oqk4R9Q4UnDY65j
         BVuNjnwOOMl0wuxSVWTmfPKVPYwGngDFOsobe8H2qkz9MT64ZvCNuNypeLg1UMkjqNEb
         OF51J5p5cDDA2y9B3pn7kw4UxOuffa6BeaUUTAvuvvTIPvz4fQAyxZeEcpR0etIfs2RM
         /4/w==
X-Forwarded-Encrypted: i=1; AFNElJ9Ftol2z6iX1CArm9CSkMq34UySRJwaS+tY9iQkDkjhSA9sByC3a8ZAVVFxmPAm5Qotphjq+GV3ycyWbKQL@vger.kernel.org
X-Gm-Message-State: AOJu0YyKEQzuFzYMKgAoL6abnjbE1Euwxi+Qj/eho4IEQb1DGryjcE3b
	wiYjT9EPutzeACFdKSQ0xZnE5gP1GUoIEvYVCdvD6vXbIE6S719U2+6rpssLrdv/yQY=
X-Gm-Gg: AeBDiev1CpjYDJ3QdQnE9Axd3mm3CC/Mzx/DZL62HTMCbLVsg0dxGU5Uopj+9dJRJEG
	VpJ158/bROsV6R8zEvEDIMSSObK6T02PEwsCUc9N+jEvNbFYKjcUM2fdFnof0ZeXrYjuJVxk938
	NR2ebioOzE1yPK16AlGm1MNUbstTkGszD1TY7KGpq0cH/+Apm+3w2AzIRfB45JycoNVvAKaure5
	QzTA8bCRHlVfqIbTMGPBZ8nKz+2L34uOkfS6cfw8s250HuX2K65Zcai2pn2/rYfDPWzv4d1zJeI
	C3RH9RNGjLPDgu1tLbsbmoHEbvlE7Q2AReKvxIPkL/E13EiA6bqaT8p0ywraBRgmBmTveDmaki5
	UJe4RvFpLj1o/ZDlITHc7+Y/kJ83+RRB/9RkObwg733OI21i4aT9xH5f7J3vVqzj13mgYwKk/0h
	1kmJpJqkYS/RE7QEkccvXAB7x1TOML5gC2yjStKJCU0bwEOc7kyOs+2dM=
X-Received: by 2002:a05:6000:2b09:b0:439:adc3:f0e7 with SMTP id ffacd0b85a97d-43d595734admr20994466f8f.9.1776179673287;
        Tue, 14 Apr 2026 08:14:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d6f4bf2b4sm25956011f8f.20.2026.04.14.08.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 08:14:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Apr 2026 17:14:30 +0200
Subject: [PATCH] drm/msm/dpu: fix UV scanlines calculation for YUV UBWC
 formats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260414-topic-sm8x50-msm-dpu1-formats-qc10c-v1-1-0b62325b9030@linaro.org>
X-B4-Tracking: v=1; b=H4sIANVZ3mkC/yXNQQ6CMBBA0auQWTtJB0HAqxgXpR20JqWlUwwJ4
 e5WXb7N/zsIJ8cC12qHxG8nLswFdKrAPPX8YHS2GGpVX1RDDeYQnUHx/dYq9OLRxpVwCsnrLLg
 YUga7fjwPNOiOWgulFBNPbvtdbve/ZR1fbPI3DcfxASTMqpeHAAAA
X-Change-ID: 20260414-topic-sm8x50-msm-dpu1-formats-qc10c-78b3919a715d
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=daNW5uhl4d69yIZFZewRQFFqst7fvn+JOIJGQIVovjQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBp3lnXjyuO16e83pIqkj/ZpFIanlemWzuLSHOdgp0m
 eYSOaNyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCad5Z1wAKCRB33NvayMhJ0VRWD/
 42Ak2UHmBvvxPgf3HbVUpdXbs402uEX9kpFKXcY6YabdjNXKa2NLiSJ2zw3IyM3PN1jBfaJ6QgiDRY
 SzW13IVEVvaiIcroZvqG7dLF/k42Lc9uMbdDOHv4Cgw76Pj6q5oyma9kGa2bUmhobknqEMdnBeTBLU
 S3fwoTrXnBEYaNPUI2Uu2McTnn0fttzhQwyg012v/fdqY2Xwed5WBzWIQuCMx/WwZnD7+knGiyBpg8
 P8NWukq3FwqTdxXe39jFCYAq0fv6M5Qjdubnr7oeQSl3B3WNEl9fejybPrfCFkhWrwUlcHXwbzzm6k
 ECh94yq+U2i4B1qm+Sc/+/j46zGT6uyWc/iG8acUzNdpUqN0j8yZCu2YE5ZV3NN0uvXuR6TkdfWqmo
 qzrMVRZEVWP+mfWhfIH1dGz389IDXO0v6vfOF4xrOtMxMQpodtZJhKiw3T38jZePBL1U7fVR8LwPuW
 1uuQ02EMLNErtQOKbOVUqtsRAjUn385xlYLEZlGwyTG3lOjTg+ABmXhqLqT7+TwoW66/R8onwmpn/X
 WYBc9ZBjtq2ZmhfrOz60V9gVDQDhisOSe4qtVT8JEP4eglJHDNg35j2TJvILIwniHtgzssFV7j6pAh
 XWc3gjKguvh/LUaQyP9s0TvhTdnESILpRc+UyKjOSZQm+JqdwSJMfWfDfyHg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103157-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5F9AB3FBD58
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The UV scanlines is calculated with (height + 1) / 2 unlike
the Y scanlines, add back the correct scanlines calculation
for UBWC YUV formats.

Fixes: 2f3ff6ab8f5c ("drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()")
Fixes: ada4a19ed21c ("drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index 6e8883dbfad4..590922c4f69b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -61,7 +61,7 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 	bool meta = MSM_FORMAT_IS_UBWC(fmt);
 
 	if (MSM_FORMAT_IS_YUV(fmt)) {
-		unsigned int stride, sclines;
+		unsigned int stride, y_sclines, uv_sclines;
 		unsigned int y_tile_width, y_tile_height;
 		unsigned int y_meta_stride, y_meta_scanlines;
 		unsigned int uv_meta_stride, uv_meta_scanlines;
@@ -77,23 +77,25 @@ static int _dpu_format_populate_plane_sizes_ubwc(
 				y_tile_width = 32;
 			}
 
-			sclines = round_up(fb->height, 16);
+			y_sclines = round_up(fb->height, 16);
+			uv_sclines = round_up((fb->height+1)>>1, 16);
 			y_tile_height = 4;
 		} else {
 			stride = round_up(fb->width, 128);
 			y_tile_width = 32;
 
-			sclines = round_up(fb->height, 32);
+			y_sclines = round_up(fb->height, 32);
+			uv_sclines = round_up((fb->height+1)>>1, 32);
 			y_tile_height = 8;
 		}
 
 		layout->plane_pitch[0] = stride;
 		layout->plane_size[0] = round_up(layout->plane_pitch[0] *
-			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
+			y_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		layout->plane_pitch[1] = stride;
 		layout->plane_size[1] = round_up(layout->plane_pitch[1] *
-			sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
+			uv_sclines, DPU_UBWC_PLANE_SIZE_ALIGNMENT);
 
 		if (!meta)
 			return 0;

---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260414-topic-sm8x50-msm-dpu1-formats-qc10c-78b3919a715d

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>


