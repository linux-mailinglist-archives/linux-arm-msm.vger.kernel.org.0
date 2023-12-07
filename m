Return-Path: <linux-arm-msm+bounces-3674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A9D8085CA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 11:53:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B11B2835A6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FC3A34186;
	Thu,  7 Dec 2023 10:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YRUjzAQm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02050D57
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 02:53:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b5155e154so9870435e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 02:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701946383; x=1702551183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCKGAHJfEaYYU45TomxL/sg269wwfTen9MuUFIzedOU=;
        b=YRUjzAQmOqMiZCgvS963MmpgPu89aus/EqKCZzeyz+9EOPq0fo+VdRu9A4HGuTrmHP
         Ir4zxrWUymOXjyzB1sd0lG4SGhz2073MZ+8pUcmR/KfG82vrvL5jBfsTRuzERYUnqMRs
         cLzS7OPdBTGeFQ7snhu0hLRIHQwIOeqIIYjg521LvEx0mGLANkLz+texvHkfWWwuoiVK
         El5C0dA/2fcHw9OHsYtjhVGbV1W1thkgDmPUUstvuuUWbYCORjGNaF4YdnpNtskCaRXM
         E5Vggkq1KGOTVVNSkiMVK2iQdJwOlo2mJo58ObmVREmaVaKibLnNLWfEoxOoUE2ifp08
         9B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701946383; x=1702551183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iCKGAHJfEaYYU45TomxL/sg269wwfTen9MuUFIzedOU=;
        b=VIEio7odSctSh0eRcWQZKK52TjkggI+uZl4d3qKrypG3qBZ5rhh3kVBT9xTLFMAfvd
         jNveJStLReqmsbRRhePdYskfNiudizqWO9SHo5BonQ5jsBpZxbsrMSW5d14o+ahW8yIi
         N2zPqh9oKKWDWVZhY5RR42UEXG5d4gFqV+U81Kkz2d3+mG2FZpjsLIVCoglnKwjz3wVX
         htMBZGdduatXzKkY65m8Bt4UjZx2IUQH3oCECM4a6H6e9KozgQKz1OkLSQ8nGxu3EFDW
         cJ/kaJkxTuEZGegXfZBM/AuYub38OY3biGH2s+zmtuKRGriXjxmd1ax226DduQhAz1Fn
         U5Nw==
X-Gm-Message-State: AOJu0YyzW9KnEYhiZco1gRRzOFy7OIX9ngylG2uVpbZuOb8A6pLjupW2
	fwDCTYAil1Gl8ydgVi0tupwHYQ==
X-Google-Smtp-Source: AGHT+IHzp202+dB3Xye4NGf/ePFvOipqgiwtZEl7DYCguexNEkmD96JHXS5H76xdHPO11V9lP4BIhA==
X-Received: by 2002:a05:600c:1992:b0:40b:5e21:bdd4 with SMTP id t18-20020a05600c199200b0040b5e21bdd4mr1259875wmq.99.1701946383387;
        Thu, 07 Dec 2023 02:53:03 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id k23-20020a1709063e1700b00a1db8b08610sm668700eji.148.2023.12.07.02.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 02:53:03 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 12:52:49 +0200
Subject: [PATCH v3 2/3] dt-bindings: phy: qcom-edp: Add X1E80100 PHY
 compatibles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-edp-x1e80100-v3-2-576fc4e9559d@linaro.org>
References: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
In-Reply-To: <20231122-phy-qualcomm-edp-x1e80100-v3-0-576fc4e9559d@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=n8ZqqMAvPtzdcc+WNuLj5kAU8rnzZCEsot/TFJ/D1xs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcaQIB3wgrkjQortdPRoUK1F4EBwZVv4pQXdlr
 f+C0XZ0PC+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXGkCAAKCRAbX0TJAJUV
 VpA3EACKl8OPg+nm1ZW8ePqjPuHN9iPzkp9ftIEgCULnE5jiNPXcYOShIVk3qQjpjJxAqsg5qhC
 sKsQf0Flrdv+ekTWnpf0drw6fhSwxoFq+/S/4JgcGjKW82SBSDDS+5TcwTLUennmVAEEgWOuG5y
 X4EzeSo/NkuS8wigyzYe5FWsSvvOQV/Ll5vgubC1g+V6Cdzmag7kKxS1OMVzZFh9ik+xbyb1P3j
 yghxsBadxT2ptRufZDursfZLgAqEQ3qI7yoJ0uRAV8V8TzXG4ZiJ0XZvnJnwtjW+WJNQypnOr/n
 om+M02nT8fJpMb1A2TEynbg6FIZajiwKqT/1JhfAWb4s1akMq9mFeqNgzdApn3vijHQVfRc2BVW
 ZahQgnNlieP3VJN1rIVhu9eDU5wY4wiwaWdit6jB9AHU4kculs9eDtx1v8bxMF8K+Sx3QbKBMuQ
 89Wb4M037BlNWfEbkeizZu4FOPLdQsFPy9MoErAj7uAJuEm465dxjD1RXUFaNsrNAtsK7BZ/iTf
 eFM6OOzBlMKpCnMlFVWzaY/aDKVtGzesUzEpl1JeMZ2tLgpy4sJQiy8zqQEuXoj4i6OBsckVVey
 g4yfFAMP91ShAw6uMxjLb3uMEmD/CfXAruDFmA6RIDGaf0s2RWyDJGQHEggnImHTlS8vlFd1u8I
 Kf9evD9WPZlo9IQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

The Qualcomm X1E80100 platform has multiple PHYs that can work in both
eDP or DP mode, add compatibles for these. New platforms can use the
phy-type property to specify which mode the PHY should be configured in.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 6566353f1a02..3341283577ce 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -21,6 +21,7 @@ properties:
       - qcom,sc8180x-edp-phy
       - qcom,sc8280xp-dp-phy
       - qcom,sc8280xp-edp-phy
+      - qcom,x1e80100-dp-phy
 
   reg:
     items:
@@ -59,6 +60,20 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,x1e80100-dp-phy
+    then:
+      properties:
+        phy-type:
+          description: DP (default) or eDP type
+          enum: [ 6, 13 ]
+          default: 6
+
 examples:
   - |
     phy@aec2a00 {

-- 
2.34.1


