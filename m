Return-Path: <linux-arm-msm+bounces-57372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2783BAB0C59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 09:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E2E51B61B52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3529D270543;
	Fri,  9 May 2025 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F7TOTC8T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765ED270571;
	Fri,  9 May 2025 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746777100; cv=none; b=nECkfpaO/NNoQ4Zj+n1qr2RL5nc9VX+7ga2DKQULtEhIHm5/iPE8hdEHAMY6EOqxTrJUXfAwGu4/r0Jvz43Xy5jSb+9qxxfUPPMWjAxEeD+IdrT6lZA0k1iL9ROkPAD6EBtb61h8TW4bAL0Pwzu+QqKfpJA/BR3ubq6d+qPwSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746777100; c=relaxed/simple;
	bh=6mkDt2wLDfgqGHOjN4mImK/4v8hsX8iglKoSJjvDh80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mks4otGV0+nLZj28Bttn23473xjHUgRxtVvdih5/cemPe/vwGsbFfp7qTibwfT5IOgEQS3NCsCMjusPoaONX/Gori8aQS3ln4qKHmXUl9iRTqTitPBpsWQcjpwkmwOFjZDivqZFQDoUIb35Ibs8L9yb8lOaAEm0kZ+j2I5MbUDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F7TOTC8T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54939TV9010240;
	Fri, 9 May 2025 07:51:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WLTYUZvoeOV
	T8YfxHlzyRuwRYQpJd9ZIvyFTgRJCLE0=; b=F7TOTC8TMEKledVUnHEguRZV6su
	w8Di5fDp4v8czhHSRIL8AOYojZxdKmPKemyUfHJJqmw74UEohsdkVRGyxWfiyPeM
	PALlhKpDWMhimv+juyLBTlQ8Uy31qsew20+NLTYivTgTmVMUav/iQeIM73Q5BtEq
	eVscgvYwO8faOFXLasWgVCiIVAiJJCWEj7T0qSsQ+zB//vbEOPlkMef7xl0lN4E4
	Cn/HwU0kyZY1xlIHW/35tQWBan5tTK87F4VZa/gHAAZYWgrAbOrrW5QNQ5bnqeaf
	IY8I77XvBj0kQGxgcJxjfki46rEPF0XL1TtqVs8FOrEVhColdYZYxHp2IGw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7bw7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:51:13 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5497o0uI023436;
	Fri, 9 May 2025 07:51:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mxnvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:51:11 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5497pBFC025462;
	Fri, 9 May 2025 07:51:11 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5497pAfS025461
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 07:51:11 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0543B40D81; Fri,  9 May 2025 15:51:10 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 1/3] scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()
Date: Fri,  9 May 2025 15:50:27 +0800
Message-Id: <20250509075029.3776419-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
References: <20250509075029.3776419-1-quic_ziqichen@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDA3NCBTYWx0ZWRfX5KQ4yDQ9nXKP
 c+geQH3zN1Z8wK5/JJkj5zecP8ul0C5cEA9z3hlLVdc5rISPEv3f4sr55J5J3C0jX2f1ysJtyat
 Uxf0iTvTPjed/Z3HgCwln5asthAUPzkm9CoKYXQ+9PBASGDRrwlBR37Tna7wdYHSuoOlmlmKEoN
 5f/c20YTt88o2saXTLfE2B4175NS4oZb1J/2D9+RvyLSpNVun0vXuOsdXclBSBIDLVrFHCrpHsj
 xIolgkBnf5iaOx9kPfuxYNXINmo0FQeeW8ZuoANOc3sVxaBDCYImO4CDUi5z/lqYE0jgHG75iQs
 X2poOzEFBOwjtBI097IoyoSQD7yBpUnfGZ8b+YzLelRejyFnQlx4TlmmmH1RBPQWoQKMHf9Bc8H
 euDGzWweMgZgUgmRnk2U5V1nDk4CC4VAlNBu4alUwGAOqh7dRBIhmkoRVNxz+Oa3yBLY1LTR
X-Proofpoint-GUID: s_-dxllFCRsACHOBIH45b1IIoitQJtv9
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681db3f2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=PY6Zn8H8AAAA:8
 a=ufAJUjbdAAAA:8 a=Hg96m-KNhM3-If01i0kA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22 a=ySS05r0LPNlNiX1MMvNp:22 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-ORIG-GUID: s_-dxllFCRsACHOBIH45b1IIoitQJtv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_03,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090074

The vop freq_to_gear() may return a gear greater than the negotiated max
gear, return the negotiated max gear if the mapped gear is greater than it.

Fixes: c02fe9e222d1 ("scsi: ufs: qcom: Implement the freq_to_gear_speed() vop")
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>

---
v1 -> v2:
1. Instead of return 'gear', return '0' directly if didn't find mapped
   gear
2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
   return it.

v2 -> v3:
Replace hard code '0' with enum 'UFS_HS_DONT_CHANGE'.
---
 drivers/ufs/host/ufs-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 790da25cbaf3..654d970b6dec 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2083,7 +2083,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 
 static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 {
-	u32 gear = 0;
+	u32 gear = UFS_HS_DONT_CHANGE;
 
 	switch (freq) {
 	case 403000000:
@@ -2105,10 +2105,10 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 		break;
 	default:
 		dev_err(hba->dev, "%s: Unsupported clock freq : %lu\n", __func__, freq);
-		break;
+		return UFS_HS_DONT_CHANGE;
 	}
 
-	return gear;
+	return min_t(u32, gear, hba->max_pwr_info.info.gear_rx);
 }
 
 /*
-- 
2.34.1


