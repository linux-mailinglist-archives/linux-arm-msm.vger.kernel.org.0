Return-Path: <linux-arm-msm+bounces-63170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D822DAEF267
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 11:05:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38D973B56A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A398926E6E6;
	Tue,  1 Jul 2025 09:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="np7EHz3R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0826A26C3B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jul 2025 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751360501; cv=none; b=gO1f+Lg5ZhAI99t4rvlh5CIY+PihpEiHcp8yzIPoKwwOL1qbnf2Kfs3gQ9SvGaB8a5GHTKupT+D2u9AyuhqWg+uPdz2Ce8m/Ee7gplLFcAEITcswVxyh7xMSmy9KIGTDBw36/DhHZCXMSINEFFFTpCFdYjRUfR4WM0Mx4XhPG/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751360501; c=relaxed/simple;
	bh=UM/a95nU6vNLC8ZVtNDfSoDoqDmVKHLoqiuDZiPQOFY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cVqQpmpIqeLDR4NSSYWDdCkGtko9lbuOetQLlsqy12HK8eALey+aTtzVN567TQYidSvcKDVNarmeWwmGrKMHUnsisYLL5FP1So1Ey5HxU7Vd3XrftLGGEPy/B02LgD/2h56vCOI+po8/Rk09G0lrcLDxTFuZBsLlBoXQ9RO8HDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=np7EHz3R; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a51481a598so1686727f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jul 2025 02:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751360495; x=1751965295; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WP8VKsIDrL+Rlg/Gxr50hjhldFCuzpVHMlIsVNdgSK0=;
        b=np7EHz3R+tpby4q8v+07EcNGGZjaP9cYWJWWz8VrfmjRl58RnpufLNdjmdmv7/2O8m
         8R9ldZJrqQO98aY81OdOJaDNqZN5087oKjEDzmKGH/yY39U5Q+2HzlDqJ4fWfUto1n2A
         w5WiiivN26Ll7hEerlpfMVJ1t/oD4PlN42cO/pKCAvvPKPIHhJZa5o404Je7iCflIUfE
         0B4e6T4AIJ2cuP2p0KTk15mOcQUdIIkVCxcD698mubR3yeYmyL4m9PfOXi49fXgEZ5k0
         id1xl9AmEQwzi8a4kA4I7FWASm5/FjSbeGfuWHMPEdGKrreOz/sv0jNFf8Cnyn1qcKdp
         4KRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751360495; x=1751965295;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WP8VKsIDrL+Rlg/Gxr50hjhldFCuzpVHMlIsVNdgSK0=;
        b=bsAXOnWjKeZPCyn9Xe7S2JKluHCHPtLrPXNSH5wwv9HwWocE3vFmWIwuIdetbOiRLe
         /QptCGiWEPUef2s8cgxBV3c8IOYhcDWy/u6h+1Jb/SbiK+LiweV7dmBHmBGq2Twh3cKr
         HlDKsLbesuhdaKWucM5jWHQpyBQcjUQu/ALaUAE1q1AnDIUSIi2je8mWPsFdO/Y7kb/a
         MynK4NtCwO7EVfCTosOY7a5NBjEov1GiHZ4xW5/kbtx5f2MHvx0P3ThiKR1jISckqIBx
         QUg+FhgBPG9fURu8xXsoBAR5qfAD2WnrFH8xhAMFEUZbOCqrD4rEZh8Z3Sb5RAgNOb1S
         tbRA==
X-Gm-Message-State: AOJu0YwBe+rrGFnqzxQO9mshIgputVTZE7RUX6SurKQMWSgR4L5KpFMy
	ejXkDnGqqf1LTAgZ2orDqdt6KyomignvkD0AEQO9fGRoKvfA/NEvLzDiqSeEa4C7kLU=
X-Gm-Gg: ASbGncvvEYOlNn9vBAqfCckuRVQ4KH17soUhPjrt8adiGOohBnD+23a8pL1m5Wj90w9
	GGAwuCFIevB+GGOc8d4LDV18fjC1LnHnKk9Urfss5Xeq4eGWYVIOkJ6/TCBPL05x+kMDs60ZhtG
	4HNwkpv7vpThtkMmEfoVDnI/NhynZgFnQ9L0HB8iii+vVjgcI/oWLfo1Xw/gIojvljxJkf9pdQN
	Iz+Kb6AvlI/jWvfnBTALcUmmLRgiVWbEpztheKPC/8ae7vCfu2QIhKEWvrar4T2YDBkW3/YC0W3
	E4bRDftzI9yOnk4apuOJicemwPDb5EsuVL3wFbSBzUYnsHdhocgZZcw=
