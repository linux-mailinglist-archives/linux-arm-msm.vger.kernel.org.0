Return-Path: <linux-arm-msm+bounces-118912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jkFCBsK7VWqmsAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:32:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D5A750DFC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:32:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=N6uGb7Ky;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="WX9Hnxk/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118912-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118912-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8489302E7DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 04:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE472DCBF4;
	Tue, 14 Jul 2026 04:29:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABFB2DD5F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784003378; cv=none; b=E7l/MHRIOmT8GfvXzztaATcRRflpPu7XJXsujC3HIPAnou/6/3BiFmCO0ci+UZxnoV+UYWPbtz7+Bhg3YevJxVU8QsalpadHasOCrwOlQk8QE42hJ4LMS7ukhRinuMzDQp7WoHYsjszwKR82MW+Va03eBXKcbzAzRUjNREd7FrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784003378; c=relaxed/simple;
	bh=qBTxNgqvPXIhkW/VgKh1ctAkKcEl9+hhc1jEUBkOmZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBnaPjD0kvsYIS71TcMgaKtSkrZR4XiqrZt1Y9jsmx/7mw3nhDrcijpsyzvcaGtGd5HDXaPh0nnHwAr2tSjwJqkOjvQWSXXyR9RB5Ogd4xhsYgTRjoYYvkUWR7QTYWDFmMJP0shYyT5J1UIU5XAKouUtzX1xHiC/g9hzW0mj4+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6uGb7Ky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WX9Hnxk/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Fcj3389973
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HFnEH3JcQpHJy4B87D/E5Q6yMrGEkNdhe+JaWg186Oo=; b=N6uGb7KyhCn+X7As
	R5JokltnNDz+LC/dysV7Ptbz0AM/B4Hlqur7AeyciBN8ClF3Q6nT+9L4YXAWz77A
	9MDPs1WDw+TeRSLu7WgP8V+nd3+SrUJbH9tM5kZqgm316q1I3rrrBkSk/y9INjrk
	pmZodUaeB1asd1Wq32fpUCTncXaJxvCtJAYp/lJVog4L8ivgzvaH/PauqgYwr8jk
	D9LAEiy0i3XbK30wlhkMse7cFOom2ReBPQcr+pcGtU9PQzI5QwfwLMsoyR07ZdbF
	scWKB3Pp3HnApOgSGAJwRyXDFj2gr7GNmL1Y8mxq7d74G7pSulHzfk2RsBCnGXAb
	gneDPg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4uq3d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 04:29:34 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88fc985a65so5139607a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784003373; x=1784608173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HFnEH3JcQpHJy4B87D/E5Q6yMrGEkNdhe+JaWg186Oo=;
        b=WX9Hnxk/kgJJpLY4fahoNsF7oKk8Uw1ayPp0X7mnhv/HCOzvUpDpjxFtJO776dAEBa
         TB4aIhlbsdX6IlHiLL3vdpM1b2qgiHap5vGRb3YLCrMrokgK4zVqBlgimiCc9SNnM1C1
         4GxVNx2YYmpkBYGrXOIPckr6ozrxj3+fJ4PxVdbM0T5g81ilIhyKpfp50Zbrpo/kudMI
         ZzGeu6ZpktFYYBwFo/nzdEwHQsQDlOeYP9GFLnu5+pK0TjVU+HC0cxx+bnuO2unu7rxm
         2IrGHhImG2yrYdlBY1zEZpmyvF8tGFenm8QtdxQomB2y52eOgR9SMCWrYAZ1Tv80HbT2
         kAqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784003373; x=1784608173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFnEH3JcQpHJy4B87D/E5Q6yMrGEkNdhe+JaWg186Oo=;
        b=IZRlWXWd44tzokbCByKJGbtrIEKuvFqPwI3+HRLn2bpGCBzBULoc74CmwV/yqZpQws
         h2f4Bh44mdBFNYJDAIcmpFzWMY4Jty4fBMzidssSEdvfNEl9xJ1vP1oKuTZGPKGYEma3
         5Qqnty0vMrlRLMfYIgmd56MbYdbHxwnshXtsZll+GMvXTO5wSNtaKJihttMmWvgsYAey
         SshiQZ+T36T4YLOS3sl+yEtve/Uhyw2naE0u35DOwLD5yHgBkWS/9WgXuZTmf809blRG
         HxwkWyr9MEL1AvrgbJICS8xjvwJ7mn4yl/OvmXyvhncyphSz0CpfUHLr9SvJnM9/wYzO
         ze7g==
X-Gm-Message-State: AOJu0YwVdLxm2Xrt4wruXNfTNijnemTWyYYq950YAVXUWqj6KzWkJuFo
	EnSwPRo4cG9jzLwZzVX0MfsUCDWV09IbUH6cTXqf8ZcQTUAZWiLjxvFue/YghJQeAOaJAryWWb6
	Fm/J1Qev+Hh4kiwgpjHwPSquAy6ut52Np93hg5gBXZqhXnzXMw2T1T/SdXI2kPo6hPO/Iv8ZThq
	XV
