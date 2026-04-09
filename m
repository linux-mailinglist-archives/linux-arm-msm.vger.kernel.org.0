Return-Path: <linux-arm-msm+bounces-102484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AF+2IaCR12k2PwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:46:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C02C33C9D17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31A7E304C4C1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:45:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5D33C3452;
	Thu,  9 Apr 2026 11:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H9IkSav/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i92La4jv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4774F3C1967
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 11:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735107; cv=none; b=LufpBqx8f2/wOLCZSnsrUtFXvMoWvyK17TU+s2BW7lOPMobgD4c3eOPk7lCFzBjXTAyYUDlHAuoDDQ6h+/3AIToOtEgRhLZF/60nsWZ/jfXzZoARhruGwkBa61w/bS9abxOdoJyv3DRhNKGE13urcp0taQ1UtpQiVcBmbBKZjg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735107; c=relaxed/simple;
	bh=NzK2BKDDpiMn7S4hNvWZzsLjsJo/12wVptCDRhY76jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UpKB2GtPwqoQlZNA3g//WtTII7bOYq1FTJ10rR1s2B6sqrBBBs2Yh05E9fmXB7Hw77L6pT+B3TKYcDA3UIBvAQYAoLeym5rfKnSio+JvmJRGNWthyTvV/Vw3qIsNMAdatnecX7y1vLsL09W1fMBk7qyXVkd3uPA/aouY6Qh+3TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H9IkSav/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i92La4jv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639827K61072645
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 11:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nMtaeroAIa2z0DlOIF1X2BC+XORLh63KcMmIsYwtcHs=; b=H9IkSav/aucj/RjL
	pU8wkv1cdnPBMpjYwTMEiAWwL9tVVn0iJVnMxDbtjRf14yss00fzE3yIJ68qwSK1
	6ulM3JTvgYqlgF2QRnra3/T1Ldu0Dxmt4glOYVmDb3XBpqR1P46qkgkSvBnX2FeS
	xjRx7mP7v4dmKLsAISe/g+EB7XT8fDnpSszL2mJO/Wlp7JSefA9RJOQ6apvKDaiJ
	rGuoSkpQfcyjSen51I55QFtVeFTVdB3XCn54rqKlk93IZqrh7EtZOl6e1BAguCjv
	xDUPUjptYdWpuvFyzz81QYzBMdGtmDSbmRSXtBTQX9yUz6PhEi4qvhwAJXGrY9Zm
	DZa7Nw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddtb3btm9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:45:05 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0cf396c45so12344415ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775735104; x=1776339904; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nMtaeroAIa2z0DlOIF1X2BC+XORLh63KcMmIsYwtcHs=;
        b=i92La4jvqevI2VYjEPL35UoiEqi5fCQ4K37SAFHS2VdEwoIMNyahRDnUgZ8dhQJ/L1
         expIeR90tri2tB8KHrZmD1mxH+LhBPithvX0Kp727cW62w1X1cE0yEWdpB3E8Hammywy
         uY4zy10Ws2sJxtxKNbYpu/sdI2vrUOaCyA8ehSByPjTejVF8ViZUFcVdCmlMzD6yRb7c
         hyeUuSrG0Er+gnhkFE/wD8QcEoGmX9z/UNe3S0oKveLqAsEM27PvdUxNzrcn63Hm3S6g
         jYtTK/eNwTMoM4yG3UrRef7dfqohNIijcy8DD/zUQw1C8RLRiv2hU4XpJKS4P1wuAnLP
         V7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735104; x=1776339904;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nMtaeroAIa2z0DlOIF1X2BC+XORLh63KcMmIsYwtcHs=;
        b=sRYRacyeWGjCFJIP9+eW/21JPYXi4EloMhnBvJ50nEL15qkXvQavalSVlwxyzu2vk2
         vd2XA2dUAqeF8ievu7OgjTLy3Cd45uQQrxf/5/vCyJtKDrJlBbhg5G9c13STsdDxlC6e
         fhBd43j6sRN4on1s7JlUeGPhcn8+s2SgeM+ZBqymO/QdknGIXR7MGLNj85Na/p6LQSQ/
         upI5dlDLq/7L0cgL6AHhyh06QDW2zbwDU2lUlYH1MEk1Njp63DHYq99e/kM8cvMCCcAp
         Ekd94QWd92mB9pt1deumEsAb2Mj7oPF3pHSsxhC3qRtF800oSnnobEaTZoc+j5ZOLSxz
         pRQQ==
