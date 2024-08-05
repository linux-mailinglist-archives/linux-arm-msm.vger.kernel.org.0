Return-Path: <linux-arm-msm+bounces-27898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5ED947545
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 08:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 902E41C20D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Aug 2024 06:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6AD6026A;
	Mon,  5 Aug 2024 06:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Lpus94qR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A5A1E4B2;
	Mon,  5 Aug 2024 06:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722839507; cv=none; b=cejjSJbQL0YAUNnz3nQmH+qtTIrsTzxY5rtOBHzptxrX9nKahMpSCaiq7aCxRpQetpnYNwI3cN7Pqzw6mTpRx0g11Isg9Xa+EFoDwptrBAsQKmw1h7v4UAciIAgkjztCy+d3jcjR+JjNP9RBDTBAvS1NWgMJkAP8EWXncey4DmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722839507; c=relaxed/simple;
	bh=woxHDOV1r8WZG01dp8Ux2oSspJBJrvekqYmBs0xO06c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R8MpvgHYejWWLHR4Aeh3KcSouzdACZbi1j1jE3uqEqxMlapoPz+p1LXqFq7aR2g1/L+aXiJZVTCVWgl4lPWwSfGegXURnOJ4fhiUaYxHIWWj1l40oZSMrAXV6rwWp39JhXVj7qPUTm2DbpgKh5L8Fgtbb0GyFjGa1bNE2SrXiJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Lpus94qR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4752VksU026698;
	Mon, 5 Aug 2024 06:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=miqGn9GdzzG2HmHyTSP2BJ
	gpdl6YJnakZyCQc12vAZE=; b=Lpus94qRa8fgk5f4b0ebJBe21/lcxNsKozRiIy
	y+zfg6GD/A0gcjRwg9f1TKGI3amtXIWiorhd2evmt/D8KHHcVVJO4bQc8Oba76hf
	fe21ZwFTRkM3mJAYaZTj0Sh8AxIx5CqI20VuBKpxmdKJccO+MR2098OgHg/MHSvU
	RCHfPAxjSXWyBMun/tgkZDjSMMgINMuXoPM07jRAKsRZAIlaqH4YIMM6fH8kKsAF
	Mk64Q9QjDrvuXmzeupA7h1RIXoJtTVXQOH2fEFVHOY3GGVDKKHXmtgB3MKNVFBo8
	s7ZuKbimbeq6xjQcQmnklxqNOXxt0dGFmGMwRtThcS5RPOqg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40s9wmu766-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Aug 2024 06:31:34 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4756VWSD005770
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 5 Aug 2024 06:31:32 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 4 Aug 2024 23:31:28 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: qcom: camcc-sm8150: Fix the camcc probe
Date: Mon, 5 Aug 2024 12:00:48 +0530
Message-ID: <20240805063049.446091-1-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s9Mgakt2_Zza77wKFMG4r2lfuTe9koup
X-Proofpoint-ORIG-GUID: s9Mgakt2_Zza77wKFMG4r2lfuTe9koup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-04_14,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 spamscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050045

qcom_cc_really_probe() API's arguments are updated to use struct dev.
Fix this function call in probe by updating the arguments to use dev
instead of pdev.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202408012234.vggzO9in-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202408020044.PEGwUAFE-lkp@intel.com/
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
Please note that this patch is dependent on series [1]

[1] https://lore.kernel.org/linux-arm-msm/20240731062916.2680823-1-quic_skakitap@quicinc.com/T/#t

 drivers/clk/qcom/camcc-sm8150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index 195582b598e4..bb3009818ad7 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2138,7 +2138,7 @@ static int cam_cc_sm8150_probe(struct platform_device *pdev)
 	/* Keep the critical clock always-on */
 	qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
 
-	ret = qcom_cc_really_probe(pdev, &cam_cc_sm8150_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8150_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);
 
-- 
2.25.1


