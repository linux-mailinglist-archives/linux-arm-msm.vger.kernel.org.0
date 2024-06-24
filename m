Return-Path: <linux-arm-msm+bounces-23886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E8491442E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 10:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BFD6F1F20F2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 08:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922FC4963C;
	Mon, 24 Jun 2024 08:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z3ApYHjy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E39482EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 08:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719216362; cv=none; b=RXJJscJb181Q4A5aNcWbZTL07HNk5FF4ST656AXqdBa5ReQMQngntBHPl5mnS63YeMbgRkVRbBQlblgJ5nYzGylCQlQfLlwgsSHb5GrR+fjdTwWdnax6KJGS1rBRresxvu8vsimhnDZImFe9U6ybM9nrfbvaon1m0pbB0C+fwLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719216362; c=relaxed/simple;
	bh=bQIkyp29tZTCARpC2vuZ9f/W++P76ZZ+B6qEosU8tuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BkthBj0weWW+6SYLYhM2Ozt9gWu20hp/sAmUqmQuo7DcguBje9wo56mIbxFW3SrI9QvdK0UuWr7rUFY1HNq95Rb0FWQXsVcMA1wE7m26C1DI1PxMJMvsfrj7m8/ZWvrJb2YyFYVjmdMMMF7dLZPYMmdI9Yr59sX520/WCylf7xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z3ApYHjy; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-364a3d5d901so2791021f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 01:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719216359; x=1719821159; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyDPiQXEXGGJl0MD1s6OPz46t6cn2g1Q+58BMOrGT74=;
        b=Z3ApYHjyKPZI2Hm/mwOO0VJS2K8vlDb7WYYCsrnpSA69bZ4qnP8VwdW48qvkXfKbcq
         uZXXgdlY7QVIuwx2MP/LMHFl77VeZDhgiJYaSX1WCGL2XRk06kGrct3PKsJ6XnJbEMPo
         2nu07syOCfBf/8/mvi9osYDtT6UJCeVnG/TAlD4JayPqDzUsqBaUCG3Hr1WAM1HwokHw
         JFSGFeF+cMrMbuu20JbeqHWnBr/zYcHgU2PzIEu69lenwoPu9yFqFlzBI9inppwn9pUt
         GycxtqUgsZb7+esDxreFcWLgd1VQYraoU9ngMw0G014pn4mrl0fGduuFXNFEEkriP5b9
         xNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719216359; x=1719821159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KyDPiQXEXGGJl0MD1s6OPz46t6cn2g1Q+58BMOrGT74=;
        b=sOYm62FS/8qZp/4AkvXONjacXaJzHXsucDzlSBMrZn2++hK9ZPaT74Q3hZxc9ou/90
         ccSvHDa2dXoQdLoifyoirlVrmFvseC1m0KYVUmiIMt2kjjcBnLNzDKxDJlHszC0EzJsd
         /XIZZ9mCa64nHdYKd2tezH/R15QsCqj8Ubn62+9NJK6DGgWhZIuz+cWUg4/sY3OhD9DL
         Jp1fuBqnx3WiEgoONCnBDOaQYwguvZpL14vm9pUjwN30qneYh8xtVXK17Oe6rLaOcIYn
         jgMXC2BJEoHlZtmioHq2vYFMOgAJyxuMNd6c83w/KIvM7LpemJA/MJzo9UWAnpsMik6I
         wCaQ==
X-Gm-Message-State: AOJu0Yzh7sqeJGVmeKVM6GwQ/HADqSqVM8XRDBWSmj3m4XSvAWb9WAIP
	cYcAqUC10tVK7PhUg+9B236t44wcg/pGOl2SZuqCzm9cnG57Sz/erPmPD8WIVc0=
X-Google-Smtp-Source: AGHT+IHyEZ7sSwdlNWBlnGYh94Ik0+5Hq4GAElR0relu/4ywsiDWGAVZDhc9r024GO1E4ss+bcjzqw==
X-Received: by 2002:a5d:4a11:0:b0:366:f7d7:ca51 with SMTP id ffacd0b85a97d-366f7d7ccfbmr613526f8f.55.1719216358745;
        Mon, 24 Jun 2024 01:05:58 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8b27sm9280284f8f.104.2024.06.24.01.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 01:05:58 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 24 Jun 2024 10:05:50 +0200
Subject: [PATCH v2 1/3] clk: qcom: dispcc-sm8650: Park RCG's clk source at
 XO during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-topic-sm8650-upstream-fix-dispcc-v2-1-ddaa13f3b207@linaro.org>
References: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
In-Reply-To: <20240624-topic-sm8650-upstream-fix-dispcc-v2-0-ddaa13f3b207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2656;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=bQIkyp29tZTCARpC2vuZ9f/W++P76ZZ+B6qEosU8tuQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmeSjjxg6m8mdc5uX0GW+0BOP96FwznajwSwjEgf5U
 UtYMI22JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZnko4wAKCRB33NvayMhJ0RvdD/
 wNe+Ut3tSAztnJSbB/zX1Mr7ylThJNAyZeQRW89puC/EpPxlVLZLlgKhSvA0RF18mqDFp393DTShdN
 GgWqmU8h/HFMvlZwvBxAyu0bIydZjmEXmdNt5GGBu8zuPIl9+hkt1TyXT6OzK/age66BFAqXe2U7mP
 YZ56ILRoVwLNwbveW3jS4E04NemyQlTW2feKJn/MLwL00ajAG3xdoJ/dsLn4xHbchGHBIgZlfS6a+p
 mI0hLgm604LQL7re0nNKbER6ZGhvAcrepznVDwNvWA2JYidiQokzRNBF3LTG8hilUFDj6IZfLlsnSS
 pkbi+glASJAzn5Da0Hw73aA6PDqlQOSmlF2sdpIDZAkVSrOLHzRPEVDh0IuEGL8KSWGT+A5LpschIl
 lYg3/p941jkdgID7U7rApqYyf6Qh2JnoJNU+kos6oDN7ls1RxfkfALYjJYllmp4sWGTuCzEP9JUt1R
 OaBZziGfTNoCa/PUlXmgKEV6NceW5jPvZHH2PQ6zfYZsmlsX1X0D/tA9ewnqfTfrW0WmiJPCBQcPa3
 gaPda4dipjfKuNQUvKF2wq74+AJ25NYKlFIs2bNDwDpEbvu+DciTiR6x4Qovw4a8KTKdzdNbd2e/7o
 qAevRlfCSL0j+NxYwEKwVU7AHlc+gAQkzUz7unaNGquuHv2o8GYoUWRiDwFA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The RCG's clk src has to be parked at XO while disabling as per the
HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.

It also changes dptx1_aux_clk_src to use the correct ops instead of
clk_dp_ops.

Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8650.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8650.c b/drivers/clk/qcom/dispcc-sm8650.c
index c9d2751f5cb8..360b80377ed6 100644
--- a/drivers/clk/qcom/dispcc-sm8650.c
+++ b/drivers/clk/qcom/dispcc-sm8650.c
@@ -339,7 +339,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx0_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -398,7 +398,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_dp_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -457,7 +457,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx2_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -516,7 +516,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx3_aux_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -560,7 +560,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -575,7 +575,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 
@@ -647,7 +647,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 		.parent_data = disp_cc_parent_data_0,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1


