Return-Path: <linux-arm-msm+bounces-116263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6/QWMhmHR2qQaAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:55:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FCE5700DC7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 11:55:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XIAPIPyq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y23v6KvB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116263-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116263-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E99FC30485C7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 09:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292DA3B47E0;
	Fri,  3 Jul 2026 09:54:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781A13B47FA
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 09:54:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783072462; cv=none; b=NdtKcMO9kLyiuske+2JygOSn+XA3UeF3Qgy1WE4FYiIzdioYFBBDapq9F1vPhgdp6kTeQXs4JrXH7OA1hlHsxIhBZaq5zs/ynxwKHNDPDwpWjP7Q2BO1px9JLjxMohMBJFFGTlChBW/SEPu5wMPGkhwYGZ2F8QRSImHJ9K4IAec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783072462; c=relaxed/simple;
	bh=tyv11HaWPqYWgCaBGOxFUkX1745Dazgv1z01brprm2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B4DSB1YfpNn1af0nGGeXkO3bGhQR5ep3F3XhAVnUX2Ko7JPtEswB4uM1BR2Y+E0y4I0NWYh2dd0U5AMgBqmi17Kfsige7wciQA580f6AXEfBkAbOmxVYQA6y/B6pLYGI57NqYDGDg6z2mtck7aiwBl7A49vUtp6Uobk9Ey7lZd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XIAPIPyq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y23v6KvB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IW1X3195271
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 09:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OR+59DzVOGNIldMXrB1Xe8D6n+R5h4ItttN0Av+hjsg=; b=XIAPIPyq9+j1J1er
	nFLXp9EP1OjR4fw+Vt6QrE4+JiSCjFJtKq4brYhce9EFf3RBqKh4T16B++D9bqqY
	MQP762Z/K6hp8tpDAYQxdEJMIR49FDfxuwJW4PMu6aSzHiKMBQyCrBqHzQnrVYj8
	pWJvEz29Hu19OQogjH0Kgeo13Y5efnQ14PBiusaAlCTTKaavqkcwwuCUp6BRN4fE
	vAS2ciP0fI8Uwact7PTbkl1+B9oG0KruCIJHN4+tX/T5c9hOcqRCSIzV/zHcoZ5G
	Ax6vbkumtdfON0maUDSn/Mk9PMjtjMrAcRilm7EIBQCzeJPN8qO/qL1hOt8ek5hv
	WJ0q/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrjjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 09:54:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c987913b08so5436695ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783072458; x=1783677258; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OR+59DzVOGNIldMXrB1Xe8D6n+R5h4ItttN0Av+hjsg=;
        b=Y23v6KvBMtZ4OZZEne957/ivrDiiYY5sTfoy1HDLRq1RqZQME5t8mNOeAgT3GzeWSK
         p7M0lxdjQYWIRLVQhdg/0hlFOGjSriiJ6Lris93tyXcPTTRGGFQ217tenPvbLercl3Gx
         gcT0Gn/RFDFZf2bZ9bfJ1k7IApHQYKOyXXVloLK8ZBtHyO7SKn2HZigHnLziTCl86xFh
         uNno3aYvE4ooczg+0a6Lh7iiMtr0nh7JMKrj6v/qpJyuxODsNYlFwcMKH5wbz/X8C2Ho
         GKK06goFMulHyUqcatVZcD5Y6yAMJck8Tb/PZg0XasuHvGcvPazMsFcMbHZYoxLasUw7
         UHmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072458; x=1783677258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OR+59DzVOGNIldMXrB1Xe8D6n+R5h4ItttN0Av+hjsg=;
        b=N3/ZO06inOWNUxKDv+q3aZxYrEYeImuRt0yE5ysxYSGZqj0hBoiGvD++dSykXtZOGU
         tviiyiKqqTE4BPzvcGCB6cXk98W2Rrk2O6TlVYaiG/kp4qTMDdZnOXBe/ugjw0szym+v
         CCk75wF5r/4BrmAIUy5WSiKTeczBeLzQVUxHuv+HRFtlEvVIPpMPw2WBykZvA9jaeheA
         oZXUMec4EjKVAJxPHcGHjbyKWTly+IxM9mZO+Wc0+i/Xj6ffkZbxcAY049PwV2NUnLUJ
         iHFAJvg2W5NYwONIA1CSCy0KP6BYk1ND+GZKR5GLM+OeYax39KHKdQzpF+QUFu4y+yO/
         GQ6A==
