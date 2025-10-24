Return-Path: <linux-arm-msm+bounces-78745-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14979C06E7E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 17:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A1AF1C0831F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 15:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D684325498;
	Fri, 24 Oct 2025 15:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7f4EIpg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DDD326D6C
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761318943; cv=none; b=WVHixrQwvZSM6BVJuI1afrQDjlzNy5nGR1biZug/1ypXkPSwhm3iyXoKDNcfFrTSCgj5F+zzDdJF54uTMPPrqc8gb/8DvISuklVx2JrXgItiCQihRb2Cu7QHC3EWPKqQV40pndjwmEnTgQsWJh/KMznjSbkTBGBsNWi6FEva4lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761318943; c=relaxed/simple;
	bh=5o5hDOxA4Yp8K49Lg3lxh6UkxH6v40/Ib24lPYIdsmY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JFFT0T2MWeL2q3DE9Z6QMhTOQkOBaGglXOSUw03Ll2FdEViDLTk6zOLMMMRQYJDDT6PgB+L53XPz0Acq7EFhcxQodxVGHKO2j7DOdBww4tlvylTody5/PmD8ObimvHfGmcwuF9EBlj+VuA9K0xu3suuQ8oFKzzF+6zSLDvS1/pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X7f4EIpg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCLW3o021578
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DULY3y5QWFb
	buzttMloR/r7jjQtgaUlnw+flRU8/TqU=; b=X7f4EIpgac1W0emtFVkGZ6yKtWa
	GxvukXZJRD3g9kHZSutDAshXCKuDNLCHhi5l98qsRJfd6AcQ8UUVXBXWpvx9AU1I
	bZc+LrYRnQTwVnP1Koko+Wcq3pQ/xnw7fHR/ayZgjuR584Hzj301mO7AiG52HQXU
	gVcUAw1i7X3YJ/or6zE4ENb/OfdRSoy0SAwQ4usbJtWBviDR+iPfqGSHlDM1kcUu
	EhCOLXecair/YSlABLiBHkdkXWwL4wZN67ySXfU+BVsrXRlVSHZFrrScRsXuFi+l
	HR8iwQqWhOnzkQDrX+leEYuYTTGsvDe+NittUMBjNL8xGhRplnK+hrn5VNg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w8cd6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 15:15:40 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290b13e3ac0so18995995ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 08:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761318939; x=1761923739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DULY3y5QWFbbuzttMloR/r7jjQtgaUlnw+flRU8/TqU=;
        b=mSOqpvtdm1VAwp4CPBLnmhf0YgLmV0YiouLAMS/N6I4nOfPwUhmuWC8EF8wYnoMqkR
         xIbj3XHGfeajjdViTP5634+G2UTPZyvptF7IiZU48x+Ve8/RMg7M+BbLaOuXBjoKlRRb
         f1xg9Ev0l2KcLx7m+DVQ+mNz2nFP3sJCkhP/oOmTdf7bkcKqe2ueEaKbFDOaV5gA2C7R
         xQKnjZU2B8x+CSolXxvl1n1TIyLQtI2/NvTPlvpgibQJbw4Q0VTxtWYHrv30v4KQgCmK
         Z0f72qdll4ULTvk/NjtwWTAtyjLLVNacEWANCrctNvDlzGCkav1Q3PDRk07o3WX9S0Ci
         jcdQ==
X-Gm-Message-State: AOJu0YyTfVuaTbV60dgv++wurVJGDe1tEEs687RU+BzKX+gs5Y3BaODP
	SmED9fOn20yHXiuU6eAixSczi1Ou4pC8d+m5/BtxUhCkctKuKdGouMFUzXI2nNyXQeZiTVDW9oe
	MQaDgYeKDQT1aR509RbHWoPsA9ECjM3X7I0pKEMQDA/A7DFDe8BK+zATFOlz5Rl5tcFeK
X-Gm-Gg: ASbGncs/iHs6UBE7o7J43nWHKaDJ1NFlHvLuUgrj9H0wQ5HVIogrGQm0cPHYazAWlvE
	UGILmBQNq5Gci/tqbuYwE0Y/uwyfv7J2SITKf7WOVQLSgiSBe8oy0Hx3xe6gU8Q/FT3SWqOret2
	hv+2Mpb25sZs19xKLjtZuznXHWY0mgTCFbL6RMyNXgdq6pGzrj6SEsk0p/mw/MrXBBQhYdhmW0L
	Gw2wJ3QJVP2jMyemwkw5i8SZscwMXcHiSpuan/JDgHS5el2ytQHnbQvQJSNeferwlG8Z8GOsdCa
	cN9c+gAnM9i886IreIp4Jmru8Fc1sd23D6oWRgF39FyLcSX3p+TMHPu8r31nxOf/PFT0ybp79+j
	GNKqYBxIF2YJ2HSLmp1SWJZ1PzuqhY+mcrscx
X-Received: by 2002:a17:902:c412:b0:24b:25f:5f81 with SMTP id d9443c01a7336-2948b9758e0mr35477015ad.17.1761318939235;
        Fri, 24 Oct 2025 08:15:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOhhLeRPIpbvSGbAb8PXAfIp8vVVRLOl1brxlt9G+sp70FlC7RwLctSAzSv96eTW2RqVZ0Nw==
X-Received: by 2002:a17:902:c412:b0:24b:25f:5f81 with SMTP id d9443c01a7336-2948b9758e0mr35476525ad.17.1761318938766;
        Fri, 24 Oct 2025 08:15:38 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946ddddc34sm58758885ad.20.2025.10.24.08.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 08:15:38 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v9 2/3] arm64: dts: qcom: sm8750: Add USB support for SM8750 MTP platform
Date: Fri, 24 Oct 2025 20:45:20 +0530
Message-Id: <20251024151521.2365845-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
References: <20251024151521.2365845-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX71TdoJ3FHEA5
 2T30l4BpuYzKq+BEd+KuHpk+fbUkpzvPyngZmPlTUTfv7iRpn3c2Kvke9lrKlAne8C8zA+l0keR
 qjRyYQl5L+pgZK8j7IN2EizXeI6+2DMSf7vO41XkP3Gxogni+40gkhSGK7ROzNa4gkF4sCFV2oC
 wqAL855z0/Nu7ZhmBQUoKBieHhhWhGGSyob6YNnGLGy744R+8Xz7Oa4S7wmv06wky9RGnWyayZ9
 KnwXYWQtM4dRiIITz59U8J2qs8CoIvrsx0jJIEDBAdHEPaIyj0lz9CqdA4szb0jYUPR86NR+X5p
 Quvr2JJE3ujaNt40pk877dLkzA2HHFhisyAJIKua+6JVK/SqC3USkWKY9lUW3G1hNRBxe2Ms7f8
 bHS8HAhwSc539NBA8bHtQG1PdRDA1Q==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68fb981c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Tsvuh88POXG944tnl6EA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: emWjvqa_XZn4TbR_K2G9Nk_iEKVX0-JK
X-Proofpoint-ORIG-GUID: emWjvqa_XZn4TbR_K2G9Nk_iEKVX0-JK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
[Konrad: Provided diff to flatten USB node on MTP]
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3bbb53b7c71f..1b526d96fba8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1200,3 +1200,25 @@ &ufs_mem_hc {
 
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


