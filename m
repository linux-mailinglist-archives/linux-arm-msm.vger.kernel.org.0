Return-Path: <linux-arm-msm+bounces-64771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76FD0B03863
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 09:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F85A7A504F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jul 2025 07:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D93922367DF;
	Mon, 14 Jul 2025 07:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U17ll3+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F86A233D7B;
	Mon, 14 Jul 2025 07:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752479658; cv=none; b=CABZXCnLEs+w6p1AXRW7UAoHz9W8/sube2EubNg+5LE6uNhNsOgYzMITaNl6twI7qE6J6ANKG6h8dLH9XYfZRr72Pv/CDFPAitSnVa5edIEVjmnfKY4ER6dlNB5prCau2NyjfJGS2XSxjS8ZdBlkeh9fwcW2KmHoVOpfws4i3cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752479658; c=relaxed/simple;
	bh=ArXK7fwhqd/k/vkL3Djwk9plaoLNDr2VABED9gF2qko=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=euyYv6+OmF9fW4TvonGHiihS37GXU0dUT6rRu07Jwbu6PQo57Xyv4Ew48ecIieOmjAyUCHm7mBiCB1eaj2qfsx4l18TEcy11eceN6WDf9GoP2rab4R8MkaIghVVXIYSr4nEgBBsEkeX5lPcD9tyQWRIqNzdc8vl1m7fJdmHiabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=U17ll3+G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56E66cka003143;
	Mon, 14 Jul 2025 07:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=w1cu5+CvfeaYMXZX5dUfrnHv+myEhKma5M1
	DvwKd2jg=; b=U17ll3+G38VZYKs6+CdVrYxhgLYNTzlWYijskKYBtEq6y4rvzTh
	Z4DranJudVE6Y3CK9JMzX0GauhBwfNadoYtDGp2yEFD5bNBTazKZmNvr/dxx4wZi
	JkFWfA8RiEAqXnJQrk5Qt02YXFYgW+mY1D2/78/0SJf+SUgyKsUnEWap8d2zOjrp
	1XvmX9Hq14kFuY+TCnCM51dgbhvGF+o0tyLscxeUFph/4QKAFLRfCH/f9I3WNgRG
	PxPxdFRtrXDZVgQLN28UhnwCY/TVBrdEGYNJ1RHK2WElIiVCO52a5Pypvm9CHdW0
	sRtE5Jcv8icngBKaObxriiyBjuU52p6R8VQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47vvb0ra77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Jul 2025 07:53:41 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56E7rcsZ007487;
	Mon, 14 Jul 2025 07:53:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 47ugskv3s6-1;
	Mon, 14 Jul 2025 07:53:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56E7rcux007481;
	Mon, 14 Jul 2025 07:53:38 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 56E7rbr4007480;
	Mon, 14 Jul 2025 07:53:38 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id 30CC557165B; Mon, 14 Jul 2025 13:23:37 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: mani@kernel.org, James.Bottomley@HansenPartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, avri.altman@wdc.com,
        ebiggers@google.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: [PATCH V5 0/3] ufs: ufs-qcom: Align programming sequence as per HW spec
Date: Mon, 14 Jul 2025 13:23:33 +0530
Message-ID: <20250714075336.2133-1-quic_nitirawa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YL7Rvn9Wj0MjdaJpZBAluzeWUTv5GwSe
X-Authority-Analysis: v=2.4 cv=B8e50PtM c=1 sm=1 tr=0 ts=6874b785 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=iRjbf9KB49bWgsSTYZMA:9
X-Proofpoint-GUID: YL7Rvn9Wj0MjdaJpZBAluzeWUTv5GwSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDA0NSBTYWx0ZWRfX9Vex0Tj0NGxP
 tF2WzlFjcS/+zQM8IOjvz1JAbS2goQeGRDRQ3voSpqNC0VS5+HlTsigfDVRZ4llxBdWUt4visVA
 YKtK08hVbOdCKqSz6BQjvYIJ98CfJ0W4jQ26C6y1j5LF6exX8aAtj98zUxSUgdk90Wo7qyrQoUz
 yix1NnKVhNGTGBK1D4Pm/jhKqHn/6EtV/0/EbAQsk18WQe62K0rc1kGCqFAumNUcwtOA7pkn/Lu
 98spwyQw2POONOyl7ysq2tzkQLvI97zBJe4TBCedMj2EXXojFWf0NbO1XZ7dLC+oPh8RlH9UPnX
 Guuhfi5PGuZKtvHNBbyAVAeAH4hypCw0ffjVgp9CZoiADS0mTLwNmEeozJrp4kBFpMDSPMT1DNT
 kMFMOVGKTYS5lG5p5wNz0Of2vGv4zxvmesyd8VAA62Xzyk7XRNYp5X0PhTpl/XX+qB6+eW+P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=714 bulkscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140045

This patch series adds programming support for Qualcomm UFS
to align with Hardware Specification.

In this patch series below changes are taken care.

1. Enable QUnipro Internal Clock Gating
2. Update esi_vec_mask for HW major version >= 6

Changes from v4:
1. Addressed konrad comment to remove Reported-by: kernel test
   robot tag.

Changes from v3:
1. Updated the kernel-doc comment for function ufshcd_dme_rmw
   to include descriptions for all parameters to fix compilation
   warning (W=1).

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


