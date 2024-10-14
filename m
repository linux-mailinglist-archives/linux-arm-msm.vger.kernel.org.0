Return-Path: <linux-arm-msm+bounces-34355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C6299D4CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:37:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F29251C22C8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 16:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35C5C1AB525;
	Mon, 14 Oct 2024 16:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cVhrqnpb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2A175B1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 16:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728923856; cv=none; b=XHdeVBMbpolrKhyGvJONb8280qTds2Sa96AZcYzE9evSkdNjF1nLucR6sY7ehhsbGM/Saft6zP8gbvs2sioZMQL0e78LFwt34nxqLymAEb/PZYbpHMbR33mXPcnRVZQ1lXp6tBAQOlmyWnTHKdjVkZqnANIeWLibnUYR09kH3B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728923856; c=relaxed/simple;
	bh=bTtG4MB3yjrdSPMsQ2e3jywBt+U40h9Vr1j3XOPrBNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UXQmhIU+2gFwESxgOkgXbS1hrL37peKEUAFvazjFzdX8HsIgS8qZx3FOMDb/M2c5kOkVilQXO+bikMX+Wohjb96RGfcDr3TjICKQC7YxJgWRGp9HdaTsrPaRwKfZZ/SfDrwLIqJiN54hz8tZ15Rmd97vR7BNqZZySKMO/+zcW/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cVhrqnpb; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-71e6f1a5a19so470792b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728923854; x=1729528654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Eq6RmtQgXylpaIuQSD/eFivfyV/YbUHAedXEkzzSSXc=;
        b=cVhrqnpbKclAuARyWtF73cvf6JxI6cb5Oal04gv5+1y3HofmxXUZ66xOdXJFwoaaL2
         LurlygUEHq922C31Mw36x8UxXZShejvxwOFvD8F3MxMcrQTRhyaAcZYPHaZKsbtZ3DSc
         W/hsR8r/ElkhXQvAYnLSEE/MuPpaGpjarGESc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728923854; x=1729528654;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eq6RmtQgXylpaIuQSD/eFivfyV/YbUHAedXEkzzSSXc=;
        b=bJG0if06zL4PF0Vq158yMQq6KbnNvbDEeq0zip5dhUjN2Y3bsCjd6PiUaUwCvdNBmO
         qf4lLRvoGqssRo1GM5CaUTFZuHBtQzLXBkWx2K8kooe8EI7ufX64o6CoSaSEnHzTs7GN
         9xDm6PTMQqZ4EHSzXty55qz0wykkbm/BNxCePTiYHnJp4LO7mCmAxSIKDQpxujhwYEyQ
         NvViWhFggbSOIjAkzGIrlDzJ3Qi+2369eriE4gc+mpKwQtTQk41+ndfBHyGbFjAt/67x
         Ra/rTOrH9Pb8L+DGbgJj39cZmuk/YOaoF1UHsPkKRMhtKNfAmbNZEc2/m5ZqKTTvGxEG
         BdYA==
X-Forwarded-Encrypted: i=1; AJvYcCVoCvWOuKpYmiqICxiy3/dsV1k8itvq1M7/n2yPz55ixMfnkU7/mY7Ruwkriwn3cByK0TMUYs8w0mqklsRt@vger.kernel.org
X-Gm-Message-State: AOJu0YzbozjJFRutddM7FoGNZ03pr4LQ+u/JHukT2rTsB+/vtQwOXgr6
	K8rtyaHjNGc31NeDaXU7Y+psJpXKPeYiGBLxCpRGxHVhTCyWH1J1gtvV3LsH2A==
X-Google-Smtp-Source: AGHT+IFrI6AyFlAD+rPt6sq8RJjzjcPvxnHIHU5bh4fmZllt0MuEFWzqp3sZJTWGMBx/myacl4Lxew==
X-Received: by 2002:a05:6a00:9282:b0:717:9154:b5d6 with SMTP id d2e1a72fcca58-71e37f4ed89mr19746704b3a.22.1728923853741;
        Mon, 14 Oct 2024 09:37:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 09:37:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] drm/msm: Avoid NULL dereference in msm_disp_state_print_regs()
Date: Mon, 14 Oct 2024 09:36:08 -0700
Message-ID: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the allocation in msm_disp_state_dump_regs() failed then
`block->state` can be NULL. The msm_disp_state_print_regs() function
_does_ have code to try to handle it with:

  if (*reg)
    dump_addr = *reg;

...but since "dump_addr" is initialized to NULL the above is actually
a noop. The code then goes on to dereference `dump_addr`.

Make the function print "Registers not stored" when it sees a NULL to
solve this. Since we're touching the code, fix
msm_disp_state_print_regs() not to pointlessly take a double-pointer
and properly mark the pointer as `const`.

Fixes: 98659487b845 ("drm/msm: add support to take dpu snapshot")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index add72bbc28b1..bb149281d31f 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -48,20 +48,21 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	}
 }
 
-static void msm_disp_state_print_regs(u32 **reg, u32 len, void __iomem *base_addr,
-		struct drm_printer *p)
+static void msm_disp_state_print_regs(const u32 *dump_addr, u32 len,
+		void __iomem *base_addr, struct drm_printer *p)
 {
 	int i;
-	u32 *dump_addr = NULL;
 	void __iomem *addr;
 	u32 num_rows;
 
+	if (!dump_addr) {
+		drm_printf(p, "Registers not stored\n");
+		return;
+	}
+
 	addr = base_addr;
 	num_rows = len / REG_DUMP_ALIGN;
 
-	if (*reg)
-		dump_addr = *reg;
-
 	for (i = 0; i < num_rows; i++) {
 		drm_printf(p, "0x%lx : %08x %08x %08x %08x\n",
 				(unsigned long)(addr - base_addr),
@@ -89,7 +90,7 @@ void msm_disp_state_print(struct msm_disp_state *state, struct drm_printer *p)
 
 	list_for_each_entry_safe(block, tmp, &state->blocks, node) {
 		drm_printf(p, "====================%s================\n", block->name);
-		msm_disp_state_print_regs(&block->state, block->size, block->base_addr, p);
+		msm_disp_state_print_regs(block->state, block->size, block->base_addr, p);
 	}
 
 	drm_printf(p, "===================dpu drm state================\n");
-- 
2.47.0.rc1.288.g06298d1525-goog


