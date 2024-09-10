Return-Path: <linux-arm-msm+bounces-31434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB06973F28
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 19:23:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 442561F2628F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Sep 2024 17:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EE821BAEDC;
	Tue, 10 Sep 2024 17:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Un6O/RKg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ED81BA269;
	Tue, 10 Sep 2024 17:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725988561; cv=none; b=hBLc8kXEByLf0YEUteT7Swg9Eu0cmfQtGJjJW+ax8CvNmGRnz4F7DRrWdSdR9dM2qhaojDLaxCWDWbYRKAhpwgSwT/FqA+YyA4Nl+2wvCw21PVtUYHmEUlA3BI5rHbhUVoUj4j9uLljDDkdZGUsPgUGAmE07KP6m391u4aosjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725988561; c=relaxed/simple;
	bh=z9ryzi6ED/cUEl6nBb/r3+XESxTOivxctZw0W8LNo18=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ggkl5CMF0gB4HLxRg1pt9nkky3LDr63GjPR1kWUma2rIpt8oWetGnKWRFuykjvux6Ohg1pkPry19yJKqeg7+qiq/qZLjDcyGI3QqSmcqrCz7tTwyWz1KoRDqrFmAtzCXpDkN+0KRzGkWywvSWB9BwrAAAKsJxRMQjHvTgcCtQAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Un6O/RKg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ADtBij025671;
	Tue, 10 Sep 2024 17:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zOQKtttz8ZUA2xoU7zf8kC
	m+/a9sJxbdiBnEJLMbpBc=; b=Un6O/RKgSYmQXLd70bvyeThSkcPd0RuI3JMKWn
	Eb2yMRLB7kIBZXEH3NYD78Tbj8w5bd9nmbeY1KD2t0NY3ZcC1E2M0nweppQDr3YH
	qqfYDDS3iyzL4fbOnLAQp4/RVRkGesbyvwQ7VVUNoG/HiZKoecm/n8g2HtoYkKRa
	Xri/WP30PPEbuzPqSar1dseIacQTvDQ5RoaIyyhxGtdLkGcMmyj/YkswlGSCEP9T
	llYcgIOc5SInxLH4AN1Nz2dH77EaZrszv8Y8leqTARYxCmuHNRMzBhEIdHkuJ242
	1AQRbFA5uSCUZz1mSuKsQmiyM5VMWYVNb3hc7LGWIe6QLXKg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy72xvfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 17:15:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48AHFna7018740
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 17:15:49 GMT
Received: from hu-nkela-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 10:15:46 -0700
From: Nikunj Kela <quic_nkela@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_psodagud@quicinc.com>, Nikunj Kela <quic_nkela@quicinc.com>
Subject: [PATCH v4 0/3] Add support for Qualcomm SA8255p SoC
Date: Tue, 10 Sep 2024 10:15:31 -0700
Message-ID: <20240910171534.2412263-1-quic_nkela@quicinc.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0FMdrzhl4lI_oYgrDs4IO82iVJJ-exG9
X-Proofpoint-GUID: 0FMdrzhl4lI_oYgrDs4IO82iVJJ-exG9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 mlxlogscore=557 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2408220000 definitions=main-2409100127

This series adds support for Qualcomm SA8255p SoC.

These patches were originally sent with other patches in series[1],
which was advised to be split per subsystem basis.

[1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/

---
Changes in v4:
	- Included AOSS QMP dt-binding patch
Changes in v3:
        - Removed the patches from original series
Changes in v2:
        - Added Reviewed-by tag

Nikunj Kela (3):
  dt-bindings: arm: qcom: add the SoC ID for SA8255P
  soc: qcom: socinfo: add support for SA8255P
  dt-bindings: soc: qcom: aoss-qmp: document support for SA8255p

 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 drivers/soc/qcom/socinfo.c                                    | 1 +
 include/dt-bindings/arm/qcom,ids.h                            | 1 +
 3 files changed, 3 insertions(+)

-- 
2.34.1


