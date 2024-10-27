Return-Path: <linux-arm-msm+bounces-36066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A27D69B1BBF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 02:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30C771F219DB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 01:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5FB13A271;
	Sun, 27 Oct 2024 01:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DVhEOFR+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F68762E0
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Oct 2024 01:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729992305; cv=none; b=NLx06WzHzucjAyyS8FvQ0w5Golomc2adZGIW2IaRNXkWtMEND1UaanCYgpkk8jpyqM4/QPpQq1Hlz4fXtT8Zr6UtplIp3pvX5217pdOQRVxu/nIYMxRyeXs5rYBAi1iZ+ukIP2VROABp5/zrXxsW5xBH3Veow+imCXD4GGyv9ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729992305; c=relaxed/simple;
	bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5VSlFiSC45m5SANGi1CbFYKQayzqYrNdUZClBbRqlOne9jRFAv7SuNUeXYNZyhqSGYSIpondJ4w5bK4jcHYOgn+YNqcJF8zOhMQU8ksgdYnmTo6bJW6ESnpsUOyLef+w1fVzGo9g/IohmyFq0AzPhoMnHbmjNEtBXYgK68UGNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DVhEOFR+; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53a007743e7so3796511e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Oct 2024 18:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729992301; x=1730597101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=DVhEOFR+/rpz8ej7WB5YeAmPm479hKUMEusfDasQxJNNfW7MPiFfDWStw8+7xh0Zax
         41YbShpNZSAk8e5Hwj8w7WiMag8Lv6tIt3rp1JRalk7RmL839yeKZFdvepvZODKOrV4b
         sqfpwM33bxzszEnI1yHkg+BRdkwcMu03M8iZIKjpS9kIpme7DsXChMVsEEiN8QrWRjJ7
         tW8/skIZejwFr7EcExYFIW8eGnnNhm2oOOd1yxqYwdGBQaDO1r1e95n59+4Ws6uPEKma
         B2c9+IqIgn37Ix0zbQBolFaBux7hCrgkNIJUgS3CqydQQvy3ZBx511LBVGI1fQZo2wmt
         ZVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729992301; x=1730597101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWbqeFeatJwTSwfIbMsvs+JYctmC6KE3I7fU3fJLjdw=;
        b=HSyE06FWF4mldfUz/neGIL4G8fd1OUK+D9SoV2h1MUZW7s56Xd47GTV4YhpmMvRiE2
         7/DPWzfZv1Wncb9Jjm0rLHQmkYeOPBTuL5OGGI2gfDyLoruz/PcP/OFo8ibORehmIPgK
         BeP9+hVky6zaksnc9vsMTjz+pfEQ5G8kkdr1kRCBckpb3yYwYONxD35rJLoFCWzjCq8T
         332ixczNXhhXVFpeC1iavEigV0oDjAhB6JVU24dXKFO4Ld8X3785QzSkFoDE8eZKUNHQ
         /wJEWUM9PzKk18uOfYqS/HVRKN04QKbyzVBJ/vn0ycIpaJkGm89mCmvNk6uYzCBJ60ho
         d+NA==
X-Gm-Message-State: AOJu0Yx6sV0VS0qUn+duxjp9dMK0Uy8kxkZZLrPMtLSrmtMPborlCir2
	VJq7poVd74hwTfl6mtUYHGKbqL4heeJfWAVL96mCdmWzCtWim4yvylOQaEclWAQ=
X-Google-Smtp-Source: AGHT+IFXnE+E5lgyH76XL41dcobF7qPWzP4mMHlo1WdN4Nj/8E5GnV4Ll42tM/rfRPqAMNyqzWPM1A==
X-Received: by 2002:a05:6512:318c:b0:536:53e3:fe9d with SMTP id 2adb3069b0e04-53b348d62e0mr1420881e87.18.1729992301063;
        Sat, 26 Oct 2024 18:25:01 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c901esm642356e87.219.2024.10.26.18.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 18:25:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 27 Oct 2024 03:24:45 +0200
