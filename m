Return-Path: <linux-arm-msm+bounces-112415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EYizJu5JKWomTwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:26:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACDE668C59
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:26:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XfwzKtDl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=IyZY1Ciy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112415-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112415-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 493F931117AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB23D3C1082;
	Wed, 10 Jun 2026 11:15:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD243B992A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781090142; cv=none; b=f3OVxVx+uxVc+gnSJrU+Si1oV1tQYWcvn0lcTzHPHPeNNjujPssTNpzH3McAEt9qkvPBxvBpvsyEDA9mX7XF0c9FsqtQBoXG5Bd/ixaHBd+yAityzoqOpA3hlZqGyMmbsX0R2rv/3qqT8TDiY1hBq/XQPL5ZxH90+TNDIJeVTpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781090142; c=relaxed/simple;
	bh=cvu4d2kJvKk8A926+S6pK3TKEENlyI4DCn/3JM86Gxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jsuSdkBLoylIvMyI5FDv48y8ByT7Zn8nsmv9y0t1gG6OgbbdIqkkedQTXr0X04TZwrqYw3IvJjA3a5n8Rgk7uBXZPfmHq9UJur9hYbM1lXfq6kkncRdB9VxhqEawEbbojCT2xlGMGysJC+35HT70IRiR4JShCt7qEIvT7iAfzks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XfwzKtDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IyZY1Ciy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A8x2UK735799
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GOJL9pHM9VE
	8gBcDzy3zyIxAj4pWwyeRwtuxoVKFdhg=; b=XfwzKtDl0d3rlszhGG3SsVe0viW
	cR3fCz6dAzWf3U4uY/p7u2NhLPufoDfqDDEP/fV8SRYwu1BkNFPiqgMTpwvVE3AG
	cyGpJFpTlT1Oc0hVSP3CrT8GMKTpiF4om1m3n7+rJ9Vb0r3i0JVi7urTfYr5CVaG
	iKqQBwHNx5kQUYogQGLE9rZ6djnb1dRZn3f9nnb+RjakJ71H8Io3pV4r+u9fGHTD
	2FU+uEIdx4rjlw9e8giBGAbCMYfCsf/LXH/0zbzR9tYXjvWj5umzgWz04D7rqRAd
	UKSos5115zamXnwgrMDnwR3jG9yXAOpnp32ofSM+A2TreU5sbWw/fromurg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq4w1rhnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 11:15:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2b64850easo20284655ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 04:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781090134; x=1781694934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GOJL9pHM9VE8gBcDzy3zyIxAj4pWwyeRwtuxoVKFdhg=;
        b=IyZY1CiywFAOdQ3l7iBmu9bqxP4wPccsBAYqype0GD6wVKSt/dHdyJoxrt88tP4yNi
         Zvn2q/udu9xy2Q3KWvMVdpg3Oc/kHmIJXVsiThsbY72DtesxULDQmrHajUXIYgEmLf3T
         z1mfpqa/A3JK67iGtyrNsrCQaWUtnRt71oy1tSvTv14/O3vHebtS0w2ZazMB1atlvNB6
         bubNjOdIcEuOTsyZLFyhVvw7vKtMjzVChDxHpe8OLMd2jtJ26BZVTM/gwieRyCqibebj
         e0z4/dzXsBRfJ07li+aJ4sR7llOXLO6T8F4/+TqupCiBmLsRNs4Znh/TNqrF9n88/ZHw
         qvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781090134; x=1781694934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GOJL9pHM9VE8gBcDzy3zyIxAj4pWwyeRwtuxoVKFdhg=;
        b=mVn3l+Yui0VR3d8xnie0+u4NbFw1DrEcasJ4+wc2m0+t2X5Zg1pp5+WOJBvIowuPeJ
         JoN7KP+uadtV+8JWEGZ7j528aD7HdgKWKe8/xo0Uq8UOy9VlHwQYyWTSiB4MSxOyr78s
         2YQ4ecFv57NTwwVQKB/ATRA9ZzLwRfSzmd4Rflwy7cnFjs5AHoomVmBADQKmMjcd1Beg
         CdB6pFuqadECSOgV9wMCIfEkCspKpMxAuUnuhzjLVGjv4f+yzKe412fc7rsZtfZeTm08
         wGqDRTYcE0yQDiIySWWKhKneCNI7lirhac80ntrNx+1jnMqg2u0Tqx3Vjo8Nx8FfP582
         L/wA==
X-Forwarded-Encrypted: i=1; AFNElJ9a0e1Uo1mLXpqVD4ruzEaE1w3JmVDGOZHrTVUPsHxVvXe9nAdvxmL5DI/29aqztjbQgQa4IePwhinud+lR@vger.kernel.org
X-Gm-Message-State: AOJu0YxwoqpIjgiT+Fk+RHB04h3OKkXomNucWX+KvRSgYORX3fEpuLBl
	K6T+TSsOxdHfr5qySgjb+fSRtYZ6xyHl1Tn7YDKKp7adD62q+Uoa5xigkvfGcHmVxed6mEJq5cY
	c9JRSVQOy1RvDnKeJYQUiR/fUJiXrYFtmDP6kDFx3AioMBrMsxhoalPT/DyfSq+0r9KkjDh0C59
	2h
