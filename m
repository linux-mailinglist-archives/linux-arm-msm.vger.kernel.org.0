Return-Path: <linux-arm-msm+bounces-118916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2gk9MlK+VWpRsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:42:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6390D750EC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:42:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OXsKtA5Y;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jUZnHtd1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118916-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118916-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0EDCF30C59A9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01A82C1584;
	Tue, 14 Jul 2026 04:41:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E07D2475D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004107; cv=none; b=er9eDvsukH4Bp0LtdGzkkuTP0px/yLzlKww7J7PsTB6NHNvG7OqRaQ/1LPq2cg8kGFMnjmPJZ/RdyBst7QCDtyRQO9NWfinvEO2xi87iVRI0brnlP80G1sRqDhe8FBFHG+byQGjj/XdIyRXqhqRLGa2zz1aPtZ49PbXrWkoksU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004107; c=relaxed/simple;
	bh=u2ixWtnDtAr9aUT3qCjGClLhN9bL29u99qfCFsvucWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jOqNUgyciutyaGgOGVuETUME5TUFSaR9g3JrzEzaSnfThR9sAAppYu+8vDELi3sZAWIv7AqzTmo6OJCUOQHr8Eoz2HkiUL7NThUXtY5vFDPVbYgAOp7ZfK+sQ25k9GxJJRycijUW1VfIiFAhy8UlIe0NfoiG2ifrPv26B/Lvw7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXsKtA5Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUZnHtd1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38XSQ3417757
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wIE42hU1PxP/UvzOUf2JEBgCDG4Pw8YiJoQe70x7Odo=; b=OXsKtA5Y0iuf27dN
	jifBfm/7bqRUg66KDQqKnpc3zydv2aDmwQzNtgDK76HmDwCALkIwJecL4395i6K/
	aCsZ7KLLW2L3aCFAf8qGRi+wbMRXjWfqhXihaV7s3ZXvDuNCpnvMIOrzjyrkNCGE
	ej3Zt1icksf7OJu2GzWD1CfozOnm+Zy8mcWq5m7K1pkt1GqyVJDw8CfFqptnbAGW
	imfk5Qov8rOLr9qSqVqHIPdniRGIwn3Aju88sIlYkebpd8YdlBRGVObm86BU4CHy
	AHqfhVcLepnjLB16GaLEFR8YVSn7fo+ga1cnKBLZ6cF9YvZhrUlwhtzjc3kxsZk7
	kgd6WQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44j20d5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1fcso8955233a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004105; x=1784608905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wIE42hU1PxP/UvzOUf2JEBgCDG4Pw8YiJoQe70x7Odo=;
        b=jUZnHtd16HW7YEJXNh9k97Oep5d5gvfUTVTceRDi8Rp4I5wS5OBLsXlspVd3O6SqQ+
         lSVnAskD6pPg1GIO8KGFQOBw8zW95kIjnjiajy82r+oDZX/8tEjSMPjSfg2gckOkCTd9
         3gnY3ZygSsCOIlNFwXGxPaZZDjcseUJDocT6+mrwlVly+BYfhoSj4izHMtuWFfCCiGKf
         SeXlTAm0/K0cfkqHXqun/X7EgxIBNMREkOZ5+SO/J6+GpuwAhFAlArZnUJGi/QMvlhXC
         moWpkZ5TVV2wk7JLQZQXkWKw2xowPGBPTInAieoUsqzFUHoYKH81eIm839P0EL0ezReq
         bIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004105; x=1784608905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wIE42hU1PxP/UvzOUf2JEBgCDG4Pw8YiJoQe70x7Odo=;
        b=HDFGtjsgF2lau8XjZ0P1Dnd4CqIpC9+xCfh6v16pRdyQsEtUr9SPVYRFBaaEQBPjEf
         sQVvYMtxuRqNHS7lW2OIzz06SKsMWGlcNB0q2UztYohCTxLQO+H4r1vnAFf3H1/LFFoA
         TpmoEyca+SZwsQUdfZ9KZ9GPUyF9Ycrk4OsF7ExxD4zcJfKUnqqALx4aNw2oCGR1u4wu
         9tv3Df3sd2NI8/JDH/30AAkqiNUQtoust07/H8V3jo93yMVJL3WkPMstNdrjncNH/AOi
         souHNUNZR7v5+0nihDHczNwSASTubryiWR60+LGYDQEJjAG+GhLRsEbcZN3UOUqv5fSK
         8BdQ==
X-Gm-Message-State: AOJu0YxlNfXHMlCrROo+VqMdtdKl6SPvZQn6Kfglo+6DYTFe6QBJeiy7
	JnAaMFV2j4k/YH32mhpm40EVx+9YcSRWuRiKCJTI5S576CWgGae0t3R9B00KYQNtnCndMqRvu77
	VTYL4Vy8WZoaKVT9ihgtDN3MTj1K4N8sD9t5QQ2Bglc5fH9oHKjFe7TuzaH66Oc6IZ2jS
