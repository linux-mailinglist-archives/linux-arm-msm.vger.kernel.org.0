Return-Path: <linux-arm-msm+bounces-15673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D858913A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 07:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44CEE1C22FF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Mar 2024 06:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861B337714;
	Fri, 29 Mar 2024 06:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjzz6fHQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991D84E1DC
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Mar 2024 06:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711692953; cv=none; b=RIWJNm3FK2t+9pC2QSKRgzlyjx+Koht2XoIULU3YWCPZkgukNa0Ye4vkoGsGRoFHmIzf0k2NSGK1MNY/co+LCFkwkuPX78KE+pPc38ip3G8PsiX01trHHdwBpycRFSV7b5AKcvA3p+X97OXKcVPW8XzEEhrjly1bfirKpHlZpqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711692953; c=relaxed/simple;
	bh=FNeZFewSvhBuxQ3csqXQFOnbclapSSlOktRlQsrIAHc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+6gVLzMiBlPFHJP3V2c12GkwVWxC1kRKwBlo24Ku+D0u6LfRR66U1swbOigoMvxry5ORwvpSpzWUoc/xywSnhCXpXjK3Mj184GSUBXp6EUsF2ldVrCgzQ6gWM/iZbd525qWlp7tTvJSmzab9GrkJtYPEZN56FKn/RkXABsOd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xjzz6fHQ; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d52e65d4a8so22887471fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Mar 2024 23:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711692950; x=1712297750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEJihiEeWvLfK57ti4sg0AX62I32E+gTiiYv2sVj33U=;
        b=xjzz6fHQCuh/dAoUt+DbxL68pbi+rg6CErP/r0xPzEVdT9z5lmpxoVxqCt03nBK0cy
         CvjmP1rNQkrl1hVM+lZLg1aWoKrdImH+Xmtfl+j+NrPhJ2ssIkq/uYJ/leYGGjXWm70X
         VKutAwK21xyw/AbXq7sGpLB4mATEvwI8pj7C34yoUiYBVJMUV2p66WN13/h5QFczV/Az
         oMFFW/c0RMlPoKVcQLZcmlWD+nRbkWR4Nc0KdwzLnnHFniymVlAQv18o/gfM6fOvuOla
         X7ntd35FGpKH6VXxCRHKtFGNQeXi8xFK56tmjjyvpyCz755Z+3Twy9gjscS9JDhsI8ot
         TF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711692950; x=1712297750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YEJihiEeWvLfK57ti4sg0AX62I32E+gTiiYv2sVj33U=;
        b=LsIhc94kEIFly+zJ64j7vL/T00LeZWWs1SxmR72rLso2n1tN4ONldiTWPwNwqXNM91
         tzViJOgulccqHTYReaUruSxPIr4zTIWOvQlpHZkx3VmSyjS0HwZNf3ODHmfhXwiHH5z2
         4ZUgq96wVSD8ryGKtR7S4N0Vq4G1Tq5mi+3ftF9FW7joqE+VGvJCsu4+m4A3TLjmKl78
         yHiT4p6bikXJLVzakGsggc1IiA6aizML9VNgDjVT7Uz344iq2E8TktSrlFtzyOFGhlhr
         OnRBtFPvFK3EZPS1w8DecSKSiu3PY4f+qSzZGKNWhKPFxlnT0RfMZjl0MRg8itx2SQ9/
         b1HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUm8forsUHIHJvfMwVh3IF/7QmsG7S6t5gaHwdcj+cK3kRFa57v+8dXMqQOpavnAO215vHQBtJals10AdWFR2EX/4TW8ioWpDhbsMSxMg==
X-Gm-Message-State: AOJu0YzpPGdiBwPo9WfOAyGq8mrOC0oahjIxrcgxNZV97sdDYAicPE+m
	pwBCLMx/8t/ukX6nma3Vpze5Xr5pOF6ggpMqtiwPPNtIUaorRs/9GJvwjR1qp2o=
X-Google-Smtp-Source: AGHT+IGGHKJDbeJ+KDR74ze9xUn1QQ2t9J+gNQvHakqGHDuXL08XBt38JlXNIIW1R3H4pdpMsPIKYg==
X-Received: by 2002:a2e:800a:0:b0:2d6:c0d5:b96e with SMTP id j10-20020a2e800a000000b002d6c0d5b96emr653911ljg.24.1711692949955;
        Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k17-20020a05651c0a1100b002d6cdee339csm494539ljq.103.2024.03.28.23.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:15:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 08:15:43 +0200
Subject: [PATCH v2 11/11] soc: qcom: pmic_glink: enable UCSI on sc8180x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240329-qcom-ucsi-fixes-v2-11-0f5d37ed04db@linaro.org>
References: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
In-Reply-To: <20240329-qcom-ucsi-fixes-v2-0-0f5d37ed04db@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, linux-usb@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=FNeZFewSvhBuxQ3csqXQFOnbclapSSlOktRlQsrIAHc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmBlyNmGIBuVhU4gfN28LpZjdh7YgctgnqxE1E0
 KsohJsxZoKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZgZcjQAKCRCLPIo+Aiko
 1SOwCACbroRYofwqqtJBc4WH7gWH+m6z605qzhkOa3DeXh9HM2Y7QoayQt36RhIldcY9tA+yjYW
 ZyYh4rtfY6YqQzm1G8Wcyo8SMOIwNs0uUTxM0Npyrvyi9+omUIWt/K8Lt4lYvwzVVQpix7u8VfT
 tcwhZxzRJ5Ez6ITnLte5q1ADP7F2rwmzD1CxKa5HrNklEUsHa8E3iTBAqsgG2mpJTy7OFQLvbR6
 hMSb2WpbFeWWJqGrAkyKp8fjEE6suhFaurGdtWNm1bOLcs25NA07dopiX6mGXRcECzf/v1O/MVp
 lS9ErAZLf3lDayifUsYiE/CJ+su1Nop6pNqgv2WHwf2c1uBR
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Now as all UCSI issues have been fixed, enable UCSI subdevice on the
Qualcomm SC8180X platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index e5a591733a0f..c2f71d393bbb 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -334,15 +334,11 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	mutex_unlock(&__pmic_glink_lock);
 }
 
-static const unsigned long pmic_glink_sc8180x_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							    BIT(PMIC_GLINK_CLIENT_ALTMODE);
-
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,sc8180x-pmic-glink", .data = &pmic_glink_sc8180x_client_mask },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };

-- 
2.39.2


