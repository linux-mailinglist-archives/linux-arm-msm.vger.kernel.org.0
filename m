Return-Path: <linux-arm-msm+bounces-45621-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696E5A16F94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D745160A8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 15:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BB971EBA14;
	Mon, 20 Jan 2025 15:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H83XQcP+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196A1E9B2D
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 15:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737388029; cv=none; b=GVcKlGfTbUxemmcquf/UVo+iZmvYGBwbIyuhzhF3cOv7avvDWffLTzKcfrrfrc8ib4xEPHTbVaeam7vOnUpycCWYXtSy/PgIYzxXqNJOE8VWdqQnQ6e7/NnCGP1bmY8ncD7JarvBf/d+91YbgPiQEBWAgrvfvSOCAwwLOJeiw0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737388029; c=relaxed/simple;
	bh=euYfKi6RveOCv15n9fSLKijoGtue6vQDoiVYkUVNXvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AZY1EYneHrsmKFzfG4xoVUVJDYHNFmO3J1rydEblrHp+bzn8Ht2ucaGQc27C5kSk5gIwcza6jE+1X4DAdkn9K0tAvE6jXFk9MIsg0w5hqkc/m3nxL4ca04R+c3HSY424rhJwlTsEqJPTBq1f5GhcF02IZMUevuLPA3tImo22V/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H83XQcP+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436a03197b2so32072485e9.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jan 2025 07:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737388026; x=1737992826; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWtGAhgBvKhWQGIuaAEBN/8js/VBQ1m9E3+VnyPicWA=;
        b=H83XQcP+QH1rjaS+nlqe7q0RqSZkle1E/rEOz7Hc7frV0ytMYgDDd8VsM7913ZRmUC
         vmYeyzqJ/IgZLMQ0mxrrqMLmtWtBc0uFqt6ajcAaYwCFjUzUUnHJ+dcHHKmsbW7VTdBM
         27elihJenFc3OYYfvVHlNXf0LAi7f7vWIXm6azSSKbgePe//NdXBw4v5CvtyY/Jx8Rb8
         7bPISkDpIUcEMgg7LATnEq4G2CwOqj6igip406ImcotKp8phxZe2C8IRSTz3UmNBukIX
         NC2/SYgq6gzstJVj+bXh6I+mfNczSJobRA4sqs6wmbxxwcgpP6uq2a88bmecbJAOKhjN
         V6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737388026; x=1737992826;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWtGAhgBvKhWQGIuaAEBN/8js/VBQ1m9E3+VnyPicWA=;
        b=EwNJkSUKL8TwlLJZ1OEJqbsjFtgTz1pcLhdTbDFW2wQQWCJmDSCjOhAq9ALtekjUf9
         sz+974JG1GKvXlKJ0Qy41Suayb5wSiD/mPTb7aUofbDf1UauMZumtLD4jNFNmdy0oSTe
         pvmqQkwH2j1li3GncAI68VKSbUfqnWhIqlz2xzN8NodM5vPUd51juFpfbKbMBsUXYToj
         Cvejpyt/0A42u3WlHdz8TFgWRTbwMUHvIG0Uxg8OyL7N4+Rjf/UORg90Sl/4VmErw+ci
         2l7kboW9o9Y0Pmh7Hay966azhjm7t4unOpmT2+FjF+gs2wNyI+jJLZ9UNxOue1VRpd4X
         jcQg==
X-Forwarded-Encrypted: i=1; AJvYcCXYcs5KjnWyLNRX/u3J4d76nZolg0AxrB/TYzVoTb3mDby7FOVd20O0vdNLc/+O1zPGurSpIhpswY9vp/rL@vger.kernel.org
X-Gm-Message-State: AOJu0YxCI+BoRjbKbRtsGUkRtMfwaiPE3NwJmvYyZXSs7oKZoofaB1RX
	pqj7XvTBSN6Buu5mtPDTSpgNF4+D6VyM8X4V6XAI8amEaWgky37AY1i9Ej8fGQ8=
X-Gm-Gg: ASbGnct5r9D/9l/55B/VEWsGkgCvTh5xoR9rw1VBDcizxfflBTE3MNcgKMSp2ipx4/c
	CH10lQCZ2ltiaHNb0hrqQmSlO5fkadUafE31s6rMRUo66/q2INh4uBuaUNDAyHg/FWBRcOdbqgn
	ILN8rBnXyWF/xGkKwQbh3H+OXekBym6lKR1YdDdP4O/AVDkA9htorFUH7XqmJtNQukDhcyrIaUA
	ibfsbjSOWLZ5zxI3hso6pPcvRlhF5DhSocIYYuSB4c54WVdpYR6k4jViMtgNmS3754P09t9vx8o
	9H0=
