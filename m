Return-Path: <linux-arm-msm+bounces-104729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NPPMlFc72llAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:53:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 335ED472DA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:53:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02D3A302F7D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AA2A3BB9FE;
	Mon, 27 Apr 2026 12:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ar8oH8ll";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GQqkeyqt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90A63CA4A3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777294024; cv=none; b=e8vREIOmPHrkJDB/0mAmUd7b5M1t1fMKiS4nMyUcAYLbR+tt3ejfScWND+cqPXx57Jg5jrO8HUH2a2drx85gDF+jJYAF/uXNMu4WZQF+XR34Uva7Jpxr4zWsxwbGx8HAatiwxye1WiJKd3hQI61ZDVpbrw2GIfz3+ubReE2+rDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777294024; c=relaxed/simple;
	bh=keJ16zCRgQ+7YWtz1ydY/Dm8A91/0/g1XPoTpBY7qXc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BYiawyrgrghq65T9kbVbD1G2U3ai7rYQs4VqNXJaDSK5TUwwz6feafA/PlvaErciql/HAW0cb0mdKxVe/TvlyCHPnHDU3JmOOk32C5pYmSVu1ocAHAJBYx9UaVkRoeBbr844Ok6QNJQMZAne4iYXKgVlkUYqfs6usAzlcvSMCks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ar8oH8ll; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GQqkeyqt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3vFe3123830
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:47:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=; b=ar8oH8llepQOZxd+
	UTZpfHbUkAWmyjaA22ALnke7mxRsIOez0vBkv4ytx7Pm5HnD9weTiQBtCGEwavQv
	3gB90EB61foqm5OwruI+oCn5fKivfKbwV/eBIfBDBeN/sCMB0AiQ2zX7qBpykMGY
	uJ96dToVNa9/IrP+986kQja56/lEWU+5fhAx+CCiWCvHY3uvuivDVjan83DNRuiU
	eP2P6hkrt45LGz7vQGboiofcIPOzXborTKPSuEjCCvQpAEgKsqYkpysyo7UHuf5W
	dmxVvrFKsWGqO3AFTiLIv4z07bTNJT8OGyUGljdD1WCOM51uHzPbnnu9EFK5TVbf
	jev2vw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qgght9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:47:02 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e67a4f642so77857231cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777294021; x=1777898821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=;
        b=GQqkeyqtFeC8NuDhyYoEhBhjyUFa1ANEEQNUnO9aj8MNxkLHpQxkPzngr/4h0kJoex
         3SLvNZ5EJza3mJzvepOcoZ3ubWf9ichIq6miPoQYrtnI79rf/4/LSTP5ViHsO41gzkBA
         2vraUZF31iuYp4coo/CNotQRcsmFkBMngmUuGUI7vlocHGpSjEQLHUqRjtse/0nDTkLW
         c5HYxxuJ4a97yKo7nEvcW3pPXlOcDylGQJruWjVmI+kTqW6kta0ozVxNMfufyD3OXGse
         pbRoP+fTsDpA8htUFrlPiC+8pRBR9y8LWOC2DfYvBLg1UI1U3tiBFTlswmR9P+Glgvv+
         7EGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777294021; x=1777898821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=npU9buGBkOswEXBY2Iw0wFN7bz1kBrMayAzI2eUT5/o=;
        b=iI+84mJ1SlOtIPJEp3o4YZ7YUvJtUzsM+8U9RkZd7rHqnOqdieXdEgQxkDVGS3P1Zy
         ukDTRyws9G8YsuaxQynN8oHeUvwrdlFhgaQ2aWRAmUjwpnvCO+zBxCegkRFy4rkZIqv/
         VryTJ2md1t2NKvqfJyy4gKsg9r73vVnDkr+ora4OLk5ShD+JvASVoocnc4c/B+6Ke1el
         XCcVF7W0NkHVl1wYZsbDMQZ3EISxz+G51visC34a8zKP6QQTA0S7HLte7X/utxrp2YEh
         5HABlJVV+YFWgVTBrkhKE77y7NhXmPIkJv8pWwu0b5oBHVmEPd3J3UHIKskBsp4KK0VE
         Bsww==
X-Forwarded-Encrypted: i=1; AFNElJ+qpCaUReePfGFUv3kF5h2YOIIWD9a+Zr2ARjLJUVchdAd5I/Zo4d8yxQiSnPoJSpyK8qcvBU3EdNgmoTMG@vger.kernel.org
X-Gm-Message-State: AOJu0YxeMsiWD8wdMgCnPMm31qwaR7uLCzi8ipGazhzTnyJUwJVU/Npl
	z1lFE42X/npnaLE3+DZWcyTpYnPgdHgvG1VI3N+gt4KMK6YutgkXGBwQjY9QWVz1zg/3gnG38XE
	txky24/nf7Wt3TYbMJs46Ge+ZQdqveZiRevTHbAYc0r9Ni9OcUOCEyyGv9aZmiAgab8/q
