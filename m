Return-Path: <linux-arm-msm+bounces-38795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 483DC9D5B6A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 10:00:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1787B213F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2024 09:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977931D79BB;
	Fri, 22 Nov 2024 09:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XxP++Y0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8E21D63F8;
	Fri, 22 Nov 2024 09:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732266015; cv=none; b=EFfiblY6nQkz4PEpwsZn8theaWDxC1x4oImMah1iVIqPUR+OZVYn0Tu2of1Q7SBHPKGcFYHfFxvLCz78hntG87IlyvH1AD58t6N/Z+94snEdUSyNuLkK71M7rjquA2DVn1sBmbcCix1cn9hQjnvvLP1olrEl/rM5flCu9LJPSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732266015; c=relaxed/simple;
	bh=uJh3B3S70+J1nrMKYJfnBrzbcGwPWn4bd39sZBMftPA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=uzcxNZeMgSLcdYSV3V+mebhqduxA9svvVRbH77P2oAaAbUEa3PXSbjcZEKbHtfNTPqVagFOG1p7rGpyAp8zYKSQBfQNpwGiI5ZAnWbLmIcHbwj6P58kmqFk7fO+sYIIBP3ndNWTRu+qo1rd4nxXwpV6OZbEUp2JlD7+dYszIsl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XxP++Y0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM4WVnM019747;
	Fri, 22 Nov 2024 08:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V+HCme4EtitAVLS3Z1HOd4
	JRzmtvtNlpepGHbbLHDuw=; b=XxP++Y0HoBKgsXgoE0dy/BP7MT7AXugpBu8Yx2
	NE824ga3hJQE3qfYKmkaNgk9i8/tEidVXiVoDlvcvL2YEWTYEC3Yo41nTU77s+Zq
	nOg8HU7uAEwXYS8E8f73a6ai1Q1jOen5BryW1a0SPBPeVgkKpxXDAxdflE6eLYoM
	gvPwL/CXoirm0l4tCG6FNjbr7D3lgAgEXnrZA3/12PHDQSlr2kHBn1ajcF8gp7c9
	9WBX01V3365J4pBlbpbmjvUPCyAckoFHRDRIqZv8j9nCemERCb9IsJXcyhuxyoZu
	Qilzpd7TCQqiHbCTAUmQH0HbKI/h2sLyeHp+6RILPYurAOeQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4326atagy6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:59:55 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM8xsMn006462
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:59:54 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 00:59:50 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
Subject: [PATCH v2 0/3] QPIC v2 fixes for SDX75
Date: Fri, 22 Nov 2024 14:29:30 +0530
Message-ID: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XMiQSuBQRnaBtd-RX6aLVjPL1xzi6IvI
X-Proofpoint-GUID: XMiQSuBQRnaBtd-RX6aLVjPL1xzi6IvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1011 mlxlogscore=999 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220075

v2:
 * Updated commit message
 * Added stable kernel tag
 * Added Fixes tag
 * Renamed the variable from offset_from_qpic to nandc_offset
 * Set buf_count to 512 in the parameter page read
 * Replaced the buf_count value of 512 with the len in bytes 

v1:
 * These patches will fix the following:
 * 1) onfi param page read which was broken by exec_op() patch.
 * 2) Fixed offset passed to BAM from QPIC base

Md Sadre Alam (3):
  mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
  mtd: rawnand: qcom: Fix onfi param page read
  mtd: rawnand: qcom: Fix read len for onfi param page

 drivers/mtd/nand/raw/qcom_nandc.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


