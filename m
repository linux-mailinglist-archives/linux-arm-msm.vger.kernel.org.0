Return-Path: <linux-arm-msm+bounces-87348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E98D4CF1121
	for <lists+linux-arm-msm@lfdr.de>; Sun, 04 Jan 2026 15:33:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1465300C0E0
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jan 2026 14:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91FD23BF9B;
	Sun,  4 Jan 2026 14:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="DWs9qqiL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out203-205-221-231.mail.qq.com (out203-205-221-231.mail.qq.com [203.205.221.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E9A56B81;
	Sun,  4 Jan 2026 14:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767537223; cv=none; b=pUwTrDbMFUsIWXgSZ+6bOWd9kqd36ciDVHsz+XM/HGLXNBB8FEYoeiT0O4U9DUcd+nEnBnRQFtlGVbsroPZ93pJDCSg6O7aSFTMyWv92gV7QNehAyd2DFLbx6X3+vQ6VoylAB9MmG+cpFbVw2SKlvRjHWAra7As7iAS+lok0fSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767537223; c=relaxed/simple;
	bh=iq/EarXhGPnU1pHxAKVlxCqs2W94L1btpNPcWTZQZdc=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=ptlygdLUNw48MxA0anyXF8RNXuZU7IqeHIgY62kRqUIzYaPGC3Y4f9XI7i29VjKiqetIuVMRAMN27gCyy+fqGimOexMRrDsFMgeotqICWuBmn9dUJB3PlwwZDfqHwUKpAIcaLT6AAHAyj9nwvPmlVY4ytyP4Uf2KwcZJUBFHRKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oi-io.cc; spf=none smtp.mailfrom=oi-io.cc; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=DWs9qqiL; arc=none smtp.client-ip=203.205.221.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=oi-io.cc
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=oi-io.cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1767537209; bh=y+wvhjZAeHpCReInLrUnB/kpVGT7yfsgI0Oeatu1TBA=;
	h=From:To:Cc:Subject:Date;
	b=DWs9qqiLm89IN6xI7PIP63oRNUWvBzuYzsjGgocavGnFOjCmP1eUIknaoytY0VOZi
	 3qFY5Bxvw+D27scbhrpXyy/7lIx4meTWpURwDsIrSXaAAm77mXCu37J6KSn0P9b3XH
	 qGgyFm1HThSboncY5mChxxXIYao5Ub5IfLm6ysMw=
Received: from dev.. ([43.247.133.240])
	by newxmesmtplogicsvrsza56-0.qq.com (NewEsmtp) with SMTP
	id 78509AA6; Sun, 04 Jan 2026 22:30:05 +0800
X-QQ-mid: xmsmtpt1767537005tsw45nj7v
Message-ID: <tencent_E2C8516B4EB4784940CCB1198882BD38E10A@qq.com>
X-QQ-XMAILINFO: N8i9SvusUD3bG+irl94WYHXDS6V2WAIogZxcoVCWKhbHfv1+GZ3aIvH3Abg2F4
	 pLQUNJQ9BpZCe0Bn0xteRlfpY4ylYQOUcrc/pGASi+lbfj0Nnw0kDSmAPescXXdv//Zl4j/mipEi
	 IVo4iJphmIeoQRPw2JtaAKec6lsjFdK+HyTv4mbB+gDn+GtapsrkBtt+kJKRSPKRcLcS4gNTR7HE
	 D88jVEziMw7m8SewPkCk7ZgqAvjZrpeI5uawMMMe/KEaEkVvCV3UQq2GyaUisWTjbSFylGJi0+Ql
	 gmAYSYPb7bjRpFJ7JWayHCnHrUyUi62CbE4Vv4eYTtkg7Z1rUpGj7EbbfWm0yIk5d/cYz1hyj9lq
	 egM9fYFCZO71mYIUxbMjVsWqIfJR9o8gfDuPCAto/CCb/wUCc0PzsNKvdGwj3TlDkUgS0exvwU/f
	 xCTJLYG22My0MKAaxOPnk1gpB6S1H/KI54jZox1X3Y498HzyMoy0ATXJWMDgKpdVH8LaXKAkQDIO
	 JgCOJC/EP1lmlsktLsekQENVCuUze/6IUM8Q7OXrMwAMKGPPCTIY3LDmk3nqr6P67wpV8BByWodS
	 0vJDcLkXuFhhkuOp/4KByVo822gZqj3Oaf6NCeP2YU3ZAQXZpUQEledSP94z9ZO4oee1WO7sk+ZB
	 sY1G8xaK9OodqOTpGhPMzS8CIH7Fxy3W1yM3/Ski9zU02NWGeEL4M8Eh8v6ZOJGCoHdJE1Ds4qg5
	 uE0Nv5eq1JzK5el6fkuCOKw8SvxRzfbB5P6JghCVaz+rN+xca8NXL6xgM004NUsuML7hdWddiISQ
	 C0t2wICVcFZSwgYQJ6noeec5lXHwOSnFod5kT1rzQxCZhxKm/7HMIbdlU5NgmRe3GFb5Yibz9f2E
	 yHrqui/MN2BHGRcpZaX9qVWPCy3lphc3u0SupL+tD+BKnRZAXJnbGwqVNuE6CvozGQnJzOxghe9U
	 Y5d9w5Ci8waxzcTB3zwwCrViz14j1vp+9GVaF49q98bY0jCLr7C3uSL52+BSsTQXTHCQx/D9vz79
	 8hlrvPmYDswRs/7clO04T8LHQIkH0fHjD/SIYjo3FtmUpz8B8vlam8Bg0kStbub1m1EA+NTvFuka
	 VW941fRtMqRDKhjHZ+PkOKf4pLgEI07OGvK1ES
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: weifu wu <boss@oi-io.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weifu wu <boss@oi-io.cc>
Subject: [PATCH v1 0/2] Add Acer Swift SFA14-11 DT and bindings
Date: Sun,  4 Jan 2026 22:30:01 +0800
X-OQ-MSGID: <20260104143003.2478600-1-boss@oi-io.cc>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial device tree support for the Acer Swift SFA14-11
laptop based on Qualcomm X1E78100 SoC.

Patch 1 adds the DT binding for the new board compatible string.
Patch 2 adds the device tree source file and updates the Makefile.

Tested by building dtbs and booting on the target hardware. Display panel
and backlight were verified via eDP.

weifu wu (2):
  dt-bindings: arm: qcom: add Acer Swift SFA14-11
  arm64: dts: qcom: add Acer Swift SFA14-11 device tree

 .../devicetree/bindings/arm/qcom.yaml         |    7 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1650 +++++++++++++++++
 3 files changed, 1659 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

-- 
2.48.1


