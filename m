Return-Path: <linux-arm-msm+bounces-14365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B1187E663
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 10:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC8C4281817
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 09:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E840A35881;
	Mon, 18 Mar 2024 09:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ukzXxSW2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431843611D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710755520; cv=none; b=pYF0khLXEtfTdsXrzbK2eFi6nNXg9mVlq7FH41hC0/GCVXWuEnUVFOBnldEok9VHSNfjmSehlJhgCpCSq75eTwqxj8uP83cuEee61ZoaQ3j1TI+Achz1yab0pcMoubNnoXoc7LtioxHSJqXTuLaN/ax8oO51V1ONeskdhGezTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710755520; c=relaxed/simple;
	bh=NAPTtSll1XieWucrBskp4oBsh6P7ZqjYmxSviubfVZI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rvobzHyWZFAb9STtTvJ+/LhNoyjjsOJ54++7CuF3fAc7Jf6yLhFYpqPSoiUuV/qUcJDnEdVRkQFtv31z/vTQc3NGqhtAKDfv6jlVgKYZGGninv+l0gUQdyj3q24zRDaTesZcIRt56z1Zmod9fmYuVYPwubBmzwQS/6ot1q9Bv+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ukzXxSW2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33e162b1b71so3761925f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Mar 2024 02:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710755518; x=1711360318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MIVs14OsD+VApo/vkETOeSbK6jpJSlhojNnxWWFG6FI=;
        b=ukzXxSW2nGAfAXmr5KffYfQrxjdseT/sP3uSDdL4T7iMqOGsyNQTDJ3wZb3Jqk617P
         4eQx0DxZlrkMlY002ynMICVbZDibDYAZmhGFNZEmFKdbBkVgvvANmdyIlFuNyTElbbzV
         A/eZyxvpqjEuAqG9n7/8xv+hlE6JwxcYHdR2isipv4vXZYZ6TRdQX73rNCGyuxgg1ahf
         7W1fRWpRV8KNEupSjpzvOzN/ytqoykl1bZ17NwZI19H+gjuZCJN7HaQjqsiEgOyxUIjx
         mCYdiWuFfP1RtmBh/+tlktKb1AJmkEXaAB40o1BbDXYvqO0RpGd0MEEP1T2Yr/xIJ+83
         lGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710755518; x=1711360318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MIVs14OsD+VApo/vkETOeSbK6jpJSlhojNnxWWFG6FI=;
        b=MOQo3lKUxo7jQnaZXjKM6odL7vlEEKZk2b/fKNWO0EKRAr/4j6f3DO/BvpXt7LXhQ8
         l2SYdp6Au+4JCOdRFujEUEWyr9HEVnZ3cOK/jeTtn7BiiZT3JaYpsQvrg4KRVQYtN2IO
         WwY12Y/xK7RSaAbP+YOhlQY1GBkLmvb6hzOnMyuCP7Gi1AswL7y86jFTlkslDWDIVHp1
         +3m1TS3XAnaMKWKKD+o6aHR7pLCKFf+cQCT62FfIyP+wp/onZxyzZkuiOaJTdHU2vusk
         M8mHFN/a2y45YKpoVN4BrDEddo6q2LXfqT4eeQ9zuSKnJyLTz8nC/BbI+SpKsrBhcotC
         29+A==
X-Gm-Message-State: AOJu0YxjW6IKVUqJxPaUzfZtTmP0tRhPAv1LL/yX8jObnLmLK3fQrEH/
	DIRmxNcGAB972bHLMqobtHwXlmLcoQEouF4rPiG3iJVAtKIJOjRXkePPEcTMBH8=
X-Google-Smtp-Source: AGHT+IEUIHayg1b/NUZxVVlMf+QFaS7enKE0wEdrmsvNgwVDL+1S3zosP8hOtVU8a5VA9afzX28WPQ==
X-Received: by 2002:a05:6000:18a4:b0:341:73f6:2151 with SMTP id b4-20020a05600018a400b0034173f62151mr1643273wri.24.1710755517664;
        Mon, 18 Mar 2024 02:51:57 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id bq22-20020a5d5a16000000b0033ebf702e17sm7514974wrb.21.2024.03.18.02.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Mar 2024 02:51:57 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 18 Mar 2024 10:51:53 +0100
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom: Document the HDK8650 board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240318-topic-sm8650-upstream-hdk-v2-1-b63a5d45a784@linaro.org>
References: <20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org>
In-Reply-To: <20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=952;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NAPTtSll1XieWucrBskp4oBsh6P7ZqjYmxSviubfVZI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl+A66jVe1fbx2NXb4v5O2cKtk3aWOgquyZprOZHb3
 EEHvnQqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZfgOugAKCRB33NvayMhJ0YK7D/
 4qfhrYm4rdNpH2bKDQYjT9PWINLe4LoGboKmVvnvpuT5SMHm5ZKL/LU6sdh/FiejfbgNhestazEHL4
 JnW5Tk0nhU74g7CaYhTaWVlPxunAoqPZFwxUJ6NqqmMtRAmCBlrTZHDqpFKKXnAr6JKJ0jo61OFsC+
 WAEcQtKUuQrx0R9cLidpor2cpoib3hsd/qKQvxAZafxkU1/hG25Ug6BoGrCiALefVscmedmoqYpjZQ
 Kw5tSiYfIFinX3xQ5PLaBVi/JhzNCdXGZyrMT+EANfzhXec4QL4r0dDIFVghte2dr15fNQhSnVfS3e
 ueWOMBlPrhGGa7x619qz18ekQhDCaube2rZwvkKsmT6yLmLZQqWW5o/4mJfKCi5H5TIoczCT51b0r8
 69K4sXw/vLKrs/REBzvAnfMIGD3mPIgn5bS6/8/cTK+aIVchShlmFHBQL1SikLGY66vDCkJe1GzZUZ
 KFlUvj+ipeogDQYE4KAIJFnHFER5icFbK3jTJ+f25+XGKkogwBNrRUdfeVCtbHhRkKJbKawdPt+PHe
 yKDZGHL/C1ABanAEF++gABMZDN+hQbuxnwGIuHydPY+eT9nmPbbpXma3/e6ihjCdglh0LSWnzf0a2g
 Jt0fdnYbaogbaipeI4xJuGVKHL6UUvnvs+xXt2mrYscJOAgDctZHeqoKSJbg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the Qualcomm SM8650 based HDK (Hardware Development Kit)
embedded development platform designed by Qualcomm and sold by Lantronix [1].

[1] https://www.lantronix.com/products/snapdragon-8-gen-3-mobile-hardware-development-kit/

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 66beaac60e1d..fc0649da74b9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1007,6 +1007,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,sm8650-hdk
               - qcom,sm8650-mtp
               - qcom,sm8650-qrd
           - const: qcom,sm8650

-- 
2.34.1


