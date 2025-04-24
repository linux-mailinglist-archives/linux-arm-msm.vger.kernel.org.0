Return-Path: <linux-arm-msm+bounces-55391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4380EA9AE68
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 15:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AEBD4A340C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 13:06:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A18527C15B;
	Thu, 24 Apr 2025 13:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OsNyaf/p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42661E505
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 13:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499886; cv=none; b=kJWSufRwpt/EHvMcXxVin/A/CcoepkYJnAwJxBxkrfE/DLcj9d8LSd0t5K3pyioA8RZfkKBYdgeH8iybiZ4OEvZM/zIZ+aAeVE7EOQGFrpadzX2ROEVKbDTXhQO5XFqU3fPt10FAAPm/5lxjg3LDATfyayaUsr7BnJbT/0QmGsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499886; c=relaxed/simple;
	bh=76TCznWSFbidRT2PMHe440KNy2g8u8WvHHDLLyooouU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UjTeEDu7uNijhB5nBNlpzz/T2dJDznxLamZfxMzxscjFleBTUkZOuUAm883AeDyUMkOOPbkpZWEmU/WrblWILQoAoBn76Sy/mZjJPOil52BRcWQSL04UDZRpWachABfyqcvZUwMrk/UTM/4joIMc9WCkf6HJsJtEIGPnQq/3ZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OsNyaf/p; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-acb78975cb9so17239866b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 06:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745499881; x=1746104681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0gzZZgyv6b1R8Em3g5zbv5okL7WdvVH3bzEhxrzuDtA=;
        b=OsNyaf/p8i1g35SwEjMW7JZOrTleFAOLcUiZUX8QFfnjIy5TUdSkveMhZVWK4+P4pa
         oOPUIInzJDJgF90MxSFhj7sd3pWOmRZadhfMAKC6eQxCbRk9fjcRFCKs1w+KxJqKYaCJ
         +7rdvb1QEk/OL4yubHVhdX6JTg8PTL7JGPspkP0De5uqagXt88954CUEHa4nr9l6FEaf
         xyxHuSDVLhFw3cd2FGLaAfHcJHmUGHPk5ci8ubuDa5sOUDLdEsMl5nP4qndx9dX1QGiq
         6gGc19gk0S7hVXTV3XfXBKDEp68ur1jLAjyOcUrm2LovlNgNkWfwC1bByhbkURB7P9AM
         es+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499881; x=1746104681;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gzZZgyv6b1R8Em3g5zbv5okL7WdvVH3bzEhxrzuDtA=;
        b=mjpbqY/Fwx+ljHMiJ79dRox4D5gUMcoxyE24oK3tKll2/ETYuY0/GeGvVka3Rm8Pm/
         Cft66bK3WFmNbgGcyOdw4MZKYv0d2IjEHks1XM0xxJF+yWN1cEshXlVPXwwxPo9OVZJm
         5PSc6Al/Sq2XqFLE3uimKrMpQaLi0Qfmlcw2FxPb6vDfGaPKgjD0cXPzJtBPDk2rhqFc
         3c2ofuqrWfEQ2VfwT5UvIlS1364k/KOmKD1q4KOzV5nw5m4xAbt59Oxj/tX6+q57YUSP
         cnAQNqQaE3SaAwtm8y1FDJXOckAHom5TnSmh+Uj5Iv22aRsJoxAWA2E4rYvH51PKptVI
         6lHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVABYK/q63VyVmdAnUOpcbo2oMGY2NYjo/GtTch2gC67KyJBAnkxyAbeRtfGYGIuvk5oRJLQ//72MEPV1gW@vger.kernel.org
X-Gm-Message-State: AOJu0YwdJC8XqTsr+o+D0JV2e4gnH+RpBrNKCG39k+WALqS9CP6jdmun
	Wf2ys2Q6DGeOqo4cZzEYxZCkf2UGeD+rwIWYmhrlTEBl3NcE0kkp5NvKUT2elhnHx/sfIWw3PAl
	b
X-Gm-Gg: ASbGnct70EqlhYHXL0Zob3fKZ0Uw0rkjhgV81ue7eHtObOqUL91Nx5bpR0r3Sp1uVF+
	jXCv0yQ64nNy8tg916xZGRMmNk2BX+FbYJCFd/o/rNILSlMfLmLDw03812+kJX7UzaE01FSgW33
	2PxncoQKW38KSQ1IqTBQv/b9e9xept905c583YDf4ACw2v1lFCYo0KaTA5x4gg9wI9fTTB0ovof
	WFDbY4MZXMqN6WIBd4vaKSAuL/EajiEJJmz5L598IgqtciKTWJVx1DfqDy+oDTn8/Ho3qlVBUr0
	zXjqaNzhUYB/DCyHim1VRbgZLX8E9P7v+QsAkxO8Cwhfk83lNTiQgXiUC+8=
X-Google-Smtp-Source: AGHT+IExJYmPYtEQkJ75HdgY7+s6zFaCxrS9nw2hbsv7Rk/IyS5RnwvzCMoKCegXckcA/0mhoO0rNQ==
X-Received: by 2002:a17:907:3f12:b0:ac7:3910:17b8 with SMTP id a640c23a62f3a-ace57485e5emr81104466b.15.1745499880956;
        Thu, 24 Apr 2025 06:04:40 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59898006sm105101766b.46.2025.04.24.06.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 06:04:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