X-Google-Smtp-Source: AGHT+IHaVKK5/KLi+D7h/i2dCCKCKD/8hgl9hcBgDka+2suPtO7Ix58QUwQem6y4dI/BfL73PW5K7A==
X-Received: by 2002:a05:6000:270f:b0:3a4:d994:be7d with SMTP id ffacd0b85a97d-3a8fdc1f5a9mr9410263f8f.23.1751360495002;
        Tue, 01 Jul 2025 02:01:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a387:7a32:8457:f9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ac6ee0d0b9sm6949707f8f.18.2025.07.01.02.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:01:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/3] arm64: dts: qcom: fix GPIO lookup flags for i2c-gpio
 SDA and SCL pins
Date: Tue, 01 Jul 2025 11:01:28 +0200
Message-Id: <20250701-qcom-gpio-lookup-open-drain-v1-0-9678c4352f11@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOijY2gC/x3MQQqAIBAAwK/EnltQM4K+Eh2ktloq15QiiP6ed
 JzLPJAoMiVoiwciXZxYfIYuCxgW52dCHrPBKFOrRmk8BtlxDiy4iaxnQAnkcYyOPVJlbaV1Tc5
 YyEOINPH9713/vh+OY8wBbQAAAA==
X-Change-ID: 20250701-qcom-gpio-lookup-open-drain-e3443115ea24
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UM/a95nU6vNLC8ZVtNDfSoDoqDmVKHLoqiuDZiPQOFY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoY6Ptvgi5B1OXpXy5Qc5dnFDSASskBDGBNT7tD
 OMK42Jx9kmJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGOj7QAKCRARpy6gFHHX
 coV/D/kBLaSkzFODESNxhQquue3V2OATAFhq1h95NGrcmcbTr2WP1XSY35uU5H0aSGmg3Y2PREF
 lli5mQrrTjqGPUIuiKSC9/Wny8Xh/eJmZYIH+C71NuAOMklmKmPiR+sRapU2cVz4/w3ed+bXUjy
 VPf6Dsy4NyIxSopChXiWApRhxy4xNK85rqhDY0d33/tHhXlys55KjThYN4eymQkj0wXN1x4Skm7
 2jCtEYXk8YLOU17Go4prTHZfLUcTvqVR7/70oHsvHLi49tLjoz617+h7FqkrQIiRnTXNk5Yilex
 x4WRK9ejG7PeDo16zCXL2RaJSbOG17OE4Iesx9NN7+JoDywaZ/eBLXcUDwyN02mZqmX1tY+VxH8
 aTFucL7UmodT160gh4GBK6+/E/OCWy5CbLPXOcPE7/JylXuX5gRpQunrygiHoSXksXQYdSixh1x
 7DbRQO3QhGk5hVf4wAHr/46xkk8LZ7xkvj9jXk4Goxp8gAgmNDPvYgr5THBYArBxlh/MsZsC8sa
 yDcMKjYRBwvjaERWmgfY0nRy6AAqhzC3PwlZ3keyGB/yWGk5KvltgENDb3bBm7u/u/PoCBJ3Utj
 1fMARwmZKGWaqrewAZ7hOIEbA5L+Y/WN+schcjzlC3CGHWtoBYPC75eF1mxH+ahaM7kN/A7jL5g
 wVxVvMWO6Naff+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

There are three platforms in the QCom DTS tree that are missing the
open-drain lookup flag in their DT nodes associated with the i2c-gpio
device whose driver enforces open-drain outputs. This causes the GPIO
core to emit warnings such as:

[    5.153550] gpio-528 (sda): enforced open drain please flag it properly in DT/ACPI DSDT/board file
[    5.166373] gpio-529 (scl): enforced open drain please flag it properly in DT/ACPI DSDT/board file

Silence the warnings by adding appriopriate flags.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (3):
      arm64: dts: qcom: qrb2210-rb1: fix GPIO lookup flags for i2c SDA and SCL
      arm64: dts: qcom: qrb4210-rb2: fix GPIO lookup flags for i2c SDA and SCL
      arm64: dts: qcom: sdm845-samsung-starqltechn: fix GPIO lookup flags for i2c SDA and SCL

 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts                | 5 +++--
 arch/arm64/boot/dts/qcom/qrb4210-rb2.dts                | 5 +++--
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)
---
base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
change-id: 20250701-qcom-gpio-lookup-open-drain-e3443115ea24

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


