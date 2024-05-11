Return-Path: <linux-arm-msm+bounces-19737-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E4D8C33ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 23:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40321F21574
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 May 2024 21:56:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFCFA28DA5;
	Sat, 11 May 2024 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W7f4lZjs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEAE1CD0C
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 21:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715464569; cv=none; b=RRzpGU09nlXcXM0+v9jaspwYxKq0tPqYd8aKQk1Xm4IDheKDAnD8VNZUR66256aaC+qQ+9fnWZ2BXw0gvq/wOWQdleUcVUt7EYy6Sm0o+52bTs/xOla0WCb1T/2D3GMT5h55kSc1vH5tpfz1bv36aTtbPtlTN3oNWSIGsFaWJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715464569; c=relaxed/simple;
	bh=MmtONXg0VMJYQh1EJenBk4C0n/qkfVVHhENrkwyfSSM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LA+m0Kck0eCMl7u7J3kaDy04JbRVzt+Mg9Ch2tJoct1i6xMz2fT43nEiLs3Hj//BU9dOzoE/0JPRTLEpgVheEFhSY0QagsVOT2JziIES996YQdbrOPC2Zd58sdoURwUIm/cndX4mMVNSa2IM2MVAZdBG1fqOPwxJcmdQqFZqlQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W7f4lZjs; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51f99f9e0faso3450234e87.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 May 2024 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715464566; x=1716069366; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yc1m16BZ9+LEw8irlKaijazVBePq23WtN2z6YA3QNGM=;
        b=W7f4lZjs+rWoJ1MlqSYHgt4l2WFfpaoXWZR7pm+9K2BNMdzHqfip5MyjJp4j9TZ9Ff
         RoCujjmGdavtJQ3ED4lwNCMGEUJ3JoUgiYL3y4Br9Lo/NG1zFG8Q5dpCwgoGgKTJUoT6
         neQM+umx5JEittvtD0YZd/T9i+LURcZ/57uguxsPbkdEImvY648wfrxhGVfAPUQMkrA4
         yfhsVi3cq8eQjyNa6bK/eDi/etVkv7Rh5lAQkOGVfr9uT054aMAUHapg2iRKDabqjDp3
         vxe+IxI+5x3BtHfdhz/g+d2gNss2pBBkGTmF1/f0qpjOaRLe9MUStI+7RvE1lS+rTMN2
         Qo1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715464566; x=1716069366;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yc1m16BZ9+LEw8irlKaijazVBePq23WtN2z6YA3QNGM=;
        b=JeNamnakSPGYKj85ItKSFn4mNBnBdajir3VXCliP605HxlSyErZUbcCJFm+BghCRMR
         6jFVjxT5UYrmf8N83E1X2/K4aHbTN1GCPbl8QzguAJkqHO3h3Y3tRr6OnExEShiTkQKM
         QQA5CYBrCmpsveJFqwzKE1I6URr6DqcpF44AtKi7ApoBO/ZodK5m9z9iuZT12ZGOJ54g
         10hKS1gAwKz2LqnMPjDAGxSb7Uc5u8MoOGRMshJacPS9+AyGzMPQ2F8lk8obSUTVZWwl
         fVM1tqoiML8x+DFKUYIU2enlw4gHtqTuAVIm7mYcb7klAe/6R/ekinPWexclI3w8GVj/
         dkMg==
X-Gm-Message-State: AOJu0YxaFJ0kJ6h00jmBMaDCeDL8kTTQ8FbEz6Sj3LvX5cEQUNApJ/3N
	99oLtpoJLA1mWOR8l0qnvyp50EHIejG5ShU5MP5q13+Xso2OZdR+dSuICgUhNSA=
X-Google-Smtp-Source: AGHT+IHvrv1xE3a3NTNZDwY4p2kUQ1KmzKMksVgvRf0KgBeZF/jXdxxQRCbl2rolKz8IGJp+0OCr8w==
X-Received: by 2002:a19:e04c:0:b0:51f:128:4cd2 with SMTP id 2adb3069b0e04-5221006f7a9mr3825479e87.22.1715464565699;
        Sat, 11 May 2024 14:56:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f39d31d1sm1127576e87.286.2024.05.11.14.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 May 2024 14:56:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v8 0/5] soc: qcom: add in-kernel pd-mapper implementation
Date: Sun, 12 May 2024 00:56:02 +0300
Message-Id: <20240512-qcom-pd-mapper-v8-0-5ecbb276fcc0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHLpP2YC/3XPTW7DIBAF4KtEXhdrGAYwXfUeVReEnxi1Ni6Or
 EZR7l4Sqaor1OWT+N48rt0aSgpr93y4diVsaU15rmF4OnRutPMpsORr7hCQQABnny5PbPFssss
 SCgscvUL0ZD10FS0lxPT1KHx9qzmW+vw8lmB/agRHVACCSPcCiISSjDM/pXO59EdbLuv4nreXj
 zTbkvtcTvfaMa3nXC6PmRvey/9dtCEDJj1HCwP3xvN91X3SJvaeGi+qV4McouXWcTc0nnaet/e
 peiSljXNWOqTGy19P3DReVh+EPKo4kA7GNF7tPGLjVfXRKCO1B46gG6/3vv2/rh5k1NEpUgHiH
 3+73b4BRtvUgDQCAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Steev Klimaszewski <steev@kali.org>, 
 Alexey Minnekhanov <alexeymin@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4810;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MmtONXg0VMJYQh1EJenBk4C0n/qkfVVHhENrkwyfSSM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmP+l0viIfgANeDXuPjWdFENT6kOVXY32WIaZjH
 n9gQ6zsptyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZj/pdAAKCRCLPIo+Aiko
 1avQCACw8gBh4MdMccSl82b6C8K076SjawSRGp+d6jHM//kCnVoSGu3EB8EErzH5i+rJ4J3lz2x
 nkPDv4JvLi/irUkOetIwitzlkqo8bgPKHv1x7joGSJqdwLqt+BejqgSYU1DtbSOyoZEobIx245C
 oqnp5pJCUYgHyI+RXHd6WkAcWXsOuTAOVy8wIE/9/SI+ZbfIk6Mpj7LvzktG+zXbm3uhxCsdcgU
 OchDGD53e8qI8JKHiGiFi+4AQhOzUDUYlI+k0clvVuwuicknMEdSCzopDnUGXdbHIZYdtBUqU0q
 o4/99KM21u7O8SxFAU2kkZdkT6LULPjREDMf2jW7kbKReDHt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Protection domain mapper is a QMI service providing mapping between
