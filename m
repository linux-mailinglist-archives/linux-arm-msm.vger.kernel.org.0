Return-Path: <linux-arm-msm+bounces-63968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AA7AFC22C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 07:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DD3E1AA6C25
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 05:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9463E221269;
	Tue,  8 Jul 2025 05:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IEQY2DUI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12366220F48
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 05:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751953178; cv=none; b=mMZFxJQp8XN+bfljeommEUoqj9NDpYwbnD4PSljhrEfck57FgeXKBXcKCQ6fIV3XguPH9snboWXw0SSO7t124snVSX2LOTm0vviL6y3auxP7yV/929vkfkkSGbiAnslvlR5ubEbl86wN1t1IH+8j188Hhm8HINQoUJ95L9Cp/Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751953178; c=relaxed/simple;
	bh=VfK8mEDpXLVB6H57qiYobVaPCMl4DeUgsq+1SP8HFbU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OwwrQbLKNWCkxG58ortnLMQ8bbl/wMVI4F8KXmzOKG/c+3bLWJWTQ1ldOdkl1GJ3RVc91zCsqKGqzQXXFnql/iC835A+aMkYdpRYvlo1GIs0FJiEWoR8Mq8GQRNT8oWCL9Y4jtKsPvHL98QVLrSATqL9kN9LC7fktWtfWe9MU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IEQY2DUI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 567JXgOT021652
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 05:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g5I/YdYhWivNVueACzh2oQkNO+/A7/RRFIBqM+SoH94=; b=IEQY2DUIMQ6slCJf
	BGdelgsLzUtEVGb8KcUZbroUa+/GtpfLtgNewdO7vymrXRTK7Fu2xoxqtbp/w3/N
	BW2T05amihrY0PYMCUaO4lKA1LMQXIxKETpPqlFcFF6JnTWhBSvQn3zBzGrXSEGu
	fQeD9D70jUV5y6j+8k/x9yPEAdjY9Us7rApmRmd3FzgcKrOuTtAidoNinxBKZqP5
	yHa2VGqSWtUD+GqveYFJu9Pd/f2lEueK9WEBbqeCzCHw7aaQRAji4mzwACn1sBjQ
	sq6edHnclIC0YKE4EXrBILU9G4obPLYsguO3fKqkO0VaqS+hWA0FXv195JOVMp5p
	uzXyKA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7qjdne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 05:39:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so4544977a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Jul 2025 22:39:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751953174; x=1752557974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5I/YdYhWivNVueACzh2oQkNO+/A7/RRFIBqM+SoH94=;
        b=P3UwDa5wP3H9Q6tiddViG/2PeFiO1z0GxD8vXT41tFQ6Q9/1VcFiMkdanpr2vqpbWi
         dZOQVzhPjlAMhhPPdTxFXvLiFgnabfiSXXm5DjVeZCI+TCk5uDvw2tJ6oCwU6lvIr44w
         bgSLzZZgi458fs+SfUQ0dqih5rUbj1qt/9QTX2bwBYWb53/ikjx+ZwcARYJG5+id6M3j
         zOf9UsXGAotxHwVSzm67WHZ63+yMGxHoTqPU/ZLxaXuyUJlG4ivTrM3gMZf+bmTvOjEQ
         ZUhSCAGiOwRsXupoQujjTg77WPd3v3wKP9XPus55sAcn7LGosD90scbIIRYqTEp0i3HL
         38dw==
X-Gm-Message-State: AOJu0Yxu/9RsoHmNa8GzXIVzwZ0GenZjdawNrQnkyGsgE6CoN00VSKM+
	/Wd5SytMH0fw3GhCgztRmaXuxYCkujmBF7FouASkFr0zeUh/yB7Qed+4Oi7XNrTMl73WMS5EKe/
	h+ukcaGIH3NyyCltJT2jaLd2ewtvn7CZC7gp4dXctXXhvT/A/ijTvQk8ooZGHfda06kxA
