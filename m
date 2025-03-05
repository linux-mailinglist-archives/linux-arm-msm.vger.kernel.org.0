Return-Path: <linux-arm-msm+bounces-50392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28401A50AC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 20:04:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B9B43B11AC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 19:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4D8925B677;
	Wed,  5 Mar 2025 19:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Icpk5cXu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D52254B1D
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 19:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741201236; cv=none; b=nZZPUgWcKMIaFH/TSdb25aESYvhky4s52yxfjUATtixMBLJ3W4g0M4PythSw+Pmt6KzZo5r74lovuWAFKvvbjVMxQv/OeoV/ScegHeZozZq+9i2TmPloFDLrDMVHXbrATWYquPYSRPvGo45CQsWF/t+gJEqJBzHqvfGgo9O1Fmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741201236; c=relaxed/simple;
	bh=XqBCX8Awi0cTfRB3XQlg6rx/x/9DYRXHoSNppqPAaJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XXxGmo8ei66OMp0NZABlLxM4iyINRUNnZziyDZOLjECxN9aAmD7K52qv/8orJcrmDAL8NK9w+jPHJ464G3TnLsFK4r9nyhnn7c5kZS8e/bYoq8CXVKLUud7mwMu6r0ExQ38vEyzE8DCYT18UMmJsVyT8jGuoyC5myn6kcXAfWmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Icpk5cXu; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43bc48ff815so8304145e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 11:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741201231; x=1741806031; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3s04uk/MYPIMD8i0vFq7N20J3NLR2AUb/nVzvTEo4k=;
        b=Icpk5cXu/yVhylkAVgxYb/RSzkkNAgCBYMJq2ENNdLkxTC3nXLjxmBHnmZOLQD3tbw
         RNZHKu0zfwqzjF74DVsdZ3T351JcW2ZVNFFtRoFrTxkw/h7qGnxS216N5gl92713pKl6
         92rdwyqbEWdGitGt+r0uLSYHwU/EPnT5E34Jhs8hLsleMlCywSquFG7U6Jshmq+8ozWY
         qO9SwRP2ypCu9fOLVo39QZbL1EVGCv5eo36kyK7m1cEpiUWWjaSqO5C1/g73I2XzXBnq
         TFMZpim7bMZ7unwAj0Fxq3aWrurkOYVJKGSTkvSivP2FR/ajNaTNMtqLEYMCKkglwwae
         BG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741201231; x=1741806031;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3s04uk/MYPIMD8i0vFq7N20J3NLR2AUb/nVzvTEo4k=;
        b=M3DYthbMvYmVgYLRW32Wh3fDsRPuZWMi8skDNMJnYnJHi9TI1OUnXov170gc6ZlP8i
         /0/SYgY1rL0tdOwjTngMQLGDh8gvjcGy4CrjTRXDx8cxOf8/S8KERws/ZNnF6vw3Rw3c
         iv8Acz47YSAy+rFnnTZlNxnHFTD4RCKPJGi/3TaUoNlDbUPK0FUP2EhrF62SGPuQ74zx
         /A1g8d/zjBFbisVzUua5x9JqJpt8Vei8SvOUUlSIcX+SPC/6VD4dely7r4Z7WzIY9Y86
         9C/5RGfUQpKewDh4k2Ig2AqJ5Xv6PTgvoxJ0TkK0jjkYrGJBe+flkYTHKM7qcekpvd16
         vz5g==
X-Gm-Message-State: AOJu0YyW6FGL/jqOzuRJF4SCQ9AhpNr6Gl2IwqPX4et5+NNRk1ShvxsL
	4Mfv9RRUT29nzdwf03Uw+dBNHG3xxhljlF6pDxt1ZfLH9pfkVal1wFEqfgiANUQs7otgwlz2rxa
	d
X-Gm-Gg: ASbGncuc7d01JGYoz58weqTzjyUqbvN1cVr917PGTGp0hFEeTHgRsCqWtKn7VnzFdBg
	NEhHIg3QfYgNAQEUF/kYbvs7f3UyiZH4e01jUiWsbUb4WkTyRviTxVetTpNWmZYqAfVoadNukJY
	QS9PMaI5crqbH8mzGVzWkBe6dul7rCrasHDzGzjEzSdih6Uh0HXmiAXuOy90dR9wSWDwJAHDUVe
	aDy0fBPIRUfjAc+wj+Z7QV5bCOAcMC3Aph/0KCRCmnP5AWHw7H6MWfVsrxjCAgvwdW7l9ts/jhF
	N6wUE0QBdwxHHHkVm0I2ZxlA/TW/yMPTpy32eHuQhj0TsTN5srYmXjGGMGfXHw4UpQ==
