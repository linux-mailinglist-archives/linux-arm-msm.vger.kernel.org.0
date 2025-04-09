Return-Path: <linux-arm-msm+bounces-53651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D73A82845
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 16:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0D693BE1E9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Apr 2025 14:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE4D626772D;
	Wed,  9 Apr 2025 14:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WkT/X41n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B1F266F14
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Apr 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209510; cv=none; b=N2Ll9wxWW3BMEsYHkoa6+AtEwxzvLRjLIMcgw6bZsYeg5/Wipn6VfGy8I+lyR8F0rN4Ab5r28ma/NkxJNOiec2sA2mBG05pmK/syPgRUntSlLc86gV2lqFrnMnNmjdqxRyNbDrKl15EaXJybQp6YB1sIOdzaoLO6wSASUbq3S3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209510; c=relaxed/simple;
	bh=UkC2xQ49cwtjimQJomEXRVHWedJyZAC8YoJhIXvmiUg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmJM2A6xnCCChJfRw99VTimWHPGn4NNpckYVo2gjr5ZkhopojYMlYFczESJld9JOHcXOsMP+TqlujNPLqNJiM7tOK6xGfhE3tXZkAUTQPiDrWQo8/aqplZm1bKRdLKvI4OKjBN5d9aFlavjyqIpC1CpjQPSpUgt4DufnGN13d80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WkT/X41n; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6099955e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Apr 2025 07:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744209506; x=1744814306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bo4P1zkBy5ZJ7KB9fJf8Jg+rHcpVMabyPlCyrK4lEHg=;
        b=WkT/X41n9slZelJ0f+IjYW4dktevFl1kI5tUYrvL+tBgdXywaca2arAOIjTTr5OVf4
         1wXIwWEQAjzavsv7ATR4yqQAYx6ETzjyEvSi2Z57zOArhF/1cqoBH1j4JpG10ovuyZZu
         DuN4BLj84QAMWcNJyW1oszIsM3JALKZ1Q9nTmf2CFhfksyhafgW4fMCVCFpcFClrl7W8
         u1w+pUOrVeUWugJSyJL6jug3ZOZVD1sZmBRg0iapmtDYowDGsHgavCfERrapOLH+sERA
         DqprAH+t5dx0AruHB9EFzZXtKB5X58PUyrcbO76BWNYJ0sZDgJWQd/+1bx30458Osprm
         26vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744209506; x=1744814306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bo4P1zkBy5ZJ7KB9fJf8Jg+rHcpVMabyPlCyrK4lEHg=;
        b=fpBmPBsgBTJk81t6+hKWzRi8rySJJF1tL9jG4NmX6EjVLxZRK23Hd0QCjlf8/TYeRp
         ygARtUp24AYHOdl9h+fy+NPbS7I0nz1pcVRjuzF1hCZKqBV+G9r1xOU+/WKGlUIwza7c
         SQ03L4Xl5UQWva7hP1BPnPo19lyzXaCozWTVsS0Hf0UA4VJ1a8GPzmCIas5G7SnyFWnD
         hI3PYuBK8wWLHo9iBxMCIu+xkOBi8w0lMwR6WmsmrgAcarQ1PiiFYwM5bYgBn+jvDNce
         k9ZF/4QWGeKPhnb6CC01mk/OQK7Rv8wlxPbIxzxrAjWuND9cEeML0GrIp9nAzQNweila
         WdZg==
X-Forwarded-Encrypted: i=1; AJvYcCX88pTVDUV9abnBtX8T5n4YlM6H3pmE1bVmmcSN+XvCtJCrvoJSyCwYRiQKH4eOqFExkTQNd/pYvaKaQGni@vger.kernel.org
X-Gm-Message-State: AOJu0YzlmSb2J+0yy7A3woMlNry5GdwVnpCZ3IAVMW1lLnRSVte8Yosq
	YtZYZgaAPUP9j4MW1uYGE2fKTsZZPd39Z4V666RlA6Cpyv5pUPGMeCmM+mrHNCU=
X-Gm-Gg: ASbGncsHGbkzVkNMz8quqejduwx4e2BIHgNdZoDxNOq0oJXEDGVN2oVkyFEj/aRz63C
	6BjkbJVi/AGtkGR/Tg30GEUH1vzoWUEdLEHgDZVMOW+mbeJ1NjYRENy0HfoOR2h+079NVK9VIQI
	2diZjGBaf544PchSsN/r2PDTGWcRdUKRdsQF2RqZqTahYRWYzRr1XiT+5C0UMjnMvnspTmSaXM+
	uCe0omw0QhfH6fndJ+x5edLKUcX8qX+qhA36FpE4+uwSCshQ/Qu1SIgeMfYj+nTRvcf7wwVBwjm
	6cRXaR5kuY22zGzh2xTs+bSrDuKaoA3Qwd5iM4oqKO1odrLIlJTDkIEpx6uwew==
X-Google-Smtp-Source: AGHT+IFv7vvZGkXcHBNRCdhKTeLeBp4cYIuYHhGaihx/MrjaTEN7nvEzCapEn3UnIS2n9HKlMs6wyg==
X-Received: by 2002:a05:600c:2151:b0:43b:bb72:1dce with SMTP id 5b1f17b1804b1-43f0e55ecc4mr57604475e9.5.1744209505740;
        Wed, 09 Apr 2025 07:38:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20625ea4sm22222045e9.12.2025.04.09.07.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:38:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 09 Apr 2025 16:38:21 +0200
