Return-Path: <linux-arm-msm+bounces-83962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76BC975F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Dec 2025 13:52:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 02C2D4E6F6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Dec 2025 12:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EA9530CD87;
	Mon,  1 Dec 2025 12:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIRYQvIt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/pm3Fd0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A6730F958
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Dec 2025 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764593011; cv=none; b=pgd3c7W1/cpZYESFbAiyQUuw/tZj7wc3zYHHw1R3FYdKW0GYG55bdcuH6/tkDfMqZBGLbQCewp8ZoPgN2/DH0mUpLgVwZ0k0F6B5OSBeUSXlkRpF5u2cXz6E6eqCE26ZK9PX5NWQc9YWfa8fqYgSjNLazzkgNyIHKt5cpNi2lv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764593011; c=relaxed/simple;
	bh=pcAmflXBLmmiVoJCOG8vI54ZlYxumcRH+gZ9quI/3uc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QrY4UfowckzormrpV60XZNFdXxTXP72kQaVkZJeR+f2RIJXqnogJQwUTuzpc+VByk+/NyMZNvGwH8BqrpITUomX3qHPsyaUW4GM0pOojVKvCyQJkUVajPRjlE0VrXZ54CiT1tAwrLxvxfQ4/n3OPbktlXj2tjE0Xc3oaQVUvwds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIRYQvIt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/pm3Fd0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B1AxkB7349672
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Dec 2025 12:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OpaVvLRzwNyUQHnkwzspQd
	lBGKDEqFvfhusWSTkPKsI=; b=aIRYQvItIVN6H7Rm22Diks4D2bBagGteD4OY9M
	87t0BN05Tv8FwocgB6YkjPfCpa/WCGXBJkMpxNeBw+DAS/AHehA52463Q+zb2B+b
	nULQi+MiWKQsyjmb6jaFoYTyzVJ/KNUyZrjBkupvAwoyoNv+Cj7qzUyrfnO3VhAJ
	RnpDvsMNhyUNgniGK8tbR28JbeWpaWObLySCDgFAPsp26mSByJSnbuxDbXVJ1jl8
	YylXM8wkXvP/wM0BHaZlwXn+KY1Ytgi8ebTfJYQanaSOdjtsO1OImbkHT4hyAmd6
	xS78+yNi1iaZELj4eZBEl5bUaAmhkuE8RFo3i2x+Z8Ehc+Ag==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as9re08fw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 12:43:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3438744f12fso10351629a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 04:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764593008; x=1765197808; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=;
        b=W/pm3Fd0GYxOzC6NTQX6KeSx+rfvmyGHK0PkkOYk4dh8Z9U7mis0UVvEYOjj9CiJ7J
         uYXtqBktX2i46PyBRK30paB98ZsXO7cbxeEuuoNi3GQqyzlF199W9IhBqmF4efXv1wYx
         I2BxINq5le8zos21A1Z0SzY41gKzt6Pa94E2j/A517SLAxpadSXmHzjXOLyyVghkencb
         xfAWGR2BEHZL+2/Tw5FRsHkZMZVhYCJ7ZJGEvCf/Qg4MeLYNnilI3QE28L3PL1WrAPYx
         5DDjVZzmA/IJEXALDNy5aKzilCKT6E0yub8jUZpnag+bVBQnrnwF1LudsMuuubK8P3QT
         Smcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593008; x=1765197808;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpaVvLRzwNyUQHnkwzspQdlBGKDEqFvfhusWSTkPKsI=;
        b=BdzFbYmBK+U4Yis2iJ4eHF7ffjJM0xa1l5GseUm3sSx5/5WGUIGglSbtWBvYvEQMXJ
         GHkUQ0YldGqV/crx6h84nyjgISyxq1Uglk/gGeHZPPMqhfF0Qegilt6YXhSi3bw6Ln8y
         rWYKXUKs5AYTsABfQWIsb3mPfllvWig6JqNLLajrKA3W1zY9MaOrqSrEunEAWAQ5aIpk
         LCgZxmivMEhwLw6x+Nn6bR36WbiglyvWsQAm3Y50CqRwV4LmOWCO1f3TfVlvRCzb5jY7
         QNSmj31RCoHOEfJmhr5Yy8sKBHFYSYAUQjY5LejH29znLG3ouCVToePzjMlcVwyfF2Gr
         KQCA==
