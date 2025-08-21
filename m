Return-Path: <linux-arm-msm+bounces-70207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF609B2FFB1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96D243A8EEF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0AC7296BB4;
	Thu, 21 Aug 2025 16:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KTtiLgJp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B192E1F1F;
	Thu, 21 Aug 2025 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792389; cv=none; b=kxtvvPVyo+gv6N4w7F/cyEJOvccaosHYu1k5b8ESFjrvFuYz5UDByOCkfPV6tCOB/tQQj8UdJnvlYcT4pTHWoYOb0YPrZgo4bCqOqP0RTY3qxEAzm2leXcG5WYpzRm1xaXk9HdqSB3nct8m+YEKNpaoOGefv8Onq3mBPvIo3mjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792389; c=relaxed/simple;
	bh=FODxZJDqJiA51SCHFlE8Dkqdeu9T2hXHsHMBvAWxsDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AG0Z3B+CmEbSifooGngtBa8BRpiy7Me2i58Hxmm+Umfm/wIIGsFvukV3XX1CzeRE9iWO+REBIfkgXuniggGbNiFx+B6o4qw2AQouPphA5ZXl9xFVjJxKGIKXWyIl4QZtzSqVscg7ZkRhtJWZanIlaobQ7igL79DsW/VGz66MQlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KTtiLgJp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b9l7015180;
	Thu, 21 Aug 2025 16:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tykzyocvn1o
	rj3e0lDZzBWkkTCtVyWLXJWIpc3wUvr8=; b=KTtiLgJpEy4tJm38rskl6GNrdPl
	EBPmoZ7/sYI+saQCgU+19UpomZeCKS0rRbrcHVWrytJ+MeYEoVcfAuBFpErjbk3K
	PwYcVe/PpPXrv0+mCcIJ5EopvoSDsomCNVaLBlrzNRvuu7HIHOqOHiQNERkerGGu
	fhdCHVyptmjxGLttrJ/aXxofV1yVjeC08VHFmZtnWAvEHZRNw1gBeh3yJHVI0TDR
	DHBOVm+fpq7k2XHSi5IDPOQJwO/Yn8b9MsXh1CP4MYDuFbKt0sV3Ir5iwLSjnTKV
	v1WTUC8w3gND4JPOIublCt0gonZNYFCq9l4Gy2KvOcmNACHNDNz6eNWRkdQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52cp27s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:06:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57LG6LCU004073;
	Thu, 21 Aug 2025 16:06:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48jk2m3g9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:06:21 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57LG6LsV004062;
	Thu, 21 Aug 2025 16:06:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 57LG6LTH004059
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:06:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 5721D517; Thu, 21 Aug 2025 21:36:20 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 1/1] soc: qcom: pd-mapper: Add SM8750 compatible
Date: Thu, 21 Aug 2025 21:36:18 +0530
Message-Id: <20250821160618.1037157-2-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250821160618.1037157-1-quic_pkumpatl@quicinc.com>
References: <20250821160618.1037157-1-quic_pkumpatl@quicinc.com>
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
X-Proofpoint-GUID: TqcjZNjORkNsBWecgP67mpVM_xzUoODX
X-Proofpoint-ORIG-GUID: TqcjZNjORkNsBWecgP67mpVM_xzUoODX
X-Authority-Analysis: v=2.4 cv=Xpij+VF9 c=1 sm=1 tr=0 ts=68a74402 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=G6_dLcO6j6K2A5EbCMUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1f+O+trvSwbk
 cBG7+w2j5OUdwEFucCOw0koIN4XR98b7hKNAdGBr8xUoFXBXt9qFbu8bqHzgM8OA0NUk80wPdPu
 dlkH3z4iXGUeyNts5ppl5vhYDickD1jB6wp+dmzo+LxKsCVCbE4UBo1zW9P5MoRoXGcF16NHL+U
 ObNNGsd1Et0QpTR+8Yqcqod9ysv5a2uLCT/KCtLaKm+waKu04YFDn869dB0MAqRzMNCP8yWJpeM
 cg5t6qxMapDtEPZLGm2Q4E6CCU2kqftaRYb/lAPdZzx3idPhXqHNHkpMv0CqXSJ2RGJDlUcLqc4
 uSuRpRF64OJomEgjKWXk4neKV0GiiJqhW0joq/qZkeC8Wp9bpu0PNKVx2aMCyP5/KCNJRp0RSKC
 0WxgRdbZa4cDboMelgqetXapZYNxUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Add support for the Qualcomm SM8750 SoC to the protection
domain mapper. SM8750 shares the same protection domain
configuration as SM8550, so reuse the existing SM8550 domain data.

Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index 3abea241b1c4..6384f271953d 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -584,6 +584,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,sm8450", .data = sm8350_domains, },
 	{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
 	{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
+	{ .compatible = "qcom,sm8750", .data = sm8550_domains, },
 	{ .compatible = "qcom,x1e80100", .data = x1e80100_domains, },
 	{ .compatible = "qcom,x1p42100", .data = x1e80100_domains, },
 	{},
-- 
2.34.1


