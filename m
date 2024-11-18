Return-Path: <linux-arm-msm+bounces-38152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE289D07E0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 03:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E91A01F21C82
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 02:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8468947F4A;
	Mon, 18 Nov 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Info+vqM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7ED91EEE0
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731896680; cv=none; b=LBnaAmzmuh3WqA80vzuLafYoeEaBq4MoeVPhwpxzPPkG3j0XjeXHBnankGWmqFQVpF0JS5cCCFDhEpTtqg/dBGvDgA9BKjD2hK2j2/xvkzA84wyH+4X/bZL08DbkZx7DiMEav69a9um1+BShsSx/JSgkZmN/ubWyqFAMd8Ytpec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731896680; c=relaxed/simple;
	bh=shX2kfmh21qvlv6tMATByELEIKpfpJiUwHfYedYY7LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z0t5RzKlMgW2JrMVB9uEv87UA3QOO0Mpm7dZt3rzcYG4n/0WdlFIUsgUW6Mg5jhjsuu/jWBGPuC/6E6VVIjyUiIZ88SCBQxQS5Ad+wPoCR2JwW8afNK2Kxf9ubEU//Hlgk/Gwh04m/za+nW9Q83AdPFKeVizmEM58474P2hQifc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Info+vqM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4319399a411so33701185e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 18:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731896677; x=1732501477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0uAgwDoSqBQNwda9c8A09U/nNCzQI5DjCJkCg9WC4y8=;
        b=Info+vqMq4ZdcTOE4MoIeGdCM13THyF2Evc+8RmhTw8FuUnkAHlnf4qOUNlVVjrXXa
         tI21P91yn0DVaZvQusUfZMg7O2VYUrLeaIA/U8aevaNUV7iIjqTt39HFwstpGjnzVZuG
         o0NGzUqNIOb2GX0TvI03WvPj4sI11nS+PxgE5x5QcREc8KcoOh+1hYszE+8MA2vIuZNU
         M3M/dryimRiYB8lSGjY3Qhz4GPoFNKnzZlmtfDlI/X9FsN6zJj69ACcMkUwh+mAi/+np
         K8DPDl/t1dimvkQR54+uxPo1K7RmBHsvxGY/zCG6quPOYhHpmcALBam6S0xPJe06pUM+
         cBnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731896677; x=1732501477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0uAgwDoSqBQNwda9c8A09U/nNCzQI5DjCJkCg9WC4y8=;
        b=bZWeT837ueHD1tjT8VePECZkfumiMn3tCf9qXr+wOPmhnlIXErkuorfkRrCKOkRvQ3
         f+4QQEaLYqSX6Nk2mdjrS/jKpLo5XuFbz1I5eVh8NnKfL4q1I2WzGjt/LlRHwotAEsnX
         NzJKoQKLRX8hzmarrJGnKEk0g9xQKwPIwBL5emhAWUfe5T0QQ1rPLotmOjzfzaiq0XvO
         6BGOD9eZTrI1tW5kGzyPrVyT8YzKOHBXlCwQuufyWqDBQkeZUNhsHCoj8YCLirxGrAOw
         qO3zew/DYGeLFrGmeDnHI/av2b/Y6KIFEFw3XDuN5c9WptPCfRHj/RVPqfp7Fk8xMHGl
         xMKg==
X-Gm-Message-State: AOJu0Yz8XxK+SJrC+uIEF9RCjOzEf6YojMxeHWU+XEKle2IfPU3gHHIN
	QFselZsLPKd+oqPoVg5D0OupH6AHve9kcH7x3KVx/CyxlrRf9SFrSv6OMLHWa7z/YGq+wDaNjiu
	x1qY=
X-Google-Smtp-Source: AGHT+IFWe31hEGUtGQdW0wnikA7Pm+kGTH+e7FHWreYjGM669kTCqSCSwoXnjqCTIwK31qMF2tpcuw==
X-Received: by 2002:a5d:64c8:0:b0:382:2ba9:9d65 with SMTP id ffacd0b85a97d-3822ba9a39cmr6495066f8f.31.1731896677072;
        Sun, 17 Nov 2024 18:24:37 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2e35sm11387902f8f.5.2024.11.17.18.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 18:24:36 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 18 Nov 2024 02:24:32 +0000
Subject: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Right now we have a plethora of singleton power-domains which power clock
controllers. These singletons are switched on by core logic when we probe
the clocks.

However when multiple power-domains are attached to a clock controller that
list of power-domains needs to be managed outside of core logic.

Use dev_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock being registered in
qcom_cc_really_probe().

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b4377fa09f7c0ec8d3c63dfc97d04fbb8cd6e10b 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -283,6 +284,25 @@ static int qcom_cc_icc_register(struct device *dev,
 						     desc->num_icc_hws, icd);
 }
 
+static int qcom_cc_pds_attach(struct device *dev, struct qcom_cc *cc)
+{
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = 0,
+		.num_pd_names = 0,
+	};
+	int ret;
+
+	/* Only one power-domain platform framework will hook it up */
+	if (dev->pm_domain)
+		return 0;
+
+	ret = dev_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -299,6 +319,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = qcom_cc_pds_attach(dev, cc);
+	if (ret)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2


