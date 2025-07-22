Return-Path: <linux-arm-msm+bounces-66144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 672DEB0E167
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 18:12:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B17C5621A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A7027D776;
	Tue, 22 Jul 2025 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M7Uf0uH7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6D927AC3C;
	Tue, 22 Jul 2025 16:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753200736; cv=none; b=qK58ICuTkFnPPpHM9c9Ve1UVj815aozcSLXZDCTF+p831bY/GNaGqJQ8KyOmX45bDFuTwOdVolY76FrkcT0aWHohdLU/EA0rITAm1JNgQIDPbtB6aZHov3xtuQdI/Eb13/36h2b1C06NgxhlDsl+sywPRqUOQz0vF07DYRLtwyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753200736; c=relaxed/simple;
	bh=gqE9akrcTQLmBGXEPjMyaqrh0buo6nROJHb/arvrtgc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XEfOapdGdfsLuoXH3qflF9cX1A9IACRrSeVY7tFlc3L1/v6mjfSFjAPNr8I31+2WVm06L7pcwJAOdgDJkan3m8Fb9wnkiSxXUJ1OPY3UgKaRoB44FoOkSSAVbtR7mTP/XXkogydDJJsYXxNIlOKP1dbN54A1DfjM9vMnMAG3qbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M7Uf0uH7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEWNGQ018251;
	Tue, 22 Jul 2025 16:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PqUX0Q1pPArlKrYsn9yFtC
	IatEN0VFo0SDEd/0ZFp9k=; b=M7Uf0uH74eXPSXg7gqbIjwKLsgOdf/44ogDGdX
	YI92P2IudtdzEfxz+WSGnh+TcfzgROocGyHkNkyXo9cy8g/z3TApr53D+MzIHtDA
	CER/KBR00JAG0zaKiCoeUD4ykuqojMLjw3Vsm/DKQe3gEhjs/D01+Ch9XhALrcGf
	gi8m3sNAWsGUsJfK76GAd/k74dfoEFwGzQT3QStgByZ4Z9g43dZnWLyb1N4Qs7yv
	oUEPt26ahwZTJ9FAqH8avFhD7QAlkt7wqttEDSc/Fh8Y5ifTYcUHgxbVSjjcIG+A
	ultQUKfHZ+15miBOKZkB2ekksYSE5tgdBTPLlmv2brUhL3TA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na0gv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:19 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56MGBJhf018485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 16:11:19 GMT
Received: from hu-rdwivedi-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 22 Jul 2025 09:11:14 -0700
From: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
To: <mani@kernel.org>, <alim.akhtar@samsung.com>, <avri.altman@wdc.com>,
        <bvanassche@acm.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <James.Bottomley@HansenPartnership.com>,
        <martin.petersen@oracle.com>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 0/3] Add DT-based gear and rate limiting support
Date: Tue, 22 Jul 2025 21:41:00 +0530
Message-ID: <20250722161103.3938-1-quic_rdwivedi@quicinc.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dTs-IxOs5iupgzl39bDIfZsqYA_sen1A
X-Proofpoint-ORIG-GUID: dTs-IxOs5iupgzl39bDIfZsqYA_sen1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEzNCBTYWx0ZWRfXzdbo8nyt63ie
 T3pw0Gvo3cP4BDEWVNvBwOkgLw4BqtLSvsL3ojR2VvHBC91CsqbdI7IdmaZ0TXxCVAY2wjpY8VZ
 8iKvDgGOAwZ1zE7tx4nQMkEWDoHxYvyaoKM95CAjPSgwFu3TI2999qvVx+91mhKS/hFTUEGHKFb
 qH1xyN+Wn9wLfaK/+CsMZTotZbdRrY4LCGm8H3ClqLezTDhzv48y/kZjnc4bZa05aY7c+2zhGy3
 86Yd0gvo2+98NUe3KgisP8BoD6TscAOBWzpUNahuJ1RnP2yDUSIX9rF3WABdOZSLK8DtrX6pb2E
 zmZaEyjejzOdda4rrC9HIYtuHOwx+mUoF15YfOazHWu+Y7VyrijFghd20PIHavzPef1T374ezbR
 b0YgomVP6Pr71KOl4/EuCMyIR4cSBScdVSkg6BV3LkiX39aCWj4r6hXH4joGhaGfmI55EgaE
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=687fb827 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=Uq_XN3muvx71_ABf9fcA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 mlxscore=0 mlxlogscore=999
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220134

This patch series adds support for limiting the maximum high-speed
gear and rate used by the UFS controller on Qualcomm platforms via
device tree.

Some automotive platforms, such as SA8155, require restricting the
maximum gear or rate due to hardware limitations. To support this,
the driver is extended to parse two new optional DT properties and
apply them during initialization. The default behavior remains
unchanged if these properties are not specified.

Ram Kumar Dwivedi (3):
  scsi: ufs: qcom: Add support for DT-based gear and rate limiting
  arm64: dts: qcom: sa8155: Add gear and rate limit properties to UFS
  dt-bindings: ufs: qcom: Document HS gear and rate limit properties

 .../devicetree/bindings/ufs/qcom,ufs.yaml     | 10 +++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |  3 ++
 drivers/ufs/host/ufs-qcom.c                   | 29 +++++++++++++++----
 3 files changed, 36 insertions(+), 6 deletions(-)

-- 
2.50.1


