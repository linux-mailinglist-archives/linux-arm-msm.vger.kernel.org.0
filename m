Return-Path: <linux-arm-msm+bounces-28398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A389950613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 312FB2834E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 13:11:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3260919AD7B;
	Tue, 13 Aug 2024 13:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tIzO3voR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA6519D07C
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554613; cv=none; b=uoqUelm/4zHNo2TDBQ43VJ9ZArM+UIZwZkd4Q6aRD2ImqjlWDxwKT1lnw30c3jfTH3MVtghCHH9KpKMZy0lNEdOT70wR9pohhiHBOa7hmeOqTijLA0ZIno3X7HPs/wtYhN33nL9BmLqAFROYpy/vFlrCfA/erZKQEFU4BTh5AV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554613; c=relaxed/simple;
	bh=wSmKVeR5KDA8zEAvS740eQFFBkxeMJlrEwsk0nEhwQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VmPhojcQ41ONmlswIs6QpXwbLG2Q6uGJ4sa5Yuv5i8P6aEMdE5jBsvCAxpS2uVW2gtiT5nheqdZonVm+qVigiHiUJZUW2LEATAMdQ6ujhIqUzi6xcpTKomRVF9Qnx0wqwpwPpJht+cl2hRvxZOzbOyr8wW6nr6xFgPH9XG4cucQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tIzO3voR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3687f91af40so3351587f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 06:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554610; x=1724159410; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOfeSktxxxx+AVaDkIgX6QSMwS92sXS03dIKp1uUHmM=;
        b=tIzO3voRDZd5LGF+bMb0Y+StJAkLJOl3ufji7VCZvKo11EoNqhC6YgTabn5W2HAw3+
         IafD0AOZz1xbkvaPun5slYYlcMtGFLHiK2lI9ym8p3LFitPD+EYN4DymmOUFXnWOIVAt
         9rFBTu4pN7gamGdAUY1m5SFgMEiYdL38X7dh5M/qEtMS8FujmOtg9h/tHaA4yx+//2Kf
         IA6OEz8CzTWfZMeyPKyi+G+ZEApW9/1xa82ZKGExpXkOFnUdKXvAlAVZkUUcAY5UV6/A
         cfKG5ZrdsnZS4t3ws/2Waw7vwvoRnuB94tuGb0h04DVFQelqfMw8Vb4W0CuupN+HLd8m
         AkvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554610; x=1724159410;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zOfeSktxxxx+AVaDkIgX6QSMwS92sXS03dIKp1uUHmM=;
        b=tCSw4Yuy8lp3An2aCCB88DXpE65APjSzs3gNDY0hvt5A89B0RBzhU5MBdNsSJ8CVYw
         170nkol+topHWx4fA0co5PVUy1UpuoeKoSNnj3bIZcKwH7/6D2uEvmGCl0z4fqFw6v5R
         Oo3nO+21zPHuk/77Xi/GxSkPTzwgoB6QGyGoknFllfsKR1lAF4PrAEL6jpyUDW2LJW8e
         /hcyorYpzfOGkbd9el80GdM1hlpudQhBXdUqXT73qeufX6LX3AwWhniiIyd6IxK1OT3Y
         l+Z6wPOextfcmvwRKvTOqz5YA3dJNtcGLkRbDo+UKOWzlemL7x7fAHXRKhrJJqG1DjZr
         ZgnA==
X-Forwarded-Encrypted: i=1; AJvYcCU2nJ6671cNl3ubCf+gMJQh4VrdPbJMPzYE+ucgFgu1ry23nzEOOQtSVI/6qTNMla56UEQMRNdut/rLYloexeflvOMHCAxtmh+GWr9cDw==
X-Gm-Message-State: AOJu0YzBphpqISa5iI4S/cmrlNOweRWCuIfcRLlRIeJQniha+e7L/OPe
	pkOQehIu8EYaWDxZBIEWvtQ/9kNQFohh3L4wJO88bZPcJeIkjAIzotDM4RlYaIg=
