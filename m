Return-Path: <linux-arm-msm+bounces-17886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A58B28AA44C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 22:49:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA08C1C229EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Apr 2024 20:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 695201A0AF6;
	Thu, 18 Apr 2024 20:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYjQt/ct"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EFF19DF44
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 20:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713473265; cv=none; b=iZ10KmcktUa/K4Ccgw9pqjehQxd+VWlDQ6eaAVcmdug/UFZoQNtN2xbDUJkzisc2zu++ugiWbrAbnUvCa2S3VPS9NVBzIo4onU4ITpjgDsysDwgYGMkgYW0lFgF85/Vu7/ybMwnLfMSkKEQHK49SXNfnXAFwToimc67Qu4WPc3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713473265; c=relaxed/simple;
	bh=/O26O0SPwaQndb7Gk11BnaA079JRAE9KvwG8Uy+fgkI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g1QscAvH7QurKZDCMarA3sqhRJqi3EWpG+Mp8hL6Iwf7CyOUWUrnycyzIbwnjQbF/pXN2VJjynKbCAD3tSxGkXpo0fLrQ029fdLDQ+WmAJ/S3ZDUENL9SgtNjQPJ6X1SZHf/uQWVRaJEkbyI4XrfjLV2ZffTKEIW3uTDRs0009U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYjQt/ct; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-7d5facf3161so47996839f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Apr 2024 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713473262; x=1714078062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H3Jy4pWunk3gIi2kTc2gXOgQDTDQJh8keviaOUz7uIE=;
        b=ZYjQt/ct3cSn6dvp1SKUcDXcgH2FKAR52Q3W2nIGlJJGgaTvC/4zZFVFT2etV6rday
         O5mKZshbjyXK9iXvziVoRcdPICnO38fguID/IFrxhMRrtK603J+pUvfajz3BXmE2UlqE
         1T6pi4HzGsjrprgJBxGgUqc7PnRb0Rzvv0FDNATLKqny6+sZUl+eZzhE5IRZLjbQuRm/
         1mnYhWBVDFhyQzarDCAoP29U/nR+xl/E2HVPstkqsVIFmAGa6MayucaK+p8+dFfJZjsO
         xbl0+Lqqt1DMFHytNbr1JoIickSFBT5IjubMu8NEHI3RXlAJYWz1EUczTZHVt4+OEf6j
         E9HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713473262; x=1714078062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3Jy4pWunk3gIi2kTc2gXOgQDTDQJh8keviaOUz7uIE=;
        b=aQ4yZ/twJ7YNn2mD4iWIG4iTZs1ADUevY8guAb73m6o5sDGpRCvopzlUOVG8pG3WgU
         NPeL0SAosOGPgXyhIj/EzNuRfnA8JEFYUKiJdbL7cZD0jWuRdTrROAneEhTej1o9xnV4
         8hZKzyXW6jEzbcLKmN8AmkRLypdS1WjnUt5dw3H9FOoRGj3vdF7QDF5H03hvIpvlly9B
         xujmWF0q7x/Y7RQEl9Vf9XdK8AMuu5bvsIydQBGkc9hmkFV1YQGYNXMTpJBOVt9u3jId
         9RoYlH3+rk5Ok7AsrD0JFauDLWg0pedJexrM4emjBuwA7b29zKt08PhkvzzHZ3SojcuM
         6gmw==
X-Forwarded-Encrypted: i=1; AJvYcCUURfOKBjn9JZqPbPtRXmGxtze23fZ7YcFroI/R8lMdcmvTnG6booT96oJzOTbFvBgQSoOPXRqnKgvztIdVcK1cI2PBXcoxAF4B1cdkZw==
X-Gm-Message-State: AOJu0YxiIRYZVEqEJMMhloy8onHAtWwdMVmaitRxfuDCwnd1tEd4WMv/
	4Ni330RbSWLKXtABolE1JKWrJXYwwkKWgro8volx9xb2B/dBx9WwV4nSrOSyPC0=
X-Google-Smtp-Source: AGHT+IG8BLSKKt4Z+OUV/Ccbn8w8o09vBKQ7lL5VpQxMYtcdH5yIUGgB0k1msp2eDPQ+0DIyHdZwIw==
X-Received: by 2002:a5e:8b04:0:b0:7da:1911:8a9f with SMTP id g4-20020a5e8b04000000b007da19118a9fmr468131iok.4.1713473262075;
        Thu, 18 Apr 2024 13:47:42 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id r6-20020a056638300600b00484948cb8f5sm626998jak.91.2024.04.18.13.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:47:41 -0700 (PDT)
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
Subject: [PATCH net-next 5/8] net: ipa: make ipa_table_hash_support() a real function
Date: Thu, 18 Apr 2024 15:47:26 -0500
Message-Id: <20240418204729.1952353-6-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240418204729.1952353-1-elder@linaro.org>
References: <20240418204729.1952353-1-elder@linaro.org>
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
index a24ac11b8893d..9b4bb6d3f152a 100644
--- a/drivers/net/ipa/ipa_table.c
+++ b/drivers/net/ipa/ipa_table.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2018-2023 Linaro Ltd.
+ * Copyright (C) 2018-2024 Linaro Ltd.
  */
 
 #include <linux/types.h>
@@ -161,6 +161,12 @@ ipa_table_mem(struct ipa *ipa, bool filter, bool hashed, bool ipv6)
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


