Return-Path: <linux-arm-msm+bounces-68247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E024CB1FCFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 00:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965B63B4FEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Aug 2025 22:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32CE02D9488;
	Sun, 10 Aug 2025 22:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TQOu8aPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564652D8DD9
	for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 22:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754866692; cv=none; b=YqhHqYGip33yLJR8txbJBJag+xsH9mnsJSoEYsWu9siKjUWo1Vj2r+/qfGJau6Zeg2IO87VcoXYgZEYYypv0TKn6OuGW3dYJaWQf3P7+k2mzvFzrG+FUGc1nmHLCeCaQD45nKO2KrRKHTOTtBSJLzp94Nko4GLAWDOR6TN3QN6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754866692; c=relaxed/simple;
	bh=09r1lPX7B14MLSuVQJ4dsJkrsJaORU9d2LSd/fRzU/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJxnj+WERI6LrBWx3f4vYHwubvegom5l7RebagQb+XoTsfuadxrPi5jiDe3+iYkbOUr/qNhMiozMmSxGCPAyspoPqnJ2u3TgJloDPyHVPMXzGA0UCDRStB7MbnW4p6VuL3Dd58WXiu3FcAaG4owJ222N5OE+eELi5g1v7XOWgA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TQOu8aPY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754866689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
	b=TQOu8aPY4LsG0wclNQAL0pJmpWd+FAKg4C07tEHL9oZR8c2FaImTldghLmjkucOBFI5uTv
	VjoOgbgVIjBnU3UY7v/8Hi0TXdQ9FLkXzHhGSvI8v7U+a2erIRlqU6o6hG9gMo9a+gK7gs
	DgVtzN1golmzFazIXfnxFb4WF1xG+Fw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-WBryezjwN6eHLEekbH1Fng-1; Sun, 10 Aug 2025 18:58:07 -0400
X-MC-Unique: WBryezjwN6eHLEekbH1Fng-1
X-Mimecast-MFC-AGG-ID: WBryezjwN6eHLEekbH1Fng_1754866687
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e69dbe33faso944261385a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Aug 2025 15:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754866687; x=1755471487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fp8kcGzYjp0wtOJJXm9d94iWK2Lu7bI5800+AHFvd0g=;
        b=VTt7/AzAA+T4rOXnDGGkwZPjNaC1MEg4kQ7EL1/Ke/EWUFLQC7gwLNEdGvbOjPaL2R
         j/i55yuGY1yh519ZXvGe+5jGDfRHyMRZvS73+B/xKyOBXnbPvTzF2Nyv6paFSo4IBMCI
         Yx2r3arrVekZgW1ZAF6L4QKjaFaxo0LHdeLYCuFq7DazOzOpsH7fEK7XgGW5YjeoJ5Jf
         5n7kgnt48ssow5EvOYPB1Wk63lIvIISHMpgAJS8KU9cHaTjDN8Ge7VFy5WoAmgCJrcfW
         OwmTUYXtHf17Pq9hhENKV6sTxHaYo+QGWzW6SzlWs/PU+GyJ6j91CVeFQkDdBsfoS0UP
         kizg==
X-Forwarded-Encrypted: i=1; AJvYcCWsVFYSVmxcz0RjsoGoCz/y7yb/NggHMx/9+h7zOo42+GCjfqnAheKOjVQN4i9MALZJJjy7MyQdXvAobKn2@vger.kernel.org
X-Gm-Message-State: AOJu0YzTgRYzsPracPlKGssmjgwmfkLQHS3ISd2p8eM2fsaK/pLaFi7Z
	crWZ5aeW2HWwkf24nBiDdbKeSsdK2+Da+UfXSzlglj8KdXs7oORWUzlWTYvpeBt+zaQN8xYznj9
	rYBda740b9JMw90uaPPUx6jV/2T+gIAYA71lkK1CHdu/hesVETCRRa1LHaWFUfk7Zroo=
X-Gm-Gg: ASbGncv0Dpeln7pQ89I+kkrZjQXQf5HIL8gk31IK/h2jPaixAxauGPTa4a1vzGC/IZY
	XKFk9RAq2ojPv5Vh8h16aHbqdbX7oJ8wuduPKw6s1IM3BTF4pAgvZ6z/yuQe79L1HXUs4njzfWW
	Xd9xpiu8uVRCsZwHn9eKRhYFQQLMCUPBOEYZsJVh52vei2V4GeHzmD9v5jouC2VvH9BQc+UrZtI
	ZLwrrjniwl1X949wRJPJ3GkP6tAOcytSVruX7VwAh4q0krXm6YqMwBQA0kFgQdrpSbq/Tc1uyn3
	aM9doQJKXiQvcFhqW2TgA0Dj5g2PUooGtK5xnyySgcViwoJws6nJwmjXgW5lXMCjirBIarqfSNl
	ec7OqOQ==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id 6a1803df08f44-7099a283fc6mr144909946d6.9.1754866686908;
        Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GPlWVCW9ekKhJg+4g3e28+6oQCiHZCjU/hLom4Wlvy0t+z7ug+DcZyM9qyvldH93bCaBnw==
X-Received: by 2002:ad4:5ced:0:b0:702:d6e2:3894 with SMTP id 6a1803df08f44-7099a283fc6mr144909686d6.9.1754866686533;
        Sun, 10 Aug 2025 15:58:06 -0700 (PDT)
Received: from [10.144.145.224] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cdd9916sm144266336d6.61.2025.08.10.15.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Aug 2025 15:58:05 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 10 Aug 2025 18:57:30 -0400
Subject: [PATCH v2 6/7] drm/msm/hdmi_phy_8996: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250810-drm-msm-phy-clk-round-rate-v2-6-0fd1f7979c83@redhat.com>
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
 bh=09r1lPX7B14MLSuVQJ4dsJkrsJaORU9d2LSd/fRzU/Y=;
 b=Ltcr7gblllRTjthopo3qUDdfH31xXqXg3Eunr1kVSjwIRzMGT80F8gmAILsYimdJaEURAIIXT
 DQUfMhrW4ldDGWChbsCXStaOBBf3jn9wUuWO/HCkvaN+TS3qKQngYao
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series. The change to use clamp_t() was
done manually.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
index 8c8d80b59573a37a4008752b16e094a218802508..36e928b0fd5a319b6a12b9be52705c067d51c20b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
@@ -629,16 +629,12 @@ static int hdmi_8996_pll_prepare(struct clk_hw *hw)
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
+	req->rate = clamp_t(unsigned long, req->rate, HDMI_PCLK_MIN_FREQ, HDMI_PCLK_MAX_FREQ);
+
+	return 0;
 }
 
 static unsigned long hdmi_8996_pll_recalc_rate(struct clk_hw *hw,
@@ -684,7 +680,7 @@ static int hdmi_8996_pll_is_enabled(struct clk_hw *hw)
 
 static const struct clk_ops hdmi_8996_pll_ops = {
 	.set_rate = hdmi_8996_pll_set_clk_rate,
-	.round_rate = hdmi_8996_pll_round_rate,
+	.determine_rate = hdmi_8996_pll_determine_rate,
 	.recalc_rate = hdmi_8996_pll_recalc_rate,
 	.prepare = hdmi_8996_pll_prepare,
 	.unprepare = hdmi_8996_pll_unprepare,

-- 
2.50.1


