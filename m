Return-Path: <linux-arm-msm+bounces-109520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPxZJEVSE2pP+gYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:32:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CBD5C3B55
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:32:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2B2B30566B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 487D9342CB2;
	Sun, 24 May 2026 19:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bGdKW9Sb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Puijgxui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E422531F9BD
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779650794; cv=none; b=blxpVHGGyRDGG/tBkfbmF5JOeqMxpFgoHZOoOpPjrUKXdOL7hHlPO4/ZfwGUhO3j1QA8I+EZYdoYpHv1bwPwLDGvgMopvWxVU0qzO8An2UkqGJ8K7FXr8bst2c3//IZGNGdYGB9Uf8AK/jAdpHvD1/UuYfZs9C3dMTwzpDhDSl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779650794; c=relaxed/simple;
	bh=xx/OKQkndZ0HVXGIbB1dzJVX/RWFuCljMR+ppwrasBY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Go8B2e7tcFo5BvOPcnx9aRZHPPXw5g+VHkbB/4A7MCYrWxKmd1jiJ/nofbzyQaeEACxpfv2HT29tgabCMrt+iItEYow2FVVUeQHr9UYTmYQ9xiN/aDkJpc0pT28TizHGqJ7u8xAr6WCdFovGps+BQr2SLB+/kDD4XLC/HmOfZpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bGdKW9Sb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Puijgxui; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64OFA5iH1211066
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gDV1nPpX3nIdzbxc9n1Wsm9dVpymUyRjJcXvIcY9kbg=; b=bGdKW9SbVOFFo7Jd
	wExZbmC8HnAzH/bYeFHp/25k0XOUuX9jqwV1EBCmHs6U7/z8NSBXlOPR8hHSYaUM
	wSMX30zBdPFxCc96zqnm5Cso0EnCNXrse78jOgxNarxJEQuVwBF3x6/epwQnX98h
	j6rtaA1GZDpNp22l+6Pcavaid3cPfC66YXezOHqRTBxdYWdxOLx6Lz5FnbtFiKqf
	BeCxGLB6m1RlZP5FHNVK29m52n0dO30I7SSSW7eRqzcYc0saEGwdv0wZXN9yor1P
	LM6n+ifRB1Eq8jEebJWufHQH6bcaJ1YMy8Uf7L7kre09iapT53FTiObOeLmvtagf
	tDYnzQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7ktfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:26:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc763c7256so198345385ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779650789; x=1780255589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gDV1nPpX3nIdzbxc9n1Wsm9dVpymUyRjJcXvIcY9kbg=;
        b=PuijgxuixL8qHgXwT+jn/cIFNLlTJx9KBjnMR46lIqXc2ThnCovZbdQO4vqUAlZv5Q
         TcqjQSqqMV6C/Q5RGktr/cu/ecJoUi+7hr/ikWh/mqKve7pi5AkJvzYHtiHg5p2Q6x8A
         YYi61eCLSbOcz/nToJTpvG0Bc6oqHwiDbqaTSd3UGEqDg+ecWSGztn7yHLUQbHydiWcS
         ehh4km2EOHOKbiad9kYQUCsq2D3OL3q6D8ln4gfLkku+WlTT+KPK/hanRrhyP+MmgsYz
         3QcHaPgSZnA1TbB6QIhvkxkn8y5H/1WI5PDKFbEm201hrVgI2h3BsneO4fQhBgpCrcHP
         iEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779650789; x=1780255589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDV1nPpX3nIdzbxc9n1Wsm9dVpymUyRjJcXvIcY9kbg=;
        b=C4ed3VmkIqA/tiZrxY/wD252AM1fZ1z4MTgXNYVxGHyR/ez5BwVhECmyEzA2fBV0Iu
         EF+kOImY7uZmO2PyzZgC74VnGDldc2y/n/croI0t+Hji8YVVlmCQnwChlXr/RB8o+0/2
         IuLhCSJ6xKOdk1HrN4wDF1dAGneu0wvLsSG7Z3o8XcHVXWLKMvI89IEb48TAkmQPIZFz
         2rOUGhkD5Oke+16ffkxiPCypByJdSfFfTHY+73hxwguoMj5ycZ4ogEV0Mi29XpUT+0Qz
         v/ECVJBf1lER0tdvoP4MsB5Vs0oNHSCROmYVCj99ph1rcDUcudiWHcaI47YflEqPbVn3
         3tGw==
