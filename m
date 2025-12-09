Return-Path: <linux-arm-msm+bounces-84768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EBDECAFC2F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 12:26:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 57190301F5C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 11:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063D3320A10;
	Tue,  9 Dec 2025 11:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed3abrwY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HDwDOYiH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DF7306D4A
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Dec 2025 11:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765279549; cv=none; b=TJe8GfHFzv8izcNf4NhkG+y/pe6jb8F8uPnrqGSkvrg5WNNzDwMXSSzG+gPFzCHqDUV0EAvvxeCQ3pW84mg8ZzOib/z5KcfHMdhXQms0YRzaa/jiWj8yAlZngeg3syawoOT8GXJHZw4i8zleZOKJFnADRMQqOINTleLTiSbncLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765279549; c=relaxed/simple;
	bh=DsiJN+x8Fqjt+HlhEmfCrebctPNMtUSyNZcOLLpnAeg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CZH7eI5qdx7Xx+8dzxqR7RAJbDOI+yX6JIgkKFOfsJc2VLPx+Ny4PE35J0tB8EGOES21w3IrpweLV3d4ivtfw+Snp4HCwpzcry0fc28af3z+qslnBRTSjk99O2idiiD+btRbsr1o1OnBpL+OJ3p8Yh8JVEMARvnEokzsKptTu5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed3abrwY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HDwDOYiH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B99NDP22559530
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Dec 2025 11:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsBgdJ+ubxIlMlId0qH8F8
	slq+A2hSv7BDe8MHbvG64=; b=ed3abrwYdom/+eT1rno8AvMC74c5yHWsG9C/hy
	ho3/zxuCilqP6vk0IaIj4UhPnEIrbjC/EQ/HTJ+HcQRXnnBk+0533y4WYJRfTWNG
	LEJ8Pd5Pkjo8yLBT7Gg2y052xsc/ZdEGS1XnxpktY4/vgzGnqdkC/FOVvppg01gb
	5L4YO4rqqrE2KbmDwR0LCxiwtrt+UMRmCYILJ2kvgqjmLbHHuJZYh326nx3t2eJB
	UjBGQlKGe1X+l6pVQKs+HaD2QSyUN2X3FULbgFlg2+EEGbahcmQ97GzHRkAQz4tv
	6m4Yba7fjpPHgERsLoXX6jtntdM5vNB5+rFKjwHU2SqxH9AA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axesf0t6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 11:25:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3493fe3185cso6586573a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 03:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765279545; x=1765884345; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VsBgdJ+ubxIlMlId0qH8F8slq+A2hSv7BDe8MHbvG64=;
        b=HDwDOYiHC2orU/L7HEOWOJnTUx+VLRek6QfFJ7EDPhfotu8v9rzWsyEQwR5MTO8pfG
         Lagbmpnff9q/PNb4nYFgNJaZrjK0QrqhzjzM7p7nowLHMnZKxzuWg0l4qaS3tgnCXnZF
         +QY6B80jdSTuNdf1P+ArPIFHjgXqFpWLDMJ79aa75MnFNRamR1/3aucb0mDzQRxIIU+v
         Xx02HINnEzZLPDJIKXnRZxGZvYm76/OYTTu+EXqGh7hO3rsxfurcy5VFhFMYGGWTA96J
         hm8CQOCFAhS419vUgWCdmkl8QGaLLk4BfJoE/5EpFFKufxRwRmIMfYtOOZWXga7Qa9jE
         WSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765279545; x=1765884345;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsBgdJ+ubxIlMlId0qH8F8slq+A2hSv7BDe8MHbvG64=;
        b=U2BGVpAvkEBVEbUucgoYMEMHmKW13L0v81XROQPaKx1Qg5uHGARqJH6BjktxLawNB3
         V2a6yHJMrS94Cq9Bi+5uJIzHIO9znlNowB/iPdgBZU3m5yvK+41ckQh3DzU9/5MyEMrK
         VIEtetFddo7f9xPKgECMuTRUWbQ0DZR0WZQDXj7ImDOEaeCSnWs32gwmzJM+7SJJTxd9
         WUHti3BiWHVvtocxkNlq18CO6tSyino0ObSInptRaD0eXQF5fnZcDY+l6skeHKsT2wni
         nDudPRXeyed4/fSczwSGBCF/isIFJhMtlVnr3HsPP6Ngrn5t3Ge5uW/EC5UJP2ZaFfvZ
         M0VQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxWwlNrMPLukpnEp3zqA8wC4hWhHPlumNxV3vG8bRK/wxMewiL9hN9q4yvJ1FJqq0oCrpbGsd2h6jW4kXr@vger.kernel.org
