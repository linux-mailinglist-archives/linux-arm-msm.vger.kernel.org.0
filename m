Return-Path: <linux-arm-msm+bounces-13175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D984586F5AA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 16:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1717B1C21336
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Mar 2024 15:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404BC69E09;
	Sun,  3 Mar 2024 15:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TpO8HbMc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B392692E5
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Mar 2024 15:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709478093; cv=none; b=scOncDvTw3zL3OZQIJBIjSqljnFLiGUAYdPsvcSWB9cWHVOAFyqylTeR4ToskfSUEF1afs6H9MQP4ReswRZW+jIMs535mvcB2qNb1o1THzaKssU03/gUxR71MEZual24b7bY+3XUK3j9CsG+uhCAgE5Pv0yF981jcfVlzygBaKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709478093; c=relaxed/simple;
	bh=W62wClgcYa0PKLUh0EyUOEk3cSRlXh6BgLiU1tYJFYc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JVjGQvLEIqJ0cwSO+JJhCO+/Fe2Rl191ueMo0KVlfaDE1ynJ9N4hJ9VfSDTfjA9v8SQFynwku+6U1advJa2dX6sB770Uu3JCSEqVWFgLaHtecS3bN8ddTUMGqOAUDd9NdLJ2EapLbNVo6HgaLywK5hfIm+PWheyp/JajWYQYiMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TpO8HbMc; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-512bde3d197so3479232e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Mar 2024 07:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709478089; x=1710082889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwOsyagATLxiLLSOZuWrrte+FT3urOwesDO7wStwSyU=;
        b=TpO8HbMcU/yz6W1heY4uOaJbXNOhanlA2XBDXuz+yAZEhgVnXXzz7LdiGNDwmLVf3y
         lILHopD4iR47j4JXXf/DYDkH8VHAJ46dic+c/MFWNkZCvaKtovGy03ExXIAEfYiQwhhb
         CTtM9mztquL8jz4JEC6gGc8LdBv5EfntYy/i9j7HIb7C7LcwhFfhJ5VMZ8EVuCrb6ef7
         9jl48yxUE9/WTiKGHox7+PFiVYYGrq5rYTaHYZISozqe7s6Qhq4ECzMZNfgul2TO7VRE
         ilmI0IGaGpM2si8usHqlpgDI5QEuNE2fToA/SDiernr2hNX9t0DK8uAlK27HmohlHafz
         0gPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709478089; x=1710082889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rwOsyagATLxiLLSOZuWrrte+FT3urOwesDO7wStwSyU=;
        b=nJ5CXJ3SyAlcwT2SsWCJYxjbmQ1IqTzDCxj5fiAXjJp1DSsHqOxcNAapb4zl5gx3RN
         CJ3ZcM5nRI+OWuwaOXUpCHyRRZpPYcQzGKaeY2GP/iiYSZPH3OHuY6kodhv1AVsL9qCk
         EwzVjrzvL1DOPTu0/A+UcKkvetOZTt/N4YeaMp3AQ41CQdOL9KoHbSWsQyIXWDn53lc0
         TnGDUcO9i5mRRYtuLV5W4cnH3pRGHSuscHr+4U6HOcPPXANCatNdGImlGq5YiHAbizJp
         3LqROHdB9IstvW8fCvfJJ6scOHuW2rDQM66VC9pEp1/ljX6vIxXSY3xVD1v9Av5LbuSs
         wNWg==
X-Gm-Message-State: AOJu0YxgAgZSMLD8zwJJAfd1fV0df8FHqZlGJhVH/XrNR1zHku39thtS
	ukutocLDIHB0sjvBuU9LaJCBe5nVxolwNCZUN77kWwpKoz6MnUQV9SJvNuq4Vd9uqJbnAU370gT
	mTshZng==
X-Google-Smtp-Source: AGHT+IHGQCA1nHfqiZlNwIm3ejWFnOM2lHkM5W3Q89+JQgso6u9tVFPfbbwJCf9MV7KbXIbcr0DDXA==
X-Received: by 2002:a05:6512:3493:b0:512:d89e:946 with SMTP id v19-20020a056512349300b00512d89e0946mr3969996lfr.44.1709478089065;
        Sun, 03 Mar 2024 07:01:29 -0800 (PST)
Received: from brgl-uxlite.. ([77.241.232.10])
        by smtp.gmail.com with ESMTPSA id ch14-20020a170906c2ce00b00a42ea946917sm3740293ejb.130.2024.03.03.07.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 07:01:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Elliot Berman <quic_eberman@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guru Das Srinagesh <quic_gurus@quicinc.com>,
	Andrew Halaney <ahalaney@redhat.com>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Alex Elder <elder@linaro.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Deepti Jaggi <quic_djaggi@quicinc.com>
Subject: [PATCH v8 06/12] firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
Date: Sun,  3 Mar 2024 16:01:09 +0100
Message-Id: <20240303150115.133633-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303150115.133633-1-brgl@bgdev.pl>
References: <20240303150115.133633-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Let's use the new TZ memory allocator to obtain a buffer for this call
instead of using dma_alloc_coherent().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 50c574fef3ac..ed2600bbd4eb 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1340,8 +1340,6 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_profile_change);
 int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		       u64 limit_node, u32 node_id, u64 version)
 {
-	dma_addr_t payload_phys;
-	u32 *payload_buf;
 	int ret, payload_size = 5 * sizeof(u32);
 
 	struct qcom_scm_desc desc = {
@@ -1356,7 +1354,9 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 
-	payload_buf = dma_alloc_coherent(__scm->dev, payload_size, &payload_phys, GFP_KERNEL);
+	u32 *payload_buf __free(qcom_tzmem) = qcom_tzmem_alloc(__scm->mempool,
+							       payload_size,
+							       GFP_KERNEL);
 	if (!payload_buf)
 		return -ENOMEM;
 
@@ -1366,11 +1366,10 @@ int qcom_scm_lmh_dcvsh(u32 payload_fn, u32 payload_reg, u32 payload_val,
 	payload_buf[3] = 1;
 	payload_buf[4] = payload_val;
 
-	desc.args[0] = payload_phys;
+	desc.args[0] = qcom_tzmem_to_phys(payload_buf);
 
 	ret = qcom_scm_call(__scm->dev, &desc, NULL);
 
-	dma_free_coherent(__scm->dev, payload_size, payload_buf, payload_phys);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh);
-- 
2.40.1


