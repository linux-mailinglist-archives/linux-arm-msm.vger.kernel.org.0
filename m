Return-Path: <linux-arm-msm+bounces-73755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BF7B59C2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA6377B3899
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 15:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD687342C81;
	Tue, 16 Sep 2025 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hxEFDH7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542334A33A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758036889; cv=none; b=E5+wKtBXcr5ULrPx0wKFhdwm/Zp3wKClIWDtwzK0sH/odC0rzzy0TgkxO+ZjiJ3XIIXRnpotqa4XOZkjo03g3pqt0eESP2q9QtFmd7PbNxFYucS0N01C9jF6rD27x0uxXfth4cxL1DCjznkG9LOhtC6T17lgdHXfH96GrrxRMng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758036889; c=relaxed/simple;
	bh=vyJOQgbrb2WxDXmW/GDkpoaHsezde1XtjkrsfEM0tLc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JTnvbnhMrLkPnW1DZc8m8GFA3JzzJCTzmJDoNJHhWOKm+aLYLFDmLaRN+qaMoZTsR8rZ+c2OCpz4MXl0PSP8DiWAYomslt2hqtLIonQ1BAxutXY9y9Z/j2q88Sv4yYAUynu8H2GhqmBNNNmerdPdWEsfNT0Q2cVSK7zZ9RFjzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hxEFDH7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA7lGc020302
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RPfy0KN0sqXEiLbKnmuFUz
	VLft2SDqzwx7icCaKyEt0=; b=hxEFDH7cLzUQdONhUXksbbg8FeoZFOvNUB341u
	pkvjB5HfuLbAbpmemjjE1JOa25ZkDyRLvbq0T9CiTNhUYYOLCy2NF1K6YY35k/Wo
	rOuhKc6gixfVaPGqdrefl5NwCCiWetlmQMKrSIFfaAP3F9sZhPboCegdrPyvyhr/
	OBhy30ybAwpnIAXKf+CEstoNds2+sGgZbbXlpMf7WH7faitd6f4nPnAfEgX02VC6
	584Sw6PIeL8SNicqVORm+t17kA132sv7qq4nmsZ+KkBWeSoSHCtn0WDfc5ZvRxFd
	pHfq3bLFh3D87yXQtLs7La/H+W1jwEZzncPkzNhtnpONBTMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1smwss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 15:34:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24456ebed7bso74467575ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Sep 2025 08:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758036885; x=1758641685;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPfy0KN0sqXEiLbKnmuFUzVLft2SDqzwx7icCaKyEt0=;
        b=AXEa2e0/d8vIyIRGqpHPFP8jvlYPCPN6pifajy6Dkv5Zp8lw+ttUWn13Txb043L/eG
         yz5ICFOa5oTTF9pHgG65mQgrI+qKsSl9IjS93KQQ5PEJCbOig/qR4tDSmWp/UmXs3N9N
         7gQNAO1eouBumV+DqYdZthZ0yJo2mBS9wiGOM3PNUIfySWJV6nSgMOzVd3XyFYwgaF3g
         c7k0PRW9nNK2QggSRgnwLPSRV9WMo79+IBSijJfiWf0D1ZSvqH6IL3W6JjJsyGyu4bVO
         js1QuHB5LxqDwJFta7jUehQkIMr1+wnodDma5dx0x9NMjeX0GHZkrhTLKfb1Af/54c5w
         jTOw==
X-Gm-Message-State: AOJu0Yx5uaG64U9NlFQmb7C1WRB9px9pMMQIxqaB0W83k29gXGjioLBA
	pcUn2h70Ww+mennw5vo4pmvAjL8tzThDkdvQFuu7OhGR2qyNKysIdLuHA69hv7jlqih8NaPlnly
	7FsMjboOszfXQEB+qNQ64FMg+OSUSNYt2fNKSTQXOKj++FLsGquvroBNtSKlD1hfta8o+
