Return-Path: <linux-arm-msm+bounces-17629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4B68A786B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 01:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A62A9B21106
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 23:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39EB613C3EE;
	Tue, 16 Apr 2024 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B7cMmsjR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F5113BAFB
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 23:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713309039; cv=none; b=GR4pvC8f6jNWBjmX84D+H0F1aQcbjPBLqrMh7n7EM0UcZMHP+h6sOfYDELKt+vl12h920GRY5a+F+f3mKGs4VUCU/ruNNCaHb6ua5KjmrsuQcVxP1uQ8RcqCvQ4l4OtmNfGMo15KIurBRZ22+hygNJQfNs9z/MEkGGkp9KyFi3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713309039; c=relaxed/simple;
	bh=0w/GalyjKhtm7V40Xeg+gZtBNnSkcPD5bf6D80njZg4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TfVjHrsFoHSx5o16hG/wd2tcZq6sGTERb68pkav9pwXxylSBg6xEcbmnbnUIX1YVW8lhwpFPq6ykS+FPP5WeIIWALbMH9hNRDVXq8tax3LGwuDyvmi0SqEdJgiicpTMPC/oL2Omt9tHIYSZUj1p5jcQalbj46cfnNuXSHNzZzHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B7cMmsjR; arc=none smtp.client-ip=209.85.166.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7d95f2a2dfaso136649039f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 16:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713309036; x=1713913836; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1cycQ/8bfoSZo1QkPN/xurOqM8w9ywrZOAoEh+e7Jk=;
        b=B7cMmsjRdcRu038Y0gCgoZQwuozlj5R4TzfvDajRnMsjiQmApul0+IxXU1rs+J1NXF
         jho3IR8T9/TBmVSh/kQmrk+jZa5F8Hv8/HvA9jlsAAdeGXwbSv09gFFCBXAMHtG7B0wZ
         csqMClpFTWtKzNLqO1RnrYx31bUigrHu2fz3E7E642Ynf8MvCll3MRBVaTPSICaOufDi
         52wl+4VT23yDQYmaHFuS2Clr/vB9mG7gcpvDXobNBnXrsqrPVtHdV+QMGPeWHk2ML5SY
         82QlQb55xEqv/yypKS4RLX+GfoYYdg0yhwYv6MQQ6LfmxgmN0nGRbsYgHqfwVHn+Oko7
         ZROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713309036; x=1713913836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1cycQ/8bfoSZo1QkPN/xurOqM8w9ywrZOAoEh+e7Jk=;
        b=LvkrGrUVe0MRMMp6Wm8U6jwaHU+g7PqEkp666gUYD0wFSPdsNoFG1nDZ1P7GR0eLWF
         QCM4ZurAVOgMp/jnVsMZlDxQUV0o1BnyYl7VauA/gBCn04wdClbmrSd3L1K1uzcM1F1e
         5klSrxeXxlnFqESXRaxvBcJCwAnzsjrZmMQ0EpFJD+m7uZMzWXh9ezUoBujesjEs5m6O
         oyF62eESDAYAWzz4zxmuQhvC1Hn/yi1Qj8FUhJIsyvQk96YTitKM233iqZXLumrhmfQR
         vhxidXtnnZlPYi6w/1KEjNmryqNSL7huGEfiCfMCqm2xi0Um+M9yuJ+PNag4ayCjeGPu
         aSRw==
X-Forwarded-Encrypted: i=1; AJvYcCUbTpv36pwKVZlRTf/vN1mkrwWdtDe2Vopkc2AApxKiOaBzkKLzJI/UJcorj4WQRxCnLvM1iJ6FVDUXcUltNGnrrl79fBXs+JY4IFyBMQ==
X-Gm-Message-State: AOJu0Yw0vEtW8HOIwrWtdFBuTLtZF1KHMyf0LPrMZw5nXGVDiTQMM8Za
	/TK13Svr9ZCbXPCoosWGVOgbThSQZf5lIBcGTrfoJ+BTukt3yn6D7dlE+G+sUdM=
X-Google-Smtp-Source: AGHT+IFU5+egyBHc6l5XlmvWUch36dXYTH4w7+zeSYdtST8/i53fnCmO98oB+B7O2TMGKU8IN7Yq9w==
X-Received: by 2002:a05:6602:3349:b0:7d6:a061:c3b6 with SMTP id c9-20020a056602334900b007d6a061c3b6mr13868374ioz.1.1713309036611;
        Tue, 16 Apr 2024 16:10:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id le9-20020a056638960900b004846ed9fcb1sm372170jab.101.2024.04.16.16.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 16:10:36 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/7] net: ipa: eliminate unneeded struct declarations
