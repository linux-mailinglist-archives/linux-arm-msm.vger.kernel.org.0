Return-Path: <linux-arm-msm+bounces-35131-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F26089A4FC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 18:27:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EB421F25B43
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Oct 2024 16:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57DF18E049;
	Sat, 19 Oct 2024 16:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lktGJLaT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D5418D623
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 16:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729355211; cv=none; b=GwqR5zHLbTrf2y3S2r2ZQWGoVdJ8bUZ1Bp7WsBd6sCnk9jHfJyI20vOzo/m0v+fgsBS2tAOs1Uu33Ii0RgKTPo6BkUdKY6ybPxU4qCEeGK9LYM2g5syke6Mkc7xS0ZMeVBbP5Sm1+yMTxPYcX7EGKMHHpUeJFaH3MI6i2f4K37o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729355211; c=relaxed/simple;
	bh=vgPnlY0IikzOPmVwLN9lODbxv/uthexJm6oKQROqQsA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=G5bM6EIqUnPlCj3tgqi4Tgfzi2AxQn49qFBX1mYWc2IciuMvg09F0HYewX7ysbWEQMOATurSWvBxtPLVHmS7fo8lYYLiEOM36r7KQsN7NFrljwtzZZo9/3tFM/b7LwHy45QdMwinnSBYbOB2Ja4V3k1PD6Jwr2lmsv36A15Fvqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lktGJLaT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f7606199so3531892e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Oct 2024 09:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729355207; x=1729960007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6cCac7YSvuyy4cYsSfeEzgyabQ2bwR3+mQWfBE8ctk=;
        b=lktGJLaTzWEhwuN9G58nJxgAjojgHrb3jiqYMgZ7CLOMaJ520vqfL8RKTPG/BFmcu8
         XujLIqrPp0uMJuYgRL8e2m8Y4kOjHeKebH1LP8CGJVKLrhz2a+blDYqn9NChN4pi40Y0
         S8wkZTAYAAApIYybgQ1G9zK+m5ofb0GVFGB/YHqx0mdhXsgsAJX3qh6NCXvMZg2itP5T
         +Yg/ndX/HwDofq6WLXXh1QJnuJS0j4qRHuDVs3TIL6ywEOM99OT/wTK28QkHyxZvzcDU
         l4NKW2JY0FmSquBneRfDRbPG3gl3qIMo+wHPTKeuRxwKdfAsrz4ghKu4LpUbtMUvOJvZ
         PHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729355207; x=1729960007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y6cCac7YSvuyy4cYsSfeEzgyabQ2bwR3+mQWfBE8ctk=;
        b=E+W5JgXYx0JVbamv7DN4RkwO2HyXobzaoADffIPwEOcSfe+NbSwfLEpwIpNfJ5Vb4e
         ygy9UTZx1AGoh3P33vda/i/7mNR743d1UffmT0GOko49f6NlciDKYYod2jiC9n/vifHs
         iuiPA4V2xtQNGfdQUBTHCZGnnGBm2eF2XMjMx8Q3Y4noNYsbs1p1NsCcAkrW0faPfVKV
         xUVVNVo6dCVwBsLg4WIuJ4TjK7vfO6wuHpSpBsh96DMk56adZBx1NLnKJBk2HM84kT6M
         EkS9a7oJfLtvsTqRkrhA/Nw45n1y+XyXtHTIA7Fg/0wEmm50WoDgdYo6SxqyaJERbaYp
         OiSQ==
X-Gm-Message-State: AOJu0Yy8YCq7/219yK5bGdX7PBYJ6yrXLCzJo5v1+DYYp1fxIv92/vs2
	Q+6wntm/NmBp4hHQNWCKQDmfpv/i/QF816MX8KEaMsojx+PotrpcTykfnxm6ypKyxSy/5Ml9Nwe
	eACk=
