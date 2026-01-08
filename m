Return-Path: <linux-arm-msm+bounces-88147-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BE588D06498
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 22:25:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CA2430C7C0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 21:20:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B10E33B943;
	Thu,  8 Jan 2026 21:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VGeD8CwN";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="FvrdQ2l+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1C033A9CD
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 21:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767907165; cv=none; b=awBKogIf12GSjtmQeZIT/TVGcw7wt9f4i6sC1GWiggwnbt0yuhlZrPck0gzKhIbCkgznkdv39IL/IsRz0QxaURW7J8s70vfOahExaWf5AJ+4GjSNuAR26+7Lo16adRrZAqbK6StTrwisPhsMWvWh2zipYDTM+w/Ds8eA2kJxSZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767907165; c=relaxed/simple;
	bh=sZzvWmWZLBAg2O8T5kHMnq76Z89GPT7Dybdt2RJStY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sfvGWOj5uQsMpJF7R+sxKQ6MgJ8l0FkHDhXxKRHWgNANuOOotUkuSu0Oa86KEJf4gPrLHrVcJLxEJChby7h8hKipl8EmqhvGdc//Bl8zmtx+BPXXZ1/6+V+H/7ft8vgSyl6tDxurAb6CU4ZgDVM6cP92TJ0WZe6q45frIFZyl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VGeD8CwN; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=FvrdQ2l+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
	b=VGeD8CwNjNpT0+OcP3ykQYSKrIspCWtRfqcY+BA4AXnQknbKi9fE/loz3a8j3ZrZ/i4rFE
	knvpuctxGtupHVHsu/FltvM8Ses8lle1YNa8UuvnqMaGHMKwn4tR1a7t16wbORqQ6+9KCs
	F5Ac8tb3VIgumF8WcPe62EQseVwbWeU=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-4Dxj1LyAO82fuezqXxIpVg-1; Thu, 08 Jan 2026 16:19:17 -0500
X-MC-Unique: 4Dxj1LyAO82fuezqXxIpVg-1
X-Mimecast-MFC-AGG-ID: 4Dxj1LyAO82fuezqXxIpVg_1767907157
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-93f5ac349ecso3578969241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 13:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767907157; x=1768511957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
        b=FvrdQ2l+/qQk9eqw0ibjDksVpVJizL7ErXiOPWCtNZYs3v0u+sf4Ky7+9A3GpwTp8x
         xelrGuTl6Z36iZd7y8Gy9RZ573wpLlpuMjSs3LNbI48l2sbNgJVM2r3OyPnN0XZ6OXbt
         aCFAof3pKlnBQfzXCIALePBeISsJQKS1dtMlZwDZZ+SPz3n8jnFuRXfApeA5+vGPpE/C
         +AOq0c6v28wMdXGh1gzauNXuS3Ik7DaHrYILOTu7/+Z/1u2DlU8c+7PgrBc63f/Ys2qK
         KY+xuRZSVHasYduUTYRtWxADEpUhYsfMtGTmeG7utUqEQ7FZT99ZWFbm0/gT9kW9g1I2
         4OFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907157; x=1768511957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3iSY8oAi4l99NVbVblMxVH7Z37bTmCz2IXU4yciXqd0=;
        b=rahSXUqs1gFpsUwPXNC2y5Ep9rl7dWPbxcvx0vL1nQosAhQ5C4I4ywAoDtKbMZ7p6r
         vYjbSfG1go576UJlIT7la4CNPjET8eBY10J0vTYVbwAOZe5peiUrpk+iyKlyKiD7dxig
         n+aAGePBlwtNR7yMA38h0ax/0A8oycZpqWTdDLuFc9KfQQSH9YKRcfDQ0/DcN/cYnkNp
         972c8fov3DcpFp7S/gyjV0xrKFY/8L33WdQa4uxgZbNvS+1SN+ZvpCpjxluph8bXpMJu
         ufC87PjvXAoH+/SV6zHQMOCpvQJp8AxgS2tWSiMGgjKFObjdcsQ970oWKt696XXG/yz0
         B7KA==
