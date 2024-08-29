Return-Path: <linux-arm-msm+bounces-29934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA4963EF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 10:44:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B2B1F23B69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 08:44:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448C418C349;
	Thu, 29 Aug 2024 08:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wCAGlsQ5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178EB18C92E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 08:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921076; cv=none; b=DBpRCR1wji8sH3u77rsyS3uAeA74dXEkhjVG6X2idCOLhd3Mm7FQoHpBgCGYENuwrYRW0KaVGp/WpvLCnY3A8aElh7FXBxlpzBpZEj9isRqCWCegRoid9hvA5VK7lcnmWrq78GSko5bMF5cA23VbTstj5G3WWVseUigZ34LYGYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921076; c=relaxed/simple;
	bh=YXPu+02a3iAoSDGi0S+a+LddESyhQMLo5+sL2vOPM+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DHTguMykGuFXNc5Guwy1WK2+/O3RVXo8xYRgt604odIF7LCEavvBc5VBT5/6U10eDWPv9jBGBdSynOHA0906vIit0RqeNRmCAzcyrMKb/Rv38pjkAqa8Yw0nLHqKCDOVL3IWnJ2JIMO9dTDiAU+EN3ZUQqybofVeKlKXnc11vxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wCAGlsQ5; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428e0d184b4so3222775e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 01:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724921072; x=1725525872; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MQjRV8KDG/Lpcqg2hQHcveqFn+Rg4OZ0FjrZ9YRvTig=;
        b=wCAGlsQ5TbI6XcBICYe8oBPUC7vNKMp5htldl8aPN3rsQ3Eh/2qgKlYFBLEV9//0bX
         RvThXrJNS8vMeUd6ebouxIZvGQcL0lJNNUsnA8gQK5ksEHOx9eohFmgZiqlVefgiM3FE
         6X9lod+8xnqlu6lU5+GuIMNIiLlGagrMxpQXyZIhk3dEVgUkjHT5Bmv66MtM7QBdoxbs
         4KO7xC+gKvrLhVLFrdCjv3Mrhk75i2ws7Hh2XJ/0mjWoRHKVDVNUeJT5E8yPyi4YE8CA
         0wJOkzDzS1FkCnItPw/jUpAQzGNHEmclcEGRULhH76TjSUR1WfZnenWjT4mMA1jJj6r2
         tKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921072; x=1725525872;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MQjRV8KDG/Lpcqg2hQHcveqFn+Rg4OZ0FjrZ9YRvTig=;
        b=WCfXde5+VMY1Y7rZUBIvK5pudXdkOc0E4czp2idr4AhNOKTvHjlqJjwZKnTYcjpKYj
         gMNJ3qGJqj/maLN9zGF8VNzEXebvNDMjXGRqF/3wm2WYYGpDeKnxudK+ckU+VrkJ9IvK
         3GKk+5syBCLYPvz1+rPmUeZZzZaQ+LH2qXflGVFlRbFL1Oh5/myVcuWuvkjQbveX2zZ6
         sc+MLe6yQ3ZKVPzD1IFGf5jQ1VvDn4EDZUIYkOhareanDFjnjXbw6t6mfLbFb8yacUMY
         HlugLl5RYh51snFXWr+eXnClRRH6ZswKYvCARUE8+G7a+aKbOTYVoEE+Nz/UYjsv8qV8
         kDew==
X-Forwarded-Encrypted: i=1; AJvYcCWcqN9Kn+jC++6LDxa1wIK38UMUWkCag7IJPWFsj5q/OoXu4cucEfHhySSP5cMjg16Tyry51lrJ4iXDtYfm@vger.kernel.org
X-Gm-Message-State: AOJu0YzlY4IK1iZTJU8DIgF7q1x2dTIrbCNwp5/w8FAzY7kDMVU4/Fe+
	yFQ4HjO+2tMYeppvC+g6/dizZb4SkKEW34ClHUkUsDU2lkw08QcoCPJoM9tSjPJ12nVGBJzSB1S
	w
X-Google-Smtp-Source: AGHT+IG1+aHrBKmftPD5hD1/Gw1QzmryaaDfQm+O0lrXVsW+w70Wpwoq7GzWBif5V6emk9i+uEwT9g==
X-Received: by 2002:a05:600c:3b89:b0:426:6688:2421 with SMTP id 5b1f17b1804b1-42bb02ee44amr15226835e9.11.1724921071907;
        Thu, 29 Aug 2024 01:44:31 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee413a8sm835489f8f.6.2024.08.29.01.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:44:31 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 29 Aug 2024 10:44:30 +0200
