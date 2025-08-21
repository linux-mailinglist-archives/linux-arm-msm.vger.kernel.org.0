Return-Path: <linux-arm-msm+bounces-70174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F2593B2FAFF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 15:47:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E21C06259D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 13:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D25283451CC;
	Thu, 21 Aug 2025 13:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OT9kcjrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBED32E403
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 13:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755783456; cv=none; b=lwzYBabvRgvsBPg7Ms5WRBVB591MVvGNE/nbG9DutqPYyoTh6dY/nm0ndxnVAZKgHrzIxB2Tt5xFq0Qq1KXilV6fFMZNfYBfS3rp3BuoeNQmvMHDM3iRBOn/5BtXngx33qCKzuwHG09B2ZfBMhheT3rqWu13UqvWarvNX2W7BzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755783456; c=relaxed/simple;
	bh=lHxdAfx6drvAEMKHrEQ+9RA9el2H+2d4jMGmrfBAI3M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NC+KvaZe3q0T/ZygqG3KYC2yrq1m8tMftDcK9lk910gnfn46SLLi/MAo/PIrp/xQnY0jTtbetMWMstjJp0a56rU6XyQGf/ThOmWqOU1Ezc7//uyFGDiZ1R6PYZh6EPGpTPLkbUYf3TlNZEEPeC736DV7Hd81A+TLUKEPCNtx2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OT9kcjrs; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9e4147690so487436f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 06:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755783453; x=1756388253; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tN+1JMlzAi9JrxRaDDza1sKyz82ZxT7Qa8I/nBZwio4=;
        b=OT9kcjrsqW8Zi2a+UTDl6mayMosJvnnjKui7b/m8BbBI6UiKbQQVfKkP4crBm0Oz4F
         2p8/113jgJQWkYzsh/NlKiCDsU34aWMX9/0T11fuz29JcUbnpGFBWvdhV0h7TJbHXq0c
         NnQoZ2dsjblxS04jQOPZuCLE+RBUjqKIcVuVtRVAJRsX/S4Kpn48qnP9JAv1028fTPSU
         FFBEsuJ/OcM39jQz1deLYb6+/w5xgFTqWiHkJWFAx+UM6X+3Mp/s5BucxL9OLcjqFbPh
         qqtGMz+8vHAHiRd5ieax6i1c+RpWo69SQWy0nvim6q5qVi8uDMoNpuVbb3ezxNLw9rBx
         EmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755783453; x=1756388253;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tN+1JMlzAi9JrxRaDDza1sKyz82ZxT7Qa8I/nBZwio4=;
        b=qCBgOxE3U4lYmFYb89q4kSygNkSTf1hXIhB9/jZYUuCE3vLeiAQpJcF6fIlVGonGbu
         ouiUT+kZLHnhT+llihi7ifHHitWZh9M8MnoRmK+OF8cN1IumJJVD/sozVeK93Fy2/xa8
         Adr1jjU9swW1J5sJhB0Ks3kc3C+LKLhFXJrQr8B7dGWsrL544EG4mjnW2HErjUuREWYb
         cAxHeQrXs8MJGfk5FWGUF/cafa6152iEh4U/CkNpyw4yjd6uDHFaUAKzy3NBR2uHIf8E
         oenEDBXkbJk0Pbl02VwGCG8t1MTASut6Lhc1hZ46WI55LoSUnNkJSFtds1BQfti0ObpB
         3LFQ==
X-Gm-Message-State: AOJu0YzXFcbaLuqSfNep7PbOE5bDDgTIZCMq67hj+D1gP3rML+S/altH
	zLl4ikpNmhGRuTEmwId3ulbJXcRzUCeb7qfI3JpnQMzUCMV9H2DbjBPNbYsPGJIcKqc=
X-Gm-Gg: ASbGncvQGftGJVwIhRkBwMi4/NQB0aDE0qTt6+hVY9UU2iiyHg+qfuCUqk9Au3/Xt1Q
	43qe6cTxz3POaTm7RdetHQGn/NVVrOEV0wLAhDMHtBzG/fEMOSRj8IKxdlwwSboMJjbfecAnaSr
	BCn8s02YZor8J2TD+0Ya8mL5jGmaiE07iX7m8vIOI7xZ3EBZxEAGlEwiYyyA3ngvMzwckKZJWOb
	aDa2rlzYdQ0ttLsRH+Ut1/96hgurMyCTnR0XSmLoNc+3Mh9SAhZinzFJGw9rE7OsQFwl6ObwO+A
	zTppyNx2gwbqNOMig9xgJo4B4rKBbOZyt4xZOe8eEo3x23d7rhjbPVOZ0Oq3zIBb/tLkfBUNf6I
	aH/Iz58x1lVe6OYZ9YrJ9rvUW374qrdEY0KYxrgCuEgA=
