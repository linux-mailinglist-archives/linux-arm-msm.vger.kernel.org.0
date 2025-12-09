Return-Path: <linux-arm-msm+bounces-84770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 915A4CAFC38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 12:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 91EC23091A26
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 11:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FED1320CCD;
	Tue,  9 Dec 2025 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvt1EQaQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j11YLNMK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE4B320385
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 11:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765279557; cv=none; b=d/9/GA0oYHv8RIyy+z5/5+t8diSOZxeRHMXl+ZYJxW0Vvz6i7Oy6VgGovcpzfGQyMYtbVfiG3d8MhiSk7I7ShF/m2bq3CylCG2pIZx2hd/JwXLodkBMAX8qh3UNsf3mQkmju7zqm4erGVn5mn0yl692KpktiSK25sZRkXfVPbRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765279557; c=relaxed/simple;
	bh=2FGJCYKsjYntIjZN8gihGQCd+HkaPjPNeoGWcukaLFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o78X4T79RI1V51bWUU0R4YBkpA21P+2dP7Kg9AQkWplWY/HL6VNHnzPuNo7+8MTvOrD75+R6uHc4lZEHHxBX62L0qzL/WcAuVGMIeVnaHv3qFLWQzsflbJVJsZyTY3ecLQ7ZUmPeKr6oyNUp8XhW8DAIQVunIwoCbyR6AUS2rHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvt1EQaQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j11YLNMK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NE1i3125322
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 11:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EvDD45RhBoypTIEIU6+VZMz01WBs5CFpnRzADYt4gVU=; b=mvt1EQaQB8iSlCuK
	Vgxf5dXS9KtZ8/cyTZvKM6Bajm1ejXNc6QrYpzSSNuyLke3cM/xCsEXkmKIqcny3
	tqafJK7xXWPn0cEDrU5WrIA3eWvTSpreGjwrRnODpILxnumxeXrH1nG2yzUiVc4x
	bdvnc3M4A/dswrnL+HgpoRyXy9kLAQikUo9xsn/jUo9A8KFDE6+vrHEikxVgOzu+
	Z1fqRFZajkARg34PR3GDAvaiA2/6086mUiCcXpCxxblVUzBvSbRIpHb1nloDM1yi
	OdCXRspfg1/kuS1MPEMDc+h8r3QDAw2IykWpJaNqTbkIUuyR6CRbSr+QTURhMDS5
	wdJBRg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ax4jnjfxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 11:25:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-343bf6ded5cso10168119a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 03:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765279553; x=1765884353; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvDD45RhBoypTIEIU6+VZMz01WBs5CFpnRzADYt4gVU=;
        b=j11YLNMKZWqUs9ASQjRIE8akFJvgjGur+EEtB9RERb3hFpVQDO972+QBElTmaqtTML
         OfHN6cwoQak/I0VA5eCeC+uwrHR6x3vRUw3V6BCZFlGBU9L5GZ0PNslYDbFCO4/gpwU/
         qcktLCqdTpNIeq4ifb7kwEzz3POyVv8tS5MKltymYNgK5PKESQlp7Hz6ebGqESrMTLvY
         V+pCrbGW+KodePz3eoUowy03pRWpyDz8yya68V0KRkuAg8FjbZfRAVwYngLZ04XtgCMI
         ZAGIDW9Mh0hBlVROpUmlTkZxl7tJ/ub1yGkRTRmalQxOXeu88tDQDkairSwE500gt5A3
         qBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765279553; x=1765884353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvDD45RhBoypTIEIU6+VZMz01WBs5CFpnRzADYt4gVU=;
        b=ToSqC1MlvYKCTGc3hfzdsHw+xirnKPrcUmlm5mA7Ozi6E7mnPrOIdBQIKVVtqZZxF/
         s0vl4x02ErFKHkPteUnU7M+YtOQWXPb5d7ul3uSgLK6fkEHkWjGml4hQcb5ioTuqXS0L
         +OFdD6hDjzC9MJmTkFnCOwuxCqeDz7I3vIwmlwohDDXv5HIc52PkEiERhx6ltP2E3cU2
         U8ZwfVyZWtDrLbWMOYtRtowYXhrqIRIAP7wZedzQGT4aCNWIqThYxyhkNldT+Ksl0pci
         C38vJvUMhA1mcLPDLox8A/8ErtdD1xWNe+IrPjeZmW1F7/l6v3ozmfAcIj8de1dp8y3F
         ky4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWaUOTcE4qC8ZCtkI4AZ5LM3fK9H3NO+dNjjjfHAmbWFq8yOxw+2a+otJWsQ6Yz5NBpbufCY/6DFTdPK8jX@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFmxQN/BaL3DpBD2sbbgtfzqmIgrxH4N8MJ4h6zVWCZZOvHHU
	YBWyALiCglPE5XzhOjwT6wGNnhDAWSWOqCfr43Nw7MiqRN+l4itcFz+lk+U8q+CmtagySixjJhb
	oSLiDB0q2X/wRW0iVbXYECCq53tZUkCk/PEwv6SOVdkpF/Cfl0y/twpSoc9ZwgTec7SSD
