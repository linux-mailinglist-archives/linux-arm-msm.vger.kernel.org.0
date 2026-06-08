Return-Path: <linux-arm-msm+bounces-111975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id spDNHFs5J2ogtgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:51:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D871E65AC35
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 23:51:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="E7/FA1PR";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=R+CObCAm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111975-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111975-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8453230C0E9A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9C93AFCFB;
	Mon,  8 Jun 2026 21:48:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C6BE3AFCFE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:48:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955334; cv=none; b=BKCjnCS+7UdWOhNCnXA3u/ZAvSuVdgbBYbNydbFOzfEu7HAPVWAojibNqjMl4qJsAl/oEG1bF16ZSpkHgJRQe5NZ/peSQjrIYuoEeowhTwHBGYcCxSJZ6uo8ZY2sqzwI8wBpWW0aCu/I8RzlI6Hzjrl3cDxdB5691iLcWe1VdrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955334; c=relaxed/simple;
	bh=X0xXkFgpEGLjkiFblpwO+BnhWlu/bE8cwlCDJSPOaDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PxbYvjZtHlh7sQ2hYR7V87AwG6AQPNkLASFgoHaKBDEx2guZyaCYs5zUG8Ee3q7I6/B0t1bE1Qi4BiJ3NEKvgtz1oe4WuptWbVzz34NY7AtbhKILvfK1DUYiFfgtAYnl2Z86pd7ZD7k3V7LAMJgpNDaIH8DcMS/czpYkUKXi48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E7/FA1PR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+CObCAm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IvIpX3973859
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=; b=E7/FA1PRr9ArR/Xd
	a5vofxDWfYZSU6p/vXnqlOW5AXE6w/47OrJK1oXVB321HntvqUio3EkJoOAHgqJg
	aq8BKGzLMwZ74+vbR2xnh14c8HVL7PkK2gFTFJzjNBYU+gggOgh58WOTc9CVI370
	XssHIGkGzxOr93YmNFZsP046AiIs+/iYtVvuHNQ4G8rCfQRwWM8Hg+QZvl86JAd8
	XglC2w0jHxeZzmmgqcuzdbxI6sCf7KDVPylHApm8TeaEs624YP2Qc1QvOQM2tr5S
	2hKhVVOsufXKCkxXLTkb9lsy4VpFurBrBacXo9AwhJGF48A72XUQ9VsX6eIMorV+
	FUtJJA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enxx4242s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:48:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c85c530ddebso2837243a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955332; x=1781560132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=R+CObCAmxaGD8y7YrZd0RePynvltlHQ9JlzpDk3nskfej0vdZt+tRjCaABYsP5whQd
         tLmzsgTn0kgMAgtJSnukzW4OlGaerFMFpeCeaQDidGowpudaENfane/3iAt9gCT+HdPl
         W7J8Wk8Z8xQPBf1IuFw4ZgyYJo786z2A6zax3SzgN31zZFAJKVJLGjiZc3sGywvkWizb
         LvJQBX/rwrkHPfMD3ek6m5PspmIEbEA2XZEheJXeaZDnEmG5ahXb1Th3kSh7pIa+OJlQ
         OCr3mZrU8klbZM53azDeLuOxdaEJl1vamD24slu8QwGpPZUTzCNtFVPNQ9YVZCjxt08j
         fkkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955332; x=1781560132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ETNz+wmmpsdRAuqSqBnBouCW4jgWHavGgQFIoIN6PGw=;
        b=RjWcQ7lwNlCsvFyZfE7oxfJO2/ME7cmIZebQzBhrA78g34DpzzxbFI4MrUc6DSNpZ5
         ZA4cQyqmjLJOdVFw5ZTuJkZj0joNyHgzqD2jkgA4KLLAj1f67Q1LJFG/MezPIGEAJGpW
         dQqYHYGpMmvinFFh6cJNF1SjdM+EE/+p83lCtDHNZLbDh6mPBOxxLnJgNemwbG3iEocY
         wv+nqYjF0Y6wLSIgHjerNQsD3EX94EzGFhhaajwJgEBqtpc4CbN0BeMkSprPSBIJAg8G
         NyZMZoDhbaarFdAuNtFPcBDwlHdxEO7zkVrSloqTqOtmFbblpUfxyo0ks2gaJ4zZqRme
         soiQ==