'protection domains' and services supported / allowed in these domains.
For example such mapping is required for loading of the WiFi firmware or
for properly starting up the UCSI / altmode / battery manager support.

The existing userspace implementation has several issue. It doesn't play
well with CONFIG_EXTRA_FIRMWARE, it doesn't reread the JSON files if the
firmware location is changed (or if the firmware was not available at
the time pd-mapper was started but the corresponding directory is
mounted later), etc.

However this configuration is largely static and common between
different platforms. Provide in-kernel service implementing static
per-platform data.

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
To: Sibi Sankar <quic_sibis@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-remoteproc@vger.kernel.org
Cc: Johan Hovold <johan+linaro@kernel.org>
Cc: Xilin Wu <wuxilin123@gmail.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Steev Klimaszewski <steev@kali.org>
Cc: Alexey Minnekhanov <alexeymin@postmarketos.org>

--

Changes in v8:
- Reworked pd-mapper to register as an rproc_subdev / auxdev
- Dropped Tested-by from Steev and Alexey from the last patch since the
  implementation was changed significantly.
- Add sensors, cdsp and mpss_root domains to 660 config (Alexey
  Minnekhanov)
- Added platform entry for sm4250 (used for qrb4210 / RB2)
- Added locking to the pdr_get_domain_list() (Chris Lew)
- Remove the call to qmi_del_server() and corresponding API (Chris Lew)
- In qmi_handle_init() changed 1024 to a defined constant (Chris Lew)
- Link to v7: https://lore.kernel.org/r/20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org

Changes in v7:
- Fixed modular build (Steev)
- Link to v6: https://lore.kernel.org/r/20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org

Changes in v6:
- Reworked mutex to fix lockdep issue on deregistration
- Fixed dependencies between PD-mapper and remoteproc to fix modular
  builds (Krzysztof)
- Added EXPORT_SYMBOL_GPL to fix modular builds (Krzysztof)
- Fixed kerneldocs (Krzysztof)
- Removed extra pr_debug messages (Krzysztof)
- Fixed wcss build (Krzysztof)
- Added platforms which do not require protection domain mapping to
  silence the notice on those platforms
- Link to v5: https://lore.kernel.org/r/20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org

Changes in v5:
- pdr: drop lock in pdr_register_listener, list_lock is already held (Chris Lew)
- pd_mapper: reworked to provide static configuration per platform
  (Bjorn)
- Link to v4: https://lore.kernel.org/r/20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org

Changes in v4:
- Fixed missing chunk, reenabled kfree in qmi_del_server (Konrad)
- Added configuration for sm6350 (Thanks to Luca)
- Removed RFC tag (Konrad)
- Link to v3: https://lore.kernel.org/r/20240304-qcom-pd-mapper-v3-0-6858fa1ac1c8@linaro.org

Changes in RFC v3:
- Send start / stop notifications when PD-mapper domain list is changed
- Reworked the way PD-mapper treats protection domains, register all of
  them in a single batch
- Added SC7180 domains configuration based on TCL Book 14 GO
- Link to v2: https://lore.kernel.org/r/20240301-qcom-pd-mapper-v2-0-5d12a081d9d1@linaro.org

Changes in RFC v2:
- Swapped num_domains / domains (Konrad)
- Fixed an issue with battery not working on sc8280xp
- Added missing configuration for QCS404

---
Dmitry Baryshkov (5):
      soc: qcom: pdr: protect locator_addr with the main mutex
      soc: qcom: pdr: fix parsing of domains lists
      soc: qcom: pdr: extract PDR message marshalling data
      soc: qcom: add pd-mapper implementation
      remoteproc: qcom: enable in-kernel PD mapper

 drivers/remoteproc/qcom_common.c    |  87 +++++
 drivers/remoteproc/qcom_common.h    |  10 +
 drivers/remoteproc/qcom_q6v5_adsp.c |   3 +
 drivers/remoteproc/qcom_q6v5_mss.c  |   3 +
 drivers/remoteproc/qcom_q6v5_pas.c  |   3 +
 drivers/remoteproc/qcom_q6v5_wcss.c |   3 +
 drivers/soc/qcom/Kconfig            |  15 +
 drivers/soc/qcom/Makefile           |   2 +
 drivers/soc/qcom/pdr_interface.c    |  17 +-
 drivers/soc/qcom/pdr_internal.h     | 318 ++---------------
 drivers/soc/qcom/qcom_pd_mapper.c   | 676 ++++++++++++++++++++++++++++++++++++
 drivers/soc/qcom/qcom_pdr_msg.c     | 353 +++++++++++++++++++
 12 files changed, 1190 insertions(+), 300 deletions(-)
---
base-commit: e5119bbdaca76cd3c15c3c975d51d840bbfb2488
change-id: 20240301-qcom-pd-mapper-e12d622d4ad0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