X-Forwarded-Encrypted: i=1; AJvYcCUd9MehHxeFe07wXQLi5c+JCE4NisHoYaTplRZdfy93D4jZTA3nJcdtlYL1Tbc2nfC33dgI4roXHn2UeIts@vger.kernel.org
X-Gm-Message-State: AOJu0YwaW76fyvUzDTQkwFBkzasrPZl8NHJFJazG3RPtNoy9pgpxYu3q
	hqcXBPiCoMB2RoloZ5zJQ8KXF/irKkjd1Iwplzqj+6TkfTlNq3rq1svIw10u6Ie7OlK58URDKt7
	tLNPg5bq/NFhmWmaHaie09gDEmAtQuTZEBZjsq6Eg163YOXDjiyrTZ83aqiSYpI9mzDZV
X-Gm-Gg: ASbGncvqWauSa4dmLaFnxsK7TZ5QqNw0CFeAq3f3iUMtCTzvxCzUUzWj175lvQdUBNY
	Kv9FFYjHkjg2XliRdtteL3iWn179+5eNkfDSGYKZOMvdbQ16quxg+KrZl+37q1csJHDVTx9ORrR
	2QxJ+anyOANHPKjP17IvQhoZ5OKqpSKOwMBVI85P8QApZAq+TUTX+/PTCGDvBjj6DeyouuX1dMF
	5HTRA90jhHyKhc3H3pj/dd07uiLo64ko0yEJLQB29eaaTs2yPcs96la2ShiIv8rW7qa15uPcNb4
	i3Gm5oYForf9251tmlFvb7VE2U4Z0DU3A5KUEbrJEewMLooQjTLn3KCPHUlmPonqoMfe1aFQSTH
	IGPIiwfCVmbyPb1FsoN6l1/EW5XzgWSRyMgrqZnIlD8mM
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr23965828a91.0.1764593007437;
        Mon, 01 Dec 2025 04:43:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEv8B/BJPSnkWjiTMb7xYIiTIMYZhhsAalx82O1NZpK1LC5SmZOTri+p5+kwNW6kRi3n2zqKA==
X-Received: by 2002:a17:90b:4d8c:b0:340:f422:fc76 with SMTP id 98e67ed59e1d1-3475eacec4cmr23965790a91.0.1764593006781;
        Mon, 01 Dec 2025 04:43:26 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3477b733381sm13146374a91.12.2025.12.01.04.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:43:26 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: [PATCH 0/4] bus: mhi: Fix broken runtime PM design
Date: Mon, 01 Dec 2025 18:13:16 +0530
Message-Id: <20251201-mhi_runtimepm-v1-0-fab94399ca75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGSNLWkC/x3MQQqAIBBA0avIrBNSEKOrRITomLPQRCsC6e5Jy
 7f4v0HFQlhhZg0K3lTpSB1iYGCDSTtyct0gR6mEkBOPgbZypZMi5si9NuiUtFYpDb3JBT09/29
 Z3/cD48F2Gl8AAAA=
