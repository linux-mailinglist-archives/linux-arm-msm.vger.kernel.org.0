Return-Path: <linux-arm-msm+bounces-34357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3253099D4D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 18:38:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB5028215B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 16:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B9F31C1ADB;
	Mon, 14 Oct 2024 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gO+wrm3+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D9A1BF7E8
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 16:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728923860; cv=none; b=jQ8SbVmt/z0b4m0WG/aNOVdM/QD3KPWMyzN31e79jQLRLSTe4LXkKVbT6escxs7W6dOWxbzg4tQan47xi0n0cjEru3MV9nmGXDljcVoPoHxeSdepZIgCOmR9pK0u9yimOCRRQhiuFFnkWpC0mrhol+U+x90rmFLdmmsjuS2yyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728923860; c=relaxed/simple;
	bh=idzxZir+2Hfx66wZzXdoO5vCmyD32OzgN5agHfHyqSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MgZ8LfYqBHFhXWBMkMI04V1l4KtSjIJSGFOW5Vj3+R/4+9V+1HX83Nwl0bYVTpSObHdOOBVXdVQ7iGUOPcQuHf+griuYyiLvqPJkNo8TmFPsilFuR5qrHsH7NvKawRowwkK3ZM94alPTEC6+fkOCXll0Ln+e1wD2ZPvs0TSBWCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gO+wrm3+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so395003b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Oct 2024 09:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728923858; x=1729528658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVGl2ftbuqqnUqeIL1a1bElRQ/ry6hMTlQBnPSxP8Dk=;
        b=gO+wrm3+Vydx8j/CFtfxG7Qi+6tq+Mei4x2pFlSHkhmj/65i4na9W05dsV3hUkbrYi
         JMJzvDDlz19HqzALzl9Ou1AowCbsCT3BacsQxNg/yP7/HMb1uI1/3NJd5YHbomxA6GSY
         UbC75cb+BVP9Jam14rHp5B3I+2armcGj1NmaE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728923858; x=1729528658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVGl2ftbuqqnUqeIL1a1bElRQ/ry6hMTlQBnPSxP8Dk=;
        b=Nww8i7eCHvLr9EHmHazJcLzAIZI7rmBcUZkup4VqPwA2JK496xr5kut9UeZn+pj944
         ydMGGeJo4mdA6supHebhtt6JRLt45j/GKJFDPG4GY+ZJOWXsEFIUDCF29YbjFmt9DBOO
         OKJF5aRRZ5aZbz0ChF3Ok/+gj8t9TzJkLCEzqsEpVpWEjlXrEukMyBM30HCriTUX89PA
         o9a5ZgfcWCxTRTGfA6rNstw5oKV7yvmmctBmYp+onWtp9gf+gvPWBOBL4NFnVSBheQdP
         0Rz9OzqPqhiT+9XL6iDLdYc9dsUKt7JgIeMD55DndDUwMKU9XOyfH/28XHWIGmgR//bF
         WLMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvts7VfZ54v7PkWuDJza9HhNvaxwqSEyKw89T4lwqDdlpO9QgJr3sgNClzGVD30TqBsiaXBJ0+23E3cc99@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9yCNxII3cPFXEe16cQhpTlOLgjWgblsCbep3YgiUnkOHwLBiP
	cwwVYtuOzJdSguvBrIIQdqVQoPGiqX9N7JPZNPX+zCQKL4qeMsyTnX5Tzq4eKg==
X-Google-Smtp-Source: AGHT+IEguS+DYgfr50X3amlVgerOKKT45qvqYFP4etgOkkRvUpQ1dDg9fKu0+t5LQwDSWp3K3ICKxw==
X-Received: by 2002:a05:6a00:4652:b0:71e:4c86:659a with SMTP id d2e1a72fcca58-71e4c866d72mr13703071b3a.9.1728923858137;
        Mon, 14 Oct 2024 09:37:38 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:1e71:8a09:a3b:1e00])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e51dc0617sm4383693b3a.165.2024.10.14.09.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 09:37:37 -0700 (PDT)
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
Subject: [PATCH 3/3] drm/msm: Simplify NULL checking in msm_disp_state_dump_regs()
Date: Mon, 14 Oct 2024 09:36:10 -0700
Message-ID: <20241014093605.3.I66049c2c17bd82767661f0ecd741b20453da02b2@changeid>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
References: <20241014093605.1.Ia1217cecec9ef09eb3c6d125360cc6c8574b0e73@changeid>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The msm_disp_state_dump_regs():

- Doesn't allocate if the caller already allocated. ...but there's one
  caller and it doesn't allocate so we don't need this check.
- Checks for allocation failure over and over even though it could
  just do it once right after the allocation.

Clean this up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 4d55e3cf570f..07a2c1e87219 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -25,24 +25,21 @@ static void msm_disp_state_dump_regs(u32 **reg, u32 aligned_len, void __iomem *b
 	addr = base_addr;
 	end_addr = base_addr + aligned_len;
 
-	if (!(*reg))
-		*reg = kvzalloc(len_padded, GFP_KERNEL);
-
-	if (*reg)
-		dump_addr = *reg;
+	*reg = kvzalloc(len_padded, GFP_KERNEL);
+	if (!*reg)
+		return;
 
+	dump_addr = *reg;
 	for (i = 0; i < num_rows; i++) {
 		x0 = (addr < end_addr) ? readl_relaxed(addr + 0x0) : 0;
 		x4 = (addr + 0x4 < end_addr) ? readl_relaxed(addr + 0x4) : 0;
 		x8 = (addr + 0x8 < end_addr) ? readl_relaxed(addr + 0x8) : 0;
 		xc = (addr + 0xc < end_addr) ? readl_relaxed(addr + 0xc) : 0;
 
-		if (dump_addr) {
-			dump_addr[i * 4] = x0;
-			dump_addr[i * 4 + 1] = x4;
-			dump_addr[i * 4 + 2] = x8;
-			dump_addr[i * 4 + 3] = xc;
-		}
+		dump_addr[i * 4] = x0;
+		dump_addr[i * 4 + 1] = x4;
+		dump_addr[i * 4 + 2] = x8;
+		dump_addr[i * 4 + 3] = xc;
 
 		addr += REG_DUMP_ALIGN;
 	}
-- 
2.47.0.rc1.288.g06298d1525-goog


