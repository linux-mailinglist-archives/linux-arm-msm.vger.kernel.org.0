Return-Path: <linux-arm-msm+bounces-82091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51265C6407B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 13:27:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B53243A6E40
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 12:27:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9C732BF2F;
	Mon, 17 Nov 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mNmnYYMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18B0328B68;
	Mon, 17 Nov 2025 12:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763382470; cv=none; b=MG+YXUaQ457rUrGLLAWJhcZFroKGYmjdvXNKjnmmA4THDmuXD7T4E4Iphr7/Gayqw7US6wl0rLh9Fpl/PabYaTlHl1y9UVlWqG/PpXjDdeMaZNuUbAwqg3oiL6quP9fc9mP++URYcoyQq3jyLhBt+x3Bk57y2Xcg3vppFwb2dxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763382470; c=relaxed/simple;
	bh=1jU9pIXNhiEJFLTKDk6T+gxsSuk78osiAp0uPSBUW2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HfHr+vfagIon1zzA2kOAN4B1Oq6Y0KHhl7hPNk1yxOsCxKE4zYqpvxle58GsqTtuLcN18DP4rHGzM28PGfpLXufz+nBldTsJv6yuXFyDathA6JdtfXsQaW7NQ5hYOqI//eXWKD7CS+w8MIf/Vq6Oega4wSstqG3AkWC5+SDItxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mNmnYYMS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79082C4CEFB;
	Mon, 17 Nov 2025 12:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763382470;
	bh=1jU9pIXNhiEJFLTKDk6T+gxsSuk78osiAp0uPSBUW2I=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=mNmnYYMSTWopMkrqv68TvLkeaFxxpg3EjwZ7096SMMBRN6LlzfQ2NWqEToFbdmvao
	 pMcqRfrgu8K1+SnjnXsAzpEudWuLUZkj1v+i9oT/BrXy2idDD0EZDzM/rQL2QyTD8c
	 mFBtYQnnHxXXD9qQX7TQ48W7z5PkFLJYzvPlPwVt3mjdFxju5udiObZ+4g2sl+KGyK
	 KT3e/kadJ8DvlLYaQDmwafV7AGlaFswH9HhRM0jvLdmBHdEr2Dqx0EDt0g+OQ/qGxW
	 vbdyQXuHrB++WQdpBnyYuze9VQgJb+9RCIRMzxOcU1dAEgy8l8zv7hWHwpO2rc03OW
	 LZ3Lyf9T6C5xw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7158ACEBF61;
	Mon, 17 Nov 2025 12:27:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 17 Nov 2025 13:27:38 +0100
Subject: [PATCH RFC] arm64: dts: qcom: sdm845: add framebuffer reserved
 memory
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-commonize-framebuffer-v1-1-e4c099b383c9@ixit.cz>
X-B4-Tracking: v=1; b=H4sIALkUG2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0Nz3eT83Nz8vMyqVN20osTc1KTStLTUIl0LkzSTtNTERMM080QloN6
 CotS0zAqwudFKQW7OSrG1tQC7Z+0lbAAAAA==
X-Change-ID: 20251117-commonize-framebuffer-84f4feaa1f7a
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Casey Connolly <casey.connolly@linaro.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4741; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7XaWbvZV9YeWSaUBD4OPJXj85DubDK8OTImKrGrmPag=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpGxTCX3LvhCdmoDKU/4F+lkYNrt1/AEY5VQuJs
 tRpBfl5+/yJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRsUwgAKCRBgAj/E00kg
 ctTnEACQq0QyLybhZx2CfAxPHEmjW2FE5U9LcB2+4FE/G2rA51IcpXBJ0r57qFQNINv7qXPHtsS
 XcppCkkg2y24ArzJNEgx/5SjVjGlZsn0Iqecy5E+CAXvexVArizh6kfBHWLuxkCjBvaXdFox3UC
 K+AnmHnMYaK4DDXnjiHC5JeNCnjFaE23eF89qcKy/I1E1M8flHvGzOkqj90jXMeABRTVVq2zyWV
 MDRja5rOXG/uFzGGFYxZ5LaQtr7GAyb/gRlYEXcAlkfJZh36WiHY/Xx12yNPQL9SPyYKtjDRzBu
 8tQCFkWJ9p1mEidqCmNHmQdEzkMUMtOZ8iHqxuYZsgqt9ZAWEoFIpSDpc8KQQqQKC/fbJ7Po12l
 +wvDzABqX4ubrQbiVOn2gnAs+5GU8NY7o+/+hH9MnzIDXAvoiE8rAduu9ge/c18HQx4ZU/8W2qU
 hj1Dikd7aX4F57zzpY26gAdJNvJ8l2/ybhv2jqw2uQkwCJrujtoBIUbvl2jd7cLqiaYY5JGjEtH
 H9itqwIfJ3zh1E5Frob8IeWg63DJ48WUpaPnNUsHsbcdltGArJkkZ3yDVt1v8rdm/b/+ymkc7Ci
 J9a9p2gMrl2UA1sek0lCTysguV1cSYQ5DBIhWw62BbxURZLurKy7fQ1mPMLvzZVs1c/zkRWNgdI
 4WQ6SbPhF2CKuRg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: Casey Connolly <casey.connolly@linaro.org>

