Return-Path: <linux-arm-msm+bounces-40202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBDB9E37AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 11:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E66B22853E5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 10:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1521B3954;
	Wed,  4 Dec 2024 10:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nmGxPKOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491851B3953
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Dec 2024 10:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733308495; cv=none; b=j41h8pxf6ptbOrjKOxSTHAgxGVKyrB7rq6DrHWX9/j9XSIZELmKISuQi7Y5iomf3cVyE4O4bzGZdgirvnRpojpmTdslpbrz6H2AMAV1ceinZWarTMeARiRDEPU9wo0SMJooaaFNrAQ5PjCVG/kcU7E4Bi+QKKXRo6bh2jv8NS0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733308495; c=relaxed/simple;
	bh=t/Xw+VoKf+YwKQU16zm0iPdxdX1/4JqsN9BzS5tjM1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CvNznottf4bvEBladRffR61ExtCUxDbgFc9b2UJr712vTp7Ska+4kksu9ZPL44MYjfRbHEAlEaviKW4knr8RU8fWSe+SuHVeyoQFj8oti1z+JD2+/oA/UWjWKm26bc3erP46lfoJTcWl2beJrfBXtOq3wXNDfQoiJl0kkPTvwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nmGxPKOK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-434a0fd9778so60788325e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2024 02:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733308491; x=1733913291; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uO3BvUgmsprpv1MY1OmfchYOeLaMigTJVr7dgM0b+Cc=;
        b=nmGxPKOKxbW9chmhT6sVgXgfVsWSMG6dxMcKbCpXfKdML3rfKae6baObjK2JchtWvj
         SSQ3zANlo04n3J9MTB6G5g0EVCiYC1H7onzUsQ5WW1wfk3Bpe7D4DNtZgiuBeyIAc5eP
         SrcEVVTDA7b8EXQG8j1WB+nQIE3q9MLXgQKIfOGnO3QQki5dNx3d4NX506VMrYeVQTJz
         nuGRrXtZc6XgL09H0VdfNm9EXnE3kobuJAJNy9BRy3w2oB4CCJd0tA1OZ9KS/NWVLLJO
         Y+QJ+eoOTLkSKPwJXlTkT3miYRfwI1S3Zu7cCbDgvxWhRV4ogjZut3TOqbaBgZQiVRQn
         5XSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733308491; x=1733913291;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uO3BvUgmsprpv1MY1OmfchYOeLaMigTJVr7dgM0b+Cc=;
        b=WWFMwP3B1ESWszEQiIRjIjEFYy1tVSSqqupd7YL7qrDZrd417WG44tl4PYV5t2YrwH
         fZtDO7aYnyS7jinnbW4VKfl61Gar72M0qpbDCDIF5rO5ViDewc+Q1J48szk8qGxYcDLt
         gzeukZMfxBSmu4i8fhnZflzOHU9+CGCVv4md9vDbVxHT9CJ/ZxPP8DWXNj72BPEHK3kP
         leUN6/69noSTLo0xJBbUs3f9M7hOLW8MBdHmH2BaV/zB7AjkCDBV4ZnvQqZPBBshm6lm
         PwSQg0IBAJOypGBmyFyXoYe5D7HdOA6x8S/un4IbuLLykVtyax0TOoVHzSJZ5sMJdGR7
         rC7A==
X-Gm-Message-State: AOJu0YyQn29fsLdtjvCM4xfs7RLxP/rq4bCXlw/hsHGmg7YSFN5R5ROF
	H8P5J8YEe4wlCSJ2uI7v4x6U6yJCynBVsm/EjzakpxWZP2dPiKQXQT98Zf2+K1w=
X-Gm-Gg: ASbGncttbkZWYBVeyZ0R22Uj2wCm7lwwu2yKAV2X8l7DVnPPPmt1ztp5qCSy+MU7lkX
	cWqeWchQqivwcIWh/FBVCQfbGATenmGAPMWhJA9frYgDySwxI5EzZcseJ1KWzjD/BR5lJBl60YA
	JvzV/f7Xj0CM45fwU5aG5EisJNckPVfm8fY/ox340+s8rVxDXUJf9nZ8R3DpteIjWF3Vg1FkjGO
	AxtYFvEx42Lg5cR56s5JiwPqPE+c6rvBjpXFqauOr3Tn3g8yHMSWwhyMMESbPMKhyNpzGk=