X-Gm-Gg: AfdE7cn0rdWHkyFt/kOBxH8AtxOg1o/UanilNleb7tS0m48utJzd6ZQwqu9cKeU3zNs
	j1i7k+Z/0LOHCFIKku5sg1veFofPHoWucuIfIRXto8KEm1aKmv6eGGXTp9AfPOQ3+cOOl/c/OYU
	oNPdTJHWLf1HN3lHDzg8DztC5K8l15HpLuA4gP6Zk09Wtyp7Vc/L5B+uyv8UfZ1kda/4aAvxsM1
	VVDY48GkEjiGI8nrybK5oAns/SO6+rQaERNqJcf7JijxLNkZKS6tk3IbP2PT7NYXfHUgctTUbI/
	2zncYhlut8TnFWGtQNtrh94yNfF3JH6ZEtux8DCYto4E7Tsk6CPCkem2EVZVwAK62gsbOtvh9wS
	gFt2W9SEnkPruv+wu2WLW7zeygc2rHsIc1U7u4B2xaCz1MQkN/wmQBsURTo3uwTJDAJAxozGsAG
	SVkLJOPgn7xs6X4AH01SLU2kglCd9MHp5YgNGuXzD4Wsbyxw==
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr12883746637.50.1784003373505;
        Mon, 13 Jul 2026 21:29:33 -0700 (PDT)
X-Received: by 2002:a05:6300:218c:b0:3bf:6c08:fb82 with SMTP id adf61e73a8af0-3c1109ecd0fmr12883721637.50.1784003373086;
        Mon, 13 Jul 2026 21:29:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b4cbafa1sm64388999eec.6.2026.07.13.21.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 21:29:32 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:59:17 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: ipq9650-rdp488: enable PCIe support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-ipq9650_pcie-v1-2-4197749d06bd@oss.qualcomm.com>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
In-Reply-To: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55bb2e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_o-QRdEJ9KkZi4z5cN8A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA0MiBTYWx0ZWRfX+oSB/woEtYPI
 7LGmuYeG4ARoHKExawxmCNcJQ+I1ifLa8aIaViQ5tZse7eYi0FOHveSo/54Nkl8j3DnarizKdVx
 JpXNOyPkPdf1fu+bkpZaf+g55fKAwIs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA0MiBTYWx0ZWRfX9rlLylo+9cq0
 XNiwjJPSPOlAd4kekq9E5u3A4j4fY4GXKX6a9/p6WmN5yBC8nYma1m0DmKkbSa2/TxOCJCQg0eI
 F/nI+VSEOBUfST3nX6geJkNZARxzXncrw1Y98XPdeGLY7nlx9yu94XYP1UGB6wdopJTOwGJd3H/
 tQC+hwRyC0XhqFx/Uj8d142UEyIDSubCpnbAuCwhtG9mhvyDNI3HSbNF2DTGpB7wX9ho4djCTkP
 DH9qMLHY3Vvw+j3ACliJMUTwEWCMWY7QtJXVB/zGGnXF9xaZ28uUiuATDt55ippn/LjpoS/JxJ0
 q5btLLl5LA5DiuJfyUQBWjfenBzL7Vq+bf4T48MK/EqexWeDVwHxUJ6MfuXMhYgYca/HgDTfJ9w
 vhMKYiGzsbX10oAEqcobgPOae+vjBZPfMUsBlaVOIG9A6ezxKxjGL+kAMBF7atZBEx1X3eAItDC
 EEgjHaYZIyd7H0+3itA==
X-Proofpoint-ORIG-GUID: y9wLpSJ1TZP9Oel3LyxEgVplboGu_gg0
X-Proofpoint-GUID: y9wLpSJ1TZP9Oel3LyxEgVplboGu_gg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140042
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118912-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mani@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 79D5A750DFC

Enable the three dual-lane PCIe controllers supported on RDP488.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts | 119 ++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
index 6871f3dc4eaf..f6411a55c81e 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -5,6 +5,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "ipq9650.dtsi"
 
 / {
@@ -20,6 +22,54 @@ chosen {
 	};
 };
 
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+};
+
 &sdhc {
 	max-frequency = <192000000>;
 	bus-width = <4>;
@@ -36,6 +86,75 @@ &sleep_clk {
 };
 
 &tlmm {
+	pcie1_default_state: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio27";
+			function = "pcie1_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio28";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio29";
+			function = "pcie1_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default_state: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio51";
+			function = "pcie2_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio52";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio53";
+			function = "pcie2_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default_state: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio40";
+			function = "pcie3_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio42";
+			function = "pcie3_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio43", "gpio44";
 		function = "qup_se6";

-- 
2.34.1


