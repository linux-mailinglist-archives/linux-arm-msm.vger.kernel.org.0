Return-Path: <linux-arm-msm+bounces-80614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2369C3B433
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 14:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F45C46804C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 13:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96962332ED1;
	Thu,  6 Nov 2025 13:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhxd9tg3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWLftNQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EE7332904
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 13:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762435709; cv=none; b=CO5PoXsvFjQrSVQBC2k6fh7TG7z+15sTcug5NNOIeUtsECSgnL/17qyckIpstXfCx+Dkl7BdVccHbBinBtJTimKUijId9wR2phsEC3ouCLAzjim7enoEXAme2treJGr5mYd1fvd/jHLQx8W7EtrgP2tF6HiTaCL6s2YFy95Nm3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762435709; c=relaxed/simple;
	bh=uTPUynvEcw6KdyQKFRCWP++7wpSfzU3ZtWnOxsXH5Hg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O5cfrwoC4dmc8jjVFFKkjT4ic8TtW0JdEv1JXiCjY5FsPX9Zwtb15MnbmIMLMZDUhktKUN8aayQpwZcR3UFpdRi45RR1beXmYBKW0vs+mamxJ/tr3LxdaMGJZsH/chCWSft+MdkFpyukoJ3k9M7qa2KQz55ZOvIbVieMpwKo4fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhxd9tg3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWLftNQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A6BlASO4131369
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Nov 2025 13:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K6Uln7viSoIgV4FeL3cGSMSD52CLesxi81fBrMA1F2g=; b=hhxd9tg3e0RMQImA
	13EGTQTYI0cDpPbFrOBvP9yjdtqTTkfZeoDP0BtemuHcNPEU1yzJrzbor8JwT0u8
	G+mmVwiLUN1i1T87i33NnEe4ITELZll1fru74+zbGhS9hvZX3m8yIh1Q2vTL8cWX
	r4/iJ4GL0x1IGXaeNMKov+/ppyYFAmg3l9Wi8PDxPM3CtT+PtYQ7WgX9fLkf2c/w
	p4iW6kXUdnNG0VP/BqN+7/5URdsAnevwDeM0h32H48ga9tv5UgZ/+AL4ESAdVHJn
	jRBW8qbOxI7ehcPcQxlLMHDMX6ZNpcTPW71DijnMmdpBOgmsxq1UOS0PFnLbj4D4
	DYRBxw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8u3x0869-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 13:28:26 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-295fbc7d4abso10676385ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Nov 2025 05:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762435706; x=1763040506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K6Uln7viSoIgV4FeL3cGSMSD52CLesxi81fBrMA1F2g=;
        b=aWLftNQS281Can3DNyUlKbIq0v4PEfvv2JE2c4HD50F0MHTVE8Il2k7F+ZGv/3AkQU
         o6MlnSOHO8wXM6FqE40sZqso6tydGUncOfRShLgzjQ7L2UzHsl4JmdKNWNRYjxl1UDNQ
         o+6b8+Q3IRmoEZ+NkCMtjYA3duQe9dA5tHqVluZTdR57FNdO4y2CuwAtXmAO2V5vA+LN
         qWVBsRIydPvtq+eJbL8H0JIVoyppMiStSM/jrlI4Sbv/QMWToheh7VV5fWsreJBYzKDo
         aEXvcDSEl3KNwvyVfjPXWFhESObfyg6co5bn02FfPIBHGrmoXNwDuljSGfEPIX+okGK2
         vMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762435706; x=1763040506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6Uln7viSoIgV4FeL3cGSMSD52CLesxi81fBrMA1F2g=;
        b=sXYDI8waPvjxQuEfF59DA7KoG+j5ZHvjpTTM9b1jKgtfgBomyfbfGb2IiUB0NjEyzJ
         5ZeQYEKidMym/mD9hMsRX/ULbu+72uxoiZ+FH8ZckcoP7SVFiMj6tuoMetAcoJtK2CTN
         TncQOpw/T5xA58JhQDVD+dWPNCSlLemJCK5t27IPfLKYh5w3XbVGhDxLHrq2epJb1QXX
         SFU/KQ2ADQrU3Lxfu8dBxaA5JU95T5ZicOv1I4soMMNMjBeddO3DsCLtMOZzfxC8N3OH
         f4R7yvAEPvGDHNy2RqfCkIZvFsgvFUuAnt8weyXh6MpOr+jqVOmB/VZbPT0Qd0+8xpvR
         LM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUk3xL/kxzdLqC091U1ZVRxrPk9q2RT6bNnwfYsKOHKqMzP/jNBYHv47G6RuulAbcmhSEQLGF29YN8ssKvB@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/u5cE6q+rC6rlL7Knuyk7heckgUOblyomeqvzRUGmsbA2HJKi
	IyAsgxjHd9tA4bEDGciVFtIUrIUDIDeAOJINXkPBuPBvcHNK4Hpdj6Ke10U5RxErgTuYXYCo/sq
	sKVlYByNo2+dXFjf2RFEJuCZwRPDh7U9URJFz+VnHlSg8FtoQjdFqan8pSblB5MiIvXaf
