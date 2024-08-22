Return-Path: <linux-arm-msm+bounces-29289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE57595BC01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 18:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A08281D39
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4F9F1CDA17;
	Thu, 22 Aug 2024 16:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+n4D59I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299FB1CDA01
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 16:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724344431; cv=none; b=thNha5ybmrDIrmGCHz5NyHWqFKdTH05RZlyyQYVlUnGTzK+IkHfoeElxxiYHSKXcyXzC+FBt/djWFN9D34uKzoOO0ErI9GEkzui+cptq8+WrsMaEsxzUKvgq/BV2reCIFZexb/Yx+rAsFqnpV67zmtZTB3uKqA1nzFydNUw8QpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724344431; c=relaxed/simple;
	bh=naDm1RtTiN2zXIk2LJ0zsnhLTTN50E2lGQMRxqbBYAQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlAxcY64DbWFMEuZ4Tq1lOTMaFk4Oe9rEp94SJwbzHxxSRCsHbI0sCGmES3fR+98Js0v0pnEDEc965bGZvsa+JTYHEmdHOKfEBo27QbtExAr7+lAUmtTnXFW2F3bkgkJ6JXIlN2fX75kY+HwmsZ/3547gPgFAAwszRhDbeALKYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+n4D59I; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280921baa2so984365e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 09:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724344428; x=1724949228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YTFuV6stQx7CKFbcUpz4unCbxA3iNnf+lqvoGhhxAkM=;
        b=Y+n4D59I2HB+AV7hE/UHEWDaBT9lqkund6rGWosa3Bp2hO46mHtyUhBK/n8qahj/jJ
         m886iUhAS4IYH7b0CnEO/w9Yb8nVXHsId0c00Ipm9jb+Sp5IXcY/4prFWz46q4SC53Hi
         U49xaRGMARU27zQU4iqixAEyhrreAPP7v1jHA96tUzHDpLbBhRhEO4iaVF3Cav2ywI77
         85msSGArG0De5nBbixJP4v1ToKgcQOLzz1dprlCu9e2lnRHGdv6UXqSe6lyhJaPMeF9g
         1RdelEwOnx3uO0MG7IkwSHd0ISb8ppnekjBrVNw6ku1TIdSHFhDpXlcnEBcYj+muPgWe
         q/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724344428; x=1724949228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTFuV6stQx7CKFbcUpz4unCbxA3iNnf+lqvoGhhxAkM=;
        b=Datv56bb4cRkj4G8F4Ff3O0JAKScPQqm++1RYhvXv4bN/BzblmfLQy+ROSbwr51pfR
         SQM27z/GxM/DDhd7G2piY/2jzKDU2BkLjEMmmHleXKb3+HGQGnZyXb8yLncagl4nH7qj
         Thiv+4bB9v2L4psEPisAd5cUCQcJ+Wzyz65EtvLqAbTYpLueFRjxwvAqalRLwur9C/x+
         eSFDWBtutwmaMqohKX3LpbTiz15SehCpceRjDS5U4ffzf1IUz1Ea6ZODW0u/GFj5ucO/
         BDfAFEZ5xPTx0PzUCg3iLiK+7lE4HLBx7ZkUliplM3mU/xn4dhwXiA2yjNSDVXtvtEAm
         BAuw==
X-Forwarded-Encrypted: i=1; AJvYcCXLnt/Y18E3GcU349uq63s5BqaYbnHqvy7Qh0isKVKYrfuF3m9fWjHs76LzikmqR+RIZlTBHI+i5/1NQ/fd@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ8CLqxP4uI3n0j+ylH3Rp7v6oxdegYN818hPqm76bSwJyjbHj
	n5okxeON+jA6tL8jpkkdqNWpIuyQ8tLyCzyoZAB5ilqOukxF5BGs/GdMBJXHKus=
X-Google-Smtp-Source: AGHT+IGvJ/iD05Q3C/AsOQTJKor76DdYYeZaTHMvrsybklOWmJKd355kURal8Tjnr9MKo4Z1wI636Q==
X-Received: by 2002:a05:600c:3c85:b0:426:5dd5:f245 with SMTP id 5b1f17b1804b1-42abd231427mr29419205e9.2.1724344428442;
        Thu, 22 Aug 2024 09:33:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813cdcfsm2069377f8f.29.2024.08.22.09.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:33:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] soc: qcom: pmic_glink: fix scope of __pmic_glink_lock in pmic_glink_rpmsg_probe()
Date: Thu, 22 Aug 2024 18:33:44 +0200
Message-ID: <20240822163345.223787-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File-scope "__pmic_glink_lock" mutex protects the filke-scope
"__pmic_glink", thus reference to it should be obtained under the lock,
just like pmic_glink_rpmsg_remove() is doing.  Otherwise we have a race
during if PMIC GLINK device removal: the pmic_glink_rpmsg_probe()
function could store local reference before mutex in driver removal is
acquired.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/pmic_glink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 9606222993fd..452f30a9354d 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -217,10 +217,11 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
-	struct pmic_glink *pg = __pmic_glink;
+	struct pmic_glink *pg;
 	int ret = 0;
 
 	mutex_lock(&__pmic_glink_lock);
+	pg = __pmic_glink;
 	if (!pg) {
 		ret = dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 		goto out_unlock;
-- 
2.43.0


