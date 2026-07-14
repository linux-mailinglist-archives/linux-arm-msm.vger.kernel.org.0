Return-Path: <linux-arm-msm+bounces-118917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lN/nFW6+VWpWsQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118917-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:43:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5E750ED1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:43:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GSNxqM2B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dL4zz33d;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118917-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118917-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C33AB304D74B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7850A2C1584;
	Tue, 14 Jul 2026 04:41:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070F22475D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784004111; cv=none; b=CBkaG4FNWaoH8a/EsmW5rsSvW4PZw8dJ2wawQZs3mFmEgpT4by2JVVe6wnXekxhGmnTyw7RdT/KFHeJuefYYqTNyTgBgBZbTG79hAfiyk4cUSY1TX1OpfU2Ys3sE+8hYVWyZ8cpWNaYxZMWeETnxLbPklUpPtlgQOALGbixqHT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784004111; c=relaxed/simple;
	bh=Y7UjFBm85smrzJ/ry1/wlcrpkw0E5epkTHwa3ZUdEIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QtmOCaP3jxZBvF5vM0cPb1pXdtfgFE4UPAqvAOyLbX/MprF9ZDjuXSJ2TzZuq+Gel+Ri0FgPg8/rABs0N/qIwNGPq73lXHudAPFyhHmZMlyaVxQjtO/+wVQ2dQWwwKp8y4fuKB73QL5rG78RnUv0S4TXwUGkxiXRhIaQGXAl1NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSNxqM2B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dL4zz33d; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E388303482864
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmpKAHUkU11crwmE+Dh25P19YtZXeAfFlBes9UjHb08=; b=GSNxqM2B8Zfu4Tdo
	pesWlpKxWHBP7lkIJf9DDWTW0gU+waBgncFbzrnxJ8/ur6e7+nVpzeQfyjN+9/33
	cvlOO67nbqt6zYM4VC3sKAUtAHMJhwQBeAc3f8g4ssvPfb2yoSwuZMTzKnPi9t9z
	D35uS1F4CpadjporyLdkcNWNp+oAvOlzt9NWbISQWUuiQrSd2djOfeKk3cyqyfT0
	36Ugt5kqOMo+7fZXF6SaS3AytUjzZ4GtHJhb04LUurTYvI+A2OB74+QYoIShGVB9
	TKTwwi0m51Vw2zOdnhmTj115snm3CsMHesTOHh8vHB6Fm6G1sXz9aa6yr7yysk7f
	MGh1Fw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xa7qv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:41:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cec4226c70so35300455ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784004109; x=1784608909; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FmpKAHUkU11crwmE+Dh25P19YtZXeAfFlBes9UjHb08=;
        b=dL4zz33dD8bM7FC/IQxBIntIw915aUedCkBv/oMy7QtxIxywgEGzDohRMIQe3E+gr3
         1iOTtUy+B3TPUDsa+VefRALM87HrB2DPqlFYdh1uqZtNuMtxIe63h/PC9PjMGGI1zNiG
         xinXoiQyn4vG3CFdN0MsqnPiuH0e5WR8oERU6+CxQZslMeX/XBIK4mF7iorwLAI3RcRx
         tgGWNC0+E5rxgmIZZOkBesiHLaPZsW5/sSvVjYhaAVYhJQTGEK00BQ0WpfdIQE5/J3Zx
         F8PQgLYcB6tyfCIh7DDwoGSxemQnQNlgNXL0VncBu8dNQ3rqvD204aUas/3vybU0dUkk
         jyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784004109; x=1784608909;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FmpKAHUkU11crwmE+Dh25P19YtZXeAfFlBes9UjHb08=;
        b=BHxj+HJLSBPJqnMuzl/LXrVujOdiv4KnzWPIRJ2FXky9unZS9VbLbEZ3+u3FgjxAc6
         HV4Ifgicanfu2dB2m0QT+b1ThXM3cg1Qibmk6/OqHaCpNzpU+wh5tz5xWJJwqXslBWAG
         YJGYsZty6d4aXsZKqdB6+C7wh2++0vs+lY9i4/kn4g6lwQf1FEcXTyr0KOWlVI9WLJK2
         9MkEbCR26IZS+4luxqaWyDVdObdQUaLS+pSIDlviQuB2RlfITP56txQGL8tw3RJaNuLf
         Esr8bNVeu68rUHekfaY1f0f0CHrulPLXZcx2I+hlJMYIPNH88tO3Wmye4isW19c7G1oM
         gjvA==
X-Gm-Message-State: AOJu0YwHna4G1RX/KrAN/b7TVVliPduL0h0GBqaeLmtFgKcC5s0WAtvj
	fNZwN4M3BFvXQLIODJZ0JVEbYZR06oYUsU9lBBWxqKYIgTbKEjn4u816maeq5q3/knwg/RfbZIJ
	RTQnBsQstg5EstbHTOZPF8D8t9L/U7Xmze9cD0d3jl+3ZoMtf+fPW4pI3Kxsj4axfeJzh
X-Gm-Gg: AfdE7cnG5sLN046myK/LPZ6LRteLl+vl588ulFR/AXRqqDkzX1HcqQSRle1j1WA9RBf
	nOPjk8XfjuspftLiFLhtLqkpS9DpJOWHa1lonh7BisUo5LDkAMzDr1vtSndDvBpgqv0/T9i1XvS
	7+rHPoS2TpNiuGcHCJ6zmSRvmWyb6j4WdGKYtkQP2jdOlb/O3EUNzpiplmHELLoPJAZAJj6b9/G
	IT67xZOGRcMwTAjQjqvkXTzQsRs7juEfl/by6YN0GowYE58KvKFvGfFrFJzTKuy7WYbD8m434vn
	JoJqVcyxuBplUvFGJ0UrTwk2CrZfCKYSliRsU/RG5+kT+LsU0XV1m0uQAEvsFKkxIozUq3dIE/o
	2Y9HAlLvFhwsv1ssSMJ+3Iw95IZuWX/i2iAPJ0SbofYPdKTghecQ7h38QjdM7c8crB6HWkBjCqA
	Pr4WsvH7ZIZkwl2dUUHFcQSI8mRIFsBfBgRyFZWdCYgo9l+g==
