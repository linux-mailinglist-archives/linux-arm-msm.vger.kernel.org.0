Return-Path: <linux-arm-msm+bounces-26885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3BA939FDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 13:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 012381F2312E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2024 11:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F66E152DE0;
	Tue, 23 Jul 2024 11:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mFjlkaCn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA54D1527A5
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734114; cv=none; b=JXwP0XjG0lwwj6MezCmaiHOaexQrHwqDjNuzgRTcWO9yYgXSihvpTB6C9jps1sFSnu07yTTbJGiyxr8T7boCeK/rVuSd4bmKd5RwkLdBFp9nfs+J8EZr68C0PAW2vaLhKvpm6eB/5wA3/5Ae4TiRdxPIcpZRmjDJEKYhhM3TcPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734114; c=relaxed/simple;
	bh=km1DA5g3KVXCN+F2Dg3Ezc08F4KN1ROM5TKI1CK7wuY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cUiK38R3M8KqvlRHovsPNcuNtHxSH9yKAUpyyBTnlBYuGZrnhZ4GTvTMHv1Fo9L5mFkAwSRtAC4jEpitp+xHKn6ImAa/GDPTUmPwb0AOXB9NTv1AkQ2YGwwj9wZUur2G7LAruiOQiHE+JwV/6iB+AjC/I1wQ2XYb0so1ArLMu+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mFjlkaCn; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52efd530a4eso4214735e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jul 2024 04:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721734111; x=1722338911; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UmFGX+HyHF3oXY0EE8+l1weiOh3LRa7chte5tmASm88=;
        b=mFjlkaCnQNUXKIrZlf/nGRXaaCXbAgcS3bHuoqaSYROMAlwS9jwbl+wmj6WeRzRwT5
         cu9vZ85STFHGihgi1Ys9pFgzAlC/Nwv54P5VdEibHAAOcWANB9c8xz6FhKw1iZMxcrXr
         /uCxC/POw19gbirdkHASduA7OHuzkc61ROU0Aj2nvBC0n2I5X59XHUNRXSpi1gsEXY3x
         60LoiTxLb71W85GYvfg85Tw0hrpcyrh8lUXtiI9AkiGNYVcD1uocMVXe1nw7OXl0Lcvx
         XXCEWcExIwF8lBr/a9oQ8ODs9EzSDOkcCT2nDG7mAksRTqBeRjfOmPlga3bhi6sluvRN
         9y4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721734111; x=1722338911;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UmFGX+HyHF3oXY0EE8+l1weiOh3LRa7chte5tmASm88=;
        b=N0u08ylgI1qs6bYo/YI2iXXr/KrbXuIT9O6R9F7K2DlRqbr69si/KjLokYfLWND27v
         jRoNf7ghr20Ng+5tIAF95MdXz2Awl3t5fXEOGlNRjnfORT8iiHttYWUl/Ewt+QLNtAAh
         tPF11WsKGWH98i99TnHqYRP3opRZhH5KBg8oMubkxLg0MzzB4j4cLJMwkxHwHPR3QrGw
         AAJjTv/ltr5o5njs81zqbANdkF8+pgQQj41RITymQ2Rxd3mEj/dEFnrr/zoBDI5MqbP9
         qzWi2NNzSO4mXcmqwwNa6XITRk/tt+0a7WfTB2ICsim5m7yZAHTbAy0UrEAr0vtr4ar0
         FJCw==
X-Forwarded-Encrypted: i=1; AJvYcCVP3u18sshHbqPZu87QbGJ2Ldh5nXg7l+9EkAcauLUp/sJbe6SNHmOAtGpteMhjxMoV8PAvnvOhdPkG/acKUgav/GplbIBzrKV71av/Aw==
X-Gm-Message-State: AOJu0YwF057KUGIVk4W9Nl2z66TXza98H3zX02sofidL0f4lOrP8DX7O
	OyExi4h6L9GFnMsWzFQowD0XCwlE3cTgVILbE9srl+ZdKut7bte9vmBjb4MkU5M=
