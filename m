Return-Path: <linux-arm-msm+bounces-62293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A6FAE79B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F52A7AF446
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 08:13:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 048722147F5;
	Wed, 25 Jun 2025 08:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YWUaszjv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244AA213237
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750839295; cv=none; b=NYs2XxY6HzeH0PRrYIaatPBVAfy0eZ7YK1rLiUwVTKDxdZePNTO1eaz9Qiu5izz7aMFGgepl7jbB3dnOXoVg82YQ6xE2DW6IQtJ5JHwkE1x1AWb6G2vWiUN8y13CVVaFE3LkEz8I4w7tsE0knwruLV07B+5dvsErlO+Mstppk90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750839295; c=relaxed/simple;
	bh=YNIW9UsdFP9pscxcrrHru1/N3ZSzLM8QniyMuB1IDvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hLElbSBXZ8wpI00wqKqhxTUzUcZVfkBlA341nJxdCXqxzc1P1vSEzZ49zdwSAjjt0gdKRJ8y0FvNIpBjf9Favf6ibdLQIuD8eMO5Nw43LQHopoSdjZSI9xCVWGcj52fJVVKGtMM8HemIoNIi2jhocESzonccDZ6MkNJFgU13Aes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YWUaszjv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so758644f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Jun 2025 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750839292; x=1751444092; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WqpREyAXmC3yhS/fm/mNzaUtkYpdExr/yKo5JzgY1Gw=;
        b=YWUaszjvvRiex6wLt3BPVuze/J/DDT2SToUHC0mdvpo3XlOiLKzIKL5yOIFyy5a27d
         UfJSGh+kGM2JZW2+3e94umN2+7XAHocgMD02E6Dp1aiTORROF5K5Yw3gKGHM8L5D/kLi
         tyhH/EBRAWXXZxwcpiTNq3CHklvBNnuawtmAAdryXZsehnIX67b/BO5O15gogeurs5GX
         qYPCHvt5RrgVE8q/mGraQDDxKRi4bykutaUCFzg82XOA36c0WTjWyVfzloTW5HpIoR9v
         AqOaiJVQhFQ+R6KpYSvLfesoM4jPSgf3QAEnA8aPxHh/z47OKu/L5Q8nSQjkWIHiUwti
         0H8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750839292; x=1751444092;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqpREyAXmC3yhS/fm/mNzaUtkYpdExr/yKo5JzgY1Gw=;
        b=mCI/b8CUivUGcPQuaV9WuAHv4I7ZfYjtoVgF5eAG/zdYZ47NSvURQc2nEqcmC9jyiM
         iS+DOh/3PO4Jiu6ZwjSoGhFbm2bwpuHppS2SOOGWtn8RnWcRLij8gEhlJOaUFQ2vjjjK
         E8cJwNXU+0LppnPagcIb4c/fooy+UitF1DHVj1/c5U1fAdFhlDXjqmWSpyVbsRWGA9yF
         88k3V2oE0sLQ3vzTSCWkBFDbld4Ek6uILncrHx2TTz7uUvxsHBDo5ZIPUi+EpPfAPjSa
         PoKfuTwU6NayF5f0qmVw7wobJQC8G5O6tMnDCOEkmdRhM2V/Davqxhm0/Xsu1/3XxZbq
         F+Dw==
X-Gm-Message-State: AOJu0YykW0JnuoHcN3Bi3VuVciZ6hiu8YClHLj2Cxj/vzHPnYugDkNA8
	R7esiA1Os6iv/2kIN9bTVW+CTZrS038Hk1H41XLqLcjLkrDtPq3rsKjIyZKAR/5pFlg=
X-Gm-Gg: ASbGncso98HPT8DrNDD3285ZSJjqxHaIY3U+lBYbkmENI/wmD2EsF7HBCUxsWPXMRJM
	KEK7zRk7TgyKk41701nYh5ikpUF+C5H231vmJW5jSEKtydWy2IFQJFo850T3nrAxfjXNOth2GMY
	m3ttsdF2UfVInA6zoqkxFAcOJse8Qx7OG9pK2mug+dVdbLmLKpPVNd8WgvztZy8pi1OO5HcVJ2r
	Z3ruOwUC1GEudYSmYeXfNgfC4IqfZ3ulSHusSBWVqGSfhBXB9IxqJazigSqxAqERwO98rQFbvr+
	2ZjzwSJzrh3MP/06RVr4tp0HqjPKg7BG/r0s4fXB4aDw7tipAtu04gAN
X-Google-Smtp-Source: AGHT+IH+pGqiUH4ot6FphC4q+2hxWVPN6OHPehWSU5Yh3aQBNEB8podmQWkScXqIENyLlk58phJ5iQ==
X-Received: by 2002:a05:6000:4104:b0:3a5:26eb:b4af with SMTP id ffacd0b85a97d-3a6ed620b82mr1230556f8f.18.1750839292260;
        Wed, 25 Jun 2025 01:14:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:d216:42f3:1e7e:472e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380705351sm20215035e9.0.2025.06.25.01.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:14:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 25 Jun 2025 10:14:49 +0200
Subject: [PATCH 2/4] firmware: qcom: scm: take struct device as argument in
 SHM bridge enable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcom-scm-race-v1-2-45601e1f248b@linaro.org>
