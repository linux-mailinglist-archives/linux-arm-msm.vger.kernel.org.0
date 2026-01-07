Return-Path: <linux-arm-msm+bounces-87761-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8C1CFBEE6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51FDB3026872
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2B922FDE6;
	Wed,  7 Jan 2026 04:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9tCHjd/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FCD1F3FEC
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767759874; cv=none; b=uB80Rfb6xIgeokn7R3GCPsC8RE6QmhwRzW7BFEdJPiwK+bvhXXycKv6FbhZhDYK5c+5kDtlMXvoysNLVMojRrQHbFldAqEpT5OImx4ELPPPwZfogK2faIr6u9Qm7aEAxEKvHkIfiOI2CePTba0/+isO/VDtPnxgl7NzOHzsqRWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767759874; c=relaxed/simple;
	bh=QoEydU6h2r0D0PwDBN8+9gzv4tzYc8b9zBCcJbvkw1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fST1tosYyBwoXaMY5WntoyC8dtdRVWOLgK6XOC+rVQdGIj/UcCbLlytvAK8TQ27fOcErBhc1SsiovwMnPilVkAOiXyJfcRnmCDaq1jInhYV2P4lyfEOW8UBl27+ydjCpn0mGFG4NOW69mGqY+ubfj7yc/AqdryZQVPGlD9wFG5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9tCHjd/; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88a3bba9fd4so15599436d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767759872; x=1768364672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=foLR2dTcYP4XS4NpABZxr5kZsIpw5l3lYiCp5Kd5N30=;
        b=F9tCHjd/T2dUKdBmEZyjwrxPrzEGH+q472E6QgXTQ6IskzWEgtJ/5rSywo/JIghcpB
         yxCZTo2LN3ZoHt0O8wBrlVJovOddOrb6hMJLVrML5IjIOQdv9IM02PwJpqO7txrZQ8Ar
         TH22kW6MpuJzrU7bwtCupTV+Kdmo25DvdTr6eafIvb0dlsRmz7Kygvf506KN4YVT4hRC
         YAZyRt4fNbHLNxhZH9XjllYDW31vDaVIQzFV3JYWLhuXxyXWSPj0UCELHNX9YZRlTaNx
         z6sXyF8CoGI8xcGrxIRB+dgTN7tluzezgLCSWPrLti7aPmqYDHoJwMXW/HyuPeOJt0OE
         RW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767759872; x=1768364672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foLR2dTcYP4XS4NpABZxr5kZsIpw5l3lYiCp5Kd5N30=;
        b=B+LHwdcihuM9EgtCigxzubwhqnhjPvlt4mHaq6/5LOpocVMiTQLngIHMa0yxM+fXE3
         dZI9gqBrvhs4JL2CfdXql09oBCKULzZZm4142koV2Z3bYRLgIIQFkPexW0iZ6nglvoeF
         OSW9bUbPd18sTwsSNP0PbhTSvwI7xHI/RprLI39o1drcsfaiUj6mGyMGstEHcYweYTOj
         +f8OPymXp1ZmwQWnEwjHfKk2BPhs9IKm5YFoFL7Wi1irVlTJFOA3occ+k6h4nXrkkvKw
         Ae4JIHD7Rc+iFSyF96xA4w9SZeBtDK9vojRb384qKJ23ExWCy6/uivCOKGpCD3TatAzA
         BBEw==
X-Forwarded-Encrypted: i=1; AJvYcCV0i/tCdqLR+XL5WCsE0Aq0w3xUs4E5UQtDI0FPlqvZFALYCkoM6s8qk3rjJxgv0DQvUoETnGcbDxmFIQUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwBuLjPyAy3fT0kHF1Vy5UaYFHTjYFnkxvrlqVP7bbWXFBWQymr
	YYqH+EkyQH648c8BtMn+XAsrgrpfhodnr4XyLfSSJqmZ0Li9zgc8XIEQ
X-Gm-Gg: AY/fxX4KP+LEmQAIngqkHyCBc0ZJ9671to4+vVpF36NkZRg2AZJpmfFvpPduYc5ez5c
	XmENtZSD3ZwG9Uh+SrPlY5OUFQ0LTb0XEQZsGt3qZwRa+B6Obp8bB86gkYqUIbW71alPCir/8yZ
	0D2XV2qmuuHEM5XMwmlIom49vJZqaTq+WuKKsiXzlby6AJk9CZIRcEljt7OOfJF4suUJ22bQRom
	D7/1ghotl6zXPSyaZu3oFVGkAdgef1NuyzR6y79bSol0UzxBCiA3qK+KG61sJbfn1FU5rUxGwgP
	eaqoEThbP+aCOaHZw8yEvbPpBCxy4ueHG92aGBMdEbS7v6rPsuSObxSWzHbG6Gk4ah0kG/cl9au
	turY9iId9UYYR3MNXzS+xtaduHv+yaeBtn9ZojB+sLVmhoRwWn9QF3YLnObySQywcOu3+aCHOQ/
	Ja5AwLma+snCsOPg==