X-Gm-Message-State: AOJu0YzgZjPe7ZKZhtN5EC4SXApXruuO2XGqbNvajzRfIQI8qRDSYpGl
	TOXLYb5icQK4ZtXPkXlKYVWF+VeBaSm+RSkX/Db+zjjd9oTgk6tE2pqz08JN7GJjkTCB4o51e2J
	SB4gut5BQ7v1rfQhdu1pmC5NzLGa/XwV2YaZwlDzvAGKJwXpw1cgG5eXnZqiApQ4vMGjU
X-Gm-Gg: Acq92OHC/qK0rqvL+eVuivlfExSoYfkWYY1jxJkyvAW8C9FeDWsHKz0sm2pdW3Bjaj3
	zuYKOsDypssBH8aK3e1+x+9LXs5KiZpeFXeuVjlOzblAhleHXkmLnbasonLW7EZNbDnar4bGUft
	0FvsOoVzkYHyqQnUS0BuGTc1g6wRMjTPoNPreIyJ1VaM8VUusnKeTIrWy5nRJDIHIfWhsjzMQtY
	Ma47xTz35bZNKBYBtxGiCt8ldcQZHZStwR966xsjBh1jY4U5Gog8drENRtuBNVbrBdSWvwWE0Aj
	TNl9ivosgsZ/i5ZvwbVXId7/MZOLcl8TsbNDL2TRTSfjf7e3XDir5hueGP6VJhdEm34xrksOCq6
	t5ImX1hbY1jknVVd+xcb5GzGeznVSl3INMWGuqzQFR6mJB9Sb2R530QVLjx0DgiW9qKOicw==
X-Received: by 2002:a05:6a00:a10:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-842b0f52ec3mr17760886b3a.24.1780955331771;
        Mon, 08 Jun 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:a10:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-842b0f52ec3mr17760855b3a.24.1780955331329;
        Mon, 08 Jun 2026 14:48:51 -0700 (PDT)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828cf783sm19607485b3a.40.2026.06.08.14.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 14:48:50 -0700 (PDT)
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 03:17:26 +0530
Subject: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=cverVV4i c=1 sm=1 tr=0 ts=6a2738c4 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IFdraIdqUsMg42QbtkkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: prfzU66sxzbhYFeinUK6SW0NRoV5fHMW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDE5OSBTYWx0ZWRfX/N1Tgf4iRJrc
 OJjMyl5I6Jous0aNITHk9t0Nkc+P+TwAkaL3t0PulLhv95kNagOuuGo99ISJgg8wVuUmZd2lYsc
 2L7za376j4BweQ0a0CJCS/qPWDJhIpyBUgHcy93XuoqsImotr8VkCA2xbfsgw+t9fBtkXEnMZtC
 N7YaBKD8O24CbtrK2ViP+ll+UeKzOG4a9UmDCXz5qK0F5VHJzfl2/m/cmFmmpGxMJP4aJzEJxBJ
 s7NWTQzJPNN8FoXEN7tApLiPQcVebvMaTUJa8iJvaSYP83mse4sRrSwW8pyT0U4UtFeU+b17nqJ
 uE5kV/QoAgb4HTz/JysaKyZElfr+9+ug/2t1QhiuV3qb7GwFptc0YyCDE2lyY2weVZ5W4mVseeU
 kpZWh57h1ULjLbOXhmhPp2TdN57QC+n9oeEWRxVJOv2r3py333LvWCBq6UDc85sb8fngpDQoZ6d
 BVa08fD8/oMiuw2Z5Pw==
X-Proofpoint-GUID: prfzU66sxzbhYFeinUK6SW0NRoV5fHMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080199
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111975-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[abhinaba.rakshit@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:abhinaba.rakshit@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: D871E65AC35

Qualcomm Inline Crypto Engine (ICE) platform driver now, supports
an optional OPP-table.

Add OPP-table for ICE UFS and ICE eMMC device nodes for Kodiak
platform.

Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index ecf4790f3415c46781c8e790d7892a41300ee7a0..cd76da7e49d8c664df6a60b5c18418c4e97a3ba4 100644
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
+					required-opps = <&rpmhpd_opp_svs_l1>;
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


