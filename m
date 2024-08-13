Return-Path: <linux-arm-msm+bounces-28396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA1195060E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 15:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C18D61F26C7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Aug 2024 13:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D2F419CD0C;
	Tue, 13 Aug 2024 13:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YmJiT4p9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56919B581
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 13:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723554606; cv=none; b=kyxp2bZdFESf46JxdM76lRLuGv5+CM9+9r9uJKeUib8q/9KR4jcKYhEketWh+VzJr8najqYBB+0tyCOiWFbKP10XLVhKHWb+H1z1RB5DMlsN+gXmZUqYmbwbeYa4fCUjzt70FRUBWip56/FqQYrQm0yktBsp8RdlJk6SylDlfNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723554606; c=relaxed/simple;
	bh=BwejMU6ZUIgz8lGX+Skc7VtQTPN1+y9vWUPFbkYCZ50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5ZX3HVCw5/rAHVFbN+SxJ5lDU06xlF2a+SDhI3AFFtCDK3AKss6A3eOuRGWGWbIKu6OSOaY9jnWk0O56zKU8/YoYytvgc09lZ0vixDoIBPgQUlZMepODXYyneT7iopeDziTle6x771Vmv8R2ocIYL8o3mu6mkmutfjuYhQlTlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YmJiT4p9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-367ab76d5e1so2486878f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Aug 2024 06:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723554602; x=1724159402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vYV2yBaiU1eNGbD5nUDJdPAfLsrnpN3FqBevnmPD6R8=;
        b=YmJiT4p9Sksy3//JzDs6wwKUuycBR+SK82sG0RfK2JmwVyF3EMZDzxUw7ZKOf4qJF4
         Ok/Dj04HCTkoZXT7j3v0aLE+5OQ8uvqYrO2Xg+rbkXkORQArOs8yDUEqB6oQ0PFB5gem
         v5AUCQeIZFZGTDY3Z7Spf8Oudo6ey0yX62nesqKv14nyUqNacyNi/cEKswntuzaxzzHB
         qV6FxugPS0mY67nkaMREXZ3wAslhRxniKttXmLFHiR7g0GRuiugA7iMaS3Di8doMPkyE
         gcdjeAiqhALhqY4GCm+gdqKmbkHoiRBuKvg5EF7yXiEIahjo005TAvKnkZJhoplbePoa
         JsKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723554602; x=1724159402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vYV2yBaiU1eNGbD5nUDJdPAfLsrnpN3FqBevnmPD6R8=;
        b=FIpKLJ1hTQda25K2QO8fIj/C908+sDKedXr7SgoCqZ0GVCGyrABGIwGYaNx1/Oc/bT
         cDHHZviSalgDJ7MCTvsfG8/zDYxxk+PxqC00mgNrIMkRGCv72EYceetT1K6NHYuCWS/i
         E6dLMUJI6WagfTTRx6XHDoEIDx5pxRXhp7uWcPpZ0CTYcdQRKVHqy1O7VUnhSe1bvnuF
         18cNApSgm6PYODC9J7bh3uqXi135LPgCOY8IQ89M0QdOrjKMwlWdYjpxJID2e7oBQljW
         C5Cv5D5BqGEKkX3B92n1M3AD7v5QICsGO0PJDuG/wW3/u0eow244wreAtSMltPt3VMrE
         ELqg==
X-Forwarded-Encrypted: i=1; AJvYcCU82eA8MvFdZrbo3OBj99vLgIxsfDsLAQEeAU3O3Vt9BYJI5CT7oHJsQf9VW2DVKNsmMkPqPypyzFG/We64@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4dHG/AsZz6Sb5SCvGPR7qUQ4uVJMt7iH6RVgRd65OHrv27pF
	TtGLbuhTLxQaSIl9S63tXj4mE/afbXBi1DsVTLs9RpcrI+wGoDU6gUwdclOy4MY=
