Return-Path: <linux-arm-msm+bounces-45132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74025A1252F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:46:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 566203A33D7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B4341A8F;
	Wed, 15 Jan 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wjHsk9Mo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA71E24A7F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948643; cv=none; b=RaphowyAgFCUit/+giGnu3pyJH5Cy7iOAJhOIiZ2XrfY6996TIIxo4ELIeU+zzj5RehmYbwUlPfGlnN9jENGZ+f5Rf8GZY1fYADqkZLZ/Ie+7sfDAVwJ3OVpJQeF+eaptYIKSvFo918NV4DEkvmHSZICqFviWoy3GfaR1z1H1fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948643; c=relaxed/simple;
	bh=Qbiv67ybeY9iWVeZn8FLN9LPwZRM69iskFl5dbv2+o4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I76opkrGBjhjRATmzwOW157SRhPN0igEQIJntk59Uqsn5mxWRfr7AzAgo8Lr1eA6js70DF/HJ3ehfE/IY1YIziRPbJwdJePjzqXaBivcc4QcWvc7FJvz4fIZxsklaLtx3c0a1ACNUrd+F6EVVh0Ee6AzE0/vtAZtjgte03ZHfCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wjHsk9Mo; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361815b96cso47951875e9.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948640; x=1737553440; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jz3sN7tZoiJ85BeuCeUSWazrqiI6w3rVseg0mckYJb8=;
        b=wjHsk9Mo00zOcbn5ixX9UkiPCThBaBj43zG6LypHUfx8sYTAlrVXjaHz6bOaVKZtbv
         wfK4U1h/bwT6zFMx8AIBEc7ecaUQFB2xNpp1ti15uSZ/WiFOmsrBjxU/1D3iqFC3Q6y/
         vcJMaUvONmPgr7Motk4+uW+GMkZK4hjEcCTaiPNNBJMQUrP0j1XeTiBUi7NnKxDJ+RLv
         anU3s+Yy1Hewc6vUcAVuUfQA4y5EtE+r19Dj/NkYg0KwLNa3EhdI/mJQvIQ/3SHHwAp6
         gf3im0ymXehzLtsVVe7YVcxDM3bMSV0OY+JYiAvze5ekH0rqoc4F6Q1D9tWr3MtSKWnn
         wPOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948640; x=1737553440;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jz3sN7tZoiJ85BeuCeUSWazrqiI6w3rVseg0mckYJb8=;
        b=Jq1gi1BrrkTX60bXJMQV+v/Mq1UqJ7k3Hh9Axy8NkEPAKbhQ6xv656ahKMi9Buvjnc
         qKcbcug6cvHiAQtTW1+shMjRxrlE6WmzlYSsXFvcyjZ8dMj/SHGq77T3m7TF37+ad4wa
         OL4pmeBASf3FQM7/a2guxS3SHAjRBG/MiK3QRi9u3izquTk3AZRgsUpqGoRBfvycIYz0
         0kNl1OW9L/DOoWYoyNj0bdHYIwmv1K2b+kWVOdmpFEnG2OrurcgOOWNizw9Vq7+XY/Zr
         RKx2aj8hnI+8Xz9J/5jj0ZfaB4O9DnHb58c5tdFA0nvAZdQS9N06a7xKRYNnRHrMX9C0
         5XhQ==
X-Gm-Message-State: AOJu0YxXGT8HDsVwIKXqpgIDlj8gyZQZiBrYFrdPBpR8E1VuX36VXOcw
	oUQ/CIyoe7GeG+vkn2U/sgrcZpiMChHzdoZamw948BXwJcAlIXQczk2oK8Yj+QE=
X-Gm-Gg: ASbGncvU5vxfZ67F6QUsHUT1mNVkfsg658Um8Jk9xwo5x2jDdw/W5foczJQgVqSWTk8
	7X8gs9Zkd6e3jmlF2RJP5DEmVsvstRTSjoIooeTsp6OLfRPZLQXwaLjJXNfd9kXn5xyMS10ZwzV
	NfsYKa9Vz5wmwYOQFD50/goiU7KB4ihIlFMEs5Xfp7CNhRv/etXbUafgy4ZACybsOQQv0fWyHz4
	h3Y8LOBrXYTFW8VwKqlnb6mPWH3RZeNJmJJtvW8tybNbV+g5bBJjwRuLfKedBe/LJAmMWBYpwci
	HA==
