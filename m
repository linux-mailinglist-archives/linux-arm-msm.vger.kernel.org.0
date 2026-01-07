Return-Path: <linux-arm-msm+bounces-87766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF89CFBF49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 05:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 25B0F3004ED1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 04:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F19FD1F0991;
	Wed,  7 Jan 2026 04:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rj2aSXGQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46995245014
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 04:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767760228; cv=none; b=s6+YRU7ahgqeoaPK59UxwWQbR7RlTpa5/mqlWhZwgnOYyqWlMVhNGBOX/RDqGxL7vio8i5Glq18XaUfT0+9MGMrSFu2WyWLNkDgOoc8KNrZGze2ECkhX0Dc/wVt3HlE8VbA4GdTD6m9+ytIE/dzpnTWSYwALj9U1zmj4ciWXqdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767760228; c=relaxed/simple;
	bh=mFBlVTtzp00BaXoK2yZTxbIFjITCpDcTZf7YqipLQh8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BicNbJBq8XvEdh+K/vsy3mimvdys/L1FJDmtxg4pNMRjEypJyIZuhU3+7G+T1FJWaqU8radA8ZCBXkgr8FZkVKcUCF5Y4G3C7+19924r8U0H1uK2zH5UIApY3ADHizY5MPj2qw0QEu+9ZccU8S3KkDkuOjRKwTAyqHU9LF3qXQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rj2aSXGQ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8c0d16bb24dso142230485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 20:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767760225; x=1768365025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vjqmy0z0jiJgb0IP9VPWG/UxXGi+niYlzDLBBTv0BGA=;
        b=Rj2aSXGQ7IbYUdl5c6kHvGiivmF40dU8AF9z+yCvu8AQaBoJ9LCJ7ieVfhjTYwuARx
         tw4ceQG+OoXBKUvhA3zmBNcDPQ3P6uNABQTbMTnUTuIuVBj9KkUaIvHRo3F/dIvWiHfO
         vozJyOZZQuNr0oI4lIGVk+WZU+d0GJ018pTuHCIGHZJAdo4AKZg2vh9ZsAcoVSa3DkL1
         DVLV6ajn+YlDmFDN2JYBu/oRtQsYw/gNKCVcTnWxexAO8PWYFWNRhGau18rzqHy6js9S
         t9lg41gPsO+ESFDcy9Rt+OBCm8GC9rwgpQWaw4ZBrs0yuFZ/QsX5G8i0QF5eCMG4r8iE
         qf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767760225; x=1768365025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vjqmy0z0jiJgb0IP9VPWG/UxXGi+niYlzDLBBTv0BGA=;
        b=YjIShxPNwVH1VJcAxg3eVr6jatHFGNVpBTwr0J7exfCRdw/n1o32LVemL6GskCX9gf
         9tOj7T0o8QsCB6CgE/j7MS+K+fWFxmghAH+Fu7lIYYg6pOJlUwzFcxENdz4uDKEzKcqf
         Q9tfc7siIhULPVSdb/j9/3kRoF5VSjm1ohPOK+xV40rBIISwR9utXZ13YbNxhHJc78nQ
         MVPuW0dq4ee6U3zwcNDGrMhQ+00tcGS1HBRRmpndWeAPedTjKuGb7YgqwVj/9gC8uZI9
         FoZYm0Nxm/XZ8Vn9mog0n7ZStSO16FsNUWCYcTEOhzde0isSyH2NsH/Qyd0vJsdzpwG5
         w2hA==
X-Forwarded-Encrypted: i=1; AJvYcCUQyGqjLtZRy9IJm1CXWP1e2v0Z0Tnk64S9Y9R+lqQUrQx4lDL55FaXumHZuj8EM+eyh3YyyHI/qDHBfv8f@vger.kernel.org
X-Gm-Message-State: AOJu0YwHXsYzRlYbEdYQodPdWBhAjHOgilEbb4p2jEiV8dWwF15UWZT3
	sjXEeHnU4O4itWk/d1fV1TWUTbE0MZRuCq7F8+e7whoD3GSXqysKGj/z
X-Gm-Gg: AY/fxX7GlI7FOchauwnTgjVzqMfPGSEDrxoxvJR0cWpX4mfVJpqX2wuQBwwxvqxhi/n
	pisjpryyurdCbDvmluWAS8oST1xvBANLv+Xk7JsipCQrLLH5eM+rlPvwsjAd+oxaCba9vz8OJGa
	8S2Qg6k81oR92nqhS2IOhji1CssKkcbImWT0k3vsh8in27KxKwl4uZaQwEkLM5KON+Eune/0dv9
	7GoSqLK8GHGyoPpxtu+aXY3AMg58Cmhb7FpJD7me/jvjilQN6Y6weif6M9raz+w97iG8d+IYwcQ
	436bcGmkSLnLaayEJ+oRuOOe0g6PhNTHfyfXZX8DOCMv1UtRrHQYvtJBGu97ZCnPKbRqe1KdB1h
	tksBHhnUXlboL0VTvR5yHqv9HHOtNokm4KgFz+aWIcd1Egr25l1wNCHRkR7tP6mktMYUWfh1elW
	541qKxXpvNOJ3NVemVodSZuUoI
X-Google-Smtp-Source: AGHT+IGroQiMgOTUWnCeLErhMAgP9MbRM3nadgyOKKV/oSklxmSYLQYknud4NgaDkU9+xNTfkN7kEg==
X-Received: by 2002:a05:620a:2807:b0:8b2:77aa:73c8 with SMTP id af79cd13be357-8c389368b60mr165162485a.16.1767760225160;
        Tue, 06 Jan 2026 20:30:25 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cee9sm300492285a.27.2026.01.06.20.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:30:24 -0800 (PST)
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
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v6 0/5] media: i2c: IMX355 for the Pixel 3a
Date: Tue,  6 Jan 2026 23:30:39 -0500
Message-ID: <20260107043044.92485-1-mailingradian@gmail.com>
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

Changes since v5 (https://lore.kernel.org/r/20260107042451.92048-1-mailingradian@gmail.com):
- add Bryan to CC who added a Reviewed-by

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