X-Google-Smtp-Source: AGHT+IHEtXM/0I0GAyREg5EKER0DYF7+YSxuj3da4+f2SEaAk7GsANHFPwX5vhUb957YGIRTjSasUA==
X-Received: by 2002:a5d:6dca:0:b0:367:8aa2:d41f with SMTP id ffacd0b85a97d-3716cd32235mr2372644f8f.51.1723554602500;
        Tue, 13 Aug 2024 06:10:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c938280sm10305003f8f.36.2024.08.13.06.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 06:10:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 13 Aug 2024 15:09:47 +0200
Subject: [PATCH 1/6] soc: qcom: apr: simplify with scoped for each OF child
 loop
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240813-b4-cleanup-h-of-node-put-other-v1-1-cfb67323a95c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=BwejMU6ZUIgz8lGX+Skc7VtQTPN1+y9vWUPFbkYCZ50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmu1sf7WFjqKtqbnO/o4IKv/eNdOe1rxw8n+MXW
 V6xxEWEnqOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZrtbHwAKCRDBN2bmhouD
 11T1EACOn5uWT6CrmTfB2xyhTbC2MNwPQUICTvz64hAaEmeUl7lnqitjw4SEnJYJ7g5AMu7kt/e
 cNiVSP7xKl/6h5qbl0u1wdaQNPlhQ4ateDxP+X5SQBN5kSsuWcOzAENTBZupjo1cFhOYOa9X77A
 +8DMfXJZznJcMzWfKHVN/spGMyvGablCdileKkoJGtjYmhmWThN7D9z42+QB0du2e921go9fMzp
 Io/wsmtWzimOd4E08/JFiVoK9jeoKATne2GYbJTvyvSn/XKAt662X8UFSm9Q1Elna9HyeVZLk82
 TN9LoFNn1K/XG0+08mhyxuNTMFc+B2/8zt34OWIR0VOFSunlh4PIZzgP0WA+ChjHNc3gLSH7lGH
 O+pxC3ks4aUqOdmvt26XBse1wvzcLh6gx4vR0YJA/8oDETijzhBqtuvZqElb/GINXmYhLorCCQS
 4VySRPgKG2obt6y9zPps6U2ex5Z/5TrFFbmJSCM6fKZ631hyVczy76QG6nGkx7VtV3fZhbDe7/s
 Y8dEc5TCSMJd4W1DgezIzxeDiN8mF87zTJ0oj5uD6B0DIueTahdu2JlTCCxqow2FJim11nGrHS0
 rUmI4XjaXCPdZ4buW/dGENZF93AyP0GtONfuKIKUcMnCSNpB1IdvcAzQyfjBLEVTLfWO2sIJrps
 8S+vyqL5BNINP2w==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/soc/qcom/apr.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
index 4fbff3a890e2..a956c407ce03 100644
--- a/drivers/soc/qcom/apr.c
+++ b/drivers/soc/qcom/apr.c
@@ -485,11 +485,10 @@ static int of_apr_add_pd_lookups(struct device *dev)
 {
 	const char *service_name, *service_path;
 	struct packet_router *apr = dev_get_drvdata(dev);
-	struct device_node *node;
 	struct pdr_service *pds;
 	int ret;
 
-	for_each_child_of_node(dev->of_node, node) {
+	for_each_child_of_node_scoped(dev->of_node, node) {
 		ret = of_property_read_string_index(node, "qcom,protection-domain",
 						    0, &service_name);
 		if (ret < 0)
@@ -499,14 +498,12 @@ static int of_apr_add_pd_lookups(struct device *dev)
 						    1, &service_path);
 		if (ret < 0) {
 			dev_err(dev, "pdr service path missing: %d\n", ret);
-			of_node_put(node);
 			return ret;
 		}
 
 		pds = pdr_add_lookup(apr->pdr, service_name, service_path);
 		if (IS_ERR(pds) && PTR_ERR(pds) != -EALREADY) {
 			dev_err(dev, "pdr add lookup failed: %ld\n", PTR_ERR(pds));
-			of_node_put(node);
 			return PTR_ERR(pds);
 		}
 	}

-- 
2.43.0


