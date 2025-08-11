Return-Path: <linux-arm-msm+bounces-68337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 770B0B206A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:58:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7CECD168A64
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:58:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C330C2777FC;
	Mon, 11 Aug 2025 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M50D6U3V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B30289E07
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909806; cv=none; b=chAWeo5cuycXWUZjUlzx+girD8f+Sl1+VvE+KYjtlj5VrK9ivgT5oghJ92jTdgD531aQ3APTe6r83EdqyIBXY1Ssg48IA+nv5hr2B1wi29mQ0T9dByL/Lnq3wsf2Iqv6vpP/cxqM14W6dMl8x3cOEDFVsvuY6pn4WoloX6yU230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909806; c=relaxed/simple;
	bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rp8n4AJBtBwjGEhZNKYXha09aX53v8Qb9VNUsf0jTQMqMw8wfQVHYhCCsV2VRMNwy4ffYO8wQ2hdT9qDq0hVmjZ//1FiYp5aPXltSWbTe17ZlzCgJ+H47hwwn4Dfrv8bz3XnMJvDEwEQ7icK4pCsy7hYBWbK+gm1nNeavoV9eOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M50D6U3V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
	b=M50D6U3VZliH6yNLTkh1JDR2fkGhSYetpLpYy1CHXkf5Symtj/vS+cdrJISrVHalx+KkQi
	z8Xvk5hlxdUtjvmGQmt2LdEJ5n5Q5Cm9MYRF3DYRl5Z2/hA35LLQsRk32O40IPgy/DMpvK
	BQTq3aKKn1mEHqismY7BiNkexV4gMiY=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-_sIuf1xcN_G8t9uP5ODByA-1; Mon, 11 Aug 2025 06:56:42 -0400
X-MC-Unique: _sIuf1xcN_G8t9uP5ODByA-1
X-Mimecast-MFC-AGG-ID: _sIuf1xcN_G8t9uP5ODByA_1754909802
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e8106a41e7so1030845285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909802; x=1755514602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wT9Dbxfb4kVAT42wH+rZD3vwBa5NQ+w/1wzXJJwlqX0=;
        b=PFsGe7IgTC67ypXZECtPpDTQ4mYf6Lro1+9BLD6xZYto4J+l3tYnGIsnw3zxKDcWUt
         +K5O+rFMY4dVTpoYjHdgmaz8Kaw1i3uLg8OgPRZGeOU2fS4k3xLBTHaIbvbopN7yzyBY
         22bl1rq2PfhI/tHbmgbYHxx/WTqE1Ybai2E1NrASi/aHakviUjdWjMTshNJcK8v7Ks6y
         gJG9ejspzfO/iJik1P0MYgpN6+mWEKzrtvmtqyvAc7bW4RUSQNuWpxdvZWNVVzBzURJA
         MpIrlNQNLRHSTPPS85t6+Jq3Si6hiMMFUyGTtIlbk0U/COzZQ5x9SnQaqbx1WkGkK8oO
         VIYg==
X-Forwarded-Encrypted: i=1; AJvYcCX4u1oKcy5aI24VNlVYmWpfBuIHmAyfrBp6IpzVxCCXMDPGvr7ESgFUu1dkYcxyBFGeN+8hG0SqnmjO27U2@vger.kernel.org
X-Gm-Message-State: AOJu0YwBwDYjinBtQtWCn67cGe66/AmKTVItr6cAopkG77AUwbBTIQcI
	Pfwe92KpfGv3N/gsv1qwX+QxWZmYNpwbie1JE1CJfvAD4tG9kNUKUQ9LnOtNIZDhGQF76dyen0Y
	a2qjtFm5feh+CZ8oVMB22Vj1YvXaoNeAG+eWq93uAXYY5cFuRwIx+ywrklE9F3mHhh+E=
X-Gm-Gg: ASbGncs/VHEIcAJdwvsspvSL0oafIU/bGv4UL0+xsASck+CL6NumknsqWCKUjXcli9z
	1YWoeZhsnaO7u/Uxk8wwo14DRZBiK/4he+DrTDMQolL/auMbjOTR0zPPSPUtYSxtNpFQq/jWEci
	zk/s+TvBG3i9b0Ze73npSz1DyBkLvJvSyun+G5r/GXZls3NVhpOxjHbeIn1Z5OSU1QN5cn5HU2/
	u6DRX8sBtpbraKfPCDts8mIPhOH/gjOKMMnmqR6UBN/7HxgVge7vfA4YbIRnbWLGq0Xf2Xb43uG
	F/JJVOTlttde4sLk3OYZnrxWv0ZZXGq0bNRtvT/DBuxbHAWXUkFy2pE4XlyefhlPjXTvpFg5+5d
	YqQY=
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id af79cd13be357-7e82c6834edmr1680334385a.25.1754909801989;
        Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHn4J1YPALYk3sfXKt4CIgszP9xA12/nZjPecmiJUzpdOL3Mq3At3CKB2rvFttPLfHNTO7lJg==
X-Received: by 2002:a05:620a:45aa:b0:7e8:2151:9bbd with SMTP id af79cd13be357-7e82c6834edmr1680329285a.25.1754909801517;
        Mon, 11 Aug 2025 03:56:41 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:40 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:09 -0400
Subject: [PATCH v2 5/9] drm/pl111: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-5-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1718;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=zjPZ3dnO6gZ6FQi2ZfbbqSAvbJwyf4CBg6JGhX8DcxM=;
 b=NJqHQ2ssaD4y0rqVbCbujpIrqzdN3VuMWj9ghDV3lWlNDbiI/oggFqGjuVCZHps19PnD896Q0
 9FdZ8qhj9mUBZ/GerZTn1O4AjtYG03lLvn79VW/TKhLY3AumrqAiB+P
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/pl111/pl111_display.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index b9fe926a49e8bb42116ac382010829e333edbf8f..6d567e5c7c6fd559ba369a2761d3c402a14c6fe4 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -473,12 +473,15 @@ static int pl111_clk_div_choose_div(struct clk_hw *hw, unsigned long rate,
 	return best_div;
 }
 
-static long pl111_clk_div_round_rate(struct clk_hw *hw, unsigned long rate,
-				     unsigned long *prate)
+static int pl111_clk_div_determine_rate(struct clk_hw *hw,
+					struct clk_rate_request *req)
 {
-	int div = pl111_clk_div_choose_div(hw, rate, prate, true);
+	int div = pl111_clk_div_choose_div(hw, req->rate,
+					   &req->best_parent_rate, true);
 
-	return DIV_ROUND_UP_ULL(*prate, div);
+	req->rate = DIV_ROUND_UP_ULL(req->best_parent_rate, div);
+
+	return 0;
 }
 
 static unsigned long pl111_clk_div_recalc_rate(struct clk_hw *hw,
@@ -528,7 +531,7 @@ static int pl111_clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops pl111_clk_div_ops = {
 	.recalc_rate = pl111_clk_div_recalc_rate,
-	.round_rate = pl111_clk_div_round_rate,
+	.determine_rate = pl111_clk_div_determine_rate,
 	.set_rate = pl111_clk_div_set_rate,
 };
 

-- 
2.50.1