X-Gm-Gg: ASbGnctcUuMqaT3rJwbl+HvTLxM6lOUpTkw+SLCr3A6sYQLtkmLvqHrKSWOWkBI+Y83
	zq+W3ITG+vL38YbDtC/I9FlsCgpbxDMJ4uVCpDqJuUp/SGbnTav5SKxDlGQHqoY/+DsH9cD7XQM
	3dE6RPHfEAvryhB8ij3/Yyz3FRHVnnEWBcqu8LtkDlIM6e68s/khLIx8ImKbRzr7LwIVQT9uE4y
	xuwjJMXkcbl0CE/dsB2LjRy4hs/R+5RfF+EiyT4m7CA/n37DMnVNs5Dk0qWTJKjqxCJmZn5C6ta
	pZCQyjgkEM5nE8mmXLSg642aG/+j3cc6gpEvJ+s9hmCuDpDYsthqwPE9Rvh2Tbc7jn+9aAbAnLh
	nZwFpBDYIry5VZ4MXv0NaZ8J8Bg==
X-Received: by 2002:a17:903:2f87:b0:249:71f5:4e5a with SMTP id d9443c01a7336-267d161e3b9mr29420525ad.26.1758036885058;
        Tue, 16 Sep 2025 08:34:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7gsGZ0zEJ78EllWglAHEPYzzsSNHD9eqeRIA8cwsI6TDAQcvlowVJA/qxat/ggAIaz3MMFg==
X-Received: by 2002:a17:903:2f87:b0:249:71f5:4e5a with SMTP id d9443c01a7336-267d161e3b9mr29420265ad.26.1758036884502;
        Tue, 16 Sep 2025 08:34:44 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267da78c754sm19316005ad.51.2025.09.16.08.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:34:44 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 21:04:37 +0530
Subject: [PATCH] arm64: dts: qcom: Add RPMH regulator rails for Glymur CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-glymur-vreg-dt-v1-1-f5877f1c4186@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIyDyWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0Mz3fScytzSIt2yotR03ZQS3bQko0QT47RUA1NzAyWgpoKi1LTMCrC
 B0bG1tQDAoZ/BYAAAAA==
X-Change-ID: 20250916-glymur-vreg-dt-fb2a43fe0570
To: quic_pankpati@quicinc.com, quic_rjendra@quicinc.com,
        quic_sibis@quicinc.com, quic_pradyotk@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, quic_kamalw@quicinc.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758036882; l=9840;
 i=quic_kamalw@quicinc.com; s=20241018; h=from:subject:message-id;
 bh=vyJOQgbrb2WxDXmW/GDkpoaHsezde1XtjkrsfEM0tLc=;
 b=+7G1Ox7t8IatFlwZqhuUOvW4xNqnjI22EWGxWL0V+2aoGEm2BWUb9W7N07Oqb65F2iqq0G4Qc
 gzMXlJDGBsuB8hBujtjzu72j2M4o/A2ei9qyQJ55mnjXQQRaQeDOgHn
X-Developer-Key: i=quic_kamalw@quicinc.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-ORIG-GUID: Jo3rqEGdH0KXZmjOa04OwUaVVysE2i8T
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c98396 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=KS50X_SyO-0PDshYTjQA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jo3rqEGdH0KXZmjOa04OwUaVVysE2i8T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfXzcFfhOH2u65i
 rLZCcwJaF+YUf0YhLtGPCKUb0bp2filwCcr+HCvlVZrXgKnIYTM9qU/CnBTqa/aPkAWW+TNn/2S
 W7LeHEVyoMKh5xe7UfR+Yuc8IyORd5dY27Zy0iOf1LJ4mX2c6MD4yawMZPYqg1yNImyyFi4fIZK
 dwiK+vKZDp/6B9osQLk8MN/NNZKbL85Tm5iG7yNYvhdqb2VxcN1sRcRZmUFnI4I3bWdJpMeUYCb
 REPr7GLfgXkK6fAQwH0lSQ1Pmv043tHpTwL/xxM0M7IgeAUan8PAYQvA8CmsbsfyPH/Yob7Tkv4
 jAwYcTaC3CgyUW0wziNZNmsLt49jEvE3bva5t7DbYsU9MxOq/C6oFOhXMK4/ssIe5hQuADOqnR3
 lS37kLZ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098

Add RPMH regulator rails for Glymur CRD.

Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
Signed-off-by: root <quic_kamalw@quicinc.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 293 +++++++++++++++++++++++++++++++-
 1 file changed, 292 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 02e1f58ab7756dae8bafae1dbe2409b48eeaac26..e17611c6c3b8e64739181f80d6ef18bc037d0307 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -6,7 +6,7 @@
 /dts-v1/;
 
 #include "glymur.dtsi"
