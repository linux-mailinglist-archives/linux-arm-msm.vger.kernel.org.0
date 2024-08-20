Return-Path: <linux-arm-msm+bounces-29120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9195872B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 14:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A743A283C40
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 12:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E87190477;
	Tue, 20 Aug 2024 12:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ks912CCU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAE218FDD7;
	Tue, 20 Aug 2024 12:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724157503; cv=none; b=Bb2eFwFxFtMw50wnFff/Ov6FmNUBA/vK35oErf4lBS5V0vNKtyLDaVHs1EpJgPPRNPsXz3QBvSZpLHrkpoLtj0+tMlwEcnBI/mfZ8PrXOIoWXEiZmgDsM+LzNmSBD+FghMq0BbmhWviAvZmInX8W3QZPJ242HupRJHrJGvr5mlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724157503; c=relaxed/simple;
	bh=4tB+bpa6BSnDoMsp4Vrm1W1lcew/66IKI3z+tiRGMU4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QERctkeOpmQX6llrZskmUfvrNEZPDzZLVBVAjGBs60gjMJEvRggIyRxJgrECZvAKjOp/SN1cUaxPdfKd8KVoTrs3XLTkM5fg9UyyeqvSg5S5jzmaFPkbBXh7XtXwr0hmEkhzlsMjSb/0eoplPuktHIPte0TkKAb/skVvc59NqUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ks912CCU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K7Bm4M019356;
	Tue, 20 Aug 2024 12:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ez0OPCW0kOXSp0CEWL2PbbKJ
	K/kWxGkc5PZszKXq744=; b=Ks912CCUv1GnNEeh4PMNTCKuzgjNlEWr9acXso5N
	s3Lpmcylp9YnkP+a/WCZA4DQOtDyVJ2rhHeDV/1q9yOuCBsIyXDFASvPxYJq3WjS
	izMA7nCNEuV8bNlowy1jguCYALMly3/5Hvi48VrGTWcBPe5OLyLw847mPHxKq7pf
	LP44/lOz/5aqyVQWvFNh63Ss+/0URUklmoT5JuzoHw/KbjlCcrvhlFJGespDFpgd
	sJtGwAOHvGduX0qQuH4XrL1EAey4YkPFMyky2bwslPdNIz5RDv+JxrDnc45EzxWl
	33idacOvJTcZmCD6/EfgeM5wf32krK3aEo4N82EYFumR2Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414phv90mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KCcIgE010664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 12:38:18 GMT
Received: from hu-mapa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 05:38:14 -0700
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
Subject: [PATCH 2/3] scsi: ufs: ufs-qcom: Add DELAY_BEFORE_LPM quirk for Micron and Skhynix
Date: Tue, 20 Aug 2024 18:07:55 +0530
Message-ID: <20240820123756.24590-3-quic_mapa@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240820123756.24590-1-quic_mapa@quicinc.com>
References: <20240820123756.24590-1-quic_mapa@quicinc.com>
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
X-Proofpoint-ORIG-GUID: vwkb-qN3Ze_wdmp8_DS43R_DTyg6m3CY
X-Proofpoint-GUID: vwkb-qN3Ze_wdmp8_DS43R_DTyg6m3CY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 mlxlogscore=803 spamscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200093

Micron and Skhynix UFS device needs DELAY_BEFORE_LPM quirk to have a
delay before VCC is powered off. So add Micron and SKHYNIX vendors ID
and this quirk for both devices in QCOM platforms.

Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
---
 drivers/ufs/host/ufs-qcom.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 290558843ca5..6d2622e79d3f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -836,6 +836,12 @@ static int ufs_qcom_apply_dev_quirks(struct ufs_hba *hba)
 
 static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 	/* add UFS device specific quirks */
+	{ .wmanufacturerid = UFS_VENDOR_MICRON,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
+	  .model = UFS_ANY_MODEL,
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
 	{}
 };
 
-- 
2.17.1


