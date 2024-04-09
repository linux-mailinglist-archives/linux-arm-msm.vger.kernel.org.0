Return-Path: <linux-arm-msm+bounces-16914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CF089DC35
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 16:28:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5C91F25F99
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 14:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06BFA12FF76;
	Tue,  9 Apr 2024 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myYntV6a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBBD12FB36
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712672896; cv=none; b=gFRRziUqfPlwGm8ANPyTRnw2UjK/dvHysAv3OUD7mFdu+tnLSib5flsXlF1wQ1g+WerJ4Sy9ywc5kEkvijf4oCTgLpDaVjcLlcd+ttW1BVdpb7MfE5YfMB/WVrPwjSWCGNdTlWMXptMXshsAeF2U637ep2sQpwphL3IStPcVMFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712672896; c=relaxed/simple;
	bh=Hb09wlIx6A4HawisRegBb21t0J7I/A0j7nfa3Ye7jvs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i9oX/jHY9Giwmf0J5L189r2Sq3lo9mDM21FZPJmLNxFiIjh+k92rvgrLyGQQNKNghurRMMap5IaJX6wjG6KaZwx5PTrtjUeYj0qUAxw9KjdoPnwvplVvI5BY550KlZrH3PwuKQ4nmWQehPFR0waTN7xBzlAEk6nAgBO+WaKndaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myYntV6a; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-516d264d0e4so4486322e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 07:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712672893; x=1713277693; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TurNgidqk97CllcAQMbdx3dBEFbeVZD6wnc/B9AJmq8=;
        b=myYntV6ai0iTmaG/yH4jvhLR2kUSH/LH76sstEHm3rDHaEaGc9zFrkdLV3p8rmGKaV
         nblem1NM7x3xyFecjDkSLvyUK8LlT3y7/3OBbxxXGRkiHkiCIUDZdSXE81KXrf8S4fRf
         HYn39WS1Z3NUfL0mSpJ5/A1d/OmO5xdeTKemgrOGvaetfkFaxfTS2Lb+Tqtv+Q7pljxt
         Y0u9ku8C856Gt14jf4Fnq0iSjwbEPxJ70O1dwtsZHRhUOom4cg4ilxiUdM5lvlVcUG5x
         8tjYvyd4LYO5MOeqz4i5xhmEcBcluUAoy2Bx+RKpVVVqwr+2UWM4qbjXwfHt5O0iHm0z
         Z8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672893; x=1713277693;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TurNgidqk97CllcAQMbdx3dBEFbeVZD6wnc/B9AJmq8=;
        b=c5k0xACnmgXWxiKXbih145Duqtz+7VS/7DqD4Oei+pMI/zdP+cYRNb5cUFVJPseCex
         l0vhXFYiRu3EX/e2vFpiGQ3KSga/AE22TsJ+RvgvnFpYQAfXzGbyFWzV9Oz0ytEQkYkn
         zFp/+d7g14tEvYluthQYFbQ4h/ZqiYVjzPx5eJmssfM6XSM1Sa65ZLjftZOu37JM8XSM
         IgOkAV+QfgAjPWr+1zkk6TcXEEU3NNLQevjFBAZCAo4URIUY0n2bKJ6ju8lZ3qRDv7Ah
         tkmlWXmDOnrhIhTyIS/8XNLF8Ph01M6Btk2ZjeZA+bezUoPPKinP/TZ4fbaI+dYf0+4s
         OQ+w==
X-Gm-Message-State: AOJu0Yyju43E2brtn3QfkG3gVm/Ul4m0h7JzMoNZrut3C3w9i8NFN7Ea
	vZpaUSbAr6lPssleCfTnfUx7ytnU3PLJkkZQ+brJFIZ3YVrZvq4IgAjiY+vW8/tBUgASEoqm7ni
	2
X-Google-Smtp-Source: AGHT+IHqLCnSltdIHVTldWxPELdHaoQT4xrkn6acl4Fh/TBJ7QdJRdYy2h/iRwdMZIjVlXiEXXiPRg==
X-Received: by 2002:a05:6512:2083:b0:513:e1b6:40b9 with SMTP id t3-20020a056512208300b00513e1b640b9mr946141lfr.28.1712672893062;
        Tue, 09 Apr 2024 07:28:13 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id d9-20020ac25ec9000000b00515d2ee5b38sm1556445lfq.48.2024.04.09.07.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:28:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] arm64: dts: qcom: add USB-C orientation GPIOs
Date: Tue, 09 Apr 2024 17:28:10 +0300
Message-Id: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHpQFWYC/4WNQQ7CIBREr9L8td8Aom1c9R6mC1oo/GigAUI0D
 XcXewGXbzJvZodkIpkE926HaAolCr6BOHWwOOWtQdKNQTAhmWQDOv3E0BSfVW5dtBuFhFzyeel
 XLWSvoblbNCu9j93H1NhRyiF+jpvCf+m/xcKR4cBuclbyYq5CjS/yKoZziBamWusXrt8LwrsAA
 AA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Hb09wlIx6A4HawisRegBb21t0J7I/A0j7nfa3Ye7jvs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmFVB7xJHa+YdHKhIHI3x5EPjNpgdcbzqOB3d/0
 2c4W6IbMHOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZhVQewAKCRCLPIo+Aiko
 1chZB/9kprF63SPlr8UyiCy6vqDFVm6y+JHY0kMDyaoiS01NBpcMF7rB0U1X+8LYWBIZ+oqemvK
 gnFskr9v3e1jlCke49oc+eQuFKGDspRf8RlWcuwTgLW9lZ4dfkmQF+M+ObA5uZokG3EOC4fLr63
 5fbDlRNq/ez8DTt4OghuqGF7X9pWIQonakJ4f1fNGNu2AanEVq0l1jWxm+x/46XwKYmJQ7CmYjo
 aF7ZmbD4d70Lzv+QLVu+IKpSRV3N9PuaoKZsrdFO2CnYMo9zdoyaV8eRp+2lyXcwRoUWb1csVkG
 12occIatdmrxQNEHsm4dIFLk3laZqsmRgKEfRkHQLEsGCfao
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Populate orientation GPIOs for some of the PMIC-GLINK-based devices.
This leaves only FairPhone5, RB3Gen2, SC8180X Primus and SC8280XP CRD
without the orientation GPIOs declared.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Relax schema restriction for orientation-gpios property (Luca Weiss)
- Link to v1: https://lore.kernel.org/r/20240408-hdk-orientation-gpios-v1-0-8064ba43e52a@linaro.org

---
Dmitry Baryshkov (5):
      dt-bindings: soc: qcom: pmic-glink: allow orientation-gpios
      arm64: dts: qcom: sm8350-hdk: add USB-C orientation GPIO
      arm64: dts: qcom: sm8450-hdk: add USB-C orientation GPIO
      arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s: add USB-C orientation GPIOs
      arm64: dts: qcom: sc8180x-lenovo-flex-5g: add USB-C orientation GPIOs

 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml      | 14 --------------
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts        |  2 ++
 arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts |  2 ++
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts                    |  1 +
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts                    |  1 +
 5 files changed, 6 insertions(+), 14 deletions(-)
---
base-commit: 8568bb2ccc278f344e6ac44af6ed010a90aa88dc
change-id: 20240408-hdk-orientation-gpios-141bc7fd247d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


