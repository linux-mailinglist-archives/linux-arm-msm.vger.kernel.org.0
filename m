Return-Path: <linux-arm-msm+bounces-26989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0631A93BA43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF29B1F23838
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B779863C7;
	Thu, 25 Jul 2024 01:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="sUMOaBW5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F17E79D1;
	Thu, 25 Jul 2024 01:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871792; cv=none; b=qakDdwXh+nDdSg4AoTZp3HShDQT/AiwR68Dbo+znhMpu5IlgJCqOaHzYRUt/sCAxxgBNgojqByLIAPc/FeDYNuBJ1bR1wbp6BaQlA8MomVDYNke6PmAQF988d5/9BiZY8i8LzF+gN+Mlu0z/Uz9/NCoRiKva7s+LyAdGJkAF3uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871792; c=relaxed/simple;
	bh=vYmVBCpvtUJjuK1S4BskyxbrSvWS6R1KonHMrwv+s0k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PTfD05yHuD9hdMyxVWw5TtPffqFS/qE7f7D3B/DuVOfkqwgxEL9CMViwV25md5jCJ1a5MwC1zlWA8Dd5AxcB6aO9Hr5xR/8iUR3ryPeCuB4Di2+aobz/+WpiZpP46OckUKU6ENFo/+Ie2HXIPRam1AipWZp4T6Ji/2lSJk5LNZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=sUMOaBW5; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WTtv14TR3z9t9m;
	Thu, 25 Jul 2024 01:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871789; bh=vYmVBCpvtUJjuK1S4BskyxbrSvWS6R1KonHMrwv+s0k=;
	h=From:Subject:Date:To:Cc:From;
	b=sUMOaBW5kgyLxKmCunbdSZitMvWcpl/aXxxOswqZbE5XyU++fpJIBYQEdB8GCVw48
	 YeIyHKCpPOFXjx9nWSwT90TjOKU8WbfDUGC9GoiUZAWNZKchre3kXlViwOk9Dak0ZV
	 bHY7XBsgX7kP759rnkoGK1z1wRNcrbWJzk08jTME=
X-Riseup-User-ID: F534872B322F72FB865186451BF8477CFD6DB256589820E0BF1FC632B86B48FB
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtty3Tq4zJrRJ;
	Thu, 25 Jul 2024 01:43:06 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Subject: [PATCH v2 00/11] F(x)tec Pro1X feature expansion
Date: Thu, 25 Jul 2024 08:42:09 +0700
Message-Id: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHGtoWYC/42NQQ6CMBBFr0Jm7ZgyloKuvIdhUWEqsynQAsEQ7
 m7hBC7fT977G0QOwhEe2QaBF4nS+wR0yaDprP8wSpsYSJFWJRGOa64KhY7tNAdGXgfrDwlLZyy
 ZihyxhaQPgZ2sZ/pVJ+4kTn34nk9Lfqx/RJccFTa61ZXRt+J9N88gkefh6nmCet/3H+UzsZfBA
 AAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

This patch series expand F(x)tec Pro1X (QX1050) device tree to support
various components of the device.

Most notably:
+ SD Card slot
+ Touchscreen
+ MDSS, DRM display panel
+ WLAN (ATH10K)
+ Hall sensor and camera button

This patch series has been tested on Buildroot Linux with TQFTPSERV and
RMTFS present in userspace.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
Changes in v2:
- Squash copyright year commit to the hall sensor commit
- Reorder pinctrl-n and pinctrl-names in several commits
- Use interrupts-extended for touchscreen
- Add further information to the caps lock LED node
- Move status property from &wifi to the end of the node
- Link to v1: https://lore.kernel.org/r/20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net

---
Dang Huynh (11):
      arm64: dts: qcom: sm6115-pro1x: Add Hall Switch and Camera Button
      arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO Expander
      arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen
      arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
      arm64: dts: qcom: sm6115-pro1x: Enable SD card slot
      arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
      arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
      arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C property
      arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
      arm64: dts: qcom: sm6115-pro1x: Enable remoteprocs
      arm64: dts: qcom: sm6115-pro1x: Enable ATH10K WLAN

 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 319 +++++++++++++++++++++++-
 1 file changed, 310 insertions(+), 9 deletions(-)
---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240722-qx1050-feature-expansion-7f6a2682f2ea

Best regards,
-- 
Dang Huynh <danct12@riseup.net>


