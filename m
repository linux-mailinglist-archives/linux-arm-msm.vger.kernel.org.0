Return-Path: <linux-arm-msm+bounces-102485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODvhD7yR12k2PwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:47:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B08F53C9D51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 13:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A597630598C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 11:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE22B3C3442;
	Thu,  9 Apr 2026 11:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XeXNuyiT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ex3Vr3re"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F823C3BE4
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775735113; cv=none; b=QwkiEzaC+qe6A0X8LhPYzsoeaJ8O2W4d+RZD34yTX5U6KAf8Wxa90ESvsI6nMZ/noGABKx+L0kQrAIqEsOsLvuLxIRuZj3eBKfHpQtAV7WhKmVi4o0tF53odNkUUGjptE6GmT18EQwLFDgI1HRbzRJee6hZ/YITNMNLGlonIm0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775735113; c=relaxed/simple;
	bh=aw01N71X7OSXQ97plKv8ZOqyJOjru5oyKexCvfhnNmU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UX2R2p1Frwn9DBAEE0usU090okX1El8fCfnH5pv1Ex5fi0GIRm9b9eu635plFzXtpmaChxAtaydHLYV4/oBagSBun9KX31Q/Ped1P6TkgpzDkXwWYY0UQOpy4+7KdkgVyPeIuFg3FM0WThcugQTnaQG4dew+/QavoYDkX5kORJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XeXNuyiT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ex3Vr3re; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6399kYFp1727558
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 11:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dWFVvxPeCJBC/TWX3FpgsqH95wMogFwZyp5cPPTpvng=; b=XeXNuyiTrn37eCEw
	QuHPb6zL4VKLnd4p984xc4Txs15B4tS9uzdzH5/JC8lga4AL0JHJYlKdJU6FVdFE
	ZJROdrc7qjOWFgDDVuGaLr9ad1Jf+8vEZK0E1yOXkYNi3nCu4yBQ3obrNspySJWP
	KKL/8Hmlp+Q1k2H6bsUwnlX+6nwbsBQMp4VDcz7DxQn6GuWwPD+ky1mCHnUHiKmw
	LXv6GEiqDZd9IbJWoDMkNcPGF5TXUslnDF3/16bRtWWc2v1fZWnDSMeprSJmA+qF
	5FbmkD4wa3DfG3/kMBijc2aE7DyHpTQd2p41WD/MCMORTFH/MnJlgTCA7rfIN93j
	8kt8oQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddwcru175-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 11:45:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0b339b8dbso3579165ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 04:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775735111; x=1776339911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dWFVvxPeCJBC/TWX3FpgsqH95wMogFwZyp5cPPTpvng=;
        b=ex3Vr3re+LL21kefQhChz8lOvhqnj8+UMcFbdtRXJ+CXoiGMDDCNsJA7xNS+tT1I5N
         A213dZDdLRiLM4MEVbRP6Jwt9PJizJ1+n8RexzXpSD2VA8WFzhgG2P2bfH5S10pRJPVH
         Pg/h6dg8FdQ/a3c5oFFPn31T3F6XKNnbcV8srRNQbhFOUA/T1roKTZRiQIu4or3+w8HZ
         VUM2//C5DgY6CIkInAroWhuy4RWkLZP9bZ7I4dfYWQofzU3tHHqAec+ZPS3NRZl6AFaH
         zmjt0RpZW+gX2VUvenrL1X0e+GmaA7MXulP/7I4R6pp7yOKJwUsQxs6hZNdC5d51ecoz
         aCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775735111; x=1776339911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dWFVvxPeCJBC/TWX3FpgsqH95wMogFwZyp5cPPTpvng=;
        b=J1Ege9y2rFzfKyGX433BJk/0AqdIl4X0DRyqyVndgBYOo4hUmFO+rX6HqD/0KiMHKo
         6z2NRb3WNyLhqnpGUwg48eb3IuREf/xC086C+UdvF/ozCiFBmPPkd6iBY9Nq+kXKx1Vy
         gwjbMwyr5lSTEvPVdIUvkc1veGEp2tSPc/oeP3NCtgODde8coOODJy1sBB0p8/KB4FWc
         l8/Q2FCTRskIkkH1rdtXViZf27XVB7bdsos8Ni8G5Umaw0GTkejw0pbtNJ9n1Ct22x0X
         r5yP8fuTWH1VDCSDNUTpZzK/xZF+JRG44mqNDpleFG+iPd2J0uJyk4EMsRV3Sxv4TFjo
         TG0A==
