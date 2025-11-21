Return-Path: <linux-arm-msm+bounces-82788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF08C78101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D65E84E6D5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E468033EAF8;
	Fri, 21 Nov 2025 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss4dgB+k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D4F33F360
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763716301; cv=none; b=a5HV/e984LNq9co2GH/4uWtxJ+H8Ps5/bOeDM5xZQITkvwkbuQ/xvl9Z6NI9+kaNaoxEN4ysoqslci5EAxQX9V1DaSwEL5bZzZiZ88e/h0I1+a54NheacBPUKzp27IF7JgjETXoAHWQKKlXxK3Rwdb4j/0VacvqSjCdaDT2Yo+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763716301; c=relaxed/simple;
	bh=d6KUon5qsH5eaDUHTIJjLZ48isS0l27n/vj2H5utlVY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rX0cZOAI8KfEHZejkIR7Sa/bKM3sUmfPUgXh3Z/VKSR0iBa9cIsiMNvpG5y9gxnvpXwD4065tan9VEW2qK7wow03Nkmg+wmAMO1OMBdZzNNiLKBgKBZC40UVrY80TfarorZxVrkmLBnExprfC1tnWJ1VTVBnkZWW51EjFADzfC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss4dgB+k; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b32a3e78bso1477655f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763716298; x=1764321098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cyaNsyhseyrnp5ypkCzyGD+fkMslgb2GboGhSitpndo=;
        b=Ss4dgB+kcH/mNgMKtffh7O7fPeCS5vXr3Axp5vKYvxMH/X8d64uCSc/0DgR0SDDLAQ
         Fx4TO/TOllCXkSxYYj+Gfi5FU2BQynLMJNn/eZm3nOhWXpqU0/R/8UNZIeYAvBWWJQvs
         fp5hZ6YJ43BOVPbJlNgP+vurUQHmQx/pTYHIaaur4QmUMunKGeekEme7aNH1oxVVam3K
         tqAC68Nx2C8NN1fVRJb6fZr8XkDOI3wj+wosXlKCjs/zYcL8LDoRqjP7tBIjWDq6bhol
         vDGI18E4j9IEe0+yrkeDng+6LuwFLo5snQ9XeRIDH7x22fwmQ3hjqRCORHfJMekPLRyK
         Aklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763716298; x=1764321098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cyaNsyhseyrnp5ypkCzyGD+fkMslgb2GboGhSitpndo=;
        b=fN41DQwpL0yJ75M3WMHKYd0YMTv5m8wZHVG+KVsC7z5Q/EDNauBp8SP6QB1QxwRy2l
         5vot7Mva9vs9zgxxe6PXpxqFAmrn4QCGLCUTXRruwnhwQ4T+Har0IFE/2Nsf3/rG7fxi
         7VIUCxFgR/CKRRAXtnbze3P5JQFnvn6Az+aO+XjuELvgRpHREyl/GqkPnaKiDA2O0amS
         44EOgDXRMqrLBwlqvhsNRJ14zgIGOMeOgGJ2YnZtPwLgCq5O/KyRoN5XbNVZ87nNtsDd
         w9HIdSD113jfiPoSX+n4HzYxaiBJZCAq3JAEefmxuO2TTTyqmU83U3MyyxeL4wAWB76j
         Owkw==
X-Forwarded-Encrypted: i=1; AJvYcCUAIGuSAGSFJ9m7cwD6egs35WA8k+4FOyBN5ejdOtYg67o+XD5G+0UQEY8pQKd0DWQQkKF3sbOMHNAKyfUt@vger.kernel.org
X-Gm-Message-State: AOJu0YwuDKIXJhSpCrUezK4Y3+23XwgiN+Wm2I3fr/6qzM9AuUVOYItB
	PDd0YP2BrdEVPC/eDt7SzSsq768dhdJOTFS8KyftuVXSWXFtpBB0T9il