X-Google-Smtp-Source: AGHT+IF4qATvDre6u6qGxJpYoTmNEnWQPDRN/r6SU3PDoCmwqsWf/nprS83Off+/UKEsllsPDLcmHw==
X-Received: by 2002:a05:6000:1a8f:b0:3b9:148b:e78 with SMTP id ffacd0b85a97d-3c49640c025mr1893677f8f.53.1755783452615;
        Thu, 21 Aug 2025 06:37:32 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4db2ab4asm28937605e9.8.2025.08.21.06.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 06:37:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 00/14] arm64: dts: qcom: Set up 4-lane DP for sm8[56]50 &
 x1e boards
Date: Thu, 21 Aug 2025 15:37:19 +0200
Message-Id: <20250821-topic-x1e80100-4lanes-v1-0-0b1a0d093cd5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8hp2gC/x3MQQqEMAxA0atI1gaSomP1KuKitHEMSJVWpCDef
 cos3+L/B7IklQxT80CSW7MesYLbBvzm4ldQQzUYMj1Zw3gdp3osLJaYCLvdRcnobAjDyj70nxF
 qeyZZtfy/8/K+P/fTT0xnAAAA
X-Change-ID: 20250821-topic-x1e80100-4lanes-a8dd7f1cd569
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2453;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=lHxdAfx6drvAEMKHrEQ+9RA9el2H+2d4jMGmrfBAI3M=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBopyEVyr5+Lu7VVJOtZuCSrKDnpBDEskyXxS7Ru+AU
 wnUdGamJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaKchFQAKCRB33NvayMhJ0fMuEA
 CWe8PWDWYVMClSnqHKyan716akgjcWqZevHW7lAPN04f4MIdFQxsAzGkRuydfYSKdAyhvz5wQIFQFq
 QACBej2/+Mq5be76C4hx7h9E6kp5wAPyCx5tkaQarwCM/5j+kFXC3TkXz70Kdls+p5vO6rlnYFcT9N
 hleR/uWPufkxS+OidMnfGAetGBB9EpUJYD8FHBCVJOmq12A3tdX1U+0uLFwT8NwqQyhgHveqfUV49F
 1Wt++Oo24gpLWlYntubNDC5neKdKCk48C4j76RZdH8GF2pwhHgwhdAWkqfeOCj/xsjKkqnQPPX0lUC
 OoUwdI6SsHbPzmPxducP04WbqoP7F3+eflfzlsLYjWng0oyOWwIdOKQ1Zf8IiIO2OWGLuh+LnjtNOt
 TXKSRsiGos8bMKGjM0VfnFSzXA2AP2n5wPRZeoFOnUpV7My8MLmjeFGT8IeiyzpXbY98J9A1uxzljp
 j/q8cilvImv37QhQ/mRexu+ai1XTE1UHhnzqGjffrrf4DP5q5+ZRtXqZ98vzgBs/RB4/rjbgRtXZLq
 Onl7hDef9ECFfYdFl8nQbgvfoH7nYaGP3L8eLYBiJHQCxgJpoGVV6IucUvF4Gjbm2wUt9Xg04PMt6w
 cZ4T4XvIO9hO9Uuh8YERZ12fNLuhLil63a9yeBJsxfYmiPx14EbtGSIYJG7w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now the 4lanes support in the QMP Combo PHY has been merged in [1],
add the required plumbing in DT.

[1] https://lore.kernel.org/all/20250807-topic-4ln_dp_respin-v4-0-43272d6eca92@oss.qualcomm.com/

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (14):
      arm64: dts: qcom: sm8550: allow mode-switch events to reach the QMP Combo PHY
      arm64: dts: qcom: sm8650: allow mode-switch events to reach the QMP Combo PHY
      arm64: dts: qcom: x1e80100: allow mode-switch events to reach the QMP Combo PHYs
      arm64: dts: qcom: sm8550-hdk: Set up 4-lane DP
      arm64: dts: qcom: sm8550-qrd: Set up 4-lane DP
      arm64: dts: qcom: sm8650-hdk: Set up 4-lane DP
      arm64: dts: qcom: sm8650-qrd: Set up 4-lane DP
      arm64: dts: qcom: x1e001de-devkit: Set up 4-lane DP
      arm64: dts: qcom: x1e78100-lenovo-thinkpad-t14s: Set up 4-lane DP
      arm64: dts: qcom: x1e80100-dell-xps13-9345: Set up 4-lane DP
      arm64: dts: qcom: x1e80100-hp-omnibook-x14: Set up 4-lane DP
      arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: Set up 4-lane DP
      arm64: dts: qcom: x1e80100-microsoft-romulus: Set up 4-lane DP
      arm64: dts: qcom: x1e80100-qcp: Set up 4-lane DP

 arch/arm64/boot/dts/qcom/sm8550-hdk.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi                        | 1 +
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts                     | 2 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi                        | 1 +
 arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                | 6 +++---
 arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts       | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dts       | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts    | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi    | 4 ++--
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                   | 6 +++---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi                      | 3 +++
 14 files changed, 26 insertions(+), 21 deletions(-)
---
base-commit: 7fa4d8dc380fbd81a9d702a855c50690c9c6442c
change-id: 20250821-topic-x1e80100-4lanes-a8dd7f1cd569

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


