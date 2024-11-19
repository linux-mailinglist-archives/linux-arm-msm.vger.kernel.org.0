Return-Path: <linux-arm-msm+bounces-38291-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEE79D225D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 10:21:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5407F281FA9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 09:21:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AF52198E77;
	Tue, 19 Nov 2024 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Zejrvb94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B566B13FD83;
	Tue, 19 Nov 2024 09:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732008102; cv=none; b=qIpwZGRDOLregZRmrR06eFAAD5aRge4hBXthZq5Lyseh9ascFAIhakQnUYv6l+YKtSvRseShg25Xk52ZNeVX3vOOGSDF2Mi2Ox/h8RMymZs7c/8RtW4Gszerl/YPkPu+JV9j1ANqDcHzY0yFJ3JIY2CBqUKyTVjykgxq4wbPUdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732008102; c=relaxed/simple;
	bh=hv2VA0WclhBnrnAjI1v1yhoLgYRSQyHsG8IvWBVmqB4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=K06j9VmLFQlWzEYHyawuLqDTTCFdD8jSwW87nwQpvAMhTleW/c9omXidOEq8jD1cTi6KbWteKoECpV+wF8dkmNTu52LoMR4ktfyByJDc70XmArD/Yzum/+y3Nc6C5/5/X/Vms6peyqqekVkOFA2PVsdwhPSXutlaQoGUv55/fS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Zejrvb94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJ7F8FI004708;
	Tue, 19 Nov 2024 09:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BM/vYOPtFIg6lICyqBL4ZR
	26RlC4Jn1npyuN2f43SgI=; b=Zejrvb94+5fVehP5ziXVSRiQLpj0AMgWT+mKsx
	Culy6LSQHhKCv16OSye5uMoY4a43gA0f2CD6Ryx69Q3kfHYVOqzWvYEgRGLUEjZ/
	Ol/UKRgj0klwOFq4MWdlz/2YGCeywCMGm/megkHZ7nNxH9duV7Os3WUTqBdx3yN3
	ZDQo80fJWMtCLD9hOMLPXlfqjakh4/DoA8v0DpyYu4pl5seLrM/cU0AYDsXacwiq
	czYRnfaienQp7fg9dsSAtX5bDKOiTgvb/8Hv4y8QyKIPtZCfpwNNi8YsJFpmJZm+
	C9Dm+CXcIhoQDmzJyGCO8k4B5sYIVv/F/ozoNeEF7HElS8/g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y7t1m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:22 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ9LLdI011298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 09:21:21 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 19 Nov 2024 01:21:18 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH 0/2] QPIC v2 fixes for SDX75
Date: Tue, 19 Nov 2024 14:50:56 +0530
Message-ID: <20241119092058.480363-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mTQF6_ZJw8fDetbnkEbODP2F8fIKLRo4
X-Proofpoint-ORIG-GUID: mTQF6_ZJw8fDetbnkEbODP2F8fIKLRo4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=933 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190066

These patches will fix the following:
 
1) onfi param page read which was broken by exec_op() patch.

2) Fixed offset passed to BAM from QPIC base


Md Sadre Alam (2):
  mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
  mtd: rawnand: qcom: Fix onfi param page read

 drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


