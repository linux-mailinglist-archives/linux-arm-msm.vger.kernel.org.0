Return-Path: <linux-arm-msm+bounces-29118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5BC958726
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:38:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8B99B2623D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F76818FDA6;
	Tue, 20 Aug 2024 12:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="R98REy0Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D7218DF6D;
	Tue, 20 Aug 2024 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157497; cv=none; b=mmbePfFqJ9bRew1oV812+oEIE7W2Q7WO0ZF+f4Ux6wPk/yOgQBweYQjU3qGbu7HTD+7KnTj4/d0O3bIvm5zI9tAAFehx+aCI7gf+ouV5i2NrRI601m9wcrkWFnjPmA4cWR6qaH0ix4JqgAkVp6NYzz2XdWbx5Sqarkl9dBhTQXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157497; c=relaxed/simple;
	bh=T7JeElks4KwNEKUxGtylNRRei+Nz5gngPjYedc/JX/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CsVIOJ0anSSocgQh0VZtzhoRdcGHRIBJUuU6MW4YEyv3RHy9bNUSL0uuGSQ5jfsqmY84OQveDIHHHLago2TpiXIZMeZJSPwAWN4mOYqRCTurn5CKYFy2HRvDLYD+Jb3Dp/NinuD99jihP1jAq7wH2g6TQcdxI+tGaf80nBZhIuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=R98REy0Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K8u6js017889;
	Tue, 20 Aug 2024 12:38:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=Rn4qoctOvER1BPekPOutMAUiBV+J40qY9OvEGWOt9TI=; b=R9
	8REy0Z7QCWUOJGCIsVXSd1TRlIfwFUzVoDGuTnamKeitJSM8MlPtEINFsDACh3hh
	wGNbSHnBnGH3bEwwyZKId4nxX9303yQe4TSBZ0BDg8YRbOd0E1G1mxhzbh8EVxhr
	M8QWomZC0kjP/frNbnIbeDBAd4f34Fxq4lniG+wkuRwtIODHRlynOpOx31insF0T
	ehdkfbgjM2HmWHXezEsm9qguD8Bne8YEVVC2l0NwWZRA4ACHBohtltSP9k1zz46c
	7eE0G9ITVQxl02+4VtOSyZSxCqjjZzmYqP0motri19RDRyn1+m3VuM1vbuzA3vrV
	DlRO/lPPTg3s0bmIdWGQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4145ywbhue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KCcAH8010089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:10 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 05:38:06 -0700
From: Manish Pandey <quic_mapa@quicinc.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_bhaskarv@quicinc.com>, <quic_narepall@quicinc.com>,
        <quic_rampraka@quicinc.com>
Subject: [PATCH 0/3] add fixup_dev_quirks vops for ufs-qcom
Date: Tue, 20 Aug 2024 18:07:53 +0530
Message-ID: <20240820123756.24590-1-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g2Vycw4L0xpLUDqmC800La0_MZPS8pfE
X-Proofpoint-GUID: g2Vycw4L0xpLUDqmC800La0_MZPS8pfE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=413
 bulkscore=0 phishscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408200093

Add fixup_dev_quirk vops in QCOM UFS platforms and provide
an initial vendor-specific device quirk table.

Micron and Skhynix UFS device needs DELAY_BEFORE_LPM quirk to have a delay
before VCC is powered off. So add Micron and Skhynix vendors ID and this
quirk for both.

Toshiba UFS devices require delay after VCC power rail is turned-off in QCOM
platforms. Hence add Toshiba vendor ID and DELAY_AFTER_LPM quirk for Toshiba
UFS devices in QCOM platforms.

Manish Pandey (3):
  scsi: ufs: ufs-qcom: add fixup_dev_quirks vops
  scsi: ufs: ufs-qcom: Add DELAY_BEFORE_LPM quirk for Micron and Skhynix
  scsi: ufs: ufs-qcom: Apply DELAY_AFTER_LPM quirk for Toshiba devices

 drivers/ufs/host/ufs-qcom.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.17.1


