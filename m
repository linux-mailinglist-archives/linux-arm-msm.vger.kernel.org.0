Return-Path: <linux-arm-msm+bounces-57108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9628AAD909
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 09:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 603B13B6A6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 07:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A899221730;
	Wed,  7 May 2025 07:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b74+gGhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4AD22155F;
	Wed,  7 May 2025 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603902; cv=none; b=ECQLixINQt2wFwYpn2ui0LEYjcoRBSfYoz/JWpj1EHU564Bu136EUpnAyh4mXhGa4s9r7OQHImj0Ui9Ovl7TwXHWRn7cVXxtpe+koJmrcD7LEVwSFtHczaO47rpfY9X9QJu09eITvbt5ssfdy7pS6gDFAMorWVr5uZHDWfZ+qpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603902; c=relaxed/simple;
	bh=UIXL1PvyHToreKlZvHLHBe7wN5iOR5xedG7X6aJRfws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oJbcKQbcYYB43bVxYbuK3w5V3e/gImI5i6EaWu8QbH5+CecYFaIk/o3ETvzc49ek6uuymMg+2Z+aLXQXlMkF67BTlB69FNv8wVClnZL/EgspbJjP2xLWl9HLQ3h9CfqjEBu4J1OjU3XO2TaAJoe12qRfRg7QamkjSY3QxBHxqpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b74+gGhv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471GtHu021520;
	Wed, 7 May 2025 07:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6XzLl4yT9v
	/QX/o4bFHum741R03mKKatFvOYyg9AKE=; b=b74+gGhvGl5EXtxC0Msm9dqqPdV
	c+kzjqYybf54XIrrpgMr7Dg8d8HGZ5aOcgJv5i+Z70/v1kbhXqk4rEyreYNNJ607
	vDyE6mB8SwwLryxlJD/GAwy2HyDT7sRsNSOjprgxd39zQoDD/S9JZ4OSB/YRrrdq
	7cZooWsRpQIL4w7Y++uM5Boo2yPqlYMfs6LlXATBF9MSfiPjqh+ojLqL2LcrsQUw
	fqHZ3kBHlXWgCkBC2jAnavFX75eJvPwdGkGQAAvhOG9ASgkjmhjlDJRPmoAY5bVZ
	Fg0zVk4Bq9B6Rx1Lc9Eb2FGPeeWIvTlc6gY1kuIHxZrGrm+Q2aGlpSRnieg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtumpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:35 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5477iXP1032533;
	Wed, 7 May 2025 07:44:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m7dxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:33 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5477iOp0032448;
	Wed, 7 May 2025 07:44:33 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5477iXjo032515
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 07:44:33 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 2057D40CF7; Wed,  7 May 2025 15:44:32 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()
Date: Wed,  7 May 2025 15:44:13 +0800
Message-Id: <20250507074415.2451940-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
References: <20250507074415.2451940-1-quic_ziqichen@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681b0f63 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=ufAJUjbdAAAA:8
 a=QQTxopGz-chmN7SC5sQA:9 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-GUID: d5ww0YVl4YMfa313amaXIc8xqpSd-fHy
X-Proofpoint-ORIG-GUID: d5ww0YVl4YMfa313amaXIc8xqpSd-fHy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA3MCBTYWx0ZWRfX8yOkEMxAR1eX
 J17+S6TmrZV+UMHUUtpTzN/dqMHB5dt9v3nSra3jazUmcz1vqjF50wO9ycsJdhR3ogCZAswiwK0
 8xJWLrqh08qJxyabq9FimF6ovqIf1lt6Hdstw/TzN+te1s53jIYMczfGwYQi5dFNvv2b50bmQqN
 44F3fOU6nfuSgD3Zuux4TrY0MLqSPE/JZOVXFSGL1RenSdsvAF9IYmnmVRfYbfmHnaPd2XCbaQ+
 QONzIY5GdWlLRcMGbJig+eXbMDuQdFRWZRHsjggxflvYac4w3K9I2etPkDXYiWK4rF1i9weJFz1
 A2wRzs8pJPMEuPPq1MJxnrw2N+0tCZZ9Pfbjt+Ym11N2rrx4a1ChG37lY7Rg9ELl4npk5xwqh1V
 YhscnsxjbdWJERAHq1Sz55T4ZkKMYkvoCm5vb/LW7YORG37dL70s9hUdo08MMxNmsxhtY1LS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070070

The vop freq_to_gear() may return a gear greater than the negotiated max
gear, return the negotiated max gear if the mapped gear is greater than it.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>

---
v1 - > v2:
1. Instead of return 'gear', return '0' directly if didn't find mapped
   gear
2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
   return it.
---
 drivers/ufs/host/ufs-qcom.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 790da25cbaf3..7f10926100a5 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2105,10 +2105,10 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 		break;
 	default:
 		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
-		break;
+		return 0;
 	}
 
-	return gear;
+	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
 /*
-- 
2.34.1


