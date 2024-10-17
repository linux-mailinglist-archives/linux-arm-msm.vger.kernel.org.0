Return-Path: <linux-arm-msm+bounces-34808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7369F9A2C09
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 20:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385B32897B7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 18:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 450DA1E00AD;
	Thu, 17 Oct 2024 18:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLA3oTDo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C881DE8B8
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 18:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729189196; cv=none; b=OliG7NPvZ5kx3euKkzqTH9vS/B5Xqhqufhe2RF5k7upU18By+LhH2IRfavh+UyPPSJAbKYHLhn6uyq1Co/Z8UIV1XrAQKCoooRSGa2dDzkAYR1dQIVXStKsg/Yl9poVxOOY2S05w+DyZQea+Uju1M9NcB5nzKDp/nP53r0rIu50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729189196; c=relaxed/simple;
	bh=cAwKw7kvU13kUBqXuZ/E0nP3MbkwBJ48YtmMjxQ65OE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Es5Pb3HwO0HVbEjVG10vlogMxNqkDrSr2Yw4qa+YcrIDRvb2LYNk8dSCSqRFWzHoPZ0kETwTegEuIZf2PclzzihT5lILZQo6vNgdf/Rnrnayc9b59N7b4PwudcKSzKnhJaM9ZQ0tcsw598hfAgsivihhsVMuKRn/1EZyLXBJU4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jLA3oTDo; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539f84907caso1613192e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Oct 2024 11:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729189189; x=1729793989; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ike/UBReR+9woPeAVFsIJc4I+p9ALOVlJ2h/wy0AxWE=;
        b=jLA3oTDocXevRW+mHo+s71e7fv19PWrjaGDzwtpXdgWyim0LvhYx+OBLue6z1RG1UQ
         ekeDhJ3Lb7vfMYlPlgs1Nyh3TIL8Edt9p1wANDzjyA/uS9xG0ocd9jRbpGwfEiL4+QjI
         LNJr98n6otTI6wv8OVlEGcVEcuNPn9yzKYwOrSlKYIkos0BDY5nRzhKM8xagrEYQKYWr
         1k/WHe1Z16tS5NQ7Pt0uRt6h5KGmA4LEn6O6DjpScvR7tA6ANNBwwfG0sY2/BhyrXJPU
         VlIecC9ZBlpWLft0V/Leh5VuVdbj8seGsnvLwM/ljqGELX08otAF32ugXatGlOVZ1N4X
         naEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729189189; x=1729793989;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ike/UBReR+9woPeAVFsIJc4I+p9ALOVlJ2h/wy0AxWE=;
        b=E61FjxbiaPoDG26wBnRtYVU2CX4VofwNyB8imyKJ9zOEFGQ1TfMs0zc+CJTsM9PrPA
         MllMUoGfdVbHp3iOAhcLrBYNPy1i5WdX9PBdFaB6X9jmlpqqW9ZF89M7CdGvKq73KOWb
         cRtOzcl2OvgPRFFQaLO9Y78BrGgxeWkcN/DcvIUq+n1k6nu4AJaAznYd4t9TJyfsRCho
         gleeAACHX8g+odN8aAc5UZ7wYHsqVybG1xrPRshkTH5RsCzbhpWA3I9ag2tXm4EBDjLS
         Ih8iBgnauvIqdGtNO8cLumVAD6HMtRF7FB0gKBrOhKvlIQXsfkGMXgfohYd7mjCN8TGF
         y+QA==
X-Gm-Message-State: AOJu0YzXTHAhyIzVS0whhwF/fa70ZtmBvRExPTva9UTxQKaMxwL1b5OC
	Jv0bBdijYtAGJJT4KPvFF+reB0uz+ckFFOPm6qZsyp0TgVDNl2HY2LuL35AS+7/uJlva88VNSyE
	skf4=
