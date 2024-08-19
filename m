Return-Path: <linux-arm-msm+bounces-28948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E19564B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 09:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBD152839BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 07:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17CC015622E;
	Mon, 19 Aug 2024 07:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IqKnuC+q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BE3B657;
	Mon, 19 Aug 2024 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724052647; cv=none; b=cKJDzfH7T+WaM2U8eNgwa7rY2lWCMgyQIWAqDV4dSvWfJkBBhq3GB0t5VHi1RywkqY0lMjdubfroqR26X15YUHs+DvYXXOdW0qK2t4rsbF0pSKx23HSLuUoAmn+VA59U9MGlHJ0APB96YSJWjz8yPEu6n/hQ+sqKdt9I/rs8EOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724052647; c=relaxed/simple;
	bh=7BXnxBZrxRc+q2NleTxrIOuh30+vm8zYfzVHMGFAiXo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SiHWdkooufVVvVHX08LiKM9yhY/rIASPUAnHCVWKIF350t5XMwW+FloKrb7kg+b8KxEHMKz3SDMwbQHkedVHniiDW1M4I2m1bxehSk4uIOpGa5TOYwEUh7/FPASbBWrc4ep27wBfN/kDDK8OfaBF7BagIdc/5L4EnSa5KcE4qZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IqKnuC+q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47ILKEpk025131;
	Mon, 19 Aug 2024 07:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8jHwVVsoU2f5bCMX9HB7cN
	HpdTVQyglT0UfzYVXkZ+M=; b=IqKnuC+q+fE6irEsWmBpMB/glsqXwVDd8acUAi
	6zXf9R4/7wP7MPXht8LZWdndHorJdZEnsFhF2do4d3YTJ++CAOQOTswczZDN9SEu
	RMjzhqqPV8BQqjn5BbhvYfM6pf6Kdqalt5SAWMvq/GJ/P4QGBLb4fTRRDm84vaBl
	oD4sQd5+ndyvOrcw3KRuNIOFeNeiiIyyabY20uo90aEcwXoJU3qaZY8oVO5hg+/o
	ImFVOQEFpuKYyQDi5xqqWjdnnVosi2REO0MUmSB+qhNd7g6TZ0V3796bhCjQ/dt3
	MGVOMxAggQ0mXQTcg17lPotmT7cmd8KyRQwogJMJ+2bVCr2A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412jtrube5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 07:30:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47J7UdS4020370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Aug 2024 07:30:39 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 19 Aug 2024 00:30:37 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>,
        <dianders@chromium.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Re-order writes to the IMEM region
Date: Mon, 19 Aug 2024 13:00:20 +0530
Message-ID: <20240819073020.3291287-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HmVX_4V33t35iAdF8v37AAVewKjjjRpV
X-Proofpoint-GUID: HmVX_4V33t35iAdF8v37AAVewKjjjRpV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_05,2024-08-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 suspectscore=0 bulkscore=0 mlxlogscore=929 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408190054

Any write access to the IMEM region when the Q6 is setting up XPU
protection on it will result in a XPU violation. Fix this by ensuring
IMEM writes related to the MBA post-mortem logs happen before the Q6
is brought out of reset.

Fixes: 318130cc9362 ("remoteproc: qcom_q6v5_mss: Add MBA log extraction support")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2a42215ce8e0..32c3531b20c7 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1162,6 +1162,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 		goto disable_active_clks;
 	}
 
+	if (qproc->has_mba_logs)
+		qcom_pil_info_store("mba", qproc->mba_phys, MBA_LOG_SIZE);
+
 	writel(qproc->mba_phys, qproc->rmb_base + RMB_MBA_IMAGE_REG);
 	if (qproc->dp_size) {
 		writel(qproc->mba_phys + SZ_1M, qproc->rmb_base + RMB_PMI_CODE_START_REG);
@@ -1172,9 +1175,6 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 	if (ret)
 		goto reclaim_mba;
 
-	if (qproc->has_mba_logs)
-		qcom_pil_info_store("mba", qproc->mba_phys, MBA_LOG_SIZE);
-
 	ret = q6v5_rmb_mba_wait(qproc, 0, 5000);
 	if (ret == -ETIMEDOUT) {
 		dev_err(qproc->dev, "MBA boot timed out\n");
-- 
2.34.1


