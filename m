Return-Path: <linux-arm-msm+bounces-48038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDE7A36056
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 15:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29C1B170673
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 14:25:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA31264FB9;
	Fri, 14 Feb 2025 14:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pLhsbqXO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58545BAF0
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 14:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739543148; cv=none; b=VU11qdyQSGfTzybu4t7l2OdOugfM7OjcYbQkDfjEZ6k0gK5EBNB5DtY4lqotDl9ecwYrDkOFaZWCI7D9pDO0vkXbXIK94tHA1Z0I2ruksNKuNTk22OhcB0uZbqKq/csq7rtTpyxu0ceBxkQHa9oYT00tNudpbgJ9vDNDM8SvcE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739543148; c=relaxed/simple;
	bh=6xxF8rN9zTbbJvAKtEFfPHJFOxmzYocfsTr66zyc7NE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Uk4i4uh8+0Z3Pi6WPyyEJM1RdrwqiSlW4rhP0MGoBpD8AaK6dFFiIo9oK36PavCDjs/eGP6/K0/AWijgJWPTPIvrXzqjYTetzg//0GW8oRGSSfN7wsmegwjH7+lHqBMytV2WcvenMbixagOrQPeOv/MlxdPD1AcSDHPER/8pOfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pLhsbqXO; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-543e47e93a3so2236468e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 06:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739543145; x=1740147945; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dl5R/TPlYSsamCEAGU/chHrDqvXleYXJuMFs3tfWros=;
        b=pLhsbqXOkUiLgZmQNrlhIL+npPiAG4DD02qteoxNI2Enz7ISAco6BnlZslGFA9Np0e
         VqOp6TdxRnaj+xhhiFgEv46/UYJDnuVr7gjQF3ha0RgG65GPyAd0oYY7NUMjjS8SA5hT
         208D+z/F4iwMkS66Eppjbgi4w+gVhi5vCL2Yw8OK8pH1V4ZueCFc/InVYk71SfBmJ1Mb
         2TPHCFVdfjMINcrF/eMWKqPX0VqI6X3XU0TtzpK+iqB442IPHjtKrYa6LqolYqJzHyp/
         WLvidx14zh1B96zm5wnpsMcmZ/0Er+5+WcHZp3M20gcIRFqEMUv8seo9GmRLqpF4S1uM
         jyoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739543145; x=1740147945;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dl5R/TPlYSsamCEAGU/chHrDqvXleYXJuMFs3tfWros=;
        b=eftotKaUNyzzVKtFte1qIcbkDHcdTk+110p0gxQ9lEuOyigExx3AAXE+Ru2ZY4dNrU
         IOgIoRwrV3lWswulgRq6+55psp88RMsroR2/LY179pMXz3yYO8EvZ2PkLIz7Ce2uuRjy
         Z0yCw05y/iTUEyrR7dhCIuhfA9T1eIqQaNUXm05OVkqOL5hR1Uq2PuVDwGDuS7eGRt3b
         qwUp+e/qLp+elG8VGG/5GIePIgMzNsdoSxtqaPw4TuVcOD2Y58paasoOtPfFOmLlldpt
         Q2qyXWYKKgIZXTTnFowNArXgFIEbnt75SrXE2/pZ/uGqhJDRvo4cd5b2EXh+vXNpWcjC
         vU0w==
X-Gm-Message-State: AOJu0Ywr1LMNIEHHRz+JRcNOu7Sk8yBG/xqx/LfMcMywas/j2zbl0yQ0
	KQtf4apTuozSpo2SMQDdEwxMIV5JYBf0G4xBcAKGlCWhxR1jpEUT+VrHZ415bkNyG4uvXXGWPPb
	7IWo=
