Return-Path: <linux-arm-msm+bounces-111976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7JTKJk85J2oatgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111976-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:51:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D5C65AC2D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:51:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Mmjs4U3v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xq1TprqZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111976-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111976-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2CE5B302AD0E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:49:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795F53B0AE3;
	Mon,  8 Jun 2026 21:49:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0684C3B0AE4
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:48:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955341; cv=none; b=WCex0dfNv46Jk9J/XiYojdkKjKhI07EAAC1kpI1HpwaReMRrvVcEAx1SrxRpupACCixikzhrdud2ctkHBe+nl2L07ICFe6lO+tqi/E7vzck3fgL48IqFQ1QGEgsU5ZYjy0Tl1mDPYErLmH9pETjv2MiSU16BuGtXY310vk9Y3CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955341; c=relaxed/simple;
	bh=DXh2TI45vU1iLpWsE+RYENmxgSc16LkuYVsOKJ6zBAg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3Jo3RvVMWQs/Ds/+jf8BzI9jrFph6NwSRP0wiqH7DtBOQ45s0sMHaVVYHNAsjV5UGkcYIHhuHcrMOuo4e7tObKnQgLMMQOAEMWUGLLlMLo/dVGA5pHf3Mrr7RVKRQMSB+vK6WfL7qs0uwAPVLYn5rfEftMsP0s2e8GQuV8tciE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mmjs4U3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xq1TprqZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IwWGW326796
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=; b=Mmjs4U3vXT2qQ//u
	gQucDQb1FL1F0nKyNt1OH3Xc4JyM0cbCrJDC1C6Qj8ISqiLb/3e1daB2yyKae96k
	Tub6zD/BBRQcz6O3uPhPCwM5AUAigDpEuZnDgbLYVyFMVDdub/0XBx+wDcPvhtZo
	jyGBOQUd6/3zLW9EPTBQ1NzZKQFw68+tWfStFQEI4BcZUezzakyC25OMsaEpjBGJ
	9vOPK0SwEjBdQaX4U2+Asw42xD2t4zhwKFjdHafZKKXuy5lGxkRK9NSdgk2IP5xx
	K11jj3G5wSjMoe7dXv43XumwhZk+YWT7OYVJm+KKb+gtj1bRFf5ISxC76IgtRsHG
	LXMfBQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8k3jx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:48:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8423f424d5bso3186604b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955338; x=1781560138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=;
        b=Xq1TprqZVGbOlRQQ6/rnGBfymqTXxkKD/SK2FAlM0Bm5GGKrOQpi9KnKolAk4zPm5N
         RFDXYgdVzZuoCaiOIf0D4KaXEUSmpiCleKhpjOv1ZtbGUoT6HnUUlEOFP8Zk6V5w7sAa
         akacQ/EoDC/LiyfJoGVEQTU4vJzaFww+slOqdM7Bi9wD/fRXTUgoK1ZKwVGALEypJCs2
         ETGOuC4B79GaXO/RgFETcXs47J5V9hmMzPfXOcEpmq/KEThiPhGQk2coOKv2giCRfRw9
         C/TqyKtmdOmY5fn78PgjFbpWXw2REwocOJMhNQsy3x5FZiNW85BsApgtK4H1W/kR3R0/
         KOQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955338; x=1781560138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iYYqWEc3U8tcC19eQELIhV1rxr7yBmE/dYW94QG/AcA=;
        b=KVHEOOEWevUAI9tGPPIMhdInjgr3UiGw+511eW4eNX/FdqbnGLtfEs+2Cn8ugNHZ02
         LuTw2n46msJXCeknR+s3Txi+kyf/8DQKRkMZ9s/vsMoluIAylFlQzqJsXnHNp7upfDo2
         ntR46pgym3Dnk0ritMmQbiS8wYqi7Dqsu42vo4SUk3jQzlrhIap84nmdNbeX1zv7vFmU
         V592DyvGJHXs6ncejtbDueJjiqoVGbCcpudTzpqroM17qD42HVF4oZrKEAtwG06Ew6ty
         p1y5gjQzs+m1BjZo3TFEmiKlFI0oEMallqCEFg6d3FIZ/0g0938PVHynS9ajo/CPwsbM
         +ALA==
