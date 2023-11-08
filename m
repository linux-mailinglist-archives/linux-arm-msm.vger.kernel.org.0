Return-Path: <linux-arm-msm+bounces-139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC17E4FE3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 06:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C08D11C208E0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Nov 2023 05:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F30523A;
	Wed,  8 Nov 2023 05:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aiqcqysj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AEA8F5D;
	Wed,  8 Nov 2023 05:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F0E3C433C8;
	Wed,  8 Nov 2023 05:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699420634;
	bh=PiEA1nwpNZ7TIn0iVbmCqXuNqt+dMIvNxBd2gHiIqeA=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Aiqcqysj8WSgJGkbPvLx+T2mLDBYuIwWabw8x47oDZE/We+sLp0vrmSOZeo+lgJ+Q
	 BQuQoiPBRTi2sK+IVxnlqVKhF3Hm490Q+XzNdF008Vb5QftMAqQY9lXE7Ee8rW+4au
	 QyEdz6BumydNEFZFOf6q01NjT1wehBoC8zqnx/KmKo0iq2iIeHi+VT46S7mlGzppGs
	 nLV2vVfGxg3uUuj6dHXC08CQqLPkwRXFwSfk3+UIpMvi8RyN/rAs9buYu6TZP9pke5
	 dUTbJc7uaOgtUuk1JlCZd2wXO5gQqV0nI6kV9PjVZ0+sWnZ8re50i/OuKBsqwO6Us7
	 ON1QXXWj92U8w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E49A8C4332F;
	Wed,  8 Nov 2023 05:17:13 +0000 (UTC)
From: Steev Klimaszewski via B4 Relay <devnull+steev.kali.org@kernel.org>
Date: Tue, 07 Nov 2023 23:17:10 -0600
Subject: [PATCH v2] arm64: dts: qcom: sdm850-lenovo-yoga: Add
 wakeup-sources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231107-wakeup-source-v2-1-bf1562ef9367@kali.org>
X-B4-Tracking: v=1; b=H4sIANUZS2UC/3XMQQ6CMBCF4auQWVvDtKEGV96DsKgwhQmGkqmgh
 vTuVvYu/5e8b4dIwhThWuwgtHHkMOfQpwK60c0DKe5zgy61QSytermJ1kXFsEpHCivnra+cNbq
 G/FmEPL8Pr2lzjxyfQT4Hv+Fv/SdtqFAZe0dvarIX398m9+BzkAHalNIXbIqAvKkAAAA=
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699420633; l=1476;
 i=steev@kali.org; s=20231106; h=from:subject:message-id;
 bh=hOaVryeA8/dNuUZsiO2uJEGRMT7i9AIrp/ZBfau6X9Q=;
 b=9wHrEPFbaFJvva63VF0vjULs/N1mDpxpdj//WykGfE7qJhoLJUxnfDOBEn+bimJ4kXb7tR9r9
 OdBPKQsTZf/AKD5HmITT0TL70Hu8woeoWyRusNCeGIaFlJE5lXUfQwJ
X-Developer-Key: i=steev@kali.org; a=ed25519;
 pk=KY+JnLRNy7Hdf04yfpE5ubOsDBIIfXAWnBijkySXbb4=
X-Endpoint-Received: by B4 Relay for steev@kali.org/20231106 with auth_id=97
X-Original-From: Steev Klimaszewski <steev@kali.org>
Reply-To: <steev@kali.org>

From: Steev Klimaszewski <steev@kali.org>

The keyboard and touchpad can be used to wake the machine
up from sleep, so mark them as such in the dts file.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
It would be nice to wake up the Lenovo Yoga C630 from suspend by hitting
the keyboard or touchpad, so this patch enables that
ability.
---
Changes in v2:
- Drop touchscreen from being a wakeup-source.
- Link to v1: https://lore.kernel.org/r/20231106-wakeup-source-v1-1-36b1f39e67fd@kali.org
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 92a812b5f423..8f68c99965cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -392,6 +392,8 @@ tsc2: hid@2c {
 		hid-descr-addr = <0x20>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
+
+		wakeup-source;
 	};
 };
 
@@ -408,6 +410,8 @@ tsc1: hid@10 {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c5_hid_active>;
+
+		wakeup-source;
 	};
 };
 
@@ -482,6 +486,8 @@ ecsh: hid@5c {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c11_hid_active>;
+
+		wakeup-source;
 	};
 };
 

---
base-commit: 5cd631a52568a18b12fd2563418985c8cb63e4b0
change-id: 20231106-wakeup-source-15af6f5a6329

Best regards,
-- 
Steev Klimaszewski <steev@kali.org>


