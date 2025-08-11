Return-Path: <linux-arm-msm+bounces-68333-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E976EB20691
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 12:56:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A262179476
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 10:56:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA3322A4F8;
	Mon, 11 Aug 2025 10:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XUvkGGxE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562A270EBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754909793; cv=none; b=iaqfQD1/N+NmD404MyGPy7XFvBsSzidWS6emNRqCTtF8F+tJiIQKnRnhh8a++JTaoMoa88WafBq1eXql6X7cdQjXMWCIasnGeyTpuBZibRxGRFWHtP30ByywxChlW3p6yGAqUmRftMLoK8xyutQAnWfl5le/aS6fXrsnDQV4dlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754909793; c=relaxed/simple;
	bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=goGmsibTvoWi9O9/7GvapxnXfGV3Hxb3nx3CGjazH1SfU25PzISq1Yycy1GTLarMTPs0JiIbVhDFhpFiqjFINO3coo0yDl3UTlE0ZXBpAN84p0ukJfPdSAztbv3SAfSDE8v3kjz0C1/0IlPJ5aUuQTFNudtQbsPuuyFykPrFn6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XUvkGGxE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754909790;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
	b=XUvkGGxEe+h1WmIbg/eyl2fCDWGsH82NDvxo0Pd+C72IHlKf56j9dvQz/tlJs1YK+Vn5N6
	77LGXvnSvCT46SKgtftFqcYRB0rx7gnbKGCHkD8qb7R/BQ6YLSHF+Z29uoDT1WucT2ESoK
	TCIF087SsfZw9+R3BIB3tSGGeoJUZqo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-scwxSXZjNWePQrYFDRrprw-1; Mon, 11 Aug 2025 06:56:29 -0400
X-MC-Unique: scwxSXZjNWePQrYFDRrprw-1
X-Mimecast-MFC-AGG-ID: scwxSXZjNWePQrYFDRrprw_1754909789
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e7fd5f63a0so407152985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 03:56:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909789; x=1755514589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oItVFGO2Yky7AW4ur1CICLCJs15wxQxwvYfZhdFHqm0=;
        b=db4f0C5pLbH7/DrKxZRdXd0ZkUNAkcVVQnJgD8rwmfiyvabCLQr7R8wyK0vHaeWjJV
         k80X71hOLt6Q/b7gP0wgu9J3OYoARy2wCp+Q1oaG7v/ABDfALm56c0ALrziWIMTAWtCc
         JCbgOmnB3Un2f6+Ox/tIX+eQTKxhnUmGQ4AeHzcqvOKPmpei1i9XXeB7KN+ONGg+iJ+Q
         Qzv393oz/eYzMMekxKzsrRkIRNupMLzqcdKiGt091NSpqzdUOTceUgW07aNA9PguJDbv
         1DU2Lq9kG+k45i+9RTIZJ6vCfUZCd8Z8Yz4RYhoNhnZtuQrpcMMRCHdBd9JP7kbwGI6t
         rk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWv+kXMh3ynAf4ucl5xGsBggYab/dAOe6FeDlQqFp/toKpfMbqE2HPxQ5KyI1CpDO1Zh7DAc1ntaSx25CYf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg7s8FKyejBhVKZ4r5SeTiI/TV/nCu9TAXih1fNNbiJdovygPB
	YwZ4UVp1bpHpo95cz+frpGlmFdwYTdQaI2viOJgQjWWzIoI7SBx7vEP78SwARQtvvpLwdHMnsCj
	XVq2JbALchKcyX6ClbV39KmpnfA1X/SL6apBOdKth+wH2V+wQ7/x3vJelIP7dCGhpkjg=
X-Gm-Gg: ASbGncsWlaXchptvYBkf4eKjhbZEF41tS35Ny6CEhT6kzU2GYMyu9ZOFbDUga9mH7wq
	MmhDX5EViEZpaE1gMvKqmLm61/uk4dbgJFM2UbvIhvabjlU7dHlsxxmwD+zzoBiOXFs7SO9Mn6i
	8BPUm94noJ0JraB+WEqpiZvYhHl8OhOgwapUumHOS99sH12pA4TYCySEwMLq+NZ21MlRrK5QTDc
	ScvZg6O38NgOuBCCMbZGhgV5RnI1xn1PrYP5u3oysu+OTmMse4zM6D1Fkh/We4EmeODDEc/fMkX
	3SBn5MXNwwnKz6ReHA65EOvQFi1kkcOK2c9sMVfwonzKvleDiiMfeizjVUxVDMOw4wLAm0Yrg1H
	Xu44=
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id af79cd13be357-7e84fefc2camr275376385a.45.1754909788887;
        Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGc+TLWI2xokcRtB+yecJngyy21noRPTcC3sO0sgVUYXnKnFuXDagMBjiVXOuloOtpZxIcGpQ==
X-Received: by 2002:a05:620a:4482:b0:7e8:4fef:bfdf with SMTP id af79cd13be357-7e84fefc2camr275371485a.45.1754909788147;
        Mon, 11 Aug 2025 03:56:28 -0700 (PDT)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e698de2df7sm1273446485a.80.2025.08.11.03.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 03:56:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Mon, 11 Aug 2025 06:56:05 -0400
Subject: [PATCH v2 1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to
 determine_rate()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-drm-clk-round-rate-v2-1-4a91ccf239cf@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754909781; l=1689;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=cxbqZ4pGz5eouMzBVW3NyN413s0i735X+YyBDIP1KBA=;
 b=6DBm6LwfY0nfMA421HhZNkFETdBD0OvYJlukZJUarU0DQPM5TzD76GN5AVvolZqrFAvmrp1nP
 jvbNFGe7dHWC4XgQV+dlyA/bvSpVN7ZZvyR5/1pWXfn+rHkgHaXmtum
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/gpu/drm/imx/ipuv3/imx-tve.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/imx/ipuv3/imx-tve.c b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
index c5629e155d25aef5b43445bc18c6c90039c99974..63f23b821b0be66a8e8a379e1375ffd98552e72f 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-tve.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-tve.c
@@ -368,17 +368,20 @@ static unsigned long clk_tve_di_recalc_rate(struct clk_hw *hw,
 	return 0;
 }
 
-static long clk_tve_di_round_rate(struct clk_hw *hw, unsigned long rate,
-				  unsigned long *prate)
+static int clk_tve_di_determine_rate(struct clk_hw *hw,
+				     struct clk_rate_request *req)
 {
 	unsigned long div;
 
-	div = *prate / rate;
+	div = req->best_parent_rate / req->rate;
 	if (div >= 4)
-		return *prate / 4;
+		req->rate = req->best_parent_rate / 4;
 	else if (div >= 2)
-		return *prate / 2;
-	return *prate;
+		req->rate = req->best_parent_rate / 2;
+	else
+		req->rate = req->best_parent_rate;
+
+	return 0;
 }
 
 static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -409,7 +412,7 @@ static int clk_tve_di_set_rate(struct clk_hw *hw, unsigned long rate,
 }
 
 static const struct clk_ops clk_tve_di_ops = {
-	.round_rate = clk_tve_di_round_rate,
+	.determine_rate = clk_tve_di_determine_rate,
 	.set_rate = clk_tve_di_set_rate,
 	.recalc_rate = clk_tve_di_recalc_rate,
 };

-- 
2.50.1


