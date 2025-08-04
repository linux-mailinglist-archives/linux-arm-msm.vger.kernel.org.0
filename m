Return-Path: <linux-arm-msm+bounces-67638-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE65B19B7C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 08:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6739718973D7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 06:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45A62288CB;
	Mon,  4 Aug 2025 06:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aT7hYFmr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DD22CBE6
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 06:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754288255; cv=none; b=nXsv+88cLSA5CTFgaflBa/I5BNSu8x+lTcsuyUFgovL9FO/XyWL6kYVbQTq7+T4ffAlU0Wep7pUNruKUmMnFb5zTOJPG+Gn9AcwF1t2u2Tl3XlIvhkORnuydiSzu7cA/dTdeF/llkDvkI3YEifHtiHpxAK7JiKjmFkVWLOay8vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754288255; c=relaxed/simple;
	bh=Vb8zSFeny9Mn5Mnh5tC6qBnhcPG/9X4otYwJ8MQHApU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5592XjwzI8smCf1zbtkdSwqJ+dwi5azeS7gsVc/kv4hEA7+vOqc54eUcjCN5kEJXTigxy77qdAOnxaSzL52JCnnxYpDtzpIm8+YTwSZ9/l3zAsAF9d6o1/8FLLjFgf2IXslKfeCOhAP9zFHjbK/jxkTt6K9EH+15mS+/Eb4BB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aT7hYFmr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573NgfFh031129
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 06:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=50GtYEJCfQ/
	Uqag1R29mtHEPwViuyqpM/qEJkSrzU7c=; b=aT7hYFmr+tVABZw0E7+9sqDEWA2
	pmvjusWYDmdq/5c0BZbTRhsPAyZ29SKVjGCcLhJpCeO3aP7DAFTyoK3a6eWEzahI
	wjcu76mahoBDPs/SLz9jQGuTVlyvMwM0SOH4cQa+/XATCg4Q+8rRsXLVYg8FCZXU
	aE5IHZyMXdatTGEkzbuotuL952O7n8SnN+zgts+pWjgSs2WkBcP073wlyES5gXKc
	8K92Lrj0bjRlpTjDU80ugMRucdg0/ncYu52VV29C+ItVy1drJ5h8z4RHOAihYQiH
	FNlZbCdb+ATZNmDySy8rtARr0kyFdZKELd/55bQwpRiJCPgUXcJPh5lTCxQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqkkum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 06:17:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23fc5b1c983so56276545ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 23:17:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754288252; x=1754893052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=50GtYEJCfQ/Uqag1R29mtHEPwViuyqpM/qEJkSrzU7c=;
        b=iWa0czWzHF9tL8Lz5uo8J+Fr2MWgECqZJadnUS9A6fbymzZGeG5m4OvI5atU07s1SQ
         JBhlfs5X7KyZKP9kvIHlKVoUY73vww8JDo0EhOcDP6K2+c7V4jvEe0z8r5mEJH1XA/j/
         ZSizbhUa6wrAoqC3Bb8w+ffr7x3tT3lTBUtHGpJMJxJZdrc4KtVb6A5fNeKNypx/F2aS
         UKmgI8bbbFDDysk5ktTxjUmxxazmCwQMHrClucnrdc1P/ZT0L9JDLo6zQ0K2bqVTusz1
         ZsNTTKcxJVS+LdbUuvOmBz5isymkElACiXOdTSHdDiodlXRLXp02f7TCVJsnhhqSZLw9
         W3Pg==
X-Gm-Message-State: AOJu0Yz2DpmdunCV0GuaPxINo/9nt1QTmkvgbn7lKz0OrCoPZq1klruy
	zOQpwpfO7WKOLQEbNxxUrIqYmplCJ+7Ahb9KszFRyWk16Bymn0wB9jNk6m+PeDC0KlZlGKn7cEd
	bbY3RfatMBTQMNWUYAL81snhO8o7whBrTHFCU1GAdwX8kDraWgoQhdqzOg44ziwu+7Jex
X-Gm-Gg: ASbGnctc0q74TtfpZmVRnQBH1Yc08kja4N5BzQuXGW1hZKMZfWZbBk+cXOSoEvRf1J7
	jYeCJJxIgYAEVrhqm2qV4Jr4cAC8ztR9PDMwoyUUZVLMb5UzthNnyvkmOIrG1ZEHTn7J8zqRQ6K
	3mW6UjHeq4Cg/WgWLvo9XBZEzz/DasD+CXr4l22+4AerOZB9xLKPeBvLTh7hP8csoNoXgzPd2Em
	53iWLeAa/Y0YNRehtMLZiRfzQ7effkvd42TbCPBSlDI59qtabrdiOlwicP2Q9oayLc2JSmwab25
	BaUd7capAbpoynT3kqMPBGW6EOH/VFos20VbBvL2j3uz8rdER7BwjIiO1jMUPotDpe7/MGNB7pK
	fCOE=
