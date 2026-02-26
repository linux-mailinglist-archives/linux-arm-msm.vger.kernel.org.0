Return-Path: <linux-arm-msm+bounces-94282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2P6UAvcqoGmKfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:13:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D5D1A4EA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:13:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 939933006D72
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CE6338599;
	Thu, 26 Feb 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TyE57O7d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC7D2E2679;
	Thu, 26 Feb 2026 11:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104431; cv=none; b=eIOQyo5f+mEJJS9H3LNvrdxSmFZfYXiVa4/J3qiS/T3dEgkpu9oarZ7FSr5POUXyja4txRA7vsCI7LX4/7vgs/9oZat+vZiKtEBB8wwOkt6tDcCaT/jCw1cnkpIKErvVdkI3ZMpinSeXOGtLS880LAkxrwDW7UfgdxPg+DiZRuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104431; c=relaxed/simple;
	bh=vnIPrxR6B4hJfJb0x3/amnua5SdTtZEcyjV+Lgtbbgo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pHZjRmN4Tptet0DoWPz8lkl9GCGBiGXDRYEyGP1LM/hFOcvsUXFITfPdf2jhfd+iHN+63mA6boBGCqgI07gmW1xpz5WbcEg9SGLwJPkorYxNZUelj6ZIkyF6hWnDkOEJBkEmVH/bUVcnM27TUytTq4uYrXegvb+pAnlw7z8CDcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TyE57O7d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAKnUO287973;
	Thu, 26 Feb 2026 11:13:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+YQr22dnZEQ
	5QVuvZwBpsPdam+KoyWjAoetEa5a6Cng=; b=TyE57O7dkX3e8ziqCjQly41BE4g
	agRxAt4QGtlw1ivw7RckgMJjKu/bUm/XEGOZEK4U3845R6qtkmkyP4Yo1BNviKPb
	e+6UEo9HlHn6i0AidPAaQoAjjG3p5dXuVWgqePldoulJYF8O996Pj3BaXVrvBjFY
	PiQohwyOo4P51jEsxbbC7o9bfGiYJcMIkQmpkQ9ra7eWNeWWM4Zt0oBow7shqAmd
	Hq8vOSV/tnd04rYyfhGD0sn9gREzX/URXyYiTRj/0VEVYNMXdNCM1rKKXZD1+pLr
	koXNsby02SXhswG0zJwaxwWIf0gSr88kPHt2L+WP15VeS7IxXqoKOUromVA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjm8u05db-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:35 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QBDUpI017512;
	Thu, 26 Feb 2026 11:13:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5smjsf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61QBDTgG017498;
	Thu, 26 Feb 2026 11:13:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61QBDTm7017495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:29 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id B064D3AA; Thu, 26 Feb 2026 16:43:28 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: [PATCH v4 1/2] arm64: dts: qcom: lemans: add mdss1 display device nodes
Date: Thu, 26 Feb 2026 16:43:21 +0530
Message-Id: <20260226111322.250176-2-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwMSBTYWx0ZWRfXz6dn4Vz/0zfO
 zRq0A6c+lcSqMYEvbPqMNrwOuyKj4s2m4XPEgh/+sRQZ26JaK9SxrdjBRlWbXnpodZth1A/3rkn
 KOrmGcI6Fi/m0s1wKFL868PyvYxBWJ4zqKnvjnH0855btqfoHWUggdYHJo/hZ6JLSf9w6GGUa1H
 d/E8DtAQEAZcnaRk+71crPHadrlMtLTeNGs15LJK9jF9ssEXtvjZhrKaI6/jNmaPGLB9p7WYzFY
 k4Zx1/4v5U59j8lwxgcXUVEtq71EnExs78pRCl8ebD61E8NhXsUrETnY3iq2z1hrZGHUniLvLIm
 7/J1LSlE8VyYXtPyhgdiVOxA/00p2xf+TwmVfbJK+Sh81NzAeTrPBooEyq30yvSg46QDqFnUMnn
 mPhO0o5IFSPXw3hR4R2rS8gBdXILhxFVzTXaDKhxwtAVFcvX8ezbdAVjIfcrfrCbJdXeJKEwE/p
 pqAB0oy74L7C7h6IzJw==
X-Authority-Analysis: v=2.4 cv=O780fR9W c=1 sm=1 tr=0 ts=69a02ae0 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=jjm4Kx_-R9S6g9p6kq4A:9 a=zO3wRZPYGD4TLhPu:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GLlpd0PpqmaO-4v4uv64kP-gHrsF9Df0
X-Proofpoint-GUID: GLlpd0PpqmaO-4v4uv64kP-gHrsF9Df0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602260101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94282-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mkuntuma@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 22D5D1A4EA2
X-Rspamd-Action: no action

Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
Display Processing Unit(DPU), Display Port(DP), Display clock controller
(dispcc1) and eDP PHYs on the Qualcomm Lemans platform.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 381 +++++++++++++++++++++------
 1 file changed, 305 insertions(+), 76 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 1da8e7fb6775..fd4d524d0890 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -507,6 +507,30 @@ opp-2553600000 {
 		};
 	};
 
