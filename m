Return-Path: <linux-arm-msm+bounces-59448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E72F6AC4266
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 17:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6036C3BB9EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 15:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299BD217701;
	Mon, 26 May 2025 15:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="YWX/sgIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9842E214A97;
	Mon, 26 May 2025 15:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748273936; cv=none; b=Y0/WvqLBU/+ecOcQnOwJeWjlVuUXmktCQFNd/kdh3aHiZfk+PJybVzV+BKRtzMwXEAWR63Fh1oEtMW36os3cQ7PxHz5xRlYBmXnjjPha+goCJXnJVfGo3xB9fHDxmqn0kd7TbTX9dvjzCvQBwUw3jTCZJ4BByEdsLtSusbgP8/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748273936; c=relaxed/simple;
	bh=4ys4nBhVH0rrXdjRyztdT6kU85X1hn05rAzuHsAL2z8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fg4O5VnqMjX7PtqOxEsrTiaozcaTY2Y8tEfkIQFlySpjFI6+0SY6yKN9RpfJSL1foUTf7+0iXKy7FuRnnSa6BjLsaVvANyXx0JYi/zT6ZuN6uMUUctfFda3VLgDsez0qHrKpQj62E89XbfxRMX+Y0P6J2BQA8SthK/9ibt1yqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=YWX/sgIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9VadN023081;
	Mon, 26 May 2025 15:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dDcQOd6MigO
	x6/8Ow3YrFjkr6ByjXSl9Dba1QVvfLRk=; b=YWX/sgIYblPRs3scFAATdTs3uE4
	bLcVe9ZSKLrT9PoiXEq6tc4qG2bhF9Ln4uu72doH/5lZA+ul5/lPF8XnilHR0Qru
	VhfC+HsnhqtaYFBAgo1yJq2M85XAH57Emal2UIF7kowmzLc3RX2cD8fRFW2DWfsn
	qRnLQoKjjsCjlUhacJwT0u4z0o+9HgJRR1y6KImFlFRrEaPNSubqlf5t7x9TN1MD
	+Wl/1xq6toJryp6JBGvlcY1QrK2VGSBAR5BwUZj2w4ulGXWcSHtp88sOsCxb0S+s
	8Q2fv3uhq1Ernd+3ThxYo2IaU8P+q8cz63Ixv3XpcO2yNyboHS7kqpvvvuw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjmhe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 15:38:34 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QFcVVo032533;
	Mon, 26 May 2025 15:38:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46u76m73hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 May 2025 15:38:31 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54QFcRQR032457;
	Mon, 26 May 2025 15:38:31 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54QFcRBc032454;
	Mon, 26 May 2025 15:38:30 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 44FB8602710; Mon, 26 May 2025 21:08:30 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V6 09/10] phy: qcom-qmp-ufs: refactor qmp_ufs_power_off
Date: Mon, 26 May 2025 21:08:20 +0530
Message-ID: <20250526153821.7918-10-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
References: <20250526153821.7918-1-quic_nitirawa@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68348afb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0NjA6WJkZe3NLfXfqlsA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -jArGu2ShKP0CEG0wrepOuO9BuxI6azG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDEzMiBTYWx0ZWRfX0BzBtPp/yAHh
 C5Ci/0zAEWuFIKWOhVXkfee7d1WVRHOV/FHGISqXCo8CxXL4VBjqieo8eS+i3bl6WGuM2ZeueuG
 MwB82i4uHeVKujllRq6rC7Ui+CNVXSaWmljZsJxuCK40yExT7Om4Gw0+3KKVgb98ZoxgtQlwJSB
 UlJ0IrhneE4UpDJz9eotRfAfxQU+jbuwSg8rE5KirVbWIJfHRP10DjBFKfktlmEJzZwL3BNq/uG
 pwLNtCmnJAoDlPUs6G7OboNV6NUrlMzxHXujPeZ11L5eXWd7Ra5xMhaA6tbdgbsdQd18AyOTuNU
 jJr7tmT2RCFEigXg10Ozrvo5stuum4NbcmHX7er1Ngm/SQ5aO2PIoTTQMqgfhgx6qTTJUz3UZZ9
 gwhOwNYe0tDtTjMUxNZGYg3C5JdSRBrflEwpu6vkr2EujDkdpMhL1dwLgYUdmlBD2mlCwvf8
X-Proofpoint-GUID: -jArGu2ShKP0CEG0wrepOuO9BuxI6azG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_08,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505260132

In qmp_ufs_power_off, the PHY is already powered down by asserting
QPHY_PCS_POWER_DOWN_CONTROL. Therefore, additional phy_reset and
stopping SerDes are unnecessary. Also this approach does not
align with the phy HW programming guide.

Thus, refactor qmp_ufs_power_off to remove the phy_reset and stop
SerDes calls to simplify the code and ensure alignment with the PHY
HW programming guide.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 00bde65733cb..9c69c77d10c8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1825,13 +1825,6 @@ static int qmp_ufs_power_off(struct phy *phy)
 	struct qmp_ufs *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;

-	/* PHY reset */
-	if (!cfg->no_pcs_sw_reset)
-		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
-
-	/* stop SerDes */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL], SERDES_START);
-
 	/* Put PHY into POWER DOWN state: active low */
 	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
 			SW_PWRDN);
--
2.48.1


