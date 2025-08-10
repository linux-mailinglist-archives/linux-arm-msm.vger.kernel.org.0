Return-Path: <linux-arm-msm+bounces-68246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E177AB1FCFC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 00:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E11A9172D35
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 22:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B9B2D5C9F;
	Sun, 10 Aug 2025 22:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RjTmiGNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E02D879D
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 22:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866687; cv=none; b=eaw9rsfZZHo7RSikGb7dfhWQkAtYFls6cuizaogY9dFBYuMn7cuT0stNRnBkXO1Siv0tEdvC8bzKK9Xc11v7tS1r0CBtSBswN4O7beVLSp+TXBdfon4Nl6mQQUMeQ0GWfO4M6qFJ/JtRuWhcC4IIgNQyyJ5DVNPlC2kkAnBaRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866687; c=relaxed/simple;
	bh=TCVYIFivGNX+30I7CcW+hQ/ILyWbQUzfCulxzbwFiso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U735R8E75IAmdNOiejUPilHAisdL7JepAt8qU/ySxEhEaq0uINnEGdf7VbX1alQ5mx2rkKhgY+ZVFTyrFMZdRX2A8NsdxYmnFLcU0k1z1FXtADQBs+sOzxYaUs5feSLONrD/MuwC9fqOLcpxkWn5Se5f/S5tYdfxXF6eQRiWsCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RjTmiGNL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
	b=RjTmiGNL2tjpiJzMXUy9oCYJ0aLb3y2RWfg/bbkUHb++BM9eO6h+IMwwhbDrFwaqLc4lUJ
	ENh11W+/GmLhEvd7WEf39j4Ke9cFhCGaAcALSdqQX4NC5/wvOngKisFysRgXf/khw/X3SO
	d9hC6S5C5WOwC++nfIQwpBAT4E8Jp+U=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-41N5SzeSPUq-K26KN7HtUw-1; Sun, 10 Aug 2025 18:58:03 -0400
X-MC-Unique: 41N5SzeSPUq-K26KN7HtUw-1
X-Mimecast-MFC-AGG-ID: 41N5SzeSPUq-K26KN7HtUw_1754866683
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073bfeef28so41926986d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866683; x=1755471483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e+jg/1yqiU75KoHv1FanEm2OpTvKZ33dl3uYGaGgUwg=;
        b=U8OYQ6fIbUPpcViylCdUqRIHJvd599PouawoFqBEahkkprb7snAFUFm6mnP1Ro0RYM
         XJWongSAnEgRgWXUiueVMresM+2FJ7qqg2+a/Ofl+HosYWPCHocNaCbw4vSbDwCHncLM
         4B5KYneyigti6D7nDaZmj6wkAWgSIGHK7q1qyLta8rFay+JvxjCYI+drjz85xkvxEmxX
         OAgET42ZuruG6LdqTmtX1IQT/hgvJPfedOX1JoE4IVGsDNPMdQaNY6SoCEQ26FLtjj2b
         s9P8Q5zaINYWa0byme0gfKBpHz3L5RwcFDw1NBZ5O2iBXomzsf0IxxidIG0WhyrNWXuV
         7mmw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1wYG8qOJKoH8BqWwJn3TP1URY4VVwu0q1jJmP+mFNBKpK0+4NHcwg8ME9o5jTDFS72Rvoc1tMWa2BXl+@vger.kernel.org
X-Gm-Message-State: AOJu0YxQA/EDUMhQKhHrqziXrqpXVZz9qpYosp6fLA6ZH68TZced5WUk
	F4vAwLggJ7XLF5H2PY2aigrzhd81oBxgHZcZc7pvEtONLD2MAl4186sjmb78O5RMEdBpZFUXo9C
	QXRjTB+cDKaYg1higQbgUdC2cyrbW12D3zCuRfvtlpwTRVEpWo+v7jQBSpg5yLV0Gnoc=
X-Gm-Gg: ASbGncvnIYmRJeG6nQ+xjQHV5xTKSq3y87PsQpoZcI/mAN/2MeBvQ2AorIfJ+yLIkIJ
	lrnC2BLqYgfiK7uZVs4LsrIWdwHQihnqNnoBCy3FH34DNU1igL2djI4HFktCRgMinuPbqHrsZl/
	4HR5wFr1AFdbdqeOWZv5gkXKZd5dqrHcwOSLsgZRG/q7lvH9EGkjBgCo8Cno2CczqJeNzFZjUKc
	x3en5zMLgjsOLyx7Uub77SU+ZvczvRdWmWyv6POrowT/rz8NIhGPDoxuzApBRRvwjCLZqXR+jnZ
	RHgJkdPiG2bunioTtkwBaw4XijHAAeLyCXDv9VdOdis79CLLFmnvVQYHIYjfKVdlD7Sj3t5kvEn
	zAfKGmQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id 6a1803df08f44-709ade97506mr71682766d6.43.1754866683152;
        Sun, 10 Aug 2025 15:58:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkOu59xQUnrcN/f1twSlF1BrFwL5WoLAQ12FYDXq2PWIP1hHCC8VcITCPbW5zGS+dtgeykrQ==
X-Received: by 2002:a05:6214:4e17:b0:709:ade9:742c with SMTP id 6a1803df08f44-709ade97506mr71682586d6.43.1754866682705;
        Sun, 10 Aug 2025 15:58:02 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:58:01 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:29 -0400
Subject: [PATCH v2 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-5-0fd1f7979c83@redhat.com>
References: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
In-Reply-To: <20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754866653; l=1762;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=TCVYIFivGNX+30I7CcW+hQ/ILyWbQUzfCulxzbwFiso=;
 b=hYrBk5VBcqe8AFaw5M0JbEMNQ/+5/EqgXMuDpqvpMtHJTmo1+Ev+Hog1C/ZssRnCSzPfMgO4W
 91f5Z5fMemWBs805qoxKufqYrIgn1TJu66F/ixECjawgTEoSUzz+mJo
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..c3bd3f89434eb7d3d0f3bb9455d22aa00915e797 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,19 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
 	return (unsigned long)vco_rate;
 }
 
-static long dsi_pll_7nm_clk_round_rate(struct clk_hw *hw,
-		unsigned long rate, unsigned long *parent_rate)
+static int dsi_pll_7nm_clk_determine_rate(struct clk_hw *hw,
+					  struct clk_rate_request *req)
 {
 	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
 
-	if      (rate < pll_7nm->phy->cfg->min_pll_rate)
-		return  pll_7nm->phy->cfg->min_pll_rate;
-	else if (rate > pll_7nm->phy->cfg->max_pll_rate)
-		return  pll_7nm->phy->cfg->max_pll_rate;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate,
+			    pll_7nm->phy->cfg->min_pll_rate, pll_7nm->phy->cfg->max_pll_rate);
+
+	return 0;
 }
 
 static const struct clk_ops clk_ops_dsi_pll_7nm_vco = {
-	.round_rate = dsi_pll_7nm_clk_round_rate,
+	.determine_rate = dsi_pll_7nm_clk_determine_rate,
 	.set_rate = dsi_pll_7nm_vco_set_rate,
 	.recalc_rate = dsi_pll_7nm_vco_recalc_rate,
 	.prepare = dsi_pll_7nm_vco_prepare,

-- 
2.50.1