+	dp_opp_table: opp-table-dp {
+		compatible = "operating-points-v2";
+
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-270000000 {
+			opp-hz = /bits/ 64 <270000000>;
+			required-opps = <&rpmhpd_opp_svs>;
+		};
+
+		opp-540000000 {
+			opp-hz = /bits/ 64 <540000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-810000000 {
+			opp-hz = /bits/ 64 <810000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+	};
+
 	dummy-sink {
 		compatible = "arm,coresight-dummy-sink";
 
@@ -539,6 +563,30 @@ mc_virt: interconnect-mc-virt {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	mdss_mdp_opp_table: opp-table-mdp {
+		compatible = "operating-points-v2";
+
+		opp-375000000 {
+			opp-hz = /bits/ 64 <375000000>;
+			required-opps = <&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			required-opps = <&rpmhpd_opp_nom>;
+		};
+
+		opp-575000000 {
+			opp-hz = /bits/ 64 <575000000>;
+			required-opps = <&rpmhpd_opp_turbo>;
+		};
+
+		opp-650000000 {
+			opp-hz = /bits/ 64 <650000000>;
+			required-opps = <&rpmhpd_opp_turbo_l1>;
+		};
+	};
+
 	/* Will be updated by the bootloader. */
 	memory@80000000 {
 		device_type = "memory";
@@ -5065,7 +5113,7 @@ mdss0_mdp: display-controller@ae01000 {
 				assigned-clocks = <&dispcc0 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
 				assigned-clock-rates = <19200000>;
 
-				operating-points-v2 = <&mdss0_mdp_opp_table>;
+				operating-points-v2 = <&mdss_mdp_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
 				interrupt-parent = <&mdss0>;
@@ -5107,30 +5155,6 @@ dpu_intf2_out: endpoint {
 						};
 					};
 				};
-
-				mdss0_mdp_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-375000000 {
-						opp-hz = /bits/ 64 <375000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-500000000 {
-						opp-hz = /bits/ 64 <500000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-
-					opp-575000000 {
-						opp-hz = /bits/ 64 <575000000>;
-						required-opps = <&rpmhpd_opp_turbo>;
-					};
-
-					opp-650000000 {
-						opp-hz = /bits/ 64 <650000000>;
-						required-opps = <&rpmhpd_opp_turbo_l1>;
-					};
-				};
 			};
 
 			mdss0_dsi0: dsi@ae94000 {
@@ -5404,30 +5428,6 @@ port@1 {
 						mdss0_dp0_out: endpoint { };
 					};
 				};
-
-				dp_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 
 			mdss0_dp1: displayport-controller@af5c000 {
@@ -5467,7 +5467,7 @@ mdss0_dp1: displayport-controller@af5c000 {
 				phys = <&mdss0_dp1_phy>;
 				phy-names = "dp";
 
-				operating-points-v2 = <&dp1_opp_table>;
+				operating-points-v2 = <&dp_opp_table>;
 				power-domains = <&rpmhpd SA8775P_MMCX>;
 
 				#sound-dai-cells = <0>;
@@ -5492,30 +5492,6 @@ port@1 {
 						mdss0_dp1_out: endpoint { };
 					};
 				};
-
-				dp1_opp_table: opp-table {
-					compatible = "operating-points-v2";
-
-					opp-160000000 {
-						opp-hz = /bits/ 64 <160000000>;
-						required-opps = <&rpmhpd_opp_low_svs>;
-					};
-
-					opp-270000000 {
-						opp-hz = /bits/ 64 <270000000>;
-						required-opps = <&rpmhpd_opp_svs>;
-					};
-
-					opp-540000000 {
-						opp-hz = /bits/ 64 <540000000>;
-						required-opps = <&rpmhpd_opp_svs_l1>;
-					};
-
-					opp-810000000 {
-						opp-hz = /bits/ 64 <810000000>;
-						required-opps = <&rpmhpd_opp_nom>;
-					};
-				};
 			};
 		};
 
@@ -7048,6 +7024,259 @@ compute-cb@3 {
 			};
 		};
 
+		mdss1: display-subsystem@22000000 {
+			compatible = "qcom,sa8775p-mdss";
+			reg = <0x0 0x22000000 0x0 0x1000>;
+			reg-names = "mdss";
+
+			interconnects = <&mmss_noc MASTER_MDP_CORE1_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_MDP_CORE1_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
+
+			resets = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc1 MDSS_DISP_CC_MDSS_CORE_GDSC>;
+
+			clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+				 <&gcc GCC_DISP1_HF_AXI_CLK>,
+				 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>;
+
+			interrupts = <GIC_SPI 865 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			iommus = <&apps_smmu 0x1800 0x402>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			display-controller@22001000 {
+				compatible = "qcom,sa8775p-dpu";
+				reg = <0x0 0x22001000 0x0 0x8f000>,
+				      <0x0 0x220b0000 0x0 0x3000>;
+				reg-names = "mdp", "vbif";
+
+				clocks = <&gcc GCC_DISP1_HF_AXI_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "nrt_bus",
+					      "iface",
+					      "lut",
+					      "core",
+					      "vsync";
+
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_VSYNC_CLK>;
+				assigned-clock-rates = <19200000>;
+
+				operating-points-v2 = <&mdss_mdp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu1_intf0_out: endpoint {
+							remote-endpoint = <&mdss1_dp0_in>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						dpu1_intf4_out: endpoint {
+							remote-endpoint = <&mdss1_dp1_in>;
+						};
+					};
+				};
+			};
+
+			mdss1_dp0_phy: phy@220c2a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+				reg = <0x0 0x220c2a00 0x0 0x200>,
+				      <0x0 0x220c2200 0x0 0xd0>,
+				      <0x0 0x220c2600 0x0 0xd0>,
+				      <0x0 0x220c2000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp1_phy: phy@220c5a00 {
+				compatible = "qcom,sa8775p-edp-phy";
+				reg = <0x0 0x220c5a00 0x0 0x200>,
+				      <0x0 0x220c5200 0x0 0xd0>,
+				      <0x0 0x220c5600 0x0 0xd0>,
+				      <0x0 0x220c5000 0x0 0x1c8>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_EDP_REF_CLKREF_EN>;
+				clock-names = "aux",
+					      "cfg_ahb",
+					      "ref";
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+
+			mdss1_dp0: displayport-controller@22154000 {
+				compatible = "qcom,sa8775p-dp";
+				reg = <0x0 0x22154000 0x0 0x104>,
+				      <0x0 0x22154200 0x0 0x0c0>,
+				      <0x0 0x22155000 0x0 0x770>,
+				      <0x0 0x22156000 0x0 0x09c>,
+				      <0x0 0x22157000 0x0 0x09c>,
+				      <0x0 0x22158000 0x0 0x09c>,
+				      <0x0 0x22159000 0x0 0x09c>,
+				      <0x0 0x2215a000 0x0 0x23c>,
+				      <0x0 0x2215b000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <12>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel",
+					      "stream_2_pixel",
+					      "stream_3_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp0_phy 0>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>,
+							 <&mdss1_dp0_phy 1>;
+				phys = <&mdss1_dp0_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_dp0_in: endpoint {
+							remote-endpoint = <&dpu1_intf0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss1_dp0_out: endpoint { };
+					};
+				};
+			};
+
+			mdss1_dp1: displayport-controller@2215c000 {
+				compatible = "qcom,sa8775p-dp";
+				reg = <0x0 0x2215c000 0x0 0x104>,
+				      <0x0 0x2215c200 0x0 0x0c0>,
+				      <0x0 0x2215d000 0x0 0x770>,
+				      <0x0 0x2215e000 0x0 0x09c>,
+				      <0x0 0x2215f000 0x0 0x09c>,
+				      <0x0 0x22160000 0x0 0x09c>,
+				      <0x0 0x22161000 0x0 0x09c>,
+				      <0x0 0x22162000 0x0 0x23c>,
+				      <0x0 0x22163000 0x0 0x23c>;
+
+				interrupt-parent = <&mdss1>;
+				interrupts = <13>;
+
+				clocks = <&dispcc1 MDSS_DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK>,
+					 <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK>;
+				clock-names = "core_iface",
+					      "core_aux",
+					      "ctrl_link",
+					      "ctrl_link_iface",
+					      "stream_pixel",
+					      "stream_1_pixel";
+				assigned-clocks = <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>,
+						  <&dispcc1 MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC>;
+				assigned-clock-parents = <&mdss1_dp1_phy 0>,
+							 <&mdss1_dp1_phy 1>,
+							 <&mdss1_dp1_phy 1>;
+				phys = <&mdss1_dp1_phy>;
+				phy-names = "dp";
+
+				operating-points-v2 = <&dp_opp_table>;
+				power-domains = <&rpmhpd SA8775P_MMCX>;
+
+				#sound-dai-cells = <0>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss1_dp1_in: endpoint {
+							remote-endpoint = <&dpu1_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss1_dp1_out: endpoint { };
+					};
+				};
+
+			};
+		};
+
 		dispcc1: clock-controller@22100000 {
 			compatible = "qcom,sa8775p-dispcc1";
 			reg = <0x0 0x22100000 0x0 0x20000>;
@@ -7055,13 +7284,13 @@ dispcc1: clock-controller@22100000 {
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>,
 				 <&sleep_clk>,
-				 <0>, <0>, <0>, <0>,
+				 <&mdss1_dp0_phy 0>, <&mdss1_dp0_phy 1>,
+				 <&mdss1_dp1_phy 0>, <&mdss1_dp1_phy 1>,
 				 <0>, <0>, <0>, <0>;
 			power-domains = <&rpmhpd SA8775P_MMCX>;
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			status = "disabled";
 		};
 
 		ethernet1: ethernet@23000000 {
-- 
2.34.1