References: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
In-Reply-To: <20250625-qcom-scm-race-v1-0-45601e1f248b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3916;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=QMjeoOD2JMPKRfBV2mJirTqacTcq98rdZzdaleaq91M=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoW6/5vPJKtxuWgZCpnkgm1plxhGOLpHVvCeHLU
 gTgqqlIOzWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFuv+QAKCRARpy6gFHHX
 coE5D/47BzUFr1EM/Uqna0eYeeQTOQKZc6gsb8MCcvKam76bWdgOa0rl4c/mzwXda2fpTF3odY5
 H3qNUaujVD6x9ulESekyHcj9/Gt0OqQ25KXpWLMUokyxNHLESdRp6kxNIkHZYaegGL+RIy8NEnt
 0CPPgzEWBOUN0SH8e3ZKKmwWQhIQccvfbx2Ht7o3K7SswjesQAfj7+EAg6uj79UAI1QpAO3Ds60
 bm62+mc8iHnRxF6ucXIM5BDjuDIlFVIyngDdS+FFUfkxa8Ev7uF4uiMNdd14GhfeWGa4+SEMlwf
 2MxYyNDKCk2dk5v7n6PPBbVgir4ax97QfwN2iz9wTlZ+KUM7WsvSrcrvhX/RGcIYnMZsAQIdXGF
 DIT+OZ0u9ouBU4wuO9UUYusuSUaXfA9IoE7LsX5D2Pd+ps3eSl8TO8dxUKK2ipKif1I70BClVby
 aiWJy0i+W3TU2ihLYsW2mY2eFgeNCj6NyMUrtlXfvGkE8rQ33TFTePgt6liaSmuvJnWquHgqcTW
 KXwmGLzfiEIpzvxOyJs/nRKl8GlHcQ06h2qsH7HfwZrFUGKcf7RqzAbS8bWpLhgVcfRuuuOqTZb
 SWF0sDJ0Y8x41g5pu6DrEy1X+7GJXtuMwieD8e+kE+kvoWB/7DEVCFabj6cOyWEjwZAKvU4Zpb7
 YGBg1fKM+D0TGjg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

qcom_scm_shm_bridge_enable() is used early in the SCM initialization
routine. It makes an SCM call and so expects the internal __scm pointer
in the SCM driver to be assigned. For this reason the tzmem memory pool
is allocated *after* this pointer is assigned. However, this can lead to
a crash if another consumer of the SCM API makes a call using the memory
pool between the assignment of the __scm pointer and the initialization
of the tzmem memory pool.

As qcom_scm_shm_bridge_enable() is a special case, not meant to be
called by ordinary users, pull it into the local SCM header. Make it
take struct device as argument. This is the device that will be used to
make the SCM call as opposed to the global __scm pointer. This will
allow us to move the tzmem initialization *before* the __scm assignment
in the core SCM driver.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/firmware/qcom/qcom_scm.c       | 6 +++---
 drivers/firmware/qcom/qcom_scm.h       | 1 +
 drivers/firmware/qcom/qcom_tzmem.c     | 3 ++-
 include/linux/firmware/qcom/qcom_scm.h | 1 -
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index d830511a0082a6a52e544a4b247b2863d8b06dbd..3dfc7d410348a4b17b22acee18b51949c58f7351 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1603,7 +1603,7 @@ bool qcom_scm_lmh_dcvsh_available(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
 
-int qcom_scm_shm_bridge_enable(void)
+int qcom_scm_shm_bridge_enable(struct device *scm_dev)
 {
 	int ret;
 
@@ -1615,11 +1615,11 @@ int qcom_scm_shm_bridge_enable(void)
 
 	struct qcom_scm_res res;
 
-	if (!__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_MP,
+	if (!__qcom_scm_is_call_available(scm_dev, QCOM_SCM_SVC_MP,
 					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
 		return -EOPNOTSUPP;
 
-	ret = qcom_scm_call(__scm->dev, &desc, &res);
+	ret = qcom_scm_call(scm_dev, &desc, &res);
 
 	if (ret)
 		return ret;
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index 3133d826f5fae8d135a8f03758173903a87e718b..0e8dd838099e1176b6d6bf76a204c875698eb1f7 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -83,6 +83,7 @@ int scm_legacy_call(struct device *dev, const struct qcom_scm_desc *desc,
 		    struct qcom_scm_res *res);
 
 struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void);
+int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 
 #define QCOM_SCM_SVC_BOOT		0x01
 #define QCOM_SCM_BOOT_SET_ADDR		0x01
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 4fe333fd2f075a4e92ac6462d854848255665e18..ea0a35355657064b1c08a6ebed7cfb483a60dd3f 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -20,6 +20,7 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "qcom_scm.h"
 #include "qcom_tzmem.h"
 
 struct qcom_tzmem_area {
@@ -94,7 +95,7 @@ static int qcom_tzmem_init(void)
 			goto notsupp;
 	}
 
-	ret = qcom_scm_shm_bridge_enable();
+	ret = qcom_scm_shm_bridge_enable(qcom_tzmem_dev);
 	if (ret == -EOPNOTSUPP)
 		goto notsupp;
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index 82b1b8c50ca3e5f97665e6975e8d7e8e4299e65d..0f667bf1d4d9d8c3e63d69159e3cdec2fb40396b 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -148,7 +148,6 @@ bool qcom_scm_lmh_dcvsh_available(void);
 
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
-int qcom_scm_shm_bridge_enable(void);
 int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle);

-- 
2.48.1


