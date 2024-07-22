Return-Path: <linux-arm-msm+bounces-26698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5170D9389A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:11:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0553B20A88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 499F617BC9;
	Mon, 22 Jul 2024 07:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="dNyJ235n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE05D53F;
	Mon, 22 Jul 2024 07:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632266; cv=none; b=o8Uz/pfOxEFwnl9m8mqCqj9WhxJ8jZj5MK/MaChAf0miWNwHbCxCoNVjzbkGbCUtZSPLTNUlXA6hW+SqXsJnRGxWayqGF9x4HoyXUkgYQl/Rn3oqOXcJaHOVxrCKZ512lc6+QUT2e34cJfZcX3TE2MlNI0HkbafgXUn+eOnttEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632266; c=relaxed/simple;
	bh=Nty9qEmvFD3zjctxi60UX8L3t/rMXaATRXBcG6VkeGg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CygV4XI1imI/XcfBbYuxkE5Ybh9lM4mjoND9McO3/cTnZYcV57vtNGbWzrMspun6kixYpAlP51vISR5h/y5HmxNDqe4snzGLZ7x7eHNMx4FF2l7CeTwxPAMwiuYJwws/cl+y0gOh4NPGyuSus0/tVVilRLi8WTqvGblf0o1WUQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=dNyJ235n; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WSBJl2k94zDqX8;
	Mon, 22 Jul 2024 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632263; bh=Nty9qEmvFD3zjctxi60UX8L3t/rMXaATRXBcG6VkeGg=;
	h=From:Subject:Date:To:Cc:From;
	b=dNyJ235n4dCKzF2LPgswFnlNAVlgQ1lW8VYI+49l2l2m++vzdxEFBdm4Q+hYBtsfm
	 /KcsUJ1e0wKboVQY07x1i/mdJpnZh43C+qlTVpnupM5Bz7OEufePV441rgryCInzsj
	 esojVTDeeIZVxy9en0Nmeeki3JzvQ80OLTx0VbVE=
X-Riseup-User-ID: 10048D71B9D1C5C1D8B2623470FC11309BFDDC133F94D03C7F3E159DE8C04C92
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBJT1wFWzJrYb;
	Mon, 22 Jul 2024 07:10:49 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Subject: [PATCH 00/12] F(x)tec Pro1X feature expansion
Date: Mon, 22 Jul 2024 14:10:10 +0700
Message-Id: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANIFnmYC/x3MQQqDMBBG4avIrB2IQ9XiVcTF0P5pZ5NqohIQ7
 27q8i2+d1BCNCQaqoMidkv2CyWauqLXV8MHbO/SJE4erhfhJTeudeyh6xbByLOGP+LedyrdU7x
 AqfA5wlu+1+N0nhdLXk0YagAAAA==
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
Dang Huynh (12):
      arm64: dts: qcom: sm6115-pro1x: Add Hall Switch and Camera Button
      arm64: dts: qcom: sm6115-pro1x: Add PCA9534 IO Expander
      arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen
      arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
      arm64: dts: qcom: sm6115-pro1x: Enable SD card slot
      arm64: dts: qcom: sm6115-pro1x: Enable MDSS and GPU
      arm64: dts: qcom: sm6115-pro1x: Hook up USB3 SS
      arm64: dts: qcom: sm6115-pro1x: Update copyright year
      arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C property
      arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
      arm64: dts: qcom: sm6115-pro1x: Enable remoteprocs
      arm64: dts: qcom: sm6115-pro1x: Enable ATH10K WLAN

 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 316 +++++++++++++++++++++++-
 1 file changed, 306 insertions(+), 10 deletions(-)
---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240722-qx1050-feature-expansion-7f6a2682f2ea

Best regards,
-- 
Dang Huynh <danct12@riseup.net>


