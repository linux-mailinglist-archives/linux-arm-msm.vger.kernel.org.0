Return-Path: <linux-arm-msm+bounces-71686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E4AB40F97
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 23:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E8B46542C5B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 21:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74776353376;
	Tue,  2 Sep 2025 21:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KU9FxQr0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7111F948
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 21:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756849551; cv=none; b=GMNMBKiqKhcAF2xRSRuhMSPxNsXG4lnnOZ6JXZ8T6QjlkjDTJ/d8vdh99sQ4Dd58LGqLKKzkwegE6bsSfvj2tGKpYaJ/79G0xZFw/fHKSI95IIAlT6S+9207AWXSOCsjuJIxTJQ2kqHlEqTirtzb/uPCh1FgDi9xRhW7P7XFANE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756849551; c=relaxed/simple;
	bh=qYbjt0FRDxWppmSPNceU5fkD9FJzBHfBeD7f4c9by6U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gdrVXAVJO3qxgArxSjd3s/kszeBXsJGxqCGmV4w6jY4153kW2EZOK2as/V1bzRvwoc4SvnKb6sriziCRAPmd/LI70fqm73MfJr8iPttuT4/jm3hN5E0VJmjhZtHDeMPJQ1CtwEUR/SIDNW7fSoE+BqOg9D13CPpTuXbASdK3WVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KU9FxQr0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582EqciI032759
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 21:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uQQZgphG6OFoqGrYvnuOA6GQYJfzJK/1Em6
	trqgSBFU=; b=KU9FxQr0S1hM6aTfaGQbAlJPr3sO7X01UNOj4kS1uM/qD00TI9Q
	pL/ZRMbwspj0ys6TIt9MP9pQEFPdKu6L2qTJa2tAqZGHj/Y+bP2Z14FY09FU5JYW
	05L8OnT17p4EgTSUpU4VnBuy8YMK4hhmrvXX9T1GQFFXaLUvbmw/ArhEyN5HtNFb
	hnZfSEVB0H2WpjmlYX2vIukGRtfbFjx6moY/OhcdVyN1ts/OZZEOZ8ZEVMTizxH4
	tW9bhBTHWbNJFTC/tZprCDbkltAIBKhdXBweT52D5pHWpYZk5GddlHVH8vRPElRC
	bX7We2C2OD1ox56+pwGTcRWawkjvLjZXWnQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ura8s9eg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 21:45:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24909dffc72so49925535ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 14:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756849546; x=1757454346;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQQZgphG6OFoqGrYvnuOA6GQYJfzJK/1Em6trqgSBFU=;
        b=PC8fOPNeXHLdnulZQd7R72XuSDegmLqTJlnk05uIaNC48C0FWdCpBu99X0TBYg/9/X
         CW9DgbKe4tdVRhI1pUOe5zyh1I+akb+8RiBikHcROZKTt33mH36+KdaP6nczaGF3syM9
         zzZlw+Ur5bFgk7+qHdRFxHcUU74+QZaON4Xz8V8lDr5y4MOIfvx5wOc/qnk2VOHWtY7g
         rgrp3xF17QoU2cb7RPnDWPcKR7RKQycGOMjSVv7ifyH4aflt1zxdSwzYjNldaBZQHOOV
         v6Z2mgcoEe+41KFlFeD9cRhi7qhfcUea8UuvHj52VtuqWQb/qw6Um92VoCSBVhTp10av
         w81A==
X-Gm-Message-State: AOJu0YykxqcCwmlZvkGyDpB8+2WE90+dlJrMDXbhgHmyv++i9ijZP8Cb
	ujESLDvsaMXolP723RnXEGhRU6pNrXKhMQGFgmT2ETJIv1dNLLQA5zhJwQf+AT3iaDyBF1z4IKK
	rEhJdWFTpyUVBVQ3EsLUW+O3MJ9ALTllWUOz4V1AODmO1iHY1j7x+CSWKo26fnDH61UWi
X-Gm-Gg: ASbGncsxctF5uwYkAxkztduMGeYrKkjjx1EwbTwpKsJpwmmwI4SsAyg3nRB5YccYfHj
	VNPNtelTgzk5Pzp9OkeNfjdBGxy0P2w5zafaoZMFm0J0tpk36RceXTtdy6Qkgh5ou/Y2XbAYDav
	buDlkmKMespnIXD8JxIfRThk/Dnth1BUpEQJ6w6n4feayknJoK9gw1PBnEATzlpusBGvvk9WIvf
	Ro52m9kde7WS6cJB52s0aX33cekjHFneEAJNxqinpH6z6du8Jxxe7WiQbsiKuaAmBOHwxNcW0G9
	aoIFybhSQBXlmfRLLnA0w7tvP7I9tXx8M6rf0ImAYNBV9XtqaEguslYP81i7aF/ZV3A76YnH91U
	7VNE1YuGYua9vFC8lDKf1m3ilAeY=
X-Received: by 2002:a17:902:e747:b0:24a:8ed6:fa0 with SMTP id d9443c01a7336-24a8ed61300mr149952495ad.54.1756849546251;
        Tue, 02 Sep 2025 14:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvIOhICh15uD16Xcr9z8S+z0F+ibedqbckSK2cFUoHumlbYdDSIxPBy7TIzVczTgcnxsaRRw==
X-Received: by 2002:a17:902:e747:b0:24a:8ed6:fa0 with SMTP id d9443c01a7336-24a8ed61300mr149952285ad.54.1756849545811;
        Tue, 02 Sep 2025 14:45:45 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329cb6a2ec2sm4746324a91.21.2025.09.02.14.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 14:45:45 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels
