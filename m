Return-Path: <linux-arm-msm+bounces-2096-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A942A7FA23A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 15:16:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24E7AB21300
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Nov 2023 14:16:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E93D31590;
	Mon, 27 Nov 2023 14:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ZxAcd3fA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB7531BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:19 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c997447ff9so23993841fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Nov 2023 06:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1701094578; x=1701699378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eVNRTBYkQ35refPua6fnWM3rCBTplvWDVxVAY6Q7+Wo=;
        b=ZxAcd3fAtdQJ3ooQw2VB96QiEzOjjCVR2TBtb6hPAjOzKjwcUNkKOdajs3M1rViqNQ
         Agraw2xK4ZsA4uDKhFqoUQY8o3fNgySf1UnMuqPkikrtFcDeYuKSf6YzN8BHSKIjMQ+8
         2LE2LI7FzBnadeVUL1BWtFSZ4S+rBv0+4X8iDDYm9FiV3vuRUeRuwkQkRokHPeEhT/+8
         JPdwcFznU8n4aJ3GguAIj7cjonnmAgy7EfX22gqxdgHsCJNwz0VTOZI+kmfen900bTrA
         sEKDRKTn9TjzJhuIw0uf2XEF/bJDVSjrm4ShO7axi3kxhs8uDsulnupO/Bcz1fN2k9Wr
         DwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094578; x=1701699378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVNRTBYkQ35refPua6fnWM3rCBTplvWDVxVAY6Q7+Wo=;
        b=Nr7KTqFdTZnWRcVjJiRxzlf4OBeMwFXqPWj/S6GF7mo5bak4zA45lap43iB7dEPQoS
         Qm/MjS7xqFd9Cs72QpwfNuv8mr/Kd1s+NgYrh5SydKmKCP+El7TWld5KYSkiZqSsvvde
         ir7VjkBBBLdKilfz3dcPKr8fX/Zq1rJVv5stPpU37lxo9tbtHLDnPLx796qu6eYN/dkT
         6cIiNpyhilnA7EJNKNj/kGPqqQ4V1szb39xQHykFJQmApdr2INMo0EwEcbrW55bat/49
         LGBXUDodwptXdqNzzaiL2kDwvIY9dKZYUZc18jvaFiOtow/l26dx3OpITpwcGQ81Dylg
         2cQw==
X-Gm-Message-State: AOJu0YxT8iZrTnPDqdQpIfWr0Tu/umkIjwvI30XYrIgiV0+eeFYhSXI8
	TEPu5+M4+2AdkQihUyoM186ICQ==
X-Google-Smtp-Source: AGHT+IEZUxmSOKvYVwtL0F7BrhlYoGaqOU8AJQaYo2RkaaxHLkEg9bcAwxd0mdj4l3PkFiSHNjGBmg==
X-Received: by 2002:a2e:b5b6:0:b0:2c9:9a20:f496 with SMTP id f22-20020a2eb5b6000000b002c99a20f496mr3657189ljn.29.1701094577880;
        Mon, 27 Nov 2023 06:16:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:bf33:77c7:8131:5e64])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm14658830wmb.14.2023.11.27.06.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 06:16:17 -0800 (PST)
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
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v6 07/13] firmware: qcom: scm: make qcom_scm_lmh_dcvsh() use the TZ allocator
Date: Mon, 27 Nov 2023 15:15:54 +0100
Message-Id: <20231127141600.20929-8-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231127141600.20929-1-brgl@bgdev.pl>
References: <20231127141600.20929-1-brgl@bgdev.pl>
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
---
 drivers/firmware/qcom/qcom_scm.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 31071a714cf1..11638daa2fe5 100644
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


