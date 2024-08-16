Return-Path: <linux-arm-msm+bounces-28812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E85E2954D90
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 17:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1270A1C23263
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28F931BD50E;
	Fri, 16 Aug 2024 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="nk7tFoIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED41C0DFD;
	Fri, 16 Aug 2024 15:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821510; cv=none; b=Ajv0x+/dESgE+q4oKvwYC5/igLrG2jnXux1U/Muu015dkgAYLWrrUL419uC6S06t1tB/+GQwg7bT43jrT95+xi/RFUONP+VcMi4AHu3g604qS4UsZlLse0KYc1py18yaSw0XC9DzcS/ooVo2+KbhHzAuHML0Ardhglddog5wM4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821510; c=relaxed/simple;
	bh=rd/G+McQtsHmCV5vinEESnVI3CQaaZfqnPKqWPGPoxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=AAP5fl6Ani0/OXCFJW+EnlE0NRtAbf1DPQFU250kNKHimVIw2+AmPoOEEgtt8T8o0xC+G4wH8L2LsaAAzKUSrJwXBA9lnIbrO9l2MXmJCVSLwlXp6ySXuTJHBmXuuaI4/3K1NWWm+PhNYNciOkYCCS+A0Nl80EthIVQ6LOezP98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=nk7tFoIR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G6lf3R011403;
	Fri, 16 Aug 2024 15:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvN4yDcwZSK4kCZajw0B6ItIUwXNiVXJtL6nCzN0wsk=; b=nk7tFoIRP1pRzrE+
	vub9j9ujNxYhiyxRfay8JnwJPS0A34u6IxU7D+h725Et3HNSvFMoxVMyw3+33+kO
	y9YYsq0wxgIcuKiKyQCeWb0V0JoZBeZryMZ0HR2QcDm94BniHqfDT23eJXhu1DPM
	OnUmpC5vEtTy+fNz7swicrU2SuJySKECr7E22yRAKDe5PIEwL6UrKeW3eeXhW+O4
	c1DcHjk4t5FFWSr49WAAZhMxUWxBOTQL7ixmaW8M05+sOKD5h63ZP4OXYQdwe/jD
	8gqc88i7fwPGk+BBLZAjKMz6bmokcmNQL4DJxvYQueeFXAW/F14bHq3ym+CyDnco
	nphxNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4104382q2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47GFHqTA030481
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 15:17:52 GMT
Received: from hu-krichai-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 08:17:46 -0700
From: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Date: Fri, 16 Aug 2024 20:47:23 +0530
Subject: [PATCH v2 4/4] perf/dwc_pcie: Add support for QCOM vendor devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-dwc_pmu_fix-v2-4-198b8ab1077c@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723821442; l=679;
 i=quic_krichai@quicinc.com; s=20230907; h=from:subject:message-id;
 bh=rd/G+McQtsHmCV5vinEESnVI3CQaaZfqnPKqWPGPoxw=;
 b=d9z0vs74HTerIu/xzf8/2X1TZ0oYPjq/aO/WyS0yT3r4grWVkbOMqO8qP3MorOLbfDF+P5j3q
 Hbl8eBph7YCA/OZhPYwaUC3bpyTEQIyH6q8k0V1gAaHaoLntMIuWl4M
X-Developer-Key: i=quic_krichai@quicinc.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 46wA4WHfsXfypSmMnvVeXkXB3-DbgbCz
X-Proofpoint-GUID: 46wA4WHfsXfypSmMnvVeXkXB3-DbgbCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_09,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408160110

Update the vendor table with QCOM PCIe vendorid.

Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
Reviewed-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/dwc_pcie_pmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/perf/dwc_pcie_pmu.c b/drivers/perf/dwc_pcie_pmu.c
index f205ecad2e4c..4ca50f9b6dfe 100644
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


