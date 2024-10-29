Return-Path: <linux-arm-msm+bounces-36328-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A88E9B5111
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 18:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F8C1F21FB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 17:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C5B919995A;
	Tue, 29 Oct 2024 17:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Meu/Qdua"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBDBBE49;
	Tue, 29 Oct 2024 17:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730223346; cv=none; b=WiGjo9qE/X5u+UzAuh9s7HZxKw6cDJLcsKjnAfA+fbhkjz7olCuiJpDOfzVJhcDKuy6Y0xbfRRT6SBqbb/OrjruIur7HUF1bHkMfHNDumocn5yyVm6FTK2R+CX8FPeoWmBzV/sfDMuzeqR3IzlbVkJf5WKIR0mFIUOcdzksXrjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730223346; c=relaxed/simple;
	bh=q337UQ+5fn07O8t9Oo/LgWv7EqNRCq7x9dx5kSfuPXM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uNUuClQ5hsIaa9GevIKt3MWvX1b2c2BIzDWFE/OhueTJjzmYCgFCLGhK8vt8pPLggwWgEcgJsy66yKuDUz8fyzq46vBem/4apzREaPyY3BdsIRKjCpsU4We10KPxra/r1oFbmnFzd4vLz6O07gAp9uG+JOVLG7I4xo7DrQhct0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Meu/Qdua; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a0cee600aso753373066b.1;
        Tue, 29 Oct 2024 10:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730223342; x=1730828142; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E4gGnuoXPKV45GDjQremf8Qgi8IsdD9t8fMoHQgmFo0=;
        b=Meu/Qduazr6IztqdGBSBmaDNFBwLeeI/sYMU+V4yTdxyY5V/qetLipDiviP7GFWgFk
         wG1h8345kDovH3aeBm1sCVjRS4LVBRwPoLb10PiGljOdwy7KwMe5sQv96ug3kebjd4aA
         /zAHSdDQL8FehqvSd5Ns5ZwmCqsmknp/8G+56BvpK+17c2M1EnUzhrgdUD6/F0LVTPOO
         Jr+DMbR5iBY4fgt58hRN47Lhp671iA4R9YUKaHwJFGPfWpUiQP599HZufChHJW5RqaxF
         eI+wzyKXI3drr9uZ42uvRbZkGk4hm3ppbuNe107kLvisMQGW6xOy7oei4xHAdWYCUrI8
         EFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730223342; x=1730828142;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E4gGnuoXPKV45GDjQremf8Qgi8IsdD9t8fMoHQgmFo0=;
        b=ALoy6bSFnhw/ZdAMKWP7X4SQBOFuL3EYckWHOc0pqvx+MgXlIHYLvT1lYxuv8DSuHo
         9k0LPrjKp8fwRXldnsqK8qbdq8NujNHgjsBozr8lNzxft43rC7SWrYwvztwkdE8Acy5W
         ioVQDWiPFue8CMhS+XGXGf4hlgrb24oQ12CdABWRugH+8LnHtlmMY6+QTZCul5lhZtfi
         lNR2dVsonraZ4XKd5LL4u7Gg3LYbST7c/DqsA62UgHVrq3KENDFnXQOGK0RY1ulPrdv3
         HM2w/mxmbMr4iof8JVRZ3Pzmeoa/QkRMz3Dnf3HG3hxUtpif0dXiJZkaBOECxOAAYuSu
         wGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYYNL2BEPPQvkRe9jH66eC5WSbWmxhZ30mwQv9v3a9amwke+Cs/XkFhTI+Xqbe21zD1xYJ7VpihZH+nucq@vger.kernel.org, AJvYcCUh02dCsA0EJ6O9fJFr6+XqUvK8kQX2PqgIPee/2GqNB5629SB7aKeWqXaYiR1MCI2gIsjBm1UayK1s@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg0zj4uw6MZGONRMaIODU2aghO+Kq+ceh7etAt/2OnSsqxEsxZ
	vrS20+JsJVwpJewRf/OxJ9sAJcki2e9RIYrnGz0Z71hC4IyIw26ZlS7OaQ==
X-Google-Smtp-Source: AGHT+IG5sFsRSZNnIAKTRq9xZSDdUw2KLvf7Pw3IEPd1bDzTIyhuwm4Mg0vxkYeeltc5Rc/YWaiSZA==
X-Received: by 2002:a17:907:980e:b0:a9a:7f34:351b with SMTP id a640c23a62f3a-a9de5cfd5d1mr1146256266b.3.1730223342242;
        Tue, 29 Oct 2024 10:35:42 -0700 (PDT)
Received: from [192.168.0.2] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9b1dec802csm500555466b.13.2024.10.29.10.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:35:41 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 29 Oct 2024 18:35:25 +0100
Subject: [PATCH] dt-bindings: arm: qcom: add missing elements to the SoC
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-qcom-missing-socs-v1-1-c5bf587b0afc@gmail.com>
X-B4-Tracking: v=1; b=H4sIANwcIWcC/x3MTQqAIBBA4avErBtQEfq5SrRIm2oWajkQgXT3p
 OW3eK+AUGYSGJsCmW4WTrFCtw34Y4k7Ia/VYJSxWpkBL58CBhbhuKMkL2hXQ7a3m3PUQe3OTBs
 //3Oa3/cDVOGRomMAAAA=
X-Change-ID: 20241029-qcom-missing-socs-4d2e484fbbe7
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

There are multiple compatible strings defined in the json schema
for SoCs which are not included in the SoC elements list. Extend
the list with those items for completeness.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 5cb54d69af0b7206e0f6a66023a203b8d7087696..ccca140e16e3151b689bfa66c3bb84cc226b2fde 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -19,27 +19,36 @@ description: |
 
         apq8016
         apq8026
+        apq8064
         apq8074
         apq8084
+        apq8094
         apq8096
         ipq4018
+        ipq4019
         ipq5018
         ipq5332
         ipq6018
+        ipq8064
         ipq8074
         ipq9574
         mdm9615
         msm8226
+        msm8660
         msm8916
+        msm8926
+        msm8929
         msm8939
         msm8953
         msm8956
         msm8960
         msm8974
+        msm8974pro
         msm8976
         msm8992
         msm8994
         msm8996
+        msm8996pro
         msm8998
         qcs404
         qcs8550
@@ -82,6 +91,7 @@ description: |
         sm8450
         sm8550
         sm8650
+        x1e78100
         x1e80100
 
   There are many devices in the list below that run the standard ChromeOS

---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20241029-qcom-missing-socs-4d2e484fbbe7

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