X-Google-Smtp-Source: AGHT+IHhoxIHvEVaSZQwXZVYbxULzev0zlPdJnJAoPTj9MVi/D59j3CfOfrRjOhuvv7b2HYfhpQ8iw==
X-Received: by 2002:a05:6512:12ce:b0:52e:9b9e:2c14 with SMTP id 2adb3069b0e04-52fc407570amr1487366e87.60.1721734110829;
        Tue, 23 Jul 2024 04:28:30 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52f01552b43sm950871e87.286.2024.07.23.04.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 04:28:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 0/5] arm64: dts: qcom: improve Lenovo Miix 630 support
Date: Tue, 23 Jul 2024 14:28:27 +0300
Message-Id: <20240723-miix630-support-v2-0-7d98f6047a17@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANuTn2YC/3WNQQ6CMBBFr0JmbU3pNAVdcQ/DotYCk2jbTJFgC
 He3snf5XvLf3yB7Jp/hWm3AfqFMMRRQpwrcZMPoBT0Kg5JKy0Yp8SJaDUqR3ylFngXiHa1zaPF
 ioKwS+4HWo3jrC0+U58if42Cpf/Z/a6mFFNboFt3gW9Po7knBcjxHHqHf9/0LDY7vr68AAAA=
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kalle Valo <kvalo@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1415;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=km1DA5g3KVXCN+F2Dg3Ezc08F4KN1ROM5TKI1CK7wuY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmn5PdZRscABrcpw+EBbQ7X7fveT6YXMpfzGWTI
 7Wdxm0VLx+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZp+T3QAKCRCLPIo+Aiko
 1ULdCACqKAIrv9VG4QdG31INREbxjRnSTm7FqZdRlkeazd2rWNXAT7t+HLmBqLvUoqDzJMX1U5b
 3+6CSY6sxsoXntc7O1OE/ExOUOb8hXM/X1toUwJKl1BBTQ1NGUwCR5W8VdLs6KXcNkX1+q+AMn7
 ApvSDy+Vm6fpCLwFtOR/ve4sbPgY0Kbir51KO1A8aRC4ZZRiMl0GOzFAPSDKdv+MsnubOejwQ/7
 A9yF/qtqDnBXQ+7PL3IEyiUWmEnbUDhRcu21Hrdj4+P0acZqoKG7N0e2iam+EEbELMay9tArRh8
 aYbEP860Ey/2kmGp4I//JF9anCY0i5wV+vfBZenxeLq2hgwx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Enable some low-hanging fruits growing on the Lenovo Miix 630 laptop,
but not being enabled for some reason.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v2:
- Fixed touchscreen node name (Konrad)
- Dropped unused label (Konrad)
- Dropped wakeup-source for now (Konrad)
- Dropped extra empty line in pinconf (Konrad)
- Added debounce-interval to VolUp (Konrad)
- Fixed pinctrl properties order (Konrad)
- Added empty lines before status properties (Konrad)
- Added linux,can-disable to VolUp
- Added wifi calibration variant
- Link to v1: https://lore.kernel.org/r/20240722-miix630-support-v1-0-a6483cfe8674@linaro.org

---
Dmitry Baryshkov (5):
      arm64: dts: qcom: msm8998-lenovo-miix-630: enable touchscreen
      arm64: dts: qcom: msm8998-lenovo-miix-630: enable aDSP and SLPI
      arm64: dts: qcom: msm8998-lenovo-miix-630: enable VolumeUp button
      arm64: dts: qcom: msm8998-clamshell: enable resin/VolDown
      arm64: dts: qcom: msm8998-lenovo-miix-630: add WiFi calibration variant

 arch/arm64/boot/dts/qcom/msm8998-clamshell.dtsi    |  6 ++
 .../boot/dts/qcom/msm8998-lenovo-miix-630.dts      | 68 ++++++++++++++++++++++
 2 files changed, 74 insertions(+)
---
base-commit: 797012914d2d031430268fe512af0ccd7d8e46ef
change-id: 20240722-miix630-support-33b3acc3a396

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