X-Gm-Message-State: AOJu0YzHdrTG5uMlhQ9Z+bi7caDy8HYQTfmLMtjY+RZvXPj2+0NvGGqX
	TtLCn0mG/mY9+YRXiBZ8xC0/yGNfduomKPBVjP2IgwpUq8qA1P7/85QfrRSRkW2jD7UxZx+xYxX
	eSGJ2Orf89rUbbP1w5Pd316uwNVxnf7mi03U9T9mul2Z880NE3WUHlC9GFnUs9mxsKpaM
X-Gm-Gg: Acq92OE2ymt2MjfAoLarmZXzNp0RTFqBafdfEbIYXskF7NU1kG4BtzDg716CnyuEYRV
	rnqJxjghbGfPHAMvy9TydaPf8kNI+w10pWQtF5JwCMJbVsOIw5llDamxo8V3kGnTKeADDf+aBPF
	G2DI3ZLxUfRdQBrgHUX4TjRBjYxniW7EWSrbcZnePN74nzpv1MqAqRniwxfLpL52t8XQmydV09C
	qH2+m7nvD2a5kstfIqgVwaJfslepC1tHIyACo/M25SH0vOQo45whPyekoY9lD2dxEXL0GMdxGWm
	J+jeWuO2UB24IDfYEXdW358cxwUO8N3xpvN9DW6ZuRxQR0+IjOcprQcW4hoHlfKo2166YFGTTWh
	LGa+ZLB4YahXHTpD1/gdCxgrtkX1FiGmX4vKZmHX3rKxiSpTgkSK+ZacC6XpcQEh0xcyCsg==
X-Received: by 2002:a05:6a00:3cd6:b0:842:678a:a7dc with SMTP id d2e1a72fcca58-842b0e1300emr18228754b3a.2.1780955338020;
        Mon, 08 Jun 2026 14:48:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cd6:b0:842:678a:a7dc with SMTP id d2e1a72fcca58-842b0e1300emr18228716b3a.2.1780955337523;
        Mon, 08 Jun 2026 14:48:57 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:48:57 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 03:17:27 +0530
Subject: [PATCH v11 5/6] arm64: dts: qcom: monaco: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-enable-ice-clock-scaling-v11-5-1cebc8b3275b@oss.qualcomm.com>
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfX2aGsmG2BXEH/
 cSptZtDE4MyaZJBK3lYpAImWAejdQCZ7HsR6l9geNo9+OgKAhpMPlttwH0uAfRvn5QkzJhjOFlV
 JAgyuOi/RqgOvv2wqechHWM+PAVmKWqWc+nFAKCx45MyPDpG+n5v+Fe7y8LUXfX7OHvWbOHoib3
 kXP8enTTWw8YEnZoSOrQGworCGiwIQe5sNiDd6oD1GrnVvz72eZsyyzM39WOnLyxzOV+yXN/5jb
 rawNST5PU5x49fumdLr/TlWOoBqvBxCcoNPsgjsm+3sQrheE9ceHDA3MDbXlwAFndsVSzrZSt9Y
 yD5NsxUmC84W4Ry2KpccvDQ+287pSrNCsmV2uLS9gjCWkVxKajeiAtRajW2B6/rx1BrfPP4Wpj5
 rR5nJAAG1L3R/z5jtDKu9aCgu0i64ynuV/WYZTpD59iJhpyR5I+mH/Pj1Ql6l0VS/t/qPW4E8L1
 xoUlbmjj3bD1ApL8Iyw==
X-Proofpoint-ORIG-GUID: 3V736ccnm9ZPNbb97qNEutGBjDH7_vJP
X-Proofpoint-GUID: 3V736ccnm9ZPNbb97qNEutGBjDH7_vJP
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a2738cb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111976-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 77D5C65AC2D

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Monaco
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index a1b6e6211b84d0d5008231c55613a0ccd61b9450..d9298d8b7874b8669b2cded2a28a99dce6eadbda 100644
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