X-Gm-Gg: ASbGncuvAFRCpq9GuAY6z15ZDBnYEsnx4q9W0wurLfrAMmi62DCaxeqlHwWNedF4Z4E
	Ri1raHlRnT+/RhGUH+95s3TF4G3RNHzGul9OBahm8i2erM7u8A0AP8pH7EJ4zpEJAbIImX5ilXa
	TFGekaSSiG9BhMxe8kHJDVEcfwNXB74bcIkeqbCC0HC4k0yLJeINAnsBzUhTRYbRQYP55X2/7/7
	mkJ9a/tNpjW0seIOdnW2oxg0uPB3PVBh1HdBJ4RVuQPDxAUBl0ux3atGacR3RFVhB5dXDSFcXPy
	sC58iDft64z5T8BRdRWlpvY=
X-Google-Smtp-Source: AGHT+IG3qQ7eIYwNQ5AV7acWuEKmZCbpl/3HmRIO72Nu4b3+s5EH8gvvqKp/+KRrPfoqr1QpJz7Ybw==
X-Received: by 2002:a05:6512:31d3:b0:545:1ce0:6409 with SMTP id 2adb3069b0e04-54525c863e1mr1333734e87.17.1739543144772;
        Fri, 14 Feb 2025 06:25:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f11ed9asm537281e87.228.2025.02.14.06.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 06:25:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 14 Feb 2025 16:25:39 +0200
Subject: [PATCH] arm64: defconfig: Enable Qualcomm QCM2290 GPU clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-rb1-enable-gpucc-v1-1-346b5b579fca@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGJSr2cC/x3MSwqAMAwA0atI1gaa4ge8irhI26gBqdKiCOLdL
 S7fYuaBLEklw1A9kOTSrHssoLoCv3JcBDUUgzW2NZYaTI5QIrtNcDlO77FnMUxu7gIxlOxIMuv
 9L8fpfT9gW9QVYgAAAA==
X-Change-ID: 20250214-rb1-enable-gpucc-7ae0a1bf6d1a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=6xxF8rN9zTbbJvAKtEFfPHJFOxmzYocfsTr66zyc7NE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnr1JmrZctNMY2SC0FwBsqAPL/Wa4leScAw+aOH
 c/U0nJ3IVWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ69SZgAKCRCLPIo+Aiko
 1ev8B/96pSdQHwskzz8nqCgS4dPCDq5EuP9h3QpyDtwik9pLtkKqs2W224QjBPgecx/ZB3L17xo
 M+dTkK35qmTS66cimuorUsXjJJbyHvrPjl3ck7FGaQy4fx6uCTQz3z8YZ/PEFWJ+R0+cLZojGCv
 sanq5j0Z1XDajo/l3FUNzBNFVNCyL5ysqXLLuImchG1y1BBriELDs+gapjymBGApxH93rMfqYPe
 pwchqjMJticrGkG22vs5rcSezkRYs8+LKBOdI2xyHYMVatP0ycjZTXuRCrxveIcNWXx5ReQfPS5
 XeC2eM0q2VTPMaf1Tm3yqQ3nOWki1OedRrL7PYrX/glNddbp
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable GPU clock controller for the Qualcomm QCM2290 SoC. This chip is
used e.g. on the Qualcomm Robotics RB1 platform. The clock controller is
required for the GPU and GPU IOMMU to work on that device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cb7da44155999b59aff95966f4cdc9107f2af46a..7e475f38f3e1146dc0f742d13ffbc2d0648e2de5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1320,6 +1320,7 @@ CONFIG_CLK_X1E80100_DISPCC=m
 CONFIG_CLK_X1E80100_GCC=y
 CONFIG_CLK_X1E80100_GPUCC=m
 CONFIG_CLK_X1E80100_TCSRCC=y
+CONFIG_CLK_QCM2290_GPUCC=m
 CONFIG_QCOM_A53PLL=y
 CONFIG_QCOM_CLK_APCS_MSM8916=y
 CONFIG_QCOM_CLK_APCC_MSM8996=y

---
base-commit: ed58d103e6da15a442ff87567898768dc3a66987
change-id: 20250214-rb1-enable-gpucc-7ae0a1bf6d1a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


