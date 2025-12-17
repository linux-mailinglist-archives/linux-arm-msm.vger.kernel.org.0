Return-Path: <linux-arm-msm+bounces-85493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3004BCC7768
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:01:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BF1E3010E40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876712F12BE;
	Wed, 17 Dec 2025 12:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGh91Cw1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hkdArdHH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89333B6CE
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972879; cv=none; b=QHTtiyDKfOj34KH7ZXODIe14fng2wKi9sdGaF25fqapsFzPsZwd3Yb88+UKIQrHKrA+W3st+Yfx1VNXYf0IuwnNWl/7wV9cb9GY5Okydhyyi3B2nEJipuVOQPvmuwWV/Ujdoii37ex9syYzV3pZnwloUcJwpjaAruB+vy67er74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972879; c=relaxed/simple;
	bh=FUXdSIRu79LRQPbt1btlGyMbzDsbi6CEs6GMqYJ64D0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bk/im7xtwGhrHDt6fZoYx2cU5o7aDhLXd8OTMUKj+VTUHNs2A7YaVR1FDQPTWTR9RPcoa3WQbXmk5do3hazstQjM47N90m3rkqKA9PxvF/AZJAUoKigFe/XU3UqXWY14hb3PEo0gkZJ+FLS6TE9lNe51KcxDP4eySzxOfHpuVtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGh91Cw1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hkdArdHH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHAt2sH1903887
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tRpffdhfGu+blQPeoVEio4Neufptd5q5sVp
	xcOLVozM=; b=JGh91Cw1MkWCmJ+5W/WZW2T7LuJOwA1Iu7rLVKVHC6c8fGLLqr5
	PXABnJmjsNOj6RO1pmibDws1gqqqbKH2P8YEfVOkvxhi54mIpAXU4ESGSNCzqwdO
	Iu62IehtOPvIXknHEusYAPqRg/+j1aNapUyNHhsZhOo+PJxN1wav5xjHhVAR1K31
	xUyx6CfWgSXQ9XpBHRJZ9NNi2eSsgLafb220+x1kodQrQUDGxHpmHEoRDfvYzSAw
	fJ+qSdoJir5GziElSmH6mtPHIzdmePt5SkaPY+L4zugTvRk0eEZpAvo4kkKbkfK0
	pMGVnOtWNDNzKlqqIu1b4u/eCRZXRfXY51Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3n331f6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:01:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee3dfe072dso144628051cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765972872; x=1766577672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tRpffdhfGu+blQPeoVEio4Neufptd5q5sVpxcOLVozM=;
        b=hkdArdHHtLzeyw0cc/vOhdj70gkMDWA1gkRf+mvS46GeYWwF7wLeJxwEYMnK9iK6RN
         GWaJLGSTAC49rI/VMj5YQBvPZy6f0M5JM2uvHiFFV1k0xnL/ksTwLZKN7C3n99W9zet4
         s9pvz/cMUlYRNGAHzQFEHz2tjuc/cJurJmjQexSuOWlZK4qms/EKtbycg2EkG+DDQqim
         +Vj021iIZiezQ2Wa23aCh+CfVvb4XU2TeAqu89wNxbxrI+hH9gmqeDnkSu04ujKo6yBw
         3bUQspjKPZ90TwErvV3Xm32UWSlEf2Ln9aRHH3obuD0sZ4nyE2pr2cM6VoQctQyRvlH0
         yI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972872; x=1766577672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRpffdhfGu+blQPeoVEio4Neufptd5q5sVpxcOLVozM=;
        b=h4Y8XRPwE49qQkeOInRiyQtrKsurHlfv4C/zFMoY5p8CZ4bZ5iaF1IMd8nkNasekUz
         VeF1zWmoIQr9Ij/9U0xBcvYbmb6ujro0KUszrpnXyaqEwRT7lT5HIr8FySOf00NroKVv
         FCFjb0+q2sn0zJ7gQxhFtjirhiZidA0QpuIVT1thHOaU57Pky5r3+a79XviALvvVfq7L
         Vihzic0YjAyGadOZdEvD/cfbfyfUr/0wi19z9O8Z17SighMwQEyyjaOqtLt3d142eLRA
         IP6UdGq7nZ5g4lOEPDkxXcR91hCCa1f7BsQLJOhzgkkqEfNXM3Q1PX33vK1i7VP68EHR
         cpnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9T3dE0gbuZTYmMh7EI1AIjJVH78fr4DpHmy0WQbJYAjy7f1v9pZPeHFxT9v+++mbZndNN1T37fsNi5aar@vger.kernel.org
X-Gm-Message-State: AOJu0YwKySdTGDBXM52L3V+UbwCXxT79ZFqRMuAjS5SrobP+/ued+E6t
	TCBrhapk4R93jpKkn49V+/+d7s1XhXkT6Bfzc7uNuygFfLaFPuisCbeG7pmOvOU6ghmglbty012
	YA3CEl+xG/38XcKirQVEZo60TqIWxgupz2MfRpqejee9bj5ohQ56k7eI2fMTLOSnHrxhg
X-Gm-Gg: AY/fxX7GZgYlkHsL0GTaOhV5Z0wgpXvxbJRr1pYfnuQPSt4ZZD3jRldESTqu9+5huji
	M+R4nI5cc28XbI7sP7jDW56B3mvAqFJ0IbSccO0VcuWYo6eLP31Vw9PezFN98TFEApiwrMTFm32
	nJOK4MjC34v9LAI6+cGQJAl9NgUz7v7oSMffJoiMFn4tCjBtyPs8tLXWCxcm2/GYGWsPGx7IV0g
	cvZaJEMp7b4G4jB2kkFSELOvtB9/M7iPjvKofROzvEmZFziVKc1JJvBxLl6EbTq8zZq04pZ4flT
	SGlW8SQ05r/AenRibUjGHPIPxDKGrbJvOgzIQYt55OtEcnxK6eSs5FvCRcNP0PNAV2doSpqflJQ
	Y7fYiD9RGy9xL6dwCaXrZArv6
