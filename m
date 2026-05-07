Return-Path: <linux-arm-msm+bounces-106359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGgEJuiN/GmKRQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:04:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3F4E8DAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 15:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8BF1F3026F2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 13:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E48373F7860;
	Thu,  7 May 2026 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gk7eN6vB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FY6hxKQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71243F23D9
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159004; cv=none; b=OHcRi6vda9AQTaDm+7gkNNdY5PunZDORgQJSQpB3VpNwjuFpDOCe27TTuFgytqNwMMO1AJbVDaFKDhpuBdp0ssm/3/K9FJroUiRqctpfmvCEr+YjTiLKk0XLOQIyunEtBTgM5THPlAJRANVDINzlsX8kUDObJRKyCSPA02wtbVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159004; c=relaxed/simple;
	bh=m7fUWBaY//k3BMdPpI3w6VGDO9pVlw+qrJQrPegYVpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzgbKBtImW66t2QvaHjjQeTFFPdxWQGXtOu8Z3JRgkVKYR3vNX7SgQD+sRWYyInOMGQG7SlcmgSoDy9QlHq6fd7VHPSbhYmLTvOUkTiLqSqq+QEmCdrb8F2uB95DHsYwOEmFHGH+GWHfN4m7rFaYO71uU6BmU/dApDBRzTOm8/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gk7eN6vB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FY6hxKQU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647Bxae32734205
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 May 2026 13:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uowZPAe0p/cWkm8GtHlypt4vcKjscGJ6WfGzYlQEuf8=; b=gk7eN6vBYHaAk0pk
	vja9fa0W+hP56hqQu2NPbo03OhN5dJLdY1GEhM3fNjBGFue4pPzrLe6pBUSGkdeE
	rmGjhPnP38BpmZ/Nsj+rHdAb/oJX+SRcrkDgrad8ZbhzXY3EDez+WJ1/nnfMWkj7
	jjLatUkXXO1iw2gWhdw4s3DRi1SjAXY0AjO8GjRTlksefU7I1anN9Al4Y8eCF4fa
	R34vMIhiWomLOlRc9j0veBGZylRCBJdBSh9TbZLjqJ2pNjKdouxuXXEoN1IvJwJ/
	2j9wNsmWceCmpLdBlPt3Cq25gnpeedLgmehN0kTXXKNVOYMN3U0bvSbac12AQuzh
	ZRFDbw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tbqr6y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 13:03:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so10280455ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778159001; x=1778763801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uowZPAe0p/cWkm8GtHlypt4vcKjscGJ6WfGzYlQEuf8=;
        b=FY6hxKQUEfznunC31f+Eugcw57ayfMwprO282tuaH99A44v0Er2WNiBHBLs5A0QXTE
         JFfUEXkCH/4OIoz3CI/ZKOa2QQgHdKaHBH6lFIiJQ+i0QvgMGuvSO9dhG85Ml/juH4VN
         zGdhYuwRbIwNIkOg6v2X2tCepJVJnPbiP8nzwBFhkaI8FfbcNn77IhyD4ttQ0T7LFZ88
         EKaV9q0vy6L/iN7GvaB57J/7UBjQ1SOKkFiXqYdyK+Ubi4DeUfK2b7u58lFeUhBGL6aZ
         RNVl1eO0nxbOiy3EygXfKARx/6d6ayMbItUP/8wV7/e/A2WdF2r+/2z31R8NktpTY2Qr
         AyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159001; x=1778763801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uowZPAe0p/cWkm8GtHlypt4vcKjscGJ6WfGzYlQEuf8=;
        b=rN0/7W0yZRNADW854llhaUP+erxLHtZvd8zkNdINnyq3PEIzrawQG5hMGytnjTIIGn
         nxblljsnTc6sXg63IN/x4DmSFssDIisrKUAUPmaymZo+O2HZtf7i3k3gOvGFyWCJJFss
         oMABdBclezfUoN7gRLEC36WX4X8bTX9H1uA2ixyKT3/uhQFOISmGZdKCtXS8WXW7KRKc
         c+gUj8eEX8Lon8mSaXg78MID3D1QrRaokoFqmDQrEHMo+blWfo0+zv0XhW3bNItk78PL
         B/bUqWrU8PCgk/BGCUo/vhHOz95JvVybZGfariQzqEvw5N4VZZ9Q2EFy2x/K5Mekn9uI
         vqWQ==
X-Gm-Message-State: AOJu0Yw5x/vEfKZEhjzAc2m1/GmfCyqpkPNyZ4EoBz3rKxxy8S88UYZV
	rUzWt/UbSpmFPAyR/cn0zKRA4ydNIR/0kM/YikvX/+2J1opPEKwLqLK0CwhdO2qW1WvD1UFLIUA
	a8LR6/bZB0in/CnvZzgsP5vteV0ykwWyPgNASQyo+guKn+Y/RTMQilA0FUwzqWgorLAKQ
