Return-Path: <linux-arm-msm+bounces-4-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 116817E320D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 01:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF059280DA2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 00:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B2A80E;
	Tue,  7 Nov 2023 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iS2m562n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955E633;
	Tue,  7 Nov 2023 00:12:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71E1FC433C8;
	Tue,  7 Nov 2023 00:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699315934;
	bh=IzvDcSXVc6Sv1zIOCJrJxYCGu8IPPHkKg7fcM6qoiKw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=iS2m562nrCl1RiKX+Sy1RYiunIDGdiPcDySe5O4CZMNtjC83k6cd0IFZQBUoyP6En
	 vrvhJ1P4lLueHCUDlA0vqNJnmLZwNsAPscRt1Zx+x3n0xL/NUOk8GjE5oTvn/HqRdQ
	 Dd2afZgesSkF0Ox6WEAfoM7jdhVQO8QFsw3LI3h/rxZFhy29zGyft7PTfB/p4oXYxQ
	 lqgTq/pqJ33QiB0GNjpSWb9Zk/timrYiIzLFiOWS29ALBzDdJisVc1zYOGe5WEk10I
	 /WAEFww3iu25SOTtLJsGHO+cSN5v/U20sR2IzOlAEs6Q7ay/2ZVjT8O+kp0azA4OGw
	 IDWMf14m+H7FQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BD3C4332F;
	Tue,  7 Nov 2023 00:12:14 +0000 (UTC)
From: Steev Klimaszewski via B4 Relay <devnull+steev.kali.org@kernel.org>
Date: Mon, 06 Nov 2023 18:12:11 -0600
Subject: [PATCH] arm64: dts: qcom: sdm850-lenovo-yoga: Add wakeup-sources
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-wakeup-source-v1-1-36b1f39e67fd@kali.org>
X-B4-Tracking: v=1; b=H4sIANqASWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQwMz3fLE7NTSAt3i/NKi5FRdQ9PENLM000QzYyNLJaCegqLUtMwKsHn
 RsbW1AGuFZptfAAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699315933; l=1648;
 i=steev@kali.org; s=20231106; h=from:subject:message-id;
 bh=XxMr1pRCV6LxTCL9BHo4MJtPNXm2qJQqiz+fIboTk1I=;
 b=vjaUjZqT8uoer/iEV4k7jfxyJNb8OqOWndAP7CAxWb8vSu85CqW+CrAoPCv+59Z0xqc9erI5Z
 +Yjw6KDVd3UCDvzeJtXYgZ7om7X9WAhiQfVPZbUTqH4bva01E/4mHYB
X-Developer-Key: i=steev@kali.org; a=ed25519;
 pk=KY+JnLRNy7Hdf04yfpE5ubOsDBIIfXAWnBijkySXbb4=
X-Endpoint-Received: by B4 Relay for steev@kali.org/20231106 with auth_id=97
X-Original-From: Steev Klimaszewski <steev@kali.org>
Reply-To: <steev@kali.org>

From: Steev Klimaszewski <steev@kali.org>

The keyboard, touchpad and touchscreen can all be used to wake the
computer up from sleep, so mark them as such in the dts file.

Signed-off-by: Steev Klimaszewski <steev@kali.org>
---
It would be nice to wake up the Lenovo Yoga C630 from suspend by hitting
the keyboard or touchpad or even touchscreen, so this patch enables that
ability.

I'm not married to enabling it for the touchscreen, so if anyone wants
me to drop that hunk, I'd be fine with it.
---
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
index 92a812b5f423..9ddffb98408d 100644
--- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -384,6 +384,8 @@ tsel: hid@15 {
 		hid-descr-addr = <0x1>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
+
+		wakeup-source;
 	};
 
 	tsc2: hid@2c {
@@ -392,6 +394,8 @@ tsc2: hid@2c {
 		hid-descr-addr = <0x20>;
 
 		interrupts-extended = <&tlmm 37 IRQ_TYPE_LEVEL_HIGH>;
+
+		wakeup-source;
 	};
 };
 
@@ -408,6 +412,8 @@ tsc1: hid@10 {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c5_hid_active>;
+
+		wakeup-source;
 	};
 };
 
@@ -482,6 +488,8 @@ ecsh: hid@5c {
 
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c11_hid_active>;
+
+		wakeup-source;
 	};
 };
 

---
base-commit: 3ff7a5781ceee3befb9224d29cef6e6a4766c5fe
change-id: 20231106-wakeup-source-15af6f5a6329

Best regards,
-- 
Steev Klimaszewski <steev@kali.org>


