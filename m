Return-Path: <linux-arm-msm+bounces-85711-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6947CCC5C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 15:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2271530AB7E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 14:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC062BE7D6;
	Thu, 18 Dec 2025 14:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MI7q8WVk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dCFVlCtP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F21E29A9C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068714; cv=none; b=DbJqymJY5lZwq2UjMgY8/+iiUAGXUViVlV1iRUDUgj4tMOKfVWQmbzMlLpzfMTnEeDAGZ1TrL6EVIgs/4MByirw/t4hWXk8ttXfyguEqG3YhT4nUz8malDF3/KbJmD6ZbvqQJRdxCw5L/5CjvmFHp04zNUQ9pI0XB2rK/gWVRZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068714; c=relaxed/simple;
	bh=Z6PjTejhlkm/+1sYK38mn3Rv1fAX83RKbuAEiJG8aZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k65w3X/5bMi3WKaBSudsN4wpi0ceHDc37raGzFYCNOZ6rmv20bDTXYESAqnUm95aV31zoNRwir48z/0qZqiU59O9LTlsOnVWsQmEAH0QB4w0KiOd2DYpOTJR+8N71pWAQQ5h0TYBcPaeG/BP/TJEzIT5JeiOKkAE0lwzi8k0i/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MI7q8WVk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dCFVlCtP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI99j3F4147962
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5hM0e1rBGnltIWyeJYcpYQbcX0IE2b0dL5xuJ66J2o0=; b=MI7q8WVk8ulY+12Q
	QRccXdPjadFQ1J9bY3II1BUAarYH3v26lopQi116HhaEhoZ6a+1WfhcU9hSA20mv
	kXz18XdpG1AIpklQGbkTqDXH4cXFWrruuSnLpvH4DPWyqT4QVqAqpO8tEXX3KHEW
	DOCL8yRp7Ai+PJnjbQ+yExctdRhXbXaPMOxPJ2eXh6gt8lL4Ht1GJtM+LTOH5Wev
	HCF+8gnMYJODOGmcshbmG9IogbQD4BLhw66c0nhijfb+m10JAkbrhJwQw5ozgNGx
	N9oVxCS/g13kMV+bzGiKbnA7zpeXFZGfnfQ0/QkAVB52V9+voDhR9fg9bhNgNhzG
	54yw5Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b40u7bgmf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 14:38:30 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed6ff3de05so17853511cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 06:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766068710; x=1766673510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hM0e1rBGnltIWyeJYcpYQbcX0IE2b0dL5xuJ66J2o0=;
        b=dCFVlCtPFwVMIhuiWTaESzVvDaX27w6wBICrZ0Xd9OELoJwEGk5gyYVu6Pn65b2j5S
         Gyn3YD2wG58ZdJhz0FcU+q49gpBLzrBsc4nRh5KHJT9aT50rdjpVlKN3rrH4lKnlZgb7
         Vg3eq2bLc9UD0GJgOALGCTVPmIzDWe0y1hSzsIrmCXsuUXMM5vlKUltZhM9AVrHdsLVT
         ctsz24y+rFRjRsOlAtW8QnGy7dwE9c1c3t1dFxbyXbSGfCIrYT93sxZ1LWXDc1b8DmaO
         fy/RhGGwtCDW42ecFqKJRoqXbWNvsgtcGob0ExqB6XK//ZqmJbF6/CKcsmAQ+H56/nx7
         UOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068710; x=1766673510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5hM0e1rBGnltIWyeJYcpYQbcX0IE2b0dL5xuJ66J2o0=;
        b=bKO0G76F0Vb7fmDatrqZFC7mxXuuuYRWKrzOlkA0vBH8lhu7LLgRq7VbkxWiOsZOVr
         hgAmdMUhujCBdYiD5Ezy4SVGP0wQTs8i09zlZANe9heBwnoiyrCWfsJ+g5a266JRoMfA
         nfIZlcJroP+KwKzaQI6o2pbWw0Ha4IeyN7TOWGbP1140O//MOC8aq/u65TQvbrrfyxcu
         3DLVd3fxJjKssECbwVuJFNFRDJmW+XdvPKEe67s8vfRlF2F4ckVJiboPL7wcFGSGIPHW
         XIf3BEBOCciocqCbFfvwhQ1p44107Ei1yZQ6JNksLgZJITk/KapRz3BJGvWT713oYlPB
         gjzg==
X-Gm-Message-State: AOJu0YwScgbIVyUpfM6PivUfvQ/fCvH12ld/welK/mFPSmgnMjciKoTl
	wtQ4qwxPakERmQfuz36ppM9eWmrp64iMvv3vFLRaAmzM/5oxW499lfmAi6AJ9FJelNriIya47nC
	Q1I9p+je4S4Vdpy9mgw/3sk9G350Dat+9gBGIuVYcR26BgPIVi27xRiGyBALzc4IUvO5q
