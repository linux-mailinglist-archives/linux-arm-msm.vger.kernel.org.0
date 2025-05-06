Return-Path: <linux-arm-msm+bounces-56955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3962AAC6A8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55E15272FF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 13:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EA727F75D;
	Tue,  6 May 2025 13:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ffM2f71k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32771279919;
	Tue,  6 May 2025 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746538682; cv=none; b=McK6EDETugCxjo5LWsHOuG4Dbkjb+wGDp5kihsnrBt1Qzz7L8FVLK2tCwdbrabiMwR61z8sol07ObAd5csIY3Y4eUxKUumWuxKpYLhrlT8JxPuRsEmSztCYBjf2pfVEEdcrYDXhuF9QwNHcYvz3VTmf2S7CK5753xkV5Bmsu8PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746538682; c=relaxed/simple;
	bh=j3pZC/XaZxq1nTfApPbo0UhslwhHoqMDuBioTufbjAI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gknCHYqVW+/ZquTCO0jPEgQDibIp1uL09dABLEc8++DH/uHsFQh1tBb1GdCKGIKddNKXn1d0UoMJpgNiuoc22sosUN7dZzxIp7V5vj2J1tnK9RbAnZU3+hAugGNnvPyB75/zJIsBWZdgmhP2dSgyV3CtvVl1yt9mqH/XLG2OBkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ffM2f71k; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5fbcc5aa54aso474802a12.0;
        Tue, 06 May 2025 06:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538679; x=1747143479; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSF+OJIgK26VEh3x/SDKQXMT6lVshgj+NKwxNjbf6F4=;
        b=ffM2f71kgepuKIfMN2ikyKDA4j+dyQYzGeY8qJjdDYSAts9FPAI5aOLiX21p8y4b22
         HIuJ4g1P0fNg+uF+zvtd6gm/UAwU5tekEqPwKCAMNhVzSghuKDly11268GdXxRX+rh7e
         1mJjzoH4y8b8M+9VOqer0FrcJoITv0TYvq2SQu8UzKF96BZ0LDx5H8FzIKyzo9+aAdM+
         hdanS8b3rdgTtLXJK0TXbA/J/+DbGninkJY7sb9Q83ycD1PhGBdPgS4ORzRltEUdZaJ2
         +xZDawSRKEVFe80d8trMmsMf877YKnlMXP8GNx4UPozIK0D8b7Cx+5Xf2zd/VskQNUdT
         BIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538679; x=1747143479;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSF+OJIgK26VEh3x/SDKQXMT6lVshgj+NKwxNjbf6F4=;
        b=ZMzojbu7tGBqOWv5R5yG2i+mMZ6FNbk14Sek2VHKfv0gXC5NUevZaE3Txn5mRatnyn
         pSHp8bM0ohqtcZfzR8n/spRoq46ERXDFOP0aZ8KkAzfLksbnriRQcN0ifgr1W3BVUG3U
         /4qk0HHEUTFoyM9BzvuCJv1Cdmxnb/3EgNOFqTv2llc9XQ1oxoftg4zb12XSCt9XFk5n
         WCe2z0nB2PVRffcNq0rUEQEHmVltRoGVKbTxwhD84drEVkBNMLAf9+k4Ie1hBr+3w6Vg
         T6WpS5oKg4LE3+PcAIytcPcj8v4DV+1CAyj7ABASZRtIJESkCXjrJV5MomlUV3Zq5TU0
         nk/g==
X-Forwarded-Encrypted: i=1; AJvYcCV7eYy8A5oyn7h0H/XEui3uDdWQLjDlbS5hXn7LTquf3ZNdsZX5PlWcBVf7jc0LaVwx6xKUP31P4EO4@vger.kernel.org, AJvYcCWssB1z8Dsi9IOGhkoS4mKAHRgNUlEAkgfHzE5UD9OQo+9Rwlz681cV97BkILNMpyKtzCwlYzRrp4m2gR71@vger.kernel.org
X-Gm-Message-State: AOJu0YyWjIwh3cFy0+snQQJuc+9D1awwhzS2HatTjexxqsX1bPM98Ua5
	ayQtAC36TMJu5slHI8hUyklutNq5zn5fY9ufuj9FJO+1vqwLqpxNyFsAfQ==