X-Google-Smtp-Source: AGHT+IFZIf0ShjodZV9SXe9KIzUsNCGaxeZkBM+JlLaQ4dzxNWtZ8wDlalDdkrt1996Bfra1hUS4kQ==
X-Received: by 2002:a05:600c:3ba3:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43bdb38ac7fmr3967455e9.4.1741201231333;
        Wed, 05 Mar 2025 11:00:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b7d12sm22301290f8f.58.2025.03.05.11.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:00:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Mar 2025 20:00:29 +0100
Subject: [PATCH] clk: qcom: gcc-sm8650: Do not turn off USB GDSCs during
 gdsc_disable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250305-topic-sm8650-upstream-fix-usb-suspend-v1-1-649036ab0557@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEyfyGcC/x2NywqDMBAAf0X23IU1kvr4leIhmm27B2PIJqUg/
 rvB48Awc4ByElaYmgMS/0RlDxXaRwPr14UPo/jKYMhY6shi3qOsqNvwtIQlak7sNnzLH4suqEU
 jB4+Gxn701lHbE9RWTFyV+/Oaz/MCnvCzyXcAAAA=
X-Change-ID: 20250305-topic-sm8650-upstream-fix-usb-suspend-20979d5a0170
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1547;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=XqBCX8Awi0cTfRB3XQlg6rx/x/9DYRXHoSNppqPAaJA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnyJ9OrHzygs1MaL3K6SUN+pgrmhbN8UHEfJAEQMiy
 KyySA0KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8ifTgAKCRB33NvayMhJ0W3zEA
 CTDch2Mv6ErRc/9lErIQNvEQMHlIsrO7XVNTrjelc0Uv7ohpl3gJ2MqPisijgOxHPTjpKZ1zquDlp3
 +1NfLIJPyniN4nGgBMkxRDr/jmwcKlrYE5a4EmBaLgf9dAtfoOGLexO7qkcCxZ2AnJn/zoIyJZv2d3
 GiJXmeHNl9o1aA7tYTQHFdyKT+K9KcmjmKvnygCYm+0QcKzfvt4QbtnHKUeRyKwygzhcOYVSvygBXa
 tozsF1RjDZuq2EGtFECECenCO3V0ru+Rvyj+O1YMvuhdip7dFxoH94c8HcVZDR9SC5sfNYde1kQs7+
 TpjJMQ3YnUUQlvkBmm5VH6C+RFqmT+WchEml/V0R2F3h89aZp+A0obtW2cj1P1Gl93Fcq5RCqgx9QC
 AG+FEF6MuNuL6BzJ/tFDEMWYQrSaHI8pjrNifF14kZwe2j4HPKIyALGfpx9MO1tGE3SavdH70sXdil
 2dZBudANtzhPRwLrEYxakOVjJn93Bk7iKUxeMCN/sW101Bdv998+Z+r5asM1CeABUqU5tCKCIb4mmd
 Rutdz4vzDiKKW3aC6O4RtX+Khu99UgH3u2+ynCqwbZrjQZUfsHcNhTmbfpNhfISPcPzgrLq29RcsPF
 FK2GG6ErFnZtDFWy8DY3ySJFlzPy+6jS3ZM6U7eiu5bGPk/pDkmTKfz61kgg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

With PWRSTS_OFF_ON, USB GDSCs are turned off during gdsc_disable(). This
can happen during scenarios such as system suspend and breaks the resume
of USB controller from suspend.

So use PWRSTS_RET_ON to indicate the GDSC driver to not turn off the GDSCs
during gdsc_disable() and allow the hardware to transition the GDSCs to
retention when the parent domain enters low power state during system
suspend.

Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index 9dd5c48f33bed5b944a0b25959ef69e7862d0449..fa1672c4e7d814e1e08c79f9cda9463bf1cd1598 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3497,7 +3497,7 @@ static struct gdsc usb30_prim_gdsc = {
 	.pd = {
 		.name = "usb30_prim_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 
@@ -3506,7 +3506,7 @@ static struct gdsc usb3_phy_gdsc = {
 	.pd = {
 		.name = "usb3_phy_gdsc",
 	},
-	.pwrsts = PWRSTS_OFF_ON,
+	.pwrsts = PWRSTS_RET_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
 };
 

---
base-commit: 7ec162622e66a4ff886f8f28712ea1b13069e1aa
change-id: 20250305-topic-sm8650-upstream-fix-usb-suspend-20979d5a0170

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