X-Gm-Gg: Acq92OG58oqmeee9RiXdrDznVhMUvCeMzpyClxtxE+1UW7BDbix9p4vzLjmItLn8jGS
	49clNiU0ryqygHWHRafkg/OWXH3F7lXbq1K16paIiMn5CehlAQ/04GRCwKgHN31lGaW/SsSck5B
	P2iO7bz+hDdNpNdLhoIQGchAwulKhgX9MG2YMFgp/EvH9/wDRLI+Ok+2BQUsE6VFjI6o/oYTsrW
	IKXjzMwPUAF9QuqNVmBSKDSB8ulGVdt9ZJmp4SryKWXhp+t2fimlSLLzBx4pYG/LjoJywzsOYWn
	8JVZTXc41RG4VZ4Hz9GNr2Y9tEXKDwBj10rtGPLAWlS5NsnAO6LV+gbomDQ1V1PGI84YE4DjbtZ
	h0/leKg5Mw3Hj06gGsUyEqbu6GPz6hiwjF++VCvj9qqLgrXRXVqd8zz1YJkk=
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr251962165ad.28.1781090134259;
        Wed, 10 Jun 2026 04:15:34 -0700 (PDT)
X-Received: by 2002:a17:903:19e6:b0:2bf:21e6:baee with SMTP id d9443c01a7336-2c1e82324camr251961615ad.28.1781090133733;
        Wed, 10 Jun 2026 04:15:33 -0700 (PDT)
Received: from hu-mchunara-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164fa213asm256052545ad.35.2026.06.10.04.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:15:33 -0700 (PDT)
From: Monish Chunara <monish.chunara@oss.qualcomm.com>
X-Google-Original-From: Monish Chunara <mchunara@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin <ssachin@qti.qualcomm.com>,
        Monish Chunara <monish.chunara@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: qcom: Add SD Card support for Glymur SoC
Date: Wed, 10 Jun 2026 16:45:07 +0530
Message-Id: <20260610111508.3941207-4-mchunara@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
References: <20260610111508.3941207-1-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: R9drBbDCfWKK5u_Oo-i7vSvKOD1SwG3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwNyBTYWx0ZWRfX+KRsKQry/KSD
 CsMYz8jy/o7QjwYq9x3ECunnG+IcMa/Q12cml6dh4iBr8o5Dc216S+Sg+NiCDZxjP6nH3QH3Twl
 4YRei1gEBpDwJ6rvYAqBboak3OMtAldLY30Lyi7csj747nNp93q2jlx86G1rkTSilMPaVjgVDDB
 jsC0UEBK8XzOG46feWjbQBAuOfOxU7LYn9p0YbIjw2BwIaju3EIJmhzSWL/pi2d6LeV3QefIIy8
 fcvdOjcIr/RNMHnjAARBg+S04UFef2sK8QiJd5I/p5urCcd45XsLWL/XFU4oG7ygqpn5QhN4TDU
 /tUEZdW3Y/01Hka9NsW++aTpn+SOjlpydp2NlLr/XXnPDSkbmQ8e/PFMsNqwectmZz/GayLOd5x
 i50RzT+lBBo6qBqLFJZy3/EroV4iV3ECpXwSCyKoJ6J3TVGZN++V/eJ4+62JROuZ3BHYGelUdgy
 EiOAXmKovxwyKpHdiWA==
X-Proofpoint-GUID: R9drBbDCfWKK5u_Oo-i7vSvKOD1SwG3C
X-Authority-Analysis: v=2.4 cv=ZfEt8MVA c=1 sm=1 tr=0 ts=6a294756 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=8Kt1xAjLd1AUGuYYDaYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-112415-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:ssachin@qti.qualcomm.com,m:monish.chunara@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[monish.chunara@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3ACDE668C59

From: Monish Chunara <monish.chunara@oss.qualcomm.com>

Add support for SD card on Glymur SoC and enable the required pinctrl
configurations.

Co-developed-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Sachin <ssachin@qti.qualcomm.com>
Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0989fe39e7ef 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -3927,6 +3927,57 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		sdhc_2: mmc@8804000 {
+			compatible = "qcom,glymur-sdhci", "qcom,sdhci-msm-v5";
+
+			reg = <0x0 0x08804000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			iommus = <&apps_smmu 0xd00 0>;
+			qcom,dll-config = <0x0007442c>;
+			qcom,ddr-config = <0x80040868>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc2_opp_table>;
+
+			interconnects = <&aggre3_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			bus-width = <4>;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc2_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-202000000 {
+					opp-hz = /bits/ 64 <202000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		usb_2_hsphy: phy@88e0000  {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -5714,6 +5765,46 @@ rx-pins {
 					bias-disable;
 				};
 			};
+
+			sdc2_default_state: sdc2-default-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <16>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <10>;
+					bias-pull-up;
+				};
+			};
+
+			sdc2_sleep_state: sdc2-sleep-state {
+				clk-pins {
+					pins = "sdc2_clk";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				cmd-pins {
+					pins = "sdc2_cmd";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				data-pins {
+					pins = "sdc2_data";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
 		};
 
 		stm: stm@10002000 {
-- 
2.34.1


