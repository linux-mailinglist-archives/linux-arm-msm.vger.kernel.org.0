Return-Path: <linux-arm-msm+bounces-28809-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0A1954D85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735491C22B99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D7161BE24C;
	Fri, 16 Aug 2024 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T8DVZGYu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753AF1BDAB4;
	Fri, 16 Aug 2024 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821495; cv=none; b=hbztsR3D0e2DNIC6MOJTZHpW0rcHCjtjHqR7RRe+XxB/FqXLfabr6qtQV/Bn9dToWVk6bd+Zo1/yWJSG98ADZxZxQEJtt/olF7pgZZbHiN+afDu3m6uzP60JiekVt5Gj1CVix41GAT+NKhtxMXhXu3YTfOZ7i4bj0QQ6cB1JXhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821495; c=relaxed/simple;
	bh=kSn9xjSSC+d3M1wIV/+BxyvnmPx63cn7kd3tEwbvVpg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iqHEdqijYn1WlRZSwzAUncppi1qZ9Wcw2TloFMYVrc0vJVlrtAtbpCTQjrB8EduZzxLU10DdEg1qN6QQpBptSom2lZCEYd6H+MLPvuIQ34S2QDyggXqJfoFjbgxipWh4nIijAsJW0E3WtwlN8ZcxMu7j2ui7pRm2ZEk3DQyjF/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T8DVZGYu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G8MpVN020176;
	Fri, 16 Aug 2024 15:17:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	scIZZuoxqYQMWOeBK2ZkziJZtkh1iQOdtRitHt4HBSQ=; b=T8DVZGYuyWa68ayT
	OzlYVLjVL+3IDh+uvQ4yXDAG7PEXNYJ8JLGVay5oC62fJphCX9iBM/l4+PzN61pU
	n3VtjGXOBGyWEz2mDpdDigAHhEnkJzG7oJh4r6PdEsFGCLIEpI4F4et3EyDFSuN1
	vYwbJgyoI0PHTzVqKsadvNUqFvPtmJQOReZrwMiPxLxiMQQmi1tewkgp04QLhqkZ
	1WFcYh8aYtOSNGQHmeDNSNXMtJ4NhaGNgnsijS+Tf/2+sQcki84sZjXbJRzQjXeO
	KZGAqzowCchHnXj5WXCiNt3NWc9TwScSKAVfupFpTTXMoApPPmAt4P/uxDxcVASl
	67Ei+g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 412373s291-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GFHZnl029998
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:35 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 08:17:29 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Fri, 16 Aug 2024 20:47:20 +0530
Subject: [PATCH v2 1/4] perf/dwc_pcie: Fix registration issue in multi PCIe
 controller instances
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-dwc_pmu_fix-v2-1-198b8ab1077c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723821442; l=3773;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=kSn9xjSSC+d3M1wIV/+BxyvnmPx63cn7kd3tEwbvVpg=;
 b=Yp3SNmwFbEyx7tPT37Tx1anCMSEzkxlZ2aBiKpJYANbVVtpjv8wyOUdhzxydN8h0JjfDvOhph
 TDcGE45vmtgCucVwvKqXyC+XCTkazVh5JKfyuRfGjF3RUBin3j4XgtT
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fueRPwe1A74kNmxdTS1yjF-g3nfnirlz
X-Proofpoint-ORIG-GUID: fueRPwe1A74kNmxdTS1yjF-g3nfnirlz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_09,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160110

