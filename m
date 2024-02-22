Return-Path: <linux-arm-msm+bounces-12191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5059D85FAFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 15:20:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF9281F23151
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 14:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B041482F8;
	Thu, 22 Feb 2024 14:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="czOpi+Ik"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1B1482E7
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 14:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708611597; cv=none; b=trbvpdbMnjZ5BhD1IR9F2G2QNwO9FGWuqdHLDp3U2/9C6HyUiU71LpXdb3Snk1H4Vs3TRS9ZaKTqPsSlTOrVGYEBqU51TTf3OdX0+R1zEQSh/xbaZQpjUx5OQamgXLSXCJAmw6LONm5dQ38OLYYPrUtK/wkW1xFfd/HCtlgLA6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708611597; c=relaxed/simple;
	bh=60Gndqbrtnm97w5mQMEh5gPv5N7WyZvnHD90ty6nNt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9e7GSscSL+yFA1HnCw0T1zklYMeWNAifVooUkJFXMH9r7JweACyn9syNQnj52Uyyc00lsXfHh4ZKwjsDu/Zcwa9blrEL0i752iy7AFoNUs3kz+TFl+SjLSxZwxRWxJXqcqBm1jza/wM4YLbGnNpRLU92LXsGdqoc31Axvm0TtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=czOpi+Ik; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5640fef9fa6so8011110a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 06:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708611581; x=1709216381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JksX+IKDkNdqLCYYO3e0buRv7x2Xlo7FHMMyk9/Vsso=;
        b=czOpi+Ikx42/Lw4CmCnbe25bjO5AKf/yXeB0kmaaNmUesrFJIIsPJhk65UTUZWOuP0
         LH90qh0P2ZLpIEF6OQEuXnMtUQMWXmbyeCpHCZooHTo75No0bvBHCSLa8lIowFIthiRm
         XzCciT/he6K1MAsD/X3X6UYyTBK+G3InJifto2qK4Tmq+jySF1/WqZKkz9hf2MlBQAG1
         S2Yq858BulBz+ZvJ32ukwzyheQBBcWsf5Q4MwGyahTltRGHk726htY2Ogfpld9sv2CUM
         GXftfrey2jXPvK96i5f+5Dhe3NwkLxQEVn9g9biGG25dJe2JW4vvPPSkFa/O+UlkHAxP
         1fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708611581; x=1709216381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JksX+IKDkNdqLCYYO3e0buRv7x2Xlo7FHMMyk9/Vsso=;
        b=eO1ldbf+ybb7P0vGuW/CIyK1Nge4+iqwsYcT14YSDGb75j7AYmDrUdqfWP0M/3P4va
         eSnMV3k/5+3pX3HSRkYyzrCqNcNNx4zzJqRlnfF62vkrFj9L5Nt/SYeg9xL8/y0T2pq0
         gEoz0Jw2YSkNOUJnjZ0FeBGGIgiyM154DFWHMefotcZ+VUpS9DF6vbY+gaS0tzZiuSt0
         yM5FyyN5X8vxRNfDYpYw0q9MZu3SP/J9qrDYGzgWA29cIsAqcbCiXrqRbZuLN4A2Ss1m
         LYkg0BUH0zzqlRlprKDoTmPxVFFNU6IMx/QQwDCs2jzID3RC4fGw5J0XBE0lfxfQ/0ig
         8IdA==
X-Gm-Message-State: AOJu0YzYwRqxH400gZD3oFrCVBC3+NrdC5BJfAUXiXx6N0w8SYsZehhb
	p20ci56K8m3OoS9czRnvaALnfKM151XvPzEMCVH2jXPxWgW0IFBfQKs+s51TeNQ=
X-Google-Smtp-Source: AGHT+IFLLQ5n4tIoJzrhuucSsLFTGKUUA0NBZdJjqAYabV3MFAvlNZ03Dg3u5ipj/+vSoYqNRjR8Ng==
X-Received: by 2002:a17:906:2c0c:b0:a3e:4704:d57 with SMTP id e12-20020a1709062c0c00b00a3e47040d57mr12658592ejh.14.1708611581639;
        Thu, 22 Feb 2024 06:19:41 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id lj7-20020a170907188700b00a3daf530fd8sm5992588ejc.210.2024.02.22.06.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 06:19:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Thu, 22 Feb 2024 16:19:20 +0200
Subject: [PATCH v3 2/4] arm64: dts: qcom: x1e80100: Add dedicated pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240222-x1e80100-dts-smb2360-v3-2-85a691d4f68a@linaro.org>
References: <20240222-x1e80100-dts-smb2360-v3-0-85a691d4f68a@linaro.org>
In-Reply-To: <20240222-x1e80100-dts-smb2360-v3-0-85a691d4f68a@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=60Gndqbrtnm97w5mQMEh5gPv5N7WyZvnHD90ty6nNt0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl11f2syHXvemFtyFo2//Ya4E/ACXEE8kK9R9Yz
 53foJ2KrlKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZddX9gAKCRAbX0TJAJUV
 VtuZD/0WoKB+XjbLzbFxnvxrczAteezkLutisD5tF4Bz8NBWhxgN+KTeqz1eUD3uKpVmHZ6n2tP
 e1+HYJgstZU7xZngIXm1eOp5PVclimHRyfBS5ZSg5U3ztTJERPp65XQTjTnmkdGdZV+bUb3CfJw
 41cq2JvyS2yW1JU2SXjwndsqq68Om6uMRCNfgAAqeXkuB827WI+n1YQzWg3faSjQ6qM7bhG6Qet
 NGdppqNJ3VmWDUKE+P4iZG9xK3hucTjj+gtzGiVLNhwkl/eSCYgckEkAAKiEt925aMMHFGJ9QWi
 LxUe0U7mV6CNlZM5iPe7ilGhoLEMuu66hnaW1HJ7fMLkXprquJ9EuolJz1fKr+gsIdaMOhnyQ/T
 VV9GfveVnk1SopDbkvsZ5cwB43gbykRtcfZUJ0u44cIzH6983OHRZcLpFITkHwx56mNj1deGVRM
 uAQTfVYDstNmq2lbAU0wJVGiGZ/7i69c0frmWGJGfVHCujanOCgn7OMZ3E7Uka/PyQS7uSTUId1
 ef9elfOwjupFZwawekvBpZrQdboayt7MiosUO6sW7fOZb4FbPG7NJqKzO2l988ZNG+OpCrBKRzL
 GaRR1secLlNM5NBZen1VEMW2PHH7pICOMP8Fd8Fd2NWo90THQYUldQv1uJj3qTkpISdxaMb930b
 vuqbC9LKmDn3bvQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add dedicated file for x1e80100 PMICs, add the all 3 smb2360 PMIC nodes
with the eUSB2 repeater nodes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi | 51 ++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
new file mode 100644
index 000000000000..04301f772fbd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Linaro Limited
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+};
+
+&spmi_bus1 {
+	smb2360_0: pmic@7 {
+		compatible = "qcom,smb2360", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2360_0_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2360-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+
+	smb2360_1: pmic@a {
+		compatible = "qcom,smb2360", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2360_1_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2360-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+
+	smb2360_2: pmic@b {
+		compatible = "qcom,smb2360", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2360_2_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2360-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.34.1


