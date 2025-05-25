Return-Path: <linux-arm-msm+bounces-59319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CC4AC334C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 10:57:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 195B03B36A5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 08:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 115451EF0BB;
	Sun, 25 May 2025 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frTaDuli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FD31C8639
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163380; cv=none; b=KNtGKor8w7siahaBly6rbJjAmIv3Ve2KeI4pgqDYdreSwfF0uoP1nUd3MHIR00oPbb/WAjOjMFCmos0jl3rbmAH/dPPvBMlL3YD7rNDmvdSlItRkuE8cdiAG/7zDgBRyIH3h4qzNPk0TJwX288dsYw2p3aH5z11Qsd9vE/bwEsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163380; c=relaxed/simple;
	bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=caDFoX6jBUb8H5utPgQ4oau9xMqMIFPPmvSHyWDctzKIDapEhHnOtl0Q4Vj/o6KO5YIM3PCitJcaxb6lNCR+88iXbH8AE7dFl+WZW02lkJqZpkLPfxldUWcv4XCTLqs2j1vzFzCLR1l1o6HrPFwTI5SxMQV2YxBbD1qLzIBGHko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frTaDuli; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P1ejcc026260
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=; b=frTaDuliW9pFQz5/
	YC38OKTFrqQFottZhTMeMEeQrBNt0Ulk6KPT9Qao4D3cAe1m8s7W4o3jdTLciE1K
	rMBPj8gWlaa9UeipWlPtnKRZrw1FZ/H6qj8jKDfD5ELWKIRVhCCHmCb3tND5YX8J
	E47KrvACVlJ9c+dYRNDyrPK2OU5MzI0Ij1cAlOqaUfgFvE+3BCShWIHpZ2tq5xqe
	X9EH4bZ6oqKBRj7Jw/tzZiveEBdTQS3S3c6y344xsOJyek6LsTV3gliKFoVmEcwl
	oWp+jjkvixX55RuH6KLzExD5mF89pVcB2sLlbT0Wel9V7dbsfBdHrWDTXMq3vs+Q
	0ftqwQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p1pke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:16 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2344476c9f9so2592625ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 01:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163375; x=1748768175;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5YbBsH4zeCrmK/Ek4rH6YPASrY2/sAhfKu9QU9dC1zs=;
        b=DNafoF/CgD3sz+ddSd2hMg05zUoI7hKpqf3//QgJ84XpoB0cy1g7XqBwiKbLyVi0YF
         FGp9IwAiypvhEnc7XUVI+zNfbLys9NQUJVCrJt3IlWbWFbEVyRiMTXhIr22YOeo3qKX5
         JPcl1KCw7P/NV1amceQQtyXlr4oe1XWja2j1EDp/QE2rizaFfFjWJdgrUo3V/3RI1wWx
         HM5is3Vy/Sor/IlCNbvt5WuBa0WSJqhJvd7T9bCBuRfT3GShxZptgTiMak7p6hdr+DpG
         SK3D313r4knvepjBlPF4WLyxBAFaUCtZoLDh44CjLr1Mmp1tczcxaM3JZgN8kaA2F9ZR
         Ga2w==
X-Gm-Message-State: AOJu0YwsX0OXuKqUMnsXflbWyw7B5U5jN32aW5/Qj9Mt1jRK7+PSX1qc
	6FSyEYqaB6cdze+yiGh6sRj9GgJKIu+n8/t/wCXARfzIIt20B2iXoSPxTiSpEgiNMnqjwmYe0qr
	cYE01Hok+egI2M2vUB5PDvLM3PpgZ4WnWJ35Tn6P9UNT6Dlqn3RKa3kKKnKvmsUCR0afm
X-Gm-Gg: ASbGnctTBOYaAeqvcly6GYd3RNszxn4bGOXguGS17TXAl+SkZIcqwTci4q66HgOm71t
	lXv/0o3AWKqASbLD5Bvl0/uAX9uKMwqv606v5dJVIzEAymxYBxG4BXcxeVtnN8zy6FcXedT1iUl
	7A58tNeZjmTDvLb8URBc1qtgZO/JBBgG8iDA3lMM+2whCAeQvW55OasR8y7I6CBK+jb+fxj6rbg
	gDHA+4O5Oy0qRWgoAcs2uOHvIWcTSGG6G6hqX8fRXAHADLLW0+7eBFNJmnEeVtWMLhCriOHIHuV
	4IU9sBcEQ+ZeG1lR0bMBD2u2lg==
