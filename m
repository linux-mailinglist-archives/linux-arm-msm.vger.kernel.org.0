Return-Path: <linux-arm-msm+bounces-28400-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2085C950617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44FFD1C23D87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 13:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94CC19D8A9;
	Tue, 13 Aug 2024 13:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V11m+ZDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E40E519D8B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554618; cv=none; b=lVzG0Tgg4kRycorUemvZVsBBI7N07Xn7muHYErthT2tHcq7e03uqOwMCN9fuhovJBc7Tjw+ILTP4tV03PcHnWETyaagLUUf9112DEU0TyK80rpfCu81Mh4BBFBYzLgw6453t45zc+uG4AnaLCgy4gJhPd27zqe1x7VrqFxnEsFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554618; c=relaxed/simple;
	bh=IxBzL8jZcrNuPWO/7D8XwVLbEykT+21gC+FbHu5yEzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dzw1OJsaqy11+JalFtgi9Ed+bjQJrlyRy6Iil47N5jY+XkbEvKD4tlCbcr6I2UH6knm2QBuW5s4JSLku/zRMvzHnRockztUvnkcDMa6jYwIwbbH763mNYxDHBelnQKI9q1cYESENHlFgGMJT1O+CQ36l2SEz5d0HyPYF0L9SfGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V11m+ZDP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-369cb9f086aso3248570f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 06:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554615; x=1724159415; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJOIZffdYgY6uiS66ZwE+qixLpFdnbV3QcaMFwjqIS8=;
        b=V11m+ZDPN7WTGjA8gG3UmTCLDbqIIvEszcP9tfaPTsCZKx5DgUyr9ZUdwsNkEzXt57
         Eley1DKdx98Lf8v8gj4kG/ZYWhYiOeaZD0X8gQ/Y7vC2CX/zTzL1xNNDyNF/uR+D/nV6
         MoCdkSIw4ETnb35x53/0Xs99grRlbfLX1RXGZyIOuOfrWM9DV0UaVuII5cMSXWgT7qX3
         aQ2yeHULSJ006w3zi4kl/X+u40RP+CzPHcVaYmREnGjPrvMVFc9617HW0yYQMTRMF0vc
         VgE+DAXS6kIKILqraskwmSyYJgXhxLzHkS2jOhmPIuvMidmRzhv1WrDMsf/Um6Sne+Uu
         IqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554615; x=1724159415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJOIZffdYgY6uiS66ZwE+qixLpFdnbV3QcaMFwjqIS8=;
        b=Q0VqAigaCh1V5eCY3kKvMBU968eHtZPp+EEjZNmdtamhsZ1/4EFvXc/b3I1ftq26DM
         NxDbbXPEuQnvTwCvMJQ6K05smCu60n/FgmNVcvTv4tLwaD5aYo1PhfAz2vZcrHd5/N58
         opse+K/LQyahIyScnWm60nQYgTvpE0BwjzmWq+I3v7bnZPTIcvbhldE7OM2TcS9ITvf3
         dNLibG221NYYL758oiTanw05gyD1B13hcYd7RTTe6WSBwXG0X5yFq32pDYjYoQ72NJAo
         FnXADdlt5UoTZPLa5oKnGPwnZ5R4fa/YYkJGKwrP2vE8QFIqBbN9r743LWulHuMutrGW
         QMGg==
X-Forwarded-Encrypted: i=1; AJvYcCXoo8Euk2DwqIPrFU+Z8cBh1QSXjpMJCrjDMA+bKqANjm4Y0MDyeBAdo+wjsUrI1/hEM0DePXtRVrWnTdBJFBWxde39wNFjzrPU6lZ5CA==
X-Gm-Message-State: AOJu0Yzc31B/1jybqtEMY9jhqHWcZPCyfeeXNxXq9lnKmbkKIzMyosaC
	yvQ3MjvvLyMirv4XwXiNnOP0+48gu/DEsvvipZhI1grTQ/iZxm7GVootMY4ex0llPtkGyGsNRb+
	6
X-Google-Smtp-Source: AGHT+IH2fWoDkGNXR0eRrjdb6m7GxMgF+j9Va9DvtxfYZzZLGqKP3dmGXHQVk6zw5owlp+AcpM80rQ==
X-Received: by 2002:a5d:5f55:0:b0:35f:cd7:5ba1 with SMTP id ffacd0b85a97d-3716cd45ff1mr2848538f8f.60.1723554615211;
        Tue, 13 Aug 2024 06:10:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:51 +0200
