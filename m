Return-Path: <linux-arm-msm+bounces-39484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2F09DBB57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 17:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D8A2810A3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Nov 2024 16:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5105A1C07DF;
	Thu, 28 Nov 2024 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PxoYXPUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852AE1C07E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 16:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732811891; cv=none; b=FHsb7PcMh87pQg5wnFji8S3XNWlh6LUmI1j/zoGk/xsTZvV51koLegF9vjJkmCcHIGU1V0W97xNGHInhPhYKvf8IkrfqLH+wDJVPRhrl9gLUbyFUuFecu2XcvJFMMJEgAwrPxiXpoo5+fUoArrRUyZsPYnnZlRQbb6j+p19VJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732811891; c=relaxed/simple;
	bh=/f9lA72X/ORQ7pcy2S3XGqJGhHnwd9S3RJbZG1bW+c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ghyli+fk9NlYytfWf5ycAR7kLZZEwfQFMBQY0bc4BBPOyYRCyMkVslzhOLSchMDzvYazwFzYm3RPKioT2ucVxLIYcset2I0CnzJM38J1myLY7gHIaIO1BhrGYslcUe2epCu0mU7mGWKVfI/z0X6fiwDeydnLJ7piTl/NJkTKHz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PxoYXPUI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434a8b94fb5so6494625e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Nov 2024 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732811888; x=1733416688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkkZ+w95DsCr21/2mV7KTwZ4aDH2tLnISRljFlMlIBg=;
        b=PxoYXPUI2vBwj5FTDqqQCmGmNSYCPOv+3OTuZj4NOhvUldU+BRXkF8kEL0y0EeexvF
         330m4w1uZW/sKFTHe3CkiTzqI6/QQXZAKZ6eJrPm7lqRUEKU6eJ+Q0zv+z5eav4vABYS
         sg33teNekAy09mhny1pvTTC9RKhycOH+3aghu5SYOuzR7ZBMWx8vUW4XTBs4jRYyhEZf
         A1jaGQ20qpinp7Ec2rXjb9NiOPrPFhtLjyCA2wDjqONZX95yzFJeKUQMEtaUuyW0OO7R
         BQ1IAICUp8+spyONjdNozW8ebtslP9x8IGKBM02QDSsdPzOjx4WdQ24AzuCsMvijMDXp
         5Idw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732811888; x=1733416688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkkZ+w95DsCr21/2mV7KTwZ4aDH2tLnISRljFlMlIBg=;
        b=eBBg63xTtfyAmt15ya0jL1S0c09WAhox8gHdRega/jkg4RjwfEvR4PCNwzhumcmBlo
         ZxMLx3B6aPywr0NIFKAQeHR1UrHW8nFtuK/r+G0D/Ysmw7lA4AHc9KA4V5XOfUFKw+7O
         RGLwwKhjokIeCSwJ2WofcGijdxb8GX/j777gzPEERUlTArTJnLjygZ4Bz5KPWftz0Cn3
         1arftZYO4q5i1TFvbwsIsCe5FOlzuOSL1wQBLjri7fPLZ9tv2kQbnq+ZkqFNB4YDAWJl
         qTxqRj+V811GUfxULvrsEsu0dXw2cmP3z766CvKEmsOgOa9j/Coi6kDma4Eye8XSmjSB
         2VbA==
X-Gm-Message-State: AOJu0Ywww4auy2g1b1bPB1yaISzOzC4C8JR1OM6OU2+map9vk1WPjnIc
	UIIiUNbCLl3kth6u3EyOP5UBHbk1bAvptOEB+usl90oPWf9rvYLWFgXJNRr+nYc=
X-Gm-Gg: ASbGnctENqmX/1xQN0WYsoWaxbWMdbqxl/WVQKpdManR6r9EnF4db8G9B1baseVLQW8
	RJETTFd6VMopE08DuMQWoxGuYKuryUZtEi7MwLrdoy3fVJZ559Sznrnic0eE3W+MbF87ZyRZnKi
	XKGRVe60fduQOPHJmkxxdgfwVn/MQpPoTwAR8OfOL+YhjgDKdyCLujcQdvkjIsUKT9hMXmBl/Dw
	CrIvxT0wjVH33cDpZS5jhZvSXLgAysXKXcTF1DduZb+XuFb6l/pFya1GX4=
X-Google-Smtp-Source: AGHT+IFZ0tfqwMWMoYCA98m42itlZm4kdOIHsdPFaXo48Zatt+TaoryezMrflvGllQJI70tUdXCUig==
X-Received: by 2002:a05:600c:1908:b0:434:9f77:e1dd with SMTP id 5b1f17b1804b1-434afb9ff7dmr34087765e9.5.1732811884986;
        Thu, 28 Nov 2024 08:38:04 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa78c202sm57990155e9.26.2024.11.28.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 08:38:04 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 28 Nov 2024 16:38:01 +0000
Subject: [PATCH v5 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
In-Reply-To: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..e6a024e95ab5f4b0776ffc6c7b3bebfbebb007fd 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -294,11 +295,19 @@ int qcom_cc_really_probe(struct device *dev,
 	struct clk_regmap **rclks = desc->clks;
 	size_t num_clk_hws = desc->num_clk_hws;
 	struct clk_hw **clk_hws = desc->clk_hws;
+	struct dev_pm_domain_attach_data pd_data = {
+		.pd_names = 0,
+		.num_pd_names = 0,
+	};
 
 	cc = devm_kzalloc(dev, sizeof(*cc), GFP_KERNEL);
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2


