Return-Path: <linux-arm-msm+bounces-11915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3582085C4F7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 20:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE3EF2871F0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Feb 2024 19:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2CDB14A0A6;
	Tue, 20 Feb 2024 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ruWZyNuN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CF212AAE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 19:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708458132; cv=none; b=srXFtf/rxhOdJ/JI/ftCldrJFMe2VTScV/6JidYzGUKydGA8XNvCX4gJMq9lMhBly/snAwULlgsPw8l8djao+OMpbdsh0LBwT3/QGaqra9GSbNXp9bU8WbogFVOqmdsJm3knt8w5kCwQkGXKizpAw1zG4Zg6nkKmsL2zlCIvZfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708458132; c=relaxed/simple;
	bh=BcD6RsSSskw1Y1FZWqSNW79K1il0ALG4B1Z5loGjs3c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b2+rWe1uqadih2kbNJEAsNP1JS+mwWM+JMhgcjk8723OWR9AOwP5M7lNx0jE7Ro8i8rvEo2qdpzbYpc83qTixoiqLfqFjwL+CCybhb9InFOkieu/yHn5UVHoB4jHJdxVsv/HI8h1SACwmNZwBn8SJKSYEFOlel7GuSbqd72V/pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ruWZyNuN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563fe793e1cso5865554a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Feb 2024 11:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708458129; x=1709062929; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhuET/T0FANjeqzL8xf3U1OOYne712izFcHMVgNkJis=;
        b=ruWZyNuNBHRDZRX1j5dm4IRWOo9ZWqWl3/QEerq0pZlbYXABv7dPZCzkcl7p6dVLGC
         SVsRMjQQRdXjWVII+/JKGAWBjpOH+c0tWVPdSNYNTkusBv2WfnmDWeNm0T3mjllW5LzY
         RTM35h6rNz1P0BaWVbTV6rfOmRjeeCS0HwUTGzT0qAzmkgjURj0noWPj4WmiWWS9PASI
         2p7ANG+82qr4ksBBLqa9OI/7+tbN5Rgxj2YrLeK4C0EhF1g5gQgOn63Ew9YyoE9EjpMD
         UW/REwk8n9QuxUk0Mpgho0VsL0BznxXZ6RrosiRmzk9WReK53pUcacCfxijlMr4ck4ld
         6jKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708458129; x=1709062929;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhuET/T0FANjeqzL8xf3U1OOYne712izFcHMVgNkJis=;
        b=cn/J6un1+L7ivUsSaH7+U1MdybAbjHiRVLYTnbtk8MGKIqW7v8dSv7CyRqOY1FhyDt
         1/YD8wa7PQRGdAtK+b5u4UTwf4DcU1db275US0Cb0Rsp3Av8vn7w6ZW1NDR/T0u/aMtz
         atSDROZ/0BKA3iB+IRXJ7nqNr+/PY7ZKlc5PAUvrhqwF65QKYj2KvSiShsHDjHsu2QQw
         9Bk1ert4HLj2BPmEPtajtFBtP7gf/16RwN5ERj4h4Va0Xv8J6T+iiRojkyT+Dj1PCKRr
         7KMWrto8RtS4gEm9LntlkyHWtlcdzjTXOurmYThSs69j+d+cOIIJfaz13+iMw0ReyuaA
         M65g==
X-Gm-Message-State: AOJu0Yxm1wXTE/XaAjBnB6eJ5f/7WQH8SXYuEnU3T9Jvi5bZTAwiHeKT
	TGqSfRsLV78Z5ZS7RQaOYYmyf1bxCoKY0+F0Xba/+gyijgertVAY7usmy4N5a5M=
X-Google-Smtp-Source: AGHT+IFRrj5v8hh0hSjlC77d2Mey3KqKNXqp373Xia098XsxTnsRZEZzSLlrq/fVkmA7kp1skyw5jg==
X-Received: by 2002:a05:6402:33c9:b0:563:e5e0:85e3 with SMTP id a9-20020a05640233c900b00563e5e085e3mr7766330edc.33.1708458129076;
        Tue, 20 Feb 2024 11:42:09 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id c1-20020a056402100100b0056486eaa669sm1906822edu.50.2024.02.20.11.42.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 11:42:08 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 0/2] phy: qcom: eusb2-repeater: Add support for SMB2360
