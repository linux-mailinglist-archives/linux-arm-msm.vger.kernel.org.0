Return-Path: <linux-arm-msm+bounces-84790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C1CB0838
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 17:10:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A726C30D2E2F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 16:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9DB83002DA;
	Tue,  9 Dec 2025 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XeFyAEay"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B632D46C0
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765296481; cv=none; b=CtGq70nM7sfiEajzgwry76sq89f0ulopUWtTsUmkWgRNbWtLhqEx1p6ZfBfPDcyHm9EapdaheeZpO/ZTF+7VXX55TH512AxOeqwUo9q6zSmOq4U7IKxO2MrsB/HwQcATfZp0yb2SomEpb4Gkta4k99VBDbPJ8QJO7uZcRt7hVMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765296481; c=relaxed/simple;
	bh=hqWwBhHzMRj5hwfTn5aYASYEmPTarkYL1NRE5PToWYk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uviMWFqQFs+qbQcPF2cUgCf7VRL3r1sX1aP0j1kyr1jfPoyl715FQHoQvdgqtmC8Ef853Td3NPkyRfDNxvzouwWG3a3PwQkJsStEFojvYqMydPZ/WBJ3NAfIYZo9NfX69a3qNl/HdzY0JdlnTiWqIVvLCA9KQdcmP00/DzQ8uss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XeFyAEay; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7c77fc7c11bso5857164a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 08:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765296478; x=1765901278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XKj6TjXWTZ5bB9iE2X2t8qqfAGcSOjFrdzdLpXdZOaM=;
        b=XeFyAEayAVrrWBu5gcOQQghBGXrWxwVa5Qv9DPvSTBx1xu5W4R0wFVXzu3SF5u0wTT
         dhAZC/fHxiEHEdstYi78aIps8/YicEvq84SI13ViQrA41+nIfd0Lc8G7Uf6f+3lP7LEv
         gux7ZVrf3vVEq/zgaYs1TBRqJz4LTkZO2Kv4AY3kRGWh+9fC+bm8iGAzVUJp8wrG7MQl
         2uLV64aMld/AwkmL051gMUeiYnZCbeyS/uVg7e5n1ja2EitCnQB9muGYeEh0uu99EDb9
         ttZtk5+aukGxY7OR9yldn0tnY2OgGCXxvbiDIkpixXgamHysZ68+EOWJi3yCUmU/PI+A
         my8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765296478; x=1765901278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKj6TjXWTZ5bB9iE2X2t8qqfAGcSOjFrdzdLpXdZOaM=;
        b=N4zH5Mwfllp7t8ZeJ11EZ45vxI2OJy+Q98seIxbgZpBfU5FpT8SvRNFkafepwhdPEy
         nCT2STFxGwoZBiNHfWgFyoL2OodkGKy9cH5spptd/GWQ+dkH1HhanqExIl0GlD2z7KyI
         W2AX01yT5jfOuuao9UztCDWX+fe9m/CWFRFCC+G0R7e7sLxuN+HKhMnVgIHwQCqvkWPJ
         3XtMlSpblk6Lb/5duynxLnEZaQvgsS+XEIkf3oBpnVOUILTBCy2nqEQ8vFtdb//jEIOn
         WIml2XGCwKkE1h/S1kZ57qTj3uOG+yRvyVco0oiBfZwLtjBnVXEuzK2I2zoGBQd479UQ
         1nfA==
X-Forwarded-Encrypted: i=1; AJvYcCWTIuTw+Yg5LIBAT43VF2LQkwH1hm4+6N8AEwjgt8Y29Eqh10mYxZewGmate6zlcAaKlz2Jw8KKEjZX+5Z3@vger.kernel.org
X-Gm-Message-State: AOJu0YytKvgB6+9mF7arO/g6yP31fDn9ro72xYhCNBNlx4AiurnAE2/R
	AeSo/wBNXG2fxxHM6m34RUQc+1DfEmFM3Y8P5VzRJHULyFYoIDNJ2t2Mhxn4S8gn
X-Gm-Gg: ASbGncsotA20afDKebgwv6osxnb3EZjh4c/fjSEKcaMWkYRjxFLguoOG5QTIPS6vZmc
	USLfDARbYwlqoTwMEgsyf0hYRrh9tau3nfEIAvXye9HbcooTGBSZ8bOFXj7g9GAnen2iOLIO3u8
	i5exBu1hd191/ArGosSs5WGaN3HwjJ5YjW6C5wqkNCNq/o/gc/sXGa+cdIIbDA+xanOqCO1WW2z
	0CMa6VWWXVB54QW9zHcZKhJP6Q38Z9Ua+jRgdMpig5+KJ5kGtGbvp6uZFbYeFMc/AdXxmNy13TO
	xIzhjwmZViY2J+WfVg/vRzlN+uTipmy/Ir4gcHXFfV5UI4/xoN8A9HO7K8Zcq+mDaU+U6HVdH32
	sUIsPaG8t3d0TkH5JOAmez4hNf1cdvxYGzqfpKDgCr7nw99+NxjiETB9uR8xUMkVSc+eVCOG0xZ
	WvjLLwR+WvdexBdRbgT2l/jUs5faDQAsgI7i2PlsocV7DZ//5izr/6I+kmcjLB2Oz9kTWoY6bVM
	HcZcXdOXfirZW5+wVgMr/0yP0pH
X-Google-Smtp-Source: AGHT+IGzGFLxsahAPVM1StL2MRJ5UDyRvON40tKJhYDlFJEAxVeB0koKV0RbyMlIjsR58OXoi9/3eQ==
X-Received: by 2002:a05:6830:12cd:b0:7c6:cd8b:2e5c with SMTP id 46e09a7af769-7cac60b2bd8mr676260a34.18.1765296478273;
        Tue, 09 Dec 2025 08:07:58 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c95acb3cf1sm12520518a34.20.2025.12.09.08.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 08:07:57 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: ipq9574: Use 'usb-phy' for node names
Date: Tue,  9 Dec 2025 10:07:54 -0600
Message-ID: <20251209160755.3878878-1-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devicetree spec allows node names of "usb-phy". So be more
specific for the USB PHYs, and name the nodes "usb-phy" instead of
just "phy".

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 86c9cb9fffc98..4b8cbf1ff131b 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -702,7 +702,7 @@ qpic_nand: spi@79b0000 {
 			status = "disabled";
 		};
 
-		usb_0_qusbphy: phy@7b000 {
+		usb_0_qusbphy: usb-phy@7b000 {
 			compatible = "qcom,ipq9574-qusb2-phy";
 			reg = <0x0007b000 0x180>;
 			#phy-cells = <0>;
@@ -716,7 +716,7 @@ usb_0_qusbphy: phy@7b000 {
 			status = "disabled";
 		};
 
-		usb_0_qmpphy: phy@7d000 {
+		usb_0_qmpphy: usb-phy@7d000 {
 			compatible = "qcom,ipq9574-qmp-usb3-phy";
 			reg = <0x0007d000 0xa00>;
 			#phy-cells = <0>;
-- 
2.45.1