Subject: [PATCH v4 3/6] media: platform: qcom/iris: introduce optional
 controller_rst_tbl
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250409-topic-sm8x50-iris-v10-v4-3-40e411594285@linaro.org>
References: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
In-Reply-To: <20250409-topic-sm8x50-iris-v10-v4-0-40e411594285@linaro.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4061;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UkC2xQ49cwtjimQJomEXRVHWedJyZAC8YoJhIXvmiUg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBn9oZcV7CVwIn1ST/ZBfpW97oqY5UNsIXiraUmG0sV
 jy96y86JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ/aGXAAKCRB33NvayMhJ0d6HD/
 wJFG8FstjJU+by0UVFSAK7fztkHtey1OapUAeLcrAeOp/+KCVrUjr37A2sRZskOOqe7ybZFgsBuCwB
 wsKPhl9YJqR6ej5WIYHfrsP/3/rX5OZWM5P2TnRMPv+Y8XoZXYTRn+feo/f6+PKnTo03dYSmVPkaUS
 KQcNULUdQc4fsKPKtwIcfT8+H9j9NyxzL3Ws27HNzYTKxLvtolrv2YqurKjxk6b5tNLZducEZcX73k
 DoDCl3u4DJYHcbrxpao6Exb6g+a6NyC65mwPtyjpcoNKqe6qb3iIPEAFwhkcwV3zr7+Z0QAE0EDvmn
 V3gknp7ehLJdZh8u9KhMghvuFiQsPc4QKLQwzjF44W1370CrYvYcYzw3+aaQh+Z4CYooSBu31ZeFlO
 6tKRgT7Icfl5jWcd7WMSV0OZbEWokPoFMF616TmyOdrBnAt1jER7Z2lEzaqqMNsEzhbd0EMCtoEAbR
 KT+IOrcPd/ez7rvOUAps0ADpuYl2Af71wUoGaS8TP/hrepqJyy0w++diJVIS0MTS7zym6fxk6xlecG
 NY56NuUMe8mwVNVgVYW3Abqi1rp7A/8p9ao4RpGejbUNjApUKHlgDS0L1IrL5mkGZIKoVLwq2yz63o
 SbhUPrvHiUFjLyEny6wFI2ygOXHpNFV0yj5XTcA6ubyvRWwNGrWIPIcf1ehg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Introduce an optional controller_rst_tbl use to store reset lines
used to reset part of the controller.

This is necessary for the vpu3 support, when the xo reset line
must be asserted separately from the other reset line
on power off operation.

Factor the iris_init_resets() logic to allow requesting
multiple reset tables.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e Dell
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/media/platform/qcom/iris/iris_core.h       |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  2 ++
 drivers/media/platform/qcom/iris/iris_probe.c      | 39 +++++++++++++++-------
 3 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 37fb4919fecc62182784b4dca90fcab47dd38a80..78143855b277cd3ebdc7a1e7f35f6df284aa364c 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -82,6 +82,7 @@ struct iris_core {
 	struct clk_bulk_data			*clock_tbl;
 	u32					clk_count;
 	struct reset_control_bulk_data		*resets;
+	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index f6b15d2805fb2004699709bb12cd7ce9b052180c..fdd40fd80178c4c66b37e392d07a0a62f492f108 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -156,6 +156,8 @@ struct iris_platform_data {
 	unsigned int clk_tbl_size;
 	const char * const *clk_rst_tbl;
 	unsigned int clk_rst_tbl_size;
+	const char * const *controller_rst_tbl;
+	unsigned int controller_rst_tbl_size;
 	u64 dma_mask;
 	const char *fwname;
 	u32 pas_id;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index aca442dcc153830e6252d1dca87afb38c0b9eb8f..4f8bce6e2002bffee4c93dcaaf6e52bf4e40992e 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -91,25 +91,40 @@ static int iris_init_clocks(struct iris_core *core)
 	return 0;
 }
 
-static int iris_init_resets(struct iris_core *core)
+static int iris_init_reset_table(struct iris_core *core,
+				 struct reset_control_bulk_data **resets,
+				 const char * const *rst_tbl, u32 rst_tbl_size)
 {
-	const char * const *rst_tbl;
-	u32 rst_tbl_size;
 	u32 i = 0;
 
-	rst_tbl = core->iris_platform_data->clk_rst_tbl;
-	rst_tbl_size = core->iris_platform_data->clk_rst_tbl_size;
-
-	core->resets = devm_kzalloc(core->dev,
-				    sizeof(*core->resets) * rst_tbl_size,
-				    GFP_KERNEL);
-	if (!core->resets)
+	*resets = devm_kzalloc(core->dev,
+			       sizeof(struct reset_control_bulk_data) * rst_tbl_size,
+			       GFP_KERNEL);
+	if (!*resets)
 		return -ENOMEM;
 
 	for (i = 0; i < rst_tbl_size; i++)
-		core->resets[i].id = rst_tbl[i];
+		(*resets)[i].id = rst_tbl[i];
+
+	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, *resets);
+}
+
+static int iris_init_resets(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_init_reset_table(core, &core->resets,
+				    core->iris_platform_data->clk_rst_tbl,
+				    core->iris_platform_data->clk_rst_tbl_size);
+	if (ret)
+		return ret;
+
+	if (!core->iris_platform_data->controller_rst_tbl_size)
+		return 0;
 
-	return devm_reset_control_bulk_get_exclusive(core->dev, rst_tbl_size, core->resets);
+	return iris_init_reset_table(core, &core->controller_resets,
+				     core->iris_platform_data->controller_rst_tbl,
+				     core->iris_platform_data->controller_rst_tbl_size);
 }
 
 static int iris_init_resources(struct iris_core *core)

-- 
2.34.1