-
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 / {
 	model = "Qualcomm Technologies, Inc. Glymur CDP";
 	compatible = "qcom,sc8480xp-cob-cdp", "qcom,sc8480xp";
@@ -16,3 +16,294 @@ chosen {
 	};
 
 };
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1_e0: bob1 {
+			regulator-name = "vreg_bob1_e0";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <4224000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_bob2_e0: bob2 {
+			regulator-name = "vreg_bob2_e0";
+			regulator-min-microvolt = <2540000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1b_e0_1p8: ldo1 {
+			regulator-name = "vreg_l1b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_e0_2p9: ldo2 {
+			regulator-name = "vreg_l2b_e0_2p9";
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_e0_2p79: ldo7 {
+			regulator-name = "vreg_l7b_e0_2p79";
+			regulator-min-microvolt = <2790000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_e0_1p50: ldo8 {
+			regulator-name = "vreg_l8b_e0_1p50";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <3544000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_e0_2p7: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p7";
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_e0_1p8: ldo10 {
+			regulator-name = "vreg_l10b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_e0_1p2: ldo11 {
+			regulator-name = "vreg_l11b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_e0_1p14: ldo12 {
+			regulator-name = "vreg_l12b_e0_1p14";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1260000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_e0_1p8: ldo15 {
+			regulator-name = "vreg_l15b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_e0_2p4: ldo17 {
+			regulator-name = "vreg_l17b_e0_2p4";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_e0_1p2: ldo18 {
+			regulator-name = "vreg_l18b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E0";
+
+		vreg_s1c_e0_0p3: smps1 {
+			regulator-name = "vreg_s1c_e0_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8c_e0_0p3: smps8 {
+			regulator-name = "vreg_s8c_e0_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vreg_l1c_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p82";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <958000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_e1_1p14: ldo2 {
+			regulator-name = "vreg_l2c_e1_1p14";
+			regulator-min-microvolt = <1140000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_e1_0p89: ldo3 {
+			regulator-name = "vreg_l3c_e1_0p89";
+			regulator-min-microvolt = <890000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_e1_0p72: ldo4 {
+			regulator-name = "vreg_l4c_e1_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_s7f_e0_1p32: smps7 {
+			regulator-name = "vreg_s7f_e0_1p32";
+			regulator-min-microvolt = <1320000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8f_e0_0p95: smps8 {
+			regulator-name = "vreg_s8f_e0_0p95";
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9f_e0_1p9: smps9 {
+			regulator-name = "vreg_s9f_e0_1p9";
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s10f_e0_0p3: smps10 {
+			regulator-name = "vreg_s10f_e0_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e0_0p82: ldo2 {
+			regulator-name = "vreg_l2f_e0_0p82";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_e0_0p72: ldo3 {
+			regulator-name = "vreg_l3f_e0_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e0_0p3: ldo4 {
+			regulator-name = "vreg_l4f_e0_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+
+		vreg_s1f_e1_0p3: smps1 {
+			regulator-name = "vreg_s1f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5f_e1_0p3: smps5 {
+			regulator-name = "vreg_s5f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6f_e1_0p3: smps6 {
+			regulator-name = "vreg_s6f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7f_e1_0p3: smps7 {
+			regulator-name = "vreg_s7f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p82";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e1_0p83: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p83";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e1_1p08: ldo4 {
+			regulator-name = "vreg_l4f_e1_1p08";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-5 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_e0_0p89: ldo1 {
+			regulator-name = "vreg_l1h_e0_0p89";
+			regulator-min-microvolt = <825000>;
+			regulator-max-microvolt = <950000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_e0_0p72: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p72";
+			regulator-min-microvolt = <830000>;
+			regulator-max-microvolt = <920000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3h_e0_0p32: ldo3 {
+			regulator-name = "vreg_l3h_e0_0p32";
+			regulator-min-microvolt = <320000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h_e0_1p2: ldo4 {
+			regulator-name = "vreg_l4h_e0_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};

---
base-commit: 71b90f4193da79afeb44367382de880d36a4a830
change-id: 20250916-glymur-vreg-dt-fb2a43fe0570

Best regards,
-- 
Kamal Wadhwa <quic_kamalw@quicinc.com>