X-Google-Smtp-Source: AGHT+IGCG9hkg/1olMRRgCOtkZhmDQFMey8RvFnraLO4O8jzTjXEXdbntz2PRq+8ysC4kvSSIQEXFA==
X-Received: by 2002:a05:600c:138a:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-434d09b1831mr58071775e9.3.1733308491571;
        Wed, 04 Dec 2024 02:34:51 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bc7sm19667825e9.35.2024.12.04.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:34:51 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 04 Dec 2024 11:34:50 +0100
Subject: [PATCH] dt-bindings: phy: qcom,qmp-pcie: document the SM8350 two
 lanes PCIe PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-topic-misc-sm8350-pcie-bindings-fix-v1-1-e8eaff1699d7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEkwUGcC/x2NwQqDMBAFf0X23IUkpij9ldKDJhv7DsaQLSKI/
 27oceYwc5JKhSi9upOq7FBsuYF9dBS+U16EERuTM85bZzz/toLAKzSwrmP/NFwChGfkiLwoJxw
 82pgGsTKk6KmVSpWm/5f357puA2D6SXUAAAA=
X-Change-ID: 20241204-topic-misc-sm8350-pcie-bindings-fix-81df7e1e7fd4
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=t/Xw+VoKf+YwKQU16zm0iPdxdX1/4JqsN9BzS5tjM1A=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnUDBKbj69R83Pq7mINWmrvoOmOZOBsaCNuOITPDFW
 vSbgUneJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1AwSgAKCRB33NvayMhJ0aaDD/
 9irTaxNrpT+nFRsd2S2ZrL2hKXVzYAfGQNaEnqdOtxn0py8Lwq0fP2x04j3wsrg2HpVebHb2ZDliOK
 Go1KClVV8NfG14f7X3BJ7GgtFu4F+onImsx3gINcNaD3a0LUcRKA1Gg5Xs1BOwvwr/hkNQoRf0do8B
 nbTE5kezdyuRmWOEzHZfuExapAcV7TlzQ6axKvMouDlH0VtGQwCVE5Nlxrk5/TM8+6I3FSY01rRXva
 HT+PXxParFbv1fU0D7uO8/CZQ2yYHvULI9Glrwuo+0ITGDw852ba/uUvDf2W9t+YPaperunPchjNbb
 qxUpZXVMg8CkgUHvJICRJy1gZYBuUBq5zZksY49KlVJpZulxBZ1GH1OOXGPZ9Zk8iu7dDAwJI6M9aW
 fDRBOHs3rDm4UFhxg7Cas3RV+Nw+bB3UPnXa6Sab6qxjFDVVt4e5kaJV59LxYFXqUZBwr9R/AmKbZf
 oA02SqMHHL71tVDFhLJ/Z7Yfq5SlLIn1CLdxSS57hsYzlLBIkjtAkwa8Bx9hT+cJfIjtq4r/SmsukZ
 xSwEFhw/nrzGVMo9s8yLQ3l/QItgT6cNetdQk2DVKeGX6Tb58F+0XWqcrz7Li6xiWyMF+tCBRLs7q4
 YtNbpcCmVwyzaHJIBXhG5AfZQpWu7NKoTT9PxwLs5eQMsZ7fpMgGsH0H5LwA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Document the two lanes PCIe PHY found on SM8350 SoCs along the
already documented single lane PCIe PHY.

This fixes:
/soc@0/phy@1c0e000: failed to match any schema with compatible: ['qcom,sm8350-qmp-gen3x2-pcie-phy']

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 13fdf5f1bebae92b59f73a0cbe12eb4fb17379f9..14b689e717e6bc60a6f2abad1a7ee1e9be998f05 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -32,6 +32,7 @@ properties:
       - qcom,sm8250-qmp-gen3x2-pcie-phy
       - qcom,sm8250-qmp-modem-pcie-phy
       - qcom,sm8350-qmp-gen3x1-pcie-phy
+      - qcom,sm8350-qmp-gen3x2-pcie-phy
       - qcom,sm8450-qmp-gen3x1-pcie-phy
       - qcom,sm8450-qmp-gen4x2-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
@@ -149,6 +150,7 @@ allOf:
               - qcom,sm8250-qmp-gen3x2-pcie-phy
               - qcom,sm8250-qmp-modem-pcie-phy
               - qcom,sm8350-qmp-gen3x1-pcie-phy
+              - qcom,sm8350-qmp-gen3x2-pcie-phy
               - qcom,sm8450-qmp-gen3x1-pcie-phy
               - qcom,sm8450-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy

---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241204-topic-misc-sm8350-pcie-bindings-fix-81df7e1e7fd4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


