Return-Path: <linux-arm-msm+bounces-45285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 647DFA13CD7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 15:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FA563ACE2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 14:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A3B822B8D7;
	Thu, 16 Jan 2025 14:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klpmnC8R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED522B8DC
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 14:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038973; cv=none; b=NUxKlVxMKUBrVxlOmzo7BGhDNW1VNpYf6hCD2NaCO33c9PvvC6WiTDl/U6agJYGpR9ZqlXp5qUC5qRV+HyK4cut24XgG9y2MqQ2v1/crzlpzwBn5ik8j20HU0MsDVPx1ZiMifjbzET6Jdl6uTCUW1YRlt6OIRxEMRGqomc2v9OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038973; c=relaxed/simple;
	bh=mMqcSmFFvw2TkkbHF0Z/tBSpa/sSu9tnGHtQ8tATY60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cPR6UFi8uNwEy11E0VGUexYGZXFeoIPMdk0qmXSJlnfFuWkABHpF5CUTddnC3xzgx40nYwfGhKWzdsnfAb4BmMe6+lz23XzeMd4gevXySDnBnCB448QUFqMYiE2QuQKetLI3ppt8whqXEDzYFqeCS3+dQ4jz47bTQBJZMvMVc3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klpmnC8R; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38789e5b6a7so593779f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 06:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737038969; x=1737643769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3VDvVHb7Hz9aOiJJ+fFlf31oRvekJW72ufAgH10hVdw=;
        b=klpmnC8Rc29mih5tU+C64KE486W9gvyUUxMcSb97BRBkhino/vFeLzUI8xBK0L38PU
         rsDc0fEadxBOI8D7Lsi8p3zd7fGZ9LN7/zPnEXYFG80/3km/cFgrMoNWt4dcqTUoauLM
         fIt7I8wSz+iOMWpgpjGWqnBLUYpQ2gELlTV/rJaG9XNdx3hp8Zo1XHdK/E6RbcGimMsW
         fsNpZlE4YpPp89c8WycXOK7qeqeui/tGTxRT+5CqSwF6pnIcarc1gQ0+1Kg+OEJyQG2D
         WpbACsVqQz9XusnUwJDRTQAh1iqKXCKdhYvniLrFnLVD/ylonoTL90TX9hJJ4sbCZMte
         UWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038969; x=1737643769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3VDvVHb7Hz9aOiJJ+fFlf31oRvekJW72ufAgH10hVdw=;
        b=HAO74C39TeomC5SoGBZQ4KwWUMSMTSYeBipnZlWMqncFU7XEN37hiIs+AJM+kif7I3
         R4oHFu2g21eoG54nJuPZ9CUCJ/SUUY/v+V6wbJm0h53bBzDcr/CPUawO63KTEz7xugtP
         uCHYkM/hkOG80/J6mHVfSaIcY1cse9C84DAQ/Ns75Jgs0LBNNYCxf06w4Ny2U2H0VbaA
         fbDqruZl+e2oVKP8hvAo7fuEiyQcEI1Z5mGNDEmR17opNP7icNkL/QxrtUtLz09Vh9zs
         139wSmXxFZ1HsNNzNVp/NYZeTYE8ivE2bCBVNCIQazZJfnAcgpWjkq9kh6qVubZ3sNer
         ydZA==
X-Gm-Message-State: AOJu0YxT43g1T5c0Cg0exz8ZxKPYFwLCsbLmJx9j8oyKKgvSrbM4KOyI
	YcukpyNecbsLYDnh31qMHbxw4AFk3T3ZXUV1DXG9IftFITb4UU4zmRgZsUdISlw=
X-Gm-Gg: ASbGnctN/hpsgeTr2bS9ZpoQBsO7ha+Hlvg/MODm0e5VylXr18ABTXM0Fnf7GXFRFU1
	fuvy+m3wlrasjLi6R9v0NrpEvXCLyThvuzJRpCBr86x/o4s29kfySYdgjLf3ztWrXtCPAYXewKW
	ZgCEl6lU4HKE4dE8QAYNETVfN9qAaZWb4ezTH/CXw7IBcTHfmIGRTPfSNhpohqknRZ5UEwJLRH9
	NAMBbjmIXFMD/IjMp6gw6j9Hu9jLE4CnNhq2049gpZBOjHBNP/CgFZmedeNGuq7wK9Zb36bnGWN
	LnKDn+NE7rN94jJa7M6RIYoafGqQbKwQjHu4
X-Google-Smtp-Source: AGHT+IEYjm37I0xC5oyYW1bza4Imter6m0Ap3ye3A3KaXLIpUrnXkIdWfDmQraHXh7LXwIvTqWenkQ==
X-Received: by 2002:a05:6000:1862:b0:38a:41a3:218 with SMTP id ffacd0b85a97d-38a8733899emr28060936f8f.36.1737038968835;
        Thu, 16 Jan 2025 06:49:28 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321508esm70310f8f.10.2025.01.16.06.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:49:28 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 16 Jan 2025 14:49:07 +0000
Subject: [PATCH 3/4] scsi: ufs: qcom: fix dev reference leaked through
 of_qcom_ice_get
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-qcom-ice-fix-dev-leak-v1-3-84d937683790@linaro.org>
References: <20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org>
In-Reply-To: <20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org>
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
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737038965; l=881;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=mMqcSmFFvw2TkkbHF0Z/tBSpa/sSu9tnGHtQ8tATY60=;
 b=ckw/p8Yr8OAqf94ouXfHUwYbbzLskOGYomyFslWm+iFcOpDzJC0mlpKDWKk8wbQ91TJMNb+5E
 nC9f+glXfEdCGF3iseCm7YkfK5PJU3TI7PKc9l6rqwoy5fHLepwJFWH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The driver leaks the device reference taken with
of_find_device_by_node(). Fix the leak by using devm_of_qcom_ice_get().

Fixes: 56541c7c4468 ("scsi: ufs: ufs-qcom: Switch to the new ICE API")
Cc: stable@vger.kernel.org
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 23b9f6efa047..a455a95f65fc 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -125,7 +125,7 @@ static int ufs_qcom_ice_init(struct ufs_qcom_host *host)
 	int err;
 	int i;
 
-	ice = of_qcom_ice_get(dev);
+	ice = devm_of_qcom_ice_get(dev);
 	if (ice == ERR_PTR(-EOPNOTSUPP)) {
 		dev_warn(dev, "Disabling inline encryption support\n");
 		ice = NULL;

-- 
2.48.0.rc2.279.g1de40edade-goog


