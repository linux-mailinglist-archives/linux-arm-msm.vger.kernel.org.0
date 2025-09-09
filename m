Return-Path: <linux-arm-msm+bounces-72670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B6B4A065
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 05:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94B3D441F6F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 03:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D97D2DECBD;
	Tue,  9 Sep 2025 03:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q3a+8A66"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C322DA76D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 03:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757390234; cv=none; b=qbUUVTIwzfeCfOe05uHhFKrbVguPmd7XxVYFf4TSIferYLXS0yWf5Jkvm381Km8LfbFr3Mm6kZ4D7KvyIOxa2pBFxRF/cd6XS0LiRDDJeC87sK/M9Pg0hSwiBWrX85NsbtRFEqC1xN268EbBouygvKYcgY3aIaPJHJOVMWgXg3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757390234; c=relaxed/simple;
	bh=1r2sMelXbjk/wDAFKdurvjSblStRt30JAp3AyhW3uRo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOI/XyKaES0GNadypUAjEgYU76JK9WYpWpt8ZsKIVvyoPeJtTba1f9P9l1z9sSxmp2R9VQ9oKum0JKludW3HwujX6/skvK0wsxPW7AJd5E9LfLkhrgR412nr8Ote3+hzc7NQJ7HhH+7EoXk/qlY7DtAUDzA1aohGPyEAPGIdZfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q3a+8A66; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5892F4rL002380
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 03:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2zmm3mqUYRqAp7XjdK+i0CCS4NnUVrAXcuUzDM38Iiw=; b=Q3a+8A66NySPW61r
	vrZBVMMi5lopGOmBwGz1cX5iFs7rora+nbPLbPdSoi3xCw/Y8SxNFV3XpoucF8Ht
	/jCwkqrsyllpc8TjuN3K5fOfU1as5J3jqdGb/0rv+WwpvuNlR1Ns8dnmiLoQs4jv
	AkJVaT2W4WQ1kt2lo4PsxJ6su32rpBeg+6TeWi0kjDLUE5LBB9wlscCA8AXVOMEc
	vNJgyA9ueFZEFf7QcgLjdZ0q0gzeUh5wAhjbVrmiRwYyODidY0v8go8YaPbVtjte
	Re7P+5snh/D241TXkpuntcv63VOt0wpUJGqONTU86oVUXv2bbGluFbXw9CCrnnm9
	FNOAjw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdum2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 03:57:12 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24b18ad403eso48565525ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 20:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757390231; x=1757995031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2zmm3mqUYRqAp7XjdK+i0CCS4NnUVrAXcuUzDM38Iiw=;
        b=MDUEUfcInvuozxfACdDJYLU8l36TSyvFqCfh4gjMkMgFEspw9sCdHjUqrCdoQ4CGZc
         3WZ+E6PL8N1+a2HxvmDFFFaV4By+bSXOws4I913VyAqKuUFn73WkIAalNlSt7Ip8qexq
         NEltnWE4qG6eUbk7/k/VHYBHK3fe52BPYkG0uux4TBIQBP7HgSveeYU/ZmirrGJywOMU
         o78Fw3uCRfhDXMgEgLF4P5/2neoY2IR8Y/SmhPuhHY7Sy/h9tLW1IaAz1wPqql7tKQxj
         VZusER4v2jVIT+yWEytDyzoNlADfrravANvyt2kYHDrUc0hhcmscn4uyeKUginNm8YZD
         DGBQ==
X-Gm-Message-State: AOJu0YwexDAY2gIQLFVGk5TMjISES8Im3rxrP0+1mtN7l1dtK7zO2wdl
	bgGQ6kxl778szcMXiWiKWzH96mudYFv3hrBYue+u1rk3u5Zn0fltNRDc6ZkcRGA/q0v68n8bNUk
	2HzIdMMvgR0cSdZ6vljDB9VPUjJJHU8HDgWjOPHGS3KF8acEJmhh1nlAWGSm4BKY1q3HR
