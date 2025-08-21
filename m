Return-Path: <linux-arm-msm+bounces-70208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2503EB2FFAD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 18:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4ADA01888145
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 16:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01BD129A31C;
	Thu, 21 Aug 2025 16:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FOrqUx8y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F8B33F6;
	Thu, 21 Aug 2025 16:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755792389; cv=none; b=mcWQ3xd2Byr2nGwiDIc/IT3yecOuDCyAJWtGQrW5JKrLJo2Pk8AdFqSInl7RqEoMA/lZEEifv0o95FX5NIKUOgkOIBXptHgLQI2bGcFN31NxSK/WuWS65/8ZhpPk/B+Eyrp3ZfeBxAvYIXyhMwaVAw2Lp100FdCPzxQnczgoeco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755792389; c=relaxed/simple;
	bh=H5Gl/Dlk01UYvSZ7Pt0ZvOAvjpTDWYxvU1bVp68chnA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=LD5w/VD7rb0aK8A8fNcXa9SDDW8gVKyXSnFCO7Y6gSEF4j409KUlBFnH65RZlcepq10RxD/dW+dz5X1zcyY+agSRxGe4+vR/W8rG3uTMhOLmUwhTltLIRQEtRfDGGBi/IkmUFvsgJu4Bax/gpLOXF8e9mK11IlIr3zfKMM1J5/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FOrqUx8y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9bDbC006394;
	Thu, 21 Aug 2025 16:06:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vq/DxXBUblw0KRtCxEe9cXyEZGdVjJmne62
	pp8Qm2L0=; b=FOrqUx8yb2B0IuXZb1LPDXyq/jyj93CnQbqUVLHg/9v7+tIIb5u
	alVm5+KdTAIarLGj1WebZl7Z9vXvUHP+/tSjjgb+usBYlTi6Xekw6J/xqcSaqaDQ
	Ay6I5luLtfxTTNYfOdms7UVKFpvYUY7FyeE1mWhzheFndUddLnIY0VBWRm0swKKr
	P74iZckpYAS4OLRZa+rNK9LtEF66WnCHVNrlWPuY7KTNWV+r79qCoVeUaKoxvV2y
	PQ7h7joGuGAx05qOci71DrQa41vR75lsDAW7eyckHUoo9e85Paqi5cpn+XB4rM8L
	cffP1gBysN0q2zEMR1zQIZ+Rw6C+P1wC0dQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52962mh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:06:26 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 57LG6LhZ004072;
	Thu, 21 Aug 2025 16:06:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 48jk2m3g9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:06:21 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 57LG6L50004063;
	Thu, 21 Aug 2025 16:06:21 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 57LG6Lcl004060
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Aug 2025 16:06:21 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 54FE05C5; Thu, 21 Aug 2025 21:36:20 +0530 (+0530)
From: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_pkumpatl@quicinc.com, kernel@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com
Subject: [PATCH v1 0/1] Add SM8750 protection domain support
Date: Thu, 21 Aug 2025 21:36:17 +0530
Message-Id: <20250821160618.1037157-1-quic_pkumpatl@quicinc.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: wgSW2D5dpixnHwQA_-rHSGPPuuDzgfYM
X-Proofpoint-ORIG-GUID: wgSW2D5dpixnHwQA_-rHSGPPuuDzgfYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX3DeQVytzczxZ
 9VbcP5PzNkb67kIpPwgfCAfYIDFj7NDPOrvQKfRgKizFxV6baqFgOcvJFrd3ZD57ofEf2qdtusW
 jEqWVq9tw12CtrV8pwc8lMH0/rWf++xi6RxZs0SSPHpqdoeALg+0uX205mtynplcEJTIC+vSwJG
 Qhtqxnsf//cHA8Pikt9VzB3zHMVXtHrxlzm/GDoRYPef2j8Z0f7JcDXuPEMVSY0N5R1Jtm7ZDDO
 hobyW7JfifNe8Y2wx0C0LSK7xjrGnTPP4XnAtbVUDRiuMNIefMewKEDea92KGCjldUIcRNnLbzn
 knPxq556ncIUgJxuBuSpVDUg8dBITGNt5xGZwJTH0wDjGEt/DHLcIArYhESLGC1PzjJ5KXxZ894
 tQS26h+BL6/2qN5/HhFLn3SnAxiHBg==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a74402 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=RFJ9OqplesZEtbKTtmEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

This patch adds support for the Qualcomm SM8750 SoC to the
protection domain mapper. Since SM8750 shares the same protection
domain configuration as SM8550, the existing SM8550
domain data is reused.

Prasad Kumpatla (1):
  soc: qcom: pd-mapper: Add SM8750 compatible

 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1


