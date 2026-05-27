Return-Path: <linux-arm-msm+bounces-110013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBKdKlcWF2px3wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:05:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DC85E7702
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 18:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6286330FB486
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 15:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A44537757D;
	Wed, 27 May 2026 15:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fTNAv7/U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UGNKC49N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6863812EF
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779897341; cv=none; b=ae7OLK9WAU/+UhveIVzqf5dEq4E5tBpT7dLftJASiPqDtyMhQkxZEka7+j+btyrLztRu7Ktmxi1MHCb7SbUI1f9xppZjMf1cD2kIMcGPIgUfRZGSj2mjnju3UkVNy1RT5sdhJOWBgY0T2oJQYLdsKWLyY1zvR3XCubRMHjufbJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779897341; c=relaxed/simple;
	bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c6qz9W9hEv63mQJoKgtt3MWmO+mXzXWbuhtJ9InFzwZ3gQ/qWbYUliywxiKoQ5MlCXWoq+LEm4v9cdfCx69zFfd/ZihMDKg/YvrjXYqM9aJ3Ru7DSiBNAezJLBscOp4wCrN1MW5p9DQEocSz5rCsu8BXtZa0sbvTzgxqTBEgcdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fTNAv7/U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UGNKC49N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R9qxkV195636
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=; b=fTNAv7/U0s06ofwW
	nAzjM0I+zLtA/oNDghX7Dblbt6yJMLIOOEfju9QfkUWoyDv87OhK5diURuWhyGwW
	AdZDGy5Pey+FIW/VLNZ2P36U/Pgv7NCqaemC2ioXWO8AnMtHCMeJ/8FCSh77qV1l
	NoCxj8f45iz9g0sPLpZnDlz5fRiNqgzy6dIuAS8BKB4Kz3QvCzGsQQVRRAt++Ox2
	FBUKwJnzLsDIsE48DHO6bqzlsgOGxYE5MKlKskHDKeAZMUFvQ++y4t2tJdiNdFeH
	7mRTWhY33jWgLn5w7RioOp5LgbGX73N2tYeno9hH7X2znQjI8yGlWK80jheAk+x6
	V0lLTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edxce9c2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 15:55:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bf004bf8beso54715ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779897338; x=1780502138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=UGNKC49NRnJKBFXD2uMhU5g8bhrXPHn71m1Q3F9Ck8hNA4zP5QwHeEKHH9RsanejqE
         6nCKI9Glg/xdSRTUf+m3n5wTGAyPftCixJeqsw8DmxUL9najRIv9KtDBeKp1Kn4G9Rm8
         AGqgW3zvF39InHGrHsbcQtCYcfuVaKQXPqr45F7wTgy/NTQbNKdsc8V7AcxmGhDK5IS+
         ov5ejwSwipqsF8FRBzsb+wNDqo38rOZKvHi/EAPIxmMKXU5Q4mI0Xazv5V7w2p4mPh0I
         ZgepkVuNZtykQLpfwEpVcUY3USh5YlhQOsGtGzc7DssAxLPX3t+uyrikaG2uwIIIgHBB
         J+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779897338; x=1780502138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bgj6PUY7ZZ+fmCMVs+mu7PkuSkqWbqfaZ9Grtyv48EA=;
        b=gQEhwqRYmde/zQwC9jKBIEInwLNO7CC4RH3+NTP8cdP8EFrgtLMSTGp/7klSJGs8GU
         /MtE+bcN5c8I7hp2b1fTpitDozRwItW7nYZJ9Yp4Wrz211EUXU7+owbBtHXyj8xri3lH
         FeULOLz3WSwjSFf+rKPJLBdzG4YhD3JMW49E6+D7GWyMlI9HxHKesGqdf7LxBv2JpXJs
         P2LLsYGxumxNKuDj9xZ0Nu/OSVv0fObfpr74qj+mGNNqsn4UuplJlQBz8f3RjArKrGr2
         HCmYQ8TXVa9MQhOTF+TufB4Cbi9M7UQp1X6ux1ujfmOvEEDCapspcAYXKtAY3lSXn/uu
         hLNQ==
X-Gm-Message-State: AOJu0YxwNvulqhscS6+GHZm5JFxQGnuNcM9OAQs0GMeONTD2IguSfu4f
	FFo1NBxO2NHWD5X1POQdJFqp8Yb/X4H6abn7OnoQAZutquGGUwRxjlS3ztKmOBAhMTgliPnS/6E
	pNaxEc2sX9DS2R6rVwJ8lgZY2ZDpAPohanmhpkPbLEIMsADb6huEFSjilQ2LoxCpRAei1
X-Gm-Gg: Acq92OFUcVqP63kMP7fZTewTrE2oxbxX1X8g1E8dRHYawfHZOBKP/OorM2ksYaPAGyK
	UpF4Cjlo+IUhnr6fUiwaT5CLfKMdxnBoM0LQ9SbtTkQeId5t1x6yGb9CNrwZRkrS3u0/6qGlf7H
	3HU3csOrIAJJokFw5f8wCS9BjAspjKHHratPtnmecfsv6wuFWOaMoVsbvbx2w8zk9UJXultC0l6
	H2c7VLt+YCMiXX9sNpHtgslEqAPbEzk4Sf/Jt5ZUv0sYNXgfPCAZ9iek+ATijRNeZLA7VHkR8Rr
	4V++cJm5rQFkGdEYel4mdVabOYbvnpSoyZ7LGTqyQ8ARFxz3q62e3usv2SY9fU5+w5wenh7+i4u
	CGfVnWeBIzfTvMQFLr//SwjKq1eBoC78HbW4+