X-Received: by 2002:ac8:5703:0:b0:4ed:43ae:85f6 with SMTP id d75a77b69052e-4f1d05e132emr220162141cf.47.1765972871503;
        Wed, 17 Dec 2025 04:01:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQmZreF5erGJ0p/P4XMvsolxRo2ReByi9x8i/y7qpiycD0B1ysntmTqL4xNDJBJDK3i1GOOQ==
X-Received: by 2002:ac8:5703:0:b0:4ed:43ae:85f6 with SMTP id d75a77b69052e-4f1d05e132emr220155841cf.47.1765972865850;
        Wed, 17 Dec 2025 04:01:05 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b800530cfb5sm254826066b.39.2025.12.17.04.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 04:01:05 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: dts: qcom: hamoa: Add sound DAI prefixes for DP
Date: Wed, 17 Dec 2025 13:00:52 +0100
Message-ID: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1491; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=FUXdSIRu79LRQPbt1btlGyMbzDsbi6CEs6GMqYJ64D0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQptz9/pESJL1yw8+6COsbQ+//AoBRy3DTdXEq
 eVQBNJHPIeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUKbcwAKCRDBN2bmhouD
 15f5D/sF/+igsq9e6Fkz4HuCW5kJCsDOkCDtX5xwD46Y18JTLD8dM0B4A8OM9Di9BOiac5TF3lo
 tcfANsCzaAFzm1JG3vZkp5vJyAfsHbvlO7dk0gsLIaCjkm7toZQVX496o+0iaaE5NHG4TgOm/Ir
 sDXAHJK2G+CnrnB1t862fErAaKJ4QQaJvZ7LR/TI6WV9U8wbs7XA4weN8mOA2x1yqaDMeWavuC6
 5nXpv9QkScThtP39PU0usW/ixKRVIcuEEY5g5iA9IA9OG8jsvD8zzIabGYspTVbfYAx6tgeIhO0
 MjqJN8p+GcHbFtHzS//yPXcD/JbTl0klqA9YnPSlC/ewvkbB7bnctH9KPTqYkET9KLgXysYGFyD
 C3kVefc3xyuYL9Hvh6GzTQx1i1hHK+XyDt0cMpamC/cPVtvAukDNkPZLbPfdL9VEZO5KrFT6i6e
 X+jBJu/X5drAgB4c0ksQvRfMKGX3jgnaE9fFpLvfyEO4UpVUTyWAuVtg4BKky9hqYzdh0Mp9Juh
 XQF/gl4qfhiJD2pnLSrEN8DhLbLrOKRVq6xbpMMUlYMERa5gK4HTsaeLwkzCrcIjkzIkuBCRb0z
 sql5qc3Y5XmRE0u+D3LTQVBLD8PZ4X/MbVv7CwUlWYdv/ykhC9g2zoob3qvn50o6agkKpbYbjD/ NNwx9hHu/Th0fvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MyBTYWx0ZWRfX1DSbyjM1H5UQ
 evH7DdTmMvExpzq0xp5TtYHM+dRGLNBJRisc/sj8n5RBCWZ+uO65AfB6zQI4ezaobBbmWJmGZze
 CS2Jur+/tNr+z21/0YARrkDtIRHGL1SYv0bJBsQH+1BhRsFUh4BTKkiEijOZjvGzLzZMI+sMYoK
 8j6abYsPCc5HuBmiRWAAD/Ihgzf24c6hh0XeayAdjccmp3fxyQM7JgvbybAxeiCCNUmY7ZxdRyV
 93eda3CRikobL3enqIt7JKVzheEYWsTRv9ZlfSOG2r9mtkHS2Neuc0tHScCXMUQKxqTvWnvgByF
 JpF2mHQcLKwrOukOI6yCn7TclYIUvnzouykVSBqm544EtbkTat2AlZYTvzw5FVd0IxmO2OosI+M
 N2ugpfVNW4xz5s8wT9V7gH8gt4yzQg==
X-Proofpoint-GUID: z58IvtEe6wp_RG9gfcr8jesxVTizAjan
X-Proofpoint-ORIG-GUID: z58IvtEe6wp_RG9gfcr8jesxVTizAjan
X-Authority-Analysis: v=2.4 cv=U82fzOru c=1 sm=1 tr=0 ts=69429b88 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Fe5OG9wbHMQLStrQ8AYA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170093

Sound DAI devices exposing same set of mixers, e.g. each DisplayPort
controller, need to add dedicated prefix for these mixers to avoid
conflicts and to allow ALSA to properly configure given instance.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. New patch
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index a17900eacb20..c3119a6c28ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5579,6 +5579,7 @@ mdss_dp0: displayport-controller@ae90000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort0";
 
 				status = "disabled";
 
@@ -5667,6 +5668,7 @@ mdss_dp1: displayport-controller@ae98000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort1";
 
 				status = "disabled";
 
@@ -5755,6 +5757,7 @@ mdss_dp2: displayport-controller@ae9a000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort2";
 
 				status = "disabled";
 
@@ -5838,6 +5841,7 @@ mdss_dp3: displayport-controller@aea0000 {
 				phy-names = "dp";
 
 				#sound-dai-cells = <0>;
+				sound-name-prefix = "DisplayPort3";
 
 				status = "disabled";
 
-- 
2.51.0


