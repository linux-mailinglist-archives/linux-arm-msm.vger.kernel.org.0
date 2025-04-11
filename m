Return-Path: <linux-arm-msm+bounces-54020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33A73A85CD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D2A3B82C7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D49329AB11;
	Fri, 11 Apr 2025 12:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EIt7fq91"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A20215171;
	Fri, 11 Apr 2025 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373826; cv=none; b=aKVK9DiCiYJu3i8S/hw7VKcsMr3aNF6RHhoMQ1fSBfaeFon0Zfcc70VPsLKAZxfm5kUGOgjBSmViZdjSVfLO+N0ay43AH90m9Fs3EAOlDwYWcGgPUTInMPKO0M52lPIzThaQ7dA2KxxRxZhIGL5txoLcry41UtkpotTgJnvxBRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373826; c=relaxed/simple;
	bh=z9ZhKpMpicsOiTKk0wwvbvhR3LRnsWQ7cb0GED2/lLQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BOAsQ0E+yfKLvf344FDat5VHDR3rt96rYkQq6J205ezNL++6ZZGyI+QfCdLEdOa2yiBkT5TvvQUV+mVWXdjugdMukuHXHtLMTN7kRz9EOGb2u1aD59J8Nf6mJwnht+j2Xp2hH7GjUOQ2ZWe+X0QgkTzkbBHmUSpUc5sb3ZolGVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EIt7fq91; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5o5Ok016303;
	Fri, 11 Apr 2025 12:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IjHvVeg/jAKojs1i6T7ne4
	P4dNowktNVDMTOyyqocPY=; b=EIt7fq91Mr7nSRew64GcqmKEEE9J3jdVGM4id/
	trLDguYs8ehpzvR/51jNi+sZhTBmBXboRB5upjJcJFKmVWKknnK+HcPfDErZ/0SV
	qqssgjwfwwkGdaAMgJWOkOd17ZU4i8h6ZUrhwV6Z42jSlV+bzG49KISY0wwjkdt4
	IMF0GOfIni/T1r1CJeNCONdakKJUrwFsAA9icKo0UxMSsQJ7RMyfD8QcIpxScKiO
	RpMHThZqU1qqAw3voz9/lRrZu+0J11gRBxrHNlwhY3k2/BSsqHpxh7gS9gC8guve
	EW5GNyaLIzycXBtMy1iCcEWg5+4dsc2+fjLJJTeIjq1vDFIA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1t4yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:16:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53BCGhqH026623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 12:16:43 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 05:16:39 -0700
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
        <quic_rampraka@quicinc.com>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: [PATCH V3 0/2] scsi: ufs: Implement Quirks for Samsung UFS Devices
Date: Fri, 11 Apr 2025 17:46:28 +0530
Message-ID: <20250411121630.21330-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: FCFUee6RYJJLi1cvy38MBeAXQgj8eKQ4
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f9082c cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EGDPvhNCz0rwfrFvPGUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: FCFUee6RYJJLi1cvy38MBeAXQgj8eKQ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=934 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110078

Introduce quirks for Samsung UFS devices to modify the PA TX HSG1 sync
length and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.

Additionally, Samsung UFS devices require extra time in hibern8 mode
before exiting, beyond the standard handshaking phase between the host
and device. Introduce a quirk to increase the PA_HIBERN8TIME parameter
by 100 µs to ensure a proper hibernation process.
---
Changes in V3
- Addressed Mani's comment and updated commit message.
- used BIT macro in ufs-qcom.h to define quirks.
Changes in V2
- Split patches to add PA_HIBERN8TIME quirk in ufshcd.c

---
Manish Pandey (2):
  ufs: qcom: Add quirks for Samsung UFS devices
  scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices

 drivers/ufs/core/ufshcd.c   | 29 +++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h | 18 ++++++++++++++++
 include/ufs/ufs_quirks.h    |  6 ++++++
 4 files changed, 96 insertions(+)

-- 
2.17.1


