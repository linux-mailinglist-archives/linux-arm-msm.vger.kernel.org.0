Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC1F020767C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jun 2020 17:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390829AbgFXPDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Jun 2020 11:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404074AbgFXPBi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Jun 2020 11:01:38 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55605C061797;
        Wed, 24 Jun 2020 08:01:37 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id q5so2608300wru.6;
        Wed, 24 Jun 2020 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xGorQfVoMZ+iUqaW92DxUbanNK0hY2uxj/Pn+f4/4FY=;
        b=nqfRdppQ7wb2SmZSudqseQh0laa6ufOSNlKBSb9OMzpdGXRmD0WZjWlfsi7TGU4QvI
         efw51ziM1lG8+eer2dOg46sExqXuB/+U8xb6bBJLYYpFvVvLScB7o0OCzJMTISt6iPxR
         4/TptLjNbDYVifYDFMwnPaKyflHHw5T6znEBcgTyhucemB+hnZOzgRuGEcibK5jAX1Dd
         Rk7JwxEmyVemkFI9C5mSEnddAK6gBKHh3IVm5Xo/8nZIs+cL/Iza1JU8ztf4Xue9xh/9
         KMlgZPRnk4vVO9/QbXfZK624a83Y/PLEaAGZlHIL2vVlEHravG2Lv9pFliPmeXnHKVww
         xeIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xGorQfVoMZ+iUqaW92DxUbanNK0hY2uxj/Pn+f4/4FY=;
        b=fMEP5bsVvUpj6f3HAskuuCYjaXgwadWVImJv/CZr2ja/FWRnL8BSYFWsVZCIWuOuPZ
         8Ff6NQLxPwAF2REB8dznVJjOhb6hiuvWHYdFuJVYLljxhR9cU7sG8pXZe+r25SA5Wdgn
         DVqhtvUuPE3d49kIjWKIcET6ZpmKY7R15Sm5zRQtCB/s1O41usTEZsiSONcJng4LJ10h
         Sk01/5bcJMtQcKL/VlC3VYNH50LMJfJI/itYI8rputRAQFsP/FoQKRMk0tatPAE5PcoF
         D5dtVFDiIhDKAdeTNRhkUj2F+ELXgazD5YO0V6Xo6uerG/pgZ+oWGUQWCHgUwaGmG9X9
         C4mw==
X-Gm-Message-State: AOAM531jL8+DGtVRikHAN+WIX1wAfp5DlLT3AhNBwUBnBOJwLqUk/lL/
        dydm+Se4F612dtTrk3semdM=
X-Google-Smtp-Source: ABdhPJxNVNapZG5qULGdKNo0tydvp+YoV+TiiJlp1hlDDGxJ52qcRJsAPdNPjn0DTojsRd/qhAIagw==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr1745972wrt.5.1593010896085;
        Wed, 24 Jun 2020 08:01:36 -0700 (PDT)
Received: from localhost.localdomain (abag196.neoplus.adsl.tpnet.pl. [83.6.170.196])
        by smtp.googlemail.com with ESMTPSA id s8sm21339390wru.38.2020.06.24.08.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 08:01:35 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     skrzynka@konradybcio.pl
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Kees Cook <keescook@chromium.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] arm64: dts: qcom: msm8994: Add support for SMD RPM
Date:   Wed, 24 Jun 2020 17:01:04 +0200
Message-Id: <20200624150107.76234-7-konradybcio@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200624150107.76234-1-konradybcio@gmail.com>
References: <20200624150107.76234-1-konradybcio@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for SMD RPM, including pm8994 and pmi8994
regulators.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 43 +++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index bf5aa7308b63..cd1476dfeca4 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -175,9 +175,31 @@ smem_mem: smem_region@6a00000 {
 		};
 	};
 
+	smd {
+		compatible = "qcom,smd";
+		rpm {
+			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
+			qcom,ipc = <&apcs 8 0>;
+			qcom,smd-edge = <15>;
+			qcom,local-pid = <0>;
+			qcom,remote-pid = <6>;
+
+			rpm_requests: rpm-requests {
+				compatible = "qcom,rpm-msm8994";
+				qcom,smd-channels = "rpm_requests";
+
+				rpmcc: rpmcc {
+					compatible = "qcom,rpmcc-msm8994";
+					#clock-cells = <1>;
+				};
+			};
+		};
+	};
+
 	smem {
 		compatible = "qcom,smem";
 		memory-region = <&smem_mem>;
+		qcom,rpm-msg-ram = <&rpm_msg_ram>;
 		hwlocks = <&tcsr_mutex 3>;
 	};
 
@@ -196,6 +218,12 @@ intc: interrupt-controller@f9000000 {
 				  <0xf9002000 0x1000>;
 		};
 
+		apcs: mailbox@f900d000 {
+			compatible = "qcom,msm8994-apcs-kpss-global", "syscon";
+			reg = <0xf900d000 0x2000>;
+			#mbox-cells = <1>;
+		};
+
 		timer@f9020000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -451,6 +479,11 @@ gcc: clock-controller@fc400000 {
 			reg = <0xfc400000 0x2000>;
 		};
 
+		rpm_msg_ram: memory@fc428000 {
+			compatible = "qcom,rpm-msg-ram";
+			reg = <0xfc428000 0x4000>;
+		};
+
 		restart@fc4ab000 {
 			compatible = "qcom,pshold";
 			reg = <0xfc4ab000 0x4>;
@@ -668,5 +701,15 @@ timer {
 					<1 4 0xff08>,
 					<1 1 0xff08>;
 	};
+
+	vreg_vph_pwr: vreg-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph-pwr";
+
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		regulator-always-on;
+	};
 };
 
-- 
2.27.0