When there are multiple of instances of PCIe controllers, registration
to perf driver fails with this error.
sysfs: cannot create duplicate filename '/devices/platform/dwc_pcie_pmu.0'
CPU: 0 PID: 166 Comm: modprobe Not tainted 6.10.0-rc2-next-20240607-dirty
Hardware name: Qualcomm SA8775P Ride (DT)
Call trace:
 dump_backtrace.part.8+0x98/0xf0
 show_stack+0x14/0x1c
 dump_stack_lvl+0x74/0x88
 dump_stack+0x14/0x1c
 sysfs_warn_dup+0x60/0x78
 sysfs_create_dir_ns+0xe8/0x100
 kobject_add_internal+0x94/0x224
 kobject_add+0xa8/0x118
 device_add+0x298/0x7b4
 platform_device_add+0x1a0/0x228
 platform_device_register_full+0x11c/0x148
 dwc_pcie_register_dev+0x74/0xf0 [dwc_pcie_pmu]
 dwc_pcie_pmu_init+0x7c/0x1000 [dwc_pcie_pmu]
 do_one_initcall+0x58/0x1c0
 do_init_module+0x58/0x208
 load_module+0x1804/0x188c
 __do_sys_init_module+0x18c/0x1f0
 __arm64_sys_init_module+0x14/0x1c
 invoke_syscall+0x40/0xf8
 el0_svc_common.constprop.1+0x70/0xf4
 do_el0_svc+0x18/0x20
 el0_svc+0x28/0xb0
 el0t_64_sync_handler+0x9c/0xc0
 el0t_64_sync+0x160/0x164
kobject: kobject_add_internal failed for dwc_pcie_pmu.0 with -EEXIST,
don't try to register things with the same name in the same directory.

This is because of having same bdf value for devices under two different
controllers.

Update the logic to use sbdf which is a unique number in case of
multi instance also.

Fixes: af9597adc2f1 ("drivers/perf: add DesignWare PCIe PMU driver")
Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
 drivers/perf/dwc_pcie_pmu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index c5e328f23841..85a5155d6018 100644
--- a/drivers/perf/dwc_pcie_pmu.c
+++ b/drivers/perf/dwc_pcie_pmu.c
@@ -556,10 +556,10 @@ static int dwc_pcie_register_dev(struct pci_dev *pdev)
 {
 	struct platform_device *plat_dev;
 	struct dwc_pcie_dev_info *dev_info;
-	u32 bdf;
+	u32 sbdf;
 
-	bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
-	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", bdf,
+	sbdf = (pci_domain_nr(pdev->bus) << 16) | PCI_DEVID(pdev->bus->number, pdev->devfn);
+	plat_dev = platform_device_register_data(NULL, "dwc_pcie_pmu", sbdf,
 						 pdev, sizeof(*pdev));
 
 	if (IS_ERR(plat_dev))
@@ -611,15 +611,15 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	struct pci_dev *pdev = plat_dev->dev.platform_data;
 	struct dwc_pcie_pmu *pcie_pmu;
 	char *name;
-	u32 bdf, val;
+	u32 sbdf, val;
 	u16 vsec;
 	int ret;
 
 	vsec = pci_find_vsec_capability(pdev, pdev->vendor,
 					DWC_PCIE_VSEC_RAS_DES_ID);
 	pci_read_config_dword(pdev, vsec + PCI_VNDR_HEADER, &val);
-	bdf = PCI_DEVID(pdev->bus->number, pdev->devfn);
-	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", bdf);
+	sbdf = plat_dev->id;
+	name = devm_kasprintf(&plat_dev->dev, GFP_KERNEL, "dwc_rootport_%x", sbdf);
 	if (!name)
 		return -ENOMEM;
 
@@ -650,7 +650,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 	ret = cpuhp_state_add_instance(dwc_pcie_pmu_hp_state,
 				       &pcie_pmu->cpuhp_node);
 	if (ret) {
-		pci_err(pdev, "Error %d registering hotplug @%x\n", ret, bdf);
+		pci_err(pdev, "Error %d registering hotplug @%x\n", ret, sbdf);
 		return ret;
 	}
 
@@ -663,7 +663,7 @@ static int dwc_pcie_pmu_probe(struct platform_device *plat_dev)
 
 	ret = perf_pmu_register(&pcie_pmu->pmu, name, -1);
 	if (ret) {
-		pci_err(pdev, "Error %d registering PMU @%x\n", ret, bdf);
+		pci_err(pdev, "Error %d registering PMU @%x\n", ret, sbdf);
 		return ret;
 	}
 	ret = devm_add_action_or_reset(&plat_dev->dev, dwc_pcie_unregister_pmu,

-- 
2.34.1