X-Forwarded-Encrypted: i=1; AJvYcCVhxW8L8v0KVVEsSg7G9NDbU4ity2UnPaxpbtx0/2f4mx+YO6wX1KavBVpJibBU6AB9TmTNtH3lG7sc61/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YwfCj06FWPQdJe6NpcMjbnWLRUG3g/lOdeKbQjAkzScmTk+rrbz
	uotymTSjr9DSph28/bVLaXM6EiZtGn2gSYbcZbtfCwJuI80WT/WLkUh2DSe5o3ygzusaAkaZIq2
	JfKOgPAm67XWEWAp/FLJ9gIGSG2qlcLacogE2mPWtpdo8kR5R8+PGKhhW3tlUegYlUIY=
X-Gm-Gg: AY/fxX4eFMCOBAebR3Jua9BHH6ZynvD9PmtK8yZ9x3gGlcXCSkpbgjROkqCpgG2kyf+
	xT8umCOMGoM423/Vor8mPAojNeIcdkRETmfibgMHpgOjiDEuYPkNv5gciEmAGJCNM5oJyoDPHkh
	qW6amlOUeChB0dK6rhCvilCaNXG0NSVF2bm1YOqrI8BONnopB/twVggHFhJXPMU1HyAd3Y/DbiP
	7FW7h4p2zovJlWuYmW2mIfr3whBUr+B+PybseHn4zPEsV3cFvnzs4KO6RS5aT6Re3kO5M8Dh58I
	QoC/49dQPW58pIc9y3yf2E6rz7Vr9fTFB8I4qQ1lRUVAusvg4IQflSdRS6AIlnaih6BRq4C8ktB
	kNSjKdYZrQVvQlLY=
X-Received: by 2002:a05:6102:3a0f:b0:5dd:83de:badc with SMTP id ada2fe7eead31-5ecb690ac30mr2675970137.38.1767907157168;
        Thu, 08 Jan 2026 13:19:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0uRMIjA7XLKaSnU3wOhkRdxgxZI3Tqx0E2gNf3CGsOIh420QNoFs2vKVMT8dIcPxOmBSZqA==
X-Received: by 2002:a05:6102:3a0f:b0:5dd:83de:badc with SMTP id ada2fe7eead31-5ecb690ac30mr2675959137.38.1767907156687;
        Thu, 08 Jan 2026 13:19:16 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:19:16 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:42 -0500
Subject: [PATCH 24/27] drm/msm/dsi_phy_14nm: convert from
 divider_round_rate() to divider_determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-clk-divider-round-rate-v1-24-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1932; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=sZzvWmWZLBAg2O8T5kHMnq76Z89GPT7Dybdt2RJStY0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5Hb1v5vpP9/g2Zw1x0vb3l5Xs8vY4qIY9ZTV6M3/p
 vSpfvMlO0pZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZjIVyGG/znrI46vWXPXmZ1n
 evhLw6XT1O2//926j2222YecHWXuxbMZ/mm/r2e/wuzs0x9mvcteoup47ENm0fYpEwKEL07zVn7
 mzAEA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: cc41f29a6b04 ("drm/msm/dsi_phy_14nm: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Dmitry Baryshkov <lumag@kernel.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
index fdefcbd9c2848a1c76414a41b811b29e5fed9ddc..a156c7e7cea83286e7ad47aa9818761670c68e89 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
@@ -628,12 +628,7 @@ static int dsi_pll_14nm_postdiv_determine_rate(struct clk_hw *hw,
 
 	DBG("DSI%d PLL parent rate=%lu", pll_14nm->phy->id, req->rate);
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       NULL,
-				       postdiv->width,
-				       postdiv->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, NULL, postdiv->width, postdiv->flags);
 }
 
 static int dsi_pll_14nm_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0


