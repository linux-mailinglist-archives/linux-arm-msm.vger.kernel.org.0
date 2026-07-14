Return-Path: <linux-arm-msm+bounces-118914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OErZKRu+VWpEsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118914-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:42:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A30D750EAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:42:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=WUHiQmXl;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hqazOuga;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118914-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118914-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2DD6130578C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0C113D886;
	Tue, 14 Jul 2026 04:41:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A60B2BDC26
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004099; cv=none; b=dfBNBe2bfFHVNDaIBWiFsYjvN4PZjZmw6GT7y+0yKHCWuEv0H2/CBMqCgBR9LxVXqgY/42tYIxSKkyfJfNrIPIJAOo/fW7wlCxvuD+GoUtrUYCjCuFkXYFRu5rCNQq5L4Cga+3WeR4DMd7zu4M6wGtQaOSHUcLeWC5LWBdLceVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004099; c=relaxed/simple;
	bh=nk3J6ULBW7xRPLEpb1kRSoS1Jdi4oOsCT33ipHKyZew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkvU6i7VN9qKvPS9wlI0qEO6/CAnkruFuES98sQgH0eyYEh42xOZtstxOhQijikEwN6SYbWmXDAnio0kGHsQvma+K3ubILnlAOdI5+pqaF5GBcUmk/SWqg30djxZ795tIpwbj1Dn/dqhpr4epAVhTxxVk7MnUpSbNH2V2dAPnAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUHiQmXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hqazOuga; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Ivh3506199
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1qeU1S8dCkIKOoGuAuPRYb/kTmM23L+Oo2ErR2SaYoc=; b=WUHiQmXlj73TklWS
	dzqT4KbIBVGRRvUiv10JAEIkyf7rF8n9fPSYAhDY7ioIibNN2lJLLVFoSMXtI2aB
	d+oT+QEO5DdugObxHBSgtAsZRQUdI3/S3rxUeayjmi610bdm5bGc0FfjB3sZDSEb
	oExumhe4I9ywdHNo8FLbmbrsvfXGv6lR0fu/krWSZN52nMaPPafh7c/a0RWJ0DjY
	FqwQoUVR9DJYUQWG6gnt6F212IUKAg5WPabhyzwkOkBdCTnM9RBRImKITCIOjLs1
	3BMEXF0ehbXJDIx3V1GKcmIQoRVgpgdpI3EypFS9D16nQSCCRQTYP87f+vBOrAeg
	YZD7Hw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jt0mv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so561964a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004097; x=1784608897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qeU1S8dCkIKOoGuAuPRYb/kTmM23L+Oo2ErR2SaYoc=;
        b=hqazOuga0CH9lU0OOkbcPQ9uUxKX4SS3OJZOvRUu9fCQT8fnDeVsVasthrrLn15Hwl
         3w1me5885cTVFWaP3dD4vWXwPkffqdHVKl+ZTwLK6K5BuGzgMysLp3uTW/EpfJA2JSXj
         APr6myYo9YTrOlspovV6ntxraAoC/HKaOpVJGjtf8Hw4rPlUV3z1oamKo614FcYeBUxv
         H42OFXshehCYMYw3S0yD9o06TLwzjll0GFMh4f5ilM1RpOtD/0oE/NM1Mia72jRFgqP+
         GNVWUfwf6bzqaSyO5zOVJ4qJ7fM2UIogKtS6PqUl9l25sDBzAj0IQ03lpBnSGZh3+isQ
         isiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004097; x=1784608897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1qeU1S8dCkIKOoGuAuPRYb/kTmM23L+Oo2ErR2SaYoc=;
        b=LNgLnyEgQERfAGcnOPkFYqKIZlha3j5swR2LSgIKjU/p/ClpK90npO5d7KbXFqVcNx
         cm26o8AbglnDii5FIH1YUNAoCDYWAPh5GryJ1DZ+bs5GXNbAOInRP45rqlLumneqrMLY
         Q8E+76J1uLNHp2cj6vtGEQy5zdJo9dfGWnNMHGpdWWE659orxwLc3oRkIbBZfXAHgrfN
         hh8z9/zjR33bLgyqEccq62AP4fHjqA/gROPbtmOIjmWBG/LEEabvEb2k7IO6MNnTcKBJ
         qb2ggWx7vVMfud/VC87DKb6Eh2abrSNFlBmqoZfVmdwJI93HN4n3wyatxPnY7ydj96aJ
         o+tQ==
X-Gm-Message-State: AOJu0YwhvKVh9NbbntYSZlGBSdhXHYv9PAzkVMlfIGVhHLdXj5IhA0sW
	vUXWGIFsuIIpRs5LrYIdIU67rkGDsu0Y3r/k54Cw1jvdUeFM3RTfyOaIBGIud7uPpJUOLzt49lq
	d5x9EmlRF60XiTpXwUe3KVNN/V+l+WZeNQ4AwNTOYznMfmUdLh+KMGpLzaAwSk1e2Yy7n
