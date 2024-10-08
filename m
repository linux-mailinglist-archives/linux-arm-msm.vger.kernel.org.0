Return-Path: <linux-arm-msm+bounces-33602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7731299550F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 18:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2E9811F2592F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Oct 2024 16:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A28501E283D;
	Tue,  8 Oct 2024 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkmIOS6d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620A1E2833;
	Tue,  8 Oct 2024 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728406349; cv=none; b=rw0kgHm15QhzquHnscKorsqvIgceh4jcjb0OgKgzhkkpp8fzUM4XLalXDy1qnima+rgNqeSsKdvZigstC9otX4LCc+63/CEzn7uDmCD/22J2bdOzdtloZlX5HEuDQGSJc+akuDQOVFxvMYqhqKSvkewyIEs80hTv3JDkLabVvHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728406349; c=relaxed/simple;
	bh=/BvAmVblOpHYb2aTkXowqFQ02GBnGaeeHMCyDt71li8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A7WKQw6//hySZTjrt2PxXgQm0+ea1IpX1nivAgLNOdiZVcblWJRH3kzRBQw+oMoskkM0pDD2cCYuBx+XHUl4vSVw9u8GS4hkIbeS0ihFJ3GJZpyBjsJNDwuKTrX1MzUGuRDB/rljqyj7GR+iXh7O6MQBsDNqGtaCo2uI+a+ON7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkmIOS6d; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398f3be400so6718815e87.0;
        Tue, 08 Oct 2024 09:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728406346; x=1729011146; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A8t9qQVUsbWkU5n6pD1arXLdocmReAsGppwKB5aKWDk=;
        b=ZkmIOS6dULfe4jEYmLi11VHtyXjlJ1sO1YC6Mw7z5OXTVqadZfg1C58DwfO0m6DbH5
         ZSoMkSZyVEjxLGF0y4YrgQfI4pCdm3KpnUewCYgUgn41Y9OdGIperTGSBD6xDcOFzZq0
         aYtpMdCRbxg3VNeAf4njLW3OhKpi2VbzlqZC7o06uFRhmnf3Gdym7mQsT12VT1tK/AiA
         5RJc3KbO04G9tdMe4aoxe1FmAuHr5uPTI3cvJ6AGKZenQ47PBYdgvOwvYjV19hDW9oXu
         ScgqhWJDm6BperFXdLnEko84P5r19VrZUWz9BWopwLnfG+6pAwvf5p6ObR2ze9DeA/uc
         ZqYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728406346; x=1729011146;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8t9qQVUsbWkU5n6pD1arXLdocmReAsGppwKB5aKWDk=;
        b=D6KnWRgT4KsxA3KavbFPpV4hLiOuW5+/+yA7gZt2Yonzop1k5Wov07054mjLeYkyco
         TbU4wMi7gjthUq/OhKYi6mwc/irCpvtVmzXviChjLh03+ws/Qn6mGcj4odQSNxQTvJMp
         A2sGa18mmuaAOv80jEDJNSZeyMDicdHcSJqTFQXXbFP5O3ljq+S8tg8/Uc5bGuPmrpCH
         0tTxjYGPs8qDw3nVqNYy3D6QoEOosyyZHA/nMGlZ8QFyf42QxgijRKxmYQhLCg3dYc8y
         dGwxMs/ur9P1vLlh32R7In9KIviLaru8w33Slklo3P/MDmBtwSt8J2vIi9aOZkC23EGD
         7lZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUFTGqoFkPEDdtJzDjnahww5ALM7lteJ4FMjI1cl+ip5X37pRfwllK7PL247OhnwQ8dfTLTkzxSWeYo@vger.kernel.org, AJvYcCXLTd0BFv9GA3y634KXAym1kT5g37b6+QFZ76Sc0UeWn69YCP637ucddp4n2gUKeuVU7clPSkgdeM97sPQp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7kcTFVUgyaw/fOPEa7051MsiTq3dgUPuEDjqkKpENlxRfqvJC
	/cx4iZqFUdKyoDoQWVEKfQyH379xJad+Z7OIxntHxL4li13NFITbkbksXg==
X-Google-Smtp-Source: AGHT+IGjzzpu8k00Hfaw9O7YXOPKIhMEqW7WUnyfgw3rmv/lvEBNO4fIGak31k8vlWm1/kmwjnXooQ==
X-Received: by 2002:a05:6512:68d:b0:535:63a9:9d8c with SMTP id 2adb3069b0e04-539ab87482emr7480170e87.17.1728406345622;
        Tue, 08 Oct 2024 09:52:25 -0700 (PDT)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-75.telecom.by. [46.53.210.75])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-539aff23e5fsm1260736e87.235.2024.10.08.09.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 09:52:24 -0700 (PDT)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Date: Tue, 08 Oct 2024 19:51:49 +0300
Subject: [PATCH v6 12/12] arm64: dts: qcom: sdm845-starqltechn: add modem
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-starqltechn_integration_upstream-v6-12-5445365d3052@gmail.com>
References: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
In-Reply-To: <20241008-starqltechn_integration_upstream-v6-0-5445365d3052@gmail.com>
To: cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728406308; l=2133;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=/BvAmVblOpHYb2aTkXowqFQ02GBnGaeeHMCyDt71li8=;
 b=Uxo1drgaL78ZNLUbhb3s96yVBQJIYn2/0Mt1T6HyYPqkj9oWs7+7xbUIATLTNqEFt2B2Z22WQ
 Xd391M3pqetA4gzlyQuLXkJJQBURowCT3n7w+RuFwDNRupSCHLFd41O
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=

Add support for modem and ipa(IP Accelerator).
Add spss reserved memory node.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>

---
Changes in v6:
- refactor: s/starqltechn/sdm845-starqltechn in subject.
---
 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
index 043ae14c4fa9..a10db080e483 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
@@ -17,6 +17,8 @@
 #include "pm8998.dtsi"
 #include "sdm845-wcd9340.dtsi"
 
+/delete-node/ &rmtfs_mem;
+/delete-node/ &spss_mem;
 /delete-node/ &adsp_mem;
 /delete-node/ &slpi_mem;
 
@@ -91,15 +93,39 @@ memory@a1300000 {
 			pmsg-size = <0x40000>;
 		};
 
+		/*
+		 * It seems like reserving the old rmtfs_mem region is also needed to prevent
+		 * random crashes which are most likely modem related, more testing needed.
+		 */
+		removed_region: removed-region@88f00000 {
+			reg = <0 0x88f00000 0 0x1c00000>;
+			no-map;
+		};
+
 		slpi_mem: slpi@96700000 {
 			reg = <0 0x96700000 0 0xf00000>;
 			no-map;
 		};
 
+		spss_mem: spss@97700000 {
+			reg = <0 0x97700000 0 0x100000>;
+			no-map;
+		};
+
 		adsp_mem: memory@97800000 {
 			reg = <0 0x97800000 0 0x2000000>;
 			no-map;
 		};
+
+		rmtfs_mem: rmtfs-mem@fde00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0xfde00000 0 0x202000>;
+			qcom,use-guard-pages;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+		};
 	};
 
 	gpio_keys {
@@ -837,6 +863,19 @@ dai@5 {
 	};
 };
 
+&mss_pil {
+	firmware-name = "qcom/sdm845/starqltechn/mba.mbn",
+			"qcom/sdm845/starqltechn/modem.mbn";
+	status = "okay";
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm845/starqltechn/ipa_fws.mbn";
+	status = "okay";
+};
+
 &usb_1 {
 	status = "okay";
 };

-- 
2.39.2


