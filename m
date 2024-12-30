Return-Path: <linux-arm-msm+bounces-43636-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D145B9FE67E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 14:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C44307A15E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 13:30:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77D401AA1F4;
	Mon, 30 Dec 2024 13:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="htZgMWK5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F9D1A9B3B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 13:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735565437; cv=none; b=FgED7IpsH8YOyPphCjhWezgQH55SNS9gao9KYqCQR5BAt27QeqKEBeFHGkm9lk1AqjvHrt1X8Es3uadp2HOB8uGRx9DhxPB8idyR3Adnc8IEG55fML8t9/oSWz1P6YkVLnAt8WXJ++FV15OUj+F8PdVF6MVs75gePmz0skW9KcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735565437; c=relaxed/simple;
	bh=BCcVhjXqM/11poMT/N4HvI5IzpguMzkE/XgunRZ0xcw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdcmuYlfI2iMDlli5S8QVHCWPnFEkZrAOUWNsCHZShlyaEoD9/gXjhYMYvdzyrO1bsfNjHxyaJTUToTPIIPYzK2TczElm7XctHYwgH1YXrz6ZAA9jzeWgpWTcEEKxOIez1rzNvUgywEMcNWCg0snUnUMpzjARf4dQs2PlwIk9x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=htZgMWK5; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3862ca8e0bbso7107163f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Dec 2024 05:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735565434; x=1736170234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=htZgMWK5gUHVGEef04/Tj62ee9ttGemK6/p3/yP1a5aqUUD5OxF9uuxttwMxseQ1K4
         Dwk1GLErE24L4RPXnxe1/9sqWw9TxOeHHC41qIOf5mQwQPCuyDrxkfLWzp0aOmFgVBmA
         coQ3dse1y8DqdKn9b/UiArIQK+DUtIsy4dYykcRmElxhsNQeU1ug0PeqNvtF2F5KZ2yw
         A8cGbQrVUhAMU9fRTYxDq94PqeIgcwqK0VUFx9HrQQ5gCO0Nm00OgaEVRVYVcOPf2jHF
         BjxIaC3zc2Tff/KAtD4unETRYzs5WzUoGWQYxRJyprINadNgjf8sCmDmSXVw5aji8O9x
         gqiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735565434; x=1736170234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3Aq0nsQUak92jzQ+dzMHRTGJEDpjujxd82cAU7SdLo=;
        b=Uo/tuLTdep4aN5Np9mz016F3SwLG/uIqXsV6FlsVFNzY+3p9PBc0OJsqeKxfexolAI
         BbLXyvaP6YnvUe2f92Bo5w8qsaJaJkdKSWq7hYqeaadJqDWDcvt12PLu4Hqz8gUZdJRI
         v8yrZ2m1190HLcbufU7JphbWjeGtQ1bR3cLhWrm9gLLB69P0DnD6smCF7Qx+yvtSCNtt
         OdxAYn6zabsB0/gVQuprY7CXvME/8QVxxbQdUq3ClCQnssbH4LFCE+abkQsz3l3xqIpE
         OF68GkVjk0bwP4OpZED1d3wB19/TncLj+hS01nVLZc3b1LRPLDsLkOianaiYzvZlS3cn
         FgNw==
X-Gm-Message-State: AOJu0Yxi088Fh/3U8oWr4pppwBEy89Qh2PsM333cRpJRiizMful3t0yu
	AQFkTNVVRkUHZg3jfloQnXUSIPsxw96pKh0CbpPv54WVJm01ZaWZOI/D77E+BUjtjLhZhy97cn9
	u
X-Gm-Gg: ASbGncsaYW/wQ321TgVl5r4Abl8XY33hukcJFuVAAhjskRwogQDV4vcuXuiRVzc8AUW
	xDXjW+u4DVm1E6rROItg8UNh7pyC8y6Q1arFBF7WU/H3jTKcQN02qyqsCsE+0mjZt2MFeeDVjVd
	vdguGT2BD9M7mhsoI4JUGuCqgSDp2ZqxbTOZy1zoT2v2pkfqWP5sGcSd1tuH4DLlIGqKT1wx3pX
	MzrexCXKr2rUgDYU6pAUBgEGK70xfGaIxofrFsvJc2cipOBswKURQjydmySMTZYdQ==
X-Google-Smtp-Source: AGHT+IFgdTgzzdlfAxH5jUsIbbaTEC0aRjVWyDVXKTAU9Yg1613Ll11GJA25Ci0KmwfQueuGgmBVPA==
X-Received: by 2002:a05:6000:18a9:b0:386:3835:9fff with SMTP id ffacd0b85a97d-38a22406d43mr32551764f8f.59.1735565433967;
        Mon, 30 Dec 2024 05:30:33 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828d39sm31079082f8f.9.2024.12.30.05.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 05:30:33 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 30 Dec 2024 13:30:20 +0000
Subject: [PATCH v9 3/4] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-3-f15fb405efa5@linaro.org>
References: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
In-Reply-To: <20241230-b4-linux-next-24-11-18-clock-multiple-power-domains-v9-0-f15fb405efa5@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-1b0d6

Right now we support one power-domain per clock controller.
These single power-domains are switched on by the driver platform logic.

However when we have multiple power-domains attached to a clock-controller
that list of power-domains must be handled outside of driver platform
logic.

Use devm_pm_domain_attach_list() to automatically hook the list of given
power-domains in the dtsi for the clock-controller driver.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..b79e6a73b53a4113ca324d102d7be5504a9fe85e 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -299,6 +300,10 @@ int qcom_cc_really_probe(struct device *dev,
 	if (!cc)
 		return -ENOMEM;
 
+	ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
 	reset = &cc->reset;
 	reset->rcdev.of_node = dev->of_node;
 	reset->rcdev.ops = &qcom_reset_ops;

-- 
2.45.2


