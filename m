Return-Path: <linux-arm-msm+bounces-20112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785E8CAB23
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 11:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 385C11C20A6B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2024 09:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6BF17711E;
	Tue, 21 May 2024 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GQ2FynWn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45367440B
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716284736; cv=none; b=i5Ou+gSFXkNgcoPvWlzVhad0Hu07KieZ50tjAeTHAwmHuO5oH4ULH3FKJ8YcxhruaUFhO2Yfvyg5KjKyGEndTuzCXPRWjk1N03hoF8m4vHOVuLqDP6tQZrPCszWmalZCcbdvEUAwXkV2dDgf9mJ426W8zhBNSIYnuy6lHZMv3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716284736; c=relaxed/simple;
	bh=KYeL6fzQJLtDEFcKxFdxIcSfLdT+Pm9+X1ULYtcduSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvgV1FFgHG4vlANprc/hSTc7o+mYsZMzcRliEsLCCZLuCOKyDGHhpmmOLvwd+358IXQhZFRC8LWNZ9kzftIap/Q+DqMZFyMXhn+sNYewGRizTYFBhKlVMiLpCcx59fhPy3KYwFwJ2OGspTuYO1sKK8sqHEbeazEVqSqRtaRHkpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GQ2FynWn; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so36841921fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 May 2024 02:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716284731; x=1716889531; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iBE4lAUl0jnuiv7iz7pI4tDd8+Db2+0Bfaal2oLW0IQ=;
        b=GQ2FynWnuYxgtINUU7mAj7fYGbp8WvtXUN5NtcDCAWNXUQfeuWJhswDnL+NcNYtAMK
         VMJ0d8oUPDATc/R2Tp/VH1p8kPBteKipP7b0X6GIdp9weqBsOMxDSIWoHfdBlKGEHALj
         R/F2u6Vnh0gr3VCS1LJy68fXiwc57NAaBRJwD9Ps97WofmHLqsIestCuN57GcBW4mDTR
         AEEopCQLB8380+vU1gmztshEwTi4Py0fz1spyrpnskk4zU5SPPOXBNYXIqYurU9ZFRnR
         5VXRQMaaycLqXwCwY6QplJ/cu6JV0dswprfvx3/o8jxgnQbEp6tWEMtKqWlb/vDLLQjC
         lUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716284731; x=1716889531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iBE4lAUl0jnuiv7iz7pI4tDd8+Db2+0Bfaal2oLW0IQ=;
        b=kZWP70KUUVqN1L0hnkzoAnyROjXXqOJJbEgDIycXkoMFFSNAsS7a3Pi4h9/j+391Rb
         rHqzBqZyMyA/IQx64XkDiacoWc53/Z1G1FsBbyO20EiCDy+f3wAmKgoegYKI3rfuHxz8
         /H01uvahOH7AOYrydjnNCrbMCiT2kcnj5YaryYu9uskqYxTEBKtvngtFo5iXEeG106lq
         LTOt1HqfaPAuX8cfyLm4i9I89aqoHdRBbfhcEAQTjuQaIJ40eQhvdBzivVSq4g9k6lUs
         LbqNnhwqMIU4VvB0QuoYPHhMQTpqBaxAP0MMfrLRkzPtkcz21vRyYHhe8T1LQPwiGFHH
         KGwA==
X-Forwarded-Encrypted: i=1; AJvYcCWSqh36DdA418yM5e4iXNCHUbSBqlhYc/KP33bLKLQ/LBrst34TFBRHwktxvZKl9K2HmjAfpP3PzWIh3fY44+cII5bTXJ1FRkuCSaKn2g==
X-Gm-Message-State: AOJu0YzCJkaAprhKHQgaPlTGmREtQB1ySqkSb5vHaQa2vS23DXz4kGyk
	9MS6nb7ZNphWVQXAZz7ZISpI1AIj6yYH2oEJ5RzmLMB8CdaZt+QH3W/aL5eligi5L8xn7UXJlPZ
	S
X-Google-Smtp-Source: AGHT+IHzcUNZO8UU45sIJhia3FHxalrz4nI32qKpSaF4TZAeoccmSFsXSvuTN3qrodcUwVMYK1VTsA==
X-Received: by 2002:a05:651c:550:b0:2df:b0e3:b548 with SMTP id 38308e7fff4ca-2e5203a4a63mr211085821fa.42.1716284731080;
        Tue, 21 May 2024 02:45:31 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e706ee0a65sm13906261fa.112.2024.05.21.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:45:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 12:45:28 +0300
Subject: [PATCH 08/12] remoteproc: qcom_wcnss: switch to mbn files by
 default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240521-qcom-firmware-name-v1-8-99a6d32b1e5e@linaro.org>
References: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
In-Reply-To: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Loic Poulain <loic.poulain@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=797;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=KYeL6fzQJLtDEFcKxFdxIcSfLdT+Pm9+X1ULYtcduSA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTG0zylaYYAi4WtQBwoY6076Qo7Qdy96aZKFjd
 wLNy+fpnO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZkxtMwAKCRCLPIo+Aiko
 1fvHB/9//VeTwe64X5V5/y6fzXatmuogy3IboJj/4PO6s8ICnmnwC4o9lTR4kuoxpEvetn13NlU
 fdi9Gp8BdjJczasVS0hE1zVA4sM5HZxgX/Mcpua/nM0k1VzBuMYzKSl8NywcFU+3/0Oi8l4Tw/4
 Fn0prJzv/Ad8J1j+ak5RNff/Z3k3GUQ1K+RUeM/JbctyguEwww1OeX3gp7oAEr1qYBXgV4ajRke
 oXfC28+zssG07aan4pCz6gfU9dqK/GoM1/QH2XFD5FDqI6xRZbDj5QnE/Ob8/MJr0SidI8wq4UR
 WzLeHP0OyulHgkF/EyCu3e67qwnzrdT0sVcXcsgqhW6mASqO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We have been pushing userspace to use mbn files by default for ages.
As a preparation for making the firmware-name optional, make the driver
use .mbn instead of .mdt files by default.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index a7bb9da27029..421a3943a90d 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -32,7 +32,7 @@
 #include "qcom_wcnss.h"
 
 #define WCNSS_CRASH_REASON_SMEM		422
-#define WCNSS_FIRMWARE_NAME		"wcnss.mdt"
+#define WCNSS_FIRMWARE_NAME		"wcnss.mbn"
 #define WCNSS_PAS_ID			6
 #define WCNSS_SSCTL_ID			0x13
 

-- 
2.39.2


