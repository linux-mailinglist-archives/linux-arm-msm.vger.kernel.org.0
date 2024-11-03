Return-Path: <linux-arm-msm+bounces-36850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6024C9BA664
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 16:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 385A7B20FD3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Nov 2024 15:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1BB17A597;
	Sun,  3 Nov 2024 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DlfiuaJH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8BE170A01
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Nov 2024 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730648258; cv=none; b=MRkHO+90fJqKHYJrGkTCkYeB5FUmov/E/k1NxYysV9s8K2M/pjGYk56wwHqYyna4ZQjYlbbdf8op0ooq/xa9sOb1hyfHglPqZqQm03HdsHLS990PHn8DABt4EOZY/tgLO9PvVuLIKoxL2wwOwDpFVhWsI/fN8tBzamRCY/gV3nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730648258; c=relaxed/simple;
	bh=A/WnptpcEaCydNEwHhCYy3nsOgAQBjpitbug4N2yRps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WqyJtkjJRzIVHHiUP+2CbazeUqZnuNvGlPv+gcSPMPMHxNlOUJqmE9fIKLrIPn6vyDMeDgEE86bnMiMp6Jm/C/r8Wl6aYG/M4pFGNGqmYVdJQRYarlPsgj4+fa0Tk1IsEU/dOpzxFl5nUsoqi17xmgQcIAZ/STZLvaFXFt20Sfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DlfiuaJH; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53a007743e7so3689210e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Nov 2024 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730648254; x=1731253054; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ecRjHWyEMPV8C3gd1Is18U/kDaXQ6jei97bXitPNEX0=;
        b=DlfiuaJHmCCXShePfBlRVd4RF+QLRrNHKrjlEqdx3OOsfs3K9EewqzRATQFcpD9//b
         Y3fKOmfLcu2mE1+fcDCXdWK4imm7dWEY05rPooL0wekHnzprlnT0blasmZ1nhDFAct1Z
         d06U/f8ppMyQkweNDuFfPg20YKLKsnhNhc2Tepyo8+v2gt6ntxMCbu2BTeNwn9s0BInr
         YcLkQqiC4KLmyLA4iOe5UxhA9pHfK8EuwqJ30p+Y9iwdNPYRG6k/ZMyGsDczI3n2Pf4P
         GBHil7TAUIh9tp0QHGoQwO/L+LUE0XUk5fWGPzT4o1Zbyx+kfqjb34yIE3oTujb/AYpW
         MiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730648254; x=1731253054;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecRjHWyEMPV8C3gd1Is18U/kDaXQ6jei97bXitPNEX0=;
        b=UpStaEuvxb0YxBfjPwF1XLn0qNaO3y6gKmd+0x4+0CHo5LlyVVWc9FC2o4/Z6bAnQG
         y8zwneYWS1iya5jCJ8D7k8xD5dFVHT/gwXSY3Ba78nnoj2BFfl1KPjB08zYKlRWk6xEg
         XW7E69xOqCrXLZ3wtdIP5a9VDJvUsxsDsWUeVIHfnpe3UvTsldt49gDsuJCmMuDnFqDT
         tWeH+srm9WTqfFR0zILN4u4AXk+od1VcePYZlVBf3/Frzx03ETeAVA9rqgbNdaygOI+x
         5nh5gV4MpD28lEcVf5CKwHyggkM+Z5cMc//X+hw19V3+KlqoDMnsTJv/hfdtQONZ3TF7
         y27w==
X-Gm-Message-State: AOJu0Yxp0qYiTOV4QgtcgaudoPEbwyXOqVB2I8RSNoCQd/TiEyfJlOLg
	BvYm6Qoe4BpCR7ggpjwEGCpmchi4uWsXJoK/ZZkffEkYMbhg1GOBwcAciX+aPqDKqB+/CIRzWTJ
	/np0=
X-Google-Smtp-Source: AGHT+IGIt5DFZkUasqecPwXsJRY0RTzQQk5JB5KmItEGGn8gWIQb9/8PWSzMLcHOvIroSJdHI8yb3Q==
X-Received: by 2002:a05:6512:3b0c:b0:539:e85c:c888 with SMTP id 2adb3069b0e04-53c79e8ecafmr6388050e87.40.1730648253640;
        Sun, 03 Nov 2024 07:37:33 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce4fbsm1321133e87.128.2024.11.03.07.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 07:37:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] firmware: scm: rework allowlist to be more scalable
Date: Sun, 03 Nov 2024 17:37:28 +0200
Message-Id: <20241103-rework-qseecom-v1-0-1d75d4eedc1e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALiYJ2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwNj3aLU8vyibN3C4tTU5Pxc3USzZIvk1LS0ZBMjEyWgpoKi1LTMCrC
 B0bG1tQBxYCB7YAAAAA==
X-Change-ID: 20241103-rework-qseecom-a6c8ceffc424
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=A/WnptpcEaCydNEwHhCYy3nsOgAQBjpitbug4N2yRps=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnJ5i6FjaM+w+WPOC3ywHvvDcD3GRSCA3UrIkX6
 RsPPT6G+3aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZyeYugAKCRCLPIo+Aiko
 1WjwB/475sOCgbKLXYG63fx0QaG9MuSPQO90tGasQK9GuCuT+9izd8RQfnD/ja45h5EDEubcd0V
 sCGqRHZjeWhXm5+32ad98lBGZfA51mwK6Q12AzrS+nMKTv+RpCnXqxNhe+SnWsbnC51HXM7UNpp
 A8kOuQm4RPXk16pyttCnhu9iWqrWzkw9gjFDlF0Is9vvdr2Zn6F0/n/RZy2ywPyIQ8BDqv4dUBD
 ShDDPZutEaGL5Azih98ETfczldkUaWKETFcHArADCqlh5qYJLn6rMX2/LekOwXhvQbMMawLqrM2
 sDlHLRbmbRQTh4CcFhx87zbFqRPm6PEf6EZbgq1gzgrD+Bxm
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Listing individual devices in the qcom_scm_qseecom_allowlist table
doesn't really scale. For each new device we have to add both DT and an
entry in the table. This way handling new devices by distributions
becomes more complicated: it's not enough to add new DT, the qcom_scm
also has to be patched.

Replace a machine-based allowlist with the platform-based table. If a
particular device has buggy or incompatible firmware, it still can be
disabled in the table. And while the patch to disable it is pending,
make it possible to use qcom_scm.qseecom kernel argument to forcebly
enable or disable usage of QSEECOM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      firmware: qcom: scm: add modparam to control QSEECOM enablement
      firmware: qcom: scm: rework QSEECOM allowlist

 drivers/firmware/qcom/qcom_scm.c | 54 ++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 18 deletions(-)
---
base-commit: c88416ba074a8913cf6d61b789dd834bbca6681c
change-id: 20241103-rework-qseecom-a6c8ceffc424

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


