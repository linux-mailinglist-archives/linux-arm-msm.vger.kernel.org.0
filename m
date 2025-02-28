Return-Path: <linux-arm-msm+bounces-49775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8622FA48DB9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 02:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8645216E740
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 01:17:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B244335280;
	Fri, 28 Feb 2025 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnV3gaQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD3A1CA8D;
	Fri, 28 Feb 2025 01:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740705417; cv=none; b=uKKecew10cNj6dpFje+I6KwoudH/fGZBb2hG9txeHE9Z6xPKE9zRR6d7S0pSxsgf3974KvrBu79TWVuunWU6pNbgTu7HqqQI4ZCB8sNLEN3JKNqyCebFRCuVN/caX9Ze1sa8SdP6UgYfyKGLt9l+g1Xu+oHt7SR6/i8OK8s1+cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740705417; c=relaxed/simple;
	bh=+IZmiwUM5BxihveDBxIS14EjXj53quT3A2UpsKE3fAk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jUTCjSyHYHIcERC/p6v9jTc24fS4zApe8t8+o+kDz0Rd7fAUcTaPJgyEWRZWszzfmOOVN69lJHZnrQCwuCQUDauNjQ27JdrehUxK7PYP01AfC6DwxjaZGiW6r+vVk/A/klD6yhJF6bg5i8xIxIxDglGVaeFUlX8k22vcMouuzV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnV3gaQY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-22114b800f7so32174335ad.2;
        Thu, 27 Feb 2025 17:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740705415; x=1741310215; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0FL8GbosrI5o4UuvV7kTaXlK9ze1FkkxA8BpqG7bFWo=;
        b=UnV3gaQYPY44g/95TsMPHVUyteo5PwpoydK87RiA/WF+WOTmWuwjBSZd9iQtFZ+DJB
         MjRi3rRyP4kjHQ4+/7xIE8dRM7ckDkN21aIcgr4phXVrWlZWRHgjzOL5K/4KV0odOM1X
         8vR/Bg4qrOHVk9ujt02e54M4rRpp88V0ctNSTkA09Mjzw41+kW2xyccLFcNQAr1Mciwh
         Xt6dcpVmI64+ksTAkb8zPGASgxCzbHLsKeOOc9HDQ8LsM5rJSWYsGRExC5Qqq/cqti2j
         8eAjb8J8h5k0rAtY9jQjhR0CrqfJWwnlF9XXqDqhC0Qs/T3et8s7astRYvwCIr9rpesE
         p94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740705415; x=1741310215;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0FL8GbosrI5o4UuvV7kTaXlK9ze1FkkxA8BpqG7bFWo=;
        b=f4P8D79aflgbj/WOymqkMEdN6vovVslC0zYfFhmDY4lWEQN3zmsRzz5+5h1Xh8WHC2
         u7XigOqF2h4QqNEREfAZ2qBzGg6hrQ+6n935xwERA8/eQUqnNN/GOLbOVaJn2EjSbPlc
         1/D/YUj7yt6OVuUze5/tsoZJme4XdIERr4u+12wREWO9Jmo6gJK2VKAXtTglhXpFb7N0
         uMk/MJHRGFEJ1DLt6V2nPXtZkH0B7e+dHaoBpl/m3tbVn3vvQCNUmssw99JlU/iO5EPe
         5iiXqjmc45esof8uAgDjb5uilVLjiSWVtR2M3oP3PQOzZsmQ4C0t1kfPB4l26TVVt+Ma
         3whw==
X-Forwarded-Encrypted: i=1; AJvYcCU9FCoSkz4l35sRzzYLztQqbrD8+qG9sPRqKES8qm/JNx3dM1b7eZD1+Guceo8yS9NGvPQPjGX6OXyn@vger.kernel.org, AJvYcCVDRKPMs+8shksvPUS3wXPS7NuLVZSrLO9a8iz8Z+g4S8hWnB6aQa23sEXxS9KxAxrW2s2zI+EfO2ykyhQt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+xq8bsUUECyhJgUPvASQEyclzGQDgEuVnbxaRFz9aRk+0AJUi
	2e72DFv4RLi366pd/BO7tIwskOQ9gl9u17KF3q6v8mv+vPEJ1mkz
