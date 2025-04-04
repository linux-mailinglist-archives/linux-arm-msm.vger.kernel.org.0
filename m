Return-Path: <linux-arm-msm+bounces-53253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56C8A7C2C6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 19:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97A887A5714
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4BE21E0BB;
	Fri,  4 Apr 2025 17:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pWIoFmBF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A9F1494A6;
	Fri,  4 Apr 2025 17:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743788803; cv=none; b=IeViGuWTMcDLi9M2v2qVXVl3q6BZ31UcP7CiVU0+LowyWyIyUC4hQNodNN2am0fwfKE6dKXWvSj8cgIUXdvZyfpyk9sBr1bzOjhmhqFt7jj7UeZvowxCjffEoAbvDvbFViVX2uxpKYytL+0faxsQq0nYjHALK2zqu1iEGB0SHqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743788803; c=relaxed/simple;
	bh=A1RS/ZLQvyWYXSBeXfOQWDFm91fESjPToqYZ6ozV5wQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oWvrSDhcrd/u5JnXRXSj4LKTI/wyIPzL0jCA7/+XSOCGzFoXn/NFYbnA0hjekZLdit55au96bK/okcqY5Ua/HsV+78jbhvihoc/lnaEKeecjWWkbQPVWDnbFvoF202LRL5BkfcrvOYr8sFTieEMQBYUrSn3tKJE90qkf+1A4kRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pWIoFmBF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534ErsvH000647;
	Fri, 4 Apr 2025 17:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vUrzjeI0IFDrH2kZ9T0JJU
	uyHYMtEg/fuvNTDAM4uOw=; b=pWIoFmBFQtapqtmt179owvNe0/uS2sva1RotBS
	oGUM8T+g9hr9WOZ3mH42yDgaEw4/hO6SqWYF3Q4m3sgf2GE69mfmIPTbghUdW8Jw
	Qt4c+d5V22ovuJw3qKdLLcXKyoURWSpcheDNtM6hCuJZvYxMzAzaAcdueujjoGqL
	MR7hMda9YQT/c0itc9nttBpbNRnbps1ws0Unz77xz08lAgF5AfuMKBKx3tYk3Elv
	zddtolCPt8Nxv44rby0FKajsIlk5ox1KY1pjwVTZlLHzGPH12XMRut+yFjj9a5qL
	7yiRoRU7RvWx4WVg9KD81Eq0Jrrrw3Q9/4+zntdr5mRxTElA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d8thjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 17:46:20 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 534HkJeu029913
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Apr 2025 17:46:19 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 4 Apr 2025 10:46:15 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K.
 Petersen" <martin.petersen@oracle.com>,
        Manivannan Sadhasivam
	<manivannan.sadhasivam@linaro.org>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_nitirawa@quicinc.com>, <quic_bhaskarv@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_mapa@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V2 0/2] scsi: ufs: Implement Quirks for Samsung UFS Devices
Date: Fri, 4 Apr 2025 23:15:37 +0530
Message-ID: <20250404174539.28707-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=KcPSsRYD c=1 sm=1 tr=0 ts=67f01aec cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=zgQ-T9pl9kVSWeUe3YwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: VZlWfoZ4QDkyoVvMaupEz9TIjuobClmF
X-Proofpoint-ORIG-GUID: VZlWfoZ4QDkyoVvMaupEz9TIjuobClmF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=826 mlxscore=0
 suspectscore=0 clxscore=1011 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504040122

Introduce quirks for Samsung UFS devices to modify the PA TX HSG1 sync
length and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.

Additionally, Samsung UFS devices require extra time in hibern8 mode
before exiting, beyond the standard handshaking phase between the host
and device. Introduce a quirk to increase the PA_HIBERN8TIME parameter
by 100 µs to ensure a proper hibernation process.
---
Changes in V2
- Split patches to add PA_HIBERN8TIME quirk in ufshcd.c

---
Manish Pandey (2):
  ufs: qcom: Add quirks for Samsung UFS devices
  scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices

 drivers/ufs/core/ufshcd.c   | 31 ++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 18 ++++++++++++++++
 include/ufs/ufs_quirks.h    |  6 ++++++
 4 files changed, 98 insertions(+)

-- 
2.17.1


