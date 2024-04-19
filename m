Return-Path: <linux-arm-msm+bounces-17965-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 236468AB19B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:19:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B72381F24050
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7BD13172E;
	Fri, 19 Apr 2024 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zm2w4PNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68706130AEF
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713539892; cv=none; b=pxPmAov7t8j9kQzhdAFo23njJ08QrTCH413Gh165Z4vQGg9XBI3Q+067y9lC5q8xsL/OpbInOm2gt6dIuDR3NeUzV+kuXg2KecIiTjeSOOTB8reDnwTrVzx3nrMy0P2sbslq6c3Q7LOsN8wvjBDtrDazWcGE4RzMI2mzGRgPa20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713539892; c=relaxed/simple;
	bh=mgG51iYBDDFdQeIEUv5d3iCvX4AlEHh4+4ja42oAgYE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZvE3Wl181O4wX98Wjw/93bfw+0wpIe4J5A/JaefoJ7MlRnzsBF29nFE24O0LxHkdPmSWH/VYVBfeD3t9leDxqAmLPJRhXbSDEmjW0h4s1FB579wTTyriLANrb9t24sQC/KjSbLCENYhCFlCboTeiOa4wGtL3ot2MqXn02rDWnP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zm2w4PNo; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7d622edf790so80338939f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713539889; x=1714144689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfCN4tlBj+RpqK9tOiyo6f0tvsgy7nTKe81fkNY9Se8=;
        b=zm2w4PNooR42TiMCwEYKQTbZj8yz0Mc7TI2DTm+6HzdKP5CcQ2tO85RyJ7FxXC6g5a
         ZCcKfcJc+Oz8P2zuuxf3Fj7IEYzwoDMLeROw9dGUHr2HpVKH/P/vCi1R1CkqrwRldIoE
         lB33OXq2P2DYGeCZr2tpqqr9coyNY84J7WohWXTgFsH8gw7HvSpwPnBMYM3VcfaaHkuJ
         uQP2iFDNDtIb4/nAKl6yH3GGVoA+/TfV0fh1KginmlVCsyhX3DFaSOnInxnmYvoL0iRP
         9gdaiaqyDkqiGXy9lNFSTq4VASSuKGkmo6i0rPuk6ulUs01bRB4582b9lVCLf93bXdLD
         1CTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713539889; x=1714144689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfCN4tlBj+RpqK9tOiyo6f0tvsgy7nTKe81fkNY9Se8=;
        b=FMt6A6AmnlS1G7WUOIbRgM1sDOpP6F5OD1Ya1WplFjkxwO9gUuQvBfwecwY952vfg4
         GzsdEMYpvP3FQWUAskaGMbKndvmzzfMJEBst0XVHJJa+0/1AEeQSbhw6bUN09XlYNmXw
         +PRpJftTWuf1qzmxxoERVbrafj7Z49nog1imXmr/d5vJ0LedeQM3fJa5Sh5kmWyRvh9s
         r22UQzPj2KF7Nm42+QJyJb8lGF/z64I2ouUfMBNerXsLVccA+eUq0oG/zCKf77G4p72e
         qEakB9Ezq3ERFQNHytmF6J4JyzWQpUegcUXEqMqE6oQCtWkLBZ+Z4zgC5q7aPi6SlNfr
         hXng==
X-Forwarded-Encrypted: i=1; AJvYcCUcfxNhKBST5t7AzPzFVZk7ReeWi+QR4h8iBY7gC8cYbabUzq+ZP6t5Yd36go4mxcsOIvjT0ulHmuT9lbBLCfjDjP2A+4Cfkjc8z0FYQQ==
X-Gm-Message-State: AOJu0YzZyNB0ONJMWNzhx+InD7hG9DBkD7GB3o36qUjc4Jd+SqtN5p6M
	fcvLLCp2PlPdRrBzzUg45JJAh3E12bZIUdctXnKbQm4kiDivqzpebJ6xvp+W5qU=
X-Google-Smtp-Source: AGHT+IFzvpR/FxtDaUoycVyCQ0DALrphK+JAM+rF9e/T3ecb+xze3a7ALLi+77hxZ7f3BlMDFxC8Rw==
X-Received: by 2002:a5e:9910:0:b0:7d5:df5e:506 with SMTP id t16-20020a5e9910000000b007d5df5e0506mr2970977ioj.9.1713539889593;
        Fri, 19 Apr 2024 08:18:09 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id lc8-20020a056638958800b00484e9c7014bsm116126jab.153.2024.04.19.08.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:18:09 -0700 (PDT)
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
Subject: [PATCH net-next v2 5/8] net: ipa: make ipa_table_hash_support() a real function
Date: Fri, 19 Apr 2024 10:17:57 -0500
Message-Id: <20240419151800.2168903-6-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240419151800.2168903-1-elder@linaro.org>
References: <20240419151800.2168903-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the exception of ipa_table_hash_support(), nothing defined in
"ipa_table.h" requires the full definition of the IPA structure.

Change that function to be a "real" function rather than an inline,
to avoid requring the IPA structure to be defined.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_table.c | 8 +++++++-
 drivers/net/ipa/ipa_table.h | 7 ++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ipa/ipa_table.c b/drivers/net/ipa/ipa_table.c
index 45eb24be78a2e..4e4a3f8aa8e84 100644
--- a/drivers/net/ipa/ipa_table.c
+++ b/drivers/net/ipa/ipa_table.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2018-2023 Linaro Ltd.
+ * Copyright (C) 2018-2024 Linaro Ltd.
  */
 
 #include <linux/bitops.h>
@@ -158,6 +158,12 @@ ipa_table_mem(struct ipa *ipa, bool filter, bool hashed, bool ipv6)
 	return ipa_mem_find(ipa, mem_id);
 }
 
+/* Return true if hashed tables are supported */
+bool ipa_table_hash_support(struct ipa *ipa)
+{
+	return ipa->version != IPA_VERSION_4_2;
+}
+
 bool ipa_filtered_valid(struct ipa *ipa, u64 filtered)
 {
 	struct device *dev = ipa->dev;
diff --git a/drivers/net/ipa/ipa_table.h b/drivers/net/ipa/ipa_table.h
index 7cc951904bb48..16d4d15df9e9c 100644
--- a/drivers/net/ipa/ipa_table.h
+++ b/drivers/net/ipa/ipa_table.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2019-2022 Linaro Ltd.
+ * Copyright (C) 2019-2024 Linaro Ltd.
  */
 #ifndef _IPA_TABLE_H_
 #define _IPA_TABLE_H_
@@ -23,10 +23,7 @@ bool ipa_filtered_valid(struct ipa *ipa, u64 filtered);
  * ipa_table_hash_support() - Return true if hashed tables are supported
  * @ipa:	IPA pointer
  */
-static inline bool ipa_table_hash_support(struct ipa *ipa)
-{
-	return ipa->version != IPA_VERSION_4_2;
-}
+bool ipa_table_hash_support(struct ipa *ipa);
 
 /**
  * ipa_table_reset() - Reset filter and route tables entries to "none"
-- 
2.40.1


