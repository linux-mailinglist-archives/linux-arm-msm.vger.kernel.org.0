Return-Path: <linux-arm-msm+bounces-63358-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DA86BAF117B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 12:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 213F81C25A7E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 10:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 559BD2571DA;
	Wed,  2 Jul 2025 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fc8zhPZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA9824C68D
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Jul 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451474; cv=none; b=FvIEQtNc7CWz4eFIg5ceH62p/Rndhg6JmfswlLMwSL1Ryk0/P6a/JxBZhXiXIsOCWVzYHerH+35VUz/mWQFqrcOQeMvxQKxllchx9fhIn8MH3njFoYwJCgzyMYnWVzRH9yWFbUDFFBP6znOqoMkVg6Mkj4OLfoe+njxDA0f3+Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451474; c=relaxed/simple;
	bh=HTG5mnN62E5lVvmR9M3o5ZKUlGwP4DrQ+BOVs5noMkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhiIbxgr77f3P0UZ0v9rIJrrIngasVdBFSk5AUq6m++kQeIUWJicEo49A3IFz/d1Ioel6Cl6q2kzaH+a6QKPFZNdFS2Mlm+Yxnt7TYmdHHfCAcuuaGq++5RwFxveWU+W9gD97lSTxkzFHX6Sf5tuP7o/zkWOi+IxYBRiIFGY6GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fc8zhPZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5629ZhMP026748
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Jul 2025 10:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qop/b5pDG6wy5PweIeJVl0tyyRvgJnpZddFhEDO1zb8=; b=fc8zhPZatNCHII1u
	n81VDJmS1mrAASvOVy4nOlX5JXoBdtrk2v04GKSwsTpR/32G/yqal/h+I7bc4usV
	WiEx08lQcAK+uflmq6y497Nl15SLyJQO4+ZY3+9HzBJ7VaF2fTMYlylrOR1IiOzV
	bbuNs7QsYyOJ6oEF91gxw1clCIepWU4ZuLKmz/BWA+j7MwTj9jnW9lIlh5VtksWu
	/7eWGUt0j8dWStc0S9uWNVMXWxr+Pfk4RP0r/ltSrrCFgZkBMMdpzaLVXyuP55uA
	zpUJOjbRcGelLvgWFALtZNha9dOjU0cozjWA5nZjKdyMoIrdlMD4xRfsoMl/aplg
	W++O4w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8024327-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 10:17:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74858256d38so4192619b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Jul 2025 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451470; x=1752056270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qop/b5pDG6wy5PweIeJVl0tyyRvgJnpZddFhEDO1zb8=;
        b=RUM+tdIMEDpwGKq4naqEIQ+YNAIDjkFErVUE3lE1lHHg/rk2jydW7AxlsgLfK5EN/B
         nhzLhhAqGYD739G1uM1VKn4GfeMRM1A+xsEifDVCtT32NaoGeDtWwQUtkQd/m8SwN3dK
         m6z4lSfyRbc33yKXnjUJTWiXSCB/e1SE6A0xXBYuWjy90waFVNL2KkIy6eb0AadKdsFs
         c4qTHDc2ylJKFVd/eHeV3/dD/InysfP9RvWSc6jgMVA7lt2YSGEgFTPlnkIfqNrTTZOS
         5PB6KZlmwUXQWChLBmjFRTiXO/nzuciPGCIriplAXldN0tCuSsTp6XGqBEDPSP6myb9u
         vbzQ==
X-Gm-Message-State: AOJu0YwZ7ZxtQDI/ohlm/nbJ56jtEZHHX9wP/atYAJjTvCcq0Md1titi
	S5qWqGPcX4vGNQdiqJ4E6IgPjNteOdvCW2wCXiEjh7u1eTfgWL8zLvmuXz6SQUGJr1aps3LDMrM
	5Xecz0oh9fe6Z+nQDXO18uWNdvLOZM33sPUW02GxYcFXAWoGJNIX84hMBbiD/h+IJXoSe
