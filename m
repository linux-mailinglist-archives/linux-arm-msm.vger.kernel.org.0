Return-Path: <linux-arm-msm+bounces-37984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 451E89CDC12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 11:04:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8F86B22EB0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2024 10:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1EFE18D622;
	Fri, 15 Nov 2024 10:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eUJB2hv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1255018FC91
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731665073; cv=none; b=LYLAolH4ftgZjaEWphsE1wv8taPTx8fUc/8KnHlInC2Y7jqtVrvw3uHNGLpEohvDMKpdtJcnZ4ct7m8eenrMLtxKWJJV7fpJmrH+ZCcuKXbmqx01GkwLK4f9yoRR/Rf/KVzX9n/v9wNoqoacRvjmBHKuOlnuNDWPiTo8ZEXfieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731665073; c=relaxed/simple;
	bh=V7OjHDXduPJ1k17dV7XKfvV+68Kf1sn+6C1wsMF6nKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Ozru6DemQnDDlTSxVfmMIZNrY/QA9uMMMp+MF5mxhSEOkPlutMCFzoFep+wuxf4NK4jOZzVHn/ZwI9PNjwoZ2l1WgN7GseA3IV547wm1lRen/1ZZQvegVk+T+6m0sQoLPjSCOopKvPpVwuPSMhVrHN5GfHnVfFVgUACx6aq6Gpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eUJB2hv0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43168d9c6c9so13484565e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2024 02:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731665070; x=1732269870; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HZtHypG4dtIyAd0awYfpV/cf2LXkbm1jju9D2KQr+k=;
        b=eUJB2hv0nG3ull0XJXdGi0vuJAnutRgdl4Rn0SDIZBhO4DXz5zE2a/wb4vG5jzz6pp
         D5Mu2k8Pe2ofDhC6YT3I1PbywuQKPU3NEPeiY/t+GNF1tayN3K0p+MfOF0lNmqsezQkm
         LL18YfetsoIxwPlrsu/AiGWBN+Qw1MlJXD7nOwb8A+1GySOoKSnHst62EwnIMWT9z52o
         H2+EG8Zo40LMgf1eYrQxfxahFzOU8M1d2q7ifaKn7zMC0wVsNc7tFA0sm6rob3npSG57
         PhszWjDTsJLH9O0b9Cwt1oS/3OxlTfci8ySoUM/KL7E3SKF+7FfP3JZAzztmNPs0gJik
         +x+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731665070; x=1732269870;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+HZtHypG4dtIyAd0awYfpV/cf2LXkbm1jju9D2KQr+k=;
        b=U4W9f/4Zkdu9we4X00UexDkPQacpHRnHarRfVXP9fBRi0s/sIJoRxqggtt2kQYkzhn
         f1J8c6SOyD+dHBcvmK3z+iNj2N2DgWAV1sSBRqIBI56p8d5v6WoRmskwY2unp+WRMs/+
         oRLJku8XBUUbMdoLU16iwloadX9Z9CYpOe9KC4gf2YA5gqBOTeYl5O0MaoiQeX/JCPEv
         KjZlvdZ7r0rVA+X1aRr/vMkDQQ0goeR9b5Yax8cYlEe/3cpeVUNbRxMN0qsW9oayGPFs
         8BM62eN1GYwSS2rTYqWNfHKaVB5/b7O+/mCUr0NfZCL3ieR6nqlnJ5fbMzNPPxH+ag18
         Y1rg==
X-Gm-Message-State: AOJu0YxtHMMf/AWkr3VJYvhbwsznKS6B1+aCF/POUFnYgEW1NDgF09cm
	D3188zpzHyEfataK9iZ0HaixaTSHKukWriA+3rtUqL9Qkj0SiY5FDXZ2UxZfoao=
