Return-Path: <linux-arm-msm+bounces-78291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FB5BFAF43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48717562229
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F78311588;
	Wed, 22 Oct 2025 08:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UkARakR8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0276E30DEB4
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761122478; cv=none; b=YtswN0Pqa/TehVaGPC34C6u4u9uiuQjuFoNzsAhQV9I1JhspMkQHdABjTQ4ON+jbeWX2ByaX5Mk7Zi8wVcaaklqVWC/divaEh7e3uLThCN2XrpNlSKjMqfpmAkboE6mK+XJcyHILtbup1gAOAhpXqAx3SFJLIw7Qak6eC++trfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761122478; c=relaxed/simple;
	bh=2JxH3SAb5I5RjNeUkzq/LydH+ScowPF8cKoijPFvtTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t67il+JvAqyQQrANw2bSse8W5MZxrp1JchT7zqnB1TOiTJN7mej0elymNCo7UfaBjTUekm4/N/diZP8LofjqFm+rz7AILjrzzviE7Cg+bgYDSiHh5mMdmVfPlIVD8wnYp/GpXvMggPxZnxg/GexuTBptA/7aKNd/rN4eaESDN6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UkARakR8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M3JQpG027617
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IuNGrA3HI88
	okECNz5zskMA9+Az9f8glbFMv0KeN/Q8=; b=UkARakR8tLWgecWTopmsXfRqyOU
	AcRX/Ii9pn4SZ9LUbavx/4lNSMV84T3jZbxGGaErt1JMZ4UlZnLekxqGb6oP/8Vd
	960c4V/ccXkkAc3/M86tAZHklAvNlCz11e0M0Rxxtk4eCmS1GGq5V7CmdEShkExL
	pJ9y75Q3DcMRYoOs4x2Dcs8hvyVSpra4SFbyVpgvPXbs+TrcQfbiXVosHN1DFYJf
	gCw+5MLZXcttb12pqgELkjbSygfl4Idc8WRIzQut3KbNYQr6l9u6t+ki437shSK6
	W4vxlFFgsl7jess4TFtauGElCrEDxL8I6rb+AEE5DbFHw9ONap+lShzhryQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j3wg3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:41:16 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2eb787f2so5857300b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761122475; x=1761727275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuNGrA3HI88okECNz5zskMA9+Az9f8glbFMv0KeN/Q8=;
        b=vQc/sr3Q7mZAlzHpSI5msIOireDIxmzZJoZdwmT+l/QYCWFNbLBWRfo/0RqvVhXyjc
         rhp8d0HNUsxpJ0oj0hKCXZ3/wwAWyZP4kj13ivFA4yxP7l3kUf7vBRpZpGAketdlBQ3e
         I4RP4iXxxN+BajY+kzfmZ21FYmKT03IxyKDkbIDLdgoOc9a+vWvlt3pVTSFpoxQB0HgE
         q/3TTa9UCauXVN1ZdU5gsSzR2iDiTGnfjtfme9c5opKD3yVXbf0KB8t05bs87DnhCXkg
         0ZJ8QIR52UbibP62wBKtuCnjsRhxO3MT1rn3cRXjmr9FVlGecyi4ax8NRPHNlJlgsJpX
         jzUg==
X-Gm-Message-State: AOJu0Yw94ZzVVwMTI+JadR2QqR/W0y/kzCklSsUOBLLyDqt4YXhNeCLP
	isEaTMg4mkmm8cWIZ1n+SWk4LBXdkluc2FjLOZZQ/hYwdkE+SlHKAHOzYv5srF4Q6bdLQSYx/E0
	GXSdyIR2cuw3i0sgQQCOMootxagV7eg4OZ/hhFqobqF9JWgCVL/BfOqebWYoBYE0b5IBx
X-Gm-Gg: ASbGnctBsJh4iGrFmqM2B4imbVG97DkgzNCtHHNdoiVk8Oha/X25Aw41TOfVZh+PnZD
	siCvCFXS03c0yxk6ELzfg02GuK3hPgaFFWFxZhYfHJ9saknqWDT3lzmweTq7BfP7JUQxKJx7a21
	5lktZsOyaAn+MMB/4A8yIjakWG802+I4epjpe4/Crf7gzBAZ82T1gNNNwkZ377qtMxmrvty1NCY
	dKxNYZ/Ic2KC7VZ78rVvPj8h5NxrhG4XLzDQ03xzKB7lS17UDnE6rPEhkQWToSpxBuFdrENYwpA
	ANRH+mJnmCwSPzbVUeqnIxP+OFdQRnIG4jZukbA34of+ltjfYcI16ZRd7di1/12bNaFPbphCxC1
	OJCefwjsWCycGUE403D0iUl1uEJBaiKXkf3M9
X-Received: by 2002:a05:6a00:194b:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a220a3c2afmr23140931b3a.11.1761122474859;
        Wed, 22 Oct 2025 01:41:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnN1IY8wPgEpyEoCxS69d9eQBE5ErlRJaTLWYhusdXNBpDrH+C0lMN/8Q1OGqBvJrvECdv0A==
X-Received: by 2002:a05:6a00:194b:b0:77f:2978:30b0 with SMTP id d2e1a72fcca58-7a220a3c2afmr23140899b3a.11.1761122474409;
        Wed, 22 Oct 2025 01:41:14 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a25e9be9f3sm3740317b3a.71.2025.10.22.01.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 01:41:14 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v8 3/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 QRD platform
Date: Wed, 22 Oct 2025 14:10:52 +0530
Message-Id: <20251022084052.218043-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
References: <20251022084052.218043-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX6zlmXfY5ectR
 lU9T5M5ls2Xzyy7IdSMJR/Ce9drm4y7nNKdNvEghvVR8rRlcnYZAhgHpqknDxE5+Dv1CgQftbsd
 nSjQ1K9IYyqVgpoZt1UQSsYN89IWQDVPI+YHuXYYOqy09cj/yThIfhFtElVnRQxZbdzCNGQBOQO
 gGjhYWsU7vGJaq0Oism+ufMR1M1HdwkdHQCflpFUtn14Hl5gYQ13vb/akM7xpcC1zkG+LArHmxV
 HVnvd7Aahwskh2eIEBr6DPvzKyAfHJV3+We0NKIfuEKGXxa9/HHUAJIO6CFPflcS1WG9KK8S40g
 rfU3oenezUemIDqJEE61qrH6N8eGsYLZ6Dwsy5Y0dOWmZXVvBtXbEDSOzjonv+HX4nFTtIa8/Ff
 iEqnk2hs5cbl+BURmVimxGPmSiEbsg==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f898ac cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EoOMd-xwxZjzz6zYUw0A:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 09PtBlYCu2jJWY501TqwgY0U8sJu7oFP
X-Proofpoint-ORIG-GUID: 09PtBlYCu2jJWY501TqwgY0U8sJu7oFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[Krishna: Flattened usb node QRD DTS]
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 13c7b9664c89..fc5d12bb41a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1054,3 +1054,25 @@ &ufs_mem_hc {
 
 	status = "okay";
 };
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};
-- 
2.34.1


