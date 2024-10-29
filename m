Return-Path: <linux-arm-msm+bounces-36321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9F49B4F47
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 17:27:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF5051F23E7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 16:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0CA1198E99;
	Tue, 29 Oct 2024 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVgt2tuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com [209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165A41990CD
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 16:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730219227; cv=none; b=e0EOwyIj7wpFPAU7tZlZMmnxiHEFJ/V/fP0fy2/WdYaToxJUPOmYvhGtzjyHk5PSq2Je1NfNmWtIpT0Zw8YdIZj0ZbxA+7rN6t76CPYCp+UqbkYrWBY1DsZXVOcRoPtksL6CBCkIZBlkUZwNnde53W9XHvZu5S/m/CNnvuVODH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730219227; c=relaxed/simple;
	bh=0l9WGTa/vsPDeiZqcJReb2S8Ek15S7cTEhnTTMAMJSI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h0xTIxSkdEM6YZgOsSKDv14ndcPQ+L+xYftYLuJor4RxU7ejH6C7AB09v/o8y0+V8+qF1Y/60L5oeMXzbC2tzQsxoYety2zqgqxCg47FJ6XR5ulBZXQOiNURXmrXC9QppgwiMfs2ZNYejnqbJPAtQDnQSGCe824CgoBeEWyaeFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVgt2tuG; arc=none smtp.client-ip=209.85.166.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f66.google.com with SMTP id ca18e2360f4ac-83b2a41b81cso104606439f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 09:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730219225; x=1730824025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASoQSKASN9QgOSddChzWC0ph+ezd4/BJV7Zk4X4XopE=;
        b=dVgt2tuG7cPOSlcM5gqs1k3R3+Yn17SbrOa4DutxhPUtKD69gSguMmqSD3WyM5sM+9
         srGnM0xtDKy4KmjPAEsKQnWR5gAkP2DHvX1TcjScQcUVYapEBkPeQen2Fnd+u8HE+a1e
         sT0IbeE8YnKQPzmLohCzjvqq9B3HElVQV8jOHjH/4opY2lcrj9V2wZh7F53cZs6MwUyQ
         E0hZ4dg5uubrD+OGWmONRZNFPwUT+KqQjkKXCtKWXWhq8m18vv913ZxBkA/r70kiI12k
         8++d877bbZStx6rbHR4Ge7IuOvYt5TqVGWPTi2ClEwojZmN9INyV/yquCAXG7iKmX5k0
         G9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730219225; x=1730824025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASoQSKASN9QgOSddChzWC0ph+ezd4/BJV7Zk4X4XopE=;
        b=okCqjD2zOrjuNa8g1gqNLmfcIybqIzGJAiitmcAeKQfOixqJjCD0Q4ryAG+H6U3ZtB
         QnfpWfkqi7rQbSBNu6qsNekhYFAQ3vud0KocFIYS5gmpl4gYzMS64N1KerGsqHrLjiS/
         JB9+AZrsvHqWBgr6BMfRP5KPrcQCboDQ/B6lB1ktqLsf3C1IRyP7EwOjZbldllWdsXpP
         lDJXvSLl7mNsK7srugt8hgSBFiMr4ht2uZz5n42QIyDH41lrr+A9JV7KVeQZ9QCvpVsL
         1UwN4O4zwDC+fBZHYp0ewJankn85/7Yvtu6gw1gkb2Jvxf2v62eT4CFuwkrPtz1tZI/E
         Kz5g==
X-Gm-Message-State: AOJu0YyXUf2d8PfENrAtd61/CLpt5lFA967oIQLNlDVHhJiDqopqbDLf
	5oatyJg6KnBciua3fWXISd60ziYKvJg/xajgluL2/gDIAnpxa8hd
X-Google-Smtp-Source: AGHT+IEvtrNyNDg6roCPZ2SrcBJ3nsv+OgsLL9PX+PAZYjyDrP9VBVQKmfssIDDcJKdr59gYLOKekw==
X-Received: by 2002:a05:6602:2d87:b0:82a:a949:11e7 with SMTP id ca18e2360f4ac-83b1c4a9226mr1210900539f.7.1730219225039;
        Tue, 29 Oct 2024 09:27:05 -0700 (PDT)
Received: from localhost.localdomain (host-36-25.ilcul54.champaign.il.us.clients.pavlovmedia.net. [68.180.36.25])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc72751513sm2499769173.108.2024.10.29.09.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 09:27:04 -0700 (PDT)
From: Gax-c <zichenxie0106@gmail.com>
To: robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	quic_kalyant@quicinc.com
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Zichen Xie <zichenxie0106@gmail.com>
Subject: [PATCH] drm/msm/dpu: Cast an operand to u64 to prevent potential overflow in _dpu_core_perf_calc_clk()
Date: Tue, 29 Oct 2024 11:26:46 -0500
Message-Id: <20241029162645.9060-1-zichenxie0106@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zichen Xie <zichenxie0106@gmail.com>

There may be a potential integer overflow issue in
_dpu_core_perf_calc_clk(). crtc_clk is defined as u64, while
mode->vtotal, mode->hdisplay, and drm_mode_vrefresh(mode) are defined as
a smaller data type. The result of the calculation will be limited to
"int" in this case without correct casting. In screen with high
resolution and high refresh rate, integer overflow may happen.
So, we recommend adding an extra cast to prevent potential
integer overflow.

Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 68fae048a9a8..260accc151d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -80,7 +80,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 
 	mode = &state->adjusted_mode;
 
-	crtc_clk = mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
+	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
 
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		pstate = to_dpu_plane_state(plane->state);
-- 
2.25.1


