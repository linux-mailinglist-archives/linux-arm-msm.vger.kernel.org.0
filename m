Return-Path: <linux-arm-msm+bounces-72386-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 858A6B467DD
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 03:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46BEB168729
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Sep 2025 01:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E6518BC3D;
	Sat,  6 Sep 2025 01:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HtG1PLnf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121B4315D3C;
	Sat,  6 Sep 2025 01:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757121149; cv=none; b=MJIrw14CO+hC24avhJbQ5ricAD7lP3oHHxv4DXuJQ3uUXfD0mNSgAUSZIsHb2tXW02LAMI0JQTJMPRuwg+YlfKGqscyyia1KHpNMqBK8LFvbi/p0VhX+1xV41MIB8IUsQlCCAgwGclWTIWgP3sSLzenV2Yz1ynTYwIvz4wd963U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757121149; c=relaxed/simple;
	bh=HycOeBz2FihO/ksjDTGyARGoNP6WXbmt9//2f3kTqN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D8DFU8LxuZE+MuzCZdOFjvpEnI11M59QPa6d8ZATRN3+RdnkYkyO9NwaTy/teHo4cX0Ntt5Oq9bzDfaw02a5C3uWw5NkMLdXXu2JQLVUaQCIi0wvozSEaiVDJHIxCa2IfRmwpzseDgc7x076dswT8iFUMjCjSilQUp4QdpFBwG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HtG1PLnf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740E2C4CEF4;
	Sat,  6 Sep 2025 01:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757121148;
	bh=HycOeBz2FihO/ksjDTGyARGoNP6WXbmt9//2f3kTqN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HtG1PLnfsPKO1AKgi/9WcphQXA0WqjNnjzmCRHLvnSHCyHGqdORLfZ1eC84p4GuPc
	 L+mFXQiPW1P2MYHQE5VS+yxRCLMP5L96QlL061fmU12/uhLZevcPRgFtUQUBHE1z4w
	 3TT75aVD454riMYqTmyzntinj4hHtRLRVX1i3E+31AE4Ob0dI1ogu3VuB/7uYJSPQr
	 GBgD+vmOzqrL+MWMvRuKG561q2FWr6Fx+sVTp1Qgg6cQTydUjSgkRnQOmlJlvlHXcH
	 M3SeylTuaTQ8bpwb4AX3BqAGYdXZ5zJPkV2l1ADTv4rVCROwhdUsZbTKdD3xx4fOWY
	 /XXA/bwMKVjVQ==
Received: by venus (Postfix, from userid 1000)
	id 68EEC1801BB; Sat, 06 Sep 2025 03:12:26 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Sat, 06 Sep 2025 03:12:03 +0200
Subject: [PATCH v3 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-thinkpad-t14s-ec-v3-1-3ce6ec21ae89@collabora.com>
References: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
In-Reply-To: <20250906-thinkpad-t14s-ec-v3-0-3ce6ec21ae89@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2093;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=HycOeBz2FihO/ksjDTGyARGoNP6WXbmt9//2f3kTqN4=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBou4p5ZOo629YrYndKzJAIhBvHkee1mzK3x9bJQ
 X6UjE9MCReJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaLuKeQAKCRDY7tfzyDv6
 mpwfD/9Xyt1QXtyGlE9Ikyk5UGsfP6ki315+97O5sTIOctooUcZQLflp+aATvT1dhNX6CCfDobV
 fi++anMqLnP8YESxCy2F/XtPoyrcgbXROcNX56UJNHZPLALP8z/LW/emz1h4WJK8Ty/obH/neKk
 zQMC9L4VAXu/uMDptwKUThzDqVbVaFUgJW60m0ao80ITzrDYpBougtiP+gsl3Heqkht4XSlti6d
 Igvd4aD/gkH6kCl6G+DRrTuUOkZz+QHN4d5zENtVk8GV0GzirosVImsbMtH3gIN0iC1emE6MuBx
 lt5/dGsUd6tJuosjf9+XqWDy2nUiUIFN+/qStndgjYSJ22S3fCRLJFxAXAbM8DYZkIVaYtO6mF9
 S4hV/s3FRdcCJo08k1jQOtwFqTLZY5kR5ot4z2fUGdtRxiwyMBA3fZ22K0f5ooT5Aczu4YZ+st3
 +xiOr6S0UpSgP2h605RLOgn1eVuYPvJc1gzzsugryT348RVf0VpUgB+PBkPiliO/rOzJQy9vrqY
 a36EEOiEQKyPknnKI9b74Mq8qLUanQbnhNIagChzgpwbw8RZvkw4nzo+E7uMnteqZhKv0HHNrnZ
 uZiiZLwI6gunY/0EMiV6zTEz79D/VjH2xHC6CB3YVp7iUCWVzV8QM/x8tnvgcci7UutxY5W9KOO
 GSaNfIUdgvDUPCw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
which is based on the Qualcomm X1 Elite. Some of the system LEDs
and extra keys are only accessible via the EC.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../lenovo,thinkpad-t14s-ec.yaml                   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c87ccb5b30868c7a616ec08b869286d627dd7406
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,thinkpad-t14s-ec.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,thinkpad-t14s-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Thinkpad T14s Embedded Controller
+
+maintainers:
+  - Sebastian Reichel <sre@kernel.org>
+
+description:
+  The Qualcomm Snapdragon-based Lenovo Thinkpad T14s has an Embedded Controller
+  (EC) which handles things such as keyboard backlight, LEDs or non-standard
+  keys.
+
+properties:
+  compatible:
+    const: lenovo,thinkpad-t14s-ec
+
+  reg:
+    const: 0x28
+
+  interrupts:
+    maxItems: 1
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |+
+    #include <dt-bindings/interrupt-controller/irq.h>
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@28 {
+            compatible = "lenovo,thinkpad-t14s-ec";
+            reg = <0x28>;
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+            wakeup-source;
+        };
+    };
+...

-- 
2.50.1