X-Gm-Gg: ASbGncsP3AKTzNpuFhBwKx3tg6btZEQ0TwtiyxCfWlB5e/ScPmWX9rqaNErlEDECdtZ
	GApc+zOh3qru+CfnonK1D9mMGLgxvB5XCgefZH/7bivQH+0XRl6MzwqN2vKlPDok/fHkDBvzEtj
	LED2BZkSM6n4lMX5QhN5nivJ4WgSVvFY9W+c+c8c/bOBbf8VX4zv5aGHWCozukRbR0DNGQRDJLD
	j+5rB8jJm8edQA38e64sMZ3n4cqEYMzWEGIWujAWqL5biF5RMykxIKvqpiL872o3/78Y9HqBTV1
	U0qhdRRpc6BT1eD4nSfikXlwS31P+ZyZlhOJo/4OveKTS/wUHKXeKvPGe9ztlpdmPPXpmpc=
X-Google-Smtp-Source: AGHT+IHdBx2trF6WSf/C+/MvDSiam7ynoOC/9Th/EBM168yVaFg+D0ObGm+tyCAkPnXFePNlctaGPw==
X-Received: by 2002:a05:6402:84d:b0:5fb:2041:6bd2 with SMTP id 4fb4d7f45d1cf-5fb700a2dd3mr2496423a12.16.1746538679153;
        Tue, 06 May 2025 06:37:59 -0700 (PDT)
Received: from [192.168.20.124] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8ffcfsm7735801a12.64.2025.05.06.06.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:37:58 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Tue, 06 May 2025 15:37:47 +0200
Subject: [PATCH] arm64: dts: ipq6018: drop standalone 'smem' node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-ipq6018-drop-smem-v1-1-af99d177be2f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKoQGmgC/x3MQQ5AMBBA0avIrE0yqFJXEQthyixQbSKSpnfXW
 L7F/xECe+EAQxHB8yNBrjOjKgtY9vncGGXNhprqllrSKO7WVPW4+sthOPhANtZ0puFZKYLcOc9
 W3v85Til9PVt/WWMAAAA=
X-Change-ID: 20250506-ipq6018-drop-smem-e9f9793ea440
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2

Since commit b5af64fceb04 ("soc: qcom: smem: Support reserved-memory
description") the SMEM device can be instantiated directly from a
reserved-memory node.

The 'smem' node is defined in this way for each modern IPQ SoCs except for
IPQ6018. In order to make it inline with the others, move the 'compatible'
and the 'hwlock' properties into the respective reserved-memory node, and
drop the standalone 'smem' node.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Note: dtbcheck produces the warnings below, but those are present even
without the patch.

  DTC [C] arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb
arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: qusb@59000: 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: qusb@59000: 'vdda-pll-supply' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: qusb@59000: 'vdda-phy-dpdm-supply' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dtb: /soc@0/remoteproc@cd00000: failed to match any schema with compatible: ['qcom,ipq6018-wcss-pil']
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index dbf6716bcb59a04939c2b994d85cf58c12365962..b5266702accb62056eb57d9ef75ee0383c8bd54f 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -210,8 +210,11 @@ tz: memory@4a600000 {
 		};
 
 		smem_region: memory@4aa00000 {
+			compatible = "qcom,smem";
 			reg = <0x0 0x4aa00000 0x0 0x100000>;
 			no-map;
+
+			hwlocks = <&tcsr_mutex 3>;
 		};
 
 		q6_region: memory@4ab00000 {
@@ -220,12 +223,6 @@ q6_region: memory@4ab00000 {
 		};
 	};
 
-	smem {
-		compatible = "qcom,smem";
-		memory-region = <&smem_region>;
-		hwlocks = <&tcsr_mutex 3>;
-	};
-
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;

---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250506-ipq6018-drop-smem-e9f9793ea440

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


