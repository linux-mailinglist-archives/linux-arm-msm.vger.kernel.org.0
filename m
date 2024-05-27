Return-Path: <linux-arm-msm+bounces-20530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0688CF994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 08:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C53D31F2141B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 May 2024 06:53:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91DF17BBE;
	Mon, 27 May 2024 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X+p19uTt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228204C8B
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 06:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716792782; cv=none; b=ODl7uzHJowtxnvvr8JT6Yusgg17b4UIHbD4yEBAIQPDJHiqFzJu6n9po3B/KiYNZdm6NaFoZp3CRMEVRP5D9p05WJYuQDRq1ggmvvFSjVJH15uQy3+9918+OeORXihO1EW6/yR9EmRB9GEr0DFyzu+jJ+MZdlVjuBdN2dmZPpMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716792782; c=relaxed/simple;
	bh=LQt9dThnSzo/E4SnKuEuBz+EbP/P0jrW+Y4I8XPbjzg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=niKXuAaACRZFvx5y/t+ewfBCW2uuUqUod4BifQK3LNEEuASUxBFedK601QCd7dYn/pPP5nbaWfik1m6lcFtbEgbnPmBE2voNIQ8PJ4HJqE14USivUye6bnbDaBQQJkrb70EZ3hPYXVRLloCEfLiaxSZYI2OXsUzSTCRAE5Kwdik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X+p19uTt; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57863a8f4b2so2370286a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 May 2024 23:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716792778; x=1717397578; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Is1GYzjcsTC+5qtL51hTLZtB96PeUDAxukDQor2tqyA=;
        b=X+p19uTt650EPosEfqgIsNiv+75tr3rIsCjWlwGF5K8a+PlIVtZQOsqyMuh7lC+6Ye
         bwIk0tfEiByA1/HGWInBavKtXsZjZQmDMEPwTdNAHz6FXJ5SdJLQT/MeRaqwsATJb2Ez
         KtYg3XGfmGGS3mUwM1cmXFheTRQ21E/Y6YizVT7/eMLgZu5jeEwRi6Rso6DnfuDuDuOA
         xqMI6YD1qpeaxJvYTeKaPZnHOOY9BydnpexQydNE0wyf918RPb1aw7aaBtnSUqopj9/D
         2U5FbjqJB2Pp3VLYt+iPHjZR7gKLeNyg9orQqOpLmvsIBknILoFHuvXSfIQ7d1ZzrAli
         XYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716792778; x=1717397578;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Is1GYzjcsTC+5qtL51hTLZtB96PeUDAxukDQor2tqyA=;
        b=Va7zPwNMoG5FEyG9f4yLvLeadnExukqX0R/DTSKx8yPOZL1saXflV6VcYaP2VdARzB
         ky83FuBr/PLN0ap6Yieoc1i+1rujjsFF3/oyUDF6Xd9PCiFgYgqNaVxrF5hu5+eL5xaR
         tYjJtSQAtJw8aq0Y8F8qX0HpWkVR1grKP2Q3AQWvHRq+Rr1M6RhG0y+J++2862EmfUmh
         I9EinPN6lqtmWG4XCsygAQYPAVKHo3MwI1k14zli/7yBUpm3Hgx1po/7TnCfeEm1WQcD
         9GyOMnREbZJPLqMXFI2StQnJC/q7pF6IRxg9iRUWIVTs6kYgEHdk0kKw9aXWYSx/ii8d
         ddUg==
X-Forwarded-Encrypted: i=1; AJvYcCU/7+eWmMsSw7rKx+MdEjAmfXy44cgjkOKz9sIYnHeBkz5CqaTj0yscajxrgUwnMfxmFAs6GLg/grMhlFTD79osXSkv4IIE+1dPXS/Vhw==
X-Gm-Message-State: AOJu0YxyNsEGDelWSmjMpnEs0RxVTov9o2y7CQB76dZtGdSCiAN/DgVl
	ryXtzHw2/Wy8mqEHUdCUh00lg0ElboDbwVrfUogPYHIJ2Iq+BsciFUgL8xYd5no=
X-Google-Smtp-Source: AGHT+IHaeStXfSqqOyUz+Mi/3wHy2ylA84orYV5PCgQVyCYO3ytJiWkgkxQsbxtOs6DBUfK4Ifynzg==
X-Received: by 2002:a50:d4ce:0:b0:572:8aab:4420 with SMTP id 4fb4d7f45d1cf-57851aa84cemr5690278a12.39.1716792778316;
        Sun, 26 May 2024 23:52:58 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-578524bae20sm5345800a12.90.2024.05.26.23.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 23:52:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Mon, 27 May 2024 09:52:51 +0300
Subject: [PATCH] dt-bindings: thermal: qcom-tsens: Document the X1E80100
 Temperature Sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-x1e80100-bindings-thermal-qcom-tsens-v1-1-0f50f58253e1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAMItVGYC/x3NSwrDMAwA0asErSuQhUs/VyldKLaaCBqntUIIh
 Ny9psu3mdnBtZo63Lsdqq7mNpeGcOogjVIGRcvNwMSRzsy4Bb1SIMLeSrYyOC6j1kne+E3zhIt
 rcRTh3N8oRblEaKlP1Zdt/83jeRw/rbZVmHYAAAA=
To: Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=990; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=LQt9dThnSzo/E4SnKuEuBz+EbP/P0jrW+Y4I8XPbjzg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBmVC3E5P09MQRe2+lB4aZi9HE/8prDG2IC1HVm8
 slFb9jEvYeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZlQtxAAKCRAbX0TJAJUV
 VmLND/0XE0UA+5AAbC2jndetnZAvUOZlq4sUG9jRlVtfSlZ65DYvoezr47+mwJnqrFDUqNMrOJ7
 OF85YBxZk/GWsSNh0+GG40cw9dJ8Y+1w5g7sehd977oO49Kvah4RdcMRCXdm09EAkJ1g6Eds00F
 oq4jPyQf0iV9H/wF7Byn4dB7s7kybyI7HR9wqOh6yv8+k3rjBW8TtA3thaTbxI3EDCv2deYZ6QT
 /e08tmPLR1p1Ti8iQ7p+7emqoDDqVqGrWFb7jpJyzqa+vMISyTm05HsxRS+2PIUZO2M9VOSRf22
 PaoQwuoCJ41ixi8ZI5N/FGYk6/WewteT2DwRtdRk0OcwYcgYIvRyf3uxqCszPRy0pFOHc/IkQg+
 xaiQDpnl+Ex6scwnFI/jIBPQisvflH8nLFIlX3fGfJvetIyqX7qPOfTmpcrvLKbWJ0H/MwdDaAq
 l88NVZH3bychxCkYhsyLMFOzPmWpJLc7XV51OfMm0sOJsM2HYMlMckWWg7IVFXfifsiUTlulMV4
 N/RVoBuvbsvcZdSH68lDn2X/ZCa78R6PVZ3lIjgmT0QnNgDDfx1NbGCXW6mjTzfCOK52MpCtMYI
 NFmadgtIhcLqQSeQzmlWX1Swx/mWY5zrMXTid1zSEdH0vaVvEK6VOpoJX6mOVmMgqSOO6qDGqoa
 LcD9icJ39DkqZ7w==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Document the Temperature Sensor (TSENS) on the X1E80100 Platform.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
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
base-commit: 3689b0ef08b70e4e03b82ebd37730a03a672853a
change-id: 20240522-x1e80100-bindings-thermal-qcom-tsens-aa2db90c4a74

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


