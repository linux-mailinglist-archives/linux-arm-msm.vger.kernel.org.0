Return-Path: <linux-arm-msm+bounces-77658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2602BBE5E46
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 02:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38F0E5E64CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 00:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BE4222568;
	Fri, 17 Oct 2025 00:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GhepwMx+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE65214228
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760661042; cv=none; b=r2L8VDf4k36SoGGC+HKHl2Cd8oPguiTSDCq6jRz/nxDW7dm+epfrD94CMAIPpIRvhuO2VmG+ZO2tJUZe+6/g1ZSqCnrjTSgVLIEST0PFLJemtiYQPH70wzy5SwbsvMZyPCtdo1j0Z2o+ncRgUecjsUQzaQRBavHU1b/nbyej+jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760661042; c=relaxed/simple;
	bh=WByn/huD95vkLRCvHBxG1KJwB7ue46+k82cXqCA5JZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=moqESAsj8p9HAr6DAR3EmGEg1eui4irNQ/Lv0PLX2FkNEqFimxEAW/otKo9fP0bYghm1iwpYwIkPmbPRk3ZHiqllgf+07DrY0qk4YAI3WoEz2TK4ay6lrcunCXdd7z+jLZKLWn2bu53WIooUF8ooO0UsjBEUV6XyvnhVdi7w8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GhepwMx+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLSCD020271
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4yFDmhuv9dv
	yyZhMJJxear451fNKAo3tkychOEGOyEk=; b=GhepwMx+H1OdAaLM/XvL41Tv7X5
	HSZ2JFKqHD3YJxVRSy7daJhKj1X2T+TPSSj8AuALd6Pfu8wME8UvucPjb/Qp5o9E
	UfR3AjxgCO2gj4XVYDbMMFUeR255q0B3J4kMjbo5UHTUXcrPVfH4d4ek8Pcul6TG
	9/aItDgkWCO/Q7gapmD4GJ9TPh0qttXsw2SyUXeDUz6F9/KyT/lwDb8AvA2wXdgH
	7RuaIfuDLV5QkCeUtse6XRkV7VLAS+HxSFUk1aF7V6UBAp7xvFTXnW2PaYQatsLi
	OU5ReWjFFNV0EGPZV8/L7nEwf5oyt7XyU0yV2AFv6Hv6igJoDAZVqi1qoDQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8ryh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 00:30:39 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7810af03a63so2812906b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 17:30:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661038; x=1761265838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4yFDmhuv9dvyyZhMJJxear451fNKAo3tkychOEGOyEk=;
        b=YMEu82bMuvLC+Lsyxiw2dNZo0M4A78R8OaCPTgXGU1nikRIzf4hLbyZlcpTulzx1g7
         PRequS4cJQPhyPmlC3JpHchUnbkvJ7B/oDZ/CFTyeSiEznh54j35V89w1qQeFO5c1de4
         9Fhyxfmo0bvLk2jdiaU3so0R5bF1g+L/cvPc/DFQBWvpdzFUtZIhrH5BVAhZiDKH6Hmo
         AxuKL3vbX2mKs3mirD7tMv90bZLWUZqiEehDu9JLcZfQbzNFBMX/eFJcjrq5hJIF6shP
         /k/pGlPhNs04veh0SQ2PafjZOWUyTzv1W/ylu6L5eVa1AL6pIcm70hh1nWoljW/Dyo3U
         UHCw==
X-Gm-Message-State: AOJu0Yx9w8UtlGym812eUvHXV//ovVYvenk0KxY64BbY6rWEPOrnOaxe
	gbjSqXPaVtg0FJMzeI/7WL+ic7yfSxdicA6rlIWLEoTueFf7Y/ERU2okgmZd9JzYQq155vWYutZ
	X3qZKl+vdKilj/zetIgEvfyCfjMyKDNJW9dar1GTzDiTc4Vt/9xAnIFiYxqjKgHCF6mK+ugU+VB
	Sy
X-Gm-Gg: ASbGncu/fQMABCyZ6UoX2dpDBw2xvCo1zOBPvzcyCUWrtX6v3rzJmEWjv80ZElYnEui
	VmNt5zO1VB8HB3ZSPMr8N2mMBsOrDMtrXLGq8MquKV6DiO/EaLjbQJRF4DuCaMiZqgsknaEzfDT
	1FmIWYtwVZyCZYm8/s0Zb7gIt+FnrWVjCv8texiGZEdO0pqxVxV8oj0KG8P73vQ8CUyaKNc762b
	ROF9l00yWemHanmLF5hDHOB9SD1XquQd0n2QFsDqbfBtLHdGy6cP5s/pQOy78sug1usSLJkirhh
	j604KRiP3GSnsS9ABQ7vOGFo6VPSHPlI8G7TgRQVLk+2Dx1FFTqrPa9VhpD5r/gsH1Ry8Xdhrr/
	G14/ABMgfNeNmr4RPcRtaby9VYNhWWJRugfabpYKM/H116gJGGJizgpRIrLrI9w==
