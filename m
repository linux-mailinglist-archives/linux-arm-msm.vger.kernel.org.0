Return-Path: <linux-arm-msm+bounces-85534-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB4ACC83E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 15:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7ECDF30898A5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 14:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2484B38C642;
	Wed, 17 Dec 2025 14:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OAC99GUs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GK6uHdQl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0C43A4EA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765982098; cv=none; b=KTwCgDjln9YJJpGtBI1jrq7GHr7xXYnSID7PLf5z0PWRZgi+dw52TylGnQspCwBCYimXSsduMqd6G6yU3mUsLcryOrE7aGbwSkdI07w7n7u+4UnkSrF3RJ/0LZLkR3aTdjD+j7sfUSico9v2YyQxo/UOA659UKJSnpUyw0u6ZuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765982098; c=relaxed/simple;
	bh=Vgro1cjPjBOP0oKKJfd+hsrYIQI7IBwz4lNTXyboEWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIFFdDLT20qrgWrVQ1fS52zgtBb12VE59ZocMbc3NYZsR29IJZ5ySGnPDyYFKv3MuC/QjSAmbjqYMhxNgFxM14X4oc3230RLwH7SzT499tdH8M/hMyLniOqhTBeeDbNP2IPUVch7jGQGYyw7fAQVuYWmrDM2BKLtpC+6nQusyqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OAC99GUs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GK6uHdQl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKqem2673978
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FFJ8v0oPyVcNSNyZxT/vXlxD/LUOZfTyE1joNeBDrrc=; b=OAC99GUstwT/eC67
	OaBRx9GpHAJCIo/BetDeyIctlUpQI2HTXwNcmF2FkgZudW0XCGQsXgKezYYuCN0o
	2QOlJhEMHhRRhqjvAd2GUU1XmrydLr1rXh26ravPpmSZgCJtUg+vXsgrOgH/t8gr
	K6j6WLj4syMoGrDvY4W9dehyG9kGkToa8iKXaifpwWlzmqA60hot0iYGpC2y2Ukk
	K5liLPFr5nLYG2yNzHE32CVJhHn4mihKoKHTUm5K0CpRnDs+VWi7QNpTaum9IOhH
	uwJGadNMLttDXwyK/7daTfD6IUr+BYsZvOsdCSXycE6qX2brJqAEXkV6gKX4KWrv
	4EPi+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3myj1y5p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 14:34:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34e5a9de94bso981193a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 06:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765982089; x=1766586889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FFJ8v0oPyVcNSNyZxT/vXlxD/LUOZfTyE1joNeBDrrc=;
        b=GK6uHdQlAid3b95E5kgXBWXSLP+ar3iLcdlApRxY4zf9w/bikCIN8vrqDmV+fX/63Y
         eyzmZSerueH0zkIq1NgRk5Gc4n1fZtLo/PrjhSuoHfdxljNKtvA69e13zOmuwJjXDPVA
         T9Dww6gCAFRZPJDo7VWL+unA9lhve6Qr8woFgsrowVqtnf2IJq5baA9IgF05SBNa2rN1
         AM/BDjLz3s88XMbpSs4SiHxBob7FOwWtpSZ2wJ7tyZj8cyOt2eWSSvJqYbzOQJGYSM2b
         8bfNnwpJiFL+LG+rJCaa5ORpOO/oSrLUAReX9lGHlpkmrOzCkIYuSqqSo90vLcIMQ0f3
         zTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765982089; x=1766586889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FFJ8v0oPyVcNSNyZxT/vXlxD/LUOZfTyE1joNeBDrrc=;
        b=bsPvg0H+fdCZRXhUq2+L4rDV3fcmz10cQQ9LpCMCpE/e3LXvFTKxZlvTbvuaqNUk5I
         rCoC87/VTxjUID/9eyb7YVQLGi3Xto0HaMTgFF/GCI6D/o2RxVGX5QSYzN4EwtgzJpFa
         09lfLM8lHPmdPkTPeYfi9i2PvQ7Iq6b5vuh7/PA3JRzN5gFyXXXatpq05kgaFZj7JUnz
         UiH69v3HfOkzsVP1XjnX3wjgF2MFglXtY5fY8YO2hdd677Z/I/0FlzZFdaDExRyLtKKI
         52qAomJsNN+cjvNeTKJA9LGepRPh2w2BGGpDj1ibjS/Q5DU36rAwJlSFEKK1PTHDqiol
         AwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeUhzghFZQAFxU396yaA82dxY3LXLg+j97HXkT5/PU/o7smhWxT2+K3bvNsiX4c3hkxBfscwq9Y+kja48r@vger.kernel.org
X-Gm-Message-State: AOJu0YyaoaBqVaReSKLLv3fg25A60SRBCNJxpTSyI8YbevFlkIqhO2zE
	6OovqwmFR6UHPtSmCxNJdGmuLXQwYyAdDJNqPG/xC26XMVKucGCS2rksyXWzdicpexVZNU9tXM3
	UI5VssyqvkQM1mxgeRqVElnF+KjNlKTff54dpDjgXkI1RGTft281i/U3X9ObIz/1KBZeznZvZO+
	U4
