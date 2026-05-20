Return-Path: <linux-arm-msm+bounces-108799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGMVHTzODWr53QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:07:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B9590824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7B8BA3093EC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:54:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33283F4DE0;
	Wed, 20 May 2026 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RcCYMzXD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NsNNqFYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295B23F44F5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779288711; cv=none; b=HMFhbBJmrxPVNouF89Z7Q50NCItfEQfhGPvvh3UNel5R+P4xtMPhWEt37ibhKmw/MHa3CerJw/MBkCbCN1P/kGovb976wVR/Klk3gRCIjTdZXPBB70xnhJf7V2tou7cvfL+8WN8YArSjcWfjg5Qsgyo5Gs7LApwIvFEGtRpyJdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779288711; c=relaxed/simple;
	bh=0CsJEQgFxj0TwGdynRcKHH8T3xjv2c9Vfkj1PubtikM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DXtJUmHmPv636TtXiCzLTA4F0WUZf5WnQle6H48+/NDQCFaHJHXCsQ2Zu/J+qVqWrNe302GoaeHe8Jvi1oXKtuxB6lW/W3P3xHDwkUcVgSI3VR18QZbjiuV7xF/DgO1nBcpj+mc0hsUVuWaOuNVBbK1xryXGv0fU6ktetvurYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RcCYMzXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NsNNqFYQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KDWu0Y1725320
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xWNkreogDgXnJx39ZIn/sBhL4UymnLJVUI15wuXrdQo=; b=RcCYMzXDXCroQXtv
	CPT1j7M7x3kAbWnIPSPw30K9Nh8G4g5W4yl6SNkmb7qFAhoKBVlQuffR25hq+Pnf
	SOpx/4IFJuK4zVeMFtEr4nyxG+8bkCaOTgeu2xKXw0Ey9jHFWiL7yo6b2u2+dl7h
	VVqFzvlCeOsJEQPtAHEf+K7SbX4qnyslScjXWLjeQGmZnA4HTTjVCJ+rGvVsy59C
	niopaU2bNyWWyW0gL9ZAnGUBrKNV0CqrWR0XxdGL5WjzWdepZJiPaW+8ibHmRudz
	ccGCFizVvjSYF6BFy6gODhN+T6mRq7ZgcqvD4bGOYwEpZ53LDFvtpAmZvKsWPjS1
	yZQzDA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qn8wb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:51:49 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6314daf0053so2608225137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779288708; x=1779893508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWNkreogDgXnJx39ZIn/sBhL4UymnLJVUI15wuXrdQo=;
        b=NsNNqFYQKPz59K+pJiy0kSI8gGSOTBB7+QprR0XThAFH6CBSPPMRSpqH6JHpd0RzDu
         ocO5HLqa8e1XsBKK9vAplQK2t0eyy1Tb+nwTq1VJWTcR8QsYkk1SAeIqxRjp4BL7+jYe
         sCK47hu7r+/tlm17HH9/iBWkDOjDG3GObPZpcwghGSu112OsCk+YIuI27ZlWVyqh1zPS
         gOVgIb9XZa/v3l1/2pHozf2Zmnk3OMYHCOJv6M0RKCRaXrP4AJ2ts2b++A9CvhwnCU5q
         3o7x0N7NqBTcUqy/Zk3WHmT0ltSHxTa7H2R8SPz14CLxXuqwOUTMlKc57WqxLIDEy4Jb
         3i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288708; x=1779893508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xWNkreogDgXnJx39ZIn/sBhL4UymnLJVUI15wuXrdQo=;
        b=rVUUvecV7eZUqMxRV67LFee+U5itTaV560aEfpy0G4cG/SqlRoQDJnLmnLY4VgpV9l
         MozmGKZw+GIOLl9TPFSkgPmvtOfSip0s45z38m7OfAnjgd9JQ5SF/5xCITCTWOEAprEb
         GbM5k70ofTa09AInEdByIx6sQ8G6/D4poO6p9E4KbDxCp19awb/m5zVNsk7KvRZR8q3A
         gaKKW9su+icQikW80uyj7KCuAWc4lGAhyghvJjsXVQ5AM28oQGI2mrwNAuY8TYKG7qjN
         3/Mz16Ry+JDJBEgw+BRk6BmBq1LtNpfDMSFUlElsfat/WFGvJGB1B67x2dMKWwjWZuHs
         RSGg==
X-Gm-Message-State: AOJu0Yx488m2Yhd09SCwGxRI7IWnTczhcUvxI9h1UwjZ4I+w01Hpp0bg
	Sj3/FZfLC4DeYOR0MQ56RvrzEmwHAjW6MrnuBxw1a7qCoZBUJjFOyf2JFVFVa7MloTpSg3r5cyY
	P6jBvEdGji8Yirb9GfXzV2ni+OGZMKe0Uw0X0Z3JTIiu0OoAJApjP1nC6l7LpQKe2z4DQ
