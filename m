Return-Path: <linux-arm-msm+bounces-88307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A1CD0B003
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:44:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0261A3035250
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098B0363C71;
	Fri,  9 Jan 2026 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l/GZLk1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="klo0qUWA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BA135A943
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767973057; cv=none; b=Ey8inY6/UlC0JkDeda+NU6xy/2qFMMTUjBZYx9xls/EL93HkaW/hHBVx5Sfr1dyCqg2N5e1qXRT1O7q945r+fEKUmdPbOXlhhrBK6a3H0ImBqje9SJcN1yb5Ad1JPyR91TG+WeT1LgZg5DDnROOlC6/InZPTDQb3gnFqEhGtAHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767973057; c=relaxed/simple;
	bh=e/ucZ4vZbb7QpH534WuzvNnGr2vjCakhQ1Cfbqqb3S8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRLG/yh6axc3gqxaSRaPlK2gaca7O9TSu60AT8RPyjCABXijcWh9iWYLWs+AQL/QTmrHf9etHw+BEXWestQWGpygTKiSJcE07+trWf7KAzAUnTw87H/VH6+2xOp7rf1T9t4fxFQhH2qdN6WO4kb2f1bNZMDBzXtV7SnBM0Wlobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l/GZLk1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=klo0qUWA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099MxTS3324804
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeu
	Ee1C4toM=; b=l/GZLk1JvMRvn8d7JS4mmfK7QER4BQ0BVbx+q91Qp2g2WMt9LEk
	kF4WdMa9W/PDgFofIvDQCFJ6PR1EfY3MiOIhSraxLTD3vDenMcR3TQzmDEUzCwg7
	dqeEXwJxE2d1FJxRNfgytfYgOgWmW4oXhFdg2/iJ+H3TI6ahGFD+wBlNfuLge6ll
	Ctg3PG2mdIGFDP/5fnUCIxKSfZxAPJDKKk/2w7JFweXhWVQBlCo2ZKCqfW6oRr/1
	UaBTPYawZeYWJioGJb5huvqY2foIo8xL3t1/g6Y2mxfly0SV7ZT46jKjjgO4ozIo
	i9CkjSiJZYp1PUghK4mwlB1KVDQWwhiV8sg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6ja2p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:37:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso44824835ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:37:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767973054; x=1768577854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeuEe1C4toM=;
        b=klo0qUWAyQyyuKbh6wRZmPDhVREWR/hN+9fTTB0ZWqb8/kSPOU9WV5u3iM7zdkuOBV
         sxhaVz9h57LBWYyrz63ZvW/mIJhVLXvtlhu3JH7z3EHkRJ/oOwUwGRDkliE6Vy8WG3lh
         hKOvBum6gbUoOgtLgHUDPi/Ss8R+f7l3D1SpkMAZlGH5YQZNlVFux54Jgnce8U8DVq17
         vdTEYoYXaIFcaVvXiTB5+swF747nt9HgRq8FemkgbVi7nM2LT7mME8QIrTHosUStp5Ep
         Wxn3DUxSkzZGBaBn5JrTouHX8HyF1PC/SEM+XxAOOriKqubPXLhbs3oAHlFq78YhBygK
         Rkhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767973054; x=1768577854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHakIWdHA3tILLmRl1PebXFV4KtBP9eZIeuEe1C4toM=;
        b=O/z67rBg4qepGnJOBNRBxvzdtctu3097jAgvaIOPXhCE5aZhphYSqBUqyGGMrSgXPm
         u9U6D7GuUlebxiPqvKPSaASTRVQApFZ+kA/bUuhKjpD4CLHXT4j473GI+evqUCgCLQxR
         ZPTGTBRKSRUUjzE+B0/giUSbRUg1o1sjPfBAdnmz0bu8bxG+2s1GozjycAeY8jLUynBK
         grJQ+uQqnWrAs/fkVrI1CouSlAjRRPcTYKqr4u8eTfN+m70p6i6y84qrwNvk5rA7Q/G3
         F+i3Wcm93OxaZjf1aK0rBlqhAe+dSQf5/TadHjNzMbdwInzWEBal2PP2VMI15Iri/gc7
         bAIA==