X-Gm-Message-State: AOJu0YzK4KxbZi0e/cqWpW3MRONH/HqHtSO1+ZuORjO4nPIuvUNX+kaQ
	2ihRNRpbVnn5hMjiQ3QIi7zmWeAM/15049QZsY+dQ/DfC5rjtfPagqz8RS5Xjy4LWEL/ieAj1AR
	8eCGCiBgCUv/sXf0mTIIw5kRFiOKpj7mvOwQsjhrNwFi4zcZ4Zz4spVacmmjKrekKaZTH
X-Gm-Gg: AeBDievUdVmwz3c1IfAca6lCr0xGllNAXLNHTDbjzo4ZbcSXtLtFGCDmAlMP0M5cmdA
	D+YLkGv+VVK/3aEMQ5dLYAyixQrDrTxp47Bevl1dA7Qc+/lz9BJapx1RI6mEeEKWuvgwrHfHNNd
	FKPiZbuYC0KyA/vx6ttE4oNEzXPthk4D6A2ilI/otO4p9uSIQIqwi84xOtv+hN4Hjl7kGeiO2g7
	cVgF/mnXxeajFk5OzipgvMA/RHu9cDnSHXZ+HKOAmxt4C9ySwLk5ncbDR7MvK4SsMGXOdB0oWVJ
	NOdxchzlER7FDKz9ZSLgE3Zq4tPRoGLLPdWpsY7PcUu1R8aQ83A3E8VaYSr3UT16xvyRtLpJkIe
	JA3m27/1POTrmPUn+Q0Y/rGdS4xdlSFTKTAFw1Z9RdRS3x9/zSbIAQ3OUTbA=
X-Received: by 2002:a17:903:1ac3:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2b28163b7a5mr241543095ad.3.1775735110667;
        Thu, 09 Apr 2026 04:45:10 -0700 (PDT)
X-Received: by 2002:a17:903:1ac3:b0:2b2:45b7:306e with SMTP id d9443c01a7336-2b28163b7a5mr241542555ad.3.1775735110041;
        Thu, 09 Apr 2026 04:45:10 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd9fsm230957355ad.75.2026.04.09.04.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:45:09 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 17:14:12 +0530
Subject: [PATCH v8 5/5] arm64: dts: qcom: monaco: Add OPP-table for ICE UFS
 and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-enable-ice-clock-scaling-v8-5-ca1129798606@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEwNSBTYWx0ZWRfX1hnyILD7nj2+
 XRfp16R5GyRHacewsll8Vd3WN2UKeZXaxrmdesADm5Zzm5+OmKczSgFMAWpFjfk/55jYBpZz3Ki
 of8SyV/3SpgUAf6qvRZ7eaqrzJo7RcORmX4C22faTmDS9eFSArBjvwDaTToQS6jFIXLbsvxJesc
 QFnfr8YUmbSK/vjVueHk38LobZf3oqyF3hnkDWBTUWcojPZLLjsgIJqVBoT+fkG571YOk7WX0ON
 H2CWQkfuNPzbFUrFOyntRYXaEFh4sEvyh0NtAg+PmbbUxqGObNXTmgRtWIY4SEayZQVFQCwcnnJ
 bAMhamPHa7sjdz9OhBiaN3NWbnKVR6B1n16tdMmuHrphnA80deeBF3WO75dXY1zlWv9io/HLkfy
 JEVZJaFU3fPgIuK+/kBVDFjeYLDY1ZfTASWFszFLmHuKfVWvjBQA1r5pi6BaQoa9PeEOA/VdCru
 61gne4nOdwmjcaEFVQA==
X-Authority-Analysis: v=2.4 cv=SsWgLvO0 c=1 sm=1 tr=0 ts=69d79147 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8UYZrpb84ilYEnvJpWFdMoR9j5FiPFX3
X-Proofpoint-ORIG-GUID: 8UYZrpb84ilYEnvJpWFdMoR9j5FiPFX3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102485-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[1d88000:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,0.135.221.64:email,87c8000:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,1dfa000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B08F53C9D51
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 487bb682ae8620b819f022162edd11023ed07be8..cb0e554e94d237b0adccb55fa9ed967bae9eea05 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2730,6 +2730,22 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+
+			operating-points-v2 = <&ice_opp_table>;
+
+			ice_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-201600000 {
+					opp-hz = /bits/ 64 <201600000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403200000 {
+					opp-hz = /bits/ 64 <403200000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		crypto: crypto@1dfa000 {
@@ -4797,6 +4813,22 @@ sdhc_ice: crypto@87c8000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&rpmhpd RPMHPD_CX>;
+
+			operating-points-v2 = <&ice_mmc_opp_table>;
+
+			ice_mmc_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-150000000 {
+					opp-hz = /bits/ 64 <150000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
 		};
 
 		usb_1_hsphy: phy@8904000 {

-- 
2.34.1


