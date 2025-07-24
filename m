Return-Path: <linux-arm-msm+bounces-66548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA81B10C2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 15:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 641E41CE56BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 13:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF062E54B2;
	Thu, 24 Jul 2025 13:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j17GDS0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30B82E542E;
	Thu, 24 Jul 2025 13:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753365112; cv=none; b=aM24dJcWwGGsEAXXeExzmrWKtpW5UEl0OKeYSrs1ikOCxNImtmpFGMl/yJ6Mo5IfOHOUui+0mgrlfrrw3HdNzcJB2ZhbXWdiSd3ZcIvhm6iKnoDceFH5LWDk3yEPqtpOWqvlUpoRwcwd9J9KAsKNBgysixblrAEFIVfxRfZqkcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753365112; c=relaxed/simple;
	bh=HjtEdTeP222sKTqHHzhX4RHeu73+Y0URyH7279+aahE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=aq9GOd33j2/womrg2FuumfCv8rkIUdFEDxAtLXsnkrSe3VQEr6NN5yiDDB3XZ01UVk8A9JVY09SmGZo7n1Q5+UDCRLPbRNwRpJS3EulgZwKJgWQoHWD41EAraB2B2gKitPiN/vFKi9DoAmCSTs3nXGofH9lqF+KiNLKE4wQPxN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j17GDS0i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9afHd029601;
	Thu, 24 Jul 2025 13:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wc8Q3cPMdrrVxOkQ2GUpv4sRi2WE5HtMAOTK53i+wRw=; b=j17GDS0i28AYLrxM
	SBMrajmMUYdmV3FHoHYl5W46uAjChllC+iIGV0fxEwp+b94SxPMtr19L5T3cMF+/
	s6VxyMp8taQLB1rjetbUh8kf5IR9DJFBP57YgOdTtxSoe4CTZWSrzLEF4GD2SNcq
	mH94yZlS9fmjl/+qvAwHSN2oanL4ka6PNNoBlS2XTTf5GUmwEJtVUPrLWes2tPD5
	eUiZRuzjHFNU9rat4PCdg6tENJhKPy4I/ltz4jfM6awAWx+0wwhoJuukx7FQByZB
	u3LoodrJ79wg/5qpIVTAEuFVtHUfLiTM0KRwKRqQocZFtXHANTa1OajhD5/rbcfC
	98aALQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1g7vj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56ODpaim009670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Jul 2025 13:51:36 GMT
Received: from hu-vpernami-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 24 Jul 2025 06:51:33 -0700
From: Vivek.Pernamitta@quicinc.com
Date: Thu, 24 Jul 2025 19:21:19 +0530
Subject: [PATCH 3/4] net: mhi: Add MHI IP_SW1, ETH0 and ETH1 interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250724-b4-eth_us-v1-3-4dff04a9a128@quicinc.com>
References: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
In-Reply-To: <20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam
	<mani@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        Vivek Pernamitta
	<quic_vpernami@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753365082; l=988;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=EcqX7pEavyNfJD/cuUms4Jfl+XHPBDi4YM6MNDDCOEE=;
 b=OWQl6QNLUtLp46SMKpQSC+33KzGOhyxx79mlE7Hnuk2SEForxbSo0eZSE5E5iy6BQCpQyhiAi
 phdV18tn5aLDbFiiypqbhQbcABeyucK0ij+cVE09UWB3HK/JI8WcOPg
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: K7x_1p9WC3X2UCnfuD8gF6JlbaTNV5V3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwNSBTYWx0ZWRfX/7+YGm73E7BE
 YfGTMPzj6N6XiomLRSswhpHDLvZmhzNP3OPsECXuko9kRqJW0Xxo6Mq9LE1RV3c8fkhtxGoSDVT
 GF3zN+/FsatIWdfKLnDJwwaA81hVwLhLBiW1kmaKDDhFnFlFwoFXbzLeR1me/f6UsdQItl+BWWP
 vPRGuudj4zHN+s7XZu+tza9FYSk2KsUZztWVOnDKBlqlPfrp8HQ/l04CwJyBPIyfTASk+mM0PPK
 UMoQc1F259NytsK51nOEAMx3p4DEmwtSN14D/1c9/256G+1VsPBvh5FfCuo/yImYk7vg6XRl0Ux
 1KCG1XkplK28ilseSrvBdhA27ql2HV2WkjzP+7HSkjDrPndJNBe4zzCnBnbDW/hzE6bDXM521jt
 VPQEl00CmQB6n5nFZVJlz09dXiKRKjTMpt3yurg2ANij3HbbatkpQmDbbK1X0MY2l9DnVfJh
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=68823a69 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=0xxiP8YIG85xZ0q-sMoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: K7x_1p9WC3X2UCnfuD8gF6JlbaTNV5V3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=792 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240105

From: Vivek Pernamitta <quic_vpernami@quicinc.com>

Add IP_SW1, ETH0 and ETH1 network interfaces are required
for M-plane, Nefconf and S-plane component.

Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
---
 drivers/net/mhi_net.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/mhi_net.c b/drivers/net/mhi_net.c
index ba65abcee32a253fc1eb9d75f1693734f4d53ee3..ea3f27cbfafe54ef20f66ec0f046ce979c876217 100644
--- a/drivers/net/mhi_net.c
+++ b/drivers/net/mhi_net.c
@@ -458,6 +458,9 @@ static const struct mhi_device_id mhi_net_id_table[] = {
 	{ .chan = "IP_HW0", .driver_data = (kernel_ulong_t)&mhi_hwip0 },
 	/* Software data PATH (to modem CPU) */
 	{ .chan = "IP_SW0", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_SW1", .driver_data = (kernel_ulong_t)&mhi_swip0 },
+	{ .chan = "IP_ETH0", .driver_data = (kernel_ulong_t)&mhi_eth0 },
+	{ .chan = "IP_ETH1", .driver_data = (kernel_ulong_t)&mhi_eth0 },
 	{}
 };
 MODULE_DEVICE_TABLE(mhi, mhi_net_id_table);

-- 
2.34.1