X-Gm-Gg: ASbGncuT1SWt1UOU9KQLCEiai2npEgFInC4Juq/0dCSRMkwBMZtuHYrJYVYS92sas5f
	hO7uoyp0+oWGrnHNIkcZZF4tQU9MNvSWj5C0Hpb53OhgtMlN6P5tXeH/mIo2nrEOx4HTKWeGDsU
	2RIVz91vg9lM65Yqbc0sKgu8GxV1Ww/GuJFRj6c6VUwLGxg8clEtA9ny9noiRlBt0KBBmTKuBN/
	0qTMfltO7fN/VAncRtnCpYAwN6THIsIXfJxUZYpEzIBx9/8+jFy4mJCSvS5dqKToBN2dFsnm7Ew
	v8L368CVZRzakgWEMeb4K3FCwE8HsGrVtmttwvsor7OgQtpZvpDGFXhSlBMbBoXxcDrqoNMjjfL
	Hh8qP+kVADc92TkMTmA5WtyhogfAvC81hAsBidhDshhX+JwJ2h66Tp2wDqg==
X-Received: by 2002:a05:6a20:d80a:b0:21f:83ae:3290 with SMTP id adf61e73a8af0-225ba5370f8mr24537713637.33.1751953174311;
        Mon, 07 Jul 2025 22:39:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaR3Zf4jeFyswPR0CteXJAtjrD1bBYM5QPstP1VOUIEAlqfyBhmGfJ3hqAyq4EsiP2imSQdQ==
X-Received: by 2002:a05:6a20:d80a:b0:21f:83ae:3290 with SMTP id adf61e73a8af0-225ba5370f8mr24537687637.33.1751953173910;
        Mon, 07 Jul 2025 22:39:33 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450db7sm10531829a12.4.2025.07.07.22.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 22:39:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Jul 2025 11:09:15 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: ipq9574: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-imem-v2-5-692eb92b228e@oss.qualcomm.com>
References: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
In-Reply-To: <20250708-imem-v2-0-692eb92b228e@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751953154; l=1206;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=VfK8mEDpXLVB6H57qiYobVaPCMl4DeUgsq+1SP8HFbU=;
 b=nMg3aNuDKdIr2q8zeAB2OvDbVWDunZRHLbepwRF19vaXxBcg4E6YNjWdr+HKoy8u2Ctcu2SNQ
 F5F/LeaUd4MBHtLgkl/GJ8cwcUG3kR9V0sUn23lhvy5fn0PyJDONuKg
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA0MyBTYWx0ZWRfX7KOTncr41aIc
 o3AGKiauvS7HJcBaWneGGqqC8zKySMIyqPzGcTKqiFBPQc7BJqSk+i0yErlkuMnYGRZ668+HB8a
 dNxk5R/3ghOQACLAE6nABS/9tMKby2h8DVzuRJ3cktlucdn0l8erHvI8aeqIijnT7r3PGNloEpn
 ESljmWBrFj2MHE34lga6KEwttGslbq4SnhizFLmFG9DhOeYAYFXZGl5KvkeSMEtZx+UELgjoVAu
 OFeVJvSX/pqs8d4uJio0+O+ueuz0UGETbJ2GSX0tEGsIMULLApReQJM13Vi9Q86e+B9DxgNvo25
 e51Dz6hBnUa5ryroziDAEQreqwSe7APPWLK4dnC5oSUvy15urdhpCQleOyNyboxZ0xhJJPMm0tU
 wD3KFi5+n06WGPoMyjPZeMRo7NliK8/vOANrHxWyv8hLC+zVfvrxbWhmRNFvsUbdJ9WxObtB
X-Proofpoint-GUID: WsBQnaq5XVJElFZ4iguyboPKIOZJASqc
X-Proofpoint-ORIG-GUID: WsBQnaq5XVJElFZ4iguyboPKIOZJASqc
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686caf17 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_01,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=806 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080043

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is 32KB but only initial 4KB is
accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- No changes
---
 arch/arm64/boot/dts/qcom/ipq9574.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 815b5f9540b80e91e81e02a97b20c0426f40b003..2a42e8a9c79274f2b983d31e0b7b587ad524b211 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -741,6 +741,15 @@ usb_0_qmpphy: phy@7d000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq9574-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x8000>;
+			ranges = <0 0x08600000 0x8000>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb3: usb@8af8800 {
 			compatible = "qcom,ipq9574-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


