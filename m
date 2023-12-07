Return-Path: <linux-arm-msm+bounces-3698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1312F808856
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 13:49:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97A89B21C0A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 12:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EBEB2908;
	Thu,  7 Dec 2023 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="veldLWTR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C136110D2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Dec 2023 04:49:18 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-54dccf89cfdso684956a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Dec 2023 04:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701953357; x=1702558157; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewcCC5I9quh+IScx7/WwbynVZPmtW1TJ0aMAySdLq98=;
        b=veldLWTRpL3w8RsQ1LnflRzCYDfBtWPwu3kD/xiyAOLaqM742Rrc/+5TYb5oUs35Q5
         QkejVnAUepE4UH/IKl+cF2iB+CHNXMZGsK59T7YBCuDp5tac4iZgkuxexsPJEphkpRk4
         pgAVRe2X3/hA8C0kHYIJA7rXQot3YLzKE+5CMmLyTCua2cBNkTHv/e9CnAMJ0SzTkxsg
         ibyujDsV4aIYbZQyWojM68LwFv4AXFUuTNSH6u2Sw0EjJuq1wHb+NqkyjDT1Jl4yDFGf
         e1ifGgR+deK/mgmSWpW0zgKhMsvxaeZiObyxDpgkyAtPWejbZG16V7NdM/fvkW0m+Eep
         j5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701953357; x=1702558157;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewcCC5I9quh+IScx7/WwbynVZPmtW1TJ0aMAySdLq98=;
        b=jGwlIFWrUFV7DuKjTzGcaKU1ZvvOSc4GEm1i4F8lcUkhl9vxjtzqO2aW36Cby4F75R
         Dr6HHQ1S7xmsyX3N+vm7dxxlfV5ycBfA3Vm7v/WJlDme4VF3CN5IKJnd0yaXQlTJ5VOu
         gFbl0eIAwxVHhymvkfxajQXuVJwYnQxHWzhXF+D7DT5A/fMpqQimp0DmMJgUwcZFkm0n
         DOLjkSrucPZ5qeSdaTot+RpUuWPLL0IQRBlICS+a4kGdA9QTzb8m6r/UmvXQslf90cIO
         3LtsOatWs9mE7SH3M9Cg3RWa4txMgY31TLOc3dBKyV7EiAnUYVmwT6aQLh0UyJWlbZpM
         HZng==
X-Gm-Message-State: AOJu0YxLx8BZecHeRxOD2dgskpjsJ2EJupiehpoLjQikHqE2ixOdE07a
	kz5o71LRhClsTAOo8oLfHm5wYQ==
X-Google-Smtp-Source: AGHT+IEIAxZFdmx/s3Jy2bRHV0dHvEoeKVHqKLkG1wyUTQE962o1Ihr+87Emnf0MK8GH2q3GIqxMlQ==
X-Received: by 2002:a50:a6d6:0:b0:54c:4837:9a9f with SMTP id f22-20020a50a6d6000000b0054c48379a9fmr1570716edc.70.1701953357235;
        Thu, 07 Dec 2023 04:49:17 -0800 (PST)
Received: from [127.0.1.1] ([82.79.186.233])
        by smtp.gmail.com with ESMTPSA id q30-20020a50cc9e000000b0054b1360dd03sm757834edi.58.2023.12.07.04.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 04:49:16 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 07 Dec 2023 14:49:10 +0200
Subject: [PATCH v2] dt-bindings: phy: qcom: snps-eusb2: Document the
 X1E80100 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231122-phy-qualcomm-eusb2-x1e80100-v2-1-3ba9a8e5ade4@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEW/cWUC/42OQQ6CMBBFr0K6dkynKKIr72FYtGWgTUqLrRAI4
 e5WTuDyvcV/f2OJoqXEHsXGIs022eAziFPBtJG+J7BtZia4KBGFgNGs8J6k02EYgKakBCxINUf
 OoaxaqaWqu/YqWF5QMhGoKL02ecNPzmU5RursciRfTWZj0yfE9Xgw48/+F5sROGji9ztihfXl9
 nTWyxjOIfas2ff9C9hQRw7cAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=4k813iq1YF243IH2N4xldDb319+rcBPdboFxnx//Dck=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlcb9H1sKM3NbYG3YUetp0CSTKK/tqkdsgIGZA0
 q9OCw7Lgd6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXG/RwAKCRAbX0TJAJUV
 VmFGD/sEeHJbe98utJbRyRmNIE2AUOhjEk1mo/7zwwHI1o6zZ/hpeQ7t6eGglJ7owBFZ57PW6xz
 epxya4cNRSaozzkZMX8+Q/LzDW4pB5Y/y7T/cbZ3JKQT4XN0ZKsZ9cwPXUXmWaWz0lVvC7ZLNTT
 BPrMqUrQeqsNKw03/0kQCgVGHtvnezYFkPw+gxFfzTuYSE8rn/wz+1sDCC8jUuwkqptdPGVp3l4
 ozDhIo0p4SOGP69sV5hBat071S213zdwvUe1sz/pC6HqF+Pu36AnfztThrkj5j8QwN2pIjfdmDp
 P3zwobXU9NKt+KTDkeaUwoksgEtFtXx5yFwBozSNoAReVlp09jv3sSPK/k/V0G1Ce5oUOl5qIk/
 5jU9rsQ6Z+Hz4sFI3gvhD8a6L/3k+JB90JgJgA4nra5KvoxVJsvC4wtXWtt+neAql6dVKYheEIJ
 Xi0KTafiX8jspGcS9BMt6HVgeVcJUkhYvLyo2bEo7bXMZbrEfkqf8H69GCfK87mKDAXW4Ad04f/
 83YiUUHJ59fxIF6Eju0RVg5/V+3a7LOIXIMvv8DpCkLLFVAwiFr91ywi+0a5Rc4AWni/VWxlTC3
 A1JWaCENNcL+mwJy3iPzIua3F5qMRDa3cBGIroZWc0wzywXwvbCeQxmO8xeonI8s4WqnvBz02pf
 eXfqXrybMFi+J5Q==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add the X1E80100 compatible to the list of supported PHYs.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- dropped the dedicated compatible from the driver (use fallback instead)
- documented the compatible as working with the sm8550 fallback one
- Link to v1: https://lore.kernel.org/r/20231122-phy-qualcomm-eusb2-x1e80100-v1-0-ce0991161847@linaro.org
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 8f5d7362046c..b82f7f5731ed 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,sdx75-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
+              - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy
       - const: qcom,sm8550-snps-eusb2-phy
 

---
base-commit: 629a3b49f3f957e975253c54846090b8d5ed2e9b
change-id: 20231122-phy-qualcomm-eusb2-x1e80100-36dacab8fd52

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