X-Gm-Message-State: AOJu0Yx8YpNLl8gajke6feyKc2pxJSwuNEeRkhCHXBo9571fz0k75hu8
	/YCG7qQgiM3+VglHyJpDyhe0redgeYTFO6E6pbBrMwYEjmxK1IlPejP2LN5VySyBtH4VMtKuBWa
	7bCZct3/paffYY6/E+Rekk7HU8Xy0/gzN1Q5pUerN5f1Xr3nGVGwn3oyp/SBmwLTmp4jo
X-Gm-Gg: AeBDievldFofbZN+9ZT+wd3rht/FUlJmFbY4O2fhXCL3cLGEmha60U3qQyBmiSRcj9E
	lYl2qOKVGRN5l1vn0BFu1bLFLaoTznCT8ohsplRuPi9Ij/J75yB39N4KPGuEJN7/DAB4bScCwrk
	HQwPEtLLsHMLxKnXNCvD62oeL5Md0CLYv7PJB2kZj+5ksDXXRnpDo/zn4quVPczc7H9Ka1lEfps
	KDrEi4Ao70bqMEYrEuxXG7hjvPWbCgFTdktGq/MZdIM5TEMTEWxh7AS21uafE8XionlBnf9WBVs
	stmQtXzdyqUNrCsqpQAmcchfIYbQfRyeVcmbFPVCVZKRd/ybuklBA87z7YHeXZmxzg+bmDe2/Xf
	qmIO5cNDb7P8J4L1kK5tf+W92KxZninAFfmEXwID6OkKmi8zkl+vPNlueVgE=
X-Received: by 2002:a17:903:2cd:b0:2b2:4e70:6339 with SMTP id d9443c01a7336-2b2c73ca428mr36152895ad.25.1775735104265;
        Thu, 09 Apr 2026 04:45:04 -0700 (PDT)
X-Received: by 2002:a17:903:2cd:b0:2b2:4e70:6339 with SMTP id d9443c01a7336-2b2c73ca428mr36152615ad.25.1775735103795;
        Thu, 09 Apr 2026 04:45:03 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm230957355ad.75.2026.04.09.04.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:45:03 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 17:14:11 +0530
Subject: [PATCH v8 4/5] arm64: dts: qcom: kodiak: Add OPP-table for ICE UFS
 and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-enable-ice-clock-scaling-v8-4-ca1129798606@oss.qualcomm.com>
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwNSBTYWx0ZWRfX3c7Aaa2YSmO7
 TIR7EUO6OHMzO83UdWcPP6Oqc0CxJAynHVjuEfmWCWRZNpOHt//9lqYLMb1Y5SpODRtn/Rne4YR
 NWD9PWLZXH/k1i9wXIkRIeBTRcpc4S6XwTBbs11uXTX0svIkmCMS8PNL3yAwPfYp0emi6Ca/YZ6
 peaeUbK6bP+IOIIS1Na0Y8w/AnSzA7w46Juk74Uw0Zj5j2y92q1+SMzt2cd+0VsAzOJmxKuoEin
 2gLAl+eR5q83IErnKaEocceFnBsbHQ1g3I5IeWQj/6IHwBEWaOgIIwbl8DxeJoL5CNXAIz6iVdr
 dLaF8lGA+9PSkTnfxdZxZ0S2nUazMXpWShjVYgXT6kubCy+rDSRsK0JBFezyl0TUzkUSpUpgBGt
 LBH4YMjjKxsNL8D6a+wFG2YT340EwDtot9ip1uqhW0cbg4EqaDP2RtCcFL6WOn0JWtZb+gjvM5Y
 Jv9+3sPugOELgW5D7Vw==
X-Authority-Analysis: v=2.4 cv=eKIjSnp1 c=1 sm=1 tr=0 ts=69d79141 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: Ifq6aeG8VCF7HYw_k0sLzi7zkCiwrHVc
X-Proofpoint-ORIG-GUID: Ifq6aeG8VCF7HYw_k0sLzi7zkCiwrHVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102484-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,1dc4000:email,qualcomm.com:dkim,qualcomm.com:email,7c8000:email,0.13.187.160:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C02C33C9D17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c899a17026fd2a10ebc528a816629c88ee3bde5d..b0aa1970d42a3bb0b9d371e0e6cd09b8cd164dbe 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1087,6 +1087,27 @@ sdhc_ice: crypto@7c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd SC7280_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		gpi_dma0: dma-controller@900000 {
@@ -2597,6 +2618,27 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-75000000 {
+					opp-hz = /bits/ 64 <75000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.34.1


