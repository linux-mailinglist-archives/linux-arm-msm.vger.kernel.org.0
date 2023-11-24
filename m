Return-Path: <linux-arm-msm+bounces-1802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 950407F6F52
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 10:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF45E1C20456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 09:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91B0D29D;
	Fri, 24 Nov 2023 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JHSYC1Gh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C12D7D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:20:52 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-332ca7f95e1so1092564f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Nov 2023 01:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700817651; x=1701422451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WxpSuXDoom2RWs6bn/SJPon0BVz9GrlE7SEKe7RDhZw=;
        b=JHSYC1GhDBEUCTORRk+gxm6FFYFAEFZq9KyxxJdpzwYUd8v+N1NfPGAhLBbJ9/OWe6
         yzHY6j/X1FYxqluwXHs6XEJ2Jm7JfTCZLchnHqk8zHXUgBhyCecJ380CNbw44NxdnuZI
         vPNc8S+1d0vi8QydBJ5lNnTuH7J0aQVPayVM9Xz5GerReiID6MeS7/Sq0Ukzbi+tam6I
         6VaDnd2AcsUXy9N6PsJoe/+euPrAK6VgtdzsD86uaaOfLuoAhzdUwIa2HV+Ocx5tWQI9
         YlMhUEeI2qMStb2Up4UiJsyH79pdx3dE8CcdEJ/4u5PxkWMfwW3cZV1MzQM4w45Jr+5D
         n4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700817651; x=1701422451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WxpSuXDoom2RWs6bn/SJPon0BVz9GrlE7SEKe7RDhZw=;
        b=QlCbDaEwzT3ibx2o3w7uFN2BWAETarLYTsm5OHcWsbaUYjya6PCWryN795EBXIuYUT
         OKMWPs2f6uyLOeK0QdKWRr8U0/Nt5J7eGvSjGYGp5SrF5nfenkvrMJXhA2trb/Wi1LKh
         ilFKkShiw6dElrc5TuC38DXmkL8hw6vpwtGM9pSbVXpMcG2S0ygKVVgVn8mXRGN/7CCa
         L12hugrgGz8tItvRXZrhvyGEb0SWbB8Kw0kkoF1kYtXiS7r7qdaRnTgmzjhZYJ881yh5
         OBJQtNNB9m5Fz4dD8xw4ljGiroeQVNkwcQ6juZzV34rlI37eqBBmVIxfvIPMRvdvjCON
         mD3Q==
X-Gm-Message-State: AOJu0YzjDFZPPyUCispNbAZ/zMRuuzxWigIf+/MVKqRpLCUGJWnt6Bvb
	GRr0gY8d3p2+AoboAuT5iKY/wA==
X-Google-Smtp-Source: AGHT+IFMP8BfZyXX2mht24DR3ovRL97JXamTDBqjV98urQ72jOk1rHbV+T/39Hoh2HfNfpwu3e5xXg==
X-Received: by 2002:a5d:58d3:0:b0:32d:89b5:7fd9 with SMTP id o19-20020a5d58d3000000b0032d89b57fd9mr1608129wrf.56.1700817650723;
        Fri, 24 Nov 2023 01:20:50 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id m23-20020a056000025700b00332ce0d7300sm3805755wrz.92.2023.11.24.01.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 01:20:50 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 10:20:38 +0100
Subject: [PATCH v4 1/8] dt-bindings: arm: qcom: document SM8650 and the
 reference boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231124-topic-sm8650-upstream-dt-v4-1-e402e73cc5f0@linaro.org>
References: <20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org>
In-Reply-To: <20231124-topic-sm8650-upstream-dt-v4-0-e402e73cc5f0@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UZ2eQGqqiWNvOpQYnbzT/mou5C8lbL9c01Zc1IvQLo0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGrtHhQ9naPVHKInEeE6SEnLpSLGWf6oYyKHBTz+
 YKxy2l6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBq7QAKCRB33NvayMhJ0SMBEA
 CX6qMZWSY+ttvQgILnvPJTQoQD+C4A0GfzQ6bUhUe0opoPVra5LJnLsPRa9DWyriy8FMqPtniGBRtd
 zvJ2AzHAanCgOrqD/iMycATSDdKCe4IjYqyZZkD78ynqvTtMwvvMZvih7Z9Ey3twkv9sh8P/5FCzvM
 J4z+2QuI/lERcc1fDtvv6yJ1+5O0VghULr3sK0tV8BRs6zyldAtLdpqcU6epuViLca+fvuCJmFckiE
 695GeIOxinqITFkzenKNnsap5pQZ0kj6+f3tKocUzi1cTxPhyo6KyJ/yVtEziB9bJYl1cGv+XpdP23
 rSq7IPMgdr1JVem3a+jVRzW/KvKZfey3UxrRqClJL25RDR81hHzV7jmuSPcACuksfI260ohEcqzzuQ
 70DkkEFq6U0+idkwRcr4Po3kqmAt/znWHR8YNUt/QkB/5G4c1/ICTHhaHixPBTH+91uyQgHCo1adDG
 8TUVVmnPuDOvSgt4axT56dX5yUZwHYDHquG/jiQiAiqW0uz5nnGZHe4HP4zBx5fdfazRBYQhqe7Leu
 MGW3KGmemnSoKAYSc+gPOfH50gGndqFIPieVZoO2vpYuGRZY6Ok3/IpljbJAnsMMDvlDFgAd8ui5MJ
 nUB7T7TMfw05djgIXXXhod1cTLbHokkU2wC9M2ameNEegPIaSnaQ8ocVadIQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the SM8650 SoC and based MTP (Mobile Test Platforms) and QRD
(Qualcomm Reference Device) boards.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 88b84035e7b1..c5b6518973d8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -87,6 +87,7 @@ description: |
         sm8350
         sm8450
         sm8550
+        sm8650
 
   The 'board' element must be one of the following strings:
 
@@ -1044,6 +1045,12 @@ properties:
               - qcom,sm8550-qrd
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - qcom,sm8650-mtp
+              - qcom,sm8650-qrd
+          - const: qcom,sm8650
+
   # Board compatibles go above
 
   qcom,msm-id:

-- 
2.34.1


