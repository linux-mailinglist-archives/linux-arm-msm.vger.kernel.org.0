Return-Path: <linux-arm-msm+bounces-58980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528AAC0258
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 04:16:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ADDDD9E4604
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 02:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFEF16ADD;
	Thu, 22 May 2025 02:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hIcJhIJE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4297F126BF7;
	Thu, 22 May 2025 02:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880172; cv=none; b=Apro+q8iSVI4ixWHOpfqDZVwMkoqJp/vmaiLbhJYJRWjI3bL1nEkbxGAdmNo269jQdfLPX5yHkzbz6GOchnAEPyeh0P4cJzEDTtSE7NeOkrud3v1aS6JUM8l0TTKoppFW7rQi5uQF0IkOUMsRuVV/YKawJtsYThrvMZ0v5hQIdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880172; c=relaxed/simple;
	bh=uafvpS5ie5OAR1WWtHPNlRLdfc3yC+BRuJsgJyaRYMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gP2BlBa1ocKCFHlng/qEFriuo4CwVUZ/32a3jFvTDPwznG2EYQkhpZeGAg+SPyZRjM62JRqloq9wvi5v89jdtUnFH+IJiL8B8/69P2q51YEqsy9KQKP9s5oEsNp6yNm3Xt6J0WXJBrs3OMIkp19xsD6pcVFCB0F2OUiPrfcfuQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hIcJhIJE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LHxcaA013410;
	Thu, 22 May 2025 02:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00oJysHJluiGWOmxTZxvMauOaOwuyX2fLE+LqYJE24A=; b=hIcJhIJEY5AuF+6l
	vQTXJWcB+YjdCX0lkcGsoxtN2DR6vIsgGkYxHNQZXXfD0iGpi/+FQQBDZvAey5ol
	mo/ENIHgCweDsfvuHH+MOXAbNBoWfgP3h3+8Tx96iYpkTYNDt84/lyHD5IZOKIMc
	07vyfLtBYuLq5V8CquonQ3c8Uo48uwL9pPTYqiTEch3smWj5YjYZ9KqFj7XkQ3e4
	OTeVLPQULyPx0EF+qbTbwjVRrXROP9cthQPNQI5qJKB4FmoskTHy0BrLhqdoF4NW
	jZnbpxQpUBTcF8OKYtelTioNZajmVMmjklojaD0q8aS0hsw+X1dvwQTFYtvH3wSt
	D8c/Cg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5cts6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:46 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 54M2FiWb011756;
	Thu, 22 May 2025 02:15:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 46pkhn5p4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:44 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 54M2FiDD011747;
	Thu, 22 May 2025 02:15:44 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 54M2FhsA011740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 May 2025 02:15:44 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 0351E40C42; Thu, 22 May 2025 10:15:42 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com, neil.armstrong@linaro.org,
        luca.weiss@fairphone.com, konrad.dybcio@oss.qualcomm.com,
        peter.wang@mediatek.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        =?UTF-8?q?Lo=C3=AFc=20Minier?= <loic.minier@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/3] scsi: ufs: qcom: Check gear against max gear in vop freq_to_gear()
Date: Thu, 22 May 2025 10:15:35 +0800
Message-Id: <20250522021537.999107-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522021537.999107-1-quic_ziqichen@quicinc.com>
References: <20250522021537.999107-1-quic_ziqichen@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDAyMCBTYWx0ZWRfXw4u6hhgSoeVk
 LonC4+DnUzo7HUa07hiyFx6vSPhrRnrD3R7V6myQvHSN6eizpQ3h86P9/k//ScB6K9Nzt0iEaqa
 Mx6kAi00nGC5Um1NDRxXJ6f/JYntqP3c87N19OLDSFOTDE8b2aDgOAP5wrKJgp/YpDDga31Su9a
 jbtym6f3Q9j97cJKagd6onh43W+MpgZfc4p+RvPud5eueeshFrll3+KC9rEb+07j4Z7r/gM4Pud
 RkOU0huU4TH1fq94qky2nkj0487cFovJbDtVk9T/6JifQWdCTVjXKMG+MjuAU0raFV3s0K/9vAf
 WCRTK2iuZtiW7iWQ+n8hgRFiWwZvFwUrFC2xROA9EzJHR907TqC52PCGtv/K5EjqSAmLKnkLQc7
 a0HF2VNikqiOnCgwYOnQUB7k40DeLg7zCMBacrSqPPeUaNfycEbjlEtU1De9AjTOMYR/cqc9
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682e88d2 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=PY6Zn8H8AAAA:8 a=EUspDBNiAAAA:8 a=ufAJUjbdAAAA:8
 a=9iMbsSLhhSMDkuc5M44A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=ySS05r0LPNlNiX1MMvNp:22
 a=rB1ygNaI0PWiOa_UD5GD:22
X-Proofpoint-GUID: swtxMd67nYfxyR7XzWPg_Jz4WNzkGH28
X-Proofpoint-ORIG-GUID: swtxMd67nYfxyR7XzWPg_Jz4WNzkGH28
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_01,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220020

The vop freq_to_gear() may return a gear greater than the negotiated max
gear, return the negotiated max gear if the mapped gear is greater than it.

Fixes: c02fe9e222d1 ("scsi: ufs: qcom: Implement the freq_to_gear_speed() vop")
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Closes: https://lore.kernel.org/all/c7f2476a-943a-4d73-ad80-802c91e5f880@linaro.org/
Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Bean Huo <beanhuo@micron.com>
Tested-by: Loïc Minier <loic.minier@oss.qualcomm.com>

---
v1 -> v2:
1. Instead of return 'gear', return '0' directly if didn't find mapped
   gear
2. Derectly return min_t(gear,max_gear) instead assign to 'gear' then
   return it.

v2 -> v3:
Replace hard code '0' with enum 'UFS_HS_DONT_CHANGE'.

v3 -> v4:
Rebased to 6.15/scsi-queue which the relevant patch applied to.
---
 drivers/ufs/host/ufs-qcom.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index d03a07402223..a97fe8eee27a 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1880,7 +1880,7 @@ static int ufs_qcom_config_esi(struct ufs_hba *hba)
 
 static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
 {
-	u32 gear = 0;
+	u32 gear = UFS_HS_DONT_CHANGE;
 
 	switch (freq) {
 	case 403000000:
@@ -1902,10 +1902,10 @@ static u32 ufs_qcom_freq_to_gear_speed(struct ufs_hba *hba, unsigned long freq)
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