X-Received: by 2002:a17:903:3c2d:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2beb067ac30mr244530505ad.40.1779897338304;
        Wed, 27 May 2026 08:55:38 -0700 (PDT)
X-Received: by 2002:a17:903:3c2d:b0:2bc:7d4d:3520 with SMTP id d9443c01a7336-2beb067ac30mr244530175ad.40.1779897337822;
        Wed, 27 May 2026 08:55:37 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beff36894dsm1264135ad.37.2026.05.27.08.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 08:55:37 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Wed, 27 May 2026 21:23:53 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: Add Shikra CQ2390M SoM platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-shikra-dt-v4-3-b5ca1fa0b392@oss.qualcomm.com>
References: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
In-Reply-To: <20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779897312; l=4449;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=w1EEpnLR6xXq+MivEnb+PLIzt6dGl5j6KmvIWASlAcs=;
 b=SSYZK9Rpr8hJBNsTGlg+BunartDZMb3yNPpKUlyA82S0mBXZMa23IXdgyJb41W+mRevsEm892
 ENdJhXTBgQRDuq2fsR1i5Mzwp0HyEBfauCiXgMQXXxXPPrulLgpig4L
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: NfsHy-dlXogBVrnbDZJeCoZ4yzKV0xuF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDE1OSBTYWx0ZWRfX4tnRipPhrJ3z
 1IbTns3TzO2agCYuEx4nVNxoV9WLckCkHaJ+jiszeJrjzFd835puzgSX6LMcWo/818nBeyHTQp+
 1th9Go8GSxIjGoVSm/ZRKHy/yTzpc6jmp6y8dJwZA6pbaao0NyXphOcMJJZLy1t8GUPS2yc1z82
 XujjvSauW+JXH3fsGKe6UUH8LQQgN3ZY82aSws+4ZlE1SxatE4rA8E60m6CaiL5BJB2fV5D4rtq
 +t6bG/WOEUhU9CDso9M7RfO9oKfrI1wSA2FaMadbsTa3mYKwwKgZkrQ9BtkOHRBSDrYWXXw/pHo
 trtH7FRg5LbOAffH2tn0u18REPZMdbrewy1IFRODlFJmb42DAK+NisZNanPwSpsN/ERDwDXltK6
 zecIdv69Hxm4YLSWx6Ob/yovHoElJqS4gphcPtJY10x7UpVb8/qEM2z32jP0pgGDa2iEIarv/mH
 FhwUIG4b/bWlREed4BA==
X-Proofpoint-GUID: NfsHy-dlXogBVrnbDZJeCoZ4yzKV0xuF
X-Authority-Analysis: v=2.4 cv=SIpykuvH c=1 sm=1 tr=0 ts=6a1713fa cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=s31jhp6hv9j5UOuNascA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_02,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270159
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110013-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02DC85E7702
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add device tree include for the CQ2390M variant of the Shikra
System-on-Module, a compact compute module integrating the Shikra SoC
and PMIC for IoT applications, designed to mount on carrier boards.

  - shikra-cqm-som.dtsi: Retail SoM with modem (PM4125 and PM8005 PMIC)

The DTSI includes the common shikra.dtsi, adds PM4125 and PM8005 PMIC
peripheral definitions specific to this variant. Since PM8005 regulators
are controlled by rpmpd, so disabling the pm8005 regulators.

Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
new file mode 100644
index 000000000000..dc3861489f64
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "shikra.dtsi"
+#include "pm4125.dtsi"
+#include "pm8005.dtsi"
+
+/ {
+	gpio-keys {
+		compatible = "gpio-keys";
+		label = "gpio-keys";
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm4125_gpios 9 GPIO_ACTIVE_LOW>;
+			linux,input-type = <1>;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+			debounce-interval = <15>;
+			linux,can-disable;
+		};
+	};
+};
+
+&pm4125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio9";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pm4125_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&pm8005_regulators {
+	status = "disabled";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm2250-regulators";
+
+		pm4125_s2: s2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm4125_l3: l3 {
+			regulator-min-microvolt = <624000>;
+			regulator-max-microvolt = <650000>;
+		};
+
+		pm4125_l4: l4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l5: l5 {
+			regulator-min-microvolt = <1232000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l6: l6 {
+			regulator-min-microvolt = <788000>;
+			regulator-max-microvolt = <1050000>;
+		};
+
+		pm4125_l7: l7 {
+			regulator-min-microvolt = <664000>;
+			regulator-max-microvolt = <664000>;
+		};
+
+		pm4125_l8: l8 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l9: l9 {
+			regulator-min-microvolt = <875000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm4125_l10: l10 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		pm4125_l12: l12 {
+			regulator-min-microvolt = <928000>;
+			regulator-max-microvolt = <975000>;
+		};
+
+		pm4125_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm4125_l17: l17 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3544000>;
+		};
+
+		pm4125_l18: l18 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l19: l19 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		pm4125_l20: l20 {
+			regulator-min-microvolt = <2952000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		pm4125_l21: l21 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3056000>;
+		};
+
+		pm4125_l22: l22 {
+			regulator-min-microvolt = <3304000>;
+			regulator-max-microvolt = <3304000>;
+		};
+	};
+};

-- 
2.34.1


