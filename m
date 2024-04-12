Return-Path: <linux-arm-msm+bounces-17339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF48A308B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 16:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF8061C24062
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Apr 2024 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160871292CA;
	Fri, 12 Apr 2024 14:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="T3ZTSdss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D96885C7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712931780; cv=none; b=an4HMxZFXIgLXBJsFPyI1UcH6kN5GHSQMrkgFCDx9RYpYRbQEUUbOSpphfmDazQ2FnGMppy3v+rrcWk8mnlql6vegpWOer5pfTNNS0SJWgNuOnM6+v9nOTPitv/CiEbN3+dr6pxESm6JIaZSmDJbtxMIoZYHwcpse+8mOfLEVjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712931780; c=relaxed/simple;
	bh=1nhHHey9PJ8DLGIRPcryUPM5m7e5VFRwQCHuQCVRLEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tL3gybaj1VeKgUVPU3K468gH3Z5tbDo/yZmUxrCnvlnp5qZon1NX2U5f/73NnETS6KZ5x93XiAON5BEJOwzzEK0sblymBdpPvKchzqnZ4bvDilScnB0yOHVDVoIunJNmwlLPUZBNgHSDJMtHnVNSGJaYN5IY5eXpohqhHKPsAjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=T3ZTSdss; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56e2c1650d8so981132a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Apr 2024 07:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712931775; x=1713536575; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HkmahkPkQACrnB5JyLYBblQR+A7iG3SRr36SJvXv7cI=;
        b=T3ZTSdssnVDpAuyCks8a9zh1MTGMYhkUQFTpkvW6L++Ogb0G9gXIwdPoYikfLZBgtq
         cbcrzMu4lHxmw66T2Ps64kn2OUofu2y7RUU6XYW7i4oQM6ST3ze3pOPmUeGokk2tMLb9
         0ck9aWoPomsfo6p7Wpv4W9bwTqf+RLPiop0YWAJpGW3AN5O6b8AsQA50W/zg0j0dyp0I
         iM+bVvSPWn2ndbCYM98j2EJliNj7o/Gzib2MTDTvraRC5dsz8jB9novhuX8+2Jhrt+3q
         hyUGEAVV69DWblxAUfy3eNA3MEW+gdZrKXUNFY2hvVuXjPwh8VYuIbeSGfx0JLm/Wrca
         Yigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712931775; x=1713536575;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HkmahkPkQACrnB5JyLYBblQR+A7iG3SRr36SJvXv7cI=;
        b=TEwSt9KPAvMuif1SNy2AJKF8chhq+rPkSYjQaKhHdRyjkkM/27vFFZXrJ/anVtbAWl
         UgRpQJIh86JV618jAxbnEbn8gWUtU5Y00hw4NDIabvPwnp8QJJxvNwLPfcT7uOKILT0Y
         me7yqLqlORNF3ILpsYYRMR4ZGdYUYvT9iUzTQBkICzPZRR/EPI+PqCC77PA7hoPJ7z7m
         6/JNgR6ItD6GKab9F9Vj/Y4Ng116YXxAruTEniSdA+5+cAC3oy7f4DyBzOh2431F5hhP
         qYJ+rHmenuLsTtEekz3+mj307efm414X7zDL0Ba5erGy2LdoxRmpOafO5kRi3Bd2JcbD
         /GYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPT1kKKgpBnMIlUgJXwvoGmNHXHrFATgwt1fXl9QLgZaZCgpElDpQduF8BSkWDW53BKrQeIpx6Fqk7T+mGi3Z0RlYqjGLyt+ew7C+mqQ==
X-Gm-Message-State: AOJu0YzRqpWymbwsZSdtEKYIFtprdUTFAxZnMOsO+MQnxT04UijuWbLV
	IFjSDs9aNGBqxsZ4vK8Pf2xk2L4YmZJIVpdVLNiF9YCoqBTZ8SyqeD4dX/B4aio=
X-Google-Smtp-Source: AGHT+IG7S6kcG25Ko/iQD8E1ukj2BrMGOMo+mSr1Prx4UJqquhinYSgF59xquhk/ALw5JQrPnyfQRg==
X-Received: by 2002:a50:d501:0:b0:56e:2186:847d with SMTP id u1-20020a50d501000000b0056e2186847dmr1909304edi.16.1712931775390;
        Fri, 12 Apr 2024 07:22:55 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id k20-20020aa7c054000000b0056ff82e54a0sm920166edo.31.2024.04.12.07.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 07:22:54 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 12 Apr 2024 16:22:53 +0200
Subject: [PATCH v2] dt-bindings: mfd: qcom,spmi-pmic: Add pbs to SPMI
 device types
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240412-pmi632-ppg-v2-1-8ac892b1bb61@fairphone.com>
X-B4-Tracking: v=1; b=H4sIALxDGWYC/03Myw7CIBCF4VdpZi0Gpjfble9huqg4lFkUCBiia
 fruYt24/E9yvg0SRaYEY7VBpMyJvSuBpwq0nd1Cgh+lASU2UqlehJW7GkUIizCKzL2p1aVHhHI
 IkQy/Duw2lbacnj6+Dzur7/pjULb/TFZCCsK600M7oxyGq5k5BusdnbVfYdr3/QNZ7iMkqAAAA
 A==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0

Add the PBS (Programmable Boot Sequencer) to the list of devices.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Pick up tags
- Rebase on linux-next, drop merged patches
- Link to v1: https://lore.kernel.org/r/20240205-pmi632-ppg-v1-0-e236c95a2099@fairphone.com
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index 8103fb61a16c..b7f01cbb8fff 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -160,6 +160,10 @@ patternProperties:
     type: object
     $ref: /schemas/nvmem/qcom,spmi-sdam.yaml#
 
+  "^pbs@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/soc/qcom/qcom,pbs.yaml#
+
   "phy@[0-9a-f]+$":
     type: object
     $ref: /schemas/phy/qcom,snps-eusb2-repeater.yaml#

---
base-commit: fa8c2b5f446d6e8ff4bc8f67ba944b1be3aad790
change-id: 20240117-pmi632-ppg-f1efb4318722

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