X-Google-Smtp-Source: AGHT+IGj06tp1NpXJ2lP04B1I/zlau7c3rADR7dqWsSS376r//UzXheRR/P9O/1v3DxV/tAu2lpFcA==
X-Received: by 2002:a05:6512:2399:b0:539:f7de:df6a with SMTP id 2adb3069b0e04-53a15459fc3mr3714161e87.52.1729355207477;
        Sat, 19 Oct 2024 09:26:47 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0c65sm576590e87.125.2024.10.19.09.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:26:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 19:26:41 +0300
Subject: [PATCH 1/2] dt-bindings: cache: qcom,llcc: document SAR2130P and
 SAR1130P
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-sar2130p-llcc-v1-1-4e09063d04f2@linaro.org>
References: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
In-Reply-To: <20241019-sar2130p-llcc-v1-0-4e09063d04f2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1998;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vgPnlY0IikzOPmVwLN9lODbxv/uthexJm6oKQROqQsA=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnE93BYjEY4XqP0KZVJzk6aH9hIVcXbCahGqDAh
 B0zQEHakcmJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxPdwQAKCRAU23LtvoBl
 uPKhEACTPrRR0EmeM/yHbf9uozCAROAKN9UvPcTfYhBE2yGpIkM8MJgZeUm9+sYv9+Wxo7BQwBE
 sHDIBTpgVEUEzRJi9VqAQLX5lWpNBIMGyRWann6Bjm4LvkisdG+V19zUEgVTDJyVaovDsvV6Hvf
 sVbpCxEtnbBQYZpiqSUuk777+njiOsGsraHmDisWUJ8c077YrULQIVLf0CntLk1D56+5BDmG1In
 lEOL8nm9q938e/tJRoVPs1OAfGMufwvDpInppcnkJJg2zCTddHiWdSXNsRXFMHmmSpc/6HigXf2
 tUuphQk0oK7T8azDgfjr6tHBo7yw4rtuGlQjohOqkSLPoCiRiQ0U/+9grPH8Ys8rRGxuzyqDIjc
 IN2MUTDe+Sy2cSotIa+y3JuRFE9AV34CuSaywvy/z/OCiZgkEIe6se5IUUMFFwXiQKD/kJoeR04
 z5VJTqsQQIj/S5AcOq1hAjurFzryhlPiCDyPsU3l+P6LONPOx+1VlgTywoLnndXjFuIb2g9ktAx
 MVAiTiP0D4tFQblyIO/D0pm7bsv2SQapy/eaDTzs0ISgWXXJWCF9Cn+ZYfa/2rs8ja1gyOqBttu
 E0mzg1CGBrLqRbIFB9jjBIZqdO7QNJ4/nN62wpiBRm+UMkFp4RUhNZJHnhYalNHC3mQfd9Rn5aA
 Cizq/ln6LFDjlog==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Describe the last level cache controller on the SAR2130P and SAR1130P
platforms. They have 2 banks and also a separate register set to control
scratchpad slice.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 68ea5f70b75f031cd8b23cf48d566c3a760dab77..2edacf28944c78b53b51744d787f5d529ad83f3c 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -22,6 +22,8 @@ properties:
     enum:
       - qcom,qdu1000-llcc
       - qcom,sa8775p-llcc
+      - qcom,sar1130p-llcc
+      - qcom,sar2130p-llcc
       - qcom,sc7180-llcc
       - qcom,sc7280-llcc
       - qcom,sc8180x-llcc
@@ -62,6 +64,32 @@ required:
   - reg-names
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sar1130p-llcc
+              - qcom,sar2130p-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC broadcast OR register region
+            - description: LLCC broadcast AND register region
+            - description: LLCC scratchpad broadcast OR register region
+            - description: LLCC scratchpad broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+            - const: llcc_scratchpad_broadcast_base
+            - const: llcc_scratchpad_broadcast_and_base
+
   - if:
       properties:
         compatible:

-- 
2.39.5