X-Gm-Message-State: AOJu0YywQou7dG5KwkHwHNfA4gUPJaxamjElk+rqyT+03kIdBOgvUhuh
	O41qLPPDvdVDEOP09gqCyfD7xzi2SL+nVCFMW6r/A81JvpYcF6Itv/gTRyMkoKIUVOi6qGfMNWO
	4HZb/liQZuM7QBwnEjavEoqtxRU2eJ6R25EhG7xHCrpNAxo8+Xy1Qdvw4F4QJFz3u8T+u
X-Gm-Gg: AY/fxX4jLp/SpzwqYXWct+BxOZAID8peWdibdgEjwbHDz0NzBpYLBgRaPH1SFyoISqI
	TKr9obd/umNZQ1us82HCkOHyNTcOiaZBAIFOZJ52gmc/WEa+D4nWBE0FHC5j431GenI8apQAq4p
	fF4F3k3yT2KTa0zwIll9Cp1Cjlj72/LVAn3NAq2VFrSkzRTEKEbSW+M7LYS5PCl8rmb+ZcKHxRv
	UHyOTwq0iJSwjNAqVYZqwyoYVtYByxLTrrOH/kCIvKWqp7LwCIVWRWS5eezaWMhFp2kzpdakPBw
	BIPUVKdjTvb2o1ckrktne7Ro6XYzHDIVACT1dyuJp2FOtDodh4XbEQc/mOOmn8kGRpvyn+VLZDf
	nl3anYTs32VpKyk99wGCwfhr+wXPvPl4x6nku
X-Received: by 2002:a17:90b:1f87:b0:349:7f0a:38e0 with SMTP id 98e67ed59e1d1-34a4f8bc3d6mr942783a91.17.1765279545543;
        Tue, 09 Dec 2025 03:25:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGczqed4JYXeBh97lxyTB5anIJMDGPxDqMP+bWLrjssFzZu758BmfhApm7fzoyy9+J7HleFog==
X-Received: by 2002:a17:90b:1f87:b0:349:7f0a:38e0 with SMTP id 98e67ed59e1d1-34a4f8bc3d6mr942765a91.17.1765279545080;
        Tue, 09 Dec 2025 03:25:45 -0800 (PST)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a49b9178csm2135964a91.12.2025.12.09.03.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 03:25:43 -0800 (PST)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Google-Original-From: Vivek Pernamitta
Subject: [PATCH v6 0/2] net: mhi: Add support to enable ethernet interface
Date: Tue, 09 Dec 2025 16:55:37 +0530
Message-Id: <20251209-vdev_next-20251208_eth_v6-v6-0-80898204f5d8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADEHOGkC/y2MQQqAIBQFrxJ/nWCWUV0lQiKf9TcWGhJEd0+i5
 QzM3BQRGJGG4qaAxJF3n6EtC1q22a8QbDOTkkpXSvYiWSTjcZ3iV53BuZnUiqWReoatagdLuT8
 CHF/fe5ye5wW+OMAHawAAAA==
X-Change-ID: 20251209-vdev_next-20251208_eth_v6-c405aed13fed
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765279540; l=2389;
 i=<quic_vpernami@quicinc.com>; s=20241114; h=from:subject:message-id;
 bh=DsiJN+x8Fqjt+HlhEmfCrebctPNMtUSyNZcOLLpnAeg=;
 b=yCEy1+3+fTCjhl2Y2Mp6zaC9Tm+MeaGfiLGbPV1B2s+Yc6xPUPOrHwQ3WONSqCqgIxIk9Lv5t
 TKTiGS9px4PC4bCbXD84RTbn8ojO9JSsFabbiY8oCUER/apsllhZMPP