X-Google-Smtp-Source: AGHT+IEC59++7JJM9iFWS/bZ68uMemgAxKGO9+fnXE6iF79wjzsIZXmVKWTKIomMXhJVAAnsHFDkFw==
X-Received: by 2002:a05:600c:198c:b0:431:55bf:fe4 with SMTP id 5b1f17b1804b1-432df78a99emr14959395e9.24.1731665070461;
        Fri, 15 Nov 2024 02:04:30 -0800 (PST)
Received: from [127.0.1.1] ([212.114.21.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432da27fcb4sm53091855e9.23.2024.11.15.02.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 02:04:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 15 Nov 2024 11:04:26 +0100
Subject: [PATCH] dt-bindings: regulator: qcom-labibb-regulator: document
 the pmi8950 labibb regulator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-topic-sdm450-upstream-lab-ibb-bindings-v1-1-1f4bff4583b0@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKkcN2cC/x3NTQqDMBBA4avIrDtgUmN/riIuMslUB2oMGS0F8
 e4NXX6b9w5QLsIKz+aAwh9RWVOFuTQQZp8mRonVYFvbGWMcbmuWgBqXzrW4Z90K+wXfnlCIkCR
 FSZMi98Q3e/WPuwtQY7nwS77/0TCe5w8kinZeeAAAAA==
X-Change-ID: 20241115-topic-sdm450-upstream-lab-ibb-bindings-e6be723a985c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V7OjHDXduPJ1k17dV7XKfvV+68Kf1sn+6C1wsMF6nKk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnNxyrVP+q/xfpo+kJJQzVRFVXx3CUSS8jCENjE
 FOl/5dFzgKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzccqwAKCRB33NvayMhJ
 0YbsD/0dvDxmRKzufUNer9J+JXIMIxNhoyZTmqz5DDYVdAAYj0AUDmHG5ZAoFOPEEtIUI3wtlHQ
 FzICvE0Dx7xYHTOO1ahY00CXEuvGJX9Y9T71R0ch9TFTEvvVjzdrRHHktbIE5OBCYFqq3ZroBcU
 i03DezmN0E7XHk2RFVthnsyuqu8klUV3mFkZ8RVBWxCsQjBEz8Tl4PQ76crCDXfxuJWbWtVeEHt
 UuTDxPBRov5aXyixbDyDUVc50VwUVSTz4rX0uo+wOEai7XnzX3M7cAemaL38Z9Hp0s35zZnWZtf
 uoLiLVb+Y7+pahJh4FloAojXA+V3FRa0sZrPxNyk/y5WEZPeFI1SaBCYZy/cpehQliEf3JDTeid
 HLStILq1zZOXzSNOkKQo0oWOsIhmCHo72Ur+kKnFrQOfX9yYDC7eaw8Xqc8450poH1xjNELOnoA
 dgOj/YZOzSHuEydixdGPwQsIZ/2mOWMPL/e14NNGllLa4nzCDhJEBf0g7h3YBbf28jOrCNd9k52
 kzzzNdb8Nsj6HdWI5eRZNR0qkxScbJ09aAX7yuLcrEP2Johx3hk9ClB0QUwDrUHUfooqiEvZ+or
 ttaqXdqmnGh2N/xdwJ1amTsh7NyBWDwYgUHEd0z5iggmsb4MTQeZTjXEpuWSODjNc/LhVmlaGFG
 +YcBCxcF3B5JQ1A==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the pmi8950 labibb regulator with the pmi8998 compatible
as fallback since they share the same hardware settings.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../devicetree/bindings/regulator/qcom-labibb-regulator.yaml       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
index e987c39b223e753e20dfa1b60dd680fe0fbf028c..83965076d6ab1ff05dac107a1cfd88d3807bd606 100644
--- a/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom-labibb-regulator.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,pmi8998-lab-ibb
+    oneOf:
+      - const: qcom,pmi8998-lab-ibb
+      - items:
+          - enum:
+              - qcom,pmi8950-lab-ibb
+          - const: qcom,pmi8998-lab-ibb
 
   lab:
     type: object

---
base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
change-id: 20241115-topic-sdm450-upstream-lab-ibb-bindings-e6be723a985c

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