X-Gm-Gg: ASbGncu8dTaW1fAr1Kwq97b3nXWIjmg9wluM8rfGEFPJcBAeCvzE5X/xNjvpYvXgSyZ
	136PCwj4Kh5zGmCnWujgAJPef+Z/xG9hcTQJiNzDLkKjogvfcIulDVNMcjsCAoGXUbg4TtaPRLf
	YFZmILfZOLx3gFQBh+t9M4ljQNpG3esO01KFdu53tGVuMby45zr+nBOUEjygX5wvUCOrM1F8kSC
	02A1rXtXMf3vLDN6+QP6oU3BKm0MJURjxayYs2gnPQ2aBZnD3on2HRAr1z3XSezkpZ0YX8GZ7YT
	bxM7GzBwqSlcpLIpTCCogx33cecN989sMZtadpiKJpWaUucs9kU/324fhfQNOKJzhE/vQWSe+2x
	hs7aXzzL674JOqB3DShKSbmbVR+mYnyUom6NE/+mp+Fx4dv3rsiJmxtz+U9f38mcmJ61R5JeiMu
	HFlHlUPNAhH3vRE/zMzxqBYYO6GmyicE8v8KU4p5N7
X-Google-Smtp-Source: AGHT+IFwL4n7TYwUFZSHiCv4+H6j/KYO7X7yjM/G567YRe5bpLQGiNrlm8f7eOTCANUfFNhI/gEl8w==
X-Received: by 2002:a5d:5f95:0:b0:42b:52c4:663a with SMTP id ffacd0b85a97d-42cc1ac9d17mr1466491f8f.11.1763716297954;
        Fri, 21 Nov 2025 01:11:37 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fe8sm9975773f8f.15.2025.11.21.01.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:11:37 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid
Date: Fri, 21 Nov 2025 10:11:20 +0100
Message-ID: <20251121091125.6289-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized
state") changed the usage of __smem and init now as an error pointer
instead of NULL.

qcom_smem_is_available() wasn't updated to reflect this change and also
.qcom_smem_remove doesn't reset it on module exit.

While at it also proced other expoert symbol if __smem is not set to a
correct pointer.

The changed symbol are unlikely to cause a kernel panic (as it's
expected to always check qcom_smem_is_available() before any SMEM usage)
but it's still worth to protect them by any wrong usage.

Fixes: 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized state")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/soc/qcom/smem.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index fef840b54574..c8db29c54ddb 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -381,6 +381,9 @@ static struct qcom_smem *__smem = INIT_ERR_PTR(-EPROBE_DEFER);
  */
 int qcom_smem_bust_hwspin_lock_by_host(unsigned int host)
 {
+	if (IS_ERR(__smem))
+		return PTR_ERR(__smem);
+
 	/* This function is for remote procs, so ignore SMEM_HOST_APPS */
 	if (host == SMEM_HOST_APPS || host >= SMEM_HOST_COUNT)
 		return -EINVAL;
@@ -396,7 +399,7 @@ EXPORT_SYMBOL_GPL(qcom_smem_bust_hwspin_lock_by_host);
  */
 bool qcom_smem_is_available(void)
 {
-	return !!__smem;
+	return !IS_ERR(__smem);
 }
 EXPORT_SYMBOL_GPL(qcom_smem_is_available);
 
@@ -777,6 +780,9 @@ phys_addr_t qcom_smem_virt_to_phys(void *p)
 	u64 offset;
 	u32 i;
 
+	if (IS_ERR(__smem))
+		return 0;
+
 	for (i = 0; i < SMEM_HOST_COUNT; i++) {
 		part = &__smem->partitions[i];
 
@@ -1247,7 +1253,8 @@ static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
 
-	__smem = NULL;
+	/* Set to -EPROBE_DEFER to signal unprobed state */
+	__smem = ERR_PTR(-EPROBE_DEFER);
 }
 
 static const struct of_device_id qcom_smem_of_match[] = {
-- 
2.51.0


