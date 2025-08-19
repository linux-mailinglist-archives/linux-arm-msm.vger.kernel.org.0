Return-Path: <linux-arm-msm+bounces-69661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A28B2B9A2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 08:39:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A27961888AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 06:38:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8691284891;
	Tue, 19 Aug 2025 06:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZVEiNzhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F80126A1C9
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585424; cv=none; b=Co1rQa8PmB5JB8BbHLSpjdoiKgQD2EggGqF7NlfnEl2VYPe+3QJssrbOV+FFF0gJt/kWrJOOloUB9h/qw1BoeYcpFEvZvywPEnYQ95waKz7KGpqQRXwN/HuGdJia4jsx/Du+m5N5zbb7+2TZ1uHpGKdpUUe0j+F5xy/kIaCoIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585424; c=relaxed/simple;
	bh=u+tZpwkQzuSc8msEuFt3VhKgUqTRRkSt/nts4l2YdIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=trV/k3Uon6QiqzuO7S5z0+WmQKc6OmGxFWUV3WHAjyWvmG12m4ACQtzuWCm0Pd7KBAbiEOIPUbCrpKHogIvsGAuHsi/DSruFM166Z7Kn+SXIMkIoOyS6KFeh6gs4rdrtDsJisFaQnE+1Vhr6Wm42cQvoDv6Jjtx6ww/uAGvrerU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZVEiNzhE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J1rleX001815
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=; b=ZVEiNzhE+Tl4Rj0R
	WulZY0o88RbENvsUmd0z/k3HgdH2FwIr7UOWqe4HWznqHxKNw3veSNzHTlo/6KM3
	Z8aH3SMpTRqAr60UMrisijuT5gL7edu97lM1rq9ubQ/LY+yeWp4E/2CI9dScNIjA
	dZqQ5Ayx/Hob80EpiF/kF0fI1T+JRqACqtYH70xH6NgKgQeScquJy9RpNjOscb/N
	eYoulDAagOm67pDis7TBMpcuDTND1IkySdHNx7AUFGOhkPjisi3M86oL4bmbJken
	HPVPmzX+BBiflXxhz1DZcGZI2t423A3J9YTJt/1mSmYfr65OuoCe8WpWRvPSN+Fk
	mR803Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh077gj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 06:37:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24457f44a29so60395795ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 23:37:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585421; x=1756190221;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ae35zkKIC0CJ5nbsXi7yf5SwcQqgHmGyPNS8+VvWx1s=;
        b=RleS2O2juMa4L5xwHruA+fpI8lCroRTrvhtzy9zDpZrKH0bsM4DdAMiCrlkkOs27dt
         8bLnxF3mfPRxdCwOyoeD09mJe4azaUcPe/d99qXlDNIyaBlyuQ7qldgT1UTYr0Nh+Pqr
         t+QvhZ99kh68xwtaDOY5+BwFOL6u00ge1G6b7fPQXQeIKLwm49gkGgOP3ZPmGUsWHN6i
         RdBCX+9Lhj0gYsxR0mDsUH58JZBd4d77udyOmiDINVzD9yD23VV3PZVeZCix3jCCk3+V
         yLUVr7qRr5jqEGHTfNYVuNbbboFC+QT8prwWHYaaRYJjo9d6WtiOXvwzJXjhsq8V106a
         JvDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSRFidsjsWfl8kRjGV0ot96aeWoyZ0AHnjEiY7ULLW6f97Rgx9JczsFl9uKQl37by3MSFnVuBoGY+8jaZC@vger.kernel.org
X-Gm-Message-State: AOJu0YxIS0Fdu4Nhj5PONsXHT7h25ydwQpzyRe2Kddr8pl8tlkFn4fro
	RlVBmMzrZ+YL+biELRe6bO5Zd3NCabsUZTwHeVxMOMc6Yef/N35DK7LjDckQ/A4MjrIuAYEzAdC
	wvBID+C07+hoju/+1emn8BANpT+PHScuiNHYDm5UCJsS2tXj9FmztwhmfkxTbZRTARsp9
