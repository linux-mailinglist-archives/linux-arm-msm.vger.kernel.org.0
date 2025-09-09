Return-Path: <linux-arm-msm+bounces-72726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3288FB4A993
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 12:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791481893A98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 10:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B93131B833;
	Tue,  9 Sep 2025 10:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DyPKfPFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50731AF3B
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757412494; cv=none; b=OTV0O4Y0w3uMddceJx02h1SdET6lhfrKDxb1xy0/i/Mq4sCr/DaSyqmTLdXXTdXDtJOZCETR/PUxoN8g45SaKUl/trtWKeM+qCeVrIlbwWgQjz/zACmV4hvbMJNOsVfIR/EsOwJWYM2N3YSXck49kmYctF2MnSz2Lg4ByOcbiJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757412494; c=relaxed/simple;
	bh=ItF/HMZ6S5OBCHm6xKpPP46GBkD8+N8VkbEbVV8pWR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s1IxVfvKJ6X/pqwzqujcMtc/P/RGmNtHRQsHy1HQZlDbEw+beF+yk0NrQwdmTeqYMK7LpqBFZ3BDCfjT4Jhmwc8Cec2FuYhmFApK14Mh7AMnQ4RqU3XazDHbsg54/P185b2a8BBmLceBkZlrVIHxpJx0Gg1M1Q8uOdWhSi6t7tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DyPKfPFR; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6228de281baso5575986a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757412490; x=1758017290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8PKsA3hbcCLf8IUQFKdfKvwoyrjgr1CbYXvf90j8TE=;
        b=DyPKfPFR7CJHyoiKRVe1PMIb/sgVczCs2kWVDrCRrnIzszAVKCpNJPjyFPPHQtg1jC
         MWr19jrgKcIOXMl4HZrzfUtiN5/eISDK3oDoPf5XbbKQ8fwZyOs9vkN8PrKakWQ57cMt
         ytwGjf5cmeLgh2YvhBCAiofpKIYvqhKJKCB5wRCghJ5Sf8MWNOhUOITIMH6251RtJTNz
         I54J+Xy5wzg7wQ+74LOur9w6wqeGOLN58SObWE6+iLrGGVPqPmYESsjF29f9snz/wpmE
         mLcE6ON+jQshZphmpZWS436CcgGcgm2oYqmT0FBXj1Fba7BhIQ3oVhb1XmWPoNGGbCFo
         w6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757412490; x=1758017290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8PKsA3hbcCLf8IUQFKdfKvwoyrjgr1CbYXvf90j8TE=;
        b=mONqlfjr7vaH97qGipFms6J4MWqeggL90sLi3CFOZcwkeTGCTRzMnP+3WzK8vy2KBp
         mcMlEGRw5G/otLtXZTgxdEds6EfeWIRF9W7g5icgwrMHYIU0+uvL6QweJLej51MS/Xc9
         ea3NyfzM7KklTxEa8aWcrXgvcVUpee2zL8idrI9THf/1zZjYCGwFoqpckmNlVXvqMZU8
         rQNplWGAd0IscUOIPx36rtK7Wr7lASdon5nlqNiybvfilauS8ymwSHdDWxGb3u9M0Qwq
         NsgUI3Bdr3LTq0PmkOrwnhSTmWcFzW4Do/TNfJlallcRhf/LcjsxbDY0ZG8oSJ1SPbqD
         vW3w==
X-Forwarded-Encrypted: i=1; AJvYcCVqG0SfKoqYDa/3g4WkOvcdLnSvspqJSYCpAI919mmwXR+h8QWVkPVHnTZErJuSSK+8O9i8de5GAy01Lpmz@vger.kernel.org
X-Gm-Message-State: AOJu0YydScaw77iC7sK2Ymm3s56Ogrow0G4O3IxcAvozgrTcbUC6PQvK
	Rf9Gz5JHpHq8t7wEVcpRzIXj/0HnudQxhysjjA3hysdZDQ4pHDF/O2uxlsClKKpveK0=
