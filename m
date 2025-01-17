Return-Path: <linux-arm-msm+bounces-45404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E8A15102
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:54:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 155C21887587
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 13:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE66201012;
	Fri, 17 Jan 2025 13:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnVR3NzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3E6200106
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 13:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737122055; cv=none; b=R1fZukeAq4Zp1/qQ+F6Mm4VRlff27LSVePaaTmGMfbw+rpS7NcEuf7kdrDpYzyjq68cMdGU/Y6Jc8ANoVzCBXICKiasW8r0uHJ2613i7aLkjQm0Y0f6Evp38uA6axMzeCl+oCEm5QcPud846iAWWUgsfcgW+ZUwcXOaBCNEAMco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737122055; c=relaxed/simple;
	bh=1bB7zeKYEAvds04CMWVz2vrkT1T8fqTENFgm3Croh80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QEkrl5W0E6GYdW6f1N9E1j+71xc8SPZm4XzThlJ5NWpZXk7CrucvDA/Zr5QFIi7z5zeOJbt3k5aL0u9XXJCfVhwiOgKBKTluNNTISB2rKxfaNxGGoAlltrVHlPFBoCjzw23HHFGXJICji0P6ogLD5b3AoKvnXsnrYxBX7AQ8FCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnVR3NzC; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-386329da1d9so1142572f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 05:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737122052; x=1737726852; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZqX0V1eNStAoo4sPWKD9j/tGcT46bicfpPkCKdYvW2Y=;
        b=SnVR3NzCUmvpXnDtqZd4tKvH5ne1HlBhOpgAJL2Zaul60AYcGOB9AXg3ih0s7oRjBo
         PBS8FO89JcWfyBsXcu+6A3ZDv0f8MAYdN7kM26ll1KZugsJoUj37Ep9ne5LdWf2a1lgy
         a+APGVmxaEo2yVpUPDagg6qT8eRPopp6ydRtESrro88FE4afh6Yu0BTI7WaP3XFLpxAQ
         Dps66CkoTEvkCpnWwCWWma+KaX/dVaD4VNLBDbm/fXupn5NS3xZ7xfVXAiU3Kg3q5Cdm
         0A2rxYE48MFGW2kXnJuIw2fCQNIGtRxI+G76yQL423vIpbFjLtFHxH5kvesqjoqI7qD1
         gt7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737122052; x=1737726852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZqX0V1eNStAoo4sPWKD9j/tGcT46bicfpPkCKdYvW2Y=;
        b=t8OJC+EE5G2g6U5MHzfjFzJ4AV+oOT58Rwaj4q6yrhJaXMazYTJ9Fdsm+7OkR99SYN
         7qiAl9+7Y/EPcMQD2GQsBrbb8yrQIMHklp6d/4s8M87q6eSEIdV9KkH2VY1Kx2z4qiOE
         2VIQKRDSlZEmLDm/9pbFeNURaiP6JI/bHe7OUu1WvRvsLVhahWgz1GjSyO33Zt3oMtos
         AkdVp2XznbtZyy1Sy94PWslnEkfs4q2S9TsjE97AaRAVUfcVtlbYqyJDS/X3VD68Ai+n
         nOHjHRl+TwnSXniQIE2yae6M4At7Eovl/Y2k37xfIKsWhIwEY7mF2aKcZcSrfOEG+rZb
         lfOQ==
X-Gm-Message-State: AOJu0Ywd0wXkUUv0ckpK0xe3m7r7uSO9cVIx6PowIgRFGY146Z8KvZjs
	3ib1Taq90lOVptPkBhBpcM9mvIIRbM0Y+ZaE1+Yv+82k0m1sUGjn7H6uQgaFmrI=
X-Gm-Gg: ASbGncsCIGG3g1jl9ll9SL8wICPd/l4IJF+WMpkJtDgaMQ/2mRlQNrqAbSz458MhX3q
	MktgHkJYlpkZgkB+L827UhvhFX1+iyOwCprfyc/RSONh2kn300wD7Mw0yJxqMmM5SKZztJ4qwmo
	wuzRaE4meaeTcTlgp4FoJSULC304udZB8ASod1D2LCtu11ryfU7fTIp3luxW5wPcjEAIfs/VTNZ
	qxjWIOUxqHdgMkRoqXPz7B/K8Q0cEwIWb8eLV7nJrHSvN3PhyWJHqL5GEgl1xVsWQ==
X-Google-Smtp-Source: AGHT+IERIKprTfj4TGtNFTV+dziWvvun8Na1x5lCmNRgusK6uCzT/L4ml4i+lIBUsBATJIfoN1WugA==
X-Received: by 2002:a05:6000:1445:b0:38a:418e:21c7 with SMTP id ffacd0b85a97d-38bf57c0546mr2616282f8f.53.1737122052049;
        Fri, 17 Jan 2025 05:54:12 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3221bf0sm2545279f8f.28.2025.01.17.05.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 05:54:11 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 17 Jan 2025 13:54:09 +0000
Subject: [PATCH v10 3/4] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-3-13f2bb656dad@linaro.org>
References: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
In-Reply-To: <20250117-b4-linux-next-24-11-18-clock-multiple-power-domains-v10-0-13f2bb656dad@linaro.org>
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
2.47.1