Subject: [PATCH v5 06/11] clk: qcom: rcg2: add clk_rcg2_shared_floor_ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-sar2130p-clocks-v5-6-ecad2a1432ba@linaro.org>
References: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
In-Reply-To: <20241027-sar2130p-clocks-v5-0-ecad2a1432ba@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3985;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DWgkCUleQv61cF52XKRC6NW3EAFyFKJ2O9J1+CznBwg=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnHZZhERxLygQ/vrejVccLqboHsQl3cHt3oe39X
 vd3x4wO1p6JAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZx2WYQAKCRAU23LtvoBl
 uKFVD/4zYKFtC+DzoYzXjRg1KDrKsCrvhKRPAACAiu4wEsd3FccfRU1msaAy76yoBKCkxRuOb8G
 GN6ig60n1ODWjI+G8R09U0llTEpHXbtJqQnxKzR1lH58JxHkuiODVshTtjebR+cMLe5Fnrk51sO
 x6MBhli9I4lz9qodxsPQaDsOzkyHszyD8r2MCCS7o6rOhs1KKZzrwu7KTNNNp4Andeqe9M/rJ0n
 TGog6cjvrdPur2yDEsgoPTV7lxV/XdPeXwP/bFzoQCYgyscHauY4Pa9x/Y6huzyq3u8Dh58ZfwT
 QieZh6MFvkOk+hEHo6PKObVM3wXcUrMYFSZqy12+fxXjkV0pVaKO1Xs7R6OGp3/r+bkIXpL+7Z2
 e3z4g02CRTIhLaLIMndlE59AocVq6BICX3kbVt2P/XWARaYFHbIKlHgsCUgOk7sXQc2Qezu5rpp
 VNpfH/hW7mxdEb2xxD9lCjGQ3MDyrjlb7nKPyd9YUowZQz8394hnO6zZiaAHprWmbzK/is6Gcuj
 mYrh58HOLGk/828Rx00Uwjx67SnJiYNbqNo837XgjJIa/nkrBUWxA5yZwVfK6EepZ1LIxL/PTV7
 ScQ44dgizcuz0TLB1b+mmFA5jxXXYfAXAVxZFVTAGo46cXfy4xyDaU86sBA4Kx8MOdbxyj3Oygn
 L25sEMKqtNGxcdA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Generally SDCC clocks use clk_rcg2_floor_ops, however on SAR2130P
platform it's recommended to use rcg2_shared_ops for all Root Clock
Generators to park them instead of disabling. Implement a mix of those,
clk_rcg2_shared_floor_ops.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 48 ++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index 8e0f3372dc7a8373d405ef38e3d5c747a6d51383..80f1f4fcd52a68d8da15e3e1405703b6ddc23421 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_shared_floor_ops;
 extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;
 extern const struct clk_ops clk_dp_ops;
 
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index bf26c5448f006724b447bb0d9b11889d316cb6d0..bf6406f5279a4c75c0a42534c15e9884e4965c00 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -1186,15 +1186,23 @@ clk_rcg2_shared_force_enable_clear(struct clk_hw *hw, const struct freq_tbl *f)
 	return clk_rcg2_clear_force_enable(hw);
 }
 
-static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long parent_rate)
+static int __clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				      unsigned long parent_rate,
+				      enum freq_policy policy)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
 	const struct freq_tbl *f;
 
-	f = qcom_find_freq(rcg->freq_tbl, rate);
-	if (!f)
+	switch (policy) {
+	case FLOOR:
+		f = qcom_find_freq_floor(rcg->freq_tbl, rate);
+		break;
+	case CEIL:
+		f = qcom_find_freq(rcg->freq_tbl, rate);
+		break;
+	default:
 		return -EINVAL;
+	}
 
 	/*
 	 * In case clock is disabled, update the M, N and D registers, cache
@@ -1207,10 +1215,28 @@ static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
 	return clk_rcg2_shared_force_enable_clear(hw, f);
 }
 
+static int clk_rcg2_shared_set_rate(struct clk_hw *hw, unsigned long rate,
+				    unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
 static int clk_rcg2_shared_set_rate_and_parent(struct clk_hw *hw,
 		unsigned long rate, unsigned long parent_rate, u8 index)
 {
-	return clk_rcg2_shared_set_rate(hw, rate, parent_rate);
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, CEIL);
+}
+
+static int clk_rcg2_shared_set_floor_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long parent_rate)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
+}
+
+static int clk_rcg2_shared_set_floor_rate_and_parent(struct clk_hw *hw,
+		unsigned long rate, unsigned long parent_rate, u8 index)
+{
+	return __clk_rcg2_shared_set_rate(hw, rate, parent_rate, FLOOR);
 }
 
 static int clk_rcg2_shared_enable(struct clk_hw *hw)
@@ -1348,6 +1374,18 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+const struct clk_ops clk_rcg2_shared_floor_ops = {
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_floor_rate,
+	.set_rate = clk_rcg2_shared_set_floor_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_floor_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_shared_floor_ops);
+
 static int clk_rcg2_shared_no_init_park(struct clk_hw *hw)
 {
 	struct clk_rcg2 *rcg = to_clk_rcg2(hw);

-- 
2.39.5