X-Received: by 2002:a05:6a21:6d87:b0:3bb:2200:f67b with SMTP id adf61e73a8af0-3c3571d035dmr862596637.40.1784004108559;
        Mon, 13 Jul 2026 21:41:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:6d87:b0:3bb:2200:f67b with SMTP id adf61e73a8af0-3c3571d035dmr862563637.40.1784004108114;
        Mon, 13 Jul 2026 21:41:48 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659d87a2sm68624567c88.13.2026.07.13.21.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:41:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:11:23 +0530
Subject: [PATCH 4/5] arm64: dts: qcom: ipq9574: Add PCIe bridge node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-pcie_move_to_new_binding-v1-4-6bb25887a0dc@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX7WoKjbG8Nf9q
 dG3oNlTkw2jfktNb0jsXC5R1qZBh60HD20zam7/JmxPSvjGUpiocCzl+MEpLZXnsjDkumnLuBlP
 GdUCfji58OE2P5bpgfTG68eiJ43Kq++S+kYTwLdI993YUSZY/S9Nm648AOl3H210yZJVqDdrHFe
 kiLE7iAseylQrN7ZtIm2QTzvHYuKoaa5R9y2ei6yMp5RfS1U4FN/a+yWYK4ErYl3Z5ZR9hIrNrv
 +ebyOdDrvLaREozXykD9NREmZToVVT4SxbQKX8+LMhv+MXqyur7Gu9TYZlPd4dI5M6Zwrj0YO3v
 tWuHS5Qokb0NVwp7+QoeZr2wTTxv4DQl4w4q37q8HJFfFN9CL42FDd4ke67mRgEzIKWAaPI0LTw
 Uim0jEBQCmGBgmDyL+Xuwj11qh0TcRSLvMF906qyXHHpbZGfILqzPjnpSUhYuzpDJQ5x6/UBJNJ
 mmtaOVOGiNDYGHeyX8g==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55be0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=s1t8nmxUu40s4NX6_nwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: VErOuUPH6QSpiZ2_PhPqMZFLa3Fm1KT6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0NSBTYWx0ZWRfX9er+30qvhUmF
 Z92JM5B4bJvEWnyl74MeQ09ZVFPw3LO6RvXMA2DZ1zsr+g83mGAerSxNzZgd5LFj+kgqehknqqZ
 ICJa3+08SMb1TGRz9yf1VOH7+qAtfOs=
X-Proofpoint-GUID: VErOuUPH6QSpiZ2_PhPqMZFLa3Fm1KT6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140045
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
	TAGGED_FROM(0.00)[bounces-118917-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FE5E750ED1

The PCIe host bridge is connected to a single PCIe bridge for each
controller instance. Hence, add a node to represent the bridge.

While at it, to align with the newer style of binding, move the phys and
perst to port node.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi | 33 ++++++++-----
 arch/arm64/boot/dts/qcom/ipq9574.dtsi              | 56 ++++++++++++++++++----
 2 files changed, 69 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
index 3422058ac480..ad3a82c50e22 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-common.dtsi
@@ -6,45 +6,54 @@
  * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
-&pcie1_phy {
-	status = "okay";
-};
-
 &pcie1 {
 	pinctrl-0 = <&pcie1_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-&pcie2_phy {
+&pcie1_phy {
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 26 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 27 GPIO_ACTIVE_LOW>;
+};
+
 &pcie2 {
 	pinctrl-0 = <&pcie2_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
-&pcie3_phy {
+&pcie2_phy {
 	status = "okay";
 };
 
+&pcie2_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 30 GPIO_ACTIVE_LOW>;
+};
+
 &pcie3 {
 	pinctrl-0 = <&pcie3_default>;
 	pinctrl-names = "default";
 
-	perst-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+};
+
 &tlmm {
 
 	pcie1_default: pcie1-default-state {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 451c2076f6a7..5a5bda5f21a1 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -1004,12 +1004,22 @@ pcie1: pcie@10000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE1 &gcc SLAVE_ANOC_PCIE1>,
 					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie1_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie1_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie3: pcie@18000000 {
@@ -1092,12 +1102,22 @@ pcie3: pcie@18000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie3_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE3 &gcc SLAVE_ANOC_PCIE3>,
 					<&gcc MASTER_SNOC_PCIE3 &gcc SLAVE_SNOC_PCIE3>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie3_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie3_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie2: pcie@20000000 {
@@ -1180,12 +1200,22 @@ pcie2: pcie@20000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie2_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE2 &gcc SLAVE_ANOC_PCIE2>,
 					<&gcc MASTER_SNOC_PCIE2 &gcc SLAVE_SNOC_PCIE2>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie2_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie2_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie0: pcie@28000000 {
@@ -1267,12 +1297,22 @@ pcie0: pcie@28000000 {
 				      "aux",
 				      "ahb";
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
 			interconnects = <&gcc MASTER_ANOC_PCIE0 &gcc SLAVE_ANOC_PCIE0>,
 					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 			status = "disabled";
+
+			pcie0_port0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie0_phy>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		nsscc: clock-controller@39b00000 {

-- 
2.34.1


