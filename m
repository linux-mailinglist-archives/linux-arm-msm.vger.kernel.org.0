Return-Path: <linux-arm-msm+bounces-24589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B99291B9ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 10:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7338F1F24543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 08:31:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C62B43AC0;
	Fri, 28 Jun 2024 08:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZcXtPW/2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B71422D9
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 08:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719563480; cv=none; b=KqQnLqfSdtTYLCbVsPMa1UWBTJNI1WQCTnt/qzLsFeS5HlZJXkbFyR3mj12EWaAPllxqM4BXZammYBxY5eG/saYwCHC3hTtHQJ57R/3XYZLdiHwIZcDYVOssL+OLpMQMl1/91b0dNklPGXl74x/hRFB/O88qE2e1fso5VQaRH9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719563480; c=relaxed/simple;
	bh=qrPmbzPc6thrcoALKqu5/RTyzon2Cv6tVnvT/bPg2MQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VXmbhZkrOqQFHNDgxSx5JBsM+afkpiyWC/5BNoqaryKWo+F7KSnDDNBKWEHk9ftUlHTjkGnd9mWq8nciLAwRKFgTNjWrPKYWQ/9XX7uRwMa66Df2M0YS/rpd21vFHBzghL4yS/t67F9K2Sz6D9Ayeaj+xdE+BqL4aE/Mq+YK1As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZcXtPW/2; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so3284051fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jun 2024 01:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719563476; x=1720168276; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yw0eZbsyLTkgcERd78HaWAv1qQu+UDNZrR+zNE4CJuE=;
        b=ZcXtPW/2puBMhEOGseqV+++Smg14GCSaHw451Ko18kvmZ6l+uEpFiBftrBr18RRhLB
         +/4z842/IxL6ivd18/5VpZQY/sBCEkDWmkE9aYlU+j+cXdE9bvpHvI9jsBCqnIgU+XVu
         il7cSV52Gx36Xx1kD0GQLXUZJ1MG3OnsVwDl9RzWRCU6F+ByBwBTQTCyrqLKcVveCzYm
         301r3M6KjXxoN4W/RR2GEeI0+/ZttQlDbKzy88OFhzM4PPoogDG4uJYK1mNtGQUgJ/I6
         kPbV5qCX5GTrQ8ngy+P1/AwSjU94FBkdq5rx4IgkA/24pSNoZbpDuqEAjWDpoBOctIhj
         LHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719563476; x=1720168276;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yw0eZbsyLTkgcERd78HaWAv1qQu+UDNZrR+zNE4CJuE=;
        b=NgPyGDR3EyrteK0RuSjx2l/skNBbCSsBJoAB0moNTOBg7+lOHDQxwKgrZjgMxXPxyF
         7BGKSrV8hZMEs7rr5XvVbiK41ywScVp4X6Becz5kZqPRPEDARcfUB9IYhimfmXR11Dhi
         IOrr01gWIH+IQj4fDDWS6iBB0QVYxukvnSLVGb/cbG19KcKYmSWl4LhXnz8IWWG1InHH
         daCEkMgMU0WSfTA418WAT77WDYarVevFf1QaK1aXq5pYLGstVt6M2/viRRRLOxszE4mi
         A3yghrFrTwrMZsIQ2dIAyn8DUt7T9JRlhPNLsuIjadAVPurRxMc1qqYOLxHHVQBjbzvB
         KFJg==
X-Forwarded-Encrypted: i=1; AJvYcCVDoQ6nlM1YwMJpPpJnuqaMYQcYL57kGeEXaditaNdbOt9cAzZ23WvyDvpeiCwi3bRtkc/gt6akir9MTPNpNuQ+2iuH70PWH22q1fe+SA==
X-Gm-Message-State: AOJu0Yyn0D10gyA28bgMQkId90xrQlUpsPt7SChDZx1/Yxm6XKYgyObl
	8CqRiNLBgR6zPQyoT5MYNJgheTlg+MPRdCKJPt5fkpdgrtJgREmGKQcryoUpLBg=