X-Google-Smtp-Source: AGHT+IGsBo5m9kjFSjxPbL1afjjbNId8QNUbl7emPMtrOMNvNbfe28qy54uOBbkT3juHdNSqCc8LCA==
X-Received: by 2002:a05:6512:39cd:b0:539:ffb5:8d2c with SMTP id 2adb3069b0e04-53a03f2da23mr5339954e87.30.1729189188607;
        Thu, 17 Oct 2024 11:19:48 -0700 (PDT)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00-70b-e6fc-b322-6a1b.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:70b:e6fc:b322:6a1b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539ffff3b4esm838932e87.180.2024.10.17.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 11:19:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 17 Oct 2024 21:19:47 +0300
Subject: [PATCH] dt-bindings: soc: qcom,aoss-qmp: Add SAR2130P compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241017-sar2130p-soc-v1-1-7f9c204710c3@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEJVEWcC/x3MPQqAMAxA4atIZgv9E9GriEPUVLO0pQERine3O
 H7DexWECpPA3FUodLNwig2m72C/MJ6k+GgGq6032oxKsFjjdFaSdoXOedyQhmAnaEkuFPj5d8v
 6vh+mgNLYXgAAAA==
X-Change-ID: 20241017-sar2130p-soc-a334abae5f29
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1062;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=cAwKw7kvU13kUBqXuZ/E0nP3MbkwBJ48YtmMjxQ65OE=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnEVVDM8jbC+98SoEG6Ejt7WfPtg16sBxP6yhZY
 8YagtO7SpKJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZxFVQwAKCRAU23LtvoBl
 uF7uD/4lehZvtx2y8KyGYGC3RMoSzVt6mnqkENcs88p7PF6nMRPlOGIB0rQdulVUOT6pE94S5lJ
 S0Ro2yRpirSTC1s8xyPm179SB62p70QQGuU/EW5tAf6FlLqhMDGB89MDMTfwwkQ3aevnLa2v0gD
 kY0USqnXRVAemLJDrow2FpcRX/YLHFYoZg3bZ0o9RdU9eJ+Hq9I8Wek49LMW2oqlRfBSzSNKbSg
 O5oASpda3ztUv4Sm1gkhMQPSwS3vw7NOOpEC3AdkEO99e0qAud5BjOQipB+xFCjPfEIM8gbxCoE
 9XAfDRRYhUFac3K6dOc3gCWslDrpq0Yk+SeIhf2iGtRZtTPNhfOju/loWCn9XXSo69Ulb6/dF0C
 hVsUFp5UZsA7Le/wHLrfRmPzo0OnlGciMN4MM5NePP5+hh8cqytEfsHG4qsoK4OhHsSfO5Fy2wa
 BWi9AL5BT1kjLZwupaKjhvSgeIDzG6mnenwf0RvlJuwPRhABKCX/Ww1VG50ImBJBlYYvQFZ2B00
 9xFrtuh+KZuNu24YGJ/Tyk+tbOGpNljf/W7CyeqhrK/5v7Hjug9Iz3TCrGLQsp02PpdyjJpvc3g
 RBHraK7tGaHl40u6RcKJtvHFMo9QijjW6rNqQcVZqGFlKTVzmvfT9aCg/ytH8Qc1/c136D4CQtd
 YokBlLoep1WwAyg==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Document compatible for the Always-On Subsystem on SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 7afdb60edb22bb6e6042e2562afa9feb771f98e6..76f6d5c870a291b4deed93eaea339413b1db7d8d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -27,6 +27,7 @@ properties:
       - enum:
           - qcom,qdu1000-aoss-qmp
           - qcom,sa8775p-aoss-qmp
+          - qcom,sar2130p-aoss-qmp
           - qcom,sc7180-aoss-qmp
           - qcom,sc7280-aoss-qmp
           - qcom,sc8180x-aoss-qmp

---
base-commit: 7df1e7189cecb6965ce672e820a5ec6cf499b65b
change-id: 20241017-sar2130p-soc-a334abae5f29

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


