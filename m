Return-Path: <linux-arm-msm+bounces-25715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5EE92BFAA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 18:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 904601C234B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 16:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7656F1A0705;
	Tue,  9 Jul 2024 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PRIbztU0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD4B1A01A6
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 16:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720542035; cv=none; b=N7os41fmRD85TQCPdh5yLnhLYw35LCtAV04Ppy7KSGMAihkgu9LMdjX0ynaSlKIzrWsyAe3+iLgCj9hSgVTsPvSHLKkl1P7b9bR5VVnWgcxdmtelTLD+o/jdEAPTdO6RVy6pPpRK5zT1MBHjcfbHtVeJwNNdNYzCWkVBeGSyoIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720542035; c=relaxed/simple;
	bh=5st73kOX6niI7dZR/91fmwwqnxTqrZu6i3fehCAZ5zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OUL2fhrZg9lWzNZFoP/ii3tN9UDmV5GEFFskzcA4LwM5MwfidLqN3n9gTEkYoH5AlKMMYpr/9Lr80c4k6iUOWgpC+2dDss+j27heSk3U4bOWQ6PMhBdkOKzehtkfassq1JqariMmWoWYloL4LKn/wsVTyeKNBhTlv5mLbYcJCV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PRIbztU0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42561c16ffeso37598255e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720542031; x=1721146831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9DRYaK086JGmwgg9/og5NAl7NqfChxitmX14BDZNew=;
        b=PRIbztU0tbMxRl0zaoaTw4hCPAio8NOqfA4bAJSk+TyP85VQ8AO2syit4mQ+qQ5O/C
         Ddq1NPYlvt83LODkPD5PpJB1+w1477Ql9nwQIV28Dj+DHvDi3yMA3BuJ6Tnj1rgXRVWx
         gTNKSaF/seXjYPNrQrBcFqL8it8TPMoMEK/EPzBSfHmU3tS6SbBVHg1DB+Ez+EQioKXC
         Sb13pzknsUGJMqGYH4p8Neo1PzNYU8QcxbKFZR0qYYKHvKxYgUYiB72PsuqezrbYyTnd
         3DXThzKXRjo0sNWM7JLfN3sk+RiNjRfrQRXyloK8paif8fEI7lhNndHIG6GOp7/XO8+x
         YKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720542031; x=1721146831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9DRYaK086JGmwgg9/og5NAl7NqfChxitmX14BDZNew=;
        b=e1XbFVNT3Mx77Mw+ubBrOdAg1R+8jM/fBvQTcx7wRbPfDQvVhI/4gh5uwcClBCe+aO
         uyE+z0lOC6uBvif7nghOF5IKa30CWGamg1pficyhiXH6HmBxrGHiQCQvCItvqRb7FmTx
         J8MVLFhMn4ki9syV6OUploFjE96OiDChQAqAM5u1ovPGaBNgSVUpvHQoGCGEemWCs81J
         YSq/rwJYcKjD8dERH+DPWtYf92nhsZKzu1Vx6keVH7qE1nvU6eFPij5XknlK7MyTIruT
         Lw5BhjeUd2ybVixmyYXUxQuKqtE95zhrMS22JFwnqpLJsMJvQk8huKquxclNKsjvaims
         w4Og==
X-Forwarded-Encrypted: i=1; AJvYcCX5zwpUP24VfIQkqyssxhUFLR5OBMSjkBs7lUHmd3anqgj3OrbLh06PNk5t2I5fBHf40BZu5oqc5cKH3+RNj76EQfmtD313ht9lUJFV2A==
X-Gm-Message-State: AOJu0Yz9LVSr8QLxpxSkTZaPGoL/J9fwxoTgEiJjsyccPOpwRfM3ac4W
	h3KzMJ13Usr/zfhueLKOFS6KkY8tn+hY/a3PrRFi5azlXV7OUIsoIRv0zWLXAVw=
X-Google-Smtp-Source: AGHT+IH20yAq+roBl8gRs1fFr53+7Ufp7oIBFU8tJB9uf/asNe3YYKfGca9kCcuwlS3kQ8aidhWhUg==
X-Received: by 2002:a5d:51d2:0:b0:367:8f29:f7ae with SMTP id ffacd0b85a97d-367ceacb46amr1892463f8f.49.1720542031527;
        Tue, 09 Jul 2024 09:20:31 -0700 (PDT)
Received: from rayyan-pc.broadband ([2a0a:ef40:ee7:2401:197d:e048:a80f:bc44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde7e07fsm2966955f8f.17.2024.07.09.09.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 09:20:31 -0700 (PDT)
From: Rayyan Ansari <rayyan.ansari@linaro.org>
To: devicetree@vger.kernel.org
Cc: Rayyan Ansari <rayyan.ansari@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/4] dt-bindings: pinctrl: convert remaining qcom bindings to yaml
Date: Tue,  9 Jul 2024 17:17:52 +0100
Message-ID: <20240709162009.5166-1-rayyan.ansari@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,
The following patches convert all remaining old text bindings for
Qualcomm pinctrl to yaml, so device trees can be validated against the
schema.

Thanks,
Rayyan

Rayyan Ansari (4):
  dt-bindings: pinctrl: qcom,apq8064-pinctrl: convert to dtschema
  dt-bindings: pinctrl: qcom,ipq8064-pinctrl: convert to dtschema
  dt-bindings: pinctrl: qcom,ipq4019-pinctrl: convert to dtschema
  dt-bindings: pinctrl: qcom,apq8084-pinctrl: convert to dtschema

 .../bindings/pinctrl/qcom,apq8064-pinctrl.txt |  95 ---------
 .../pinctrl/qcom,apq8064-pinctrl.yaml         | 110 ++++++++++
 .../bindings/pinctrl/qcom,apq8084-pinctrl.txt | 188 ------------------
 .../pinctrl/qcom,apq8084-pinctrl.yaml         | 129 ++++++++++++
 .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt |  85 --------
 .../pinctrl/qcom,ipq4019-pinctrl.yaml         | 102 ++++++++++
 .../bindings/pinctrl/qcom,ipq8064-pinctrl.txt | 101 ----------
 .../pinctrl/qcom,ipq8064-pinctrl.yaml         | 108 ++++++++++
 8 files changed, 449 insertions(+), 469 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml

-- 
2.45.2