X-Google-Smtp-Source: AGHT+IHyNEIn/w+Q3aUBV+ipIP0PES4tddwlwX5duA/1fo0cQCC6TltvLeRJDiS0zTmiMEeDz3hbag==
X-Received: by 2002:a5d:4ecd:0:b0:368:5b0c:7d34 with SMTP id ffacd0b85a97d-3716ccf1e7amr2493850f8f.22.1723554609762;
        Tue, 13 Aug 2024 06:10:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:49 +0200
Subject: [PATCH 3/6] soc: qcom: ice: use scoped device node handling to
 simplify error paths
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-b4-cleanup-h-of-node-put-other-v1-3-cfb67323a95c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=wSmKVeR5KDA8zEAvS740eQFFBkxeMJlrEwsk0nEhwQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sh5LeIoKQcZBpw8Q0T7w56JOH+NskEVH9ts
 H6E4FxaqEOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbIQAKCRDBN2bmhouD
 1+kuD/9Z/MncfojAYUJXJABsySNZGoAFTsvI5oTL/7lPqEhOofrokAIH8o9kLEi5k/uJ+XHxaeD
 HavJlDNe+CbSNA5hAFM9FDUqqK6X5JeYzasWTGirc6EwmKdPm285CAd2bXU5xOzsyWVYExOl3Y+
 nwf/ombpgpleqhr6pcLkryzJ3yo4qQDokdW8Rdq03PWVRDPwyyrRKfBaOs5evJWJBITJMkE5JAe
 okxPARs5T0b9/lB61sg6aamuwLZ7f1o/MTUjf7ErpLEQQPQ3wnEr5B17HvMMhU97azGI7lVQ4DU
 63f2I1gQyoiuQKOBisboJdn8Xx/9OGnpWxMwV3Ud28WlErdlklA9Iag0PG082BUr3kTl4y8qZBl
 3gEfXyA87EsahI8JkQ8NrTdxtHfQq4+d+8QBNm5vb8gb3n584yqeqWwtSRdoTSHFfONvXWKv4ef
 RgpkDi6VWMqi2Bf6Y3F2FSxKvAyeFRwSFXwwwHuBDZUSvJzaOOeuryL6JyFA+LT26GsThf1UlHc
 B4voocpWUdw3QQ5DK4EnL2bdUlgq2X4m6rJbb6O2MzTuH2p3CrgSpNQfGgrQhk7PtYwD51T3Nzi
 fYmX6sCsEXg7kJErv6O4RS8B/zcsv382ZGl5XFV1KDD2ASKX5t+f1WT5sgJywP3EHQ4iX94pp9W
 fGM/J+iufuJEQcw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/ice.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index fbab7fe5c652..50be7a9274a1 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/iopoll.h>
@@ -265,7 +266,6 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct qcom_ice *ice;
-	struct device_node *node;
 	struct resource *res;
 	void __iomem *base;
 
@@ -292,15 +292,15 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 	 * (legacy DT binding), then it must at least provide a phandle
 	 * to the ICE devicetree node, otherwise ICE is not supported.
 	 */
-	node = of_parse_phandle(dev->of_node, "qcom,ice", 0);
+	struct device_node *node __free(device_node) = of_parse_phandle(dev->of_node,
+									"qcom,ice", 0);
 	if (!node)
 		return NULL;
 
 	pdev = of_find_device_by_node(node);
 	if (!pdev) {
 		dev_err(dev, "Cannot find device node %s\n", node->name);
-		ice = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	ice = platform_get_drvdata(pdev);
@@ -308,8 +308,7 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		dev_err(dev, "Cannot get ice instance from %s\n",
 			dev_name(&pdev->dev));
 		platform_device_put(pdev);
-		ice = ERR_PTR(-EPROBE_DEFER);
-		goto out;
+		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	ice->link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
@@ -321,9 +320,6 @@ struct qcom_ice *of_qcom_ice_get(struct device *dev)
 		ice = ERR_PTR(-EINVAL);
 	}
 
-out:
-	of_node_put(node);
-
 	return ice;
 }
 EXPORT_SYMBOL_GPL(of_qcom_ice_get);

-- 
2.43.0


