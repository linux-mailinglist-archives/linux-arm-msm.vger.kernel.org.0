Return-Path: <linux-arm-msm+bounces-33634-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4FA996140
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 09:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 392151F21B98
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 07:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 369F4189902;
	Wed,  9 Oct 2024 07:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IEgiuGd2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7DC18952C;
	Wed,  9 Oct 2024 07:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459773; cv=none; b=cpvfZNOlfGfdCmu6+5qkO3M/uuoMSfxkxkS2dlIvOjyOX4zDhExMaNYKNYUcuHbUU1Y9zRQrvZNMXyWXvHwYgArXVnyZp9pwe497huifCj+aPpmfD38n6xGGVmtC4W/Jj69qPgiQBqGqPvzrWwqPQoMqylhlkgSg9GVVXG/qsT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459773; c=relaxed/simple;
	bh=LFNxH82iYAVOBHknU67wEDKrfnlu0dWmlOBNv9DWLXI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qiPW0wrO0m99S+k8Ek/f6mBZDxFNPKsSaLqEwgsQgI+LWaBsPf9W56wTlZLzsU4LVThnQFs+0nKBCVR3kT2drWO/H4gNa/QtYbaAW3ra6p46/4+8islczuVT6GGDRZTXHfiR6IUJdNGOkv0482qhVF0I4G3ay+ctZVWFkhGcsno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IEgiuGd2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49978gMY029429;
	Wed, 9 Oct 2024 07:42:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f3nItm0Gdi3bI3Zw4m/5gUFjMKwVbzs+35pMUn26fQ0=; b=IEgiuGd2MpqKHUaN
	/aJQRp0VMcAHSzW2YFe3vWEdCzpB+RkDtK9yeB6i+AAyjczuAABoqWqbv1iHZwxz
	Mlo1kJO5rNliM+4DSnfEGcDCce3qehFGH92FJJ5Xlo2fYh3go3bv9YXeKtpOYdOV
	GdOMaGfHR9mTiQlw32SuUmk99RzZCG/5KTHYCuzoPiOs8fyI9pZCHGx7x/V2VYSq
	ZRdVQvtLV1kosQgWU9CN1bXGKgi7ts8AzogMhBzbLo/cZh1pBNK1M1W3R+mJjqTF
	eogHcARI6tt2h/HaFB7I3Jf3Bc6kuHGY8Yb7YQhwJ+wU57yfuc4pa+DkEG0cJiIK
	rRu1pA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424yj03qv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 07:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4997gZ4Z008602
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 07:42:35 GMT
Received: from hu-mmanikan-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 00:42:28 -0700
From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
To: <andersson@kernel.org>, <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <konradybcio@kernel.org>, <catalin.marinas@arm.com>, <will@kernel.org>,
        <p.zabel@pengutronix.de>, <richardcochran@gmail.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <neil.armstrong@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <quic_anusha@quicinc.com>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <netdev@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>
Subject: [PATCH v7 6/6] arm64: defconfig: Build NSS Clock Controller driver for IPQ9574
Date: Wed, 9 Oct 2024 13:11:25 +0530
Message-ID: <20241009074125.794997-7-quic_mmanikan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009074125.794997-1-quic_mmanikan@quicinc.com>
References: <20241009074125.794997-1-quic_mmanikan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x5qNSVyNVt6WX_GW175Ln7MOojH9ZaWZ
X-Proofpoint-ORIG-GUID: x5qNSVyNVt6WX_GW175Ln7MOojH9ZaWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 mlxlogscore=946 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090050

From: Devi Priya <quic_devipriy@quicinc.com>

NSSCC driver is needed to enable the ethernet interfaces present
in RDP433 based on IPQ9574. Since this is not necessary for bootup
enabling it as a module.

Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
---
Changes in V7:
	- Updated commit message

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..3727155b67b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1313,6 +1313,7 @@ CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_6018=y
 CONFIG_IPQ_GCC_8074=y
 CONFIG_IPQ_GCC_9574=y
+CONFIG_IPQ_NSSCC_9574=m
 CONFIG_MSM_GCC_8916=y
 CONFIG_MSM_MMCC_8994=m
 CONFIG_MSM_GCC_8994=y
-- 
2.34.1