X-Gm-Gg: ASbGncuGSE8XayBcqQfcGfqiUjy1lrm2UgL3b6iY1NSFrYqxLt9l0trLUtjR59H3UWZ
	2SLR0CBgYzfRql4GZdOc405Ll4CbQanBHrtvX/IQdAlU8DQ4yNxrbvnL4OT+BPBWVKW+owgiKoX
	lsA/GbLvHdMepGGZjPN1PKHpEuL3ostRjz5Fqkv3YD2egyyWpx8gLZa/1uFh1qn3wAo3l0yxQth
	KBYiCe2TCpsn8TwiTWJeRTKYeBHAXgj0uh/fv4P1vjA/Hb8uyYQUsHIVaLNdzxr+r7Wd9c76oiF
	I20ocbz/SKOJAHsImMX8FLLSJStv0VbEskTebMgvorByITCX9JB8VZI0is2Ehj6Md6EV6v9+FKg
	bznKWBd9MBsSugcvDyDyYhg/nAbAjSRSHY3ydNZryX5CkZt4dtf09P3G0/Q==
X-Received: by 2002:a05:6a00:22ca:b0:748:ff4d:b585 with SMTP id d2e1a72fcca58-74b50f683a8mr3088672b3a.19.1751451470350;
        Wed, 02 Jul 2025 03:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnytX/3KOhg2rvmEfuN3mvtRnpFknOUM5Iv99FSaxslQSVdJLuzMlQ1h9brA0rm3u6YY5ncw==
X-Received: by 2002:a05:6a00:22ca:b0:748:ff4d:b585 with SMTP id d2e1a72fcca58-74b50f683a8mr3088644b3a.19.1751451469934;
        Wed, 02 Jul 2025 03:17:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:49 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:34 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: ipq8074: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-2-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1197;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=HTG5mnN62E5lVvmR9M3o5ZKUlGwP4DrQ+BOVs5noMkg=;
 b=gZmB69MHK7JmUMfujejANSJG7lomSA8NVYOzbwUJDV7RLCErYSxNCPLb20SF8DIuqr24D4sQj
 iNrljTsnDiVChSBxRIO9pLM06GLnQekbvTj5JJvB5UGz0t3BTFQMaBS
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: Zhltv7PELqNXgZ9UFQqBy8glGxcQEvMn
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6865074f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: Zhltv7PELqNXgZ9UFQqBy8glGxcQEvMn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX1lcF6/D63EcQ
 PLqgyJG65ZIFUlG2Up3q2YJqntdGNcwCdQQ92NNMkNvn5wig6RhKyuwNRhNZb8vXs+GV1ztm6FM
 5B+kK75xZlq5QwTfjMTrj1xmAsLDtcrAAx+HtGsTE/xaXUQ0Z0GmlcgfGA4WmDUWngKu2ZkM6ay
 SpZczBVO95TCiLO8u0Ia82xoNKHofcV0ztXg1fi/IhyxpKmpdzACsNLXvtWsupNby+YMRmzcIJ3
 X3nmit5JJ9W1K074opUPa8mkj+oYLRYjCITOAZ5DcoMo4/+lYJzjvh0gEbX0CXX9jWcDop2+cHt
 C/vqvsw4yxWnZhyhM6sh8koaJULu2QzbFzN6AHHvRAiMV3TMXXw0GLRamuJ96WAUc5d2TbkMD4f
 6XZJfbg8fSu9e2Igmsx3+OLr5C3dXhvJf3Gzuc9/+fM261fVXzDLwLlDPkJ9FoNWRoYhnCaZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=712 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is approximately 24KB but only initial
4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index fffb47ec244899cf45984adbe8c4f9820bef5c5f..93dd11c394589132f3d5ecda32bcaecad2509029 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -625,6 +625,15 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq8074-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x5fff>;
+			ranges = <0 0x08600000 0x5fff>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb_0: usb@8af8800 {
 			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1