X-Received: by 2002:a17:903:3a86:b0:22e:491b:20d5 with SMTP id d9443c01a7336-23414e3b515mr81384165ad.26.1748163374563;
        Sun, 25 May 2025 01:56:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGz5i9KkFKiGLBVFi1nTJLPMlZymSsCYwnstYCW3DdUOQw+MT5Qgnws3vyUZpvuuMIc5SBZKg==
X-Received: by 2002:a17:903:3a86:b0:22e:491b:20d5 with SMTP id d9443c01a7336-23414e3b515mr81383865ad.26.1748163374174;
        Sun, 25 May 2025 01:56:14 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:13 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Sun, 25 May 2025 14:25:59 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add QMP handle for qcom_stats
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ddr_stats_-v3-3-49a3c1e42db7@oss.qualcomm.com>
References: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
In-Reply-To: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=2423;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=vNy7Hg/TiGtEZictJW89jX/dHyDjn42M2TrCGJb8CAM=;
 b=vfnJcFVH+Tg5NcLHWExEPQ9qovSf2ZuLYUvr5WZ9K1wk6d4Ap2SZ2hbKdlrF/S1cDzOflNv/5
 PVVVQBcbsivDqMJGDq7xdAzDsg4MxIkvc8dC6CmsFpu5ED0SQQmSflq
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 6Zsx1Htgij1JpKKlpflZ7tVzxLLQRxN1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfX9koPK+hdBDRf
 az2Q11wlet6x/cab0FlekjBjPOz44fS3aiTMF2gt5sjhm3rL6p4M8Zjtd9k03pIa/nUiT8lTHUQ
 cKOhxLTacTKwZJElpGgGTfwb5n5ZwtMX0egJC5uIJgiWHRNMtbVdcF+bFq8EcRHIuxxAvTwyKQD
 l7xT/LDULao3Jl+egdYCWjbzff5Qv9xXqpe7Z8jLfDF6DZr2E0ES91jm2eKsKSHzFK2jDgSEo/v
 bTO75vuUIScekXCYZ/PcnFah7HcFE5jjObSMXAqXdhyenusXOErrpw/P9mLl4Lk8kx9YT67Ot4T
 UQBCUpGCERl4QU6+oYkMVo0wcq3OrIklPMFQbE1v8dY/yDTBfUBXx/dZL6N26a/m7vMUPXLeZSe
 jfWgBhTLNAPwCRBsbqZVZZGl/sQ1tnVmggRVUjNY71ow38wUSkhscEmVb36B67dwdK35+aOB
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6832db30 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=GL-xn7CBy2CN3rfaf34A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6Zsx1Htgij1JpKKlpflZ7tVzxLLQRxN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=684 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250081

Add QMP handle which is used to send QMP command to always on processor
to populate DDR stats. Add QMP handle for SM8450/SM8550/SM8650/SM8750.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 1 +
 4 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 54c6d0fdb2afa51084c510eddc341d6087189611..33574ad706b915136546c7f92c7cd0b8a0d62b7e 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -3739,6 +3739,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 82cabf777cd2c1dc87457aeede913873e7322ec2..e8371a90b9b98fbc12a429def8f6246c6418540a 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3943,6 +3943,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index c2937f7217943c4ca91a91eadc8259b2d6a01372..875b5a89d2555f258665c881ee3d96965b6d7a6a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5725,6 +5725,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0 0x0c3f0000 0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 149d2ed17641a085d510f3a8eab5a96304787f0c..4c54ed84e2d1ec836438448e2a02b6fe028f4c24 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -2490,6 +2490,7 @@ aoss_qmp: power-management@c300000 {
 		sram@c3f0000 {
 			compatible = "qcom,rpmh-stats";
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
+			qcom,qmp = <&aoss_qmp>;
 		};
 
 		spmi_bus: spmi@c400000 {

-- 
2.34.1