X-Gm-Gg: ASbGncv6Hx+RqcaQkveGmWrhRHfagavqK+crHuptkDzeylojKALU51x1F8cSFjRqQ9X
	uoICrStsTP2drXxW9lCbToNsAlQ+ZlfbotA9bl6qeAJh3xyieR9KoPlRhx+9pht1rljqSL39PCC
	pJLxxxel3gRqMqJTL6sOf0D+VAJYKEnhQXJDFq0ghIP0gaNI7sfoWbuHdevR4VVGxgdnsGw6tMV
	+Cuj50FPMdensN/GL4YUoRovmgBSIA54v0vcN4Wjw7gGanOHc5EXpFJyF5oa2jFYssySEaPUcnY
	mnSYSCz68lqfxfhWQHDK42Oc03QpdxuVondRH+JooxzOXyiJdo7aqzHkmeJ1H5j2yWK4B5lc4SL
	6Vx7Ss3mU74/xTQ25oJmP955hbx1ZvVO71g==
X-Received: by 2002:a17:902:db03:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-245e0488c4fmr19904825ad.35.1755585420862;
        Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHplGjIOsxjG9ywwt+oNjQuHnKblFHJP7DfxgAQ8xey2qyG+dk48tjcBRJvmxvcv4HDGKrHbg==
X-Received: by 2002:a17:902:db03:b0:23d:dd04:28e2 with SMTP id d9443c01a7336-245e0488c4fmr19904435ad.35.1755585420372;
        Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54fe38sm98120455ad.135.2025.08.18.23.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 23:37:00 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 14:35:59 +0800
Subject: [PATCH v4 4/6] arm64: dts: qcom: qcs615-ride: Enable ethernet node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-qcs615_eth-v4-4-5050ed3402cb@oss.qualcomm.com>
References: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
In-Reply-To: <20250819-qcs615_eth-v4-0-5050ed3402cb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable+noautosel@kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755585388; l=2876;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=SBNbTe9YfI7ypi1j4e391PPYp7WypDnpFergOj/Dd7Q=;
 b=Y2i2zXFfa34tuFIzyhBVHW5D/Xyb8q0LcUejJetwkYc/LdcqZOdTvNtFXsejUdHPb7YxeCmqT
 1jqm9QwQyuoBnMs4I9qAjEVJHAoEMTcRllDLyPQmrgFZ1i3MufhCX7L
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-ORIG-GUID: HiBj4tLIhpbQATfq5f1lZSyhCZWs3VTt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX6BSdWrBfrHtH
 D9u0arYvKpcFNQuVGy329kL2MoNmldatDmw2niMrBiWj6wQWCsOdxJfi8loKog1CsvyPxrgPDpW
 /ICJBzjNgM+K24Re1T4YNjZFfAMKemIyzjNYTPoanpo54a0CtNa9sFdJ6PpdiKN0ODZu5mgcCLq
 vY6j/1Upz9tMVjpBPXKljs7BzxBr8Wviyo7rUsAzTHZrC76282oulsy4tdMpKL0bPDfJ6mO/RYr
 0MBtzJXGY42EXAm/UtiWtj7Q5ATAbwFnD9+w89LJPMRvOKzLEv0QiELCQGjXILjeNPUQkac2meJ
 IjU4BLdvOUxSjzI+JhcD4DZW3hlLLdCighv3VEXYR9qK1DX80RQdkH/TqHH81JvzZeHMwSxQ1u7
 CyYrqpKT
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a41b8e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=FOSVMqNBLdhn2M3QeyoA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: HiBj4tLIhpbQATfq5f1lZSyhCZWs3VTt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

From: Yijie Yang <quic_yijiyang@quicinc.com>

Enable the ethernet node, add the phy node and pinctrl for ethernet.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 104 +++++++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 59582d3dc4c4..05d8609c0483 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -288,6 +288,59 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&ethernet {
+	pinctrl-0 = <&ethernet_defaults>;
+	pinctrl-names = "default";
+
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	status = "okay";
+
+	mdio: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x7>;
+
+			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;
+			device_type = "ethernet-phy";
+			reset-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <1>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <1>;
+		snps,tx-sched-wrr;
+
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+	};
+};
+
 &gcc {
 	clocks = <&rpmhcc RPMH_CXO_CLK>,
 		 <&rpmhcc RPMH_CXO_CLK_A>,
@@ -446,6 +499,57 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	ethernet_defaults: ethernet-defaults-state {
+		mdc-pins {
+			pins = "gpio113";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio114";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		rgmii-rx-pins {
+			pins = "gpio81", "gpio82", "gpio83", "gpio102", "gpio103", "gpio112";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		rgmii-tx-pins {
+			pins = "gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+
+		phy-intr-pins {
+			pins = "gpio121";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		pps-pins {
+			pins = "gpio91";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		phy-reset-pins {
+			pins = "gpio104";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


