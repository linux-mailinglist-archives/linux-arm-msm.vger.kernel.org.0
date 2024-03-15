Return-Path: <linux-arm-msm+bounces-14214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D60C87C8BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 07:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2036A282420
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 06:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4806F14AB0;
	Fri, 15 Mar 2024 06:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcumdBAX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C087914AA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Mar 2024 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710482853; cv=none; b=eJ4GMOIYdVaekjkZjrG8RNEpzuRJHO7+RQLbHamboIZqa1fugBeqscID/JIoIiyvptO7ZLlq3NygMXrlxGELIgPgg5XXEOJBOwP27lwzsqlCRuYdu+yovMf0+3Rw4T2Ec9EwDDqzx+uT4hs5HQEclX2yCJpwKnCxGNHy5ed/6lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710482853; c=relaxed/simple;
	bh=QbcBc4JXtP8FNrsiFhXtIJGTYDJA6oPqiQ8+qe0RZWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sapwZNkS4vNTG0UiFu1tdGIx/EVrPwcxW4xRNKTjt13YzF+WlbsxlKggT+2W4RmiM7aEfDdyKJ1gE19D2zMsjGi7dndUvoZ0LdULcLB+/dQJYXYNlYBKW/w7sJcpbl1NEB6jM7HQ1pgg+LiUqi3M4evBoYp44vOL3EDtI/RSY/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcumdBAX; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dc3b4b9b62so11789135ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 23:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710482851; x=1711087651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bURk46YiZRFAzwI3iGbvVt2z2P0j12npgAvS2/bABok=;
        b=kcumdBAXVMEzL3E601050uPR6yJJOGcscR29onNFO0BPz8mAHg9JIFOmW4MD1lyTkM
         VOElPlt/LUkuz3dkrwBrkZ7ylFnsxAvtKB27/EtA0JtnmnOGN9lFrXobt605JBXUcmhr
         m7slq94cN4xMr3jm8AZI0N1P1oh5il7FVRKUlTDZjY8647WHhAxAuLQXP7ZLatdRLquV
         479ejolLY67SN3trItWIz5saihRnxotYGsQqxMyXlJCKhMGo5rj6zA8cx1EVfOQc+jge
         OZVGGD63uZ91GceVLso0F/NXfIL94f5hJ6IsWJsCiaeYE6cgxJLQlKQB44KrwiSGeasx
         LJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710482851; x=1711087651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bURk46YiZRFAzwI3iGbvVt2z2P0j12npgAvS2/bABok=;
        b=YzYxZ4U8f0ou3QeYpTAkcSNnYCgSnbFv6Dlz6PGNU3DXWeB8aQ6+qvGuDkXzeGIRkO
         tPo0JddI8HPIxUnEL50itUtp4nDgcs/QcmiXPuenX8KwdqG7RcLm+ysoG6suE9z2yqPk
         YC/+3MtRI8k3t0kaIYrgbIq7zqCzKMyUO2fbCBXHlp9XF9PkNy2uLvpYsi9Igj1uqQah
         GAVupazcwZti8EjbCZv0HO9otqQCyakB5yF8wuj/56B+nw8x2Aje3L03lPdqQOy1ixwj
         mh9hfj5kUi1FozX8bfWQ3tnR6we4S9qHQ299cscykBpH6eYa038+yx6Ebb71M+sbKZ9m
         1q7A==
X-Gm-Message-State: AOJu0Yx5UZWlD1gP2dhbFjnIE1zFCIXIpHUOUFEDG9XU2m1maNW0yhxV
	JaOOxyHFQ7ZAcUJpXzU9rjYGbmjCZmvIT/rRXBuPNEkkVO/uFKrH6BpL89tLIHILsglAcbMniVj
	C
X-Google-Smtp-Source: AGHT+IEm3EmfV9isBbKMpEwODr5FLa9Dnuhgk8Uq2x3rU1u1qfup+Nm/Vo+JetWwc0EMG2u23zlWmQ==
X-Received: by 2002:a17:902:a518:b0:1dc:b323:6f97 with SMTP id s24-20020a170902a51800b001dcb3236f97mr9175623plq.27.1710482850735;
        Thu, 14 Mar 2024 23:07:30 -0700 (PDT)
Received: from sumit-X1.. ([223.178.212.73])
        by smtp.gmail.com with ESMTPSA id lf11-20020a170902fb4b00b001dccaafe249sm2852024plb.220.2024.03.14.23.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 23:07:30 -0700 (PDT)
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
	dmitry.baryshkov@linaro.org,
	laetitia.mariottini@se.com,
	pascal.eberhard@se.com,
	abdou.saker@se.com,
	jimmy.lalande@se.com,
	benjamin.missey@non.se.com,
	daniel.thompson@linaro.org,
	linux-kernel@vger.kernel.org,
	Sumit Garg <sumit.garg@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/3] dt-bindings: arm: qcom: Add Schneider Electric HMIBSC board
Date: Fri, 15 Mar 2024 11:37:06 +0530
Message-Id: <20240315060707.471248-3-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315060707.471248-1-sumit.garg@linaro.org>
References: <20240315060707.471248-1-sumit.garg@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the compatible for the Schneider Electric HMIBSC IIoT edge box
core board based on the Qualcomm APQ8016E SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


