Return-Path: <linux-arm-msm+bounces-39230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E08C9D9FC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Nov 2024 00:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AF3B168AE2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 23:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF7C1E0490;
	Tue, 26 Nov 2024 23:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f6AKDNje"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29D1DFE3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 23:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732664677; cv=none; b=HViP9ZjiZaT7E98A0zHGoHHTgZ4/Js42oFMkpSMjsnlpqVbQ1qoDZpOPmy0dvG/yKN1odg1xD/LrD5PQXsEBISety/7AfEuR+mn/IE32a3vBAfjq4OKcp1FFrvOhw0AnsNIJNZ5iruN2qs1/d1mxO22CqUGmAPSxfA67E48JP8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732664677; c=relaxed/simple;
	bh=9DcDIgyiPEQQcegeEN1oWtNvqOat5t+dI1L4z5w/npc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jXcH1ZRzh+j5M/lB7YDuK64DHXjks9lDfHmY3tCWZyqxffM1AbLHd/vBd22amWqZ6KXabdKdcTn+OukNoYGJ45tdsJkAM6Wd/CVqXHrd7l0EZSutVEVcBcFWITRtgLJkOPdsXlIkZLcJ+9MLzTv1a/o/KAQuvJ/fUsejlBSzXV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f6AKDNje; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-382376fcc4fso3756224f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Nov 2024 15:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732664674; x=1733269474; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=f6AKDNjeC/ddGcJ/pTrP7RqmpxnNaWdSofMYY3TPXNbF6hvkg2of2rKa+C/GSW6vjv
         1RpNC3zm24hAhgBtMYpuS5yw1/4wgsw8q6cLrEdBu6mfyWb+Dw60om71rEIDXWRX3tKl
         YTOc0PLpO/QnFAe0jXk5kEjZqzd3RZXEWS+vb4egTeOurBFnMD+FNO0XRr06vFHH73Y/
         2Q+a2bBF+EEVOP0Oh+hHKUx6HxDwWA8mCcGoUCyhbAPfIYBjWmjr6kFViBQmCEXoFoO0
         qMMMoJf+hYMoA0cS9BaV6mYied2HpNCRbEm2e6FQwYoFytnngRksEp2aPwoX/VSnGkeO
         lGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732664674; x=1733269474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CvPt8QMHcz942A3Oqz3/N9DPxj3tCNq+0xhS6ngyuw=;
        b=hno2mEF285aZ+pGkStnuXkp3OHig6yCU//pyQXdIsec832/f/nvoI8LqFf8Ll69VVC
         TQ+lRGgPM4N0wu0kN2p36OoEsdNMn0ZIRnbAC6SDGK6kd9UBx2fyyIbun0lva4xQJ5xw
         4kkhoc7gtn/nauZPOQr5jF7uU/PMqOjA6EaV4vQUIbkvk3kYMPH1WIPssjEMBDFarq57
         MI2GpTWoDJl3PBHQa+NGinRIjKiXHOnFMHGBhDOnsdxxbxKrkurf/q06h+13p1e1ldrp
         giDPyFl/lh3LZ4zSzHno2Fxr3M6p/jWpNNF8JU+1wh0sqa/lMApFkMhnXCFhOiruJV25
         fhkg==
X-Gm-Message-State: AOJu0Yy0ehQgC7oXt9ztOukmHnINuGWxv+BwzUbs2hk86RCY5TSjqVjz
	6TlvJVzostYAWA+wERSp8+i73XGtcSo8rcBe6Z7m5csi6Dl2ezCT3fvoiUbnGW59tr7Mtmx0KpH
	8mmA=
X-Gm-Gg: ASbGncu8X51u/BzBeVGZIg0hHS+22SodN+MC62L+juL0bojhdFbNITU3PWretfgPovg
	/74i3Ajgv1ozNJbhmspVEgYMY+lhj5lNn/W9i3gelLqBt/Oa3hxS4luxUfWfxb9Gwg+1p+EWWpW
	bv4LpAXfRijGjuZnQSoo28tlZSMr1SNtQI4CgYhWM5WWb+zZ2SRRe9o+xBI5+hecbE6r6NzyCkO
	1JAT1MsEtFvIeiJggwHIxqBj2ttkUjahsClTdAYvuWqiGEt00YSsMoaWqQ=
X-Google-Smtp-Source: AGHT+IE+Oglm7E2t7Ut5iZpBl+SAvEqAXWb/9nqHNfrjK8E3TwWYDWN8olld0Ah29+gOrPXAKM3mBQ==
X-Received: by 2002:a5d:5888:0:b0:382:4378:4652 with SMTP id ffacd0b85a97d-385c6edd47bmr520166f8f.45.1732664674376;
        Tue, 26 Nov 2024 15:44:34 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fafe338sm14482899f8f.33.2024.11.26.15.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 15:44:34 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Tue, 26 Nov 2024 23:44:28 +0000
Subject: [PATCH v3 2/3] clk: qcom: common: Add support for power-domain
 attachment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
In-Reply-To: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
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
 drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 33cc1f73c69d1f875a193aea0552902268dc8716..7727295c57c8f6672d46d2380e1ff5ec2ac68d42 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -22,6 +22,7 @@ struct qcom_cc {
 	struct qcom_reset_controller reset;
 	struct clk_regmap **rclks;
 	size_t num_rclks;
+	struct dev_pm_domain_list *pd_list;
 };
 
 const
@@ -283,6 +284,21 @@ static int qcom_cc_icc_register(struct device *dev,
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
+	ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
+	if (ret < 0 && ret != -EEXIST)
+		return ret;
+
+	return 0;
+}
+
 int qcom_cc_really_probe(struct device *dev,
 			 const struct qcom_cc_desc *desc, struct regmap *regmap)
 {
@@ -299,6 +315,10 @@ int qcom_cc_really_probe(struct device *dev,
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