X-Developer-Key: i=<quic_vpernami@quicinc.com>; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-ORIG-GUID: 0yd3H450RIapcrx-mbJBei7xb37OMNIU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDA4MSBTYWx0ZWRfXxtIr632H5m5n
 9XN2JgGoWgd2vFC6tQlGV8BO7VqdOTogGO9y3QC9GBEH8Bzc7k7y17xub4r6Cpv6MGnJZnoQ2+d
 ATl9z2cNuXYMQFsLgP4JttXBMoC+uWL1lRbtt4htn4Yuh4UXRXfEH0JLWFXKAOKiWSnCAEcWV5p
 MgZC7ekOjRqY28jYrSHLS1ToGfm66OqUQKsrIu3goIboKI3x0OdKf5WSiG2x6CrOp3Uuc4R29r2
 JXatByIHa1Xdkvx/xjgQlIxrtoAUiODylJ2JKefNHtNNdmhSur0Y9C9YPcuHG6I1n5ndOfGR2LM
 HDnzljQNp7y/6tZR+RzcWi3UFMHqh4H3PLjrto66ayksL1xgQwkGOElx+LhK21PG/k79d3/tzG2
 kKdQWI9Baq6yc2uU95H0iILu8VDdrQ==
X-Authority-Analysis: v=2.4 cv=fMc0HJae c=1 sm=1 tr=0 ts=6938073a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=QULB0W7ECN1Zqye5N6MA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0yd3H450RIapcrx-mbJBei7xb37OMNIU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090081

Add support to configure a new client as Ethernet type over MHI by
setting "mhi_device_info.ethernet_if = true". Create a new Ethernet
interface named eth%d. This complements existing NET driver support.

Introduce IP_SW1, ETH0, and ETH1 network interfaces required for
M-plane, NETCONF, and S-plane components.

M-plane:
Implement DU M-Plane software for non-real-time O-RAN management
between O-DU and O-RU using NETCONF/YANG and O-RAN WG4 M-Plane YANG
models. Provide capability exchange, configuration management,
performance monitoring, and fault management per O-RAN.WG4.TS.MP.0-
R004-v18.00.

Netconf:
Use NETCONF protocol for configuration operations such as fetching,
modifying, and deleting network device configurations.

S-plane:
Support frequency and time synchronization between O-DUs and O-RUs
using Synchronous Ethernet and IEEE 1588. Assume PTP transport over
L2 Ethernet (ITU-T G.8275.1) for full timing support; allow PTP over
UDP/IP (ITU-T G.8275.2) with reduced reliability. as per ORAN spec
O-RAN.WG4.CUS.0-R003-v12.00.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
patchset link for V5 : https://lore.kernel.org/all/20251106-vdev_next-20251106_eth-v5-0-bbc0f7ff3a68@quicinc.com/
patchset link for V1 (first post) : https://lore.kernel.org/all/20250724-b4-eth_us-v1-0-4dff04a9a128@quicinc.com/

changes to v6:
- Removed interm variable useage as per comments from Simon and Dmirty.
- Squashed gerrits 1 and 2 in single gerrit.
- Added more description for M-plane, Netconf and S-plane.

changes to v5:
- change in email ID from "quic_vpernami@quicinc.com" to "vivek.pernamitta@oss.qualcomm.com"
- Renamed to patch v5 as per comments from Manivannan
- Restored to original name as per comments from Jakub
- Renamed the ethernet interfce to eth%d as per Jakub
---

---
Vivek Pernamitta (2):
      net: mhi: Enable Ethernet interface support
      bus: mhi: host: pci: Enable IP_SW1, IP_ETH0 and IP_ETH1 channels for QDU100

 drivers/bus/mhi/host/pci_generic.c |  8 ++++
 drivers/net/mhi_net.c              | 75 +++++++++++++++++++++++++++++++-------
 2 files changed, 70 insertions(+), 13 deletions(-)
---
base-commit: 82bcd04d124a4d84580ea4a8ba6b120db5f512e7
change-id: 20251209-vdev_next-20251208_eth_v6-c405aed13fed

Best regards,
-- 
Vivek Pernamitta <<quic_vpernami@quicinc.com>>


