Return-Path: <linux-arm-msm+bounces-13033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B648B86D5B0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 22:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D125E1C2341C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Feb 2024 21:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9466A1527A5;
	Thu, 29 Feb 2024 20:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ekaKm67M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A91504C6
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 20:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709240170; cv=none; b=l9GkLmTgAiGmB6EyyopGs8LRjBYYVtSgZhokUjx6UZb6vUyoXSTrTAh1JEHiWmNmS1NEBHa196O5MZgVzMKiXX12Ld5v/AR6u0d75a/k/grz7bkd1k1NxRjuBK/9rRIp8fdzcOQIUjOBhHzlFOgOGvsyaqjy0KrN6CjHFNvF+WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709240170; c=relaxed/simple;
	bh=pEDv/5wU7sbtDhxVNH7M10AUlaZ8vBb6MddBYxdRtUM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tCb5m9bYDb7AAYJ3gFYLtzoQP/xON4xtZFZLTp4pXhBwNCWwDRf62SElv/ylEuPfT1TObNbi5sejhzqsRJiazPkDJzICOZCDb1GTXUGY0WDuHoZLcUWqFAYp9DIkQGs6LjRDkI6ygFaYUc3wmBMNNV7YlpvCLXLe9KthLOdmZ/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ekaKm67M; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3651c1e1022so6692435ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Feb 2024 12:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709240167; x=1709844967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CjF4i+Vy6ouwx0EOaBtId9vglat4HShUeD3p4ZJNnXY=;
        b=ekaKm67MDgpRP+zqMVGclf8BvL5mRHjOCL1hVtgTLbSqrFnwSFMF95aFhxVQeXSG6r
         lNGpTDUWTSEPe1h57ofgJ6lMXvupykY93P+LykycGFngjkBj58IYMGR5K2of2V935WOk
         2mX5m6eRG3ijtkNWIFzLAgbUEswoxJD8P+a4QYwIQ4Bk9s7kqTgWr2m65ASbcR1S2S+J
         qR3ukvXGkdc/bHUHBvzbmPLzXDV4hei7ll8YZQ1QlQv95XEIIT6/wVzjGAJEaTYekStl
         p+IBOcCR21wh3tpSWB0GuioW/JgJicrP+UZkPo8A3RKTcGQGGLUiQ00F4WXuMcumtekR
         xbfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709240167; x=1709844967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CjF4i+Vy6ouwx0EOaBtId9vglat4HShUeD3p4ZJNnXY=;
        b=aAP8hBgZj42ll1XEuDRly8UBBAn94RygtNfFD2HdADMtidR4QhD2MoLNwqRDtdAqMM
         fYiqxyUE09tpE1STh+8W7EUoXSCo35VITg5CT6++j/1WQ4B78tSOm9EYJVPPF3z2k73D
         Z01YpsG4nND5cfBvzstTWBY7jPOLYshMryIHwQ79T1es6bn4LhPqGSKDo7G976gGv5ta
         uQa9wSSFEMX0/8ap55ssyDmRva5E5BwqcSRocOECXeYcu4CWDBKUKbG2e8LMIn6Wgh5V
         O3NNXR/xiY6cz+r7GNvhXFwuKSG8Sups/Vwv3VudRx6JwqlTesgh9TzbAe/cX4KqFulH
         WeEA==
X-Forwarded-Encrypted: i=1; AJvYcCVaBiWIMjJP9PPnB7X4rF0WJL4gXoi2EUkV5eckQJap5IExbqDBWSV77s6wXBkc2vvyQBy2/sZla7dkkzrGu/o+RZBRsDz/TaLfmVSPtg==
X-Gm-Message-State: AOJu0YzTh44BgO7j+hBXcV3ze9PLqqRiKxgj0fCYjc7/EqIDDN1YeUWn
	9QnNljWUCzekpYeIhZ80FTa0O+jkxYj50gBBJxiloHDvJ5uAZGQbGBImd8+fIqw=
