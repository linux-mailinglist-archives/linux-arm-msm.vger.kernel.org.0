Return-Path: <linux-arm-msm+bounces-756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAAE7EDB12
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 06:15:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C97BB20A48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 05:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7053C2EB;
	Thu, 16 Nov 2023 05:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dchn7Iyv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4394E192;
	Wed, 15 Nov 2023 21:14:52 -0800 (PST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AG3rSFE004191;
	Thu, 16 Nov 2023 05:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=KhYpnHzh8rUsl/XexRSuw+ZIDvCdUD5HHSytk4a20dk=;
 b=dchn7IyvuseFQCZX3AyWOKPXreCwYxFJ3fWT4mLT9fTdVrP4mmDEfgNlZWcg886RPJ05
 rjTDyXwBodUSou9Ir7eoDMKAI3WDthErRVknAjKeQwWMQbBnjeQl7eCFWDWJCDWX0BYD
 IuiglMfDdUMln7s1N/v+lsgdn24TKb8I7faFwZEz4/Q4SDjJuCMLk8vxyefNgxjrJRKl
 Pfnpo8SZg+Y4sdBVTPIX6zMrSSGczSFQdrSNGq4dT/7+aboo96svR+uGMN4UtP7VeUq5
 CeQgf9jO2bagtuycDgY+/3ZOgGePxMx23k+lVP8+KhyHE+XJEkgJVlaRT5fZdWh4TOXK ZA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ucubsabdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:28 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3AG5EOU1004943;
	Thu, 16 Nov 2023 05:14:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3ua2pkk61e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:24 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AG5EOZZ004931;
	Thu, 16 Nov 2023 05:14:24 GMT
Received: from hu-devc-hyd-u20-c-new.qualcomm.com (hu-rohiagar-hyd.qualcomm.com [10.147.246.70])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3AG5ENAO004924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 05:14:24 +0000
Received: by hu-devc-hyd-u20-c-new.qualcomm.com (Postfix, from userid 3970568)
	id F2934220C9; Thu, 16 Nov 2023 10:44:22 +0530 (+0530)
From: Rohit Agarwal <quic_rohiagar@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org, quic_bjorande@quicinc.com,
        geert+renesas@glider.be, konrad.dybcio@linaro.org, arnd@arndb.de,
        krzysztof.kozlowski@linaro.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        m.szyprowski@samsung.com, u-kumar1@ti.com, peng.fan@nxp.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@quicinc.com,
        Rohit Agarwal <quic_rohiagar@quicinc.com>
Subject: [PATCH 2/3] arm64: defconfig: Enable pinctrl for SDX75
Date: Thu, 16 Nov 2023 10:44:00 +0530
Message-Id: <20231116051401.4112494-3-quic_rohiagar@quicinc.com>
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
X-Proofpoint-ORIG-GUID: l18aB18NL9VItLx3RIfT0ZZb8Vg6W7iT
X-Proofpoint-GUID: l18aB18NL9VItLx3RIfT0ZZb8Vg6W7iT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_02,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 malwarescore=0 mlxscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 mlxlogscore=397 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311160038

Enable the pinctrl framework support for Qualcomm's
SDX75 SoC.

Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d1be1efa8a23..eeb2ab3a7dec 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -599,6 +599,7 @@ CONFIG_PINCTRL_SC8280XP=y
 CONFIG_PINCTRL_SDM660=y
 CONFIG_PINCTRL_SDM670=y
 CONFIG_PINCTRL_SDM845=y
+CONFIG_PINCTRL_SDX75=y
 CONFIG_PINCTRL_SM6115=y
 CONFIG_PINCTRL_SM6115_LPASS_LPI=m
 CONFIG_PINCTRL_SM6125=y
-- 
2.25.1


