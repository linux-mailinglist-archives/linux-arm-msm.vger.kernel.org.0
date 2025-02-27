Return-Path: <linux-arm-msm+bounces-49729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A9AA48465
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 17:12:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5142F3B730E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 16:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDA9D1DE3DC;
	Thu, 27 Feb 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OqchTtQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2B426D5AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740672276; cv=none; b=NObEkJLfXRvnxZfG35EFL2CaA7gpFLd1kDfdAHV/OVoMu2rrAJDfpsAfJOYG8hB2CgEqhYeT4PVVoxNUGny4WYxCLp4itkiuqROXz0GrTGbX89eZj43xK+sYap2zgLJBUmiEoL1eobx1lhKTxFGvMoRqqIMUwUM3ME2jrjtkKqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740672276; c=relaxed/simple;
	bh=avp5U2ArcxVFxLs1woTW98jIWChVR3WUm7VeH/MWMhg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kZ0+Ql43BZ3JAwzg31S+LyNvFKHhXPu+5uJrupOdVmKNlURGyc9v6S4nxaGiuYhVgoaZ9d49/K6gS7bK5TNZgpkJNKIfM5J2BKBaYovNjtJq6+yO+0Ak6WeF6Inho20hreS0l9vugPl0QklO/A+2mEu6krTRfrtk59kYzKSlSmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OqchTtQS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43995b907cfso7617795e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 08:04:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740672273; x=1741277073; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+LpVcR+tgBc8Za0a/AHb+X7CyJqNO2eqvlf4iMe7ONs=;
        b=OqchTtQSP7Z0igSzK4XYl0k2CqBLm4xe6PqsD17AJ89PLCGp+/q7PuaGOwwk+v6ZPi
         tIsEQBwAU9WbAOZaE22RsZxVkEMw7hkNKAvTjbS7DWQyD5JdZZScarn7e/cMGj0t1B1G
         dSJudeRhPNf7e/FbW80Oll7dZvHzXu5MX81RDUKMnjEQaZtal5SB7G3Km0q7R9Of1occ
         jqwvjlJRHdbzjc7LlbI2SdJYvXaHjjgob4f6ZfSUxad5uyGFZzdE+C3SVNLZzTmmngFq
         ZneK8YlQiWOErpZghdwXfZ2xjZQy8JnXigNQEtBXdJcH6Rw5cm2mlpdPVkyIfTBHPOe6
         feng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740672273; x=1741277073;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LpVcR+tgBc8Za0a/AHb+X7CyJqNO2eqvlf4iMe7ONs=;
        b=Es9fq2PWCxGeGNnMQLG+5B2Eh9bIyNss0sqpH09FU6lWrZObiTvnukx/W6a61sh9dZ
         R03bQufcBeODx8Z6txmUcg4X/tW9wf3UgpYufKMXCW3CkLGMLZAB431VWIuzSqEWlw7M
         x3wmtSc7TmpCYugdozrAOkmZi4mgKu1e9IMxH6cHkqigG64hZscVRATfxO1LCUV32PPu
         0JxWdoS7L0c+BvY6Fhlz5zC2c0F4muRSy/+4pX6Hu8v9Hs95ViI0tRbyVWHkKSqaiJ1Y
         AopYOCi5jacX/5HZ0hOGIi31635d+FNXXkUK89lFNNymEviT0LvYALvKyXjo/64830xH
         y7DQ==
X-Gm-Message-State: AOJu0Yx6CTkcB7JjRvSQPXb+IEOmSXrb5rzJZhy1cUxamHsklv23qiTC
	IthJMajPnswTqlL/vX2ek7Y5/ZAbsDhVbaEaKeTjoGdfP/3SGyZPZm2gr1dk2K4=
X-Gm-Gg: ASbGncuvjQIGMSat2PqId2i7DJPS88Q/io3wlBgnkwc5uIr+qZGvSKjSxNuPTOQ1+rZ
	fLQovoUPZeTs4mQTCB/Qs5qjzstDkSAq4KRN8pYiOA8rzCLn5f4Q841HXT3SFQO/tnnywrK9fo3
	zhgKG3K/hkYmDm1aKIypz325zDdB0TXnABiqjELrHx1Sqf0KT/MOCkeJ3eESuTpqqoGrpkv0xWi
	V6Ujhiki6VFB3lMxDRkmKr4ss8fJAuf0fW46rhk2dtdQN6x7viMV+r8/qR4YG/iLbIRwK7P+0Ml
	mGXEWU6tk7/9dkQCiiq+DeRDFSJGSQ/NwFIKUW2zK/Efd+A=
