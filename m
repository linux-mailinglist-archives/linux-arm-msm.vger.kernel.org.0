Return-Path: <linux-arm-msm+bounces-27466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87F942568
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:25:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EE3BB2176F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 04:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D19981BC4E;
	Wed, 31 Jul 2024 04:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k9QKPsfm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121D38FA6;
	Wed, 31 Jul 2024 04:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722399895; cv=none; b=KbYComz9T9bmCfpbP9u5g6nGRPm4hpvW2LN8bq8EaJG+gtqent3AIJni7kIX5IcAVtzKAUlfQhYXIv9AEq/2g3CbWshcUq7tVG7ldSZGw/70Oc0iJ8qtrah06mO0bFKtJVee8n3nBhdqmPXgNDdU+VF75xuBqljsa0O7S8BscMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722399895; c=relaxed/simple;
	bh=slFfYARN/NGA8d9HpqPUxNQsQb2wtq44myW7PmlTiY0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=b82Knx2sD/VjiEVOQhG9Au65FrHZMsUFln9CYAc0n/qfimT6Q8CDzS8rHwv02WMpF/AFUOHF8Z99MZb360DHUBydjnCBWJaaNXIftNLfE2oZi/n41Ov7C/vKasULwfeWoydYka5H59plTtDQvnar5lG7rfe0nkmsB8jNYUFyLuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k9QKPsfm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UGgjFe002721;
	Wed, 31 Jul 2024 04:24:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNdNvDeFtuYsMofSm3WcEtCyCD48w6WEKaIeZnUWN+4=; b=k9QKPsfm+k/Z+Xvz
	cYT3hFRWBr7TVNL771o+oOzWNBd4dhRu5mM+8C515iU71yu/w2b3sLtwt5K585Fv
	RlhQjA8QpUT/2GmAbk/m4LbRw9w6PU8axMbSh5+YBJYOFtZ6dFUWWmkU7DtdFtwm
	lF3GMiUJ21B6Cjjzgd908/UsOsZuAKXmRd2l9ZVg0f2XvmrmUH8x8SMVCUabvJLb
	rQyBzLFgukHR3NAApq3bWfqq8DlXOccMkf38xA5KYCrqZq806SBW+3JEIJZOWHnw
	bHV1pBmZ7aNWSdR9MvddlThUTDjgd3nAyyxxuq4lJte4WJ9bn54A7pIprQY18J41
	iqfbYg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pw4533vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V4OSkK002363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:28 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 21:24:23 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Wed, 31 Jul 2024 09:53:39 +0530
Subject: [PATCH 3/4] perf/dwc_pcie: Always register for PCIe bus notifier
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240731-dwc_pmu_fix-v1-3-ca47d153e5b2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722399845; l=1395;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=slFfYARN/NGA8d9HpqPUxNQsQb2wtq44myW7PmlTiY0=;
 b=aO3mCB/pYoa1JVSVvsws13oDQJsW4MIgCIpeM85yQ5WcfK4fIAml4hYPd4mluZXzKXfwlZDkH
 8dEEaAU2uSuAx4YF6hVIwrNsx7OtDO3+0Uc907gWHnpXOY7fG05u6HD
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: St0ozy0LyEJdYWFb7dv3h7zWhaD9jsyR
X-Proofpoint-ORIG-GUID: St0ozy0LyEJdYWFb7dv3h7zWhaD9jsyR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_01,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310031

When the PCIe devices are discovered late, the driver can't find
the PCIe devices and returns in the init without registering with
the bus notifier. Due to that the devices which are discovered late
the driver can't register for this.

Register for bus notifier even if the device is not found in init.

Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
 drivers/perf/dwc_pcie_pmu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index c115348b8d53..aa1010b44bcb 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -741,8 +741,6 @@ static int __init dwc_pcie_pmu_init(void)
 
 		found = true;
 	}
-	if (!found)
-		return -ENODEV;
 
 	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
 				      "perf/dwc_pcie_pmu:online",
@@ -753,9 +751,11 @@ static int __init dwc_pcie_pmu_init(void)
 
 	dwc_pcie_pmu_hp_state = ret;
 
-	ret = platform_driver_register(&dwc_pcie_pmu_driver);
-	if (ret)
-		goto platform_driver_register_err;
+	if (!found) {
+		ret = platform_driver_register(&dwc_pcie_pmu_driver);
+		if (ret)
+			goto platform_driver_register_err;
+	}
 
 	ret = bus_register_notifier(&pci_bus_type, &dwc_pcie_pmu_nb);
 	if (ret)

-- 
2.34.1