X-Google-Smtp-Source: AGHT+IHP9AWNpifZYXHWrmOJENBRqAn5TBSbWs5SJDF1NXillOdikFEQ43YUkTve9hxn/EdJtwBU/Q==
X-Received: by 2002:a05:6000:1864:b0:386:3328:6106 with SMTP id ffacd0b85a97d-38bf59e199cmr14430699f8f.35.1737388024211;
        Mon, 20 Jan 2025 07:47:04 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221b70sm10645766f8f.26.2025.01.20.07.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:47:03 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 20 Jan 2025 15:46:58 +0000
Subject: [PATCH 1/7] media: qcom: camss: Add an id property to struct
 resources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-1-44c62a0edcd2@linaro.org>
References: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
In-Reply-To: <20250120-linux-next-25-01-19-x1e80100-camss-driver-v1-0-44c62a0edcd2@linaro.org>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Depeng Shao <quic_depengs@quicinc.com>, 
 Vikram Sharma <quic_vikramsa@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-33ea6

In various places in CAMSS we assume a linear set of declared devices
{csiphy0, csiphy1, csiphy2} which currently works for upstream SoCs but for
upcoming SoCs some of the SoC resources will result in a set such as
{csiphy0, csiphy2} which will break the naive for() loops we have.

Introduce an identity property which resource declarations can populate
hence facilitating non-linear resource naming.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 drivers/media/platform/qcom/camss/camss.c        | 38 +++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 86b98b37838e1..ab91273303b9e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -81,6 +81,7 @@ struct csiphy_hw_ops {
 };
 
 struct csiphy_subdev_resources {
+	u8 id;
 	const struct csiphy_hw_ops *hw_ops;
 	const struct csiphy_formats *formats;
 };
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index f4fbf0d73dd1f..a128b1d1c6d57 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -46,6 +46,7 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_2ph_1_0,
 			.formats = &csiphy_formats_8x16
 		}
@@ -62,6 +63,7 @@ static const struct camss_subdev_resources csiphy_res_8x16[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_2ph_1_0,
 			.formats = &csiphy_formats_8x16
 		}
@@ -318,6 +320,7 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -334,6 +337,7 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -350,6 +354,7 @@ static const struct camss_subdev_resources csiphy_res_8x96[] = {
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -524,6 +529,7 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy0", "csiphy0_clk_mux" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -542,6 +548,7 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy1", "csiphy1_clk_mux" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -560,6 +567,7 @@ static const struct camss_subdev_resources csiphy_res_660[] = {
 		.reg = { "csiphy2", "csiphy2_clk_mux" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_8x96
 		}
@@ -756,6 +764,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -778,6 +787,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -800,6 +810,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -822,6 +833,7 @@ static const struct camss_subdev_resources csiphy_res_845[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -998,6 +1010,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1011,6 +1024,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1024,6 +1038,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1037,6 +1052,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1050,6 +1066,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1063,6 +1080,7 @@ static const struct camss_subdev_resources csiphy_res_8250[] = {
 		.reg = { "csiphy5" },
 		.interrupt = { "csiphy5" },
 		.csiphy = {
+			.id = 5,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1277,6 +1295,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1291,6 +1310,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1305,6 +1325,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1319,6 +1340,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1333,6 +1355,7 @@ static const struct camss_subdev_resources csiphy_res_7280[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sc7280
 		}
@@ -1580,6 +1603,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1593,6 +1617,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1606,6 +1631,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1619,6 +1645,7 @@ static const struct camss_subdev_resources csiphy_res_sc8280xp[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1948,6 +1975,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
 		.csiphy = {
+			.id = 0,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1961,6 +1989,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
 		.csiphy = {
+			.id = 1,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1974,6 +2003,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy2" },
 		.interrupt = { "csiphy2" },
 		.csiphy = {
+			.id = 2,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -1987,6 +2017,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy3" },
 		.interrupt = { "csiphy3" },
 		.csiphy = {
+			.id = 3,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2000,6 +2031,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy4" },
 		.interrupt = { "csiphy4" },
 		.csiphy = {
+			.id = 4,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2013,6 +2045,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy5" },
 		.interrupt = { "csiphy5" },
 		.csiphy = {
+			.id = 5,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2026,6 +2059,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy6" },
 		.interrupt = { "csiphy6" },
 		.csiphy = {
+			.id = 6,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2039,6 +2073,7 @@ static const struct camss_subdev_resources csiphy_res_8550[] = {
 		.reg = { "csiphy7" },
 		.interrupt = { "csiphy7" },
 		.csiphy = {
+			.id = 7,
 			.hw_ops = &csiphy_ops_3ph_1_0,
 			.formats = &csiphy_formats_sdm845
 		}
@@ -2566,7 +2601,8 @@ static int camss_init_subdevices(struct camss *camss)
 
 	for (i = 0; i < camss->res->csiphy_num; i++) {
 		ret = msm_csiphy_subdev_init(camss, &camss->csiphy[i],
-					     &res->csiphy_res[i], i);
+					     &res->csiphy_res[i],
+					     res->csiphy_res[i].csiphy.id);
 		if (ret < 0) {
 			dev_err(camss->dev,
 				"Failed to init csiphy%d sub-device: %d\n",

-- 
2.47.1


