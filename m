Return-Path: <linux-arm-msm+bounces-37199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4951D9BFF9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 09:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2FABCB20DF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 08:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6814E19ABC6;
	Thu,  7 Nov 2024 08:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Omt6MdKH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2ADC17DE36;
	Thu,  7 Nov 2024 08:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730966721; cv=none; b=AaqI6IFy7UCJlTBDlO5cUHY2dfiZeNHWECxaUjBhMaKqtcg9vi1GtYWyeUSlVhh1kiiD/W2Y2AqXptwfoZSbJMmmPmgG8jS08ZDxErePQixKnbNmJLDGVuCxCbI2naEDI0gkCSpe48hIC+DbcDKOM7fZXmrIa3pGHWuRHvkfirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730966721; c=relaxed/simple;
	bh=Y2APkLXTAecIPGbQD+tRXNFyd02ylrW7G84QrRVXJYY=;
	h=From:To:Cc:Subject:Date:Message-Id; b=kwFs2FXZyvX7vkQLgmZG5nI5K4fYeyrYMfbMv1hg9fDBWGlcxdXKwuB2io/PT73ZYKiHwulN8ctU8QkFtEh/FcfU4OuaRquE3os/b1K5yJZmSkq+mUmsFiWQyGJJCdT6TfF9nqJuW4UXEouI9VSOQNkYvfannmww62RT3bhl5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Omt6MdKH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A6JrhIG003896;
	Thu, 7 Nov 2024 08:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=vyzYNbaurjd3
	Ot4cJfqDXygZG7rFA9tRaAXRL+eeIHo=; b=Omt6MdKHGsZ0lxwssGluAPETlkxG
	zD1I/KNfW6ybwNwkvnvY0ij51lRoIdFUZhjM5ftWiy/8BBBpFe4LffOBjYhxtjjU
	woXd5fPFLaAaXK2iiuIZ4LC9m8Lfd36hJV5uHBGwTq3BGNpnhLnVF0HAx/v8Pwhi
	NvWdiTQev/O7HJOMKMXelOZ0I076QElH0WFauzwhLwfg1IpCRqCZAAch6l1ues61
	Rry/MCU0XBT7llNImgSYgpRgXLP5pBgcOZVzAdBH1d28sblF5tuCaRFTPy+dMr7P
	h+na39ceBm8Tmh0XnDN4lifW5veJLHQJktUAXn0h88kH2qSnOcmjwIqjaQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qfdx6t3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 08:05:15 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4A785Bqh004128;
	Thu, 7 Nov 2024 08:05:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 42nd5mu5n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 07 Nov 2024 08:05:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4A785AZG004052;
	Thu, 7 Nov 2024 08:05:10 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-sartgarg-hyd.qualcomm.com [10.213.105.147])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 4A785AgN004028;
	Thu, 07 Nov 2024 08:05:10 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2339771)
	id 7DB975013D2; Thu,  7 Nov 2024 13:35:09 +0530 (+0530)
From: Sarthak Garg <quic_sartgarg@quicinc.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        quic_cang@quicinc.com, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_sachgupt@quicinc.com, quic_bhaskarv@quicinc.com,
        quic_narepall@quicinc.com, kernel@quicinc.com,
        Sarthak Garg <quic_sartgarg@quicinc.com>
Subject: [PATCH V1 0/3] Add level shifter support for qualcomm SOC's
Date: Thu,  7 Nov 2024 13:35:02 +0530
Message-Id: <20241107080505.29244-1-quic_sartgarg@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9xrCCTvF9wFzWszc4y2bNyNl0KtxkRRk
X-Proofpoint-ORIG-GUID: 9xrCCTvF9wFzWszc4y2bNyNl0KtxkRRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=983
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070060
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Add level shifter support for qualcomm SOC's.

Sarthak Garg (3):
  dt-bindings: mmc: qcom: Document level shifter flag for SD card
  mmc: sdhci-msm: Enable tuning for SDR50 mode for SD card
  mmc: sdhci-msm: Limit HS mode frequency to 37.5MHz

 .../devicetree/bindings/mmc/sdhci-msm.yaml    |  3 +++
 drivers/mmc/host/sdhci-msm.c                  | 26 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.17.1


