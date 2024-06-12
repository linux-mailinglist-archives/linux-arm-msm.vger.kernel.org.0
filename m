Return-Path: <linux-arm-msm+bounces-22527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 853D2905E11
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 23:59:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABB171C21B7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 21:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765ED12C482;
	Wed, 12 Jun 2024 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V14YNsRF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E6D12B177
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 21:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718229523; cv=none; b=t/szsJi3VMzWzA4IF3vY8Ebr2avFBe0fie/V3xOwGlOx3dfQMB8KSsb4Ci0uwyll7sg2nK9WXDmB+P7M+GTFx83jd8++7XqQuP4h06E9jHCIF1cxsb9oifLzF8dOQL1so/yP4I+VXluCT1t20I5arrIsAEIL8vf6X8hJ38DzU2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718229523; c=relaxed/simple;
	bh=dewQTT7VtsB6AiWdb3w+F3Rcih68K1wl+x10KprNguw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GomEAHQUze7nXjfeW+qjwC/fOs/Mqvjlbn492XAkmIJiJBDfLhgT2wGV6k9ooD5Y1FvPqifqyBEE8UdjiaHjs66eFsyxwr1nVysAzDGlOYsjJJBfYGE58ZsNCLkAxEqJFpvrSAmdTKVOvP8QkFsaKIVj2Ag8KarfaUPNRnIjNvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V14YNsRF; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52ca0050771so49958e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 14:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718229520; x=1718834320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e01owKg7cFGrw4N9ZP4tdUedOQv9szY7glBVrayNPlA=;
        b=V14YNsRF2VdgxTuXfTDchocKrI9OLD32wKdEl/s1ITvYAxQjjCpaXRuowrwOZy3/Ag
         h8yBMRZA81J9S0xU9w8tghnLMbTetBf/o7iQY8H+3D6mVHq1OGuY8pJcpJsJgQe4oT1r
         tXSjPrW3YTPYFRqgLjiRQ15g/esSv0ylOM9+yGqd+AayZEVxgNHUF1BfrdD4CMh43+B9
         99lbPiTymNVK+6aY7Y6egts+obvA4yoVvRzPR8HeRwg0nUQmGWOKgLdGQUfU5Id+d1Fb
         MfeK0U74QWm0paVtTaERWJKGXg1opqdHZbkQHcTMifmzGSaujem7DOWNKsDonM3z8Wa9
         BdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718229520; x=1718834320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e01owKg7cFGrw4N9ZP4tdUedOQv9szY7glBVrayNPlA=;
        b=KFYz2rW3jInvSzymR5fKmfarx6pHYpmjjs2DQaGIizNCmtV6n7rRd5leTRjMbzduAf
         rpOGu2iwfwTOWwDjFvyZ/tZCfXYi83etNKpzr+E5Eal4ey1YjeNHJJv/ALRKU8qbkD1H
         f/xnEAkz4Dhkp6Uq0t7Ld687Vj47dnAS6idTqD3q8UUc207aRsjhsK+2+/S9hO+fOLGW
         UgquVYFWovEMwNOwYD8q7Lj0Mx0V1bZz6/kDSQSvzKASxDgTJJAiQrY+t/tkT5nT8e2/
         jl1VTV6d/pJg6Xz/yWOGN8ydvspizLI5Yjgb8P6sVha+SWPwC5ePnCjMkP7VqDWkYbRa
         sZaw==
X-Forwarded-Encrypted: i=1; AJvYcCU0HEJGb9pj7pNAMKBxz73CQ51d5ZPOfkWGlXDmsqU37ogrxIQFiDxj0Hk7ZwWTzZ+sqtEUD03ZZOec+VtnbvHq9Bwqr/z92Oq4YtFC8A==
X-Gm-Message-State: AOJu0YztaGw7Pgkd4jQFXHUKaMVJxpFwc7qTIGE8jFMcFXlgFuFqjsEe
	4MM9gHxm3raYMvhBfVJuDq0MtIwEbaR91aoPOa8tP8ImMwLpqUSr8fqNk2INgsY=
X-Google-Smtp-Source: AGHT+IHqcEhn8AmhjWaShREw92WHkxlScezF8WXic43vTdsJU4tHojLCMS9IY3HzIxBk72P64BTJXQ==
X-Received: by 2002:a2e:2281:0:b0:2ea:eac6:6872 with SMTP id 38308e7fff4ca-2ebfc815c37mr19862351fa.0.1718229519934;
        Wed, 12 Jun 2024 14:58:39 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05c179c5sm57011fa.67.2024.06.12.14.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 14:58:39 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Loic Poulain <loic.poulain@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: i2c: qcom-cci: Document sm8550 compatible
Date: Thu, 13 Jun 2024 00:58:32 +0300
Message-Id: <20240612215835.1149199-2-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
References: <20240612215835.1149199-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add sm8550 compatible consistent with CAMSS CCI interfaces, the list of
clocks is reduced by removing "slow_ahb_src" clock, which is derived
from "cpas_ahb" clock.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../devicetree/bindings/i2c/qcom,i2c-cci.yaml  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index daf4e71b8e7f..e5c4b20446b6 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -31,6 +31,7 @@ properties:
               - qcom,sm6350-cci
               - qcom,sm8250-cci
               - qcom,sm8450-cci
+              - qcom,sm8550-cci
           - const: qcom,msm8996-cci # CCI v2
 
   "#address-cells":
@@ -195,6 +196,23 @@ allOf:
             - const: cpas_ahb
             - const: cci
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sm8550-cci
+    then:
+      properties:
+        clocks:
+          minItems: 3
+          maxItems: 3
+        clock-names:
+          items:
+            - const: camnoc_axi
+            - const: cpas_ahb
+            - const: cci
+
 additionalProperties: false
 
 examples:
-- 
2.33.0


