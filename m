Return-Path: <linux-arm-msm+bounces-35359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F759A9C01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:07:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 987321F228B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:07:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691BE155CAC;
	Tue, 22 Oct 2024 08:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="LhxOZEGm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD57B1547E7;
	Tue, 22 Oct 2024 08:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729584425; cv=none; b=kRvok6Hc+OhHI4+NyWDtSdqGoV48Ol9bzHdqUFjGbMv2QMQkYqV+UsGSakhYh0LkuM4usnlGnCMf0PjOAM2+lTBtMDGESOutK1Iy408lxmGAfhagbiCRuamGuHNTjur/qdOOb7WmER2FTro3jeYMXZLp3lirt7cldg+m4o/Aa88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729584425; c=relaxed/simple;
	bh=F7MLePvL1qCw6f4g3rS+6F1gSdyESvdPdiRG/LKhQhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=h5z+nRNhjJ0nUia+tgB3UMY9Sm3vNkZYoWNXPohSlo3m4xWhz65OCko/uaUxMmL94WypnkcZaI9sZ6cp9A1o280G775EPGckJZhVPWzuOJuzqcwVCpEuDt0OgVmY+4dptkrt+So7XEBJLZjsYSE3u71uB+9MsB1Wl6hd/elPHX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=LhxOZEGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LJbVUO015286;
	Tue, 22 Oct 2024 08:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uMMy1pnrV0xuPaULdnVUoy
	t7vzFFnB9WKOXItomSSRo=; b=LhxOZEGmj0RS3ObSPoyKLxlL0mvg5IBap5c2vp
	Wjnsuey37iRe4w4QDMSrNHYfN3GKVr0jfdPt7Yfa/QolkegBC+FqR6FRGwV3O7Qy
	fTMT2Rko9OME4NzB4XjolMSC7VUOV1GH5r9xt8golpRMTDoJAomoBh9OBLoYPWg0
	NCDGlnGXEZCzsstbg1ZwXAARUI8T2SPYXsIGCikM2K5q19DH1cfa2X3SXchJCffB
	3zMGONTXDB824WmGqy2RVItn8OJu5br9pc0EN1nfEw2QpyfBi6eRxWHAroYnzmAc
	TqZlQK56D9sRdyqMjahmAy+hws0ZjYsS6TVcuDyXyWVXpiug==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6vuyg5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:06:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49M86qNU011728
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 08:06:52 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 01:06:48 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Tue, 22 Oct 2024 13:36:38 +0530
Subject: [PATCH] arm64: defconfig: Enable sa8775p clock controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAA1dF2cC/y2OQW7DIBBFr2Kx7lSAwRCrqnqPKrLwMCQoxnbBt
 SpFuXtp3OX7i//enRXKkQrrmzvLtMcSl7mCeGkYXt18IYi+MpNcKsGlBE8BlznEy1CcNUavA04
 L3oY6bnmZJsoFWs45acV1x0dWn9ZMIf48LZ/ngzN9fVfZdoxsdIUAl5Ti1jddO7Yh8NafhCMbr
 NGBrFEGjRVOSxGMRU/C/F0nKsU9K/vm7YgUAv7TICXYFWQqNHtY3YZXKrBr4KDcKQjjsbOt+6g
 pGGd8rQHv7Px4/AKJ0/aJFgEAAA==
X-Change-ID: 20241022-defconfig_sa8775p_clock_controllers-3000e540560b
To: Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-arm-msm@vger.kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jBjUGHgfJsercJBLofCR3wWw0z7yHuQ6
X-Proofpoint-GUID: jBjUGHgfJsercJBLofCR3wWw0z7yHuQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=594 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410220051

Enable the SA8775P video, camera and display clock controllers to enable
the video, camera and display functionalities on Qualcomm QCS9100.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 36b33b9f17042128f5bef96f58667b5807b712c2..6197934b38e08b7294ec897e451af6e96fd63cda 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1324,10 +1324,12 @@ CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
 CONFIG_SC_CAMCC_7280=m
+CONFIG_SA_CAMCC_8775P=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m
 CONFIG_SC_DISPCC_8280XP=m
+CONFIG_SA_DISPCC_8775P=m
 CONFIG_SA_GCC_8775P=y
 CONFIG_SA_GPUCC_8775P=m
 CONFIG_SC_GCC_7180=y
@@ -1366,6 +1368,7 @@ CONFIG_SM_GPUCC_8550=m
 CONFIG_SM_GPUCC_8650=m
 CONFIG_SM_TCSRCC_8550=y
 CONFIG_SM_TCSRCC_8650=y
+CONFIG_SA_VIDEOCC_8775P=m
 CONFIG_SM_VIDEOCC_8250=y
 CONFIG_QCOM_HFPLL=y
 CONFIG_CLK_GFM_LPASS_SM8250=m

---
base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
change-id: 20241022-defconfig_sa8775p_clock_controllers-3000e540560b
prerequisite-message-id: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
prerequisite-patch-id: c405247d3558175ea16e723e36ccba87b51da3e6
prerequisite-patch-id: 2f421e48713add52f17b6e0a95a1e4cb410322e0
prerequisite-patch-id: 037cc7f8c1c9f690bea1976550616e661f48c53a
prerequisite-patch-id: 930db8201718c0a66286d85418c7bac1719a76d1
prerequisite-patch-id: 79dc8594844768685144c302eaf404b0d6cb7ebd
prerequisite-patch-id: 836d46d2d006bdaae12b8a8aaed2eb786fd636ce
prerequisite-patch-id: 096e89f063b35a70bbd8f92c4eb5a32c850bd927
prerequisite-patch-id: 5a49926d1dfada78038f963d5de23a558d9dd19b

Best regards,
-- 
Taniya Das <quic_tdas@quicinc.com>


