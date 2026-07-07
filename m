Return-Path: <linux-arm-msm+bounces-117163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YALLB+2nTGrbngEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:17:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6824C7185CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 09:17:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pEPZXPd3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zi1fA9F8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117163-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117163-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB9533064E1B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 07:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E133B71CA;
	Tue,  7 Jul 2026 07:11:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C823C1F3A
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 07:11:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408292; cv=none; b=YTJGDRe34waAXGRkZd/ErUMVrDRRPppGyM+02eM0W9qQQwY/eJ6vjoJ7RO5q1BnytLIVpHZLCUtjGAIvuHD/eEIbkVcP928JuFPRhCgvn/+hHfdbEiqCuYKMjGtfgIygtN/kbZWMIsb/IdYr9f5vVp034uTXh5EeSTJdq4xCZq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408292; c=relaxed/simple;
	bh=WLqIvtUKgECpv0Xco/YWKPlSfN9F9B/RCBl/algh7j8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g9l0ozu4OLNy699JyTzmsgs3rOX6e73sx6xF8Eha8omZQNjXnaQ3sc+XwE4dHqQqxTRTJ07nASlSnP+PXGqorMCC2AfWN8eFByQOLxedlzdpYQHAb9YU/SRoSkWHYKY8uUF0VmQuJWzKDR6m5McYO9BzlAvnWJmF1wuh5WJlMDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pEPZXPd3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zi1fA9F8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6674ALsn2501539
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 07:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byHAsuTn+81hOgzxnhOzX+LSpjVP+YkDrMHaU143Oxw=; b=pEPZXPd3fkV4lfWk
	AHEFY+VugRipqqnZcBDZ0AHusj4JKEmNcs8dSLzCokIE8W+eLs6X4zk8FueZYTrT
	9heu5cJuxfND6mQBTRcLaz0ImXbyimRMt99xvjb7Whhasyys/3qDUOitwEuBchvw
	jOiJigwXkLfTrZNvYDYlunGcR8iSPIemmPFEnoP9GywwJLV9W1rMa9VpYio04Jyt
	pBa87wHbfMD1so0BZ3ol/MZGgnxmNsrvvYyynTmCkUroE192GNTDjEb69jAugSOU
	oEpTyOt1NOp9rgEBJRdo9mFmkQTIs/vjtu6FxZLr0UqV0a4ZU6C8HbLfegYtFxbB
	cvae1g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88hsd506-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 07:11:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810960140eso6331766a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 00:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783408289; x=1784013089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byHAsuTn+81hOgzxnhOzX+LSpjVP+YkDrMHaU143Oxw=;
        b=Zi1fA9F8A52BpGR/2WbiXfu4mX+hbGEYWFMwZS2U37EZBqClELRjx7n7kmedfby4tQ
         kUNvgof1YqE1vApZvuZCT5sCDMxEy3KY/QEPoMniukkBeSCiQeqhjDXM0vYfNO7fmGvu
         xjHXKmznZLgFqFmq3qqrJTj9AJ9n2q+SNKtd/qU37YutiegAbz++tKtERDgmgSG3LomR
         w3MBVw5BcJq0/Xq+H+r48IlbODZ/+YmDttgUl8qFEJGtwf6bGsj/DgBw0sxYbHa3DUCU
         71UouC7NgVRLekNBBUKqoxxkUzdt7mKnRxjnO9e6bZAPo2CJTQ+QjamvrjBAY+XVV5qB
         Iqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783408289; x=1784013089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byHAsuTn+81hOgzxnhOzX+LSpjVP+YkDrMHaU143Oxw=;
        b=Uht9Zes6NbGPZp+XcqIQluSSSm2+MfLFOK+2qgu+zwgGwi2x+6lfn4u4OWhPLCsnrE
         HE0n+VQtFply1Ne7IcW9H910Olnb2qUxYCfCktS8V5UaFQk+fONp11FggEPXCyf9oji9
         AZR59GoWVAEMFxAo+7eX/8yPPZPlnnM5W1ltGtBjf8ofOOiVJF0yjgQReHD3wqCCUOyt
         DvLb8ktTMego7OfodRdDmpX8Ys7NheGvINk3NyyJ3vx1Wflm4MQwNqHjKluRvUqVHvRK
         97mFyfCUF09GlVFivSZWnzSFe27dtqKw0+e99eOdHdwQym03HQYvo46VV8S6i/RgCEGo
         Mqxw==
X-Forwarded-Encrypted: i=1; AHgh+RoIPay85uH9hQcOOehhRlyjNUB52DEx9ICyA60LMn8bu4To5NT+6/8nrsOgVXy7rjbW0xo5eycac7jt/f3Z@vger.kernel.org
X-Gm-Message-State: AOJu0YzPMyTptpo9UkTlumCoWbeTuOFeUiholm0JqZuPIJb9NWI1H3w/
	ehFBXxGamem1EiWxyeNYjYcbfvwLDFWBZX9hYzaKK7VLVQcgsiOwvNS5E2EZ27P8ziuyHHgb5Ir
	c6ZLp1HbEmH3bYC3vuaa+WeorgEddBQTjfbZCHJQZTvaYvdhZkmtwNPksOaWu1J5sWf9XtrfOol
	ou