X-Gm-Gg: AY/fxX7lU4pJXtAdNL3qdobO1K86cGSxFY8rtGC1jDn2l1OpCJzQjs3raR+ssXh6nTT
	S9Z33okJx9N8T8zc1mSN6k/Jqckao7ia/qYDqfC4cE3BCLPMavWcCD+p2h32tdzjcGnHwJWIZ9r
	NU4h3Zq1wbJHO/LkrZtoVn9Dwlz43Ew75MrAxxFV+sNnn85D32zJnXe8lbRD8IlQCjdaiY2YJ2P
	BV09HB1w6e+wGFDVybtdrF0accBMwiuy4fZgmcuwtAD8y55X3vbGfX6AW2fVZc3En1q6C8kce9C
	aWi7b30BJY7/MTZTomgSZjSMO4C9ZfzQL7M1iPGo2wIdA/psOdLej7sPwYWdAJj0x+OaS7t3CqB
	Mp+ZpX7O4BiKoLYfxXxUVwBm+KuW+dvM1JJl+UTvP3acAyg==
X-Received: by 2002:a05:6a21:3383:b0:2fa:26fb:4a7b with SMTP id adf61e73a8af0-369affecf43mr20638900637.57.1765982088904;
        Wed, 17 Dec 2025 06:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYa+ZlFXS4xg9zE2y9Pno7asvPy9BZHd5hGorvl2ZSNy0X/YzH3/UAdfmsYhjDCU3ooCNk+A==
X-Received: by 2002:a05:6a21:3383:b0:2fa:26fb:4a7b with SMTP id adf61e73a8af0-369affecf43mr20638874637.57.1765982088492;
        Wed, 17 Dec 2025 06:34:48 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34cfce5eb5csm2615529a91.0.2025.12.17.06.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 06:34:48 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 20:04:21 +0530
Subject: [PATCH v11 3/3] firmware: qcom_scm: Use TASK_IDLE state in
 wait_for_wq_completion()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-multi_waitq_scm-v11-3-f21e50e792b8@oss.qualcomm.com>
References: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
In-Reply-To: <20251217-multi_waitq_scm-v11-0-f21e50e792b8@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765982076; l=1437;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=UFzZfFwsKZRwzUpgUGE1qk+oD3O1tdC+4IJxq3oO4ZA=;
 b=JoKGThCOEdcPnLX0utb8N+LC9tSZ4gLNtV6AaThCHIXYWi1yZJ5n80Rjg/qbDmyEZTz470Epe
 UAJmrbCV0K3Ahepd7gR2lCpU2c1pFr6aZ3cMzpPtl2QpOpxmgujMtGW
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDExMiBTYWx0ZWRfX5Ml8ie23EgDN
 LunRnvKLcaKMKyrqQysDzSGmmZsfWgjPfouwhO+qBhgnG4+qTaRvplUqVLJxWA6YfgNyFw1686z
 +7QXsuvUaiKXKcfej6bCynlRwtzFIJYEcGb1iZyjG/Q9sjJyh55PiHsNyuEtuLORC+qZInxUvGy
 4dyXNh5RYQju9V062mrFV7GaeMz8Xx+2Of5cpvrDbc2BAq0bFfmOG823dz9HbF0lFv9yAxnV72T
 PTtaM4AiUVb7Osf1dMOfV6bA2sstyxHUTaXxpmn2dyJkeffQYc1oKh4gefAz/KuvqnhxU8dpHlw
 AQY67S+ohHvdVLXgOpUkSzAN7/nui+nS+q0yM0NrmMv7BOHZgE21ZeRLmRHv5ZAPhQagT1Em6K+
 z3wEIVaZz4FkTtRIIrAuSnoByXAAUA==
X-Proofpoint-ORIG-GUID: ZSfan3IecJG7bmdk8y7Xrn3FGgDuRb4r
X-Authority-Analysis: v=2.4 cv=CtOys34D c=1 sm=1 tr=0 ts=6942bf89 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=CXMSIrXqJIVyGMYrj-4A:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ZSfan3IecJG7bmdk8y7Xrn3FGgDuRb4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170112

From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>

When the kernel issues an SMC (Secure Monitor Call) and the firmware
requests the kernel to wait, the waiting thread enters an
uninterruptible (D) state. In case of an extended wait request by the
firmware, any device suspend request, cannot proceed because of the
thread stuck in D state. This blocks the device suspend.

Replace wait_for_completion() with wait_for_completion_state(...,
TASK_IDLE), so that the waiting thread, show up in TASK_IDLE state,
instead of TASK_UNINTERRUPTIBLE (D state). This allows the thread to
block until completion, without blocking the device suspend.

Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <brgl@kernel.org>
Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e16dbf18f731be9b0098dd683f478c8c8fdeaf20..3d8eee354cad55773d9b827ee8e32aab1f192510 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2305,7 +2305,7 @@ int qcom_scm_wait_for_wq_completion(u32 wq_ctx)
 	if (IS_ERR(wq))
 		return PTR_ERR(wq);
 
-	wait_for_completion(wq);
+	wait_for_completion_state(wq, TASK_IDLE);
 
 	return 0;
 }

-- 
2.34.1