X-Gm-Gg: AfdE7cnS8BaNfmqbqmnE8tlxxkqCPhccuFp/3atOThS8c3KTSyEIvHgZJsBt+6CwEgf
	N+ApcGClh7d8qj69PWsro1KZuoxBeQT7HfVgo5qywhn1frGpoHlQW9hduZzC3V/1fFyWS6DNB31
	0yRWLyYsvH1leIbEktzoPhs1qDHp1Vj/B9DnOf9/tJcBHiQ5j4JN4Tmd3DFrTqTkFdOlO0+VDtA
	uN+kxYFeXseVLZB7IYpM1iivVnI4UZEtLaqtcQPFJxD2m3DqcMFdGYvM/ywZve/uoWVMm7xZmoQ
	7adtA1qgZr1o+RaEaxpU6blRGG8Dp/gEJaEFfyktmjQvYqL+tLcWpL9O2FzDcNf3bGXAK2/9c0A
	pi4c5DlDw/MeUf6jAhyXEHMPoUYDzTw0bRIvMCB12aJg5mVwW6BNZ0dqwY+jciJDgLp24lJbCkj
	8VUmp9MvWXcPszpIJZehPZLofYa0nIgk7DKgoIHoVgCjufTg==
X-Received: by 2002:a05:6a21:6915:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3c357232ce1mr971975637.54.1784004104524;
        Mon, 13 Jul 2026 21:41:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:6915:b0:3bf:6c08:4ec1 with SMTP id adf61e73a8af0-3c357232ce1mr971950637.54.1784004104098;
        Mon, 13 Jul 2026 21:41:44 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:43 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:22 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: ipq5018: move PCIe phys and PERST#
 to port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-3-6bb25887a0dc@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX2gOn7ZyGL5ew
 0b39KtDqLic154R09qfBjfxDRYLAkCQTD+Qyb4GAoAyrquOK+FGiFtv0y34yvh+tpkyPZ3ANvdX
 6K6Ei2OASzYqIBu+EnMwyBZo5ANQQBA=
X-Authority-Analysis: v=2.4 cv=N4UZ0W9B c=1 sm=1 tr=0 ts=6a55be09 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Omk4C1WFANfwtcwxkRAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: CFplJyV9UVnnxD-SfL3bK1LL45I-fHHQ
X-Proofpoint-ORIG-GUID: CFplJyV9UVnnxD-SfL3bK1LL45I-fHHQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX3uLYWE3tnzyJ
 I5duQRMH23y8GjyYcNCEUogsm/tTHhqBj/nNJ5DMAjzA69DfroBUZ43E7SLilMZ0QJkgl49j3zK
 rMCMGQhfKzz9OV5zumY4lmccWxs8KrDp85b5dAKBEp3cz5Y10E3eczf1PxGE6zuUty9mgHClb0q
 GgfgdbLzX76fufkdbcx2eIt2XVTbquZeVWZ1gLXHRp8OTFfBzkFve+i9CYN+MuXymPTtWOdmxFL
 3bIqFrdcQiKyutZFg4sXVx7NiZPUrLHEMeKqH5ML+eKDp38c36RhhoE6NyL8iHPa86hNHFBdPqN
 hsEup7NlX/6blN20EM7qpW3jgRvdmccNEXknVHkYJPnAOFfB6qIZDgMjmpnpTxQk/nSzXEZePQH
 D2o/QRbj2ttRTMqcn676GQSNIUqF7pRvj/dfDY/ItFjxEsDz/KU1LdsrliXrKz0no5qf9yk1b+D
 meQKnohK7Y0I251Qh6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
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
	TAGGED_FROM(0.00)[bounces-118916-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 6390D750EC3

To align with the newer style of binding, move the phys, PERST# to the
port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts |  8 +++++---
 arch/arm64/boot/dts/qcom/ipq5018.dtsi          | 12 +++++-------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
index df3cbb7c79c4..33eef92b19b1 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5018-rdp432-c2.dts
@@ -34,9 +34,6 @@ &pcie0 {
 	pinctrl-0 = <&pcie0_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
-
 	status = "okay";
 };
 
@@ -44,6 +41,11 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcie0_port0 {
+	reset-gpios = <&tlmm 15 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 16 GPIO_ACTIVE_LOW>;
+};
+
 &sdhc_1 {
 	pinctrl-0 = <&sdc_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
index b5bfd5dcabad..4fc627b47fe7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
@@ -758,9 +758,6 @@ pcie1: pcie@80000000 {
 			/* The controller supports Gen3, but the connected PHY is Gen2-capable */
 			max-link-speed = <2>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			ranges = <0x01000000 0 0x00000000 0x80200000 0 0x00100000>,
 				 <0x02000000 0 0x80300000 0x80300000 0 0x10000000>;
 
@@ -829,6 +826,8 @@ pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -859,9 +858,6 @@ pcie0: pcie@a0000000 {
 			/* The controller supports Gen3, but the connected PHY is Gen2-capable */
 			max-link-speed = <2>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			ranges = <0x01000000 0 0x00000000 0xa0200000 0 0x00100000>,
 				 <0x02000000 0 0xa0300000 0xa0300000 0 0x10000000>;
 
@@ -925,11 +921,13 @@ pcie0: pcie@a0000000 {
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie0_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1


