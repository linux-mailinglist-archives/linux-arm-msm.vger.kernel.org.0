Return-Path: <linux-arm-msm+bounces-86708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BFECE491A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 05:03:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 07D59302D5E8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 04:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5F022DFA4;
	Sun, 28 Dec 2025 04:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JawYBaHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUYAJxGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02216236A73
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766894569; cv=none; b=vASMmOR3ZwxPh8EQCg7KjB3tgM8itCMeKB/FTsWvz8nDojyR4pHINHqfAwDY8hHw7LNld5ZCI+DbskgNL6HqTysslap0KqZooT9BEhbqr3fU2NoFMMvN3KBRX6hu2mSEzD5d2vxvAfceb4+3fQHru99AVLbG41Ba1V4RYTXod+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766894569; c=relaxed/simple;
	bh=RENHaPNgcH0iuo7H+XDIB0LIYFTLt0BPC5NR3Q0GN40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=betPmAJsYBd+zNRR2dmtgphic+MlYKch8xxi5MX+3z+bD/0rDbFQZTRFcL1rqEtftmNey6ovYkDkh6xJMVQqvaHaBOtXd4eEQ3gSrC+8JmvA/Je7jTbEYJeK85MGaq7W4I6LVCTkuYKS/nV3dyTz0OMO7LvRmP8WPEO5ae1X9zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JawYBaHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUYAJxGE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BS301SI2111385
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/X0PlaGnVatZ+hIC0aJnIM6qwpAzUJWkJcMYRuQS9VE=; b=JawYBaHEZQPCZIyZ
	VsX0y5JIl+/WGOBacSsbmkjmISUbsvwgMHbexKokx0N6aBsgaPFYwWFSqXHUBEDD
	8HG+QVtjDdP0Miu/r4YrIkYH8XJM1emQyXz0uxNFnM30OEPQpe+2TnOjwymY+Dfv
	Pu8htKJh+OdIGWwrUsJMf8LrqBO1sFU6mWVWBSIOm3iTQNhRA1UCxQeETknstjxO
	cKmmQDnj6Cy6wNcEIT0QrlKFAaBNKJM0Sc5SPS5M07ZcgLqZcW6jjgjFx1knlrtl
	RbTNC0tAAopjK20RGZ9Ird1vDCBlMqydBxd5u/5XqZ3nmEJyAkoic0/YXB9bdy0O
	+fErDg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f61pwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 04:02:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8824d5b11easo162701646d6.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 20:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766894566; x=1767499366; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/X0PlaGnVatZ+hIC0aJnIM6qwpAzUJWkJcMYRuQS9VE=;
        b=KUYAJxGEnhVArr5l2R2L4UZIKCW9OwlH0KZ3LtZdkCEXQF1PZ6RIH+iTTK5LmR+Jdj
         jCgHEwc5FdDGoyH84GxuPHNL+b+NBIvlBRV/nFaeG0LwE5Pq4NB3Fryf0E1Tl4VsScZO
         n6OP3mbSxyl7zSZqYJekDnU8LPe+yd4ufMQwtTCNt9QjSpRCmVb2bFG7dKDqEaFzYtD7
         1boxJwtKI37+bXbwpzG3Qtqgqt33ARKVP1nBbUmrVKxxAVFdqxs0ZX9LwvntnXF61tRI
         OdD7/RBbqvOZORAP3SsPY7ODUUuwePmzhwcodvPs0ybJlBV6fIrplWop/tjgZaioLXby
         Iu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766894566; x=1767499366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/X0PlaGnVatZ+hIC0aJnIM6qwpAzUJWkJcMYRuQS9VE=;
        b=nGateMB9I6A1m9ZwnFPjNzMDdzbvMab1vcsvgmcSdTAxGsUfG0FhyysOC6lIZV06yg
         ZLS8G8CbYc/Qm3eqISftEX7tuiWe5A467hceDgSAJUQO5+tOz3FB547p3/3U5KIMwFnx
         ScXIiUBCUmaL7wx5GM7sgyYbLev2c/7XpHgSSTuV/yaOGF0/Am3Vi5PB2GIqI7G8XJOB
         kra+OwLoIxsyzREZg3zr0IEQm3vL1cHlci20bnpBpO2k6XzpTDP6oulLOPHMIvjejME6
         /pMs4GXX2WP7/S+LDEHOKmgulM79vjKkHsI6pMAJurMCwzUUUYTejO+PS4bPpQh8hdH4
         DtnA==
X-Gm-Message-State: AOJu0Yx6xI9UkrfGwKGTHOyW0UrsCpmAWlNHEIFIaXHqaiFQa+np36DM
	3hJ7MT2yBAyETt01DW3YjUXLUOX9sLnLl3+Zk0ulqnqP24DBoOyPnom4yMAWbx8wnrinacJyCFf
	phG3W7r4+v0JSQAEv7s/DTEjemoCGgHZk+sp+otstEihXAGG2pEhjaDshFBFsaxSpm+RJ
