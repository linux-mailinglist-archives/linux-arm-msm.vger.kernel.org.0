Return-Path: <linux-arm-msm+bounces-29037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D297C957CFA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 07:57:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E0551C23A31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 05:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F88148FF2;
	Tue, 20 Aug 2024 05:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Iyzrjk3x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6C514F9E2;
	Tue, 20 Aug 2024 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724133412; cv=none; b=LZRhVSdlwSrZmhWCchY1fg70x9haVQ1juQkZSuOL36/P0BMJiZkt94cSTkiAmBJdVmCNzozaEHCOpXA8Bys2pd0fy8v2MiH2d31AX8LlJyqQ4OqXABGv/7r0fa7QPVNDUc5UxNAfsEKkTQQIn1w39qREtYe7wAqT2lKCoGzuTBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724133412; c=relaxed/simple;
	bh=po+lWEfe7L9rpJU/3Spyu6NwQ7aMZUzB88lUDZBOMhY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P5oaYOdrtc7dJm9+AHf/Z/4YAhAXUosdsyImZRcgbitaVwBivTXpKYhh04Nmp+tGvzPMOKJ1QGLsna+og+871dAbRjKhf29k2/giYygXGatS6lQdNHmnSsII2JMfl3U0rRCvNUcyd4010acN5p8L5i94jQRAQGObGD2CpfqhkAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Iyzrjk3x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K2C1MJ011674;
	Tue, 20 Aug 2024 05:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uHfGIAVVDeedu16VfQnJAJ3+hkda0amoTZ1nWFEfBWc=; b=Iyzrjk3xMQ6GY+xW
	B5A/eCuzd6JJd5amvjCNp7gZq+poNfrGD3Q2zH92wqM5t7MINyp34Ri8a00sAAct
	Mxbx1Qg7YNxJ+2/0/LZXvn4W+eFBTwYNOIIzHju4Wlv7+mr+2H6a//LGVvS7ox2k
	CJtdKt+VEO/iU8wOeo8I2pBg+Cw1BpVhZOyvrr1YM+1NbqerW0K/5FWTQOfrP2h6
	Y5MFyzy7lUmUrHQIJbWL16P7hjo2iagB30F+l6UqdOeFm7gamXBnHS+1HrK+UIf6
	MdxIdDvhOBD9yIPY/1zfbKEmuMoSY59IWenTMYJNxcZXUXDuFS3Z4dt+6VVJKD2n
	EAt7eQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414j570ejs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 05:56:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K5ujuo022771
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 05:56:46 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 22:56:42 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <sboyd@kernel.org>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH V7 3/5] dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
Date: Tue, 20 Aug 2024 11:26:16 +0530
Message-ID: <20240820055618.267554-4-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
References: <20240820055618.267554-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: omUlLxL_wPU_THkZcuQc-FBsYzu8vk55
X-Proofpoint-GUID: omUlLxL_wPU_THkZcuQc-FBsYzu8vk55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200044

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Q6 firmware takes care of bringup clocks, so remove them.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
Changes in v7:
	- No changes.
	- Rebased on top of linux-next.

Changes in v6:
	- No changes.

Changes in v5:
	- No changes.

Changes in v4:
	- Pick up R-b tag

Changes in v3:
	- Rebased on linux-next

 include/dt-bindings/clock/qcom,ipq5332-gcc.h | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/include/dt-bindings/clock/qcom,ipq5332-gcc.h b/include/dt-bindings/clock/qcom,ipq5332-gcc.h
index 8a405a0a96d0..da9b507c30bf 100644
--- a/include/dt-bindings/clock/qcom,ipq5332-gcc.h
+++ b/include/dt-bindings/clock/qcom,ipq5332-gcc.h
@@ -96,15 +96,7 @@
 #define GCC_PCNOC_BFDCD_CLK_SRC				87
 #define GCC_PCNOC_LPASS_CLK				88
 #define GCC_PRNG_AHB_CLK				89
-#define GCC_Q6_AHB_CLK					90
-#define GCC_Q6_AHB_S_CLK				91
-#define GCC_Q6_AXIM_CLK					92
 #define GCC_Q6_AXIM_CLK_SRC				93
-#define GCC_Q6_AXIS_CLK					94
-#define GCC_Q6_TSCTR_1TO2_CLK				95
-#define GCC_Q6SS_ATBM_CLK				96
-#define GCC_Q6SS_PCLKDBG_CLK				97
-#define GCC_Q6SS_TRIG_CLK				98
 #define GCC_QDSS_AT_CLK					99
 #define GCC_QDSS_AT_CLK_SRC				100
 #define GCC_QDSS_CFG_AHB_CLK				101
@@ -134,7 +126,6 @@
 #define GCC_SNOC_PCIE3_2LANE_S_CLK			125
 #define GCC_SNOC_USB_CLK				126
 #define GCC_SYS_NOC_AT_CLK				127
-#define GCC_SYS_NOC_WCSS_AHB_CLK			128
 #define GCC_SYSTEM_NOC_BFDCD_CLK_SRC			129
 #define GCC_UNIPHY0_AHB_CLK				130
 #define GCC_UNIPHY0_SYS_CLK				131
@@ -155,17 +146,6 @@
 #define GCC_USB0_PIPE_CLK				146
 #define GCC_USB0_SLEEP_CLK				147
 #define GCC_WCSS_AHB_CLK_SRC				148
-#define GCC_WCSS_AXIM_CLK				149
-#define GCC_WCSS_AXIS_CLK				150
-#define GCC_WCSS_DBG_IFC_APB_BDG_CLK			151
-#define GCC_WCSS_DBG_IFC_APB_CLK			152
-#define GCC_WCSS_DBG_IFC_ATB_BDG_CLK			153
-#define GCC_WCSS_DBG_IFC_ATB_CLK			154
-#define GCC_WCSS_DBG_IFC_NTS_BDG_CLK			155
-#define GCC_WCSS_DBG_IFC_NTS_CLK			156
-#define GCC_WCSS_ECAHB_CLK				157
-#define GCC_WCSS_MST_ASYNC_BDG_CLK			158
-#define GCC_WCSS_SLV_ASYNC_BDG_CLK			159
 #define GCC_XO_CLK					160
 #define GCC_XO_CLK_SRC					161
 #define GCC_XO_DIV4_CLK					162
-- 
2.34.1


