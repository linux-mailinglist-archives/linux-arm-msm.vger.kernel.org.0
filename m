Return-Path: <linux-arm-msm+bounces-64105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF00AAFD9C8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 23:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 614297A810B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 21:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79FFF246326;
	Tue,  8 Jul 2025 21:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ng9LlbTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F411B2417F0;
	Tue,  8 Jul 2025 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752009964; cv=none; b=B6zAFXr0MnwXaaYFD7Er/ogU2nTy4Qb4gEoIywQrXkSs2OghYAlcLc7XCKycCLYMiT1MJA2QNLE8oWuMayiJw8NZIiteKqWAaEZsxds2c47bcv12XaIWpyZb4rp/yU6GZJ+Re0yVVvENvNKU5z3G0LmCLuydedRFhtzRyLTux1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752009964; c=relaxed/simple;
	bh=Ge2/q0dY2x4bPaf9l9HQuZj2LoD3prRY/uplpE7MIX4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dy9XkO0wsyJvwHEHP/f+ZEDyZnxLBWAEyeW1L2Gw9Q2ljBDfvv2r84r9uMfT22nV4r+lndtGP6wDlWdB9T5h7jKRIOlFZhPlTi5YUomBQDRQN5v7oxDGVvhxf3nTVGRfrr1ljUUuIHecSUbYBBp3/55FBN8yD33XCs1ixs7RlJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ng9LlbTf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568JNOwK017086;
	Tue, 8 Jul 2025 21:25:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dg1K7w85NKq6IPBnoHn24/Vpc8sc0yNmhEo
	/wpC8AlY=; b=Ng9LlbTfMSu0B0ME53Ji7ryUuiY26Z3+cni3UAiuEuswQmh/20N
	YN4Wa+GMyIbOts04IdKKKRsEsVOth3srzmf7SDC/5isrxRR54pRte5obHpgSDJXF
	5eMZMCiDBkTSjlODFneHJLOvWQ6b2uyLwbAp3mZLST2tn+0QOKN7X7p+1C3C3Xm+
	0BCn8y2RN8cp9h+xj63vr643E2Aj6WdDsYytbANcGS65sYgfV0E5p94w1tFKFr5U
	egMZpiUUuvayJsDNltkc/I+Vn8mJjnvSwH37BTkKWXZ1z5tBuC540CX4VoQpnmAY
	kPsQ4zJ3WZcRLws4mg9frJKbeRszUJU1MAw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtksm2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Jul 2025 21:25:40 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 568LPb9w000876;
	Tue, 8 Jul 2025 21:25:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 47pw4kvamb-1;
	Tue, 08 Jul 2025 21:25:37 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 568LPbvF000867;
	Tue, 8 Jul 2025 21:25:37 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 568LPbha000866;
	Tue, 08 Jul 2025 21:25:37 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 6575557186F; Wed,  9 Jul 2025 02:55:36 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V3 0/3] ufs: ufs-qcom: Align programming sequence as per HW spec
Date: Wed,  9 Jul 2025 02:55:31 +0530
Message-ID: <20250708212534.20910-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.48.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE4MyBTYWx0ZWRfX8QnN1fdPQZda
 tHoFJVeRB/3W8vikz2FVzru+7hrG+fC+/Lz3JL+WSRyHOfYzm3r2ozfdNIYvtDEfP+0I2ilOpeK
 a73ZDteQx+TQcgeqButVE+rE8ZeX2APhi00G6vG0JmOJvFrhWQFdVKVfSjmPLgkxQg/dJbs+vlt
 9YW8RrY2DmlN6koorvfdR8zFOBwM7wCanzsHLgA4y/4EtppHBrqy8bYbAUZ8PMmoyrfR/etfwV0
 5r6PYFpP3kgr2ibLDuOf8p7MfMWmeLsd3ffSVfWzy9RhY/PmOrevR0HhiqmKqtcGffDVylveDAj
 4aFYHcLcJtBZNs2bjB03HOwJzEqjmTabtWFcOXvGo5yUNyAKLwV7DW/bTxw7dp0D1Aw1tcckRDM
 DlRaQmTIjdXOcCCioMEbSsclvMjfg0qnEyAWahO+I3HNl0ZSrkv8owfnQxz/FsqXJsjfP9xy
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=686d8cd5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=iRjbf9KB49bWgsSTYZMA:9
X-Proofpoint-ORIG-GUID: N_wlCF2DApIGwNsBdYtPD9tWnYU_aiJw
X-Proofpoint-GUID: N_wlCF2DApIGwNsBdYtPD9tWnYU_aiJw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_06,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=759 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507080183

This patch series adds programming support for Qualcomm UFS
to align with Hardware Specification.

In this patch series below changes are taken care.

1. Enable QUnipro Internal Clock Gating
2. Update esi_vec_mask for HW major version >= 6

Changes from v2:
1. Addressed bart's and Mani's comment to move ufshcd_dme_rmw
   to ufshcd.c
2. Addressed Mani's and bart's comment to avoid initialisation
   of cfg.
3. Addressed Mani's comment to update commit text.

Changes from v1:
1. Moved ufshcd_dme_rmw to ufshcd.h as per avri's comment.

Bao D. Nguyen (1):
  ufs: ufs-qcom: Update esi_vec_mask for HW major version >= 6

Nitin Rawat (2):
  scsi: ufs: core: Add ufshcd_dme_rmw to modify DME attributes
  ufs: ufs-qcom: Enable QUnipro Internal Clock Gating

 drivers/ufs/core/ufshcd.c   | 24 ++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 24 ++++++++++++++++++++++--
 drivers/ufs/host/ufs-qcom.h |  9 +++++++++
 include/ufs/ufshcd.h        |  1 +
 4 files changed, 56 insertions(+), 2 deletions(-)

--
2.48.1