X-Google-Smtp-Source: AGHT+IFw1iZ8PHqDP50lbvHr/QN+q8AeRJQLFUhigT++dJwaFcXnDe88Uju6JnhPV1oUTANomVeNFQ==
X-Received: by 2002:a05:600c:1ca7:b0:439:9898:f18c with SMTP id 5b1f17b1804b1-43ab0f72a40mr91982225e9.26.1740672271515;
        Thu, 27 Feb 2025 08:04:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5393e5sm58811225e9.20.2025.02.27.08.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 08:04:31 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/3] arm64: dts: qcom: sm8650: switch to 4 interrupt
 cells to add PPI partitions for PMUs
Date: Thu, 27 Feb 2025 17:04:27 +0100
Message-Id: <20250227-topic-sm8650-pmu-ppi-partition-v3-0-0f6feeefe50f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAuNwGcC/43NTQ7CIBAF4KsY1o7hJy2tK+9hXECh7SS2EECia
 Xp3aVe60uWbzPveQqINaCM5HxYSbMaIbi5BHA+kG9U8WEBTMuGUV5RTCcl57CBOTV1R8NMDvEf
 wKiRMpQrMtqZvdCOlUaQgPtgen/vA9VbyiDG58Nr3Mtuuf9OZAQVjhFZMamGtutxxVsGdXBjIZ
 mf+4fHfHi+ebgWltSofQn5567q+AbEiOecdAQAA
X-Change-ID: 20250207-topic-sm8650-pmu-ppi-partition-1e9df8b877da
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=avp5U2ArcxVFxLs1woTW98jIWChVR3WUm7VeH/MWMhg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnwI0NA5W/VcDmKSxOz9vnKm/SSP9tv8R1FwL4IZZJ
 HLp3aaeJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ8CNDQAKCRB33NvayMhJ0QPiD/
 0cvnPMwbuPi5yEHrPD5jTZRteEMOu2YmxkdU9RWbWBGI/f3AKnL+GErxiYvD0GWWjxOJS7EuNIW/7P
 60m+Ghbjgy4RvNGLsqTL+v1oD82V3740SdQoXYNzeiDASpgnJASU09slk9T6hEJsB0g6bjI0wXUIAd
 gi+dGEfhsZSY5ieHKbP+8DcPzS09W5A566y4wmCz65aWMGEoUs+/HNci9TW3VCJHoEsrhDGenIMBKx
 b0uAt88ra0fNeujNYMM1bvLnGhHLTjd+v6uzlCKAKo0Yp7un7VeXqLkuLLtAi2peLqdZ6KOUB4sWjQ
 vgyWhOkf6tnpunCOBCDseQSSsVJDnM8Ru77iS9r6KlM3z44BlEO+y80s0CJ3CxQYb+y5dqRy193PmX
 gwsMka3WYeQkRQoYMf/NjfpcCqLuJRf/poVqKn5FJNjslKvlxMsD81l1gPwiIKqXcWiyAhFFHbQsJd
 cKPc5vRPot5fmHVuoe1RlDGoh0shx7qijOULwc8lRRktNWI96/j6OhSSu/c7qOLTIhtG6/Swl5CAXc
 pNw22ULeV3pCUA/AlwRNjbW8EP54yfdQrrtU6xSYczbzJq9bt/gHUoiXI2Bx8jqnQzDjgzVfdRpYPG
 VBkFm8gHpDb4FBKPWvOiWdFUVH32GGJ4DQUnwjUWTtVfNTIf369Chq3wgTRw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Swich to 4 interrupt cells on the GIC node to allow us passing
the proper PPI interrupt partitions for the ARM PMUs.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Add a patch changing the interrupt polarity, thx for dmitry
- Link to v2: https://lore.kernel.org/r/20250227-topic-sm8650-pmu-ppi-partition-v2-0-b93006a65037@linaro.org

Changes in v2:
- Added Konrad's reviews
- Rebased on linux-next
- Link to v1: https://lore.kernel.org/r/20250207-topic-sm8650-pmu-ppi-partition-v1-0-dd3ba17b3eea@linaro.org

---
Neil Armstrong (3):
      arm64: dts: qcom: sm8650: fix PMU interrupt flag
      arm64: dts: qcom: sm8650: switch to interrupt-cells 4 to add PPI partitions
      arm64: dts: qcom: sm8650: add PPI interrupt partitions for the ARM PMUs

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 556 ++++++++++++++++++-----------------
 1 file changed, 285 insertions(+), 271 deletions(-)
---
base-commit: 0e2a500eff87c710f3947926e274fd83d0cabb02
change-id: 20250207-topic-sm8650-pmu-ppi-partition-1e9df8b877da

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