X-Gm-Gg: ASbGncs7BhAZ7AJdvuncoDQzka1dMrkv+ZpFez7TiSqDmKlHiGyw2gCBhqtwzOml93r
	2Otw5hUU4h5q2ooPsylEqhJl1RpR+MeEDVvpDB1AXo4HS2l/P7zAvPpAyK4lZxfXDTme2T18yhs
	+RngqdTiSemUA40CuCT/HPtoadrw7IbYRpmkKsGUdRsgCitEm8poYMfmKOyzCUxmSj9xWncdAYC
	mPq2/OpfwkXc59KlRU8f1dHa1DZMTwwv5KMdDzUlgbOM2f8PbV3OXPqRTiGQ7zx5oD7jaC23s6C
	VlDtqIqLTMXqqb3JBg2RD8qIx6ecNgw39GcWAAu1vc/cqq7Dk9OVLVdCT3mazqjUxGv+phS8wG+
	nIbGNRhZES4KH1qF4E0J1QWnIDA==
X-Received: by 2002:a17:903:b90:b0:295:6d30:e26f with SMTP id d9443c01a7336-2962ad1aea4mr84378635ad.22.1762435705632;
        Thu, 06 Nov 2025 05:28:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEH5wlKyQgfPrvVMcvI9YDewl2pp4uhag48hOeK/UPGzA9fBI7LtxtQdulJ/CTlS0XS4PBYQA==
X-Received: by 2002:a17:903:b90:b0:295:6d30:e26f with SMTP id d9443c01a7336-2962ad1aea4mr84378175ad.22.1762435705074;
        Thu, 06 Nov 2025 05:28:25 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1669sm28770225ad.94.2025.11.06.05.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 05:28:24 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Thu, 06 Nov 2025 18:58:10 +0530
Subject: [PATCH v5 3/3] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251106-vdev_next-20251106_eth-v5-3-bbc0f7ff3a68@quicinc.com>
References: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
In-Reply-To: <20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762435691; l=1454;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=hVsENnFNyiwEUKV4o8qHH64MADCXodAIn37DvsarU7A=;
 b=iKzNM9tlyU2l3rDwYcTOubaB8VZjoj1abicD2JDlL/PTPVLIcfYtHVo0Ll6PmqkhhuNna5E2n
 VpnZexmrvb3C1H0wYtVN3s+NfWlsVIc8AAo0Eymiibx90C7JMj+3/qq
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDEwNyBTYWx0ZWRfX4Oxy37Vb60GU
 vP3C0b7An5XKFS9T907oQ8D2ch6E5p8cZvMThBbueRN7hyTtjIoefK4PZSxsZGdRdfZOV3BrL6Q
 hs6TbiA1J6EOgywNce+5HxA0YH1VNCAZPAPD3alS4/aFLPWwZ6Pmc6Tso1N4IrDxHcaWy9khS7q
 TnZpmTSDSaCeYKEk9/SA35Z2iGajl7pVOjdx5mcvIYfDWlisULZ06cgQaKVMJqahXu4NFzKRb6V
 cedL8t6of7On7E5zkC/OjvJ4BLLdTSmaKjvLWJ2UBk8p/NPWpxJXvDDplXcslfEwLmIwnSoXXc1
 OqIRoeukiTiihAK+VgSXvemvTZPzplaqBOjectD8Zv8U4utJemj7PyceVyU/j33LClA1RfSVfaO
 uLqd0WTtOrBWHNHWVNW7b9LvhCzECw==
X-Proofpoint-ORIG-GUID: Np0msxV5cbVKifTpH0ekFdyU-eRHlBkC
X-Proofpoint-GUID: Np0msxV5cbVKifTpH0ekFdyU-eRHlBkC
X-Authority-Analysis: v=2.4 cv=BrKQAIX5 c=1 sm=1 tr=0 ts=690ca27a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vo5YzJSDI_NEo2NC7oIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1011 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060107

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
S-plane interface for QDU100.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index 3d8c9729fcfc57f38315d0386e2d2bdf8b7a8e1d..eace36054af9d04ac24538c8b9beeaa37c15b84d 100644
--- a/drivers/bus/mhi/host/pci_generic.c
+++ b/drivers/bus/mhi/host/pci_generic.c
@@ -269,6 +269,13 @@ static const struct mhi_channel_config mhi_qcom_qdu100_channels[] = {
 	MHI_CHANNEL_CONFIG_DL(41, "MHI_PHC", 32, 4),
 	MHI_CHANNEL_CONFIG_UL(46, "IP_SW0", 256, 5),
 	MHI_CHANNEL_CONFIG_DL(47, "IP_SW0", 256, 5),
+	MHI_CHANNEL_CONFIG_UL(48, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_DL(49, "IP_SW1", 256, 6),
+	MHI_CHANNEL_CONFIG_UL(50, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_DL(51, "IP_ETH0", 256, 7),
+	MHI_CHANNEL_CONFIG_UL(52, "IP_ETH1", 256, 8),
+	MHI_CHANNEL_CONFIG_DL(53, "IP_ETH1", 256, 8),
+
 };
 
 static struct mhi_event_config mhi_qcom_qdu100_events[] = {
@@ -284,6 +291,7 @@ static struct mhi_event_config mhi_qcom_qdu100_events[] = {
 	MHI_EVENT_CONFIG_SW_DATA(5, 512),
 	MHI_EVENT_CONFIG_SW_DATA(6, 512),
 	MHI_EVENT_CONFIG_SW_DATA(7, 512),
+	MHI_EVENT_CONFIG_SW_DATA(8, 512),
 };
 
 static const struct mhi_controller_config mhi_qcom_qdu100_config = {

-- 
2.34.1


