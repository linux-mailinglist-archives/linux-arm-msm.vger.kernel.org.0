Return-Path: <linux-arm-msm+bounces-334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE6D7E6F03
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 17:37:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A75528106E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44DA22375D;
	Thu,  9 Nov 2023 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Sp+r3h8s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2726225A5
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Nov 2023 16:37:42 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E003840;
	Thu,  9 Nov 2023 08:37:42 -0800 (PST)
Received: from benjamin-XPS-13-9310.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0EA2B66076A9;
	Thu,  9 Nov 2023 16:37:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699547861;
	bh=GMdrS9H73jEXIx3NI8elWR0CS7o8SzXLjp+XU4A5h/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sp+r3h8s/RGpyXGZiS9XR0J7Ap4gS7YYgP3zGz8sCUWO6HvaiJdHnswvVnn8im5Mn
	 NQKAT3pvKigJz4cOm9XToadxJunpggXfZMFV8kO2NysCupJzoqPTe6+L9pQipxFbHC
	 2tuB5RgHdsJUD7bzSjNuUUBUyMABRwrtiVB4Yvq08LszRcA9X4QJJqLl/WPes+mVqT
	 fwGAo8TmFqFhoCgEbIqPVO8fb5XojLeC10AuoF843QrwrK1C5M5Ftd5t7YywLyrF3+
	 Ntx0Kzn17bAMOueZyb0IJUqGc3DfjF5BCEdJEfl5DMyMXQt1RxLTnocHeTZywjV1Og
	 +R6g0BmOgr3AQ==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v15 15/56] media: visl: Use vb2_get_buffer() instead of directly access to buffers array
Date: Thu,  9 Nov 2023 17:34:31 +0100
Message-Id: <20231109163512.179524-16-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use vb2_get_buffer() instead of direct access to the vb2_queue bufs array.
This allows us to change the type of the bufs in the future.
After each call to vb2_get_buffer() we need to be sure that we get
a valid pointer so check the return value of all of them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
CC: Daniel Almeida <daniel.almeida@collabora.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 drivers/media/test-drivers/visl/visl-dec.c | 28 ++++++++++++++++------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl-dec.c b/drivers/media/test-drivers/visl/visl-dec.c
index 318d675e5668..ba20ea998d19 100644
--- a/drivers/media/test-drivers/visl/visl-dec.c
+++ b/drivers/media/test-drivers/visl/visl-dec.c
@@ -290,13 +290,20 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	for (i = 0; i < out_q->num_buffers; i++) {
 		char entry[] = "index: %u, state: %s, request_fd: %d, ";
 		u32 old_len = len;
-		char *q_status = visl_get_vb2_state(out_q->bufs[i]->state);
+		struct vb2_buffer *vb2;
+		char *q_status;
+
+		vb2 = vb2_get_buffer(out_q, i);
+		if (!vb2)
+			continue;
+
+		q_status = visl_get_vb2_state(vb2->state);
 
 		len += scnprintf(&buf[len], TPG_STR_BUF_SZ - len,
 				 entry, i, q_status,
-				 to_vb2_v4l2_buffer(out_q->bufs[i])->request_fd);
+				 to_vb2_v4l2_buffer(vb2)->request_fd);
 
-		len += visl_fill_bytesused(to_vb2_v4l2_buffer(out_q->bufs[i]),
+		len += visl_fill_bytesused(to_vb2_v4l2_buffer(vb2),
 					   &buf[len],
 					   TPG_STR_BUF_SZ - len);
 
@@ -342,13 +349,20 @@ static void visl_tpg_fill(struct visl_ctx *ctx, struct visl_run *run)
 	len = 0;
 	for (i = 0; i < cap_q->num_buffers; i++) {
 		u32 old_len = len;
-		char *q_status = visl_get_vb2_state(cap_q->bufs[i]->state);
+		struct vb2_buffer *vb2;
+		char *q_status;
+
+		vb2 = vb2_get_buffer(cap_q, i);
+		if (!vb2)
+			continue;
+
+		q_status = visl_get_vb2_state(vb2->state);
 
 		len += scnprintf(&buf[len], TPG_STR_BUF_SZ - len,
 				 "index: %u, status: %s, timestamp: %llu, is_held: %d",
-				 cap_q->bufs[i]->index, q_status,
-				 cap_q->bufs[i]->timestamp,
-				 to_vb2_v4l2_buffer(cap_q->bufs[i])->is_held);
+				 vb2->index, q_status,
+				 vb2->timestamp,
+				 to_vb2_v4l2_buffer(vb2)->is_held);
 
 		tpg_gen_text(&ctx->tpg, basep, line++ * line_height, 16, &buf[old_len]);
 		frame_dprintk(ctx->dev, run->dst->sequence, "%s", &buf[old_len]);
-- 
2.39.2