Date: Thu, 24 Apr 2025 15:04:24 +0200
Message-Id: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANk2CmgC/02OTUsDMRRF/8qQtdF8vDTNrARBcCduXEgpmeSlD
 ZiZMZkZlNL/bqptdfc+OPfcAymYIxbSNgeScYklDn1d+E1D3N72O6TR150IJhQDAbSktVaM+lj
 Gd/tF/VQogAYtrZQhBFLBMWOInz+hb+Tl8eHu9emZbH4fGT/mKpnO36ujbaoBuBDybNjOpdsmW
 ybMNAht0euw8sDaRZH/5c5gJS/V7OzjQEebJyqoASm09mslmWgXfkITlmL/WMU4v0p3Y4ruol1
 4DcAAygXBVkab+9rdxd7duiGdkjpbkNY5xaltpJGeOQXOouSSa4/WGgZSinoN3oCCeuoc2RyP3
 yXeRcd3AQAA
X-Change-ID: 20250424-sm8750-display-dts-447473a33fff
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>, 
 Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2629;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=76TCznWSFbidRT2PMHe440KNy2g8u8WvHHDLLyooouU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoCjbfx8p5FFKeCcy4zSoBzWVzyz6pT4QTtxphR
 2eLl/+kVfOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaAo23wAKCRDBN2bmhouD
 10O4D/4ubwxC333Hq5n0HLVxb+wGB5knSHx9+Vh0tbVSJpGcZkQgtZZmnsgO++E7GY0/ImT/0ao
 95BhF2em83hEGHmDAB5b2OBWE5hMzXH0lxsny5i+B/ictq0l3cmR5xWoTkW9OGMTFBmgoOV4Zrp
 3n5+/1q07hHD6BVqSO8orVY2TlHMXxXK12/jtbVFnA0Z6Mjyv9Svh9J+GTrh7D9jmh+Hw8cByPp
 lE5agqhuY16k57GCNtB0dKHQtcIlR+qnZwvavRcnbaUw3VZdHauiunJdWOAcVlecdCvlJZjLt3z
 HQ7MyecxYTBwWNr0X+6nvoRuYv//mOhDcf3WyF3kd595bjcqEPvSc1dhAqe2o0pmUN05UAt/711
 1yw1fS0SqGYei6bQYhRo/xyfgwde8yv9A8ORpyFZ4PHf90u7kDGxLMQ/sdoQyF5eW/1JNpsflNy
 zh2sixK6C0b7GsEjVrX5/ehhY8xsdHLpwklPSCj4elqACW12i0fo/coGwYRvwBr1AgFFL3WjOq+
 INlmep4RbECmiSIl4LpchN0pdLx+uPwTeoyWj0iZHHUVSXpYXHGI0RFcGXQU7wkjKKdf5vCeH/j
 mVXGVmTObWdcg5qIJJrgxf93IWFKbOrJLZdTOexA8H25JGobkYFicNYGy+jD3ZNtgway5G0ovjS
 /TB37R1IoRhnpFA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

DTS is ready and I consider it ready for review, but still RFC because:
1. Display has unresolved issues which might result in change in
   bindings (clock parents),
2. I did not test it since some time on my board...
3. Just want to share it fast to unblock any dependent work.

DTS build dependencies - as in b4 deps, so:
https://lore.kernel.org/r/20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com/
https://lore.kernel.org/r/20250424-sm8750-audio-part-2-v1-0-50133a0ec35f@linaro.org/
https://lore.kernel.org/r/20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com/

Bindings:
1. Panel: https://github.com/krzk/linux/tree/b4/sm8750-display-panel
2. MDSS: https://lore.kernel.org/r/20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org/

Patchset based on next-20250424.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      arm64: dts: qcom: sm8750: Add display (MDSS) with Display CC
      arm64: dts: qcom: sm8750-mtp: Enable display
      arm64: dts: qcom: sm8750-mtp: Enable USB headset and Type-C altmode
      arm64: dts: qcom: sm8750-mtp: Enable DisplayPort over USB

 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 136 +++++++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 417 ++++++++++++++++++++++++++++++++
 2 files changed, 553 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250424-sm8750-display-dts-447473a33fff
prerequisite-change-id: 20241223-sm8750_usb_master-f27aed7f6d40:v5
prerequisite-patch-id: 6fdfd47703ddaf8ffcea30d75c3f91767e595008
prerequisite-patch-id: b0269b582b3685213a83fd382a67767e6bcd2213
prerequisite-patch-id: 893493ba5d45ba4a46dfe587839e0383c5a10e63
prerequisite-patch-id: 7c016dcb0fbab838c2b76252c6cb18443c80af3c
prerequisite-patch-id: 33b17dd5e4b6e45f183d9ff8fded66e4caf230d6
prerequisite-patch-id: 1d8327cb2680216cd858d90a224004856b750ebd
prerequisite-patch-id: 0f100a5cd47aabada80060836a04c7ccac0a8859
prerequisite-patch-id: 2d05f8df51501b5490d0c6732706f56e58e7429f
prerequisite-patch-id: e33a6bfeecfb0ebf2c2b3790d02538562f72902f
prerequisite-patch-id: 001d38f8ce89e3e03d2a13de71453b47212ad567
prerequisite-change-id: 20241122-sm8750-audio-part-2-943277d85302:v1
prerequisite-patch-id: acf4c9f30842e1389e0611694483e8acfa7fd5ef
prerequisite-patch-id: b7dcdb6373238d8af4c5a505edf7bb3bd391a677
prerequisite-message-id: 20250113-sm8750_gpmic_master-v1-2-ef45cf206979@quicinc.com
prerequisite-patch-id: f2c73e0f8946071eb798d71a195a1061dad3cf9e
prerequisite-patch-id: 7b0af9008faf4b191f69fe88fb7b404ed7d4831f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


