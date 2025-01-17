Return-Path: <linux-arm-msm+bounces-45412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F589A15189
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 15:19:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C36C188BEAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 14:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A003C14883F;
	Fri, 17 Jan 2025 14:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RUMtBizF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD0F86333
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 14:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737123548; cv=none; b=oBrzHp5KlQ5MVfJFbb9QQpKFplgi1jIHVDHHlUX3N7eUkrwBDwkxN0RpNO+vgPHkxULWg7cLF8JNcp6YmQushxLANJ8QuZ+yTBGQxDoVQArayOmkZ0ISq8sNTUZNFNFtdqZm0Vqvc9cI+NrsQBgwcg0rt9NntxoczTjE64naV4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737123548; c=relaxed/simple;
	bh=GZ2r5p0dFfNcF1ZvOqiFJYmYWFEQPwiZzMJJY9diiqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQ3PPEm+jCDjX5qLIjPZ4m0U795kGipN474iFevQqXw07dlFHNPOo3SnSPG72Q5li2XHXHKY3oh6ofxkT55C+4ZjmwXG9j0WEcggtns0kKxmn+h/xL+4j4mZ3C3MSGCDFHhcaT+Am7HQvpFsTA3BdS7eIvis7rVh9om4SaPL6WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RUMtBizF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4361f65ca01so20877635e9.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 06:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737123544; x=1737728344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrQMwi+hF2C0bCOO/tTN4XbolEHkOKYGtBgFZ4HZCnE=;
        b=RUMtBizFVYX0qVr4FBO/0JwxgbuH49a0YsV1JJd5j9CQ29Lf7Rmmk7qaTi+lF+elXQ
         h2+FrVeeNJIffu4ZwhyO5Hox1KLKtaQRmlU0H74LwrMt3H9KBoOod4P5kuLXi3PxhKVB
         Rs/flOJ8kfJnuTXkXvdXBxFc60uztwrA6eXEVSWoqJdh5c9Dma62nhHpXJ1tjA15lqj4
         UXYtfWtTwgoNmNXj24As2pjtYccfOBw5nUooFpbTHpMxcBKWygyR66Ld8+au+LyH4grm
         lG1mm8Di+Ua108XhybY+rBWap5F3oHy5szKaUoix5k4ELR+SMTPNkh3yN8k7tL9LU+df
         wdfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737123544; x=1737728344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrQMwi+hF2C0bCOO/tTN4XbolEHkOKYGtBgFZ4HZCnE=;
        b=YGifEFbIYp6lG0mYm1jIJ67J43MUUXvFRT60Mp0GAwm2tPKbxIxkyo9eyR9nNwh8tZ
         NQnmztvqlY6TnutjB4kJi9gUElqlmd2qOJ+6iaGCYGWc46Mkl4OjirNX52Da5eRzpv2P
         iy0QYNnKCHAV4qCUvzTQl7VLFeyl8ItdAUhHeuB4t2rdZLC/tdgnAyH1enRI07UuIRl8
         5xhWrScq9942yk5QsgkYN5UROtZxKREz4AL6R5hpwSGqpJTfFNI4WQDCO+t83kbcp6l9
         GQ6c+EcJ9/ZiNkRYy30H+GBxJienHUSCkx6B4l1eP51GFvFyu+ZiWpNncEcudHrKirG6
         8Agg==
X-Gm-Message-State: AOJu0YzCXqHRMaw3g7antky/TikdblBozW6hJDZuWnKVdBkzUaKqUvSK
	cNK8uyDnD6zefpDz1HzX6s9+IBYgJIcjAmwUS7nhBpWn0l0+xxDG2HDVB5bI1eQ=
X-Gm-Gg: ASbGncssHIekbPY/9YwYUll2/qNiID8TpFEzOQUD+BtKAjLocaE/wwGdyEmM1qxoD08
	gHLdAuaUvOPPTtGbe8QPpLYV3S31DNNCYNvHU4sLTLut2JKGuGCANOLrju+hav+8ZlIEMqUyZuc
	9/znVDmKssp6uaYGCmUBhOm/AVVI231zwyNWnNYTGNxNVMV6fe178Wwk7RYsKNU+iluXr4/fKVL
	6z4QAIAPaBtiW1LnLNkxov9Dsh36iqVJNwXBxy5HJfZODAaNClHlWROu5z1OMhPUC96AzxtTnq6
	k/vgyD8lmmSOhZdsW2VKlcZksjKxl3/YckJT
X-Google-Smtp-Source: AGHT+IEfaWlQCEKKaatnAdlw13qgkLJVr8s+K3HBqqjRbB4QuuaaO9z/foSCuP32eVd4AGEznbyiWw==
X-Received: by 2002:a05:600c:ccc:b0:436:1bbe:f686 with SMTP id 5b1f17b1804b1-4389141c073mr23873315e9.21.1737123544308;
        Fri, 17 Jan 2025 06:19:04 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74995f6sm96764195e9.1.2025.01.17.06.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 06:19:03 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 17 Jan 2025 14:18:51 +0000
Subject: [PATCH v2 2/4] mmc: sdhci-msm: fix dev reference leaked through
 of_qcom_ice_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-qcom-ice-fix-dev-leak-v2-2-1ffa5b6884cb@linaro.org>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Eric Biggers <ebiggers@google.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 andre.draszik@linaro.org, peter.griffin@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Tudor Ambarus <tudor.ambarus@linaro.org>, 
 stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737123541; l=1054;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=GZ2r5p0dFfNcF1ZvOqiFJYmYWFEQPwiZzMJJY9diiqM=;
 b=45d3iiXT7ApSj86eCeo8o+vCQk8H9LTCNmewvtv437mzQ3nPnN5PwM2jJJAI++4mdsjm8dOa+
 C8c22bdPYz+B52Him4FeCPJNwliX9YaycwJvlhaqizsV5BZY8YMv59M
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The driver leaks the device reference taken with
of_find_device_by_node(). Fix the leak by using devm_of_qcom_ice_get().

Fixes: c7eed31e235c ("mmc: sdhci-msm: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/mmc/host/sdhci-msm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index 4610f067faca..559ea5af27f2 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1824,7 +1824,7 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	if (!(cqhci_readl(cq_host, CQHCI_CAP) & CQHCI_CAP_CS))
 		return 0;
 
-	ice = of_qcom_ice_get(dev);
+	ice = devm_of_qcom_ice_get(dev);
 	if (ice == ERR_PTR(-EOPNOTSUPP)) {
 		dev_warn(dev, "Disabling inline encryption support\n");
 		ice = NULL;

-- 
2.48.0.rc2.279.g1de40edade-goog