X-Gm-Gg: AY/fxX4KAd0bpD2PtNPBz4ApCLdaP+kA26hzrqhtBJKYdt3WJEM6jZZluhWtW/1voFL
	yCZnR0j8bnrbcE5lmHz0sKo1ASK1NncQEwnJPrew/9a8Tic5Ko+1A/MVnasFMu+umKIZhHJ7qEZ
	GtPZMCOYhrBphfEVlIO0TrpWyuPQPGmmUOOaAlTuWHfw+CZS6VID6rAzPCHOXaE31Q6IxjcIaFW
	is06winVt9j8eKoZ9hxzv43yE2NscqYGLsbawRBU3gRBLj6U+/myWU3QseNSnmFCHSOZBYizgGo
	0TpHCyt/4/l6wy+raKyAcN2qeOcGiPGM/CVkDgj0b1av1CJLjqX1OLXQAukNx7KY3XG+VvhyAIL
	Ok3dQG1p0xxFgDRZ4RlAgCZodsOcrVmAzW91uGZrkw1BifXGfebPWD2xcb1b6cRLXYKMV4Uacx8
	VDbzxDBzsecLWD8VUAPw/SFWM=
X-Received: by 2002:a05:622a:4c87:b0:4e8:ad19:99c3 with SMTP id d75a77b69052e-4f1d0625a4emr308561741cf.77.1766068709865;
        Thu, 18 Dec 2025 06:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjWBMYpERGv0J1dETl3RC0lHkKNzWVH7w5avqgqDpV1QTSBlLgEUN1CqDCcY9IvZ1NA1Q7iw==
X-Received: by 2002:a05:622a:4c87:b0:4e8:ad19:99c3 with SMTP id d75a77b69052e-4f1d0625a4emr308561371cf.77.1766068709487;
        Thu, 18 Dec 2025 06:38:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a132d3c3dsm1160214e87.33.2025.12.18.06.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:38:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 16:38:24 +0200
Subject: [PATCH v2 2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-mdp5-drop-dpu3-v2-2-11299f1999d2@oss.qualcomm.com>
References: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
In-Reply-To: <20251218-mdp5-drop-dpu3-v2-0-11299f1999d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Z6PjTejhlkm/+1sYK38mn3Rv1fAX83RKbuAEiJG8aZY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpRBHhzYh/zJPMHRBPlGUM/9vUYn4gm4Q61zbJD
 dD/cCJFMDeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUQR4QAKCRCLPIo+Aiko
 1bw6B/9vAzVex2h9fW1sRqQolFdeEF1HMJdW3mrgXe8o9gEsNR3Nl5YsiEFP175PCQn2Cxn4/C7
 VY97SM9JiSMt1teE1gwee/MSHpOG3k5k5N6gclnI/C4XKbpUulPuW7FpO49KTTwthUGLZsdtvle
 NYOl/Cd9+MX2Csp8HpBEwTKdSXYkRSG1ulKdS41cgHi6/jsVaCPbo+grckAeWoEcAI8P6LfpDTp
 P+aAX2nqM9z2LwM/h9TJMBWkHEi537bclRnbVhK8I7Nfx29tpqFSfSRcpiQr3MZ1RUCQCczWJ9k
 J/7CbBweIEkHk1X58P/JcqJ8ap71iSsx7kHm3fnz3/Uo1Hb3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: KFP5kLpuJhRWH3CHJrvJVgay04y41mM2
X-Authority-Analysis: v=2.4 cv=Z8Th3XRA c=1 sm=1 tr=0 ts=694411e6 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=HylcnDg_oHYs4KzdblcA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-ORIG-GUID: KFP5kLpuJhRWH3CHJrvJVgay04y41mM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDEyMSBTYWx0ZWRfX85prIq6Oha5X
 pfNV2iCXcVNoU67fnd7+cq72OtlBBW+u+arOnwMfruYoJ3SlNdskpd4k4SljozU48zGwR+Cg856
 aMfXJRI6zfbC4wlOqfAHM5I27wgm53A12sboLdhtXERHGtd6/iA99acP5FOmXYbaOH2VvMYvnu9
 LDhHa91bskV6N74ugk4YBeojcewWRa5hpV1HHsVk4TBK3USB7GOqZdeBGb1coL+n9UneNup5C5a
 CLgfdYe/T3PXaXC5J5iWvJWF920RyGGR+eNi3gul4zTGlrYs2aytUE2j5BZdccwXHxStoKA6aPo
 bc2dBSaBT4u4NhMsMRzoxNtohE/OZN4Sm4iRd1G2Vh8k8f+ngNEkn7K6DUMs5vCtVll4Fs/rTvZ
 G0iGJhC8xT3EM5Cc94WPLavlbPU6Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180121

DPU units before 4.x don't have a separate CTL_START IRQ to mark the
begin of the data transfer. In such a case, wait for the

Fixes: 050770cbbd26 ("drm/msm/dpu: Fix timeout issues on command mode panels")
Reported-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Closes: https://lore.kernel.org/r/8e1d33ff-d902-4ae9-9162-e00d17a5e6d1@postmarketos.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 0ec6d67c7c70..e6f55902e355 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -681,7 +681,8 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
 		return 0;
 
-	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl))
+	if (phys_enc->hw_ctl->ops.is_started(phys_enc->hw_ctl) ||
+	    !phys_enc->irq[INTR_IDX_CTL_START])
 		return dpu_encoder_phys_cmd_wait_for_tx_complete(phys_enc);
 
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);

-- 
2.47.3


