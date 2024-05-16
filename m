Return-Path: <linux-arm-msm+bounces-19910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D58C70A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 05:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3009A1C2129A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 03:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33EC8BFD;
	Thu, 16 May 2024 03:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AbXmAEcl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C604691;
	Thu, 16 May 2024 03:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715829895; cv=none; b=k9jfR4AtqhgvyUBepivjmXez63yekR4Q065ogLgOoy0F+2QO/CJSo7GZp71WJiGKMZ0DLPBmnyNUe5JDjkFv1lfuAbsDQ48iTFk83Y9U+AaZnmRWqiwvV4RWOBYCzFapuFqXfoS1YZpTN4PHJr76A7BTNnCxiPpcvh6BIbJHGGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715829895; c=relaxed/simple;
	bh=VyZRyzgz+lvxv+iJdutjtuoLgIvp7PmL/x2td0AAlK4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i1eAZnyVcgV+evKw4E747SaqRKBc6+Zwczh9cPeormPrYKnMA2ZZfttuOa6mLJ6IcxKbs0vi0pj5IGL3MMrSPJ/SIGwoTUVVavyPoNOcIZvicfi2cCqkOVv0Bxvs21EnTAWQGLUpBK3u5BGK9uCDACW94Gs9eunfME0do5n1pgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AbXmAEcl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G0ssrW006911;
	Thu, 16 May 2024 03:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=6F29bxT
	wNsCstBONutx5eWXtaUVwSbXLovHf+5bdANA=; b=AbXmAEclfDKpLNqxYsnt+aA
	BniRLk+Wa0ilSkchcv9qUXco3UEDlZqEFMRsaWPZfCu//zP/pTaLAFg4WyhvYCKj
	TalQzG01l9c17IaSGg/M9nQ8dHWlx7Q6QgM68J+SN0Pz8yfdsMCJGzX22ezn1PC1
	fVmDvSwi/OQ44KF+r1nElVwWZQ02tPMg+0kYFeABEuO08OwJWU89thWSmrGPQCzz
	O+37az881qFTwEzj8Ue3sCRa/hz3CnmbwUJtP07zst1B1a1hegBGWLt6E+anefKj
	hW/JXi27MNS1b4s2uDkjFCwG5xOZTRAowxfsKxMjzM7wyJtV0KO6yFlq0CKsk1g=
	=
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbcmv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:44 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44G3Ob2M032169;
	Thu, 16 May 2024 03:24:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3y4quybhju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44G3Ob04032145;
	Thu, 16 May 2024 03:24:37 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-devipriy-blr.qualcomm.com [10.131.37.37])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44G3Obvs032138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 03:24:37 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4059087)
	id 63B674199F; Thu, 16 May 2024 08:54:36 +0530 (+0530)
From: devi priya <quic_devipriy@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, dmitry.baryshkov@linaro.org,
        neil.armstrong@linaro.org, quic_msarkar@quicinc.com,
        quic_qianyu@quicinc.com, abel.vesa@linaro.org, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_devipriy@quicinc.com
Subject: [PATCH V4 2/4] phy: qcom-qmp: Add missing offsets for Qserdes PLL registers.
Date: Thu, 16 May 2024 08:54:34 +0530
Message-Id: <20240516032436.2681828-3-quic_devipriy@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
References: <20240516032436.2681828-1-quic_devipriy@quicinc.com>
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
X-Proofpoint-GUID: drXw9aa8IYgUEVFeaKxEWK6LxmoLofEQ
X-Proofpoint-ORIG-GUID: drXw9aa8IYgUEVFeaKxEWK6LxmoLofEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_01,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=850 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160022

Add missing register offsets for Qserdes PLL.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: devi priya <quic_devipriy@quicinc.com>
---
 Changes in V4:
	- Picked up the R-b tag

 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h
index ad326e301a3a..231e59364e31 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-pll.h
@@ -8,6 +8,9 @@
 
 /* QMP V2 PHY for PCIE gen3 ports - QSERDES PLL registers */
 #define QSERDES_PLL_BG_TIMER				0x00c
+#define QSERDES_PLL_SSC_EN_CENTER			0x010
+#define QSERDES_PLL_SSC_ADJ_PER1			0x014
+#define QSERDES_PLL_SSC_ADJ_PER2			0x018
 #define QSERDES_PLL_SSC_PER1				0x01c
 #define QSERDES_PLL_SSC_PER2				0x020
 #define QSERDES_PLL_SSC_STEP_SIZE1_MODE0		0x024
-- 
2.34.1