Subject: [PATCH 5/6] soc: qcom: pbs: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-b4-cleanup-h-of-node-put-other-v1-5-cfb67323a95c@linaro.org>
References: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
In-Reply-To: <20240813-b4-cleanup-h-of-node-put-other-v1-0-cfb67323a95c@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=IxBzL8jZcrNuPWO/7D8XwVLbEykT+21gC+FbHu5yEzg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sjtqc3LW0OQNAOtQMO9+aLWWp94JHd3wNgK
 r/V4thgZHyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIwAKCRDBN2bmhouD
 1xhVD/0RgrZURCzpXb3YXvnPk6hKrlLP06DLbvCh62dHZC7woXTSyVi7a8IL4ASirn+Sb2K3X9q
 d3xyu3wLmnNLwCMt8/oAbK8OCelqtGjohE/HWKV+4w2dpHLI+BfdBlv9dXG07iWeDFGImCtYJaf
 FHZQD21L1VuhPv53cz2rAnF0t1rsVh8Py6TNfOTQ4Xe3Ko9WCYtqS68W5hzuNHs+bnFrKgARQYa
 xzPw8NoDX2Z7iXZSGQ4iEhM9W/HLPAeAlGPNnaqLkucx+mp/uNWmCIouUYtZJdwn8+kjSvH+/iW
 xSEn7wI2yxrAj9PeGCxbz50rnvkuj5xcnRKF30sJSYhm+O9VVq8b4CffXZH6D2FFjYkJfLLxtXX
 hELXzZnEaihOvGuY6FkBLWg0bpVeec/vgG93UtmE1/yArs+kyqtaPAkrcYk6TnJDZswr/Nry7jN
 QVZ0sMCg+uP/BVPmokjBVl3wvRKuF1qJ8q1hsKs6yYPKI04ow/NnPPEMBgFqEU2NZWd0MNlu2vX
 8l1HxlV4MpRquSCvz5L7/VG35i1kIOimX8/tLkip0PAlD/pOBGZPtargXrpTgyhy2l9KcCqU+hG
 tF9B7iEHl8akSUQtX2rairPy+sOwumSqE+jvjj8y11gFz27qtrNI7vLXop7r2tNleIoDP1IgACA
 wfFtE7W6uRM0Oqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/qcom-pbs.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/qcom-pbs.c b/drivers/soc/qcom/qcom-pbs.c
index 6af49b5060e5..77a70d3d0d0b 100644
--- a/drivers/soc/qcom/qcom-pbs.c
+++ b/drivers/soc/qcom/qcom-pbs.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/module.h>
@@ -148,11 +149,11 @@ EXPORT_SYMBOL_GPL(qcom_pbs_trigger_event);
  */
 struct pbs_dev *get_pbs_client_device(struct device *dev)
 {
-	struct device_node *pbs_dev_node;
 	struct platform_device *pdev;
 	struct pbs_dev *pbs;
 
-	pbs_dev_node = of_parse_phandle(dev->of_node, "qcom,pbs", 0);
+	struct device_node *pbs_dev_node __free(device_node) = of_parse_phandle(dev->of_node,
+										"qcom,pbs", 0);
 	if (!pbs_dev_node) {
 		dev_err(dev, "Missing qcom,pbs property\n");
 		return ERR_PTR(-ENODEV);
@@ -161,28 +162,23 @@ struct pbs_dev *get_pbs_client_device(struct device *dev)
 	pdev = of_find_device_by_node(pbs_dev_node);
 	if (!pdev) {
 		dev_err(dev, "Unable to find PBS dev_node\n");
-		pbs = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	pbs = platform_get_drvdata(pdev);
 	if (!pbs) {
 		dev_err(dev, "Cannot get pbs instance from %s\n", dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		pbs = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	pbs->link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
 	if (!pbs->link) {
 		dev_err(&pdev->dev, "Failed to create device link to consumer %s\n", dev_name(dev));
 		platform_device_put(pdev);
-		pbs = ERR_PTR(-EINVAL);
-		goto out;
+		return ERR_PTR(-EINVAL);
 	}
 
-out:
-	of_node_put(pbs_dev_node);
 	return pbs;
 }
 EXPORT_SYMBOL_GPL(get_pbs_client_device);

-- 
2.43.0


