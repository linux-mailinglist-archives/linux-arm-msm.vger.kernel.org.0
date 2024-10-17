Return-Path: <linux-arm-msm+bounces-34806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1909A2BFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 326FC284C0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8691E0DF9;
	Thu, 17 Oct 2024 18:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UO8XiaA1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5908D1DDC30
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189056; cv=none; b=cALd8L42pDq+L8R5rHLzxyezc9GWCjWe1ida+Zpa77JoYA1r9pK1PlChuz/+e25Jox9cOYyX55p1L9KL2yvMx/JtHViIbdLCnMziwUBzVl3EHmfzRAcgc2KifmIOJOBGo8cgoxDA3EDSeMWodsTwXVXvDtT5JzS2oUaJhR/Hqwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189056; c=relaxed/simple;
	bh=Miucq8VLCWqiTzS4kJL67kqIiPf9VeXJfYu0JM/d1ew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Mb2y7HdKJrTVlLwPMrKzPpLC4p0COmM/cLeYYhh4Pr4MzKLA1olZK4KuE+dsUYiQxeCHcuDrfKmBtfH7sszqBT2R8sLw4IG8UbBIC5sBzJoBlCI2eWwjgj5Lws8w0iScaoYVfy5+EPKlQ6e1Poas9JPT0KOxCmfe/T6qLI/Q1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UO8XiaA1; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-539f8490856so1586239e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729189048; x=1729793848; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+qOsuwcgQSsJnPDkGK6d2ocwGrsRseQ/HXsMwhslTwI=;
        b=UO8XiaA17DS8ht885ukmECp84CIs8fy5U5uYzKT3aEaSmgilw7eljzhhsiiU8GnUMm
         c8AtYUPtl+ijKHexA7sZuvDvRZdg10fxc5TtY5cSF4DR/Kg/YImgK5EYLYPB8cVuYXkc
         gnx6ROh9EBRiIBum1gdkbwtP5AitXy4vpb4xTeMMcdgnBSQi68S+qp38xf8/X78ow2Pb
         9QLzxaMZKVXjKXAANdeKCKVOfCp3ko43iUXn8K1elscGTgYDQOJJ0QBV6XOtuTUbbFHB
         5fpNGODr0+KwLfom+O5lv7UdCczjZy4ZWG668yQpueb5Yp2Th3TQPfCgKmVv4Sg2Gig5
         D3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729189048; x=1729793848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qOsuwcgQSsJnPDkGK6d2ocwGrsRseQ/HXsMwhslTwI=;
        b=Ly3FA9fj/NaNQNUvICbq23xVQL4hckCPmkYOSWhUn64yvQ+06Bdmf8UpuACqJ6jgjn
         ImYUJNXSZ59WRAXkOcWp8y2caZ+DvGQtj2ZmoG1E1m31wx0WTo0xLb8RYDE4h7CF5Z9/
         i/faZhTTsPdxsU9RTsEzWxZ6RTwVPhckc1lB7qG0bLSi9Fmgtz61ZEJxjDPjMukBnDyk
         ZVyiRxwXBWfZyUXxveA+jg8Ugd79/B664YqqFSw6J/ik+CcxjFLT1b38VKwnmbF8zblC
         CtYiUAttb4RmkvLrLsI8cD2FKwRWf/qluxB1aTxO+CfnkhEDFVZ8QiwyMoHrIK3C9yHL
         tTKQ==
X-Gm-Message-State: AOJu0YxSm3fo/THupcACokAa7BscMSo5i+82271VIHGWwv1BymmcLXcv
	em50YFfG3pbDrQFHMl0UonhI4/g21jAf4mb4gEhyFCpaWGkm9uChLA/U6K9JPMc=
X-Google-Smtp-Source: AGHT+IGngDdh2FndVlF9fYJcoAFk/MLKuL3QYreIs2O0vvPF/2/s5eDBrnVQbJbZHR7ezleLOWFsGA==
X-Received: by 2002:a05:6512:4010:b0:539:f035:e158 with SMTP id 2adb3069b0e04-539f035e2abmr9828956e87.18.1729189048475;
        Thu, 17 Oct 2024 11:17:28 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa891csm833707e87.8.2024.10.17.11.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:17:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:17:23 +0300
Subject: [PATCH] dt-bindings: mailbox: qcom-ipcc: Add SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-mbox-v1-1-906aa78b1358@linaro.org>
X-B4-Tracking: v=1; b=H4sIALJUEWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0Nz3eLEIiNDY4MC3dyk/Apdw7Q0c6MUi9Qk02QLJaCegqLUtMwKsHn
 RsbW1ABMxtzhfAAAA
X-Change-ID: 20241017-sar2130p-mbox-1ff72d8eb5c8
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1034;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Miucq8VLCWqiTzS4kJL67kqIiPf9VeXJfYu0JM/d1ew=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEVS0NAo+ofnP4RS7+aq/4KtKq67A/OvX0qZm9
 +Ugcp7XliqJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFUtAAKCRAU23LtvoBl
 uO3pD/4nT370SLq9ydnyk1taz+2CJ8AiWaicbI6XGIfalgF41J9DBUr3iK61bkJ9/D1dD++fgsw
 RnC+pEHmnj1eLgK7OtvNG5OBdMPtxjf/sdZ00HblV5/ttp4i36YI7+DfYX75tXc/um8BLFOLt0q
 pQVh7bmOGLZXSZtnHBY5iCDMIy8QJNdD8vlolQ7wk78Z6bpGeOycZVRWoEN1xhdeO+huwHwCpgO
 KWM2z0PVAqZ8Bu7UxXYpJJV8v7oKxqNEATIntjqi9s3R5B+ug1pkymPBHorAb+gaoCrETbVV0ue
 S9eutegzXURqvNnOmnpfSVWs8pWwnwDuVIlzkcTt+675JRZzFjD2HCACOUXd7FW8W4hIqhfF84I
 Jof1wYIyY63TDUuLDyl1X8AMAndp7Gukjbg/GpskTUYeUEZpyXhCTrmp41L76JDZKNubd4qLVxa
 NGcEEOQf7/TQAi7YhrmUNF39pa+KThkBNIBwa+7xgSq8oWfp+MXk6v7U33aHS+l8kJxOVltawm2
 45lpT/ZeMSLyJIKQcyc8NHtwXMGJ38UGjdC4hfQJer6kFSwyquCRvndbNOTXOm7e9K4TD6yIvwa
 Qz4btsOEP8idakq2wCCyEOAtL0t3T3OCZ4H7jzBSqqVrdhZ3+MNL/CaZnTA1p1H1IBXv7/Ja28Z
 VwJVEWTTP7qXYVA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the IPCC mailbox controller on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 2d66770ed3612fd4bf9e28c334b273033e13684f..ecb4ec1e0a82856581f16391813b3c533c4f6f90 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -28,6 +28,7 @@ properties:
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc
           - qcom,sa8775p-ipcc
+          - qcom,sar2130p-ipcc
           - qcom,sc7280-ipcc
           - qcom,sc8280xp-ipcc
           - qcom,sdx75-ipcc

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-mbox-1ff72d8eb5c8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


