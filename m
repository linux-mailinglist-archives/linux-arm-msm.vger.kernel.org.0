Return-Path: <linux-arm-msm+bounces-28811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 967F6954D8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:19:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF67D2851A9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 264061BE236;
	Fri, 16 Aug 2024 15:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nbc2vhXo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789691BD034;
	Fri, 16 Aug 2024 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821505; cv=none; b=mCZoGuWtHrlupLjiCTsPbo4OVE9p8FmZD+toI3vfZ88rqXPjapzPs1QgSLAGyznAFtFbxCCJx4qA7TObIWftnWdTADHk+FfOVtcMcPUZTtywlsaV/I9tEOwiwhDYrlmfqUYx/jR3YMMXvGeW/ULqpLHaSRROsOvjQa/QglRLHr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821505; c=relaxed/simple;
	bh=cPjJFcveoqteKrkuFimjF6gSN96zK9Y2kBv3sRLogn8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=gy8nnT/DKUK1XTWUOwDSo7uiWIC9BUhRizSrNNRL7xvXndlLNyHsb+kgYIU/Q58jtKbX0H6pidw0IacUOBn2Wf6k7Y/MC7a06r6QllIxCfH9NPbHrTOQbvz/JYe+GbX7Le90SYA/mr0GRiu09UTlsQ+TP5MiOUEAxAwJ3P8himM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nbc2vhXo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G8Z37V027126;
	Fri, 16 Aug 2024 15:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CSqshpibilq7ubeGkkOp0wvuc7mFwgjd74ktGauelO8=; b=nbc2vhXonDYeBR2o
	WzWEdBK51wfysJKN+ASCDspMTu4+TIXIpws7fXjFduOKDaAjFnNHpvO2mT26zcnA
	3Fr/lHG4E6oLwfKGvCyS3khzMkSi3vH2WToWrXP2gdXP9cl/BajOWYQwfbR1CjO9
	Dw601YwPQL7T/KBsATqcSlqiYA/sprZH3cUlPMxckN8KFldBeKbiFliy1CIBkcS9
	lgfU6vNvFymd9cafQMTTrdI/fWZ2h656xuBl28uRU3u8ekptEbHz5P+VrS8qzf7C
	4eUuuVSccoo+av7nwH1o/ccihmUkN4ehy21heuGH1BqQLUrXiSu9x18uEwdDcmG5
	vDM5Wg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4123cr90my-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GFHkPn007597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:46 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 08:17:41 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Fri, 16 Aug 2024 20:47:22 +0530
Subject: [PATCH v2 3/4] perf/dwc_pcie: Always register for PCIe bus
 notifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-dwc_pmu_fix-v2-3-198b8ab1077c@quicinc.com>
References: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
In-Reply-To: <20240816-dwc_pmu_fix-v2-0-198b8ab1077c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723821442; l=1236;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=cPjJFcveoqteKrkuFimjF6gSN96zK9Y2kBv3sRLogn8=;
 b=NL0xFHzVbLj7Mu6dKtbuzi84kAfGHGdjRveVnSFqZRklORc89/NGnpX36Tny0cXUYNjAHGjtk
 DCrYhXEClotBgu5Y8pHyyYen9AShY2RF1bjZBtMrShTcrpdtSERNfnK
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tWjrxbuSQHhsNKQ-V52MG_axx-v2xmOb
X-Proofpoint-ORIG-GUID: tWjrxbuSQHhsNKQ-V52MG_axx-v2xmOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_09,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160110

When the PCIe devices are discovered late, the driver can't find
the PCIe devices and returns in the init without registering with
the bus notifier. Due to that the devices which are discovered late
the driver can't register for this.

Register for bus notifier & driver even if the device is not found
as part of init.

Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
 drivers/perf/dwc_pcie_pmu.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index 85a5155d6018..f205ecad2e4c 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -726,7 +726,6 @@ static struct platform_driver dwc_pcie_pmu_driver = {
 static int __init dwc_pcie_pmu_init(void)
 {
 	struct pci_dev *pdev = NULL;
-	bool found = false;
 	int ret;
 
 	for_each_pci_dev(pdev) {
@@ -738,11 +737,7 @@ static int __init dwc_pcie_pmu_init(void)
 			pci_dev_put(pdev);
 			return ret;
 		}
-
-		found = true;
 	}
-	if (!found)
-		return -ENODEV;
 
 	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
 				      "perf/dwc_pcie_pmu:online",

-- 
2.34.1


