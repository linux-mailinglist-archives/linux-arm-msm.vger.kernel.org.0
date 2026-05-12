Return-Path: <linux-arm-msm+bounces-107046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HBTGlnRAmoNxgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:06:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F44151B749
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 09:05:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9ADA3300AD4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 07:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E12C379C5B;
	Tue, 12 May 2026 07:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fwk7LdVX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2slaINL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEF4A379C47
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778569512; cv=none; b=bFasKzTFUOVbCWNsoV8vgbbwWJTd+G77UP+1W4Eu4Y13AvWVlF80D/xmA+rSCXmZ/okXY9l/HmvO9JfitV6ZScfBgW90mmARlUqhRWlu3j0g5i60YcPxfRQhmECNj1D2R8acdpIk068aXqt2fR99KTuu/+SpU5GqZRA+GRqGD5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778569512; c=relaxed/simple;
	bh=9vYix08+c4lv+jbQhuTA9yArZFcrbc2L01V9Hr3npI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o9khcRpdsBjn8FjG6NW8HpoaWf+thp8nubRyqo16iaFLYBZ4e4s2OLdfng8+yQKBeua5UAqlr2XQCq+oMYKOOnPQcA10Effn8plAiHB5u0OGBGVuqbqnieSf0bpR1dWmNdTI6tVy+wqYu8mYwqL7Dag5tY+oS/tbnCINmUr4ess=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fwk7LdVX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2slaINL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64C5GJF42518581
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9HfXpwITEyMUjLTal5dVmmvNNmwX9acXkHvucPxg3ZY=; b=Fwk7LdVXIYoduG26
	9EFBMzKzXHUZCKkbDUzwIDUFl8i8p3yPR4juVPaw0TAp24enrIRtGNglloC36/yT
	h97qczakkvRA8m9eH9Z+WQJVKJIdRaC4aUhMB5lbPFsN/rests6h1z6Je5x6hpm6
	+9dJlTYgP5BWyZoEFlNrRJ/NnYfGhRmpYyJSKRp26XW52TgifKEd1RlPZwng87h2
	Uu6rDsj8jNwDfxIVBlQAVfNUMy1PpjY7zzQnMLM8pjKeZCwVbL1JknOi7kQRy7mu
	E+cWy892VE8YN/CIK02E6QnClS4Cs93P2IrFv1Vf9wqfjl2VL+FKF88tL0J5x43O
	8pQGUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1hyd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 07:05:06 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba224c3ffdso70307535ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 00:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778569505; x=1779174305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HfXpwITEyMUjLTal5dVmmvNNmwX9acXkHvucPxg3ZY=;
        b=N2slaINLusaES+4srAJzo7uCikmM4dMYpqDGb+Ve6IBazaShU6IwsB703KOyuoiwZ/
         bEj/ROT4cL/JEYKfGIfGw2Avf5tLFvcUPlB8Ais+orXaGf7+Xwpu5xXEAnYu3SrCf1y6
         CBkKQG0+f9Vj1/4WaU2IB9l+DtVcrp+xr3toSPOQLmU7eomr9S5ks7+7CctrDk0cBmyb
         cjrSCSHOXpNZC964xj97erGfuu9/vlM0Z8vOmuTHXtUstXswrd11hLSFiSIQ6HhviN+u
         txrRMJLPNqghH9TW/P0u3CaqnOzfrKS9zXcnPt9gCzU/FK/mmKMYj3pSSDOa7USbdaCX
         gaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778569505; x=1779174305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9HfXpwITEyMUjLTal5dVmmvNNmwX9acXkHvucPxg3ZY=;
        b=qYjmkDVFED7xQvrtXPwxB87uERCMcjAgaRImCQr3YWEwG0JRBqI8k2+bRMD6x57rH7
         RnfawdjB3E8PtCu53ru4ZttwFDjcO6L8IeOLQG7H/T97QwVaaj5SfvgCVe6//4arhtbM
         9JahInf6cOYc8RuOUQxja9FJ/jQidyyeGwtRViOAmvhjkUx7Wb9ZChIrqaMsrEAsj0NM
         Hw5re6RQPa1STxYY6CxQNJiCuLcd40ZH1ZrHWNw+QXmbE48b+MYkOTv0PHTfDACmJJko
         2JRtR+NWlkYC+QiumQtGSEOk4XdCXpndO53Yxlxwpsz2NCpwxpASPkT9NU/xEAdGHK6j
         OWoQ==
X-Gm-Message-State: AOJu0Yzu6chX+7mC/TcUV5ndYWDpwk7wC+QpvvT0ct7yFWCj8e9m2zi+
	u8DHLR3JX1opCQr5ZXEYwysZtgHWoR0Mc+ZC3aUjeEma72dIDoUtgYErJuXedOrjZrtY8Wtsv/Q
	zbBLW+XggkKjBtLwrLgZNfunMOkMzdilxFAx32wIsBFz3ER9g8xiuXxIJLYHzRNcOy7d+
