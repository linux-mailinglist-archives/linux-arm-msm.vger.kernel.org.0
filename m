Return-Path: <linux-arm-msm+bounces-14820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E3B886B8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 12:52:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96E341F2359D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 11:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943C93FB3B;
	Fri, 22 Mar 2024 11:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UVrGfFeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD123F9F9
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711108353; cv=none; b=IG4wGBBrSj7MJtEWrGH1Dlq5jl2GE5au37FVDjVCvDCNQX6oaT6MzB4LhsSQUBwnQUHfuPc9iMSAGKp//Q/UAdo71f9H/mXacjby/9++cJBWT3oiIh7rUCm9u1yGrNdbHo0bKQJ/jn/kbfeCo95FwCV9F7gnq4LDujcv90vFXv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711108353; c=relaxed/simple;
	bh=uM78URD0gmUDrKQrIPNiYKlgPKGQKTJvi0ZT5XQ1EB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PwSJNw0mnruO71VWdb0rTfvCUkcKpn4eW5ZwKAyBpnuNGUvV9Gn5Zb8d/4gLTcopdQ5obsMgdBz6FsrZYfsGgHys7f45WvdA21LJ3n/OUdlTC3WbM+tD2HEZRbyd9nny+IZVG9XWYIa6UjsZ+SeixVYpmpv/8zj33FYOYdP4Jt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UVrGfFeG; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5101cd91017so2321759e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711108349; x=1711713149; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWwlbSeFXBG15AriHw93hkTw8OUx5yGbRBkNRks3CkI=;
        b=UVrGfFeGg8DdJDFp+8XOvN29M7JX2Ue1rUzq1yzXXx4/v/Kz7lYlp5H/HepfeYF204
         a7Bp+iMxW4iW2yib+QzRrKY/oZcI5SgSdOEgsDjOQyPlXX/rsFYkFsIHLporwZz8fzE3
         biIHYzc3j/LEHGLWifiBRsxYjAi6yqGDE4SgNhOGtNUKq+L7+L1Repa3GmySNrcBajh3
         +SilfgADPqQullrUT51GzMpCoBMA3WKHfNnx2Q9y83ubDCO8P5q0+eD3YeVUxKCQhrCc
         8rpYXeLDwVURAmUYNICSG7+XCrjd3LI05ped7zHyra+m3Z2VR5edGaPVNa8WYsn+gALX
         isvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711108349; x=1711713149;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWwlbSeFXBG15AriHw93hkTw8OUx5yGbRBkNRks3CkI=;
        b=YwH+Mz00jbbRC7vIH5BEfgE6YTKRXPW6N9zoYXPfhSJ5W5hhQBGGOxFYKYAEjVQkAz
         Mt9DNrCrdCms0rFnYaOUtdexDWRdiu4Nw30X3a6ygvg8yOPnkKPBgKNt/Xi1ZP4yJFOb
         Dy59otZtU9czL7sMB2wC5uA7E6zc/BBqycMEuvxAKzOSrpzJWE5kydr0voXc4+Y7scJX
         klZHFNpbCctBIvfTMcuGiilgtg5bMaGT2x6rSuYhRr0jBwpoK1mo2x3xvEeWGu4Les77
         Ou2BfgPopAvjbFFT/RczD9huBy1xfTaxjWSesFmVfSB6mGkICvDKEZwitbY4PkcMJq6n
         1R6w==
X-Gm-Message-State: AOJu0Yyjc2boqxzJr2zv4QZTA4wNWrSukFS0ZNaQgkdTuVjgY4SeKMWZ
	F4sJpP31MlbI/n2BNCJqIkekoVquKFKfZzlbMce74V+GarLMNh+SjLzGw5A8Pa0l98yUMBK6zOb
	B
X-Google-Smtp-Source: AGHT+IEtdCncG/ZEKbVGMQRXRtfDRdVEBTPHtMJs6fpl3hXYy+IxP+4SEqcAjWlvPSgV+JuRA04T6w==
X-Received: by 2002:ac2:499a:0:b0:513:ed0f:36c4 with SMTP id f26-20020ac2499a000000b00513ed0f36c4mr1536091lfl.43.1711108349344;
        Fri, 22 Mar 2024 04:52:29 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y18-20020a056512045200b00514b644bfebsm320136lfk.299.2024.03.22.04.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 04:52:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] dt-bindings: usb: qcom,pmic-typec: OF graph
 corrections
Date: Fri, 22 Mar 2024 13:52:20 +0200
Message-Id: <20240322-typec-fix-example-v1-0-6b01c347419e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPRw/WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyMj3ZLKgtRk3bTMCt3UisTcgpxUXeMUyyTD1OREC1PjFCWgvoKiVKA
 02Mzo2NpaAAPMGdFjAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=743;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uM78URD0gmUDrKQrIPNiYKlgPKGQKTJvi0ZT5XQ1EB0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl/XD8w8CexWMiJQ7x21C64WZ/aqo1apoJ9seAO
 Oq/9Vz93ESJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZf1w/AAKCRCLPIo+Aiko
 1e6jB/9Eu1u/vRRBp6wrsMZtEet5SCW49JbbtMaiPCYmiTSEDz90925Kj4xVr+YVC+Bq557xPsu
 2nPooieMCq016OLfddrm4IN5mWbkjjBMUd5y3spUudY9RR+s4PDq+ldTW9o8dyGaAXcSLSv3K8c
 oB/P8xb5Hi8OuYmJ/HBnvxrpSiwJjM3RFls8/0TKrvplK5GG+IidGmuuvMyS87K22pHtVOPBPGg
 Qg2j6XHm63P73Xy4GckU97dWifLZ2Cs1RfdfZJADZh3mhkciitnHbINRZOgEScyspxzIX35hCKC
 ggOF7QX+sozAdjLrSQpDYxe12e/ZfxjPVKoy8xowp2ZNGYWF
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop the extra port definition: it is not used by the DT files and
there is no correponding physical signal.
Update examples to follow usb-c-connector schema wrt. ports definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      dt-bindings: usb: qcom,pmic-typec: drop port description
      dt-bindings: usb: qcom,pmic-typec: update example to follow connector schema

 .../devicetree/bindings/usb/qcom,pmic-typec.yaml   | 39 ++++++++++++++--------
 1 file changed, 26 insertions(+), 13 deletions(-)
---
base-commit: 226d3c72fcde130a99d760895ebdd20e78e02cb5
change-id: 20240322-typec-fix-example-3d9b1eca853d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


