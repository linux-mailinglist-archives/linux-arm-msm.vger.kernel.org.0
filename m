Return-Path: <linux-arm-msm+bounces-428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D30087E7A9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 10:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EF901C20CA2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Nov 2023 09:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A83D6111A3;
	Fri, 10 Nov 2023 09:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bW8hpRsF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13313111A0;
	Fri, 10 Nov 2023 09:20:38 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A95642BE12;
	Fri, 10 Nov 2023 01:20:36 -0800 (PST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA7gTiV017293;
	Fri, 10 Nov 2023 09:20:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=CBpYoJ9pFwbJc4VqPtwB4L2a2/v2TJiu8CiitPYitxk=;
 b=bW8hpRsFb4kk9zFpUYqmH6oMhshMZ+TEdezd7JCivrxFNG5lRVcgAeFgQz98uuCNxsuZ
 nlyViTqBP6ToEnDvygMZFQYnDl+4eHGtNOazHKhdj3ToXBovBY+066H1ipMbtgIrf5iX
 +T4tZhWbO9P0+MATDmIF/BLfUVGow4TJ8V3FhHMukJ/ulyE4vEvRIFxzgR8i43zWdkee
 kR7jJVTWBotvyMg2B8pcEVx4GN+WMUjqndZelR5TVfNz7+8aqNR4kIKVgOy+HnhSO+mY
 FKbydTiTCBODTp00X8MHGTGZi2inMN6v62HzuXblDrBxfajMy4n7/hfFpYtyQvGU8mvx qg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93rbsr5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 09:20:33 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA9KWhE010893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 09:20:32 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 01:20:24 -0800
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <mathieu.poirier@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <quic_eberman@quicinc.com>, <quic_gurus@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <quic_mmanikan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_sjaganat@quicinc.com>,
        <quic_kathirav@quicinc.com>, <quic_anusha@quicinc.com>,
        <quic_varada@quicinc.com>
Subject: [PATCH v6 04/11] dt-bindings: clock: qcom: gcc-ipq5332: remove q6 bring up clock macros
Date: Fri, 10 Nov 2023 14:49:32 +0530
Message-ID: <20231110091939.3025413-5-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231110091939.3025413-1-quic_mmanikan@quicinc.com>
References: <20231110091939.3025413-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 852-JHAv3lCY-wEWNvnZK_U95No8dagu
X-Proofpoint-ORIG-GUID: 852-JHAv3lCY-wEWNvnZK_U95No8dagu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_05,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100075

In multipd model Q6 firmware takes care of bringup clocks,
so remove them.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
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


