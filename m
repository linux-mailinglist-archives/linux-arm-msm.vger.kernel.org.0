Return-Path: <linux-arm-msm+bounces-14001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7987887A79E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 13:31:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC5501C22481
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Mar 2024 12:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDFC42AB8;
	Wed, 13 Mar 2024 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HuPL7V28"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9F7A31
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 12:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710333049; cv=none; b=AICX7rD8m6xqCpUV53r3cZf9nGSgMxKQufiCXY4IqyBPHpu1+vp+CfIMKHNgvcNSrGMwiJnsYqkaYNdxE6dD2ifcG5VVrJkQpJxOrErwdOhLunonqDUlyWjni2+qVt0ysLBMJn/LMo4g4Y5ZUh8LGMN5vW7Z9jJ8Yn9ZuE/+j4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710333049; c=relaxed/simple;
	bh=ZAE+Yktw40BN4peAT1IoL6Hojxedr4pT0iCyAxCaaG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RMBkLoRUV4+BTuFFcXwGD1//8EzmdqZkM0bWt7We505Tvq8Pl9IFtlR2rfLih2Mo1ADmxdKmdCl7MJ9leLaPuOh6sOobuPC3nYxDVtwRWvPrYgTkfVsJGktu9iGX0Wc7WoLxQ2edCTSfcmpP5YXRa01EfK8+sEZS2Q511qCvQhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HuPL7V28; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6e6b6e000a4so528836b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 05:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710333047; x=1710937847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AomqpqdqnNJFFIX2Vi3Rj/WxWBB11Z7CxIS8lwHzLds=;
        b=HuPL7V289mVV9p8AXTEUQCRLnpvcFop62s3G9iUCHLp9xmf/+/qSyItd7F5gN4ZXqX
         RaXz7SJCqTP1Kq7K265iO60tq9maN8qLIgmomAK9mC17LlCiLf4SoF4yVjL/9Ksd+dir
         R712K8Spjq/NvDt+sinj/hm9haiv92yFc8bZ7uArClcMPx4yBZA1SkSsQ5WGpTaHNmFq
         oQvGh++cMbHkAc98ozmiOLWhZOxl9DtNvZuiMFu7z509ILsIM+DvQR7U6qCyNmIQy8hv
         UfkB9Y5DlO0H0q8Uik7xY23/HzDH5i8G49ZLqPnLTdDyA3rJOK1j22YPKHsSpyylsipx
         ySfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710333047; x=1710937847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AomqpqdqnNJFFIX2Vi3Rj/WxWBB11Z7CxIS8lwHzLds=;
        b=SbDW12WKkOda6G8eh6/eVWDS3ETdS1iQ7BGrzHvxp/y8oJWHyGsf2nIlzROu4n5+Lt
         a29mLUOnHjv3KHZtLPZ1iHn94Upv6UBws4ihADp6XZq6K9s1/pM1Joaab5hPsbpjz6Nc
         1u6zRHEb5zHN6xrEbf5Wzga+d14HBxgLvrL80eUMulLYxbT/+tRzMrxzIbUC2YzJjjXx
         QYzj+fiXaS8TdQi956in7cRL+OIfFiJPTsmP9Jd1ITZA6QHiNoHwJAkXInXcakJrN1U4
         0toeIWWCetpttZ2mdEyn6l1ob9S5flB8TsB454sJIhesidB306N016FMyAnc62GFXmG0
         J83w==
X-Gm-Message-State: AOJu0YxJeCa0LNpgdYgjFoQEii94g3oXR/AXIAm9RNX1dMf+g5RvVdC+
	htTZRHkQNQG/UBbQYvZG31WO1Mum4MmwLFA1mz9kPJO690DrzqCx4t8SCKXqfAX2Dzrt8w6w8FR
	f
X-Google-Smtp-Source: AGHT+IGWZhRmzmU0VFv7aV0OtvCCtFKX3l1UXFqb5z1fccxgBQaXfPwjjPbHkfoEcVCacXXIf2Uf4w==
X-Received: by 2002:a05:6a21:182:b0:1a1:8bd6:af65 with SMTP id le2-20020a056a21018200b001a18bd6af65mr3568045pzb.20.1710333047250;
        Wed, 13 Mar 2024 05:30:47 -0700 (PDT)
Received: from sumit-X1.. ([223.178.211.36])
        by smtp.gmail.com with ESMTPSA id z17-20020aa79911000000b006e6150a5392sm7797307pff.155.2024.03.13.05.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 05:30:46 -0700 (PDT)
From: Sumit Garg <sumit.garg@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konrad.dybcio@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	stephan@gerhold.net,
	caleb.connolly@linaro.org,
	neil.armstrong@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
Date: Wed, 13 Mar 2024 18:00:16 +0530
Message-Id: <20240313123017.362570-3-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313123017.362570-1-sumit.garg@linaro.org>
References: <20240313123017.362570-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Schneider Electric HMIBSC IIoT edge box
core board based on the Qualcomm APQ8016E SoC.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 1a5fb889a444..c8c91754fe04 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -137,6 +137,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8016-sbc
+              - schneider,apq8016-hmibsc
           - const: qcom,apq8016
 
       - items:
-- 
2.34.1


