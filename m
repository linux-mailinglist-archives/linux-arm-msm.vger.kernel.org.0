Return-Path: <linux-arm-msm+bounces-69560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92143B2A21A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:50:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5B631B27200
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C2E31B102;
	Mon, 18 Aug 2025 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RSiCzDu4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AA93218CC;
	Mon, 18 Aug 2025 12:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520882; cv=none; b=JkIjp9GA5qbwX1dKlPclG6btkxPD4MxQXa1sat3v4IMoYBGuRzqQGngTOtTogDYLOaVIO3v/PHxQkPqmY4x3oL57/nsTpNtErXHLPFg0CevY0+Ck6hxCTqCLHyZYcJ+8mSv4dHbzj7LDmODcLYt/qI3Bwece8FG3540hgg4C+t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520882; c=relaxed/simple;
	bh=IUgJCrQ8unRgKzF4X7DoQpgjsxGKEXpKCmJQqN1x4xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pdrvz+/aaa3nKB4dTqZW/jIHVZJv0WDNYLmCrJ2PID/O/RCl/MeNrg9sF1rZX/pZDLfERaY+NZ++S3WoEPoQFRA1fd0BE8/13lMSjB9/8JhOcWBuJlrCB6mcbDVFAcMBfoM5CAGh0eOQKqsWMZaqrjrUBjeQjAXFxjQTIMsiPas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RSiCzDu4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8oO49004363;
	Mon, 18 Aug 2025 12:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Lcf0p81aqLo
	jmFBxS3NV9P90FfeezsJQGhNxItPONcI=; b=RSiCzDu4VMr4/RBSuHFWRJo9K5S
	zOatUw+2cQnIrE5blPAH2nJOr07lHfsEC72kjtr8d9H6cIpBemKELgbYW9qeOg/T
	x0o3Vatac7WPlwkbMTnnJTpllBuZhzgJlaFyKvei7sdYH0shkYB0A3KtaxHoytD6
	Bpp7PLBvzuGwARx9zcleNcwZF6q7gGtRtyjoS4sarNFeNlhDjN8mam+OVVvjs2Cz
	ZCM3YUMIXhSwGIAbpX7rEIlVTbNAIDPuDAxktDxjhTN2LE3fEhRcyLyq7TS5TSWX
	QWyDO8WJNoan8pS/Y29YVk9V90hHyWf10D6ZuCEP7FBRfyFVE7bEULca0Nw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvnpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 12:41:16 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57ICfCO3009290;
	Mon, 18 Aug 2025 12:41:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 48jk2khku1-1;
	Mon, 18 Aug 2025 12:41:12 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57ICfCAm009283;
	Mon, 18 Aug 2025 12:41:12 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 57ICfCBR009280;
	Mon, 18 Aug 2025 12:41:12 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id D482157363C; Mon, 18 Aug 2025 18:11:11 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V2 1/2] phy: qcom-qmp-ufs: Add regulator load voting for UFS QMP Phy
Date: Mon, 18 Aug 2025 18:11:09 +0530
Message-ID: <20250818124110.8136-2-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
References: <20250818124110.8136-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: bvteCSO-waADjbWmzhdCnNO9suBO71Pp
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a31f6c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=epwhtnthUrwNWoGBwlgA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfXwh9gMySuGnqu
 KOOC71gzynB1KscZPrVxfWvwoVHalW4WbUq3SumMTppJbAB9thw1mKnqfxS2LbwTiSxnhj3JFup
 dNztw222i4U9kPVsuWUWlvcmbmPsxM+zrmd4Sa5FUs/g6Xd3wel6hr05sWCZXv+TuL7tyWNXM13
 1kN0ZQ2WEqhL/0t0rgWvnoWQrrpjNcd6XYXlbFEgI9G17RAheD32+WNBus2mwO74kWXm99DlATx
 ia6isFBz3FHhnGXu3UA9jFzN0P0UYdJR7YgCmBovt6wFuzKE5H88EChTxeuhTaz41zGlicGWx99
 7VuniKTR0oJWsnarv5a+8c2uokJONVwNTjXGuRQvt1uov1f3s4/K3f+RO+jjzHTpZ0i6o38uiZk
 bsFMSwuy
X-Proofpoint-ORIG-GUID: bvteCSO-waADjbWmzhdCnNO9suBO71Pp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

On some SoCs, regulators are shared between the QMP UFS PHY and other
IP blocks. Hence convey maximum load requirement for UFS PHY to the
regulator framework as supply's capabilities or mode(Low Power Mode
or High Power Mode) change depending on the maximum potential load
at any given time, which the regulator driver must be aware of.
This helps to ensure stable operation and proper power management,
set the regulator load before enabling the regulators.

This patch adds:

- vreg_load_uA field to qmp_phy_cfg structure for load value arrays.
- Enhanced qmp_ufs_vreg_init() to set init_load_uA when loads are
  specified.

Configurations without specific load requirements will continue
to work unchanged, as init_load_uA remains zero-initialized when
vreg_load_uA is not provided.

Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
index 9c69c77d10c8..f7a4a8334026 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
@@ -1110,6 +1110,9 @@ struct qmp_phy_cfg {
 	const char * const *vreg_list;
 	int num_vregs;

+	/* regulator load values in same order as vreg_list */
+	const int *vreg_load_ua;
+
 	/* array of registers with different offsets */
 	const unsigned int *regs;

@@ -1901,8 +1904,11 @@ static int qmp_ufs_vreg_init(struct qmp_ufs *qmp)
 	if (!qmp->vregs)
 		return -ENOMEM;

-	for (i = 0; i < num; i++)
+	for (i = 0; i < num; i++) {
 		qmp->vregs[i].supply = cfg->vreg_list[i];
+		if (cfg->vreg_load_ua)
+			qmp->vregs[i].init_load_uA = cfg->vreg_load_ua[i];
+	}

 	return devm_regulator_bulk_get(dev, num, qmp->vregs);
 }
--
2.48.1


