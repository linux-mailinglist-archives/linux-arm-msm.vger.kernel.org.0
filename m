Return-Path: <linux-arm-msm+bounces-28433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07A950E48
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 23:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 202BBB223AD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 21:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C26F1A3BDF;
	Tue, 13 Aug 2024 21:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNq7vPR3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB121E86A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 21:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723583028; cv=none; b=hRWdAIjONPt6yyDlaIdmjrsOB3oVY4+T+GiPAnoc78KVPau1gQRleXTeKGFO6nrSaSwwWdyXOIYiAws+ZCVcVQbAdRIZ6wIEOfOcT4mdfLb60KL56xxGCH3GfxgL1TXjJyuuT+WkYRaE+AShRw8NOH3pEh7uoSUROMP7RCSMln8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723583028; c=relaxed/simple;
	bh=VOweK8PQ/gAkRKbFxvY7for42INZkO4QySgiYbu6c1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VzYGz4JIkTBkI3ebD2girGMlTW4W1s68tTwVG0eJNyDPDg0ZIhItt1sAODtT/Cdfq7NqaQtfY89uPjqW+qpR3v5ZKILOuy8UNqA4qlNQu0uBpfsepf6RtJKJiRGmhXuMgHJhMmcUyqPH7pqviz6anxQkhqM9PtFVVtZpy8QijzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNq7vPR3; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef243cc250so9154001fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 14:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723583025; x=1724187825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IM45oK3YCR2mok7TNdngSg3shVd3/oRyHb9pehRWI4s=;
        b=ZNq7vPR3tELOHZumQNSnKBox2/A+UMXDCEZpPMC0M1w+M40XvcGghMJwzcn3xzstsx
         tuny2rCagjoaNMtOcesQtynPZGPHNUjsvn5dV5DL2sV0qkMJESAzBmAQ9LHaHfYxuOrK
         RDbBvSdAKcxzrZs5vPnkVOBlI20Rj4yylIQkgBV/hvv23QMJiDxlZlWNP+b724IuxNbG
         aT4Ot8DjOlg/frW+nksbMKhpOTvV7ScbbjAR9nQPtIVy5kiuq7UwsHa4idMmn8woTvj6
         JQBA3kkFGh1IGdHc63KtP3f/GUZ9JFEXYustTULxZR0b/AiFT8TX7ke5m00dgzD69ocX
         zHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723583025; x=1724187825;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IM45oK3YCR2mok7TNdngSg3shVd3/oRyHb9pehRWI4s=;
        b=TP1p8pTtkuA7afdtgsAzOqhnlZajT5Ko1FmnD3NfaQPFQzFJXxWd6IY9xj9aKwEpCC
         BNsACnCjqEnQHEyadQ+aGoiDtWs9s62IPFSo7ybkW2t7N+qNHIzcPWzmQeGEoLBBNOJT
         0xs66661i1f3g8dWew6Sh+MjkWiOPi65/i+vjwDqXoYhpXbrEMZkYGiK+OSmu6Yvu6P1
         g+6BzoL2cArgrKoV8/0wfpTTXf+tHIb9dNDyGmBMWI82Eqj9DKIRy7Jmz6EskwfgIkrw
         3msYZ/SOgD5ylT0t63SRmPbapvdUYiBKI0l5czVCPhdkcDLZB1AuiM08SVQZcUOt6m06
         Ktww==
X-Forwarded-Encrypted: i=1; AJvYcCUBzoZBi/TjkpBPwfu9xb+PSvVrOVUxmX1yzkBATbGYHatMnb73VqB5ClEZ+XugmK+IWHGiHMWiyWnuqmiyQjORBWKDINSzBGNLDDsKyg==
X-Gm-Message-State: AOJu0Yydf2X6PuX5RVgyMyrodS8eleHTyyZ+G2OvodEL9C3pgAevjLJS
	P9+O7EKvxC7w6www4m4f9HI/bE2LxqzcYEiUcHopleS43p06ounkBEQ0KU8H4Gw=
X-Google-Smtp-Source: AGHT+IGAmUDDh+yjG4h6miHuvy01WxUdpMT89kii0BGWLUB9xEtioKPmQa16EznSRG4scGxABxLHnQ==
X-Received: by 2002:a05:6512:33ce:b0:52f:c0dd:d168 with SMTP id 2adb3069b0e04-532edbc8153mr218958e87.7.1723583025135;
        Tue, 13 Aug 2024 14:03:45 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53200f4217dsm1075060e87.269.2024.08.13.14.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 14:03:44 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Todor Tomov <todor.too@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] media: qcom: camss: fix error path on configuration of power domains
Date: Wed, 14 Aug 2024 00:03:42 +0300
Message-ID: <20240813210342.1765944-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a chance to meet runtime issues during configuration of CAMSS
power domains, because on the error path dev_pm_domain_detach() is
unexpectedly called with NULL or error pointer.

One of the simplest ways to reproduce the problem is to probe CAMSS
driver before registration of CAMSS power domains, for instance if
a platform CAMCC driver is simply not built.

Warning backtrace example:

    Unable to handle kernel NULL pointer dereference at virtual address 00000000000001a2

    <snip>

    pc : dev_pm_domain_detach+0x8/0x48
    lr : camss_probe+0x374/0x9c0

    <snip>

    Call trace:
     dev_pm_domain_detach+0x8/0x48
     platform_probe+0x70/0xf0
     really_probe+0xc4/0x2a8
     __driver_probe_device+0x80/0x140
     driver_probe_device+0x48/0x170
     __device_attach_driver+0xc0/0x148
     bus_for_each_drv+0x88/0xf0
     __device_attach+0xb0/0x1c0
     device_initial_probe+0x1c/0x30
     bus_probe_device+0xb4/0xc0
     deferred_probe_work_func+0x90/0xd0
     process_one_work+0x164/0x3e0
     worker_thread+0x310/0x420
     kthread+0x120/0x130
     ret_from_fork+0x10/0x20

Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain specifics into vfe.c")
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
The first version of the patch and discussion is found over here:

  https://lore.kernel.org/all/20240806221204.1560258-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added an encountered runtime warning to the commit message per ask from Bryan.

I tested this fix in both cases of set and unset "power-domain-names"
property in camss device tree node, and I didn't find any negative side
effects of the fix.

 drivers/media/platform/qcom/camss/camss.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 51b1d3550421..aa894be1461d 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2130,10 +2130,8 @@ static int camss_configure_pd(struct camss *camss)
 	if (camss->res->pd_name) {
 		camss->genpd = dev_pm_domain_attach_by_name(camss->dev,
 							    camss->res->pd_name);
-		if (IS_ERR(camss->genpd)) {
-			ret = PTR_ERR(camss->genpd);
-			goto fail_pm;
-		}
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
 
 	if (!camss->genpd) {
@@ -2143,14 +2141,13 @@ static int camss_configure_pd(struct camss *camss)
 		 */
 		camss->genpd = dev_pm_domain_attach_by_id(camss->dev,
 							  camss->genpd_num - 1);
+		if (IS_ERR(camss->genpd))
+			return PTR_ERR(camss->genpd);
 	}
-	if (IS_ERR_OR_NULL(camss->genpd)) {
-		if (!camss->genpd)
-			ret = -ENODEV;
-		else
-			ret = PTR_ERR(camss->genpd);
-		goto fail_pm;
-	}
+
+	if (!camss->genpd)
+		return -ENODEV;
+
 	camss->genpd_link = device_link_add(camss->dev, camss->genpd,
 					    DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
 					    DL_FLAG_RPM_ACTIVE);
-- 
2.45.2