X-Gm-Gg: ASbGncuEoooa2ANplyb6ETV9EtH5tvjPC/v4ZfgbWfo4lge7ujxRd63eixpl0q7TgB0
	ILmcZ4RdHbmWx6XgUo2413jAvYfKghIKqGybycS1/hm+oEIsPCt7iT7gr21OojdxBH6pOB1LmQz
	tDGuTeqfIai3f6EleUxOHe2DtUyZtvyaAwTdwe1MuvhOac+O4ynJbo35+ld9YHHK40UP7rqM2Na
	ulPvpCfz//bJw+47xOUxnNY8vGMM+vX435tk2djAgZkXIEHWKE9GXyZihHYVSxsnw2OGCIiUX6g
	ZfAGWd+pwSjimJh5NhAA0UgZjckaOBlzvdUWtah/ubi8KoHcjWCXwgNf7Spa7oxioundGnrK8eV
	dSYY4OffGnuytI227vNTulnc0cYdVn30PdA==
X-Received: by 2002:a17:902:e743:b0:249:1f5f:f99d with SMTP id d9443c01a7336-24cef940f8fmr192818665ad.22.1757390231247;
        Mon, 08 Sep 2025 20:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJCci47uEcYdrrAlKDV74Ch6si8QGfcDx7sIK6ebs5yPJEKcgCBw2AcEFuBlnCX399ax0Kjw==
X-Received: by 2002:a17:902:e743:b0:249:1f5f:f99d with SMTP id d9443c01a7336-24cef940f8fmr192818385ad.22.1757390230798;
        Mon, 08 Sep 2025 20:57:10 -0700 (PDT)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903724b94sm295614705ad.35.2025.09.08.20.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 20:57:10 -0700 (PDT)
From: YijieYang <yijie.yang@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 11:56:03 +0800
Subject: [PATCH v10 2/4] arm64: dts: qcom: x1e80100: add video node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-hamoa_initial-v10-2-ec10057ffcd2@oss.qualcomm.com>
References: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
In-Reply-To: <20250909-hamoa_initial-v10-0-ec10057ffcd2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Wangao Wang <quic_wangaow@quicinc.com>
X-Mailer: b4 0.15-dev-5bbf5
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757390219; l=2903;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=uRYc8tLe70Gcn2K2RcdgjKkdTXcXz0g6iNtU/vtcWZg=;
 b=4OD1sNT5iJU58TyHCkZBdULUQXHTSkIHohFpEmw/ta0iN/g1Azbmlr1WlXoeLhayjISRCSD3U
 tk7RwEr0/0WD/zrE4PiNbHjpkOhUAjpDk+Re2C5P/r4Eqgb9sulhRXR
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: IPYibbBtwNG6YByeOJzRkMQY9AenQVfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXydE17PlNHRu1
 +JYCaB1fRZYnnvND5+VAKpKgZOv12fyIejRjEIScIzsTLmuMMeav0H+jtCQsIPdG9UJzxe8oaKV
 bN8MenpM4kV0RAmvRzE19SiDYrGFGdvwwKb5AOHvmAVU0/TjwBSaHkHABOm13mYEvqeRJf0hbhO
 UQXceUXfaniv4mUSYhAYXyxu8CVVbMNmK9MLJE4ua89Hd2flvIBwqw8DwuYDhWxs/P/e1uQtQjI
 zEyHnjYXwnveKsTwN5cb89XoUQNVS92JXUwJ5XYrUY+lKn95RpvJd02OX3tvOqAxHLToVAy228F
 lITyzQ0TlphEG/fqdX6F6wml0rITg9bDe+fdWp+zAH0Mn5l6kjRKDg5OCuEQFod529ysShEN+EU
 /a13nVLj
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bfa598 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=tEm64AmstYfONosBKmoA:9
 a=Pof-dxJgaamTTWcV:21 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: IPYibbBtwNG6YByeOJzRkMQY9AenQVfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034

From: Wangao Wang <quic_wangaow@quicinc.com>

Add the IRIS video-codec node on X1E80100 platform to support video
functionality.

Signed-off-by: Wangao Wang <quic_wangaow@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 82 ++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index e61c9010a3f2..7ddc3fe3e5cd 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -5183,6 +5183,88 @@ usb_1_ss1_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,x1e80100-iris", "qcom,sm8550-iris";
+
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "bus";
+
+			iommus = <&apps_smmu 0x1940 0x0>,
+				 <&apps_smmu 0x1947 0x0>;
+			dma-coherent;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-481000000 {
+					opp-hz = /bits/ 64 <481000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,x1e80100-videocc";
 			reg = <0 0x0aaf0000 0 0x10000>;

-- 
2.34.1