X-Forwarded-Encrypted: i=1; AJvYcCUgcM4TF86jAefbuKCQnNwMdUzZXLA8ex/ppYh7Eki/PXo5VNHhyxpdKsGmT1/LoMT8GDlcwt8NfiNxbuA1@vger.kernel.org
X-Gm-Message-State: AOJu0YzmrewP0KvsGYEDFEeSs6TejODHnTxbzMHuJ8lkFIMomK2bfIiU
	0FBZfvsg+cPm34o8zpxXrwOtp2AVBU3IMYng5EPG1Iqw+eUCy5tCsADHJcdP7ky5FbEmn4JR//g
	QW2D0n6f0fdZ97od9pfsS1eOhdQWcvdEtyOtkXanNTM0/PAkFg+mP276NKd0jikojIaYq
X-Gm-Gg: AY/fxX7QUeVQY84xvKR3xwHNczBjINUlCg5VlXDMeI4ByBU4678JwCDWJ6Ko8ZslpHH
	3m7UrleBHM8+ogHAQkQp/h5l9Y0b+aZf/GeKFvEBQVoIOrlKTZTpM/K8Dpy9v2NbMuyUA/yxOH+
	EYW/NrK1AOSl7inGQKL7nqRCjEB6uD95OEGp64/VxokAl8hT5ycbOQIjkgtDz6RabuIydycNNyN
	XIeH+3TvWrfyiuarsL4Cnjx/62KVWfLVR5zjeGHDdoLE8auRMlibDgj+wmo5UTUxGODbVNI9cb+
	p/SLJwfs0ea56Pjjl+uRRAiSqr5ZBwnq9AAPyTY7IslIuYj4SV0S4qXN9U2HJGYtOLU0bnIzySn
	ARG6UTN5A5/3Bnkmmk/TpNP+Akyoagv7rjV10CdeOx4aNnJravH/UcyI6
X-Received: by 2002:a17:902:e748:b0:295:6d30:e25f with SMTP id d9443c01a7336-2a3ee4a8731mr91840835ad.53.1767973054434;
        Fri, 09 Jan 2026 07:37:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG8Uk7qOMBA7antJfrGZImiAYyjpfRAhu2WhMQR4Frujasbn70BkFuYzCCn8ka6umjSyUS/Nw==
X-Received: by 2002:a17:902:e748:b0:295:6d30:e25f with SMTP id d9443c01a7336-2a3ee4a8731mr91840515ad.53.1767973053899;
        Fri, 09 Jan 2026 07:37:33 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2a3sm110759525ad.13.2026.01.09.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:37:33 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: A couple gen8 fixes
Date: Fri,  9 Jan 2026 07:37:27 -0800
Message-ID: <20260109153730.130462-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNyBTYWx0ZWRfX0JJcHVgGl+b3
 u4+yXLf0onBa4l8TTOpWC3xpLMyE5HbLWdWgcXxmZR9832+XijT3EgAelQ8DXQiN5vT29HvwTXf
 VcZsJc+AcGIzG9QHmHefvHUSnZopyKLcNwQCC/Wuc2aoR+47VnEVQZgtTwB3/0avDduPTKFCyzA
 m8NeAA5GyFYQtfJAzXDtCcf0aL/RPsaH6wvBofEZ1sKq6acHvZGS3nxksWEAluPU3Y3faENotm2
 XH71cbIJY9AKD0yqNDbZwgj9miBK5DkyEmUNyHcXbOKdPErHfW7tkE+4qxw183ER/PKUOtoqKUS
 y3IJU/OKinvDsUE8SAWUQTgc5SVygUMbzL0yIFiJIVd+clikrEueCPKGzaHQFY2ql/TntH6Dhis
 q8DXFUzJwWlwNpI2QHgULDWCNTHJivwXeADWflAUx2fSnmi7Mn+EtFRkBIV9ekZ/O39GQhEvKs4
 9h7bJMuChitmyEs+7yw==
X-Proofpoint-GUID: Z1bQ0Ie9gZLDZK6OjNsE_ri1IfHZLca6
X-Proofpoint-ORIG-GUID: Z1bQ0Ie9gZLDZK6OjNsE_ri1IfHZLca6
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=696120bf cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ho2Lwv9vkAcMQfqMMXEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090117

Fixes for a couple things I noticed in testing.

Rob Clark (2):
  drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
  drm/msm: Fix GMEM_BASE for gen8

 drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.52.0