Stick it with the other default reserved regions, all sdm845 devices
use this address except for cheza.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
What do you think about this proposed change?

I assume QCOM recommends or by default use the default memory region,
but as can be seen on cheza or sdm850, it seems that vendor can customize
the region, thus it's not guranteed to have it always on the same address.

There are two approaches I see:
1. keep as is defined in each device-tree frambuffer node
2. commonize frambuffer node to sdm845.dtsi and in case of exception
   remove the node and definite it in device-tree.

I would love to hear your opinions.

Thank you!
David
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts      | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts            | 5 -----
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi        | 6 ------
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ------
 arch/arm64/boot/dts/qcom/sdm845.dtsi                         | 5 +++++
 arch/arm64/boot/dts/qcom/sdm850.dtsi                         | 2 ++
 6 files changed, 7 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 5d41a92cfebff..26f3081fb92aa 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -109,11 +109,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x02400000>;
-			no-map;
-		};
-
 		memory@a1300000 {
 			compatible = "ramoops";
 			reg = <0x0 0xa1300000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
index ddc2b3ca3bc57..9adf0d76e3ae3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
@@ -62,11 +62,6 @@ key-vol-up {
 	};
 
 	reserved-memory {
-		framebuffer@9d400000 {
-			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
-			no-map;
-		};
-
 		ramoops: ramoops@b0000000 {
 			compatible = "ramoops";
 			reg = <0 0xb0000000 0 0x00400000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 7dc9349eedfd9..f2d5585122590 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -119,12 +119,6 @@ vreg_s4a_1p8: pm8998-smps4 {
 	};
 
 	reserved-memory {
-		/* SONY was cool and didn't diverge from MTP this time, yay! */
-		cont_splash_mem: memory@9d400000 {
-			reg = <0x0 0x9d400000 0x0 0x2400000>;
-			no-map;
-		};
-
 		ramoops@ffc00000 {
 			compatible = "ramoops";
 			reg = <0x0 0xffc00000 0x0 0x100000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 785006a15e979..7e46e54dcf38c 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -100,12 +100,6 @@ spss_mem: memory@97f00000 {
 			no-map;
 		};
 
-		/* Cont splash region set up by the bootloader */
-		cont_splash_mem: framebuffer@9d400000 {
-			reg = <0 0x9d400000 0 0x2400000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@f6301000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0 0xf6301000 0 0x200000>;
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index bf2f9c04adba7..7841959a43ca2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -890,6 +890,11 @@ mdata_mem: mpss-metadata {
 			no-map;
 		};
 
+		cont_splash_mem: framebuffer@9d400000 {
+			reg = <0 0x9d400000 0 0x2400000>;
+			no-map;
+		};
+
 		fastrpc_mem: fastrpc {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x00000000 0x0 0xffffffff>;
diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
index da9f6fbe32f6c..b787575c77a5d 100644
--- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
@@ -7,6 +7,8 @@
 
 #include "sdm845.dtsi"
 
+/delete-node/ &cont_splash_mem;
+
 &cpu4_opp_table {
 	cpu4_opp33: opp-2841600000 {
 		opp-hz = /bits/ 64 <2841600000>;

---
base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
change-id: 20251117-commonize-framebuffer-84f4feaa1f7a

Best regards,
-- 
David Heidelberg <david@ixit.cz>