X-Google-Smtp-Source: AGHT+IGgsY36Vejw/3ZvEJ5bN8+OJRo1+M0iEQs0lj0Ay9vhYfWWH999eGnaCP6yImAiBAB/Oo+CtQ==
X-Received: by 2002:a05:600c:1c14:b0:436:1ac2:1ad2 with SMTP id 5b1f17b1804b1-436e26c0400mr233698995e9.19.1736948640201;
        Wed, 15 Jan 2025 05:44:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 00/10] arm64: dts: qcom: sm8[56]50: performance related
 changes
Date: Wed, 15 Jan 2025 14:43:52 +0100
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJi7h2cC/x3NQQrCMBBG4auUWTswCQaqVxEXMfmrs2gbMlEKp
 Xc3dPlt3tvJUBVG92Gnip+arkuHuwyUPnF5gzV3kxcfxLnAbS2a2OZxC8LfYq0izpwba0rdOTa
 wjB4vIMjtmqmXSsWk23l5PI/jD0zTgcd1AAAA
X-Change-ID: 20250115-topic-sm8x50-upstream-dt-icc-update-082ebee5094d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Qbiv67ybeY9iWVeZn8FLN9LPwZRM69iskFl5dbv2+o4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7uaZytKO3M3S/82Kh/FXro4FUBK1NsX9AkevD+g
 kIufrl2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7mgAKCRB33NvayMhJ0fscD/
 wP5OywhgyWfFQ/VsMl3qCYCSgGW1RkrXG+I4UWLrJTOt3MYCAoZt5Cr59k4HN2ru6xsI/gw0S3enbl
 m7/zEIc1d41iYnL7m7MmLZgcQZVFZZZcihpc03CAMI+QPhLWJvagL1BVteligLkIgxNJQrNOjsfO/4
 CgjMYpATrSp0oVzwLqB5XojNMzUXSahT3RvD69P3uBIP325IFfsOVaNsSD2sjKVdOa0xlYlogGeF/x
 jIthgtoRfFLJOfehW3TzobsP2EyZ8wdC3cxI5gRH9fog1HW4xbcguqDXmrYXIPfFzW0ds9S3dOPd9c
 C3lklFVCk+5ZzcmS3JKbAzXkkY5CMmvwTAvd9iSo5taRuid9tdEnGTA7j0YIxo/Mx+LBrypkuTKs2R
 A1IKmWadczVTRCPXtz6RlvNCGKavN9UU409YoJR6Diw48rsxWm0Z+xpBS3PdSdxxtCysrVxNotVrzU
 P8L+XXMYVntjbj0FY8yq7V66hW11VgOMywyL/aAkt60e5UVgxk3qBoAkK0P8jw3kQZvOa2w4wsTAQF
 Jq8N71iIaDNj6Mc+SyB4O+/l0euQTHiFRtqYpXQ9hEJnFwtVAvTOpldwpu/2ss++kskNwx0HBJbNUQ
 zFlrG2NgXBOb1UMS/mcKW3OLR4QW/iF2IWxFQAEaYya2wr0HbCctBFn/GGJA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

A bunch of changes related to performance properties
for the Sm8550 and SM8650 platforms, including:
- Use proper ICC tags
- Use QCOM_ICC_TAG_ACTIVE_ONLY for cpu paths
- PCIe OPP table
- QUP Serial Engine OPP table
- UFS OPP table (sm8650)
- USB OPP table (sm8650)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (10):
      arm64: dts: qcom: sm8550: use ICC tag for all interconnect phandles
      arm64: dts: qcom: sm8550: set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: sm8550: add OPP table support to PCIe
      arm64: dts: qcom: sm8550: add QUP serial engines OPP tables
      arm64: dts: qcom: sm8650: use ICC tag for IPA interconnect phandles
      arm64: dts: qcom: sm8650: set CPU interconnect paths as ACTIVE_ONLY
      arm64: dts: qcom: sm8650: add USB interconnect paths
      arm64: dts: qcom: sm8650: add OPP table support to PCIe
      arm64: dts: qcom: sm8650: add QUP serial engines OPP tables
      arm64: dts: qcom: sm8650: add UFS OPP table instead of freq-table-hz property

 arch/arm64/boot/dts/qcom/sm8550.dtsi | 598 +++++++++++++++++++++++++++--------
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 544 +++++++++++++++++++++++++------
 2 files changed, 915 insertions(+), 227 deletions(-)
---
base-commit: dab2734f8e9ecba609d66d1dd087a392a7774c04
change-id: 20250115-topic-sm8x50-upstream-dt-icc-update-082ebee5094d

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


