Return-Path: <linux-arm-msm+bounces-27477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4BF942668
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36127282C33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F468289C;
	Wed, 31 Jul 2024 06:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="PoP1IeAN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F83F1BC3F;
	Wed, 31 Jul 2024 06:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406766; cv=none; b=MKq/oZm1VJHXLdEbMbvIt6guLfDe5CHt0JZRqmD7uqIN9ZVf/51wZ0B6NNeVT7yhlRthyfPGmDX0ACVGElVxeDMGp+SrteeAsKCnLHwtr2BNdbkpCKjwYYb7mlSLWGUSEHkHUfgKRskb/gLzp3A7q1mfZZwgJ+ykF/90/AN/usY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406766; c=relaxed/simple;
	bh=+jTBJW79nUPA1WQZfxR+meREaFGoSoYk6ArYlaOhtgU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZRyLmwQ/ZKb3WyHya+scY2B9zI25fZx0qpKjq0jmp6jz75HvvE+bviwt/oK/D22QTne46s7N/lr/YUzzrXFycrvsv25Mnhfx0tHf1u1v6NCWz6Hz7Zy09OcpgubyMwGW8QpO5C7sjTlEU6NFtijwsZE7RWy9X6T7gsQuLP94BVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=PoP1IeAN; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYhkx29KXzDqPx;
	Wed, 31 Jul 2024 06:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406761; bh=+jTBJW79nUPA1WQZfxR+meREaFGoSoYk6ArYlaOhtgU=;
	h=From:Subject:Date:To:Cc:From;
	b=PoP1IeANs3Ns9hD0UAvmmFPZ+vJ+jLYN7AwgqkCR1mDyA5h3Nn2hV1kCwLddm4npO
	 baT5xif0Xs9VtK0CTkpBZ65UasIYF626AJnVeGt2Bg+4Lqjlet+hAOYqIhP2ZA8qH/
	 dYJS9te4Zz7022ha0w1ZdaFrN2P2V3/AriGs08Zw=
X-Riseup-User-ID: ECDF847ABA548A65E58F0C1CCB205533198445340F2ED3E36FC8ECA3FE7519A3
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhkg16LTzJmtl;
	Wed, 31 Jul 2024 06:19:06 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Subject: [PATCH v3 00/11] F(x)tec Pro1X feature expansion
Date: Wed, 31 Jul 2024 13:18:41 +0700
Message-Id: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEHXqWYC/43NsQ6CMBDG8VchN1tTjraAk+9hHApcpUvBFhoM4
 d0tTLoYx/8l3+9WCOQtBbhkK3iKNtjBpShOGbS9dg9itksNyFHwEpE9l5xLzgzpafbEaBm120e
 sNEqjqtAgaUjz0ZOxy0Hf7ql7G6bBv45PMd+vf6AxZ5y1ohOVEoVsanX1NtA8nh1NsKsRPyX5Q
 8IkSaNb0TRdLZT5krZtewMRCgYVCwEAAA==
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
Changes in v3:
- Fix dtschema errors
- Reorder gpio nodes by it's number
- Link to v2: https://lore.kernel.org/r/20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net

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

 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 343 +++++++++++++++++++++++-
 1 file changed, 334 insertions(+), 9 deletions(-)
---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240722-qx1050-feature-expansion-7f6a2682f2ea

Best regards,
-- 
Dang Huynh <danct12@riseup.net>