X-Gm-Gg: Acq92OEch+WF6tMYqnPkaDU0CgXLa9hKrmcpDIaZjnEg7aG/4AQPGGVG2ubXqBhuNad
	GY90q1HQ5NgWj+d/hNXObOWWwrtTAQp30wFtAUrUwPnoF1ae7aXatjk067E7X1Q9MNJZwkVLKgR
	fV1Pv5ptRPD4S9RnvpHSfmaJ+EIvOxDB5wMMfEgWcnqpNzDKe4cgNeJzsXtuHr/9BO0IzAsBEr5
	7lI63mCKmDf08fTAeOfHptbA8GO2E5VEYtF488tqE+ZxGPhfweHCHh8WHUaFK767omexESBW0LK
	VROETEMn+/IhV1v2XP6vedP2qhxm+vhRjHmant7HsdK1zpEBRxnxA7YyZ+rn3Jib2PoilgkQaOU
	4ufrKAOsGYz4TivSeaG+tteOR1ilBGBiIBMJAMY40UMCofIDP22b8Lwr/sHUpK8A7zj6+hJhI5M
	OeUvUjhU3VF07do1gFo2WYmt/sals2SHQziW+r7hVhi8b+iuHjOxazJ3Mi
X-Received: by 2002:a05:6a20:1590:b0:3a2:d79c:416d with SMTP id adf61e73a8af0-3ad99f243dfmr2250441637.43.1778569505180;
        Tue, 12 May 2026 00:05:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:1590:b0:3a2:d79c:416d with SMTP id adf61e73a8af0-3ad99f243dfmr2250396637.43.1778569504672;
        Tue, 12 May 2026 00:05:04 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm11354488a12.15.2026.05.12.00.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 00:05:03 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 12 May 2026 12:34:54 +0530
Subject: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the SMMU device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-ipq9650_more_dev_support-v1-1-c4c627351d80@oss.qualcomm.com>
References: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
In-Reply-To: <20260512-ipq9650_more_dev_support-v1-0-c4c627351d80@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778569496; l=2416;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=9vYix08+c4lv+jbQhuTA9yArZFcrbc2L01V9Hr3npI4=;
 b=k73AmTFaPwJWclAuL31ijFSpc1weJf/xEAOVX9GDBcDOVO4asz1m5x1FAHMfY2BlCM9Gdk4Ru
 9qd696qTeixD2al8qiM0NNkWlP2yRIUMS6LvpXecQciEKRW8DBv4/Ej
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 3NNPzJ8Iuh3wnVplug3OmzU6YDAxP0ui
X-Proofpoint-ORIG-GUID: 3NNPzJ8Iuh3wnVplug3OmzU6YDAxP0ui
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDA2NyBTYWx0ZWRfX7NyIJ6Ewul8E
 UYMwxOVaCqCTJPo2XzArpBj6LWqYfafa/GPaAz25Na4/Ni9+Wj0wKwtveSGN0SJklyG308puytP
 qA5tJHqt+h6pGLoYKO+bsOwNx1dj2+egarQKTNR/qXpGrJyQMj+Zj36X5i5BAYGV4u476mfaSGn
 WX7wmdmlSj9Yfqnf5WWyfmZy6jEEQLqCxCys5Y5V61N8paubukaZmxEtrpeiTOqz+4Ly2AO49CF
 Jp1laXo9OiYjiSeNztvOzQtcfMHz4xY9YzBmQdfKx8aL8WAyrYtJQ2veqH0lwl+14Lh/eELMK9Y
 Ce7q8UoER7TbpJIPG76KfetD3TZWJl8Yqhe8xEQu5q2R60cK21osffsF9Pgta+sAT9XPIxuR7PP
 NaueNPxJzno5unsVAxZem/L/jXqs8HKdb3crfA9nHeUw6m1iU7xlhinnmG1dzxUxub7PDpBRJdj
 jC8Bf56YmPziEfNME/Q==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02d122 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QjoPxeQpGguECTrdwR0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120067
X-Rspamd-Queue-Id: 5F44151B749
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.228.225.192:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107046-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add and enable the support for the SMMU500 found in the IPQ9650 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650.dtsi | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
index 88bc77009ca0..3e7527609591 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
@@ -364,6 +364,48 @@ frame@f42d000 {
 				status = "disabled";
 			};
 		};
+
+		iommu@15000000 {
+			compatible = "qcom,ipq9650-smmu-500", "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x15000000 0x0 0x40000>;
+
+			interrupts = <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 640 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 645 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 646 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 648 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 649 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 650 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 653 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 654 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 655 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 658 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+		};
 	};
 
 	timer {

-- 
2.34.1