X-Gm-Gg: AfdE7cmNj7t6S69obudwFMCl03snpCkQIJ29Zy5SrKw7q6Ayv97RPh9s65lodevXkIF
	a6QxIfLS51X2oCWA2+ehvid/fCwkRt1fVx4iv0y9MowhMoPfoGQIj3W1TQzz3Bi3iN4OWrrFmHd
	jgYkMt1SwxSwtRJmiPMmVoPFImj8JnatIXDQGqteaPV1Bj4QRNavcvaP6HSY84EI+iGEHuMRcdE
	L13EvLzdWs/ZAO0AULgSWDof8BwjY0HuBU56pOH8Ypka2x1jZMUL+JAYxfRPaWYn9XnOcZQ/C6+
	qwjeXUtAyMQJBhZGWnrJMjp+9wSUFTf885E+HohQUMV25HhFhUTt71iFxkpN08rjbfwuyeI5gcc
	4apjbbzlAEkkm/LQr3dIwnzfOIrbPAAK9ANSJk+ovb5Cq
X-Received: by 2002:a17:90b:544f:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3875576757cmr4193599a91.4.1783408289249;
        Tue, 07 Jul 2026 00:11:29 -0700 (PDT)
X-Received: by 2002:a17:90b:544f:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-3875576757cmr4193574a91.4.1783408288791;
        Tue, 07 Jul 2026 00:11:28 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d13fd7bfsm587326a91.6.2026.07.07.00.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:11:28 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 12:41:12 +0530
Subject: [PATCH v9 1/2] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-ice_emmc_support-v9-1-701c86f3c25b@oss.qualcomm.com>
References: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
In-Reply-To: <20260707-ice_emmc_support-v9-0-701c86f3c25b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: XGf1h7DFNhwXzJOD_LglsgvkE2CAJbQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX/SJbI8xBiRQ1
 ebnOMAB4Q/g0DPZXbbvfVzBEfp2tBQODllOpbHxww5ifn6pXhXhQUq/tNiEvR0YqUwLLrzcmN6c
 TWNht2XfajrEIoqyTMEjYKkj/9rGEKmYbIkErf2JpjQo4B2340JbbD0kxesU90ex2n3E9MYeW3U
 CnPnpk2TEFAsRuCUcxlJA1swEvDgC+rPSI2JwdU7hdRBSXk91KfFYpN1+ZFRCkEp+TFPlcj5Zn0
 rAjsAn/dug8L/zZNBRcyM+AgnJzX8IZjsqDk5IBn5g2iwffsDLstA5C7V9dqYkJ7vNnBl6tQGIc
 xcRf1xImGeKobKBBcwZd3mICJPY5BqcvdfM9A23Wzmv8YkYDRTBWTJNyY7E5UTysRhtwq9R0tsL
 yKhYuKmFQsFXd1BZyJkzu5CTOVpf5mGfdG/wNLdYPCo1F6z6YB4wXYOu09+R8kwFW1YhXzwiCi7
 hrTm8CP1O38SHeqReaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA2NyBTYWx0ZWRfX69GCeczULr+S
 NR3mIyLA0dBdWN1Mu5fpTkYvxTXvO6se8pH7Sy4VFiqlDhMN7CG2Y9/QmKQgJM0pZcUlM6Hv6Ql
 mSoKf7IgV7l1ZVoQUnTSM9dt70i8BOE=
X-Authority-Analysis: v=2.4 cv=XIwAjwhE c=1 sm=1 tr=0 ts=6a4ca6a2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=tkX6oP73yDwSImw5D5gA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: XGf1h7DFNhwXzJOD_LglsgvkE2CAJbQQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_01,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:neeraj.soni@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuldeep.singh@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6824C7185CB

From: Neeraj Soni <neeraj.soni@oss.qualcomm.com>

Add the dedicated ICE node for kodiak and reference it from the SDHC
controller via qcom,ice.

Also, define power-domains and clocks properties similar to the UFS
node.

Signed-off-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Co-developed-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 90e50c245c0c..3692be65cc21 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -1050,6 +1050,8 @@ sdhc_1: mmc@7c4000 {
 			qcom,dll-config = <0x0007642c>;
 			qcom,ddr-config = <0x80040868>;
 
+			qcom,ice = <&sdhc_ice>;
+
 			mmc-ddr-1_8v;
 			mmc-hs200-1_8v;
 			mmc-hs400-1_8v;
@@ -1076,6 +1078,17 @@ opp-384000000 {
 			};
 		};
 
+		sdhc_ice: crypto@7c8000 {
+			compatible = "qcom,sc7280-inline-crypto-engine",
+				     "qcom,inline-crypto-engine";
+			reg = <0x0 0x007c8000 0x0 0x18000>;
+			clocks = <&gcc GCC_SDCC1_ICE_CORE_CLK>,
+				 <&gcc GCC_SDCC1_AHB_CLK>;
+			clock-names = "core",
+				      "iface";
+			power-domains = <&rpmhpd SC7280_CX>;
+		};
+
 		gpi_dma0: dma-controller@900000 {
 			#dma-cells = <3>;
 			compatible = "qcom,sc7280-gpi-dma", "qcom,sm6350-gpi-dma";

-- 
2.34.1