X-Gm-Gg: Acq92OGELvsi/gRpsBpSCGvbENz2N7s61cQXB4GMbR5nbmTZM6YwZOpJzLVKS+si2m+
	/pWRHj3LNEr4QbSAIkSBQTmc3SAMqNXZHJS1bf3C/MIPeBlincF+GC88nvS3lxZwBocGuW4zH/o
	rg8sbwDEduyFuNtCBPGZHDSHfIxakBHQnmCemIsiayhN5QT3Khd9NchqJcwaXCpQrwxBTSUx7bh
	JIJgK7RboZGrPM9IGatzSuBLfEyxHS/HuyuWiadq4cX9JlFvBYC3pho+38auyP/QQkT/6NgME6s
	U+Q3k07eTIQvqYP2DFvKLx5dBHjOpGTes7tRG07rIP5R5hW1zINBcyhsn9JGWVopOg8Y7AJYOaY
	hRqSYPskbRwjP4MmEPELcX8jrdnL1bp2H9TkQxTSKOorDGpT2lCzTIaXZepq8Pv42ciD8PXlgEZ
	mjq42xTmc0LWM1glHVdV89+5mevj6NaHVMZRo=
X-Received: by 2002:a05:6102:8083:b0:633:e67f:b7f with SMTP id ada2fe7eead31-63a3fb9d0d6mr10696869137.25.1779288708326;
        Wed, 20 May 2026 07:51:48 -0700 (PDT)
X-Received: by 2002:a05:6102:8083:b0:633:e67f:b7f with SMTP id ada2fe7eead31-63a3fb9d0d6mr10696847137.25.1779288707816;
        Wed, 20 May 2026 07:51:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c78csm5128907e87.14.2026.05.20.07.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:51:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 20 May 2026 17:51:22 +0300
Subject: [PATCH v5 15/28] drm/msm/adreno: write reserved UBWC-related bits
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-ubwc-rework-v5-15-72f2749bc807@oss.qualcomm.com>
References: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
In-Reply-To: <20260520-ubwc-rework-v5-0-72f2749bc807@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=968;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0CsJEQgFxj0TwGdynRcKHH8T3xjv2c9Vfkj1PubtikM=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQxbvqYxadaG5io5X525UXejLoOa/hZE1rVbiauLq3teu2
 r197Pc7GY1ZGBi5GGTFFFl8ClqmxmxKDvuwY2o9zCBWJpApDFycAjCRl+3sfwUiNkhGfZW9nvC1
 4WhJ6uVtV50CWXpqXrAufiz85Z+y6vn04AmqL1slToXnOry7mOa59FiizJT93rvNn6Yk3fda2JV
 dITtb8HOWxbclH2Y/mN9SGWOql61gsS2Iqf9NzunvnKcPh1SctBR16/U0Pfqo9bSC7w2NyVbL0s
 X2WC7OZ7IXFXhpfspFOa5BYVrgzInxTxbwxVrsSl/ycgaj5QbZW+tOmDCvE/D5ecft7nrXBUdzs
 6JSnIJ4fu+RvuyycdO/U5ozbaOs6xn6axazqbZfl9sVK2fkuNK6kDftrTBPpGLiLHWBVys3u9m8
 2rbWcerRy+eC2G/mbp1slPKdffmH1r6Wpx6qMd/NyuQ1AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE0NSBTYWx0ZWRfX3+k14KN8/DYv
 mR82LS2UJM7RspwPkbXFg2wnZHcFIbsX1+K/2RY8mc8cnso6Xj2RqI5deO4c1chFRJtGhE3/ugt
 eW5dlzZq3esRoNeRhz0B0FLd7C0L0/cs2K25VPwZvq28bH/tbhVE2LoJj/hNlbiP+jEn6qwpS5S
 IH/lA8pz44du38ytLmHC4O82UPyqJkm1XPm7Q3EMvcYJZz0NzUK1L+bbrVe8DC9C1WBrMQj2kQR
 QB8FM1kU1/pwHiEgb7W7hNApQURGllAYCENvpiyUbeDKpl5OphQKX6Y809GUOr3cP2bTwT4dxte
 P1x/QQN9/dQVVkeXhmRpVVPeS3c2KmA7vnrW9YXyg33wsnoJk/nv02L/r0ybvzNmxSmi+xzQULg
 9kiuDRQqQt4cmtfEsdm3iI82e131D9LX/CKkLLaQrMF3fQaH9cDnKBoacLushhvDRrJ42HFYgxd
 doYkVOccsUsBm28KyWg==
X-Authority-Analysis: v=2.4 cv=N9cZ0W9B c=1 sm=1 tr=0 ts=6a0dca85 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=jQZLqUlzLjo5U5EXcnwA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: Q3LZGPbAL_exnzZPp_QFC6hmbr7Mzya-
X-Proofpoint-ORIG-GUID: Q3LZGPbAL_exnzZPp_QFC6hmbr7Mzya-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200145
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108799-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E71B9590824
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On the latest A8xx Adreno chips several of the bits in the UBWC-related
registers are now hardwired to 1. Currently the driver doesn't write
them because there is no side-effect. In the preparation for the
refactoring in the next patch, write '1' to those bits anyway.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
index 53def136e0fc..7a6223ddd8cf 100644
--- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
@@ -288,6 +288,8 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
 	switch (ubwc_version) {
 	case UBWC_6_0:
 		yuvnotcomptofc = true;
+		amsbc = true;
+		rgb565_predicator = true;
 		break;
 	case UBWC_5_0:
 		amsbc = true;

-- 
2.47.3