X-Received: by 2002:a17:902:c40c:b0:236:71a5:4417 with SMTP id d9443c01a7336-24200a169edmr235712975ad.5.1754288251659;
        Sun, 03 Aug 2025 23:17:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfN2UJUX+L9dSi8Tgo2s/JfDt8ZbHOrN0aP2e4dj6A+JPWF/6iQx7ag6yTrO2qmk9i2l6bgQ==
X-Received: by 2002:a17:902:c40c:b0:236:71a5:4417 with SMTP id d9443c01a7336-24200a169edmr235712505ad.5.1754288251179;
        Sun, 03 Aug 2025 23:17:31 -0700 (PDT)
Received: from a3fd830d25f9.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976f08sm99786785ad.103.2025.08.03.23.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 23:17:30 -0700 (PDT)
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sibi Sankar <quic_sibis@quicinc.com>,
        Odelu Kukatla <quic_okukatla@quicinc.com>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Subject: [PATCH V2 2/2] arm64: dts: qcom: qcs615: Add OSM l3 interconnect provider node and CPU OPP tables to scale DDR/L3
Date: Mon,  4 Aug 2025 06:15:36 +0000
Message-ID: <20250804061536.110-3-raviteja.laggyshetty@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804061536.110-1-raviteja.laggyshetty@oss.qualcomm.com>
References: <20250804061536.110-1-raviteja.laggyshetty@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: a38lYqbwNXxD6nBsopyf1MvUknme_L6f
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=6890507c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1ISD4PbNEMn50PZ00O0A:9
 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAzMSBTYWx0ZWRfXyHl4VFb71Uom
 vLuZ9ncfGUyAP2j+tU2rTVdKvNS5sO17xM2Vs+BsptyXv5DK90YD/tMwGVCWVkihzifUsDPjR3v
 nlPHtgBqhUIP7A51+pVYWHlDqxifgO7dNR6G6t/ivBq9rC2Muuwb/23Huqg8Un+iKfVlEPS66iD
 sVwSpxsrxJqUsNogRDKo9qwfUXUkCZyyP3Ca7TXIK5tmNhMccyYNPzC5zKTC4fYv04tIEepdQyX
 kFiYO963+Dz5lEKxudF47KjP7i6+1TAGWABAzsmp5+wqpqxNGri4BqGLT88HvTKqD8H77/Ibmnw
 1yo9aB60Vrx8n0DA98rNazz69+vLu8U1H83W8bSDdL7wGdn8B7e3haaAyLmwPfkUf6pYI+94bb5
 brPhp2AdvxT48DnZo7X9YIbVQzH8UwgOYnwK2gfRpHfHOBMO1v9nz5/GHuAhGuaxBkadp6Ga
X-Proofpoint-ORIG-GUID: a38lYqbwNXxD6nBsopyf1MvUknme_L6f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040031

Add Operation State Manager (OSM) L3 interconnect provide node and OPP
tables required to scale DDR and L3 per freq-domain on QCS615 SoC.
As QCS615 and SM8150 SoCs have same OSM hardware, added SM8150
compatible as fallback for QCS615 OSM device node.

Depends-on: <20250702-qcs615-mm-cpu-dt-v4-v5-3-df24896cbb26@quicinc.com>
Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm6150.dtsi | 148 +++++++++++++++++++++++++++
 1 file changed, 148 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6150.dtsi b/arch/arm64/boot/dts/qcom/sm6150.dtsi