X-Change-ID: 20251128-mhi_runtimepm-f7aed52cc557
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, netdev@vger.kernel.org,
        mayank.rana@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        vivek.pernamitta@oss.qualcomm.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764593001; l=2451;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=pcAmflXBLmmiVoJCOG8vI54ZlYxumcRH+gZ9quI/3uc=;
 b=slzoUkXd0LXre+U/uahaSU6CBfrkxDBvVi4QeGDQK13BAyAiueJULdaXVh7J25NweEqG9OK2p
 erBF5E42uRMAb3WmzCyUihVee/TDBYZ7B1BllpmT06WpiCHrcGUQ+TJ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEwMyBTYWx0ZWRfX/PBZ7AS/CpbA
 7hSYXo8/ZRmf1ekJfRu1ykfluLFplYOAeYrc9Hupfuab3GrefSIKunT5jSdyC/tuasU6hrBNozt
 MGqQVUHRCzMyJxBGazKv8Gv5sITAdvqEsvT+mu8eVG1RCeA0MCeoZFurxG86qo6lRu+Asqd8sKg
 Ek8gtGRb/wQzx79467FOWiBAzoFxTa1kfvWFBBjwuUsBtqyr1vIpRc6KmIdzK8i6SIGe12w3EhH
 MCYusekxBX2HHEudK+vSotz4qI013aJAazPiV9G3pfgupYCqlbtcJz45stfxyhOWFHFaRXMYs4D
 FJV4lYaIbhiIRA2JVS7wvjP2iuYvoqasqp8Ik1Y5SVNl1csmJLf3gAv3hLSBrtwX4WZKRJz81W9
 gKXT8e4p0p24Z85Or+E/+1wwI5p/gg==
X-Authority-Analysis: v=2.4 cv=MNptWcZl c=1 sm=1 tr=0 ts=692d8d70 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Fm6EAR0vVewXWd2bb8wA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: xEGclmJ_AksczTGcTQ0iYitGmPAWQs8B
X-Proofpoint-GUID: xEGclmJ_AksczTGcTQ0iYitGmPAWQs8B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512010103

The current MHI runtime PM design is flawed, as the MHI core attempts to
manage power references internally via mhi_queue() and related paths.
This is problematic because the controller drivers do not have the
knowledge of the client PM status due to the broken PM topology. So when
they runtime suspend the controller, the client drivers could no longer
function.

To address this, in the new design, the client drivers reports their own
runtime PM status now and the PM framework makes sure that the parent
(controller driver) and other components up in the chain remain active.
This leverages the standard parent-child PM relationship.

Since MHI creates a mhi_dev device without an associated driver, we
explicitly enable runtime PM on it and mark it with
pm_runtime_no_callbacks() to indicate the PM core that no callbacks
exist for this device. This is only needed for MHI controller, since
the controller driver uses the bus device just like PCI device.

NOTE: As we have dependecies with other subsystems, Mani can you take
these series through MHI tree if other maintainers give a ack for this
series. To all the maintainers please ack to this series after reviewing
so that Mani can take this through MHI branch.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
Krishna Chaitanya Chundru (4):
      bus: mhi: Replace controller runtime_get/put callbacks with direct PM runtime APIs
      bus: mhi: Remove runtime PM callback ops from controller interface
      net: mhi_net: Implement runtime PM support
      bus: mhi: Fix broken runtime PM design

 drivers/accel/qaic/mhi_controller.c   | 11 -----------
 drivers/bus/mhi/host/init.c           |  1 -
 drivers/bus/mhi/host/internal.h       |  7 +++++--
 drivers/bus/mhi/host/main.c           | 23 ++++-------------------
 drivers/bus/mhi/host/pci_generic.c    | 24 +++---------------------
 drivers/bus/mhi/host/pm.c             | 18 ++++++++----------
 drivers/net/mhi_net.c                 | 13 +++++++++++++
 drivers/net/wireless/ath/ath11k/mhi.c | 10 ----------
 drivers/net/wireless/ath/ath12k/mhi.c | 11 -----------
 include/linux/mhi.h                   |  4 ----
 10 files changed, 33 insertions(+), 89 deletions(-)
---
base-commit: ac3fd01e4c1efce8f2c054cdeb2ddd2fc0fb150d
change-id: 20251128-mhi_runtimepm-f7aed52cc557

Best regards,
-- 
Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>


