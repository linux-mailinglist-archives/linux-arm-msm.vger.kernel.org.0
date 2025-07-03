Return-Path: <linux-arm-msm+bounces-63522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 829F8AF7383
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 14:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FF17563B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 12:16:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60C922E7641;
	Thu,  3 Jul 2025 12:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="i3QMsxOZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFBE267B12;
	Thu,  3 Jul 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544906; cv=none; b=otRr6cl69efoA/IeLcjAKVNtL2AH1eaY1Z3BofFnPbVlAONONGyEzj+S7aNNB+BD/dCIKsMemGCLQS1GmBxqunt7Y/z/g5bz+ruXNFFyM1n7cDbfqpkoXjilpf/X2VYrduiAzDwPg9sjHHp4smS9GwVdGgCmT4ie7OEzp4eNOYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544906; c=relaxed/simple;
	bh=znkiTjJY1Wna6CHiSz2nbiBHjc8XbxCkETx4Bdz4AgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=jf5iJTfwRdnaFgH+W24QAVnrDzuvKbRkUcPwG6P/6kykR+QYz7hxk/ZTxfJ7/01423rj7Z25DNFRR8kfqMsHFmq0X4RYzbT5p4ifkvsPKUmywBjjGeCIM/O4yVF7ma2iQ+no9Y/Tf43RiVQENuhfBG134NwWlGWre28rD0KHJM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=i3QMsxOZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5639rPua025364;
	Thu, 3 Jul 2025 12:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RcmifybW7d9qXd6ESCZbzawnMpxG9vDurMtNEO1cMLY=; b=i3QMsxOZghQOieTq
	CSXrRJAQ3uTzBg9NCCVbe7pFg33SNSbA+btpkW38dZV4VIZS0rjFqNlTvl0jFX7d
	mC18CMDQD9t0UJ92HxN7yqZ8PhdZBlSNtEArd3dGAzzP4bdJGyly2VtHATJkFHie
	zHgE/qDzekZQRz2iid1grDEPGqV+f/TjCTahsvYVFOnHt7VhAR4iWpNL/dKdx4zQ
	zvMNx6ic8189KjPLw6qv8L1PDLfT2X22eUucL25lR+/w7YpjPt8GSxol3d4gsZ6D
	R6HlvzujMFpyknVhugRFmIDPTlnPcU3RLR4RxykL04YU/tg90kV0k4J4gj6KhYmW
	eV3Hlw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64wga5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 12:14:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563CEpIE016453
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 12:14:51 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 05:14:48 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 3 Jul 2025 20:14:30 +0800
Subject: [PATCH net-next 3/3] net: phy: qcom: qca807x: Enable WoL support
 using shared library
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250703-qcom_phy_wol_support-v1-3-83e9f985b30a@qti.qualcomm.com>
References: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
In-Reply-To: <20250703-qcom_phy_wol_support-v1-0-83e9f985b30a@qti.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>,
        Viorel Suman <viorel.suman@nxp.com>, Li Yang
	<leoyang.li@nxp.com>,
        Wei Fang <wei.fang@nxp.com>
CC: <netdev@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Luo Jie <luoj@qti.qualcomm.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751544877; l=1220;
 i=luoj@qti.qualcomm.com; s=20250209; h=from:subject:message-id;
 bh=5PXRA/G1MHktsR7fiCtdAeiJUZmo8zISN6T6laArEwM=;
 b=vcTaXLb8f/7HoPq0mHHCL1fCSjwbWOZAM3csFY0+kASEDggK2hy6j/AgeXBQtEzRb7hok6Hqt
 mkRsvBQJGXoDPwfC0PPoX+yQdrVGEtspD3MEErVoNal3+g9SkeHdTkk
X-Developer-Key: i=luoj@qti.qualcomm.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=6866743c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8
 a=yGB2eTQ9lww0Q2wdzLUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMSBTYWx0ZWRfX+eUyKGZ/e4D1
 Z/gK+C1I+B5+kZD7kFC+r4Vp5uZPu4Ggc6d02uC0jj9YGpSKzeO8OVM1KucInGlUItEL/grGYPS
 clF18XWwfmKBJrqV0MKKTMJ+/Wa47Mt9jfAzU/GczoVg4PI2g9zc9MgT/YFbScOBrUTiA6mERwR
 R1brv6IN7zPnGhdYyKssWf3bXuvq6eWQl3c5LFroehXMoTmRHm2NaOkIjmGhnxIfBAzCJTrdY3E
 B0ffQ1LoDOVteT/TNaDdCAjTM1GOUiTYhx4S/+Dv2TfMsUCJrDLHvpnevgU2ZfeONNZmssIaDCr
 XS0YDRzdL59pBHU7a9/IXyNm2rLJhCqpCvqQnPrXLh5ApOUG5oBtIsVGqLFpI2PIJjaEaLmX96Z
 tx7CnMvTdCdy1CIPaoBzXeWCkBQuiOCCt3p1lMcpK/Yty08QnzSDUWF+rqMycAluKmbPgBef
X-Proofpoint-GUID: Q-UhrGkY8BmpHCBfSvLM1kOnEy8O63Vk
X-Proofpoint-ORIG-GUID: Q-UhrGkY8BmpHCBfSvLM1kOnEy8O63Vk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=897
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030101

From: Luo Jie <luoj@qti.qualcomm.com>

The Wake-on-LAN (WoL) functionality for the QCA807x series is identical
to that of the AT8031. WoL support for QCA807x is enabled by utilizing
the at8031_set_wol() function provided in the shared library.

Signed-off-by: Luo Jie <luoj@qti.qualcomm.com>
---
 drivers/net/phy/qcom/qca807x.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
index 6d10ef7e9a8a..40064d820821 100644
--- a/drivers/net/phy/qcom/qca807x.c
+++ b/drivers/net/phy/qcom/qca807x.c
@@ -800,6 +800,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.suspend	= genphy_suspend,
 		.cable_test_start	= qca807x_cable_test_start,
 		.cable_test_get_status	= qca808x_cable_test_get_status,
+		.set_wol		= at8031_set_wol,
+		.get_wol		= at803x_get_wol,
 	},
 	{
 		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
@@ -823,6 +825,8 @@ static struct phy_driver qca807x_drivers[] = {
 		.led_hw_is_supported = qca807x_led_hw_is_supported,
 		.led_hw_control_set = qca807x_led_hw_control_set,
 		.led_hw_control_get = qca807x_led_hw_control_get,
+		.set_wol		= at8031_set_wol,
+		.get_wol		= at803x_get_wol,
 	},
 };
 module_phy_driver(qca807x_drivers);

-- 
2.34.1