X-Google-Smtp-Source: AGHT+IGdoKi6C+rA0byjO8nOJp/Q/Gcboxib0igBCpb/NWRQoPu1yXNvKq1oWZfIq0U8OfZgk0wHfg==
X-Received: by 2002:a92:c264:0:b0:365:4b91:7cf9 with SMTP id h4-20020a92c264000000b003654b917cf9mr172420ild.26.1709240166902;
        Thu, 29 Feb 2024 12:56:06 -0800 (PST)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id h14-20020a056e020d4e00b003658fbcf55dsm521551ilj.72.2024.02.29.12.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 12:56:06 -0800 (PST)
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
Subject: [PATCH net-next 6/7] net: ipa: pass a platform device to ipa_smp2p_init()
Date: Thu, 29 Feb 2024 14:55:53 -0600
Message-Id: <20240229205554.86762-7-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240229205554.86762-1-elder@linaro.org>
References: <20240229205554.86762-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rather than using the platform device pointer field in the IPA
pointer, pass a platform device pointer to ipa_smp2p_init().  Use
that pointer throughout that function.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_main.c  |  2 +-
 drivers/net/ipa/ipa_smp2p.c | 10 +++++-----
 drivers/net/ipa/ipa_smp2p.h |  7 +++++--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 17ee075370ce6..3125aec88e6e1 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -888,7 +888,7 @@ static int ipa_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_endpoint_exit;
 
-	ret = ipa_smp2p_init(ipa, loader == IPA_LOADER_MODEM);
+	ret = ipa_smp2p_init(ipa, pdev, loader == IPA_LOADER_MODEM);
 	if (ret)
 		goto err_table_exit;
 
diff --git a/drivers/net/ipa/ipa_smp2p.c b/drivers/net/ipa/ipa_smp2p.c
index 8c4497dfe5afd..831268551d9a7 100644
--- a/drivers/net/ipa/ipa_smp2p.c
+++ b/drivers/net/ipa/ipa_smp2p.c
@@ -220,10 +220,11 @@ static void ipa_smp2p_power_release(struct ipa *ipa)
 }
 
 /* Initialize the IPA SMP2P subsystem */
-int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
+int
+ipa_smp2p_init(struct ipa *ipa, struct platform_device *pdev, bool modem_init)
 {
 	struct qcom_smem_state *enabled_state;
-	struct device *dev = &ipa->pdev->dev;
+	struct device *dev = &pdev->dev;
 	struct qcom_smem_state *valid_state;
 	struct ipa_smp2p *smp2p;
 	u32 enabled_bit;
@@ -262,7 +263,7 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
 	/* We have enough information saved to handle notifications */
 	ipa->smp2p = smp2p;
 
-	ret = ipa_smp2p_irq_init(smp2p, smp2p->ipa->pdev, "ipa-clock-query",
+	ret = ipa_smp2p_irq_init(smp2p, pdev, "ipa-clock-query",
 				 ipa_smp2p_modem_clk_query_isr);
 	if (ret < 0)
 		goto err_null_smp2p;
@@ -274,8 +275,7 @@ int ipa_smp2p_init(struct ipa *ipa, bool modem_init)
 
 	if (modem_init) {
 		/* Result will be non-zero (negative for error) */
-		ret = ipa_smp2p_irq_init(smp2p, smp2p->ipa->pdev,
-					 "ipa-setup-ready",
+		ret = ipa_smp2p_irq_init(smp2p, pdev, "ipa-setup-ready",
 					 ipa_smp2p_modem_setup_ready_isr);
 		if (ret < 0)
 			goto err_notifier_unregister;
diff --git a/drivers/net/ipa/ipa_smp2p.h b/drivers/net/ipa/ipa_smp2p.h
index 9b969b03d1a4b..2a3d8eefb13bb 100644
--- a/drivers/net/ipa/ipa_smp2p.h
+++ b/drivers/net/ipa/ipa_smp2p.h
@@ -8,17 +8,20 @@
 
 #include <linux/types.h>
 
+struct platform_device;
+
 struct ipa;
 
 /**
  * ipa_smp2p_init() - Initialize the IPA SMP2P subsystem
  * @ipa:	IPA pointer
+ * @pdev:	Platform device pointer
  * @modem_init:	Whether the modem is responsible for GSI initialization
  *
  * Return:	0 if successful, or a negative error code
- *
  */
-int ipa_smp2p_init(struct ipa *ipa, bool modem_init);
+int ipa_smp2p_init(struct ipa *ipa, struct platform_device *pdev,
+		   bool modem_init);
 
 /**
  * ipa_smp2p_exit() - Inverse of ipa_smp2p_init()
-- 
2.40.1


