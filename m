Return-Path: <linux-arm-msm+bounces-62194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B233CAE61AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 11:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CFDB4A24D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 09:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF411283144;
	Tue, 24 Jun 2025 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="en+Swl5/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416D228137E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759165; cv=none; b=MD3dT4Uiw3fTy1eexdkarDQ4tPiWrI9N9dTih+HBQPgMzx3qhQLRJEWo7qLrF33hzWB69fFDtUppQHxLwwoTkqiSF602aiy/C7Ffyja6P8lDuUC6swOg45Jlk8WzP+HaysgrbL7ZA06DqxIEzQ7NBqsPQ9aCvTjeeac7LRLg0LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759165; c=relaxed/simple;
	bh=et35v3M7TxsjDUdYnfvCws+vnx6i7tsXV6qRDyo3wjQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fzGhBnL1/VFSgmz60J6+T+cj97Q053KW547vgJei7p3s/5HT6xqmCsc7ELBwwPC3MuXLbLk/lkYQ7DhtOlp54cIaAMMowcfpPYfoIl5IXkrzFp14hEghnvcG5E5l18qoKT4M6ma9Uzx+4Grp7dRl/vW26r1Aq11LJPcZBydo7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=en+Swl5/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8J1h5019166
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Optt2rO6XBQ
	Q9qmEhMi7dr5/Hn4l28mMtAmngi1crsY=; b=en+Swl5/w9p2wH8r61K+ARLr7j+
	LfOXviK9hYpZeR12z2sFPU4DjPfV4w/Cd8GuFXWmbqLFNNbGI5ur0fcXqaw5bIK/
	Rz0O49WBeMEmBP5e8GA1RQ9pQOOoN0I6n5EBlAr9rmh5k4kJho1J6QbqPKcX6xQZ
	bK7V00dVGBiVMs9k+j3Z5j6zFSrZHYNOcWubtMej9VgMsyZ2odtZVp8Bh1JfHKzn
	5FcxaKkOSLMyBR/oL4TBUd96Xl2mWR4oUE3ceGCyJwvteavdITD/ZJu2MrrAVetJ
	jRqjnHvaJuMQ6M6jhLi4Fy38GfyA0+jLJ05GkaKv+YXydp2ANLEni2+ZeIA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwstvd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 09:59:22 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7494999de28so480508b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 02:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759161; x=1751363961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Optt2rO6XBQQ9qmEhMi7dr5/Hn4l28mMtAmngi1crsY=;
        b=FgP7X5m0+MC8EigSopo1PFvGKSkdV2tgtpB9Xc0r6x/sYsVsZubSyvlWcurUfTTZF1
         Z3LP0X+CkELuLaXPxtsCQePrYWqm+y/Z+I3vR+iOnpLj6icAvUZ3nXsJLl+9fDBJ+aYb
         nQVsH4UIHVLco4KJAWp183tzKAYcfymPagiGWqBIqv8cxRgVkeJHa1Sfh6vGDEsBWIuV
         d5qh/HXAhZjFrRvbZFT/5MccrDnWGQEp2+5ZhE3Dyn6iS/7odnnTrhIMuUVjlF6mABCF
         uBHe7FogVsXnF3BWqx5N1qjRDO43/ZTDOapIHl0zLxL1Szp6H/T75V2UIWXepD+jC6nE
         WbMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwxLY5KjaERmiBxdfKwL1mSSFwRzQS/eTt+9h4LeB63uOXsAiNIC5QcU//KQdlSJp7lWfdPiM55kc77CfR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7Wb/K1LspociDhzAzkX/CMqEBWKYuUNvqVVC7cNJQ+0YnwhA2
	Gint6njkeKkRKD6kfJkcw1pGRdviumTiNrAjfskEiyAfmiPMOkkc3gfoU8w4TQiRJmcoi8uS/wr
	qh2HCoyWY4K6OH8hxE9DaYGGYqABBY2wpG/DRdOzm5HU2estw1HRtqjTK8TPhWC8MBGZI
X-Gm-Gg: ASbGncvCvjYRSpJjODoKceIgm4sX0pTvRiZ8KA7rzzB7SdYTQP/cOYZdCb/PAz2m/gw
	FMp0+G+LvRkXDpwo0gSHvPBMBfGFtv0zL9q4kGkdjsAZRIhMKF8xR0muDcGAEq+KWp5FaGNsSXC
	BXehP/FOhzs6o4cnWHQBRPHK8VBLf+Dl6PBcgmlrzRPJuNUrZEUYxCoPZvCsGH0kO073GCLj/zm
	jdG37syZ98MYSE8nXfA/CzvLiy739BYjY0G530ZU3AJor1Nl5XogtKtaQ/Sco0TMwFN6vfc0Nqi
	RiYE6SR+zfonCoYuXQMHDAitx8w3O025+Kz8+d1YpG3bNBwkkbBrMWv4sU25vYIh+odW/c1pqkH
	/vA==