X-Google-Smtp-Source: AGHT+IEOpDmTUMd9T1aD3y3deOsD8U1CZqZy1tIh8+xDSlP0/UjZ7yj/m4ywU7C5CPZ6setS3NylKg==
X-Received: by 2002:a2e:9d8f:0:b0:2ec:3dd4:75f9 with SMTP id 38308e7fff4ca-2ec5936fa45mr103261411fa.35.1719563476230;
        Fri, 28 Jun 2024 01:31:16 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d90casm1521604f8f.32.2024.06.28.01.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:31:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Fri, 28 Jun 2024 11:31:01 +0300
Subject: [PATCH v2] dt-bindings: thermal: qcom-tsens: Document the X1E80100
 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240628-x1e80100-bindings-thermal-qcom-tsens-v2-1-4843d4c2ba24@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMR0fmYC/43NwQ6CMAzG8VchO1uzVQjoyfcwHMYo0AQ27QjBE
 N7dSeLdpJd/D99vU5GEKapbtimhhSMHnwJPmXKD9T0Bt6kVasx1gQiroUobraFh37LvI8wDyWR
 HeLkwwRzJR7AW2+aqXW7LXKWpp1DH68E86tQDxznI+1AX8/3+gPI/YDFgQHdFugqLC5n7yN5KO
 AfpVb3v+wfLGRXW2QAAAA==
To: Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1217; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=qrPmbzPc6thrcoALKqu5/RTyzon2Cv6tVnvT/bPg2MQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmfnTLGn/UF7opNHc1QGJsaA76e4ji5+Om1hc6i
 yiBvMZAh3WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZn50ywAKCRAbX0TJAJUV
 VutPD/9wLkhRMLmeqpjZHtFMN6UO+4KERYfHvYjy6/KbvCAy0fTdD3D5WPHAh7sFceYaFzFy8Cp
 ne9Zc9V3gNokItuKP9NHCa/Gh4XhQiHdgdLdyt5+eC382dptCDj1rlEh2V3dUkUpE8x+80FWWyY
 1R/068+oWA/RZm4MttN/LDzXz2Gm6fy4ato0/ghzTtNMVmj5to8J6asWxbCrEFEZOc4gAHfqrE8
 F+HRD1r3ipAqfnzF2WdGeT8t7VEy9a5CAtFm4FrBnKWofpHga882ME3mQLvpysQUHipZVtzFOAQ
 smx9Qkx/jm85g6GGsRXIQb6t6/O/f9tuSk6F69Dr0c2mp+SJ3FqSKpmjdA7M2XnB4pkm6YH5h+m
 4Yy2C7McHKoaUH2UJ0JUlXKHlxwnMfDsD5oAqavFYwtyiHxGCp4V/pAwdCWS7hN+Q7n4iPUVa4z
 NilM095wgMURXJ21QXvidPhU2H+DyNPVVVMf1XnMZg1z2YSYoJSSLPUslztMVJN+4dbKFVOo+qk
 saX0MgKD7TOyxeCVlE684JHHBIWFJ/ZxUFf0rm5AUvn3cWjhyPMUCLs298lNONCU8IIfxX8Lyjj
 9wu9Jb297Af2s0L6Nu+O1u2XBf9fz18pnjqUDBs7eC2yHL7oGbHTF0nt6tMAZAaJGyAuTceYjWW
 4Xl0tQKqoWV86cg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the Temperature Sensor (TSENS) on the X1E80100 Platform.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Just picked up Krzysztof's R-b tag
- Link to v1: https://lore.kernel.org/r/20240527-x1e80100-bindings-thermal-qcom-tsens-v1-1-0f50f58253e1@linaro.org
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 99d9c526c0b6..ac54ed604b74 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -67,6 +67,7 @@ properties:
               - qcom,sm8450-tsens
               - qcom,sm8550-tsens
               - qcom,sm8650-tsens
+              - qcom,x1e80100-tsens
           - const: qcom,tsens-v2
 
       - description: v2 of TSENS with combined interrupt

---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240522-x1e80100-bindings-thermal-qcom-tsens-aa2db90c4a74

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


