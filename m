Return-Path: <linux-arm-msm+bounces-27463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A17694255E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FA921F24524
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 04:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8C71B810;
	Wed, 31 Jul 2024 04:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Nt0BXTfH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD291BC20;
	Wed, 31 Jul 2024 04:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722399884; cv=none; b=Oi9UBGo7WRsAyIZLAQ2ytHgO4TOtZAArezNeAEEEl+5OW/AOxyl8/BfUUqd0pMyNL0JRd+qqmjhfDGthrL2vb9xZ/uaBjOWncSyWSzNKWHGAPgZG2u3nTV/sOGpA4GkNAl5gc/q2UmkHvINHotwBWRcwhbmfT8CFluVa3ca11NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722399884; c=relaxed/simple;
	bh=gC55R/LR5rglSPT450KhTYFt9Uhepv4JwfPxoU/ftAg=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sh18SlHnFCksB9qw415OlKAQqkQtygv/1w9q4AAXiec6DvqkHocC3a7ULMR/XpkDnnbA45TGnAI8IeLanaQDKnUjZ4GX3eUaG5Svpqffs8v24DiJlR/XYJLaY6N3/ZjIebsKHW+qK/8jPj7q8ReNesQ5XPd5l85f0+3FK+fwVFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Nt0BXTfH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UInbqi030011;
	Wed, 31 Jul 2024 04:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kzm1jRL6SI6UfGBCw5gpDr
	XeajN3h3M3pwvuh7+sPcY=; b=Nt0BXTfHudJftz2v8Ojnb/byb1ooosSaDnieT7
	2i2tRA6DFTA2N6AxvEYeH4+VJ5IA8IJv6xS8kNQE+fCsRrJizMb730NwILnMJ+3A
	3Zkce3oyrh9McBzvERIcvAL6whTcJDYC+Ktcje29179wUfVAwEhHFBHWQDARJDX9
	cvRYc/2mOT7kBEeKFaWrDOi0MXapVTTASyxKv7y+QwH8brBa9lLmv0Wjh+BRMaC3
	tEiiGDyrjrpES+eR8Cgiu3n2U/Tzwk3IU/dFwiJt0fuDG1XrxpW4I00jX7lQNlJB
	tsNTFnfGbNvXsnUN4voIN2QNHWIQQfHE9t+n1Z7lZRnkQQsQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40pq523y6w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V4OBKd009322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 04:24:11 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 21:24:05 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Subject: [PATCH 0/4] perf/dwc_pcie: Fix registration issue in multi PCIe
 controller instances
Date: Wed, 31 Jul 2024 09:53:36 +0530
Message-ID: <20240731-dwc_pmu_fix-v1-0-ca47d153e5b2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEi8qWYC/0XMQQ7CIBCF4auQWUtSoErtVUxDLEztLMAKpZo0v
 btEFi7/l7xvh4SRMEHPdoi4UaJnKCFODOx8Dw/k5EqDbGTbaCW4e1uz+Gwm+nCl5XV06nLWE0J
 5LBHL/NNuQ+2Ir1zQtY5/s2dVlB33M5mYw0oei8yl6tSoW6sFun4TMBzHF/oDJ/SmAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1722399845; l=1490;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=gC55R/LR5rglSPT450KhTYFt9Uhepv4JwfPxoU/ftAg=;
 b=0TIKgAOflcux4t2V9iPtj7DVevURpWWXCRGvxsKZi+o6TULGDlJ3RdNxLpg/VIZqROQ0rxTaP
 G3LX44vR15fAEc2MfPYtq8Bc9xbzq0MWl3oSZiWPk3WTgGeqNWt27T4
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mQmYymkcDM8gGNTG8BgZnsHEsmKOeH4n
X-Proofpoint-ORIG-GUID: mQmYymkcDM8gGNTG8BgZnsHEsmKOeH4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_01,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310031

When there are multiple of instances of PCIe controllers, registration
to perf driver fails with this error. This is because of having same
bdf value for devices under two different controllers.

Update the logic to use sbdf which is a unique number in case of
multi instance also.

When the PCIe devices are discovered late, the driver can't find
the PCIe devices and returns in the init without registering with
the bus notifier. Due to that the devices which are discovered late
the driver can't register for this.

Register for bus notifier even if the device is not found in init.

Update the vendor table with QCOM PCIe vendorid to support QCOM devices.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
---
Krishna chaitanya chundru (4):
      perf/dwc_pcie: Fix registration issue in multi PCIe controller instances
      Documentation: dwc_pcie_pmu: Update bdf to sbdf
      perf/dwc_pcie: Always register for PCIe bus notifier
      perf/dwc_pcie: Add support for QCOM vendor devices

 Documentation/admin-guide/perf/dwc_pcie_pmu.rst | 16 +++++++--------
 drivers/perf/dwc_pcie_pmu.c                     | 27 +++++++++++++------------
 2 files changed, 22 insertions(+), 21 deletions(-)
---
base-commit: b236787b0da563e3bad0dab1b4b9a5bb54eabd39
change-id: 20240731-dwc_pmu_fix-3729bd3657fe
prerequisite-change-id: 20240728-mhi_runtime_pm-2383b74c71ed:v1

Best regards,
-- 
Krishna chaitanya chundru <quic_krichai@quicinc.com>


