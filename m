Return-Path: <linux-arm-msm+bounces-17966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB388AB1A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 17:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B9811C22BEF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Apr 2024 15:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264D212F5BB;
	Fri, 19 Apr 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kl1XPb4v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF0131188
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 15:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713539893; cv=none; b=YFB+3ZVNKz1W5TsPdJfJCT5OeEvZtZuuMEdZPKtStYiZtN/DG652XCHli6FTESxVf7hDcLKXImq03xz1AE+vmRtz/DTc/Zkx2aDTnYAqzn2yMxQrvcIuihz+knBar+XpPwc94Rx7tjwHYoW/ltoWZLqOSO7MJpUqpsAV8t4YJ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713539893; c=relaxed/simple;
	bh=erv4VXroO0M21slKGUyDFXCqBxmjZSFL8Sl5lqDo4rY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IBKEtJbT0lZAKCSZDB22/7099sOo6Z1RICPwWcGX25/wG7WDgKE+nBYMdM80o6JL21yTlNSAqb2Xah6cJJ4eF/+gU4q2WRziyte9wWKIyImjuiA3TJOehkgny7nSZVtLPxOpbe3ixzCeHGJbdlfjxLa+UnW3zMyBqV87QGbHcVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kl1XPb4v; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7da382f57a5so63518039f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Apr 2024 08:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713539891; x=1714144691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lwnKPG2Aybimx/N3MD6w+czRD9+BNJvZbpMTIj3AUuA=;
        b=kl1XPb4vePOvoPx1YiVC+9UC8u+4l4xrn6Sx5P1ftQO0m5EEojo9VrGyRKIsEFgUvh
         4JcPSsgto1PdAFu9Uh/Q+FBTLgkYj57op+6b6FnRKuah/uqrDBQL9AQJJ8SjX9M+P2i5
         u2gXoCDixfRrjDCEei0VU1+D2Mmgdmy1bD5Am9qI2j9htoEvWTcmpbTiI14xoFoJ2suY
         DxJIYD1GI5I8/ODdJQJFfWo9WCu7gCijYqErXZ4nG/s3dmRVbCy1Jzw5ACoMpp6l7tfN
         rnU2yyd0ZbMU3kYygaETXuOr/HR5qfRdAmWQtEHCcSm+vFDPC1On3UpvnSl4wZv9Bevo
         sKZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713539891; x=1714144691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lwnKPG2Aybimx/N3MD6w+czRD9+BNJvZbpMTIj3AUuA=;
        b=Scrymqz6nemlFlN/iNLrT5MEeDV1ryrAH5mbNSqVI7ROeB8nhF2SsH2IFXD+K8blfz
         j6+b8ytzy/ph4ioD7vVHasH7dQ56FYpAR4Dg0sNRucyRyErt0FVP/ytWLy5MIWZ/4oVZ
         Ei6VZ6nYPVJdHn9M28nocMznnebc4PAQAhMweDju7INaYifH1quwKD40NFfOWxpFRiOO
         iAaijL7BEbSyh0vMFg57frDbBpzSuBCthTdTKcJ9Kgs4szs3rg99Ni/Gdh1IxmwudfvX
         VvjiHkjX7jNiN7E87PSyL9v5g3qNIWubW1CQiAmBk7csSbSkscYLBXjjUjBjB8teNs6q
         AFrg==
X-Forwarded-Encrypted: i=1; AJvYcCU8nTrm0ZpD1fhV4HBIgrVJ+bYtz4B30aFlQBdCLn51M7ZFMh+zGAPzBYwpbexIawrKsxAiGZA4cFQs0M4sq8umOolKeCH/9E1IjNNVOA==
X-Gm-Message-State: AOJu0YznWNgpAtyxHzd8tEm3fpMRKNzMz07b1MqolLpslCwOVoJiqiyC
	r9yBnkz6mQ++wJqmvsszfT4tN+SOQD0Zah/L4MsXOUNYv9VP97xVa44GH+ENnXk=
X-Google-Smtp-Source: AGHT+IE9uu6ak6BSrNZjfqIaY8j4SEnqF00T+KY3FChxz87UgQ+A6nXOPiLVnowpl6k8ZRP6dhGsAQ==
X-Received: by 2002:a6b:6c0e:0:b0:7d5:d60b:c425 with SMTP id a14-20020a6b6c0e000000b007d5d60bc425mr2679541ioh.19.1713539890773;
        Fri, 19 Apr 2024 08:18:10 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id lc8-20020a056638958800b00484e9c7014bsm116126jab.153.2024.04.19.08.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 08:18:10 -0700 (PDT)
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
Subject: [PATCH net-next v2 6/8] net: ipa: fix two bogus argument names
Date: Fri, 19 Apr 2024 10:17:58 -0500
Message-Id: <20240419151800.2168903-7-elder@linaro.org>
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

In "ipa_endpoint.h", two function declarations have bogus argument
names.  Fix these.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_endpoint.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ipa/ipa_endpoint.h b/drivers/net/ipa/ipa_endpoint.h
index 328b90dfd1695..e7d8ae6c6f6a6 100644
--- a/drivers/net/ipa/ipa_endpoint.h
+++ b/drivers/net/ipa/ipa_endpoint.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 
 /* Copyright (c) 2012-2018, The Linux Foundation. All rights reserved.
- * Copyright (C) 2019-2023 Linaro Ltd.
+ * Copyright (C) 2019-2024 Linaro Ltd.
  */
 #ifndef _IPA_ENDPOINT_H_
 #define _IPA_ENDPOINT_H_
@@ -199,9 +199,9 @@ int ipa_endpoint_init(struct ipa *ipa, u32 count,
 		      const struct ipa_gsi_endpoint_data *data);
 void ipa_endpoint_exit(struct ipa *ipa);
 
-void ipa_endpoint_trans_complete(struct ipa_endpoint *ipa,
+void ipa_endpoint_trans_complete(struct ipa_endpoint *endpoint,
 				 struct gsi_trans *trans);
-void ipa_endpoint_trans_release(struct ipa_endpoint *ipa,
+void ipa_endpoint_trans_release(struct ipa_endpoint *endpoint,
 				struct gsi_trans *trans);
 
 #endif /* _IPA_ENDPOINT_H_ */
-- 
2.40.1


