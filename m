Return-Path: <linux-arm-msm+bounces-84285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD56CA24CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 05:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 160723064780
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 04:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABF5C2FB62E;
	Thu,  4 Dec 2025 04:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ALueFDjk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA77433EC
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 04:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764821716; cv=none; b=NdJByFYMiHNRdxdwh7IjNIdknr0o+lEFtYiDbKX876cJF24PfweAcaD+n+irZucf9BwO58oQvue/xmIollgWRcS0zvg5pvUPX++wDgw8iGT5Bw9bo1mIjo50jOr1aHe2GX/nAoVkwJ2QFTKMXlaBwmhvcRIumlpgpCfvMa3rbG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764821716; c=relaxed/simple;
	bh=KQlLOeYKQLCbucDZVV2LbQztFK2UUaQZThb/9dchSog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJ5d0NWQdp4aEO9YkJcxd5A97lPMhe9pHcbNp10mjuBZifNpqCmQJqhFtau76jLh/iSQZl9Hr5UDQ76x2/Pjang/EFmbWjnUdoVZGYqBpEioSm98ScPpuqV0uBRzFnKMw+VnOXUh5VTo0AwZdLFpoNlLqhGChL44T3LukeqMtO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ALueFDjk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59425b1f713so21177e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 20:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764821711; x=1765426511; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/aKyLPighVmCzwn2uLwvmmfEWg7/kV25SXg9WbyeIk=;
        b=ALueFDjkPUJvV/Lz9iWl7ROU8aihvA0KU7xSPu6B8fz9m+p/NOh0aU6qckBq8QRoeD
         fAfLfzzcUYFqwrcYFfZVJux8mLZgnWKVdwuAj27caLXi1e29Y4LLJ3lYqqGtkCFwvQgQ
         DKooNSIuRU4+vve08njVOfhKqlMAppv+Nse5XJSDaLMGdl+BftFA9wwlTSG2YBwRHI7x
         XYBwTYAn2FrUQzRJqg4iQDzFRxzJiIl3oH+/Jo7gKfZSY2mDLyEtKScP5xcvOb9ZTYRH
         rDJJtJwO7VGjU61S8kunoNHoKTF9HRNJeNTdH+gBTWawDG4qDUuAjROaQRKOmICsuJU0
         0jiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764821711; x=1765426511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/aKyLPighVmCzwn2uLwvmmfEWg7/kV25SXg9WbyeIk=;
        b=Tu58wXpbd5eGpMce2JJbfVRGz1kBcrrKRCVQHHEyvgSScJgTF4ukVsZbF7Y9Oa33/F
         3Ns3rZIfHmX65KOKI954eKOd5KgsB/S4PkT/cfeWcICmaMdTOizw5UOigUh707dJWWQt
         7q2HY2FxzeMaL5t9iCm3GeqWfoCfR83f9QQMqBA/opuf0ovGd6H7d/bynXq4IGHzlQgE
         8FOYXG0OSS6XieIppRENqLWqg2R8MIbfld5+kB6GHbhbpgpguXrmwCNlmI5bhaIDdiuy
         UkPujJqgsaXAypacIrY5HX3VENmWVzw6ZLlQmiEuQvBVUEWcIJy5/MEkK9MLsiL/UaJn
         hwIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsVdyRQbYPv+iMv+erxvK8nm7offaOGI4hIpOgBveb3Xf688kMHoxEEHd2+lJmU26Mha5qxs4nPfrPfwEb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2v25yL004+irO15LlBCrzhj1O7x8qqBmjOjZGNFl2rNvAAAXR
	rnkTrseg1Um6cNjjdxlrcLNyIrVOVj58r/K34I4963SneKwnio39IR8584hJm39HPwk=
X-Gm-Gg: ASbGncvmIGgTY8s4iMT7i9OEyM+GV5twa/F9522GIKD+TNRUeCZdbarS1qAvHbZ1+6p
	ayF4x6OpfrYET0ZRxd6ornWOqkH4yN235UCLt6WhSmouHRXuW0XyVxxP0L+7XmWzKmJQO+oxFpL
	4xELqg3gnKMWWQALTrwqnw9RXjxXVsvH+N5nOAkYkdvOlftuRa4ghIQLjjugFVvTFCI3rzsE3PK
	H0Lmd7T6SkXdNvSyNjbRago5tbT0McCIIAs2Q33fYUWp1KhVYatiNJEB+kOkDGHdANHp68cLLgR
	BzKejP26a/L5sh5KpGfsm9UVQ0H8KOZg8OSi8P1bxLONHOLhXiodjLmQztZsDGX1qwD80NjZR8T
	X3i42tQD736psMJWfpGdMOEOz2h6Fz6LT9SOBKW3xBflvkU5vOVLJL4gtlC6JqwsN1uOpcNShvx
	+5sdqEdSXAqdcdMivmLg0TkXKIcBuv6y114mznjvEqv8IHxlBQLyKzjA==
X-Google-Smtp-Source: AGHT+IFD5IspNPkijfGLwgvUbmnCal48Gg9s64XvOvLnn+DZMDY+lsae9jVH/iHMIeVcnudy+Pxzuw==
X-Received: by 2002:a05:6512:3f02:b0:595:9d91:1bdc with SMTP id 2adb3069b0e04-597d4b48eccmr878898e87.5.1764821710525;
        Wed, 03 Dec 2025 20:15:10 -0800 (PST)
Received: from thyme.. (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2a1sm67649e87.64.2025.12.03.20.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:15:10 -0800 (PST)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/4] arm64: dts: qcom: sm8650: Enable CAMSS and image sensors
Date: Thu,  4 Dec 2025 06:15:01 +0200
Message-ID: <20251204041505.131891-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CAMSS and Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC
boards.

The changeset uses v4 Samsung S5KJN1 image sensor dt bindings:
- https://lore.kernel.org/linux-media/20251204041134.131707-1-vladimir.zapolskiy@linaro.org/

Changes from v1 to v2:
* added Tested-by tag for the changes tested on SM8650-QRD (Neil),
* dropped mclk-pins level from MCLK pad pinmux descriptions (Konrad),
* moved 'status' property to the end of the list of properties (Konrad),
* renamed supply property names to match the sensor driver changes (Luca),
* added blank lines separating groups of properties under isp dt node (Bryan),
* removed an optional 'data-lanes' property of S5KJN1 image sensor,
* rebased on top of next-20251203 tag from the linux-next.

Link to v1 version of the changeset:
- https://lore.kernel.org/linux-arm-msm/20251023025913.2421822-1-vladimir.zapolskiy@linaro.org/

Since SM8650 CAMSS driver part is merged to Linux, it makes sense to group
all dts changes to one changeset, 1/4 patch in the series is taken from
- https://lore.kernel.org/linux-arm-msm/20251017031131.2232687-1-vladimir.zapolskiy@linaro.org/

Vladimir Zapolskiy (4):
  arm64: dts: qcom: sm8650: Add CAMSS device tree node
  arm64: dts: qcom: sm8650: Add description of MCLK pins
  arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
  arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay

 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 .../dts/qcom/sm8650-hdk-rear-camera-card.dtso |  88 ++++++
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts       |  43 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi          | 299 ++++++++++++++++++
 4 files changed, 434 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8650-hdk-rear-camera-card.dtso

-- 
2.49.0