X-Gm-Gg: ASbGncu/D0rH+XcHBM6SsAOCHeC7CDNHdv08W9NmL/2rj57Ss5fkexkSSZKo2WJuMth
	gzYI7CyjB+ch78bLgw+4Cn0SDRZ/SKPc+0cgDlTVltH3JO77+4DZOd0ibJ67AY8NTA3e6AZZr3h
	LolgpRownOgBMvW7e2VGqqHG4zM5C9MvMbT6JMLPCD8MUrE6hobS13FyuFbWc4o4QEr2S3whcBc
	J28+CVrGWHD0B0Nv9pZXMAqhUyEB5A/p2VcOTESh62TQmBSqgxUryhX5FNLW7u1b6kfdlhcrOmr
	ZRNx03gY/sN67Mz+yvwP2iBE/v4=
X-Google-Smtp-Source: AGHT+IF7UBcghuRpvHNwzqLzMPxjGhRuIXPtaSRGWd8JSOclzWjS1AJmfFqr8vF2CNwrCBO/MgbQWA==
X-Received: by 2002:a05:6a00:1a8f:b0:730:8e2c:e53b with SMTP id d2e1a72fcca58-734ac3311b3mr2481892b3a.5.1740705415396;
        Thu, 27 Feb 2025 17:16:55 -0800 (PST)
Received: from [127.0.1.1] ([2601:644:8501:1640:aece:4d21:7e89:e9e0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe4ce55sm2535901b3a.68.2025.02.27.17.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 17:16:55 -0800 (PST)
From: Rudraksha Gupta <guptarud@gmail.com>
Subject: [PATCH v4 0/2] Copy tsens node from apq8064 and adjust values for
 msm8960
Date: Thu, 27 Feb 2025 17:16:53 -0800
Message-Id: <20250227-expressatt-tsens-v4-0-d70afa5a1fd0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIUOwWcC/4XNzQ6CMAzA8VchOzszysaHJ9/DeNhGB0sEzEoIh
 vDuDk4kGj3+2/TXhREGj8QuycICTp780MeQp4TZVvcNcl/HZiBACQDFcX4GJNLjyEfCnrjIa5m
 rstCqlCyexbXz807e7rFbT+MQXvuHKd2mP7Ap5SkXIA2iciBkcW067R9nO3RswyY4AvkXALjgh
 ZYWM12lDj6A7B+QRcAYV1ZlbdAqOALrur4BWo1N1TIBAAA=
X-Change-ID: 20250225-expressatt-tsens-06d46587a584
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wctrl@proton.me, 
 Rudraksha Gupta <guptarud@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740705413; l=1273;
 i=guptarud@gmail.com; s=20250208; h=from:subject:message-id;
 bh=+IZmiwUM5BxihveDBxIS14EjXj53quT3A2UpsKE3fAk=;
 b=QVBiuo2U8JZhDjRmovkhOCwn9XzOfnfxKU3QziuDpJIduIwHuUxXHqiRTlSjAN/2t//82lzMg
 /x7D/zAmjbhCHnL6gztlx5b6R910BHC5maVeKyTDLA8a6+EdE+oFehe
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=5lJNaiR/Bu7edToWFLriO5zXOrVqSQWrBKbAKwuEw04=

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v4:
- Reword tsens commit message
- Add critical trip
- Link to v3: https://lore.kernel.org/r/20250226-expressatt-tsens-v3-0-bbf898dbec52@gmail.com

Changes in v3:
- Add signoff to dt-bindings commit
- Describe which values have been changed when copying over tsens from apq8064
- Drop wctrl as they want to remain anonymous. They have been CC'd as acknowledgement
- Link to v2: https://lore.kernel.org/r/20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com

Changes in v2:
- Remove coefficients as it's read from EEPROM
- Fix dtsi formatting
- Fix dtschema warnings introduced with v1
- Link to v1: https://lore.kernel.org/r/20250225-expressatt-tsens-v1-1-024bee5f2047@gmail.com

---
Rudraksha Gupta (2):
      dt-bindings: nvmem: Add compatible for MSM8960
      ARM: dts: qcom: msm8960: Add thermal sensor (tsens)

 .../devicetree/bindings/nvmem/qcom,qfprom.yaml     |  1 +
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi           | 71 +++++++++++++++++++++-
 2 files changed, 71 insertions(+), 1 deletion(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250225-expressatt-tsens-06d46587a584

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>


