Return-Path: <linux-arm-msm+bounces-81676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7941C58FA1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 18:04:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D24E3B595B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 16:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C963D35772A;
	Thu, 13 Nov 2025 16:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZKdt2vU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C442DF144
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 16:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763052187; cv=none; b=tRXtTZLrykmt6HM+LqgDGkkIEkt9E3ruNb3v3jfF808xNUk/+YPABfWghj95PYRueb3/6l42UsGS5OcRC/N8VDM96o2FRTyxNCPVDSk4Ym6xM2cl0/can5AdHzOp07vt9kBxZ+iLl6eaLplPS/XYkCOV7+rYyCsSHhmvRpV+EcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763052187; c=relaxed/simple;
	bh=e4wpLmy7vbQbRC0XLoLpa5gIrMdKSclGn19Wnlg9avQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ua70ta3ATuTrzDW0fkOFmgIs0p+maO4xlBMBogynyvRQqW/nCaZNhnMH78hCltM2OEfU6+/IrP2PW4suAtfO+os7Oo9yGyZoLTDsYtV3zoPWe4jzTGKo7K7XXJT11G5HLDS3mjXSsha+byHund0k/48B0T0ilt7bydXr8fW1Ve0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FZKdt2vU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b2e9ac45aso743376f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763052184; x=1763656984; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8de/CFnWO3IGxpSS3xw4ysFyF7Uiqg4MfqIR5613CyQ=;
        b=FZKdt2vU5l2zdvp23iy9lONsvqaXvfKpbetvBZaixTS1boAtNI7uBeHcBnoAmCqsJo
         hSYqWiKYV62+tzfdeLceUjufrGVCjx0On0Uuh2JTuOYBX3UGcmYyRJDHJ1sdhociVuLz
         a7jADwp6clDKNa6ZcHvl9mtUBumUlMKFVZ+aoDFvpkMcdRUGHIfXiPuSwfiSKPBOFO7u
         bmatcHkAXjrxm7uQCG/XhscQq+bilo3Kmh95c4kBaHYyjyJAV3DA4kzxa/LZyKejjeMF
         0IugupU25rlgZZAu2yhi2gqB+l3lan2M6R/RP71DiMcevBHj+/cMsCn46wWaux3Ug/Uo
         33Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763052184; x=1763656984;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8de/CFnWO3IGxpSS3xw4ysFyF7Uiqg4MfqIR5613CyQ=;
        b=iNkP9wtmdhGjMt9XYkhSz8At4Zkwjx0klgLHKpQesAzBaDWDNnqexb1W4OtuA+momY
         K3C86RF4uLHS4tOYg/V41Tddid14owxQMIpjJyoQCVkvUyGdQn2Xh7QoycBPE+eYjLcn
         DxH09Vf8aukC31WZYy2LWpCGT72KrCCqDFibMgCqf2nGtW/1IIZK3UmW7KUW3CDJVaxC
         GaYDA/eCcjZ7+DPKcQ7LsNuN8OmSDHww5hc1/Amqhm8RBlQZmN74RpnWyimsNR2Yw7Cv
         CFH9XVEGKo2hhHOZJ+0Wo3MlFZ+2pRi1cVmR4Q0EZuY2Kpm6FoWmi1kM6YmrqpsHsdF9
         ruag==
X-Gm-Message-State: AOJu0Yx9JarKH52MD40xN6Q0tzLei94DQq9OhL5z3M0RbbJUpltiYuyc
	59liijsfMkhPMdt1LLj6gJsV+BjR4jg1U5g5BM/rXgs13q/GFbmOGtwI
X-Gm-Gg: ASbGncvWVQyaSIKfekcojAl+07KnZRhKTx2kzNddrkRNuVYeqxLkeC3vNyqC5CVToE/
	HgQzegzaY5oPiJLCtiRotZbSOYd/8alU+WFYNCF8eY2chQ1Dl+rxZxuBRYwaSgojGEguoMTR6pn
	r6UyQ0Mn0Ngp/eqmUvlsEqIH7+jByEsPOke3zxSHlYpnSZtxtnrM7yXeyP7PKAYIj95+17d1bxt
	BbJRH80mY//2gIrZM8WA2LOYDMrmqxGxpLrYkiMm3MtooqLXOGwQKs9afYVvuuIjhx5cXmrnWV+
	Xlz6B1SY7ft1LlkgPz21VgeHblC7amnGgEjAkmopjJ2hz2WYj/ezhFrLx+xuagvH9acZb1+oDRa
	Wv4p8nz/FEb2X+9J6HpZ23GS4e8zT1rSGwA2vYmofrL/wnp04tsr3T6e+Tw2SgpoAD/uqs/gNC9
	uhIHRZ33vrhUDHylK8L5cN2Se7rgihDXeJGB8yH/itssUAbBBq2To=
X-Google-Smtp-Source: AGHT+IE/hFbQQQKhQlmQzt/n0bY/OxlEju2Z4LaA3//8LQTjh5HN/tkbw2eY2czeTiAKeKUY5nE69A==
X-Received: by 2002:a05:600c:a06:b0:470:fe3c:a3b7 with SMTP id 5b1f17b1804b1-4778fe5ece9mr1671475e9.5.1763052184093;
        Thu, 13 Nov 2025 08:43:04 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4778c8a992bsm45289725e9.16.2025.11.13.08.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 08:43:03 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 13 Nov 2025 17:42:52 +0100
Subject: [PATCH] clk: qcom: use different Kconfig prompts for APSS
 IPQ5424/6018 drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-clk-qcom-apss-ipq-prompt-v1-1-b62cf2142609@gmail.com>
X-B4-Tracking: v=1; b=H4sIAIsKFmkC/x3MTQqEMAxA4atI1gZMRZG5yuDCqVGDP43NIIJ4d
 4vLb/HeBcZR2OCTXRD5EJOwJVCegZ+6bWSUPhlc4SoiKtEvM+4+rNipGYruqDGs+seB6qr+FY1
 zvoGUa+RBznf9be/7ARUtBfNqAAAA
X-Change-ID: 20251113-clk-qcom-apss-ipq-prompt-f1656b0822c8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Both the IPQ_APSS_5424 and IPQ_APSS_6018 symbols are using the same
prompt which complicates to see that which option corresponds to which
driver.

Add a prefix to both prompts to make it easier to differentiate the
two options.

While at it, also fix a typo in the help text of the IPQ_APSS_5424
symbol.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 drivers/clk/qcom/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 78a3038426136e018e346bad0e10e1caa26ee6b7..2190979b6e7b66cb3901ff53dbb1af39571e4267 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -215,16 +215,16 @@ config IPQ_APSS_PLL
 	  devices.
 
 config IPQ_APSS_5424
-	tristate "IPQ APSS Clock Controller"
+	tristate "IPQ5424 APSS Clock Controller"
 	select IPQ_APSS_PLL
 	default y if IPQ_GCC_5424
 	help
-	  Support for APSS Clock controller on Qualcom IPQ5424 platform.
+	  Support for APSS Clock controller on Qualcomm IPQ5424 platform.
 	  Say Y if you want to support CPU frequency scaling on ipq based
 	  devices.
 
 config IPQ_APSS_6018
-	tristate "IPQ APSS Clock Controller"
+	tristate "IPQ6018 APSS Clock Controller"
 	select IPQ_APSS_PLL
 	depends on QCOM_APCS_IPC || COMPILE_TEST
 	depends on QCOM_SMEM

---
base-commit: 682921ab33129ec46392b27e9dafcb206c2a08dd
change-id: 20251113-clk-qcom-apss-ipq-prompt-f1656b0822c8

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