X-Gm-Gg: ASbGnctyo6IEvdxvWQdn3Ag4Vxl/dJ8IgFzJZ/FYPLR9/1TaTSz4Wjybiw64TxzIdJS
	jvBNoMYPe6hU3hOR9vFvfunl5oWQE0QvwoxHy93UTJe+8znWZKwdXdXKUfBNSejYKiXvBnHc+FR
	nXfUy8tDw71BLHU5oVh1Upv1a5kh1AHlWCtIKPxcCnS/eJkk7wp8CL4zlukf5GDV26yK2KcfSrW
	PPqtK5gCZH6L1+SsqcwwZ1/7ECmwZfsm3DdOZJxb+YWvFQxb5Z5E4nn1eeE4xgCdQQNNEsgcpsu
	KxksH/IcSnDxGoYO8t4LE6IkzFkF4eQ/O1BVDbiN31f8W/xPSQK0GliJ3Z0VolWbdddDDpOh5X/
	WzJ33EHG+ykH5MW3pnzbNtVTd3PWQ76lAKxbn
X-Received: by 2002:a17:90b:3fc4:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-349a2383216mr9377647a91.0.1765279553421;
        Tue, 09 Dec 2025 03:25:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEhiKhxzloVAVDD7SMTU5H/0EbNUFXFZXddfP0ByD6tJ/lpwKv95r6+zJSHLiOW0qNdHwcLw==
X-Received: by 2002:a17:90b:3fc4:b0:32e:7270:9499 with SMTP id 98e67ed59e1d1-349a2383216mr9377631a91.0.1765279552988;
        Tue, 09 Dec 2025 03:25:52 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b9178csm2135964a91.12.2025.12.09.03.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:25:52 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Date: Tue, 09 Dec 2025 16:55:39 +0530
Subject: [PATCH v6 2/2] bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and
 IP_ETH1 channels for QDU100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251209-vdev_next-20251208_eth_v6-v6-2-80898204f5d8@quicinc.com>
References: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
In-Reply-To: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765279540; l=1454;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=+nRfEhok8twa4Xlo7PhnBTCR9iY5h7FrwyNjZGBqxEI=;
 b=9KkJ5O9oszdtZjNvDYyCiuz05nlJzO0EMIuX4M6xl275ahq89w8yfAYigRkU5bFVFPGxb2Jb/
 pIPqy2H5WRZATy+BzLnzy1JBysCimexGF5sm1iX4OXiPsqODXejsoz0
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Authority-Analysis: v=2.4 cv=dZSNHHXe c=1 sm=1 tr=0 ts=69380742 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Vo5YzJSDI_NEo2NC7oIA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: w-g3YiDoCcXZ_G5lrCbrON5iNq8i2MPy
X-Proofpoint-GUID: w-g3YiDoCcXZ_G5lrCbrON5iNq8i2MPy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4MSBTYWx0ZWRfX2RV8g3mToHLM
 tMIoN5iw8hKC0HbB5w4jSistkixsWEsJixuBpbeB0ZL2jo7LkEOaMtklBPyCq5qJ/sj+niOpDNL
 BOaExDy1hZLMOEDDEWIZSCtueBnYCnOf12OadUz2Lxgp1m4O3zO4IuQtFkV4aox0aE6wVtBAVEC
 VKfYNe2q3XIDujAMxobvSzKAtIGCF+V61habB6wBi8CRoKS1vrrhl2Gu7/BzXlNFyC8DahDp4Rw
 LTFhG+UvN3DBJNnZLKhZkuH37zCWkRTmIcaV+pS/H+T1XPiRQ1V0Xh0sF+AZ2QjLd1mvxY/5xSm
 kJgSGthTXyJdjZ3zdT/XQQW1ttdrqyVkgzC1iDoeFUJ+NeiP2z63fHEey4aF46TbIxU7z9NH5H8
 7VW7ke5XdA8g+iAdK/rwFuTlBw/MZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512090081

From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>

Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for M-plane, NETCONF and
S-plane interface for QDU100.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
 drivers/bus/mhi/host/pci_generic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
index e3bc737313a2f0658bc9b9c4f7d85258aec2474c..b64b155e4bd70326fed0aa86f32d8502da2f49d0 100644
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