Date: Tue, 20 Feb 2024 21:41:58 +0200
Message-Id: <20240220-phy-qualcomm-eusb2-repeater-smb2360-v2-0-213338ca1d5f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYA1WUC/42OQQ6CMBBFr0K6dkwZEMWV9zAshjLYJtDiFIjEc
 HerJ3D53uK//1aRxXFU1+ythFcXXfAJ8JApY8k/GFyXWKHGIs8RYbIbPBcaTBhH4CW2CMIT08w
 CcWyxqDSQ7rtKd8UFTanSUkuRoRXyxqYtvwxDkpNw716/9L1JbF2cg2y/J2v+td9oqVHXf0XXH
 FK5R0NlV5+oOt8G50nCMchDNfu+fwCqJIf57AAAAA==
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=BcD6RsSSskw1Y1FZWqSNW79K1il0ALG4B1Z5loGjs3c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1QCInUMm+zVQe4rePGCRdJoZPR1980x4ZsJ6M
 blrGB5KFI2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUAiAAKCRAbX0TJAJUV
 VjxvEACSN7RkodjVNVk0+UuvzJNhrhOyKBVFhQvbXkauXDtYeg3+LJR+10MbcvR14n/tMT4vxix
 v3Oz6mUK1HOhCiBqsJt873FNX8JWWAU67Ic711H0AbP4jmL9rYualvMC5v4f+3vVmHCqalp5h1t
 sb2/rQktL9Tca5jKbzXt5R0xsjPJ0pshvMkef7Z4ADQJFdX2Y7xTFnB7UVk17ydXt/oUt0dcdwP
 uCgJKJ5rRq6LZGFQ92PxB05N49Fr3fbbbRf2VDEhDBwSkdOxkL9z/1L5r2jI/yVYInMozBsGu1F
 sGmRgX5strm+bMigviWZqJnTiJqgeg5cYBRukOkIdSKb8gr6OJzZVh6UM+pR+yHHnpUnkznEs38
 xd8qJQ2ccCcEBYmQam24FpSb/GKcr8iShAOpWguqQZN3DT8ToF3Ps6vR1Wa39u9m1AhUZWhgN2T
 2D+nLkC9P31eejfNQDid7/X/4gU2MqIzNnO97o7/qaMDnND3ger5VYsxpoh1joT+irmPpan+tBJ
 gQQ45Z3b+BV+Nz48koEuNRnRmSI3hqUIXaqsphi80w2Tg7GXhcJrgb8Faho84SA3G8Hc+ewMCnT
 +SQJeqFax6GMs9UJw+Ld9XkYEwskfenlBixNtMBQ/6T9RqUT7c1Vkw6TvHzsYx7BYGvg9fW0unR
 oDKOhTNrzMpadfg==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

This patchset adds support for the eUSB2 repeater provided
by the SMB2360 PMICs.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Changes in v2:
- Re-worded the commit message for the driver patch to fit Dmitry's request
- Added Dmitry's R-b tag to the driver patch
- Changed the compatible entry in schema to enum, like Krzysztof suggested
- Added Krzysztof's A-b tag to the schema patch
- Link to v1: https://lore.kernel.org/r/20240209-phy-qualcomm-eusb2-repeater-smb2360-v1-0-af2ca4d95a67@linaro.org

---
Abel Vesa (2):
      dt-bindings: phy: qcom,snps-eusb2-repeater: Add compatible for SMB2360
      phy: qualcomm: phy-qcom-eusb2-repeater: Add support for SMB2360

 .../bindings/phy/qcom,snps-eusb2-repeater.yaml          |  4 +++-
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c          | 17 +++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20231122-phy-qualcomm-eusb2-repeater-smb2360-a0fd60d382c4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