Date: Tue,  2 Sep 2025 14:45:44 -0700
Message-Id: <20250902214544.543038-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CuBKbNfgsJmjdH_GNutzUrsf8161cxZm
X-Proofpoint-GUID: CuBKbNfgsJmjdH_GNutzUrsf8161cxZm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAyMCBTYWx0ZWRfX/6PIHVduz9Y/
 GZuYYru0mzOZAoqQoJEVUzmU2BgNFrtDOMQgCwz108+VNNMxpcWBqWGtFFxj8z11x46aNmCHM3/
 i6UwkLPs7Z27Fuvuna8267EYYRLi1zZUiieDwqdDnAliBiXMhjU62gw1Rp7qKKzo9otwzi9Lt9r
 Rq6JTWwEXVn3E4Kkwwhp8l09lwfCK/2Ev5rr4yECxVw+sI4FRH/Xj6A8qhs3EOq0e7TGiRnyuTI
 Uwn652IvHhPR6tWM2tHM+u1yGYDB/V/hR63nZps51eBnNFef1qBGjm+MFYzqKGWGNbNYY+LxiEA
 WrUySUBWbwOZuSp2PFTE2ospTLQ9cYybOhHvcsGsb0kq5LcgGLlnJrh5jPvXZLKGdZSoelKHsUy
 0uxzc4AD
X-Authority-Analysis: v=2.4 cv=VNndn8PX c=1 sm=1 tr=0 ts=68b7658b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=XlvkYG1BLVWRrT8hbnoA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_08,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300020

Add support for charger FW running on SOCCP by adding the
"PMIC_RTR_SOCCP_APPS" channel name to the rpmsg_match list and
updating notify_clients logic.

SOCCP does not have multiple PDs and hence PDR is not supported. So, if
the subsystem comes up/down, rpmsg driver would be probed or removed.
Use that for notifiying clients of pmic_glink for PDR events.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index c0a4be5df926..bcd17fc05544 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -17,6 +17,11 @@
 
 #define PMIC_GLINK_SEND_TIMEOUT (5 * HZ)
 
+enum {
+	PMIC_GLINK_PDR_UNAVAIL = 0,
+	PMIC_GLINK_PDR_AVAIL,
+};
+
 enum {
 	PMIC_GLINK_CLIENT_BATT = 0,
 	PMIC_GLINK_CLIENT_ALTMODE,
@@ -39,6 +44,7 @@ struct pmic_glink {
 	struct mutex state_lock;
 	unsigned int client_state;
 	unsigned int pdr_state;
+	bool pdr_available;
 
 	/* serializing clients list updates */
 	spinlock_t client_lock;
@@ -203,17 +209,17 @@ static void pmic_glink_del_aux_device(struct pmic_glink *pg,
 	auxiliary_device_uninit(aux);
 }
 
-static void pmic_glink_state_notify_clients(struct pmic_glink *pg)
+static void pmic_glink_state_notify_clients(struct pmic_glink *pg, unsigned int state)
 {
 	struct pmic_glink_client *client;
 	unsigned int new_state = pg->client_state;
 	unsigned long flags;
 
 	if (pg->client_state != SERVREG_SERVICE_STATE_UP) {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_UP && pg->ept)
+		if (state == SERVREG_SERVICE_STATE_UP && pg->ept)
 			new_state = SERVREG_SERVICE_STATE_UP;
 	} else {
-		if (pg->pdr_state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
+		if (state == SERVREG_SERVICE_STATE_DOWN || !pg->ept)
 			new_state = SERVREG_SERVICE_STATE_DOWN;
 	}
 
@@ -233,7 +239,7 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 	guard(mutex)(&pg->state_lock);
 	pg->pdr_state = state;
 
-	pmic_glink_state_notify_clients(pg);
+	pmic_glink_state_notify_clients(pg, state);
 }
 
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
@@ -246,10 +252,14 @@ static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 
 	dev_set_drvdata(&rpdev->dev, pg);
+	pg->pdr_available = rpdev->id.driver_data;
 
 	guard(mutex)(&pg->state_lock);
 	pg->ept = rpdev->ept;
-	pmic_glink_state_notify_clients(pg);
+	if (pg->pdr_available)
+		pmic_glink_state_notify_clients(pg, pg->pdr_state);
+	else
+		pmic_glink_state_notify_clients(pg, SERVREG_SERVICE_STATE_UP);
 
 	return 0;
 }
@@ -265,11 +275,15 @@ static void pmic_glink_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	guard(mutex)(&pg->state_lock);
 	pg->ept = NULL;
-	pmic_glink_state_notify_clients(pg);
+	if (pg->pdr_available)
+		pmic_glink_state_notify_clients(pg, pg->pdr_state);
+	else
+		pmic_glink_state_notify_clients(pg, SERVREG_SERVICE_STATE_DOWN);
 }
 
 static const struct rpmsg_device_id pmic_glink_rpmsg_id_match[] = {
-	{ "PMIC_RTR_ADSP_APPS" },
+	{.name = "PMIC_RTR_ADSP_APPS", .driver_data = PMIC_GLINK_PDR_AVAIL },
+	{.name = "PMIC_RTR_SOCCP_APPS", .driver_data = PMIC_GLINK_PDR_UNAVAIL },
 	{}
 };
 
-- 
2.34.1