X-Gm-Gg: ASbGncsgFVayRBWtfi9nx1Rp6JKsMi38cSZePR5cCIDnTqspyrwRL1XWXJ5ALtw8nav
	L/jxlTkc5BrVEfRagkFhKruYNoQa+SFrnyzrAmlvrgvHUq6HfJIXY7a7ZSkuLWnJC9CPCUwFTuF
	xNrsWqavswbU/mz5wAOogi+MuCAB67TZ+7MQPEFbQG/1JYoI4ku/+xTWSzL5CGc9trErkdIc0cV
	+fI+z8bekEjujfc1wBpgIJZgnW8ZzIBN8lrHNB84uu2/II4iKIxO/ZTDOZaw1QyIy4hw+n04+Gf
	HvWSx5QrvWQhRJ2C+hIkhfD2urGpAtLljehkdaw5uxmliDy+tXBVXdl3zxC6r+QQnW/slDJq9cL
	oJbuxX3vaBzaTV7UgpjXPrKBaegN3LvnUYQ==
X-Google-Smtp-Source: AGHT+IHWfA/NvJtv795An80ISNX/g4eyZP7imfZNeAj+7gmKXZ9qxdyvphhOFxdTr84Pm2VwUCUoaA==
X-Received: by 2002:a05:6402:2342:b0:61d:90d:1431 with SMTP id 4fb4d7f45d1cf-62373df67d8mr10477327a12.10.1757412489840;
        Tue, 09 Sep 2025 03:08:09 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c018f65afsm965379a12.41.2025.09.09.03.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:08:08 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 09 Sep 2025 13:07:26 +0300
Subject: [PATCH v2 1/3] dt-bindings: phy: Add DP PHY compatible for Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-phy-qcom-edp-add-glymur-support-v2-1-02553381e47d@linaro.org>
References: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
In-Reply-To: <20250909-phy-qcom-edp-add-glymur-support-v2-0-02553381e47d@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=976; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ItF/HMZ6S5OBCHm6xKpPP46GBkD8+N8VkbEbVV8pWR8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBov/yBnLAeC5QI5RadrWtDwrlJlInPJ8UyZpMNz
 G/9Tv00Q6GJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaL/8gQAKCRAbX0TJAJUV
 VoecEAC3pWIuV6FBpIuIUo6D1ojM+HtFHItx8awv4geaaiv2Zdp1AEJBVAujCULh0YMA8HFmx8l
 /eY6zzEEC7IdNQHeCf12zWHq7bmpaeoSvcYgvoH0wHiSXlWfGjtMKSvpOeZY8WpfBOqcVK8qxCm
 1jDmDE6PNx0Mh27L7Ilok9kAYhfOQgGJOAs1vjOdwbBGnJroyvcRUMc2jcVA5hKzJ88+8KDxMni
 UV9IIqmiepOMt2KqoBEwW9k/vXeuRbuhsQAE1Yh3Jdmxneg9l41zTmsQ+KibWFNQy8dWbdvgm9b
 0UC2TBx8MiZnP4LSJLHTR3QtycEoMNNjexv842gA3ZmTrgvo811T3kz9H9Hem49iN054a/XfGFg
 2nbd6SMtOtf25eMMbmOY1+zs1vYiDaRFtvgdk0nXD4DcNAlDfbfqZIloOJCsBuSJzw8GbPsN8LG
 s87m/FTHqFxqsZD+aFMw4nmpSM6mOSxbwKnPUEvDKqEfzEMUymD2Mg5Enc5Xarj1QtFlYl6IkVJ
 CvIsudaSY6iIEo1I/Hi/tXdFl6/IUu5wLbFn9VrN3bXbYlChToiG3FgInvX/tmf4J+SRANaOfEu
 WX9rHwC0C5QEOHj8L9b/gCEUaJOw9GGLHwDXwFk/tvN+lUKWWLWjJCsI0zDXByb/2swPqW7uKe/
 ammrGh7kjFoRxpA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the compatible for the Glymur platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index bfc4d75f50ff9e31981fe602478f28320545e52b..4a1daae3d8d47ca5f08d97a1864cfd615dcf108d 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,glymur-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -72,6 +73,7 @@ allOf:
       properties:
         compatible:
           enum:
+            - qcom,glymur-dp-phy
             - qcom,x1e80100-dp-phy
     then:
       properties:

-- 
2.45.2


