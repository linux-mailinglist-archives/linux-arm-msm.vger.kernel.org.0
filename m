Return-Path: <linux-arm-msm+bounces-53032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58775A78DA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:59:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B62AB1886163
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 12:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE01238143;
	Wed,  2 Apr 2025 11:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n8H+C9zY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58418235BFB;
	Wed,  2 Apr 2025 11:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743595189; cv=none; b=KeGQ8iXRDRPGlGLTpsNWzbvutZ1eE36BRDPMNptAyJWnFRpZJQDxKtlq3XuFvcczOb4ePIRvKhPw4JpvtzPibitkvfnuLfpa1M6uuD9baf8KXCMW3wPIPe0/HG7ZrbBIW5DALYBuIuDN8pw7FFyXXXjE6strz8uyrpTU2p51p6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743595189; c=relaxed/simple;
	bh=8dl7ISQ+eM000+lZIQEPv+hiZRsdlSbP98vxWvDTalc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JZZNdmrm+3nSK/sA6aLhYE9uYK61WyTnejvq6KbRAuAUysEuCj49rJdhHw2wqDRdLA47l6fkfs31YKelkMh8OTePP7Gd2r5BcUDda8TMWi9ZypbA9UhsrYtRnZkLwH4lZdwiyIZUAfSt0RFdjAGzhzK7481//g+G7XVzFVKBxNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n8H+C9zY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532AtCja032650;
	Wed, 2 Apr 2025 11:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=n+iodew5GmsQ4lOHSz2keCNpjNVT3ejieh7tZZjFLp0=; b=n8
	H+C9zY9aRX0pxmQs5UXKwjxo6U0zedV/Zh6ZotzySXJZ64PXFHoWvEOUqdYfjmNw
	jmEr1EtVHtyYV85RZ0QgKv1RdlzbLX6WNrjJ+fIXFe7GBY59rwTijepKdFFqssz+
	wI7o9Xn1rh1MPMPt0tRZErgH09FE5k2p/qRa1njnVAZfIiNXc8EupkAjJ0CtPv2S
	fog9aYA/qNu48zAjs/jX28MZVrzO0msOHvboHLB9eDomosciG4tt22uxYEob72fe
	Kz94bbyZBQm77/4zg9XJh3j0UZ3qPEiMqr0j4I9DugHNIPW313z4jYXiY28XdoTW
	6V04TF3rDl+yR+jxYEgw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p67qkm2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Apr 2025 11:59:43 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 532Bxg5b012802
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Apr 2025 11:59:42 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 2 Apr 2025 04:59:39 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_rampraka@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nguyenb@quicinc.com>
Subject: [PATCH V5 0/3] scsi: ufs-qcom: Enable Hibern8, MCQ, and Testbus registers Dump
Date: Wed, 2 Apr 2025 17:29:19 +0530
Message-ID: <20250402115922.27874-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fMI53Yae c=1 sm=1 tr=0 ts=67ed26af cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=pyQEGUW01KN_hzJh80EA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8yRP_j5TW9CB5zVMQSrRaegCucJ6i0sz
X-Proofpoint-GUID: 8yRP_j5TW9CB5zVMQSrRaegCucJ6i0sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_04,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=335 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020075

Adding support to enhance the debugging capabilities of the Qualcomm UFS
Host Controller, including HW and SW Hibern8 counts, MCQ registers, and
testbus registers dump.
---
Changes in v5:
- Addressed Mani's comment and used cond_resched() instead of usleep().
Changes in v4:
- Addressed Mani's comment and used kmalloc_array() for testbus mem allocation.
- Removed usleep_range from ufs_qcom_dump_testbus.
- Updated commit text.
Changes in v3:
- Addressed Bart's comment and Annotated the 'testbus' declaration with __free.
- Converted the switch-statements into an array lookup.
- Introduced struct testbus_info{} for handling testbus switch-statements to an array lookup.
Changes in v2:
- Rebased patchsets.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20241025055054.23170-1-quic_mapa@quicinc.com/

---
Manish Pandey (3):
  scsi: ufs-qcom: Add support for dumping HW and SW hibern8 count
  scsi: ufs-qcom: Add support to dump MCQ registers
  scsi: ufs-qcom: Add support to dump testbus registers

 drivers/ufs/host/ufs-qcom.c | 119 ++++++++++++++++++++++++++++++++++++
 drivers/ufs/host/ufs-qcom.h |  11 ++++
 2 files changed, 130 insertions(+)

-- 
2.17.1