X-Received: by 2002:a05:6a00:2da0:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7490d47815fmr27481325b3a.3.1750759160888;
        Tue, 24 Jun 2025 02:59:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFm5LAXLi5rxd+dY2ZkrdXXi6904cVirbcf/nlfRIpnodVbXQw/BL2vCoOboUruU9o4q+2PA==
X-Received: by 2002:a05:6a00:2da0:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7490d47815fmr27481281b3a.3.1750759160492;
        Tue, 24 Jun 2025 02:59:20 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
Date: Tue, 24 Jun 2025 17:59:05 +0800
Message-Id: <20250624095905.7609-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oR5GckEVWpq2gy5E2qsT31QmnUiGM-Cd
X-Proofpoint-ORIG-GUID: oR5GckEVWpq2gy5E2qsT31QmnUiGM-Cd
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685a76fa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=xJyy5nzPNu-aANFJA0oA:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfX34zlm0shTP1n
 0WJC/SbZ2Kqp+QHU/e23piVdPWQccSDX+5mbql96DLv3UC7y0oIutYmd9XpmUH5GgMC2ASLUY/t
 R3KlvchPsSKkS21rIhfwgc9QqdfDQtaDnF3i5BGg1/0dcMR18T9haG1YF16piCDp40WXGqb1SiZ
 w/feOW9Xd2Jq4zBcEe6Q6BS7oG1T6kJ5xteudXOSx/XslrDyACLtA0Q5T8lgPtB5b68StBlgKof
 JOf3FSheeHVqmu2VTyBoMzejEuurUmCC0u81zHBoLOeTHnOlE0gIHtzn32v/ip3BARUYenXawvz
 SIPZ5kIqo6woQrwKiWvYS9WI14H5ZwRErKq1Bt5aMdLtMJjtWlXNaXmEXfyvGyF1vm/BwzZj4fa
 Rzv1Cgy3l9/lFZWx+Hfqf3SUdqx056laGk7zmP8t3RW55yau6vNccEeWaFrG/Aik6Ga2QRjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240084

Add CTCU and ETR nodes in DT to enable expected functionalities.

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..7c235dc7cbdd 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -2154,6 +2154,35 @@ lpass_ag_noc: interconnect@3c40000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		ctcu@4001000 {
+			compatible = "qcom,qcs8300-ctcu", "qcom,sa8775p-ctcu";
+			reg = <0x0 0x04001000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb";
+
+			in-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ctcu_in0: endpoint {
+						remote-endpoint = <&etr0_out>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ctcu_in1: endpoint {
+						remote-endpoint = <&etr1_out>;
+					};
+				};
+			};
+		};
+
 		stm@4002000 {
 			compatible = "arm,coresight-stm", "arm,primecell";
 			reg = <0x0 0x04002000 0x0 0x1000>,
@@ -2348,6 +2377,122 @@ qdss_funnel_out: endpoint {
 			};
 		};
 
+		replicator@4046000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x04046000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					qdss_rep_in: endpoint {
+						remote-endpoint = <&swao_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					qdss_rep_out0: endpoint {
+						remote-endpoint = <&etr_rep_in>;
+					};
+				};
+			};
+		};
+
+		tmc@4048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x04048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04c0 0x00>;
+
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					etr0_in: endpoint {
+						remote-endpoint = <&etr_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr0_out: endpoint {
+						remote-endpoint = <&ctcu_in0>;
+					};
+				};
+			};
+		};
+
+		replicator@404e000 {
+			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
+			reg = <0x0 0x0404e000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			in-ports {
+				port {
+					etr_rep_in: endpoint {
+						remote-endpoint = <&qdss_rep_out0>;
+					};
+				};
+			};
+
+			out-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					etr_rep_out0: endpoint {
+						remote-endpoint = <&etr0_in>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					etr_rep_out1: endpoint {
+						remote-endpoint = <&etr1_in>;
+					};
+				};
+			};
+		};
+
+		tmc@404f000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x0404f000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+			iommus = <&apps_smmu 0x04a0 0x40>;
+
+			arm,scatter-gather;
+			arm,buffer-size = <0x400000>;
+
+			in-ports {
+				port {
+					etr1_in: endpoint {
+						remote-endpoint = <&etr_rep_out1>;
+					};
+				};
+			};
+
+			out-ports {
+				port {
+					etr1_out: endpoint {
+						remote-endpoint = <&ctcu_in1>;
+					};
+				};
+			};
+		};
+
 		tpdm@4841000 {
 			compatible = "qcom,coresight-tpdm", "arm,primecell";
 			reg = <0x0 0x04841000 0x0 0x1000>;
@@ -2777,6 +2922,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					swao_rep_out0: endpoint {
+						remote-endpoint = <&qdss_rep_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
-- 
2.34.1