X-Gm-Gg: AeBDietR1ApAlt7qNhm6+pqaakJl8gLdfMbGv9BikbIQab3902Bn2PQqAwVGwKYI+VN
	avqSdHhcNrGbKjELJ1rejX+d+6DK08OIVhvjZACFHZ//F+3aQ6wkuTlFYXVO5JXoG8sn2gxpzJ9
	cuabO58zpSDKHglf8t0YjK5wSSO47Va6CU/9o8LlQDGsE31RcF0XJ4df2gEZHtqWJKJEavRLDDQ
	uHldJ+Jv3GU29F4O/BJQDqIbQY9LTRYh3WUxl24xTOu/WDVvPjq3nNSQMidVk6+Hd/0Jw5liynq
	6TOKtR7SPIcryc2qmlWllchtTieIDUMnE6ei4Cws+tAZ84rvJidJcHIXuDmtFsrmvkLQ/vlXeEL
	/1AfBFLF78pClUPdMD8oqqN3G2kahxN4EiTSNJ1hHecXbR2EcMKXFkDAMxg9HttwapoTpEgRT4c
	DN9vlfNV/R/IrFGcfNqejXpzGJxLS60yWYiy2Azfekf9NNLQ==
X-Received: by 2002:a17:903:b46:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2ba79c25ad9mr82066455ad.37.1778159001146;
        Thu, 07 May 2026 06:03:21 -0700 (PDT)
X-Received: by 2002:a17:903:b46:b0:2b2:eb9d:1648 with SMTP id d9443c01a7336-2ba79c25ad9mr82065745ad.37.1778159000507;
        Thu, 07 May 2026 06:03:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230c68sm5595959e87.19.2026.05.07.06.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:03:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 07 May 2026 16:03:01 +0300
Subject: [PATCH v4 05/29] drm/msm/adreno: Trust the SSoT UBWC config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ubwc-rework-v4-5-c19593d20c1d@oss.qualcomm.com>
References: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
In-Reply-To: <20260507-ubwc-rework-v4-0-c19593d20c1d@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5880;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vKJ5Okv8/mY/+V92nlnNVbn5KJI7SCcR+qGexLCfQKA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBp/I2EmchDTOZURru4fhGhuxYu51QFJpZ+gv2t3
 OmJhWoG+IyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCafyNhAAKCRCLPIo+Aiko
 1YHLB/4hGDgjAN+g+/IfxdO1kUadLQo3qblGRGZpcSt2/UzQqQGzVB23s2ST5tHCprS1ZGi4llv
 JP4B87hY4kt9JhUR3Bjc5FB1hAcTLb4IAGL/Xz0tLmX2WLvxQ7bUkEg15xE194G+208HMFeTJke
 9Mc+h8aoOkAx9cgwAEvgTfgPR256fDjkbm+B2iELYnFjEjEiPl962BnS1ZH7ZaG8+ugw+KWA7yj
 ldnIGWcK3yKOTja8ap3z7HyMF68G32wwVGRYkXkCkFvs/Lqr8aPuJtjVN57UE0f6IlQkfbvANsu
 SRxZu7HMeY+bzdUJxrrg8hBZE7segrr1OgbQctx1MHD5voQ7
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Jl1zWvbfQZ4AL_MJjjnhV9B5M2sJdUDJ
X-Authority-Analysis: v=2.4 cv=SJVykuvH c=1 sm=1 tr=0 ts=69fc8d99 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=IhcC-CrlSmvFA89tYH4A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Jl1zWvbfQZ4AL_MJjjnhV9B5M2sJdUDJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDEzMCBTYWx0ZWRfX2KN5dn+JSdg4
 5aZT/Jz8ARBVBitato9Sv4Ft5psWZCBYG1vNkrhjrFxHDZgnkNpXY9CD2nmX6RxY5S/PTorYCgh
 1cohmH2gDiyx0mCRVYzZEGM6RCey1NcckPVaIfWFJBy0mKUYTN6xWcsYJkN4B6y6IofgE8uloLq
 bpxWGlcvvuPVzWsgDl0B1w8mHwL3zJNoSRrJBqZkyXjtm4oASY5Lqlkb6Xx4fzMp+GjOK9Bjsls
 66udfkMDNn+lypnmPRJcsI9O9j8XgOcDKUc7O1942yvo8vSJXX+jQ7v8fawDwTLI6An/2mi9lzS
 LaCrxBcSUshe6pwfLm4X9eqjTiJq9hMi+xxYu8dWgi/9vcfdokwoIjwJVP5UoQD1BbZCvGJ0lW3
 t0Iyo3atIL6mfua3hhnL0x6BfJZ505p2jKku+1bYHaa4/meVpzUGk13bdoNlIK3FyrWR2qeYFJE
 X7w9SpHhxf8Cyu8Nm0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605070130