X-Gm-Gg: AY/fxX66rXPDNE/V/Mauetn6jonCvWk9LASW/Rn8WU5dr0iUtJQbcDFlWUlQ6u82Ged
	1wOgtl4kQ6wNeiKL6F7dta1QYgpu43Mi1ThpEyw77KS3rMMChl1Wo/bCBivSJVdo19Ghl7AlWLB
	Tc6WsrsGSlpBeqlEP+QINUsKEH3OFO9tHqmOvAcegkuV1jh6TP+rBvqL2AMCwP5ps6GXlyPUDep
	ytYwydzhnNIdNygxayhCE9BZJXMgenkW1KRhdDl40G8vzazG4GGT6x7UX2tm9zudP33hMpSMkCg
	DzIjTLJIQA+7mc6A2GhiyWmLUPIFFWcdVXSphi/zxyPI6LbUUYpWlQ3JILm8L2w8g2rBOBF86V7
	koW7inJbGzFQcTloskJAdnCWS+cJmdhANVWt1EMDhLZKUosVXAUVQouvxCvsBdoqBti3aLjK/+k
	1W4pLAJWJonEhQj+MRw9/56n0=
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id 6a1803df08f44-88d823300f6mr441670906d6.27.1766894566145;
        Sat, 27 Dec 2025 20:02:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTf0JWZsrdmKQdOAhhIGD6Ga6LySukAhCaX8RqqEHk5hCMcUJgZYUZFdmWVm8KndrjnJawZA==
X-Received: by 2002:a05:6214:2d48:b0:882:3812:5f72 with SMTP id 6a1803df08f44-88d823300f6mr441670796d6.27.1766894565787;
        Sat, 27 Dec 2025 20:02:45 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d5f07sm7840348e87.12.2025.12.27.20.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 20:02:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:02:28 +0200
Subject: [PATCH v4 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-mdp5-drop-dpu3-v4-2-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1598;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RENHaPNgcH0iuo7H+XDIB0LIYFTLt0BPC5NR3Q0GN40=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKvcWCP4K0Kq1NCdfrPs1+uJvqSIxbD6sfe9S
 4aIlu4qH+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCr3AAKCRCLPIo+Aiko
 1VLMCACzQfW5MgfWUmueEI7oznLTNbRiASK3WTJL6aQimnQbyp25lS03Vjkm/P0XLoHhy7frcrx
 yKcPahIZZ5VHs/yhMWXJyelO5BsJLflT/qJcZcqewX6t4ZGcM4jNkxUcQbckqX3bCu5PZe1x2Lm
 riumUoawXMBevLJfxa1d/9YJUzbhBMdYu50tZTXcrBkiurZfkPGVQdoA9193AAAEdMsKoinKivV
 U0nNIFf9wWnW9V2TDGIjXFvZLbDl+uMcQ2XBlhPe56iE3RjkCUYukvv69Ndh8aPU91sgBJklp4t
 6SOS8wMbys2y4G2ihLOpW65qn9ndulV7bBxEg3UQblTM8fN3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: T4j2SYw7oIZaHhBLMc8srOF9B17ME_4M
X-Proofpoint-ORIG-GUID: T4j2SYw7oIZaHhBLMc8srOF9B17ME_4M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzNSBTYWx0ZWRfX28bwjrKa0GYw
 IEGN4mmXc+O1mrZ5Tfj7EcDAGV6SYMh3cXIS5YldJwGrBLdnObgnz2zu1H/LKERyOioZ1g7FHre
 +JjNqGCPhGrmXkXiZc4bSvQNGP/wU7kb0QYwewcWsU7tYb9dvuvGwtFqdhQy1edGgTt9wbOesqU
 0Xk2FfcKtKJm3QNce2XH6EiUJ8SQNZn3Ff8ae+0cDJ0buJMvLlcjQsOTnh4b97vRWunVBbi82S4
 bwT9X/FVLHG4gfhH/AJf788SNlFi+3e3c4lRIholVsNj4UyI2wEIvufaeckKsNmtCBgC6g0gxRt
 t1fSZLFqqF2HAo53r98np/PKRIPEyU2iRc1HdUuvohSacUyNf7vW3jineDvKK7QZHr+s0Ql+HUB
 5OD1WBgwKuhz2XWtO9spG92XjnAYxRazvEo5g/yDVpuQ/13ytbVbtwPSoa6itKrV37pMlGYgzXe
 JmNxitHJ3xfjS4US6mQ==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=6950abe6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=CRoN-q7HyvHBVqPpVUgA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_02,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512280035

DPU units before 4.x don't have a separate CTL_START IRQ to mark the
begin of the data transfer. In such a case, wait for the frame transfer
to complete rather than trying to wait for the CTL_START interrupt (and
obviously hitting the timeout).

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..93db1484f606 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,10 +681,11 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
-		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
+	if (phys_enc->irq[INTR_IDX_CTL_START] &&
+	    !phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+		return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 
-	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
+	return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 }
 
 static void dpu_encoder_phys_cmd_handle_post_kickoff(

-- 
2.47.3


