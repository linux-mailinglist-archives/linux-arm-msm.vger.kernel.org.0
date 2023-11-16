Return-Path: <linux-arm-msm+bounces-759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2287EDB16
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 06:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7708B281000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 05:15:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23ABCA43;
	Thu, 16 Nov 2023 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aIu1lY1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0BF18D;
	Wed, 15 Nov 2023 21:14:51 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG4Msq5003860;
	Thu, 16 Nov 2023 05:14:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=v6IR2LE0IPVquiNausYUKOdAYC+XIa1DJE67GQ6war8=;
 b=aIu1lY1KyX8HeGfadwBMs5hI4CzmTeHCUN05u8sKhlbI7aW6n2DjSudM5TsGf9x7OM2W
 EgdScIBs6DRdJ9aVOZ9hPE6kJ7J3VMifhvkZegnn7JYsAOMs6z8a1stQa+u0t7Au0UFQ
 68icw/SMSnxFN/AqTRHV6uZJiG3iw04v5+9ZitX7gADxdkWoqSVCQRyuLlYH2ZW7y587
 2y7QljgrPPzHTQ7ckrL5uu/PKw8mLPz/StiGmb2C60qQZ87kwg/MfQWUeVNwNjEMa6pF
 Nmo5cMOYcLKz9Bd1i1elFmXBzsoL+2jChtVrrqizXDv4k0dnorLalLnAbvHiHSLDLSzy qQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucuac2cmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:27 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AG5EOsM004929;
	Thu, 16 Nov 2023 05:14:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ua2pkk617-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AG5ENAd004913;
	Thu, 16 Nov 2023 05:14:23 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.147.246.70])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3AG5ENsm004910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:23 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 3970568)
	id 975F4220C7; Thu, 16 Nov 2023 10:44:22 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
        geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH 1/3] arm64: defconfig: Enable GCC for SDX75
Date: Thu, 16 Nov 2023 10:43:59 +0530
Message-Id: <20231116051401.4112494-2-quic_rohiagar@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116051401.4112494-1-quic_rohiagar@quicinc.com>
References: <20231116051401.4112494-1-quic_rohiagar@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lchPbunTLg9FJjFG0pkrcyydr0Eam1VJ
X-Proofpoint-GUID: lchPbunTLg9FJjFG0pkrcyydr0Eam1VJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_02,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=399
 spamscore=0 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1011
 adultscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160038

Enable Global Clock controller framework support for
Qualcomm's SDX75 SoC.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b60aa1f89343..d1be1efa8a23 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1252,6 +1252,7 @@ CONFIG_SDM_GPUCC_845=y
 CONFIG_SDM_VIDEOCC_845=y
 CONFIG_SDM_DISPCC_845=y
 CONFIG_SDM_LPASSCC_845=m
+CONFIG_SDX_GCC_75=y
 CONFIG_SM_CAMCC_8250=m
 CONFIG_SM_DISPCC_6115=m
 CONFIG_SM_DISPCC_8250=y
-- 
2.25.1


