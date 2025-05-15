Return-Path: <linux-arm-msm+bounces-58105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A5AB8C77
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 18:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA53EA0730B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 16:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C61522F14C;
	Thu, 15 May 2025 16:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="POfM5/fq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B2222D4ED;
	Thu, 15 May 2025 16:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326481; cv=none; b=IWFZ7YUJelQPDk7fkEZR6ZLaizEs+RLlakIslsBY8rgGs5Vs0eRbiVlrPiDitVXwzCPS2tE2GL8OOOaOPFb6LNHab9743H8DZZdoW2xHTigKYXhCOqkjN/PTgRX7DFS5RrrjjlLsmPCAqYlZBWU3ZpPPppmcSJ891ff+w2gQtcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326481; c=relaxed/simple;
	bh=+K4gzSxjT5lVukfOttjD+XFNfJaaJhihXK2v+zfn2R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iBtvtc+jydFQWUS28shVDJQLkfbRFI4e97DKOu9gIM/BmI422iF3sBiiV4ATFQ22wjzKduaU8fLLQWWh1QVUXPCryjJtsZnAUumXGkjQ/dJE8NrYw5xLC8QtZSCqaEOCZrIw/O/LmTkdSQ5l3IKbMz87eGrH3WYIIOkZHh1WXpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=POfM5/fq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFCeq026156;
	Thu, 15 May 2025 16:27:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V7ySCYnUYSX
	wwDN6/ExxYJpAp/ii2NAf3QEXQz/O89g=; b=POfM5/fqpxmNU0sg4u5hFQB+teg
	/Mn+591gLFKlyw7iBMAONPTKO+2wQNMaLIdw2PUuVoTiHA6ZErq+2isz2pGvIoXY
	fPZr3Xy/2DKhDjKwJ6u0U9EWkW1cXTz2CYs3tej9fyr+8AYbLRE2aeAU0x/NaOs9
	S1MwFGnLswFqy94CeiOEqrPOdIZcgwhm3H1w43Op72QJqQr8lICflIAZr+e6uhRG
	kQ+AxUXllmhm3lpAory1w7FijMbsfpHmgAP/XdOVNw0Qc5OikoiWt7NJ4E8eedMJ
	OgMdQhob5GCQcP22fBpvN9fRVgYEkgRXdO0AGBWjwHv9WqaPYtr098xkL2g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcyq0y1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 May 2025 16:27:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54FGRSJ4023582;
	Thu, 15 May 2025 16:27:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46hyvmvnq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 15 May 2025 16:27:36 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54FGRPSj023527;
	Thu, 15 May 2025 16:27:36 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 54FGRaNc023683;
	Thu, 15 May 2025 16:27:36 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 863125015B0; Thu, 15 May 2025 21:57:35 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, andersson@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: quic_rdwivedi@quicinc.com, quic_cang@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 11/11] scsi: ufs: qcom: Prevent calling phy_exit before phy_init
Date: Thu, 15 May 2025 21:57:22 +0530
Message-ID: <20250515162722.6933-12-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
References: <20250515162722.6933-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-GUID: uy0HNrdnQmsFY0AAlFqsFVPCcMMgPmYw
X-Proofpoint-ORIG-GUID: uy0HNrdnQmsFY0AAlFqsFVPCcMMgPmYw
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=682615fc cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=6qkdr0EpClcQ5iOZAa0A:9
 a=zZCYzV9kfG8A:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2MyBTYWx0ZWRfX1qNr6HISpzIP
 YHtTMW8MdSxbrWhtjRRSwt15J3/Rp/Qn7TXJrK00klwfAkoYLoPddi8PrusoH2Y5qwHHB221U19
 rd5adwrimd0U0wsMSqLvFl5rDkhiwqWmb/RyJ5SSBCV5mAmYD/nFFrc+iMPk6Vo5ShCYWmU7UGJ
 DLZ9uAdQoQbGdTrO7a7mPrhN4lKqV1JS8rA/xeYVtjA6lNBO2WzxMLYQozkoIGyFrklSI+odKsB
 JelJI0KGuKfxSWXCcOamqcn60vMfRtATguHwuGYWrYZYvJ6VhAGkG8MC5fmHcTgcwR8Hz7UzCj4
 yRxi+EKDNZPBUCdGEb6PYED7gBrkyHenv9htvt0GmCQ6Zwe1RnPthPM2sXt/vyeTiRcGRfTZRmL
 +54tLpnE1w9/fWSgfY5Rgd6Wwj9o57Q2+nmP0MGxa8rh377T2FmKgDxtfjaxTK9HuNLSQxVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150163

Prevent calling phy_exit before phy_init to avoid abnormal power
count and the following warning during boot up.

[5.146763] phy phy-1d80000.phy.0: phy_power_on was called before phy_init

Fixes: 7bac65687510 ("scsi: ufs: qcom: Power off the PHY if it was already powered on in ufs_qcom_power_up_sequence()")
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/ufs/host/ufs-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 583db910efd4..bd7f65500db7 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -540,7 +540,6 @@ static int ufs_qcom_power_up_sequence(struct ufs_hba *hba)
 
 	if (phy->power_count) {
 		ufs_qcom_phy_power_off(hba);
-		phy_exit(phy);
 	}
 
 	/* phy initialization - calibrate the phy */
-- 
2.48.1


