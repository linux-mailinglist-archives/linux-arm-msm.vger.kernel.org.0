Return-Path: <linux-arm-msm+bounces-64434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AE3B008AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F1ED16DC74
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC442F1FDB;
	Thu, 10 Jul 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h18WQlFe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DFF2F1FC4
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164884; cv=none; b=mxhV/vq1F78ZCzuGsZpOBvPkF33iXldT8wbxZ/TojK7b/qrW+Tp+3oNrdVbGBRkqA4OElz3H0I2L9tCLvw68E/21lVZeOK+js0obZtWdNNLp/YLB89QykImNX2LnKKASHZJ9p2wSHrMq/VnxRmhhw2kK1PPv5cIQEXYHJbOfH7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164884; c=relaxed/simple;
	bh=fHdUScMRQgFwOqdE7Tmgso+w2DIolpqysA/pehYb1fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUcJvo4ITVP1LY+6m0wLr4K7kP+hRQjiXbDXYTjKFF3keB/R9+8h4Q2QZpZSMxRWVBb2hUr9EJAtxLfIFNUxYja+zrsCO3xZ3h9+EkkrMfhpamiEIFWAruHVZDzAlgBpkNsL+MzC90jUeXwwi5H4gb7pHC0YGpyE4cNDq5BrW6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h18WQlFe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164881;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
	b=h18WQlFe5UUL/UN9iSZPBMR2TMCNDRfczaZPj4jAe9HLabWcLAS4UFl7TMmCMuzpVhoBVN
	cfnK0VtDATeG6z3MefBANIqwZvsY4LjEeOFvccwRJamVE4Ax+9StTNCC4P/GHx6nMEzH4a
	BC7U64JhjBhj7w8Emi5B1xIj7R6N5FA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-pj5dUFsaMUWjmAw76FRVPw-1; Thu, 10 Jul 2025 12:28:00 -0400
X-MC-Unique: pj5dUFsaMUWjmAw76FRVPw-1
X-Mimecast-MFC-AGG-ID: pj5dUFsaMUWjmAw76FRVPw_1752164879
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d44a260e45so213557585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164879; x=1752769679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfkBfClsUtYPbOSQrG/llXZe65YFBKERq76LXN2lGwE=;
        b=P/i+OUTgxiwO/QRXVM0ghMKrGXaL1NVVENlsKNsYEMA7LwmNB9tzt41I3nOtPKrIjs
         Je7cC/0prF9GyQcHr4AfPGoj689QxtdT74sQT40/AySIVUd2kzJQoa6M9INT+M1wVeis
         QfQKsA9QHh2DWsjG3uYFxI7PdJJMFuqCkzJZ7D3MbKPtrXsgN0qQTyftcDmAZkCvNyna
         NFJ8j0DOpNjpmIptwWTOpkb5n97CXy3lOu/nsedh4jB8/llrxceT1/yOQqcLiriqGj1l
         57ddtj5Sm1VS/KIQJwGP5/LG9DNiYPn1MWStyh4I85o7RAOAMALWHjCAIPkFbilgrFk7
         ER/A==
X-Forwarded-Encrypted: i=1; AJvYcCUyl0fRiYm4LkuiLd0hJ1NfQLoeFX3AmSOa+FL4+FFKGLVgEGD+WR7ab8P756/2VsuAhDfJXxTBLl7EZETa@vger.kernel.org
X-Gm-Message-State: AOJu0YxpcQCCPGqW8uTzOjiVMqwAakTpDOXcH2ySzj8kzB41YUJVuh8r
	GeQEOLUdIJUNA7GQ03WpEvp5pBQ/XHSJ+oCGOR7gZ9gR2C457TV1FCywapFlpn0DGBs6hfBJmY3
	/pmqFa3Hx9LMm6IA7A4WQg24jtsyv4lBr98+Dq8eBGcmDykT0kqc8YpXwq5MTJfKg0Os=
X-Gm-Gg: ASbGncvM+yWGQXF8G/S8aCC8zkN1/gsjg6jnUqNJ+G8EessUnQkSBg438A93/8ieWwx
	nyp7RT4REb1sAU+2QgDGUly2VTfbFizAp/79qzwPeagGPD4rbek0GKstZfP5rOh1KnqRUHR7dBy
	O+UubH5N4XEtLTIQfj3YdF/kYLBmC4czQEGKdykqy0lSUXRRzqYNzzA5UqutjVSW7zZ1A8x3hZw
	bDEg24GbY5WvJ0CEg36o+JJhFiWnBYXo8ZAbh7sRn0nSIPqMoJT7LaPHa1cNEsE0RPXv+YiRrmr
	1a0j731jF1NIKIrLeEr1/MVfUWJIpD7J4GfcUXBZeobLFjvJX5TDyWeEEuIB
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7dc998bae5cmr548838685a.21.1752164879336;
        Thu, 10 Jul 2025 09:27:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkhR4yI/meVA7B4yGGlSkWsy9sNAiu5N3YSBwGR+IQy1ADhUxQ0QJAqnJLJknz5+tK3xy+vA==
X-Received: by 2002:a05:620a:7002:b0:7d3:acfa:de46 with SMTP id af79cd13be357-7dc998bae5cmr548832785a.21.1752164878821;
        Thu, 10 Jul 2025 09:27:58 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:27:57 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:31 -0400
Subject: [PATCH 5/7] drm/msm/dsi_phy_7nm: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-5-364b1d9ee3f8@redhat.com>
References: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
In-Reply-To: <20250710-drm-msm-phy-clk-round-rate-v1-0-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1798;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=fHdUScMRQgFwOqdE7Tmgso+w2DIolpqysA/pehYb1fc=;
 b=+3BZqcT2g8BzgtT08Ofg1fLcRnpWlgjhSzHJ0bgUn4yuktzceZYntu7KHdODtXiXiNcU928l7
 zP16Ptox34vCfs3DTh/Se8N38Ou8pARiNhSmor1jXf2v9OU+tuAkQxY
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8c98f91a5930c9f2563a6b4824690ceef56987c0..eecc4e2ed51547709f9643c52eb2468f17966de8 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -561,21 +561,21 @@ static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
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
+	if (req->rate < pll_7nm->phy->cfg->min_pll_rate)
+		req->rate = pll_7nm->phy->cfg->min_pll_rate;
+	else if (req->rate > pll_7nm->phy->cfg->max_pll_rate)
+		req->rate = pll_7nm->phy->cfg->max_pll_rate;
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
2.50.0


