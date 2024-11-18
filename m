Return-Path: <linux-arm-msm+bounces-38153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7FE9D07E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 03:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCE93B218CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 02:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EC7779DC7;
	Mon, 18 Nov 2024 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AiO2ilLs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E186F558A5
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Nov 2024 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731896682; cv=none; b=jxK9fBofQxCe/ZyMuV6p1+cBXEvKdN0KQ/fD1M7hAAswFcrJj50IG+8+zZuJj0jyPZNJiGm4Nzb+kTEHRVk6x2VImmC0Iti6PBVY913ZQ8lAqE+AvBSxvbaC62Gg/fBTN0/+e/GTs/6WBZPevwFpYKNt2xei+j2LSdvYq5TtwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731896682; c=relaxed/simple;
	bh=4A7Nlfh/Wzmyb8Sqa9yNc0VHqXNcgy/cxKUPLI57RVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bmunRN9pj86BZupuHFJwr+aMWK12KMjhRy/KSztMoxKLq5rywUEoPGitTobkCUVi7rmz+JPVSFV4gn72/WmoUobM4xMvwATujeHKf/u1RtxpZyBF88VOqZc1X7YUEfumeR1qRw3HVtyHDlPsMGlxfkiAaULlUzCP63UmXNKA5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AiO2ilLs; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3822ec43fb0so1800919f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Nov 2024 18:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731896679; x=1732501479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4iGkwvgZgVeZ73yqZCKTsgB+AcLdw1tSbIMHtFSZKEQ=;
        b=AiO2ilLsmVmpBsxZ1sKeWV8PocTybMVIr4LSRIDNyPu0In7j6S0HVRzK1Xv0Z4CvBR
         AkkTLBjueU6qEe9XF3GAGMton1IyNmp9ju+9Nagmw9HWpnYii3QEK0hCWddk1+Bq0dCW
         L6yqthDFgOpZjnBYtwT++1Yp903FTjEW0208SqEPiKY4l8/FmN/dt3o0HlNcLWCNUsve
         2a9NC8FH3bh7OP/ECqB/H0kymz8jtWNsQkgj5lt7wbXC8GNqWzfIPiNBHchpTvm0hVDp
         /q6fV3xL78Ya3ilWmlPYX3dQNRf/sV3f+r5HD0fRR1VESOCTDdrI/Q3KQ0YS9cPfgsPs
         znAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731896679; x=1732501479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iGkwvgZgVeZ73yqZCKTsgB+AcLdw1tSbIMHtFSZKEQ=;
        b=aO37k6oQa2mj9giokHPyyqXyei/aPyfoFbhCsE8c5niPqPa8nRfsijDZIOP+euUrGW
         DbaghUm2G4GMbcnGCgPW1/H303BCqFdfi4RpQEeF4b9xtowpO1yTeXmLjIfcd2HQ/YuA
         7oSKlYZKXMq/Ep4jPn6rxvHF4pIZU7qUrnIigK1tn8eH2HLpAghQ4R9pT2iSh310rwT0
         cpPVqyry5bgkbsIPCKTKQSyAY4HMwA4Q+u0cSRthZjCVzS+9PjQCOX1zcdwV+FTUWHCs
         JeQRdEoA2FmRkFYrAOU93tn4X4yyLouTWFAnRIUKQj+KaWZB4rf4sCgn2l0KBOrOVfCP
         8D6A==
X-Gm-Message-State: AOJu0YwlO0F2dMSKPyLHmrdjMx3QRQ2xEe5TREFqazeFcWsnjRX67BrJ
	RrzOjymI1zm37O8pXSEMY+gxyW8ZPFsEIiRqMYaYhDpH4TuOyPc7JeEG5w/skvevqGG8Y+UvIPG
	DHSM=
X-Google-Smtp-Source: AGHT+IFdCwt308Q7rR5HQPTUr0kdBp0HSjUA+z9CSb7a6F9Yj/68W8pIPqC2Zj4QRv6VV5zlTYUhOg==
X-Received: by 2002:a05:6000:1a8c:b0:37d:4657:ea7d with SMTP id ffacd0b85a97d-38225aafc3bmr6924217f8f.49.1731896679328;
        Sun, 17 Nov 2024 18:24:39 -0800 (PST)
Received: from [127.0.1.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821ada2e35sm11387902f8f.5.2024.11.17.18.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 18:24:38 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 18 Nov 2024 02:24:33 +0000
Subject: [PATCH 2/2] clk: qcom: gdsc: Add pm_runtime hooks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-2-b7a2bd82ba37@linaro.org>
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
In-Reply-To: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-355e8

Introduce pm_runtime_get() and pm_runtime_put_sync() on the
gdsc_toggle_logic().

This allows for the switching of the GDSC on/off to propagate to the parent
clock controller and consequently for any list of power-domains powering
that controller to be switched on/off.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gdsc.c | 26 ++++++++++++++++++--------
 drivers/clk/qcom/gdsc.h |  2 ++
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..ff5df942147f87e0df24a70cf9ee53bb2df36e54 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -11,6 +11,7 @@
 #include <linux/kernel.h>
 #include <linux/ktime.h>
 #include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset-controller.h>
@@ -141,10 +142,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 {
 	int ret;
 
-	if (status == GDSC_ON && sc->rsupply) {
-		ret = regulator_enable(sc->rsupply);
-		if (ret < 0)
-			return ret;
+	if (status == GDSC_ON) {
+		if (sc->rsupply) {
+			ret = regulator_enable(sc->rsupply);
+			if (ret < 0)
+				return ret;
+		}
+		if (pm_runtime_enabled(sc->dev))
+			pm_runtime_resume_and_get(sc->dev);
 	}
 
 	ret = gdsc_update_collapse_bit(sc, status == GDSC_OFF);
@@ -177,10 +182,14 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status,
 	ret = gdsc_poll_status(sc, status);
 	WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
 
-	if (!ret && status == GDSC_OFF && sc->rsupply) {
-		ret = regulator_disable(sc->rsupply);
-		if (ret < 0)
-			return ret;
+	if (!ret && status == GDSC_OFF) {
+		if (pm_runtime_enabled(sc->dev))
+			pm_runtime_put_sync(sc->dev);
+		if (sc->rsupply) {
+			ret = regulator_disable(sc->rsupply);
+			if (ret < 0)
+				return ret;
+		}
 	}
 
 	return ret;
@@ -544,6 +553,7 @@ int gdsc_register(struct gdsc_desc *desc,
 			continue;
 		scs[i]->regmap = regmap;
 		scs[i]->rcdev = rcdev;
+		scs[i]->dev = dev;
 		ret = gdsc_init(scs[i]);
 		if (ret)
 			return ret;
diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
index 1e2779b823d1c8ca077c9b4cd0a0dbdf5f9457ef..71ca02c78c5d089cdf96deadc417982ad6079255 100644
--- a/drivers/clk/qcom/gdsc.h
+++ b/drivers/clk/qcom/gdsc.h
@@ -30,6 +30,7 @@ struct reset_controller_dev;
  * @resets: ids of resets associated with this gdsc
  * @reset_count: number of @resets
  * @rcdev: reset controller
+ * @dev: device associated with this gdsc
  */
 struct gdsc {
 	struct generic_pm_domain	pd;
@@ -74,6 +75,7 @@ struct gdsc {
 
 	const char 			*supply;
 	struct regulator		*rsupply;
+	struct device			*dev;
 };
 
 struct gdsc_desc {

-- 
2.45.2


