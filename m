Return-Path: <linux-arm-msm+bounces-26523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B63919347E1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 08:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 687421F22EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 06:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2F995644E;
	Thu, 18 Jul 2024 06:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HeW4F0e4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6665140856
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jul 2024 06:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721283256; cv=none; b=qbziVK0p4Ncg3tkjUNDw7MzzkqCT2LHSMdtRaehWPMp0EVn3vyRL+AjP3Mg8+n+6peQzjPn9J2ZakMLxVseHL87y1Ba4UJ4h/x6ossaAu7lBin7QwHDktgyWtpyG0aORxTrhjnF+0eR+pgSmP4YYLdoHjDtBAbNEw4lxwuKQTIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721283256; c=relaxed/simple;
	bh=GQjBeQR+6/l8ckLKvNWlTkR1evWRzDamqRs11p68gpE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jQrNRAeJRKVqaDpAE7NMUfr1Z4+J5o0K0jYy2vK9hcjZ0tozPlHQAqaz693FYU/L89WjFvMhrn4mpYlO7b8jy1p4HxKgiOlzHVl+VxzdbdDXzRCibvgeuCi1H7JTUwwgl8GejOEi0Uu8PksHgYz8L9u1BdhMJL9a/jC1PYEkR/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HeW4F0e4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46I4qrCn012802;
	Thu, 18 Jul 2024 06:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/bk13DoOzIDVReoz0co0sQcCeiMezOPdMz66ilPtcWE=; b=HeW4F0e4FvYwUptS
	Xcy5Qw/yaLX5ezv2HLerLPTT9PY7SxHnLuAeDB29+OzXcC/sJ9WgD4MdqGw5w4pR
	R7EorcrD9eG8UOwdb7qYF83RE5X9vPcm+04+S/yklCO5MHV98CiHm7gvZm+8rAY5
	e4n/qS4E32Zv+V2SG1XtDqW4u+oHKeProYa3vJ+Eo8+2UwbFT9N3yZkLsHUASZ33
	55OJELN5/EAeC/u/cZqpj67LkN7UlZsYRhOoIhoxB8auoYqEuXQqBlrheQNLaQgo
	npspHi/XWTGO1jDkt8gtGwRTymyv4kihoCKLm/J8FaUDcrmrHr9eVl2Cc+KD31ir
	UY7SOw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfwcfv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:11 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46I6EAgE000684
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jul 2024 06:14:10 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 17 Jul 2024 23:14:08 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <mhi@lists.linux.dev>,
        <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
Subject: [PATCH 3/6] bus: mhi: increase RDDM timeout
Date: Thu, 18 Jul 2024 11:43:41 +0530
Message-ID: <20240718061344.575653-4-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wAcXuOFLExhnAa_GDbsMfQ28Ra_TFwcD
X-Proofpoint-ORIG-GUID: wAcXuOFLExhnAa_GDbsMfQ28Ra_TFwcD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-18_03,2024-07-17_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407180040

From: Praveenkumar I <quic_ipkumar@quicinc.com>

Host sometimes misses the EE RDDM during kernel panic causing
RDDM failure. Increase RDDM timeout to overcome this issue.

Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 drivers/bus/mhi/host/boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
index 1a918e340424..324510d2c7fd 100644
--- a/drivers/bus/mhi/host/boot.c
+++ b/drivers/bus/mhi/host/boot.c
@@ -77,7 +77,7 @@ static int __mhi_download_rddm_in_panic(struct mhi_controller *mhi_cntrl)
 	enum mhi_ee_type ee;
 	const u32 delayus = 2000;
 	u32 retry = (mhi_cntrl->timeout_ms * 1000) / delayus;
-	const u32 rddm_timeout_us = 200000;
+	const u32 rddm_timeout_us = 400000;
 	int rddm_retry = rddm_timeout_us / delayus;
 	void __iomem *base = mhi_cntrl->bhie;
 	struct device *dev = &mhi_cntrl->mhi_dev->dev;
-- 
2.34.1


