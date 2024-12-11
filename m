Return-Path: <linux-arm-msm+bounces-41381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 404C49EC0B2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D08C2282F8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 00:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6210B22331;
	Wed, 11 Dec 2024 00:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IRG6qk+i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBEA179BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 00:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876873; cv=none; b=kJLT60cweCWammvCY8RKiUij1BGhvjc62hg4Wca7DZ19AYJ9qC4MJdNfaMwTV+f0iWTxf3DMTPqBbaLfnG7Yw3GsfGXs0mhH/L0q1mgRcs4q1nBj1Oq/zvv6AdljKVc3fjfPx1mQVq1e4H+VngMtEuqoKyVcZbfb46OsFF8h47Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876873; c=relaxed/simple;
	bh=/f9lA72X/ORQ7pcy2S3XGqJGhHnwd9S3RJbZG1bW+c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cAq0x1e2ti+PBpRP5BCqvZk56VgNaDFGeWZtLMuc8RwKGXsgAqZUcnBivj45issT8URcq0SsR4GCAAnREKisi8EZclYEYjTAws7sTA98LggMMyXEWWHKLwVHi6NCOaIK6KgUZE7N1ELsHXEi+BujfVAq/GMmQhC9VaNiW1DEwnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IRG6qk+i; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so8244912a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Dec 2024 16:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733876870; x=1734481670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkkZ+w95DsCr21/2mV7KTwZ4aDH2tLnISRljFlMlIBg=;
        b=IRG6qk+iZgpbkaUtrOOnfDLoiqteLvyhg0jcHeD08es2uEClJ3jhTyzf4RubrsMVgn
         x5v5nsQswB8CKVNaSwDG1i3Xhhk/zb96hQietTNsWATA7OXMQyUDS7RciLc+elHYb1gp
         MQRfEZI41xXSBUQ1+qRTwkDBwKglFiqj0RNeUI23OhIE8NlcQ+lF4+Mwn+ff9Fpw2MlN
         g0+3AB6HVQrPnymtTCVIr2rPU01r6gVyQk9Cjvp6m/uTBZs3z+g8Rok3TmXRoMzWAWoP
         JI+TK066gQkE5AHqGb9BAoBYgb6Pskob5G65GZnE38zy2jHJDmlA7msNB2wmniLopIn/
         vroQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733876870; x=1734481670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkkZ+w95DsCr21/2mV7KTwZ4aDH2tLnISRljFlMlIBg=;
        b=sG+ucT6nPz691mx08OpDzZSV/cyyQj54nSTZDnnxGH/C1aEoHMTiKGLh4368gh2fnk
         ypALRz0XSbztdHLdwsv4Mlb5p4QL23UPB/8WIuH12XQx8BBgAGN1vzB7GSUW/82APv72
         0f0/GnFc3EA38vegAz0yO5CtJXkwcawkJtBVrDTcG616SxUfIe7yQcF1D9x1mMNwS6Px
         oAiTuObhLxgZRGXobLXOlxcS2dTTdN4P93+Ybd0sfo8n0Xw+YWH56jDTykO4wah4/+Ns
         niNMGUYrxbiUUrs3F0bpJr2AmSsXCApaute0PJyhgGON3yOB/0QWYw1RgK7WLaNSV7rL
         4e5A==
X-Gm-Message-State: AOJu0YxO+IZgfxWyJPL60TzOTBnF266o8O9pcMTEelFvxm3gfvdJNlfG
	tzXDtR0wFD3uf4lzKoRJz5Gbggv5unohcBmMmZrQ0cdGevBLEHq3Asfl7EMAHLY=
X-Gm-Gg: ASbGncsU2hbCar7JxiiiKN2vdpKWIT0v+zakYohqQ/TkkNgFYXI1PIAbjXor/1yeu8L
	56iiCJwT5v7t6R09meiSQmnFmBQS4HVlCJc/CPseZklhjxzoDkRUlR9Vw35xG1efj9R516DYS/N
	gnubccJHHPM1MDY/0jzGYKzY715s7Y0XlQzZGH0F8A+CkVkk5KurM8tL547Ssk2ST88bfo1Bhfk
	TbXWdBpzosDfp/VFth/DEdcTQCh23daknMzYHerBNqDceMZHcqvWChlhnG/FMU=
X-Google-Smtp-Source: AGHT+IH0weeSvXJZ9/fmaqGQogcxSdDJXMNlLMLnXqel/oLpKq3X+9N8DWE1od1gJ7+OXEZh1t63Ag==
X-Received: by 2002:a05:6402:4011:b0:5d3:d7ae:a893 with SMTP id 4fb4d7f45d1cf-5d43315d980mr760873a12.25.1733876870026;
        Tue, 10 Dec 2024 16:27:50 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c7aa97asm8155530a12.73.2024.12.10.16.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 16:27:49 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 11 Dec 2024 00:27:42 +0000
Subject: [PATCH v7 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-2-7e302fd09488@linaro.org>
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v7-0-7e302fd09488@linaro.org>
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