X-Gm-Gg: AfdE7ck+jJuv3T0uF2YVLuQT3UA8iTWTPqAjvUzO0KyeCEeShwJ4Okpt5VUqOc/hy2o
	6eWIHRJpMzk9Tbz7d2yczLhBNhWZC9byGcJakRL/SVS3Z5dIzY6Spt/fXk6x6JwbK7F8ZOZJYAx
	dRM+QMK5vanPGCGABawkb9miMpb1AZue6FiTrDCV9zU+KLuWNk8evzNKEMmCwNcRSFobn7Ksges
	KbQw1ee6J2s8mINDMnW2JxUTaL9cC6BB5pmuG2tTAjuscIMpwLAwP6WjdN28nnPfSzaDVO4JGPI
	TWsYdS24mQBkMRnW6eS2sVvX/wTmZgpWSL7EYyzi5FJYW2C0Q2dPvSL0ibUXMe/Q++InzHKHpzs
	h4We2Un1Lq6Ax8knzLiMQBLsH8xcZjE6p78YCU6AzSLAGGXGBeGMhMgc3pLJBuYgliFI0zosvnT
	UYdEErpwO2z3UE5jMLNWis77WACaI2BMRAATiRS8FrcnpWFA==
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13266583637.41.1784004096515;
        Mon, 13 Jul 2026 21:41:36 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a94:b0:3bf:63af:84c with SMTP id adf61e73a8af0-3c110a74037mr13266544637.41.1784004096072;
        Mon, 13 Jul 2026 21:41:36 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:35 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:20 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: ipq8074: move PCIe phys and PERST#
 to port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-1-6bb25887a0dc@oss.qualcomm.com>
References: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
In-Reply-To: <20260714-pcie_move_to_new_binding-v1-0-6bb25887a0dc@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: kKVt1635w2GZsHHBfKTJG9kFi5hNN1Tr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX5WNCZuSGlV8f
 6txbZKjaOO8Ko3GQkvmseEOKMF18vuvwp32FMxOP/y1V02MKXwi9pf/GUgxF0obp9hYNFkGPSWw
 MwQVkiB4bnVM50sel3VEGMlw1euWOxpDNJ91YLslytKwuXLb28H0dn+CBtTHhJmtBphlkksaOCZ
 256NsKXT8eM/SQjLGTBi1nCJRUaoEUXOKO8TrHOBsqTqpTd8qmbgTaqZ18bvkZmosvlz2RTduRa
 dI3wD3s2n/R7ficZOVFQc0rwV7bFc1sfvN/MZG8TxfIF0OYHWKFduFthhZLAo9M74J+ydPAUG/R
 ZsMSLUjyatpOnI0wAXizgvJkqJbsopcdu2tRlq1oFkz47DLFrgWY18jGim0xBTqpHqGmKHhFuIY
 WIqO/S9xjraBzQVFU/xZxx1WYJGykKcFWmeoKT5UTjaEK47bVbdBM8ztsmRPMO73vV4crsn9R5e
 3N+XA/LpNCeHlgyhBzA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55be01 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=EB9RAXnpC53JDDx6CxUA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: kKVt1635w2GZsHHBfKTJG9kFi5hNN1Tr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfXzrXTCjvwxHlX
 0SxVR23fRaTLOJboo+uJIVuGNcKrIpZQdUFEvJc9I08jHwdktmmwbOQingFgXcofKVN/xGfsTNl
 QEBofxoUf+KIODvywKE/hFrlh4gpI6w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118914-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0A30D750EAF

To align with the newer style of binding, move the phys, PERST# to the
port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts  | 10 ++++++++--
 arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi | 10 ++++++++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi      | 14 ++++++--------
 3 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
index 5cf07caf4103..dea5ece600d4 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
@@ -54,12 +54,18 @@ &blsp1_uart5 {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_qmp0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
index 34e2f80514a3..f5c125e20ada 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074-hk10.dtsi
@@ -40,12 +40,18 @@ &blsp1_uart5 {
 
 &pcie0 {
 	status = "okay";
-	perst-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 58 GPIO_ACTIVE_LOW>;
 };
 
 &pcie1 {
 	status = "okay";
-	perst-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
 };
 
 &pcie_qmp0 {
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 256e12cf6d54..75a5ae30d966 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -841,9 +841,6 @@ pcie1: pcie@10000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_qmp1>;
-			phy-names = "pciephy";
-
 			ranges = <0x81000000 0x0 0x00000000 0x10200000 0x0 0x10000>,   /* I/O */
 				 <0x82000000 0x0 0x10220000 0x10220000 0x0 0xfde0000>; /* MEM */
 
@@ -902,11 +899,13 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 				      "axi_m_sticky";
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_qmp1>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -929,9 +928,6 @@ pcie0: pcie@20000000 {
 			#address-cells = <3>;
 			#size-cells = <2>;
 
-			phys = <&pcie_qmp0>;
-			phy-names = "pciephy";
-
 			ranges = <0x81000000 0x0 0x00000000 0x20200000 0x0 0x10000>,   /* I/O */
 				 <0x82000000 0x0 0x20220000 0x20220000 0x0 0xfde0000>; /* MEM */
 
@@ -993,11 +989,13 @@ IRQ_TYPE_LEVEL_HIGH>, /* int_c */
 				      "axi_s_sticky";
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie_qmp0>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1