Date: Tue, 16 Apr 2024 18:10:16 -0500
Message-Id: <20240416231018.389520-6-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416231018.389520-1-elder@linaro.org>
References: <20240416231018.389520-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As definitions in headers have been moved around, some of the
struct and enum declarations found in header files have become
no longer necessary and can be removed.  Remove these unneeded
declarations.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/gsi.h       | 2 --
 drivers/net/ipa/gsi_trans.h | 3 +--
 drivers/net/ipa/ipa.h       | 2 --
 drivers/net/ipa/ipa_cmd.h   | 3 ---
 drivers/net/ipa/ipa_power.h | 1 -
 drivers/net/ipa/ipa_sysfs.h | 4 +---
 drivers/net/ipa/ipa_uc.h    | 3 +--
 7 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ipa/gsi.h b/drivers/net/ipa/gsi.h
index 3bf1a1cc972c2..26cc3d368e1b8 100644
--- a/drivers/net/ipa/gsi.h
+++ b/drivers/net/ipa/gsi.h
@@ -21,12 +21,10 @@
 #define GSI_TLV_MAX		64
 
 struct device;
-struct scatterlist;
 struct platform_device;
 
 struct gsi;
 struct gsi_trans;
-struct gsi_channel_data;
 struct ipa_gsi_endpoint_data;
 
 struct gsi_ring {
diff --git a/drivers/net/ipa/gsi_trans.h b/drivers/net/ipa/gsi_trans.h
index 30c1c2dc77c67..407c3af24b6e0 100644
--- a/drivers/net/ipa/gsi_trans.h
+++ b/drivers/net/ipa/gsi_trans.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2019-2022 Linaro Ltd.
+ * Copyright (C) 2019-2024 Linaro Ltd.
  */
 #ifndef _GSI_TRANS_H_
 #define _GSI_TRANS_H_
@@ -19,7 +19,6 @@ struct device;
 struct sk_buff;
 
 struct gsi;
-struct gsi_trans;
 struct gsi_trans_pool;
 
 /* Maximum number of TREs in an IPA immediate command transaction */
diff --git a/drivers/net/ipa/ipa.h b/drivers/net/ipa/ipa.h
index cdfd579af5b94..6f4ea1cfa4a91 100644
--- a/drivers/net/ipa/ipa.h
+++ b/drivers/net/ipa/ipa.h
@@ -15,8 +15,6 @@
 #include "ipa_qmi.h"
 #include "ipa_endpoint.h"
 
-struct clk;
-struct icc_path;
 struct net_device;
 
 struct ipa_power;
diff --git a/drivers/net/ipa/ipa_cmd.h b/drivers/net/ipa/ipa_cmd.h
index 86ad4cd68d1aa..fa37416ba4bd1 100644
--- a/drivers/net/ipa/ipa_cmd.h
+++ b/drivers/net/ipa/ipa_cmd.h
@@ -8,9 +8,6 @@
 
 #include <linux/types.h>
 
-struct sk_buff;
-struct scatterlist;
-
 struct ipa;
 struct ipa_mem;
 struct gsi_trans;
diff --git a/drivers/net/ipa/ipa_power.h b/drivers/net/ipa/ipa_power.h
index e41791f2a1be4..3ffaa0687caa8 100644
--- a/drivers/net/ipa/ipa_power.h
+++ b/drivers/net/ipa/ipa_power.h
@@ -12,7 +12,6 @@ struct device;
 
 struct ipa;
 struct ipa_power_data;
-enum ipa_irq_id;
 
 /* IPA device power management function block */
 extern const struct dev_pm_ops ipa_pm_ops;
diff --git a/drivers/net/ipa/ipa_sysfs.h b/drivers/net/ipa/ipa_sysfs.h
index 58ba22810bab4..43d9cb0722a42 100644
--- a/drivers/net/ipa/ipa_sysfs.h
+++ b/drivers/net/ipa/ipa_sysfs.h
@@ -1,13 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2019-2022 Linaro Ltd.
+ * Copyright (C) 2019-2024 Linaro Ltd.
  */
 #ifndef _IPA_SYSFS_H_
 #define _IPA_SYSFS_H_
 
-struct attribute_group;
-
 extern const struct attribute_group ipa_attribute_group;
 extern const struct attribute_group ipa_feature_attribute_group;
 extern const struct attribute_group ipa_endpoint_id_attribute_group;
diff --git a/drivers/net/ipa/ipa_uc.h b/drivers/net/ipa/ipa_uc.h
index 85aa0df818c23..12997ecf5faae 100644
--- a/drivers/net/ipa/ipa_uc.h
+++ b/drivers/net/ipa/ipa_uc.h
@@ -1,13 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2019-2022 Linaro Ltd.
+ * Copyright (C) 2019-2024 Linaro Ltd.
  */
 #ifndef _IPA_UC_H_
 #define _IPA_UC_H_
 
 struct ipa;
-enum ipa_irq_id;
 
 /**
  * ipa_uc_interrupt_handler() - Handler for microcontroller IPA interrupts
-- 
2.40.1