X-Rspamd-Queue-Id: 11F3F4E8DAA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106359-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Now that the highest_bank_bit value is retrieved from the running
system and the global config has been part of the tree for a couple
of releases, there is no reason to keep any hardcoded values inside
the GPU driver.

Get rid of them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 11 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 82 ++-------------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 --
 3 files changed, 6 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 79acae11154a..699fc0f551ed 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1725,7 +1725,6 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct platform_device *pdev = priv->gpu_pdev;
 	struct adreno_platform_config *config = pdev->dev.platform_data;
-	const struct qcom_ubwc_cfg_data *common_cfg;
 	struct a5xx_gpu *a5xx_gpu = NULL;
 	struct adreno_gpu *adreno_gpu;
 	struct msm_gpu *gpu;
@@ -1769,13 +1768,9 @@ static struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	a5xx_preempt_init(gpu);
 
 	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return ERR_CAST(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	adreno_gpu->_ubwc_config = *common_cfg;
-	adreno_gpu->ubwc_config = &adreno_gpu->_ubwc_config;
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config))
+		return ERR_CAST(adreno_gpu->ubwc_config);
 
 	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d5aba072f44c..1d998636c5a3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -733,82 +733,6 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
 }
 
-static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
-{
-	const struct qcom_ubwc_cfg_data *common_cfg;
-	struct qcom_ubwc_cfg_data *cfg = &gpu->_ubwc_config;
-
-	/* Inherit the common config and make some necessary fixups */
-	common_cfg = qcom_ubwc_config_get_data();
-	if (IS_ERR(common_cfg))
-		return PTR_ERR(common_cfg);
-
-	/* Copy the data into the internal struct to drop the const qualifier (temporarily) */
-	*cfg = *common_cfg;
-
-	/* Use common config as is for A8x */
-	if (!adreno_is_a8xx(gpu)) {
-		cfg->ubwc_swizzle = 0x6;
-		cfg->highest_bank_bit = 15;
-	}
-
-	if (adreno_is_a610(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x7;
-	}
-
-	if (adreno_is_a612(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a618(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a619(gpu))
-		/* TODO: Should be 14 but causes corruption at e.g. 1920x1200 on DP */
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a619_holi(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a621(gpu))
-		cfg->highest_bank_bit = 13;
-
-	if (adreno_is_a623(gpu))
-		cfg->highest_bank_bit = 16;
-
-	if (adreno_is_a650(gpu) ||
-	    adreno_is_a660(gpu) ||
-	    adreno_is_a690(gpu) ||
-	    adreno_is_a730(gpu) ||
-	    adreno_is_a740_family(gpu)) {
-		/* TODO: get ddr type from bootloader and use 15 for LPDDR4 */
-		cfg->highest_bank_bit = 16;
-	}
-
-	if (adreno_is_a663(gpu)) {
-		cfg->highest_bank_bit = 13;
-		cfg->ubwc_swizzle = 0x4;
-	}
-
-	if (adreno_is_7c3(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (adreno_is_a702(gpu))
-		cfg->highest_bank_bit = 14;
-
-	if (cfg->highest_bank_bit != common_cfg->highest_bank_bit)
-		DRM_WARN_ONCE("Inconclusive highest_bank_bit value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->highest_bank_bit, common_cfg->highest_bank_bit);
-
-	if (cfg->ubwc_swizzle != common_cfg->ubwc_swizzle)
-		DRM_WARN_ONCE("Inconclusive ubwc_swizzle value: %u (GPU) vs %u (UBWC_CFG)\n",
-			      cfg->ubwc_swizzle, common_cfg->ubwc_swizzle);
-
-	gpu->ubwc_config = &gpu->_ubwc_config;
-
-	return 0;
-}
-
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
@@ -2701,10 +2625,10 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 	msm_mmu_set_fault_handler(to_msm_vm(gpu->vm)->mmu, gpu,
 				  adreno_gpu->funcs->mmu_fault_handler);
 
-	ret = a6xx_calc_ubwc_config(adreno_gpu);
-	if (ret) {
+	adreno_gpu->ubwc_config = qcom_ubwc_config_get_data();
+	if (IS_ERR(adreno_gpu->ubwc_config)) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
-		return ERR_PTR(ret);
+		return ERR_CAST(adreno_gpu->ubwc_config);
 	}
 
 	/* Set up the preemption specific bits and pieces for each ringbuffer */
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index ec643b84646b..324319762383 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -236,12 +236,7 @@ struct adreno_gpu {
 	/* firmware: */
 	const struct firmware *fw[ADRENO_FW_MAX];
 
-	/*
-	 * The migration to the central UBWC config db is still in flight - keep
-	 * a copy containing some local fixups until that's done.
-	 */
 	const struct qcom_ubwc_cfg_data *ubwc_config;
-	struct qcom_ubwc_cfg_data _ubwc_config;
 
 	/*
 	 * Register offsets are different between some GPUs.

-- 
2.47.3


