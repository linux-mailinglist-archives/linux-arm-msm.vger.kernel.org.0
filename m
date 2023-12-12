Return-Path: <linux-arm-msm+bounces-4371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B8580E7E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 10:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1EFC21C2040E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 09:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C7E58AAA;
	Tue, 12 Dec 2023 09:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uhjbM8Jp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59922DB
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 01:40:04 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a1f37fd4b53so653774866b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Dec 2023 01:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702374003; x=1702978803; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T7WSPbehcijEKgEJWzyVTs2cXCZ1wk5EWf1JMP+vpZw=;
        b=uhjbM8JpQ5gJdMeBgxEi+hfHJmDWQeFVjq0k9Ld0LAzC/fsoNKUfSzLb9bp6DIqXln
         3FpeX8h806MQW7gXHh0/Z+WuMGExkpojuFDWc0KmlN4h1rxVx2TDvgVjNrFoXCK/UQz2
         8onqZZeeQCfJgF5MyE7VLp7zJqbSp1ucFIbss75NO26Fne2TAc6bbXbqFKz3NCo91aRU
         DwLLq7eRqJUMyCRZu8OlBdrJS3M7EfXfC5cgCY4rrEB1NTD1Aux9ii6xKGqf9x2ybyvk
         z6qaA8/ADyYDbOoznIjYaqZtB0/3DNSjNlmo9s6dIzf2TQwjPwbBBeUldki5BjDGdd8p
         uM4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702374003; x=1702978803;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T7WSPbehcijEKgEJWzyVTs2cXCZ1wk5EWf1JMP+vpZw=;
        b=WMW/I16jZsO2QiS6WtMT49vOroljKn2i9IgDUsYqN1+4QThj2rHlxUXPelbn8OlHGQ
         dK3uFYf+TFOocU7WOiN8PpnJY86VziLNcT8yCZ3oHfkiONrXQR89BOy3Vuzzze7hW5xP
         gMPlR0E/txAdbLoQ1wbJobvc6xpir2Bqli6xj9GJI3TPrkrKROr9+AORRh7Up0N2FtVl
         niUctvMuYhz6zHvSCMmKFktBPEwEFEsdxgChsJwGl75soDQAUqpfhRL5s3373b7Qa647
         lZsZ15INw5aHnDs8R43bdaCq8IMYXuKi6HsoJh8x9C058eM3fdf65ICJlZSgoFH8c8Vv
         7LIQ==
X-Gm-Message-State: AOJu0YxF+Qv3aNoPMl6xQ1VeQEYolOwY/76aZPS9bNsiaTuqUrbrmrFb
	cybMB5BrioCuh5kKTMhAGfLljw==
X-Google-Smtp-Source: AGHT+IFzFmwY5xwsSBjeFaYogBsab8uI25xMWlwPgCNrjrXjwWM9aMvv9w1//6BcPicBY41+tDiU/A==
X-Received: by 2002:a17:907:3d8e:b0:a19:a1ba:da4b with SMTP id he14-20020a1709073d8e00b00a19a1bada4bmr3632691ejc.114.1702374002701;
        Tue, 12 Dec 2023 01:40:02 -0800 (PST)
Received: from [127.0.1.1] ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id ub26-20020a170907c81a00b00a1c96e987c4sm6037240ejc.101.2023.12.12.01.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 01:40:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 12 Dec 2023 11:39:52 +0200
Subject: [PATCH] arm64: dts: qcom: Add SMB2360 pmic dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231212-x1e80100-dts-smb2360-v1-1-c28bb4d7105e@linaro.org>
X-B4-Tracking: v=1; b=H4sIAGgqeGUC/x2NQQrCQAwAv1JyNpCkaMWviIfdbWoDdZWNSqH07
 waPMzDMBq7N1OHSbdD0a27PGsCHDsqc6l3RxmAQkp6FGFfWMzERjm9Hf2TpT4RUhiLHSZTSAJH
 m5Iq5pVrmiOtnWUK+mk62/l/X277/AMpXxoF7AAAA
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=cENQN0lGVHkALBwjCWgcaICqf2Y63xNy5bQr8heDzrk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBleCpslNoWRkn7+O49nH1Q8ovNlCDxqv5SowLTF
 dqdYY0TDS+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZXgqbAAKCRAbX0TJAJUV
 VsBSEADFIrPMRJ/aVC7MlIn49AwHaxVBk6HCuBNApbP82miRDGenqLS1IbGX2x+K8bIczuml1lX
 MfI4P9guC3gn+lONJ8YIqAQVQW6v6UhS9nCJvSbkGFPYarnkT3QaDkm/xZ+YZVDJIRhtmZZbWZ7
 XjT9P3NIf0vQf5s9p2MiBPhzEwK2rQUK0I48kEIhSzx4KGktO+TToQnVMhy1LyCz3L08oYXJtxm
 sYzklmvwTOGQo8xiqgzveaUhJfgyQD/S6CRFplaCS0Z0/lPVbWLi7quw11SVbQftTYZoCNEz0wN
 zXHP6RrIuPzCvmuQ7NnP/WxuZ3cGwrk54tF6IuA2ruQv800OLInJTkN1J3joPT5ieBt9ICSJmfO
 Tn0XMmExWzSPr7sAe57E+Apv/czMvZGlt92BVMa/YX1gLHuE/cAEFNnN7r30jEOfSt0IJsW6Lsy
 IwZZvkuubVNm7p0JJxhF++5apJTjV45nxPlpJS8gGhMx8JZWS2sXrJxIgVfXU5BqfnrPZW8/0i9
 azs2DjW5XxlKKjpXezYzrQtD8ComuTaddbxWKF6pHEBisqTSW9i14GfxdevFxUxJJ4+cV4cIDAS
 J41bS5uLg4pmTMBPtyuhhRd/ug+D2ZLYwHzgzysnLVNhb5w93+PfwAczyB14g5Oj7RTHlPxH/1i
 ZJHSk97VOCoHzRQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

Add nodes for SMB2360 in separate dtsi file.
Also add the eUSB2 repeater nodes.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 arch/arm64/boot/dts/qcom/smb2360.dtsi | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2360.dtsi b/arch/arm64/boot/dts/qcom/smb2360.dtsi
new file mode 100644
index 000000000000..782746a20403
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/smb2360.dtsi
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+};
+
+&spmi1_bus {
+	smb2360h: pmic@7 {
+		compatible = "qcom,sm2360", "qcom,spmi-pmic";
+		reg = <0x7 SPMI_USID>;
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
+	smb2360k: pmic@a {
+		compatible = "qcom,sm2360", "qcom,spmi-pmic";
+		reg = <0xa SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2360_2_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2360-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+
+	smb2360l: pmic@b {
+		compatible = "qcom,sm2360", "qcom,spmi-pmic";
+		reg = <0xb SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		smb2360_3_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,smb2360-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

---
base-commit: bbd220ce4e29ed55ab079007cff0b550895258eb
change-id: 20231201-x1e80100-dts-smb2360-0c7c25f2e0a7

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