X-Gm-Gg: AeBDieuS38BfbvAI4yorFvNTAqeXqfyPlLFBv6aSjSVOV4+cBLPzPCImo9AwzIPM8VF
	LZWzI3uSuMqVipsxQuYw/UQx9tQmqMqOiCK7QY0+DPceMb65EYYGWsCwcsZee2+VAfbRWrgDV5Z
	A9rEGM5ldPQZnedXSmV5D4T5yJxeJntG3igGZez/0n10WofEFJmSO2JrwxG1T8YIRR5vwPVadKg
	F5NKFt0NqY2vPaa6KxxIUtRVlJ6bCLGWFH5/H8Ly9cCqgRk89HbU/X7cdkvFa46DaNMgylgdRMy
	rpIr0mp72IahtUJF3QG9zuSLLX8v1WorrmVy2/euXcRecdbBrySaHivFChlZLBZZf6oIciZ0clj
	5ipZHT47FRtP1T0k5r8nTIf1gHY/0iLRfUoD+Hm0dylW7VR/NFt2d3amLWUE7aA+mTg3Oj5bcoO
	EdCjQ4fYDA81eNkDSpXkfAbQtOuLs=
X-Received: by 2002:ac8:5890:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-50e36b3c598mr624428621cf.4.1777294020685;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
X-Received: by 2002:ac8:5890:0:b0:50d:6ee0:3822 with SMTP id d75a77b69052e-50e36b3c598mr624428121cf.4.1777294020214;
        Mon, 27 Apr 2026 05:47:00 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:653f:4d28:6a78:a6ca])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd19sm1091496866b.37.2026.04.27.05.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:46:59 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:43:41 +0200
Subject: [PATCH v2 14/14] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-camss-isp-ope-v2-14-f430e7485009@oss.qualcomm.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
In-Reply-To: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzNSBTYWx0ZWRfX+DFUXeLBLabr
 AJiXs9SFWiTHpIJ1j8Lp58CIjYluYqgXrgoEOpoI2nuD/y7PnjeZu7gs6Iy9KX/Re5WKDJr4e4u
 XYGw+LfCsIwcWR946g17E3vZ0y6EYk0Q5jkFIDD98/g2SWy8hwHI27kqaC2VpctunFC+j9uw93W
 NRIKonUcxgHNI8/eNcxcsr04ZC7kAvhQow2oT5QL70SJ2+bA6ZocKw3EDlH7RsWzsFj5LxkG4A7
 HqtYzHVZDFXcve3hWwBSGiO8LdrrnB7zrjLlPKa3RTx6pa3R7ki49xMUqVyKhQv2dufGXInNvvg
 d3dTZ6+c8eGeQ25148ebgOPIJBoQ8MwoV68UTt4/wSB2TYkwL9Dra8pnrN5EqQ+NdP53C8ZvP1d
 LHDLEhk7SgBLmJr03Cd2d1AJal/fvT6F6k2n+kytGeUZ9EKypibLm33WbEPd98zOOQX7JHb2YDC
 t0ZxPk7DJfCHttWugfQ==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5ac6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=L3Ch9UzycIYwzZWD:21 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: TFZ8fauZiW_ObEYkj4Tik39NoIuXHCF0
X-Proofpoint-ORIG-GUID: TFZ8fauZiW_ObEYkj4Tik39NoIuXHCF0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270135
X-Rspamd-Queue-Id: 335ED472DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-104729-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,5c42400:email,0.0.0.1:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the five register
regions (top, bus_read, bus_write, pipeline, qos), clocks, interrupt,
interconnects, IOMMU mappings, and OPP table.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 71 ++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index f9b46cf1c6462a89784429565e1636ce2ba68d73..ee0fe1832248eed8405968bf05d4c73dd6e8d13d 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -1919,6 +1919,10 @@ &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>,
 
 			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			ports {
@@ -1933,6 +1937,73 @@ port@1 {
 					reg = <1>;
 				};
 			};
+
+			camss_ope: isp@5c42400 {
+				compatible = "qcom,qcm2290-camss-ope";
+
+				reg = <0x0 0x5c42400 0x0 0x200>,
+				      <0x0 0x5c42600 0x0 0x200>,
+				      <0x0 0x5c42800 0x0 0x4400>,
+				      <0x0 0x5c46c00 0x0 0x190>,
+				      <0x0 0x5c46d90 0x0 0xa00>;
+				reg-names = "top",
+					    "qos",
+					    "pipeline",
+					    "bus_read",
+					    "bus_write";
+
+				clocks = <&gcc GCC_CAMSS_OPE_CLK>,
+					 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+					 <&gcc GCC_CAMSS_NRT_AXI_CLK>;
+				clock-names = "core",
+					      "iface",
+					      "data";
+
+				interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+				interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+						&config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+						<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+						&bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+				interconnect-names = "config",
+						     "data";
+
+				iommus = <&apps_smmu 0x820 0x0>,
+					 <&apps_smmu 0x840 0x0>;
+
+				operating-points-v2 = <&ope_opp_table>;
+				power-domains = <&rpmpd QCM2290_VDDCX>;
+
+				ope_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <200000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-266600000 {
+						opp-hz = /bits/ 64 <266600000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-465000000 {
+						opp-hz = /bits/ 64 <465000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+
+					opp-580000000 {
+						opp-hz = /bits/ 64 <580000000>;
+						required-opps = <&rpmpd_opp_turbo>;
+						turbo-mode;
+					};
+				};
+			};
 		};
 
 		mdss: display-subsystem@5e00000 {

-- 
2.34.1