X-Gm-Message-State: AOJu0Yw3KlJwNahDSB5mvcJaI6AY5E56yfrijZgSX1sMHrs7Iac+8CSJ
	AtPATEGHdT9Po4D5D7voqJSt+5shmibcOmU3XRI+5Aa8Ny5wD91GWsqnOQc0DFsahdUprUmNEOj
	BiQ1K3UcB1UKobh9m6ovHKU5zJu6xxjLTcqtk3CNiY2o4wzGWDCLKXC3UWQDS44uuaJNd
X-Gm-Gg: Acq92OEJfrcl0ikMcnG6L09+l7ts5XRxOXLYLTWkf2JryUvPTRlX/4YVNTbP1JS1/Sx
	nyRv/ydXy9PxyRpuR4prfMi3j0My6Kuzrv3jbqhmVH8MT0Vlqw7drcJpZfjuDcgDrWMIV0/F+sL
	iYI3s15t2t5+bW3IyQcfuEPppsC0nX4clK31NDo4BM0lwb2iFUsC3LV/PIRS+eIq0E1+Fc/OE7X
	seUE7sDLe765DvtD56YDXUG4Rm2A6ocLRrJjgCoNGmIcnZAk7Qg/Prs1NMPqzNsju+6TL0hGI5s
	dSgifDQgtzgG3ILE3PiuKq14fnTntFvlCAhJbspxpXE9t+RSa2r2hpZHPUK3BYTMLoL4QUHKHKK
	lseW8fD4GkMAW5Q3rXWVw623UV63J8Bx4xXbEtsprRmsSwSh2L7IxrI2F5yY=
X-Received: by 2002:a17:902:ebd2:b0:2bc:b141:8551 with SMTP id d9443c01a7336-2beb06f81f3mr131886845ad.19.1779650788843;
        Sun, 24 May 2026 12:26:28 -0700 (PDT)
X-Received: by 2002:a17:902:ebd2:b0:2bc:b141:8551 with SMTP id d9443c01a7336-2beb06f81f3mr131886575ad.19.1779650788351;
        Sun, 24 May 2026 12:26:28 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce2cdsm75329945ad.29.2026.05.24.12.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:26:27 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Mon, 25 May 2026 00:55:52 +0530
Subject: [PATCH v9 5/5] arm64: dts: qcom: monaco: Add OPP-table for ICE UFS
 and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-enable-ice-clock-scaling-v9-5-c84613e9ce47@oss.qualcomm.com>
References: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
In-Reply-To: <20260525-enable-ice-clock-scaling-v9-0-c84613e9ce47@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: U08WNFtk1wNwPeIJzn05humNZYO75vQO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5NCBTYWx0ZWRfXzdbzL1Nixp4u
 xbnfSo0dHKaoUNFwjS1/71pVAWMNZmCc3bk7BEqY749ygnHcy43d7vyLQCA1WnZS1ho60Tzbjw1
 cM1kw/V6FQ9GZ5HJHlFZIO3kPfViDI/L4zX9xSMVODjwt9QGm6M8cknQEu+BbKJ8eN+m9SK9tV/
 iNomOeCiq+VVUylsvA0RiTp9LWR/KPJH3tR60HzUNH1fSNd4E9mK7b4PJPsC8EWBLrSN07II0lM
 qsFKiznNe0SdBJjqOJDxVj+zCR9ZdMtDYa3qiCTX4W4zYD1rLfPTgV9bMbO1XyUVDKldQeAS7aY
 A+F1quZR9DL8fUtTYXCuyC9HWy/WdHQtib6JuUsQch6xEGQJCURJYqsBTZNQJeMu30y2Ca7nLRV
 0KmKV+/KK/eSMVEyBs5BVqI1KYn/kLm3OiDcVP2BAjD3NZnkWqv837I0PSDqj0ZNRfuOQpS1j5N
 6AQsHDkz95sp0bTRoXw==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a1350e6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: U08WNFtk1wNwPeIJzn05humNZYO75vQO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240194
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
	TAGGED_FROM(0.00)[bounces-109520-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.135.221.64:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,1d88000:email,1dfa000:email,qualcomm.com:email,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 54CBD5C3B55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 805feb481943e0684162048b5e665b056588095f..89586a6fda70dde16007fb9d3d6a1fc4459c58ed 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2742,6 +2742,27 @@ ice: crypto@1d88000 {
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
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
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
@@ -4878,6 +4899,22 @@ sdhc_ice: crypto@87c8000 {
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


