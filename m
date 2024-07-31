Return-Path: <linux-arm-msm+bounces-27467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D8694256A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C46D7283164
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 04:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B1083A8D2;
	Wed, 31 Jul 2024 04:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E9wOoKK4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6A9266AB;
	Wed, 31 Jul 2024 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722399898; cv=none; b=dDIVUSbHDmW7lUvmwuNQ6BfsWv1AJoE9EL/FJwhXH1/SvD8a64AZ6PPsydMRsKmz0mTfGBhRtfLRiwlLON7IeCB0diuMywClcYLcbtgEZFsz2RsEMf951SBSz1d7D50np9d+1/zVmz7/1j6R0XZWorAU2gKI6VdS2ul2EAIJhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722399898; c=relaxed/simple;
	bh=ApQJkNKxU6aJRlC4WOGU2QyuoAR07ixo4vQFhg/Om3Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AKkU7Hl3mZmCXJt0U+eAz6R0xBY5AunfUcyq+CvUCg0jxS29hDiRmrG1954SI4NxzvzSQlbKw9bjvq1buoviP6/gqvi2V4gALbUQiM+bHAHkzSU8sExFbttPd+8mAKgUZ21ZEp+uQjDlJfxtHm3vBP5RPs+ikQRflh9Q0KyaOBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E9wOoKK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UG4rpK030486;
	Wed, 31 Jul 2024 04:24:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MxWpYr446IPQhndgaQlhC+0UBjNXpyDuk6Ggkjz0RfA=; b=E9wOoKK425xiEEWb
	1eqgNv2Cps+Ho6RpKos95+yMjT0xfzFmQtf0/2AbmXybuaVhgX/AKyWVgoCgu7UB
	q4vFDdOYk9lkdEivOQ5cMAogG+ticfngOdG89BYe6/Ad1A56P40FWE396Mnwq4/1
	yZYVFsZmdaU87e2b8DgS+IsravC2BGpHgharU6Vvx/LeDsMYNMaaDDiJQimvYA/h
	/62Th9yPrrZBdsduaL1xp2XKjDx3KrBOLgEle0/SgR1/kqbiUdHy5dN8S6SsYMWV
	LMZqgu8oKZQbAuxykRR5N6oe2kRNwwOSDTrgYM/meSCafMq6X2KZeP+KokeFF359
	d2ZAQg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw44339p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V4OYSW018952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:34 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 21:24:28 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Wed, 31 Jul 2024 09:53:40 +0530
Subject: [PATCH 4/4] perf/dwc_pcie: Add support for QCOM vendor devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240731-dwc_pmu_fix-v1-4-ca47d153e5b2@quicinc.com>
References: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
In-Reply-To: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
        Jing Zhang
	<renyu.zj@linux.alibaba.com>,
        Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Yicong
 Yang" <yangyicong@hisilicon.com>,
        Jonathan Cameron
	<Jonathan.Cameron@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <quic_vbadigan@quicinc.com>, <quic_nitegupt@quicinc.com>,
        <quic_skananth@quicinc.com>, <quic_ramkri@quicinc.com>,
        <quic_parass@quicinc.com>, <quic_mrana@quicinc.com>,
        "Krishna chaitanya
 chundru" <quic_krichai@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722399845; l=626;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=ApQJkNKxU6aJRlC4WOGU2QyuoAR07ixo4vQFhg/Om3Q=;
 b=aNoriWfSmpxrdtci6bBqmRMdCGDOoYaDaGhtEoXDv3xW6pLdnReSMbmH+9xSMq2cVQbcpjhhx
 pr6Ds+ca3FZCgOWTd0zYzS1pOYXImb0d7HPLfJYjhUxiCq47Ck9rAkd
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ROehB-gQRz2MYAkNDyYKgtQX3FwKfpY2
X-Proofpoint-ORIG-GUID: ROehB-gQRz2MYAkNDyYKgtQX3FwKfpY2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_01,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310031

Update the vendor table with QCOM PCIe vendorid.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
 drivers/perf/dwc_pcie_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index aa1010b44bcb..ea73ae5c45c5 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -107,6 +107,7 @@ struct dwc_pcie_vendor_id {
 
 static const struct dwc_pcie_vendor_id dwc_pcie_vendor_ids[] = {
 	{.vendor_id = PCI_VENDOR_ID_ALIBABA },
+	{.vendor_id = PCI_VENDOR_ID_QCOM },
 	{} /* terminator */
 };
 

-- 
2.34.1