index e033b53f0f0f..d81e7daf9b5c 100644
--- a/arch/arm64/boot/dts/qcom/sm6150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6150.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
+#include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,qcs615-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -33,6 +34,10 @@ cpu0: cpu@0 {
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_0>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_0: l2-cache {
 			      compatible = "cache";
@@ -52,6 +57,10 @@ cpu1: cpu@100 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_100>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_100: l2-cache {
 			      compatible = "cache";
@@ -71,6 +80,10 @@ cpu2: cpu@200 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_200>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_200: l2-cache {
 			      compatible = "cache";
@@ -90,6 +103,10 @@ cpu3: cpu@300 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_300>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_300: l2-cache {
 			      compatible = "cache";
@@ -109,6 +126,10 @@ cpu4: cpu@400 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_400>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_400: l2-cache {
 			      compatible = "cache";
@@ -128,6 +149,10 @@ cpu5: cpu@500 {
 			capacity-dmips-mhz = <1024>;
 			dynamic-power-coefficient = <100>;
 			next-level-cache = <&l2_500>;
+			operating-points-v2 = <&cpu0_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_500: l2-cache {
 			      compatible = "cache";
@@ -148,6 +173,10 @@ cpu6: cpu@600 {
 			dynamic-power-coefficient = <404>;
 			next-level-cache = <&l2_600>;
 			#cooling-cells = <2>;
+			operating-points-v2 = <&cpu6_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_600: l2-cache {
 			      compatible = "cache";
@@ -167,6 +196,10 @@ cpu7: cpu@700 {
 			capacity-dmips-mhz = <1740>;
 			dynamic-power-coefficient = <404>;
 			next-level-cache = <&l2_700>;
+			operating-points-v2 = <&cpu6_opp_table>;
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&osm_l3 MASTER_OSM_L3_APPS &osm_l3 SLAVE_OSM_L3>;
 
 			l2_700: l2-cache {
 			      compatible = "cache";
@@ -219,6 +252,111 @@ l3_0: l3-cache {
 		};
 	};
 
+	cpu0_opp_table: opp-table-cpu0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <(300000 * 4) (300000 * 16)>;
+		};
+
+		opp-576000000 {
+			opp-hz = /bits/ 64 <576000000>;
+			opp-peak-kBps = <(300000 * 4) (576000 * 16)>;
+		};
+
+		opp-748800000 {
+			opp-hz = /bits/ 64 <748800000>;
+			opp-peak-kBps = <(300000 * 4) (576000 * 16)>;
+		};
+
+		opp-998400000 {
+			opp-hz = /bits/ 64 <998400000>;
+			opp-peak-kBps = <(451000 * 4) (806400 * 16)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(547000 * 4) (1017600 * 16)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(768000 * 4) (1209600 * 16)>;
+		};
+
+		opp-1516800000 {
+			opp-hz = /bits/ 64 <1516800000>;
+			opp-peak-kBps = <(768000 * 4) (1209600 * 16)>;
+		};
+
+		opp-1593600000 {
+			opp-hz = /bits/ 64 <1593600000>;
+			opp-peak-kBps = <(1017000 * 4) (1363200 * 16)>;
+		};
+	};
+
+	cpu6_opp_table: opp-table-cpu6 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			opp-peak-kBps = <(451000 * 4) (300000 * 16)>;
+		};
+
+		opp-652800000 {
+			opp-hz = /bits/ 64 <652800000>;
+			opp-peak-kBps = <(451000 * 4) (576000 * 16)>;
+		};
+
+		opp-768000000 {
+			opp-hz = /bits/ 64 <768000000>;
+			opp-peak-kBps = <(451000 * 4) (576000 * 16)>;
+		};
+
+		opp-979200000 {
+			opp-hz = /bits/ 64 <979200000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 16)>;
+		};
+
+		opp-1017600000 {
+			opp-hz = /bits/ 64 <1017600000>;
+			opp-peak-kBps = <(547000 * 4) (806400 * 16)>;
+		};
+
+		opp-1094400000 {
+			opp-hz = /bits/ 64 <109440000>;
+			opp-peak-kBps = <(1017600 * 4) (940800 * 16)>;
+		};
+
+		opp-1209600000 {
+			opp-hz = /bits/ 64 <1209600000>;
+			opp-peak-kBps = <(1017600 * 4) (1017600 * 16)>;
+		};
+
+		opp-1363200000 {
+			opp-hz = /bits/ 64 <1363200000>;
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 16)>;
+		};
+
+		opp-1516800000 {
+			opp-hz = /bits/ 64 <1516800000>;
+			opp-peak-kBps = <(1555000 * 4) (1209600 * 16)>;
+		};
+
+		opp-1708800000 {
+			opp-hz = /bits/ 64 <1708800000>;
+			opp-peak-kBps = <(1555000 * 4) (1363200 * 16)>;
+		};
+
+		opp-1900800000 {
+			opp-hz = /bits/ 64 <1900800000>;
+			opp-peak-kBps = <(1555000 * 4) (1363200 * 16)>;
+		};
+	};
+
 	dummy_eud: dummy-sink {
 		compatible = "arm,coresight-dummy-sink";
 
@@ -3624,6 +3762,16 @@ rpmhpd_opp_turbo_l1: opp-9 {
 			};
 		};
 
+		osm_l3: interconnect@18321000 {
+			compatible = "qcom,qcs615-osm-l3", "qcom,sm8150-osm-l3", "qcom,osm-l3";
+			reg = <0 0x18321000 0 0x1400>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+			clock-names = "xo", "alternate";
+
+			#interconnect-cells = <1>;
+		};
+
 		usb_1_hsphy: phy@88e2000 {
 			compatible = "qcom,qcs615-qusb2-phy";
 			reg = <0x0 0x88e2000 0x0 0x180>;
-- 
2.43.0