X-Received: by 2002:a05:6a21:33a9:b0:2fd:a3b:9349 with SMTP id adf61e73a8af0-334a8650af5mr2013504637.57.1760661038180;
        Thu, 16 Oct 2025 17:30:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG3hg4Yb7WGHko8UMgn0cThnFRccxK0T23SFcRXt8x+Scof8EP3nuTlw3EJJ1Wjce8BodaVQ==
X-Received: by 2002:a05:6a21:33a9:b0:2fd:a3b:9349 with SMTP id adf61e73a8af0-334a8650af5mr2013473637.57.1760661037761;
        Thu, 16 Oct 2025 17:30:37 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0966d7sm23613050b3a.40.2025.10.16.17.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 17:30:37 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] soc: qcom: pmic_glink: Add support for SOCCP remoteproc channels
Date: Thu, 16 Oct 2025 17:30:32 -0700
Message-Id: <20251017003033.268567-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
References: <20251017003033.268567-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: R9g7nb2LVlabVWttJZlvlE7IHfUiDDeu
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68f18e2f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=U2TDSMueiEXJ_JPGoVUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX/ZKZ2OU8YMph
 uBrrjASAUUuUGcTT7cYLc2hz3jIH0Ncprks808G7NaQHjlQKHcHXXhZ76gEOpnYj+IsQYxQ1dDR
 5GspNecId8rEym7KZnu0V1RCdDx09BgrakxW/49zVsu8vJjOd0y7yTzDFnd7q+G+vH+Y+MyVa9e
 k6DtiJwYi0FoulTSv4PH29jn2io56yeD+CP+NhA6Digi2IhsnwPMu4KmUJR20huPxAqHn1B7blR
 RQZu8eOgzmvFBcUuQtiwX2cEeIHqotlIdlRfEn9qcdjtCxNYOO/4RuvjbTw5yZLE0qKsv6tKDgC
 yq+6vaDXbAegOSOxBQL5rOV+bws4Vm5My4bA2vSbzAD1u48gL+taAIIgC+BObH5V3prKTmvCXzx
 6Edu47YARJ4E5cKLcjsfFZr0n4wT3Q==
X-Proofpoint-ORIG-GUID: R9g7nb2LVlabVWttJZlvlE7IHfUiDDeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

System On Chip Control Processor (SOCCP) is a subsystem that can have
battery management firmware running on it to support Type-C/PD and
battery charging. SOCCP does not have multiple PDs and hence PDR is not
supported. So, if the subsystem comes up/down, rpmsg driver would be
probed or removed. Use that for notifying clients of pmic_glink for
PDR events.

Add support for battery management FW running on SOCCP by adding the
"PMIC_RTR_SOCCP_APPS" channel name to the rpmsg_match list and
updating notify_clients logic.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index c0a4be5df926..627f96ca322e 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -39,6 +39,7 @@ struct pmic_glink {
 	struct mutex state_lock;
 	unsigned int client_state;
 	unsigned int pdr_state;
+	bool pdr_available;
 
 	/* serializing clients list updates */
 	spinlock_t client_lock;
@@ -246,9 +247,12 @@ static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 		return dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 
 	dev_set_drvdata(&rpdev->dev, pg);
+	pg->pdr_available = rpdev->id.driver_data;
 
 	guard(mutex)(&pg->state_lock);
 	pg->ept = rpdev->ept;
+	if (!pg->pdr_available)
+		pg->pdr_state = SERVREG_SERVICE_STATE_UP;
 	pmic_glink_state_notify_clients(pg);
 
 	return 0;
@@ -265,11 +269,14 @@ static void pmic_glink_rpmsg_remove(struct rpmsg_device *rpdev)
 
 	guard(mutex)(&pg->state_lock);
 	pg->ept = NULL;
+	if (!pg->pdr_available)
+		pg->pdr_state = SERVREG_SERVICE_STATE_DOWN;
 	pmic_glink_state_notify_clients(pg);
 }
 
 static const struct rpmsg_device_id pmic_glink_rpmsg_id_match[] = {
-	{ "PMIC_RTR_ADSP_APPS" },
+	{.name = "PMIC_RTR_ADSP_APPS", .driver_data = true },
+	{.name = "PMIC_RTR_SOCCP_APPS", .driver_data = false },
 	{}
 };
 
-- 
2.34.1


