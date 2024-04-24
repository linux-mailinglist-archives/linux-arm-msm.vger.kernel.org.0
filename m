Return-Path: <linux-arm-msm+bounces-18372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A828D8AFDB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 03:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1FDBB21E8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Apr 2024 01:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D404C6125;
	Wed, 24 Apr 2024 01:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RB3gBli9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C7D610C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Apr 2024 01:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713921572; cv=none; b=A3T8aheW4xdTQXXXGEF9u9tEO4DAtkb2jJTVDmM8dfIwsDgAlbtm4EFDXx82eqX9eLTeWEDlOnmn5uS+TD1c3yStDefcaNVh7KTKST4vbqH7LMA+tRe+N0DvWPT+wrF+e//SXwxQcYx2vp7BBCtopkKKIDjxWozxVpBbWacZeBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713921572; c=relaxed/simple;
	bh=d5AnWdA8HxhOh1WwY/zBSqeUKx76WdavtfGarWMeoLs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Rxd2AbjN5CvL+H4jZvY/JKRZgNnOJwQNQ7w3kQY6MpeG9i1gK9gRJuca5iRL6TN/7cy+8fQW9WlF/UZbVY/S1J5VRjT1s25aY2ptvyNaxkgqG5Rc82Asy7Fnjn6tz/SR4xhKNV6MwFMfbJHRGSVDQYZ43WVg+/3mp3+qGytd9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RB3gBli9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-516d3a470d5so7890698e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Apr 2024 18:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713921569; x=1714526369; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u9Ge7q0HGhblnPSDAHGVIfRJulw3ZmSBjxurUoSR3Jc=;
        b=RB3gBli9nD15b4TM9nEQ3U117ePvHMJ4HaYw6NxwKEA8CVReOi8nAXJqDmRg14JJu2
         5iyNdayzn72DuK3pvmKW9afPV2vZWFl/qzM5VwhlTuRVns9ILCJflebq82Gq/SjY+HdV
         wa4YbcYkPMEeDvHaO26hJ+Z8u8bgEwdZrvT4/dmLWOGZ0t7KaR7FPT7gBHAuPXsMPUn+
         xcg5MnNxfNvQGLDlQiVn9ip/vRDsKuIslu96vetsj0gEkFzwwPizCgkEvz2HrKMf1PBd
         VZL2NLy7jLyyxKyJPTWC68HjIe9IFOje91sociiJig2RPTiS/zEpXf7MBeRrMTK0HAaZ
         h/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713921569; x=1714526369;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9Ge7q0HGhblnPSDAHGVIfRJulw3ZmSBjxurUoSR3Jc=;
        b=WbcGCz13Hb3kwp62mn3IFWBLWPcfiRARmiGwVXYxn4FgPieeonymRGFSK74//mmu/7
         xajCelW2BIY2GizduzBVetjY0K+FLsmYjjR+f0Yx1a8XKbueHzWoWWLw22bygcGY20F5
         vZBJwbG+6+RffoicWN3ZWRrS/scJsVJ1L7B56Z1qBF9ta1H0YwZbIdtuyttdKk9ONBhc
         bvo7vnaYxanAv2u0V1ZGn0wDqsOAnfSPPP6MAh+a4lNBt9Q0qG7bXS0s5p5GjNOslKxu
         9Ze0IHDG296JSIclLtMPwBV07Hk1JhPyW+rJhBRWCFgfTomqfrhDm7bOvB5fXQZKE0Cp
         /uQQ==
X-Gm-Message-State: AOJu0Yw058+OrfS+XYZtM1+OhcGIwu3Cbkr32vx60KuoNwlfq07qaJVx
	NeYQIE/zLXCUNcGaqF+TLj/40k+jDefKDOhqnKs6Nf3OSP+XiCQfV4zqZbrrzn3NsPbF5vNMR5b
	r
X-Google-Smtp-Source: AGHT+IHVTZMTQok+VzEp+tuDh1+ZVy73+/7Q4LA8Ejm1v36veMBK7OOHoEnFx+G2A3Er8Zh0RSiHkA==
X-Received: by 2002:ac2:5a59:0:b0:519:5b13:4739 with SMTP id r25-20020ac25a59000000b005195b134739mr675939lfn.30.1713921568701;
        Tue, 23 Apr 2024 18:19:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m23-20020a194357000000b00515bf945920sm2248948lfj.120.2024.04.23.18.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 18:19:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 04:19:27 +0300
Subject: [PATCH v3] arm64: defconfig: select INTERCONNECT_QCOM_SM6115 as
 built-in
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-enable-sm6115-icc-v3-1-21c83be48f0e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAB5eKGYC/33NTQ7CIBCG4as0rMUABW1deQ/jYvhpO0kFA4ZoG
 u4u7UoT4/L9knlmIclFdImcmoVElzFh8DXaXUPMBH50FG1tIpiQTLKeOg96djTdDpwrisbQo2a
 aGdZZEJrUu3t0Az4383KtPWF6hPjaXmS+rv+0zCmneuh6OWgFqlPnGT3EsA9xJCuXxQfBxS9CV
 IILaJVVVoKxX0Qp5Q1Nh2pi9gAAAA==
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=d5AnWdA8HxhOh1WwY/zBSqeUKx76WdavtfGarWMeoLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKF4g8+gZKM7KyVvVVzgph5bIlyAavstNRpnY3
 K7ZOLZx4BiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiheIAAKCRCLPIo+Aiko
 1cuACACDGrcbXpCe9ldw6WqU2TA4ChEl5LgMI0ND9752cVYRk+Dm/TIgXeOeLOOWHvteRvykdx6
 AIRFeBKGa5C4IKxiOMRQGQYkezgsklS4VxUU1dvt/bKqhLM15wS+cEAsPiDgAv287vj5QfuyJWm
 lLgRL0dKLPEK1f3DaNlZvXP+IYZjYmtgg3t59LcWXJ2uMSXsX6MxvWNaS4vM4vrTPmGtOtXPEH6
 D/a/zBmSCORy+vS3MqggSVZ6NgZovRb+eosyLVkW66aV1CBc9s6R0/c8NsaNr80pfkIugR1g/Tk
 oZP+dRKrP7Z+fgZgkCd8jKnR5dScwZRJlxd4CRQVBV1xVfIM
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable CONFIG_INTERCONNECT_QCOM_SM6115 as built-in to enable the
interconnect driver for the SoC used on Qualcomm Robotics RB2 board.
Building as built-in is required as on this platform interconnects are
required to bring up the console.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- fix subject to follow module -> built-in change (Steev)
- Link to v2: https://lore.kernel.org/r/20240412-enable-sm6115-icc-v2-1-12a35d5d4acd@linaro.org

Changes in v2:
- Change it to be built-in (Bjorn)
- Link to v1: https://lore.kernel.org/r/20240409-enable-sm6115-icc-v1-1-bf894fb5a585@linaro.org
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cd8714d38f6d..04e31b3d03d0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1603,6 +1603,7 @@ CONFIG_INTERCONNECT_QCOM_SC8180X=y
 CONFIG_INTERCONNECT_QCOM_SC8280XP=y
 CONFIG_INTERCONNECT_QCOM_SDM845=y
 CONFIG_INTERCONNECT_QCOM_SDX75=y
+CONFIG_INTERCONNECT_QCOM_SM6115=y
 CONFIG_INTERCONNECT_QCOM_SM8150=m
 CONFIG_INTERCONNECT_QCOM_SM8250=y
 CONFIG_INTERCONNECT_QCOM_SM8350=m

---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240409-enable-sm6115-icc-7b0b0c08da2b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