X-Google-Smtp-Source: AGHT+IFMcPjHVkeZMdl9Hl8GA7wGzaPseWw7WxemviJhy/p7asvPmy59KOUjV7qnXWUC1pZBy673aQ==
X-Received: by 2002:a05:6214:5f03:b0:880:4eac:8689 with SMTP id 6a1803df08f44-890842709cfmr17306166d6.57.1767759871920;
        Tue, 06 Jan 2026 20:24:31 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e472csm26596296d6.23.2026.01.06.20.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:24:31 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 0/5] media: i2c: IMX355 for the Pixel 3a
Date: Tue,  6 Jan 2026 23:24:46 -0500
Message-ID: <20260107042451.92048-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds support for the IMX355 in devicetree and adds support for the
Pixel 3a front camera.

Changes since v4 (https://lore.kernel.org/r/20251211014846.16602-1-mailingradian@gmail.com):
- add NAK from Krzysztof (2/5)
- label the camss ports (3/5, 5/5)
- define endpoint properties correctly (1/5)
- use devm_regulator_bulk_get_const (2/5)
- remove clock-names (1/5, 5/5)
- set reset GPIO as active low (1/5, 2/5, 5/5)
- explicitly drive reset low at start of sequence (2/5)
- make data-lanes in endpoint optional and start at 1 (1/5, 5/5)
- add mclk3 pin (4/5)
- add Reviewed-by's (4/5)

Changes since v3 (https://lore.kernel.org/r/20250905215516.289998-6-mailingradian@gmail.com):
- separate camera mclk pins and move to different patch (4/5, 5/5)
- remove polarity from rear camera pin (5/5)
- remove output-low from front camera pins (5/5)
- mention effects of dcf6fb89e6f7 ("media: qcom: camss: remove a check for unavailable CAMSS endpoint") (3/5)
- specify single clock-name without items nesting (1/5)
- rebase on 49c6ac166cf7 ("media: i2c: imx355: Replace client->dev
  usage") and eaa7d46d9654 ("media: i2c: imx335: Use V4L2 sensor clock
  helper") (2/5)
- do not use of_match_ptr for OF match table (2/5)
- remove redundant GPIO validity checks (2/5)
- describe endpoint data-lanes (1/5)

Changes since v2 (https://lore.kernel.org/r/20250714210227.714841-6-mailingradian@gmail.com):
- use devm_v4l2_sensor_clk_get (2/4)
- require supplies and clock-names (1/4)
- move unevaluatedProperties down (1/4)
- disable clocks as last power-off action (2/4)
- use 0 in gpio pin power-supply (4/4)

Changes since v1 (https://lore.kernel.org/r/20250630225944.320755-7-mailingradian@gmail.com):
- too much to have a complete list (1-4/4)
- squash camera orientation patch (4/4, previously 5/5)
- squash driver changes (2/4, previously 3/5)
- remove labelled endpoint node in sdm670.dtsi (3/4, 4/4)
- change init sequence to match other similar drivers (2/4)
- retrieve clock frequency from devicetree-defined clock (4/4)
- remove clock-frequency from dt-bindings (1/4)
- remove redundant descriptions of child nodes (1/4)
- switch initial drive of the reset GPIO to low (2/4)
- set mclk frequency to 19.2 MHz (4/4)
- add vdda-pll supply for camss (4/4)
- use common power on and off functions (2/4)
- use devm_clk_get_optional (2/4)
- remove extra layer when describing mclk pin (4/4)
- rename regulators (1/4, 2/4, 4/4)

Richard Acayan (5):
  dt-bindings: media: i2c: Add Sony IMX355
  media: i2c: imx355: Support devicetree and power management
  arm64: dts: qcom: sdm670: label the camss ports instead of endpoints
  arm64: dts: qcom: sdm670: add camera mclk pins
  arm64: dts: qcom: sdm670-google-sargo: add imx355 front camera

 .../bindings/media/i2c/sony,imx355.yaml       | 115 +++++++++++++++++
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 104 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  46 ++++---
 drivers/media/i2c/imx355.c                    | 116 ++++++++++++++++--
 4 files changed, 358 insertions(+), 23 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,imx355.yaml

-- 
2.52.0


