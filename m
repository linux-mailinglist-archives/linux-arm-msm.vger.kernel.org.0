Return-Path: <linux-arm-msm+bounces-110231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NSdIjdMGWrzuQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:20:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 062B65FF150
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 10:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48C4C3103131
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6559D3590A9;
	Fri, 29 May 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IzQquaSK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C04E3AD53D;
	Fri, 29 May 2026 08:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780042277; cv=none; b=cq9UpqYwAoQOQd1PwhnzXsT2pGrtUOIYtI+KKwf0DdqIMzchJUi0PyS3k/9e5RaWo/ThjLOHpnT6ZhQCdO1umkLU5LAfwXoIUKaOkSNiN2y+VmnWZcNuSgORUohsOv1dYHY7wGHY9nqnkNPmHPsxZG65yAgp63owD92u9K7QKPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780042277; c=relaxed/simple;
	bh=4FKXm02ImGY031hnmka9OKKz3krsiBZumzBrZSPyT6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CM0ttIAWwg7o81KSVJF2bLA5+AI4Y+xtTry5SUoKmdvDQK/2b0DrHvM/iD99CZpp6LWVGMDkZCnOPuqiDFhAKtmgX/lv3QQdwyAoWoz93SFn1jCsN1NkMF4mLpZpXqDW4j2UN5mSnnYq13DEZoNvVi8CfSdD96X1rXehh5NsL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IzQquaSK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6reOT1829560;
	Fri, 29 May 2026 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f+C4/rvGR6v
	aNCGREi7CiOqziIgXuc9iFrAnn3g2fXI=; b=IzQquaSK0OAYHJwTPTDZIYk9kDk
	pdqoKb07IYaoF88GdBci6QhcBnIDTC0jzuxDe1WGYZChE7dSpQ5syagbLizUR+0R
	ovjlb8EpUSg4ve/fyDKeblq4p5Jrpf2hdEqa5aBV1oAhf/tugsfh5O7FvdT+ROaR
	0BSO/CJLD8M0KO4Frv4Ka/K1KISjx1dcFdQqgMu1UunEAgCj9zMpAVRVKYVzxH+v
	VP4bFf6Ta6v4mal/FcCqb7kiHNCOsrJbU3753Iv8YdtpqyalEqBReGj0waMV8dng
	WNoE/Gaxkq2hy7Wozww2pF9NmHSGr8wxDF7EHh5WI7/MD7GrPeqHTEPgB7g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eex6m27nf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:11:11 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64T8B9xS002183;
	Fri, 29 May 2026 08:11:09 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4eb5akbqaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:11:09 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64T8B8J4002177;
	Fri, 29 May 2026 08:11:08 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-rampraka-hyd.qualcomm.com [10.147.247.88])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 64T8B8nJ002174
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 May 2026 08:11:08 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 2305851)
	id 91734628; Fri, 29 May 2026 13:41:07 +0530 (+0530)
From: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
To: Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, konrad.dybcio@oss.qualcomm.com,
        abhinaba.rakshit@oss.qualcomm.com
Cc: linux-mmc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, pradeep.pragallapati@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com,
        Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
Subject: [PATCH v1 1/1] mmc: sdhci-msm: Set ice clk rate
Date: Fri, 29 May 2026 13:40:45 +0530
Message-Id: <20260529081045.2877910-2-ram.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
References: <20260529081045.2877910-1-ram.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA3OCBTYWx0ZWRfX764bfcEaLm6O
 XuC9CDqvibvC/ot+cziS517Vv0+CmUDkmO0Vx7rNGCF+AGO8OqYU4KN+wdAa7f5vOl3UBoqShRn
 FXrOYX5hUw0LA5IPWmSpT37MoqKuJp8qGqTGBZBG28h0B2G2vS+4UYuxcQA8Lw29g6dgocSj4Ij
 mvvhC1Ov2eFi0kQP8D8G09e9oCE1JwHHCpGhbJum2kt1edpuSZLgPw6wBJwSd4D0RvxnIJhUH+S
 SkAUj4CI+W/mWctXGThTkUJ1UEpTM8+2NQJSIrW5ZyL4f6dos90z9q8qf+6Z2ycBEyB1G72CdDb
 qDYdPGYfutbDYjWf+E2ca9xO2XGHJsYNkzP0CA9ndSkZPgJ3e0qgbSmcULklGsYxDpT2Mk7iJEL
 ln1Fal5bS9Nq+6AYTBwdOeqtoENuW90Q4Pva4ycpZ347CczTxOPmmmN8q4eSAIJ2LWxq11U5c0V
 bF4vq/G8X7klrsc4sXA==
X-Authority-Analysis: v=2.4 cv=frnsol4f c=1 sm=1 tr=0 ts=6a194a1f cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=JolhpBCtuxO9njz0ODwA:9
X-Proofpoint-GUID: qX0jCS2ZT2lZjDPVDYeFdj5ADENjI5Ng
X-Proofpoint-ORIG-GUID: qX0jCS2ZT2lZjDPVDYeFdj5ADENjI5Ng
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290078
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110231-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ram.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 062B65FF150
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Set ice clk rate from sdhci msm platform driver, needed for
target which are having legacy ice support, and need sdhci msm
platform driver to set rate.

Signed-off-by: Ram Prakash Gupta <ram.gupta@oss.qualcomm.com>
---
 drivers/mmc/host/sdhci-msm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index b4131b12df56..c6a073718aa4 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -286,6 +286,7 @@ struct sdhci_msm_host {
 	/* core, iface, cal and sleep clocks */
 	struct clk_bulk_data bulk_clks[4];
 #ifdef CONFIG_MMC_CRYPTO
+	struct clk *ice_clk;	/* ICE clock */
 	struct qcom_ice *ice;
 #endif
 	unsigned long clk_rate;
@@ -2708,6 +2709,17 @@ static int sdhci_msm_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+#ifdef CONFIG_MMC_CRYPTO
+	/* Setup ICE clock */
+	msm_host->ice_clk = devm_clk_get(&pdev->dev, "ice");
+	if (!IS_ERR(msm_host->ice_clk)) {
+		/* Vote for max. clk rate for max. performance */
+		ret = clk_set_rate(msm_host->ice_clk, INT_MAX);
+		if (ret)
+			dev_err(&pdev->dev, "ice clk set rate failed (%d)\n", ret);
+	}
+#endif
+
 	/* Setup main peripheral bus clock */
 	clk = devm_clk_get(&pdev->dev, "iface");
 	if (IS_ERR(clk)) {
-- 
2.34.1