Subject: [PATCH] clk: qcom: gcc-sm8650: Don't use shared clk_ops for QUPs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240829-topic-sm8650-upstream-fix-qup-clk-rcg-shared-v1-1-7ecdbc672187@linaro.org>
X-B4-Tracking: v=1; b=H4sIAO000GYC/x2N0QqDMAwAf0XyvEAtc7T7lbGHLkYNm9olKoL47
 yt7PDjuDjBWYYN7dYDyJibzVKC+VEBDmnpGaQuDd/7qgo+4zFkIbQy3xuGabVFOI3ay43fNSJ8
 3KvVoQ1JusXMx1BSb8GKCkszKxfzvHs/z/AGZy3oQfgAAAA==
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9677;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=YXPu+02a3iAoSDGi0S+a+LddESyhQMLo5+sL2vOPM+k=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm0DTuzl+wC/7w2kEgdeX7NvE2rL//wlu+ELjR0C7s
 Xmx+fC2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZtA07gAKCRB33NvayMhJ0YUGEA
 C4hh1F76HXdf57QROJWnIZ734Rygpzt/+p6q61oQ63ZG63+HaEFoJi3f8CXtQAYNJZm3W+eNgzYs5b
 oSFi2dO0a+2WY5tKabygJC9Heq4WRis4UqqDS+lueK8FihoI2fTKmLNjYWI3Hgic7CbaWIrUKvg+h8
 TxolPTsE4sVbzPJBUK5phMyozdmapmkPmKthQ1c6qjwHSDDS0diOx1+M4jSHRixi8wgl3SuYzkGa48
 IrzBE9WtJXiVtu04t45Fd91ZzUFklTg7iwj3j2nBs+e7bK/1nLtl9mtmdCk+DxobJG1bmTm4vk0IkL
 b2utCVDhfuanRNp272CqlbXrHKmSTa51/L/7pcOuNU868nlsgydTZdcztk/VqlLBeXjS1Ydcxz2t/0
 N2PvBH3ckcXzw5ZaUUT2ojpl1oZH5if2r7oN01XzpozDqNjzpI2NI6+z3wbSHoem33aVctZgcWU8VX
 mgznb3tRxGuwLL9Eig2IVfwFOKWNFcNPa1CIstnvrPaBL4fFFn4WUJ+IOAySDylh96otfGT6UkQUre
 bKietVAfkvFeyHUxlErkJzHvY/USnEixIpIcY2D9Gd0QQALyf6ue9OqJPpVSyyc9JYAfR8oz3o7qPk
 J+hgSy7o5x+354SLPMI8yGk79oXXs+m8uzIWrUZACDnVkUkw+Bk/8wCtuJ6A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The QUPs aren't shared in a way that requires parking the RCG at an
always on parent in case some other entity turns on the clk. The
hardware is capable of setting a new frequency itself with the DFS mode,
so parking is unnecessary. Furthermore, there aren't any GDSCs for these
devices, so there isn't a possibility of the GDSC turning on the clks
for housekeeping purposes.

Like for the SM8550 GCC QUP clocks at [1], do not use shared clk_ops for QUPs.

[1] https://lore.kernel.org/all/20240827231237.1014813-3-swboyd@chromium.org/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 56 +++++++++++++++++++++----------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9bc19bea0c97..fd9d6544bdd5 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -713,7 +713,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s0_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -728,7 +728,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s1_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -743,7 +743,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s2_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -758,7 +758,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s3_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -773,7 +773,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s4_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -788,7 +788,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s5_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -803,7 +803,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s6_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -818,7 +818,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s7_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -833,7 +833,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s8_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -848,7 +848,7 @@ static struct clk_rcg2 gcc_qupv3_i2c_s9_clk_src = {
 		.parent_data = gcc_parent_data_0,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -863,7 +863,7 @@ static struct clk_init_data gcc_qupv3_wrap1_qspi_ref_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_qspi_ref_clk_src = {
@@ -899,7 +899,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
@@ -916,7 +916,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
@@ -948,7 +948,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
@@ -980,7 +980,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
@@ -997,7 +997,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
@@ -1014,7 +1014,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
@@ -1031,7 +1031,7 @@ static struct clk_init_data gcc_qupv3_wrap1_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap1_s7_clk_src = {
@@ -1059,7 +1059,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_ibi_ctrl_0_clk_src = {
 		.parent_data = gcc_parent_data_2,
 		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_ops,
 	},
 };
 
@@ -1068,7 +1068,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s0_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
@@ -1085,7 +1085,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s1_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
@@ -1102,7 +1102,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s2_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
@@ -1119,7 +1119,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s3_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
@@ -1136,7 +1136,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s4_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
@@ -1153,7 +1153,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s5_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
@@ -1186,7 +1186,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s6_clk_src_init = {
 	.parent_data = gcc_parent_data_10,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_10),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
@@ -1203,7 +1203,7 @@ static struct clk_init_data gcc_qupv3_wrap2_s7_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap2_s7_clk_src = {
@@ -1226,7 +1226,7 @@ static struct clk_init_data gcc_qupv3_wrap3_qspi_ref_clk_src_init = {
 	.parent_data = gcc_parent_data_0,
 	.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 	.flags = CLK_SET_RATE_PARENT,
-	.ops = &clk_rcg2_shared_ops,
+	.ops = &clk_rcg2_ops,
 };
 
 static struct clk_rcg2 gcc_qupv3_wrap3_qspi_ref_clk_src = {

---
base-commit: 195a402a75791e6e0d96d9da27ca77671bc656a8
change-id: 20240829-topic-sm8650-upstream-fix-qup-clk-rcg-shared-f0981c958bec

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