X-Gm-Message-State: AOJu0YwCPVWM2kio3VyrZJAb9a4t2Z5z9qQYK7tb+fWcA+Xa8YX6uPOI
	CQeF5R8zCh6i8sU7Th4k/wGZOCxQgoWQFGRW7FZYukBXySr0VLCVu5TvMPxew5jE5oET+NY2DxB
	u/6T9L1lFPkdNa6LBAGnQz7NFTgbG7LI3bVclyCOhASo0sTVmUx9vLx27gmuRcUMXkHln
X-Gm-Gg: AfdE7cljAWDRhWCt90Q8SDIyE0w7KCJtkmm7HbyCkMMKu3wiAIQpYQJdJHbUDQuzKaZ
	02/RrebL9po4f/4Lq5CC+f3brPtE0Rv3oFdLW8RUw8xF/6jSiCZedyvV8UHPx7Q4oiazubnG5sv
	3aNmUCk6knRQkTcclkprICY3wDS8K37pZUFnXvyTMSK15si5X42voDuaPfc/pVOure906vCnfz9
	FkI3wut7cbY/IPvyP5YjrPRLcP5n3mFDe5TiMOIXIsTyX3CIquduufGbmEiEcWLimxLJxqVSTWn
	3wItiagIDZ3Za5Tvkd7LtqxnLleoeHwxpaN0c/eyL36crMrRRhWuLNBiLf3QQbSD4SViMcl+nHa
	LMaC09he3zZ2Yvl0S/ccAR5gjAr29y/WPA4w9tsinLNSqaXjS4tKBR5AYsAxpYcZ9xdLr0rsE9k
	yYmgrjW+EWHusNoNBjjmIJRXs=
X-Received: by 2002:a17:902:ccca:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2ca7e6f327dmr107322825ad.7.1783072457743;
        Fri, 03 Jul 2026 02:54:17 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2ca7e6f327dmr107322615ad.7.1783072457323;
        Fri, 03 Jul 2026 02:54:17 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7146914sm7034515ad.35.2026.07.03.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:54:16 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 15:23:42 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: purwa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-ec_support_for_purwa_evk-v2-2-c59aac5c6aac@oss.qualcomm.com>
References: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
In-Reply-To: <20260703-ec_support_for_purwa_evk-v2-0-c59aac5c6aac@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Yushan Li <yushan.li@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783072444; l=1443;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=tyv11HaWPqYWgCaBGOxFUkX1745Dazgv1z01brprm2o=;
 b=XCgF0m3VnFaux/thqoB5hOfJeh5R7+IhtX5IrsH0Nfws20J6r4ioiPVbg1ir+4FvUqGy1Xn4M
 d7h4TUe8QaxCdBUJyEVPZAdHwN5IZfFG6Q0yZHL+inI+yHqHwSvzP+s
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfX2X5fiQs2EIx5
 i+yHzXf9uU0pzYyNIY0Dm/gHrFIt+0AyVteOq9eHi7Zq+bdt19yrhOWdrLcHGCBYoslmbm1g6M1
 t51JSfZaEvVNfPr/mUQog51dBL3Q17GulkH/xxSM35tblyLtqSz19hHhesIrtHG6gBfPVd755To
 fZ78YEZQm79gLXUsL8AVRwGEofPZy5rBQui8Llee35U+8LTE58/t0ZQDOc0plLesP96u/csTZuG
 kdaZJJASNSLIIMh55ELkHx1mF1KKPkG3+0bkni+fwXKCCCf2MC7P6iYc25J8M9zbUJxcruOG/SU
 A0DImbDUgB21ZAeFuEqTvPEppkQ6iGK4gmDoKXNesG60EC3i1GFWeLDJX3TlK5Vmcanbd8+TdFQ
 9VnNAImsOBPUtnIVZ62FjNsUq1w4dNWNwNGsoaU4oWPiZ7BjU8nnp9aRONTOXWEGXKl4qoVLq4k
 bbKwsOmaXzBQU1XXSAg==
X-Proofpoint-GUID: 5e79hiaBYeSB8Fu_X9TESapOhnUIoSjv
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a4786ca cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5e79hiaBYeSB8Fu_X9TESapOhnUIoSjv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA5NSBTYWx0ZWRfXzaTWZ9GRLvTF
 jbw55YP9y39lIaXIrDHUBrycf660eYQ4k6gx5hjhZOpQRvXUz8l1OX8Y7v8GXsWG60U1U/8M7sq
 4DipCR2mjwp9ViqWgqli9rrZ7fJQPk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030095
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116263-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:sibi.sankar@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:anvesh.p@oss.qualcomm.com,m:yushan.li@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3FCE5700DC7

Add embedded controller node for Purwa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Tested-by: Yushan Li <yushan.li@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index ad503beec1d3..491ea7769cd7 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -837,6 +837,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,purwa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1326,6 +1336,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


