Return-Path: <linux-arm-msm+bounces-68248-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A192B1FD02
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 00:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73323172BD0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 22:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874672D94A4;
	Sun, 10 Aug 2025 22:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D2kM4GYt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFD12D8DDF
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 22:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866695; cv=none; b=GegrfkYJXjPeeDTmQxkM80KxRd2ZBR8KLMxJkcTdLniO/1v2irhNBIO8AMTJwdXDpE4Bb7QsrW2N5wU8v6tqpapKouU9axi+nvDOxPTOxltL5RG5DL7ke03DLk4JgO6AwdHd47stFgMx0NGdLNqANCizCrXgBWZzlBJxzvFqH6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866695; c=relaxed/simple;
	bh=b3lpeRdsfILZNbKt0s4jDvsKWYmd9ZM6thqzD9ovEpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nScwgQUnXHve7m5Rtnnss/QOhWan3n9KWcQb0v4TuvHsmfWR4E4LJieXBs325EK2RO3Om5DYjWSdDGWrMeY9TADsj7jdulmZL/AVdpcqFcBlQRp+FS7jffs1pd1tAEtYEeR87wNch+aHQu7D8L4rYX75moVHL/BjriIBogbSU4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D2kM4GYt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
	b=D2kM4GYtpy3MRtgGqEIc73oaruJOEH5xA+MD5zSi2oR3aKMcCc9+MdOSLk12qiBL8v5MuB
	NeMIMe4KNmxCPrAGR3TjljxLmpM5GmAmMhj8DTCFuc+TMxy2IUgeTpRCyYzUvKVyx8vBG4
	HNclJAcJUJtyp7KcEl/1RqDeocrY4+s=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-JIIOve0NPzSKuF-tJ0VU0Q-1; Sun, 10 Aug 2025 18:58:11 -0400
X-MC-Unique: JIIOve0NPzSKuF-tJ0VU0Q-1
X-Mimecast-MFC-AGG-ID: JIIOve0NPzSKuF-tJ0VU0Q_1754866690
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70744318bdfso110822876d6.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 15:58:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866690; x=1755471490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FbrTb5TIWzNpxLExdP2beMCh0zMQGTK+0dHd5wdG15k=;
        b=s4lPotuU/PN1eUEeb4PmD5oarnYu6ttQ+e1XMBsyLhREKqzZMnWRyh2z3KqGCD6fSV
         3XDmcNlCGilUf87eWGCy+phDviEz5EBQui3CQu35g5VXpJ9f6tHvju5wc3rrTAL6dQey
         xvzY+ToWbmmQAW1M4gBx10CYRqThEYdvx2hR+JvtE42rFUZL4cm8ntxOuv7GhinxaqjY
         LYk5OqKpCgbfePbvD58NWRNh42UNrXwocnjqQ0IDszKWavsISrHOUpLoOduj8Lul9mmx
         BXfKUMlD353tHojvKvqYLVv37OtdJyIV4toYhoWsIcK8BGhGLdRNY2Z9LRf0LR/+rzMH
         wROg==
X-Forwarded-Encrypted: i=1; AJvYcCXDl49yrceNrINe+9+PIGwD1MhMYVw2fdVUp/0luinGP0QlYFG1k1nNMvoLhOxfEX8LjpIf3jtkdWTceKps@vger.kernel.org
X-Gm-Message-State: AOJu0YxCpSf3E8RDRWtv0u+yQ0n5HbSNKc1IUB2vp2Tz+Tch+/nvOfaL
	oJQHqiZCOfIqKLEnMy8aIPgb06EzdaOMuK3eg+VlpEK9v3cwVUxYljgHyMMabtTTFgiiObBArDN
	KsrvMGqMnaO5T0M3/7CSLurN1iD1FkM2SOPziORiv5/Dhlb2GC12tXcMlluYJuLoNz8M=
X-Gm-Gg: ASbGncvRmcz+w+FfPZjz+Zu6eakBI8JU5cYkZXUdy1k/m+BmStWt5ETwTBm0wDxufC3
	wBlMvBE6IMAcxoMVAb3+e8Rn3pbo9+g6xb/T/FX80fA3W+g+aIwhx+8d3/81dfHm28D3+Z3w4X0
	/NliOtEC2ifs1XB+U+4/O24heokShybxiXlLQryrLtkHZa4DF3Oyosf0lFeAoST3k3OljnBd7DA
	Kphmno5b05nS1hx8Kipbgkor9uxkW5dwA+4btOWwMy2Zg9RkYXAnkJ1XFp7PliI0zVVTg6slj2k
	n6U73zgFzcC9UDXMMovAojbdkkd8383Un8/1A+cJ5wKnIb4wxxZV3z3n3HAjRJicUGjGbq8yRbo
	tdtrEgw==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id 6a1803df08f44-7099a51356fmr150862486d6.48.1754866690656;
        Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGUGt1AwSBne/o9+rNR3LtSm/WoA2RbHO8v9LNVgg4wnAMJx+OP+IR27C+Pk0SSrEVzMCAAA==
X-Received: by 2002:a05:6214:2469:b0:707:48b6:bcd4 with SMTP id 6a1803df08f44-7099a51356fmr150862326d6.48.1754866690271;
        Sun, 10 Aug 2025 15:58:10 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:58:09 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:31 -0400
Subject: [PATCH v2 7/7] drm/msm/hdmi_phy_8998: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-7-0fd1f7979c83@redhat.com>
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
 bh=b3lpeRdsfILZNbKt0s4jDvsKWYmd9ZM6thqzD9ovEpA=;
 b=bPI+bgndtQjl8U/B8CPlCWIm4ICh/KSI/9pQqEc+JGzlNlWdm7ffMObXa6FktebNdwMw2IQ7l
 yRXvUD2K69rChwg8WTjpcfmYgZ91P/5xMLfzNQFm4R78kNC3NkqT/fj
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
index 33bb48ae58a2da13b7e90ff419c6e05fec1466af..a86ff370636972168124da19e114f0acab2249d2 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
@@ -646,16 +646,12 @@ static int hdmi_8998_pll_prepare(struct clk_hw *hw)
 	return 0;
 }
 
-static long hdmi_8998_pll_round_rate(struct clk_hw *hw,
-				     unsigned long rate,
-				     unsigned long *parent_rate)
+static int hdmi_8998_pll_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	if (rate < HDMI_PCLK_MIN_FREQ)
-		return HDMI_PCLK_MIN_FREQ;
-	else if (rate > HDMI_PCLK_MAX_FREQ)
-		return HDMI_PCLK_MAX_FREQ;
-	else
-		return rate;
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8998_pll_recalc_rate(struct clk_hw *hw,
@@ -688,7 +684,7 @@ static int hdmi_8998_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8998_pll_ops = {
 	.set_rate = hdmi_8998_pll_set_clk_rate,
-	.round_rate = hdmi_8998_pll_round_rate,
+	.determine_rate = hdmi_8998_pll_determine_rate,
 	.recalc_rate = hdmi_8998_pll_recalc_rate,
 	.prepare = hdmi_8998_pll_prepare,
 	.unprepare = hdmi_8998_pll_unprepare,

-- 
2.50.1


