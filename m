Return-Path: <linux-arm-msm+bounces-3995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C3A80A6C0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 16:09:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E300281C47
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 15:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9C0208C1;
	Fri,  8 Dec 2023 15:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="VPTGQdeE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07A871BE9
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 07:08:58 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1e116f2072so468532866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 07:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1702048136; x=1702652936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqrSmJU5gLvma/2IHMa7gR6Hq0mtDYm0i9eqgtHH0+E=;
        b=VPTGQdeEGXUU5dn4SH+WlafMU43pffwErmMOBWY4wn3UWyMVCmVBHnJOyAUbSm4LvQ
         vb7grIoyf3Kat88guVFHVO7kmT3iPyS2woUcnw/vTJAHmBejvTctVBInynMdppBLP678
         aC7X3uWPp8SdI2VElmj1S6JktyM3VtHmgbGrjO4pqc8DDxdrOzKO0Vp0iXEE/mAkrczh
         Vy4AX0YaApaQw9tsysF0FNwUKfg9JYfsQpPAnS161aHnJAPnn81ZF90msaIU12l9yFG1
         +9Rcq6OJin98ARBSI3jXvN04+oe5MIP+W566/Hs0Sxmbnp6nBMDnSWq/ESQfMbMJ36D5
         KMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702048136; x=1702652936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqrSmJU5gLvma/2IHMa7gR6Hq0mtDYm0i9eqgtHH0+E=;
        b=tWQHhCq6C5rxJAayhobLq6R0xz16iebq+cXdXtEBVf9fp7VRXEuBu0ZaKZJijvKcee
         YW2pawkxk+S4OhlE9iuXpl+bw6a36phqeP5gDU8xe5Zj+4m6RV/tHRdAewlMTXPLRef7
         0czC18q6tYN1Uf3n0P0a5GTbMBa57njqVvBPK4jAm6Cd3jvdwFPMbROjyRGJ+N5/yjuY
         Xz/Jpd8Uo2fsxSmss8ubcJeWNMrxWLXhe0C6APoyT32L4DupoljbJZ+fHcVNzl8OcZ0P
         /trYYI6XnCtfOci/jJi/ssxlEWCYoZbaLuPWW4xgT5R9svCC6hCVKjJCF44akWYSXVBZ
         tSJQ==
X-Gm-Message-State: AOJu0Yyj7zAUimNC53m8zwib0mhXDFeg0jWafh97/llV/jLB2Mvio6Yr
	gdqxY4WBmEaeZsZYxDuf2exH5w==
X-Google-Smtp-Source: AGHT+IGTQhlhJ1xFyoTKSC+7o/RFvSRTQJNibHssLu7iXJXYPwK6jAMpxaaw1X1WFMINKL0IlQyvPw==
X-Received: by 2002:a17:906:f142:b0:a1d:5483:d152 with SMTP id gw2-20020a170906f14200b00a1d5483d152mr286736ejb.68.1702048136590;
        Fri, 08 Dec 2023 07:08:56 -0800 (PST)
Received: from [192.168.55.221] (tmo-113-102.customers.d1-online.com. [80.187.113.102])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906351900b00a1cc1be1146sm1096114eja.217.2023.12.08.07.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 07:08:56 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 08 Dec 2023 16:08:00 +0100
Subject: [PATCH v3 04/11] arm64: dts: qcom: sc7280*: move MPSS and WPSS
 memory to dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231208-sc7280-remoteprocs-v3-4-6aa394d33edf@fairphone.com>
References: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
In-Reply-To: <20231208-sc7280-remoteprocs-v3-0-6aa394d33edf@fairphone.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
 cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.4

It appears that all SC7280-based devices so far have mpss_mem and
wpss_mem on the same reg with the same size.

Also these memory regions are referenced already in sc7280.dtsi so
that's where they should also be defined.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts      | 10 ----------
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi      |  5 -----
 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi  |  5 -----
 arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi |  1 +
 arch/arm64/boot/dts/qcom/sc7280.dtsi                    | 10 ++++++++++
 5 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index de49bb11f3c7..10f4c75aed3f 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -87,16 +87,6 @@ cdsp_mem: cdsp@88f00000 {
 			no-map;
 		};
 
-		mpss_mem: mpss@8b800000 {
-			reg = <0x0 0x8b800000 0x0 0xf600000>;
-			no-map;
-		};
-
-		wpss_mem: wpss@9ae00000 {
-			reg = <0x0 0x9ae00000 0x0 0x1900000>;
-			no-map;
-		};
-
 		rmtfs_mem: memory@f8500000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0xf8500000 0x0 0x600000>;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 186aa82ce662..fd3ff576d1fc 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -40,11 +40,6 @@ venus_mem: memory@8b200000 {
 			reg = <0x0 0x8b200000 0x0 0x500000>;
 			no-map;
 		};
-
-		wpss_mem: memory@9ae00000 {
-			reg = <0x0 0x9ae00000 0x0 0x1900000>;
-			no-map;
-		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index 203274c10532..b721a8546800 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -8,11 +8,6 @@
 
 / {
 	reserved-memory {
-		mpss_mem: memory@8b800000 {
-			reg = <0x0 0x8b800000 0x0 0xf600000>;
-			no-map;
-		};
-
 		mba_mem: memory@9c700000 {
 			reg = <0x0 0x9c700000 0x0 0x200000>;
 			no-map;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
index 2febd6126d4c..3ebc915f0dc2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-wifi-sku.dtsi
@@ -7,5 +7,6 @@
 
 /* WIFI SKUs save 256M by not having modem/mba/rmtfs memory regions defined. */
 
+/delete-node/ &mpss_mem;
 /delete-node/ &remoteproc_mpss;
 /delete-node/ &rmtfs_mem;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index f4d02d9dcb55..221ab163c8ad 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -158,6 +158,16 @@ gpu_zap_mem: zap@8b71a000 {
 			no-map;
 		};
 
+		mpss_mem: mpss@8b800000 {
+			reg = <0x0 0x8b800000 0x0 0xf600000>;
+			no-map;
+		};
+
+		wpss_mem: wpss@9ae00000 {
+			reg = <0x0 0x9ae00000 0x0 0x1900000>;
+			no-map;
+		};
+
 		rmtfs_mem: rmtfs@9c900000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x9c900000 0x0 0x280000>;

-- 
2.43.0


