Return-Path: <linux-arm-msm+bounces-64435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8F2B008AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D279544C39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66D5F2EFDBD;
	Thu, 10 Jul 2025 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="be/4nUMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BAC2F1FE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752164886; cv=none; b=XOLIfoYqRdxOw2o6nU3yP6c++jvxrALNcN6u5JcLQAKpPibCsNmOSUTrL610o39yXEGp6gB0Iwuw/bdAcIy+Hll6kSRz5NcDP1p1hq5mDIRRhbIrYpvzQkjr3SnJcekqvkid6gB1BDIEwJD7ZfdlImwIFV7aGfUGKbjI1BUf1WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752164886; c=relaxed/simple;
	bh=9JfaJTYaWcQgtLDo8JR9Ya1ZG9LJ7XkHyQnaRl1pFYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZUQnswjuL3fkYUnRGOTdHRPo1H1dDldWozn79NZNUGjyqrkneU9NaX9IYkDZDt92o2V9AStPQG6slJOMm0I0SqLVH8HIAKjlz7Gr2Bo2+2MJPMcyIgKcfs2jfayf0O2IFUHMlkAzZyMmnXV52tVO3o2Xf++SyBW2fAEQQyjIkzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=be/4nUMH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752164883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6pZ2fEmImzdGenxLPe18zM0sHzB+F4RfmFNy4FQZ+Zs=;
	b=be/4nUMHCoBVsEj0KxvnaLVX843731dWhm/RKWi7fWyZTrqmqoXaJH0l7xpLymQtB/jX4x
	wFuyFpxjFGbcrw826DMkou7DSEWCCoA5tPUfwMddmAnLEZrzQ5jQpqa7szj8dj5FViuqZb
	E4t3POVGlFz8UjuXPTuQJF5Pfc+YEWY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-5DvYx9jLM1S7apztnh_HSg-1; Thu, 10 Jul 2025 12:28:02 -0400
X-MC-Unique: 5DvYx9jLM1S7apztnh_HSg-1
X-Mimecast-MFC-AGG-ID: 5DvYx9jLM1S7apztnh_HSg_1752164882
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d40d2308a4so159986985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752164882; x=1752769682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pZ2fEmImzdGenxLPe18zM0sHzB+F4RfmFNy4FQZ+Zs=;
        b=HvBDcqtZ3i5AuQFa/tccm/K67RWkyGYu2fZDn71uAtl3+kedpdK5iQHlGGIKkkhqOG
         Iktu5yQYo+iTjUgMYcDE5nlBueT7sTCdkoKD2fAf/sM/TafxzsLD5CeOLS3mWQ1/JA4U
         eAsQAvfD/r1SbxU1WXEGxPBQMHdfL/NkguM1jKYkUroSYH7qSBNnVm4n6eKiJSE/OB9H
         QepNdpT+0RYFCNiLavdgNTQn4b5Rbdo6XmtUf0DmJhgz08p0AuhSB4euVm5CrwikROhr
         0IfzW9r4oWUVJxvY/tpuyJNBTAn4dRa4AlsRBODlgAlSE+p+9+s3d52wwcGDUEQQqX0I
         e2ow==
X-Forwarded-Encrypted: i=1; AJvYcCVCqrM0vcodycPxoFwsB8q58K/ASpwYgc3azfuIACfb+u+N1+jkrWeTPrRrzjANfON1lpsVXKAOQfqtJaHQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyT4PVFjA/rVAHZOWn2bW57j8hTRY3i4cit21bHxZKU7ZVVA7BP
	aGs3Dy0PsBBPVUeSpDwD8cs8grV6OoDJS1jGcwud5cEOelIrmpkEz914s3iNRS+7jdda1yzfRdX
	7lydbFi0a8FV0sERq+Bd3Y2haBa6Q/OnwSdqzuoP3qvY13KUlJljHqbbw1Krii4qTLXc=
X-Gm-Gg: ASbGnctN5RW4x8RoFoCAdbLE9csgUYosaKZcmFEa8LetA2VpqN9wlgy+nyPL+PFTwes
	71IwDk4RajXGdxEnqe5pNv6rxoJLkExfZ2TlJ9DTUJq0yqvXJyx4z+8sH8U544L/NVuMcEEAWI2
	A4jxEEvHOzCBPMsWoXythYu35GgutrKmievfOwtsKtfMaBHT0q1Z1S1u3D6DbCFc6xHgiFllvP6
	FwHiMindlSMq9dDrgiR74P40V2jC8XCp2dk/306DOvCdLLZ1VYr51JJw2ABi36/G2IlT1ZwCgFe
	8FixM2pXUtNCGuZJkrbWe7NLdLiv4TIOQHe/lj4GcIaw/uD0PT8Xplovz4pp
X-Received: by 2002:a05:620a:1726:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7ddebc935b0mr21980685a.28.1752164882034;
        Thu, 10 Jul 2025 09:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8nqAlSCWoWvORjsOIeWDgtSIE42hyDBJ1u6hirl8cdDrojUMZfEO6FEu3YLQazTijxe6XZw==
X-Received: by 2002:a05:620a:1726:b0:7d3:a6bd:93fc with SMTP id af79cd13be357-7ddebc935b0mr21974285a.28.1752164881473;
        Thu, 10 Jul 2025 09:28:01 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7dcdc5df99asm113487685a.49.2025.07.10.09.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:28:00 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:27:32 -0400
Subject: [PATCH 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-drm-msm-phy-clk-round-rate-v1-6-364b1d9ee3f8@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752164864; l=1782;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9JfaJTYaWcQgtLDo8JR9Ya1ZG9LJ7XkHyQnaRl1pFYQ=;
 b=VQSi2rvdK2y8CpHnP8Kq87P2EN9sLMIAXn3sz8naTxS61uqPmjG5VbCcKXFPae1OucSiF/EyS
 rtenvdJm/WaADJl4nH/jtBQrvVWU5LOG7EEpXIABxQ7+T5Ia3BPM/cU
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..dd59b2ed7fa3f53b6a70d20925e4f9cbd5d0573c 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,15 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8996_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8996_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	if (req->rate < HDMI_PCLK_MIN_FREQ)
+		req->rate = HDMI_PCLK_MIN_FREQ;
+	else if (req->rate > HDMI_PCLK_MAX_FREQ)
+		req->rate = HDMI_PCLK_MAX_FREQ;
+
+	return 0;
 }
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +683,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.0


