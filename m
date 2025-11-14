Return-Path: <linux-arm-msm+bounces-81763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A4733C5B351
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 04:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFCBE4E4DC3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 03:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC3D26E6E6;
	Fri, 14 Nov 2025 03:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwMh9cbb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoCaNCAD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4115772627
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763091820; cv=none; b=XnB8KPyVhuS+bbcuTc5k3kA5CouzoiyrXbNbceYIWedsq5DTIEDJtj+sRQG9ksUD2RLmfIJC2w0Vi7vepcEt+/RCBQnOk2gdc2jy8TDE2R316/CmeDLgkWXHL79J8iBvSHrugl+GlPdC9La+jOjTyYccgdIAnfIwzDCSxwTn5HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763091820; c=relaxed/simple;
	bh=FAspQ5te7jCD3MII2t3C1Xb9BvYL+gFWwTvuI21RIkQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mpYfhnbl1z8r0CVlTE6VpHqLwlCH0ExR6JR18Tetalvdyx8N4QfsRmbOCNaPrTrjuYC2hA9Wdq8cRvSN2DagswxRhS08FXp/0gtmuetu3hEY3lHHfVzkbWp0mQXO4W/3sJxWYcQbfqg04Wtbg0QckcSAON7VgcVBU4Q4Wp6tnOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwMh9cbb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoCaNCAD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMahWR1484516
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mtv+8EhagHKvGGr8Q7UOic
	IGOvkdKrYSjC6CU8FsMI4=; b=IwMh9cbbtfAbVgc8f7TVeHElqknQclxr1GlFLZ
	QLRdYU1xV1HIH8HFUbK5Cd32OI8/CUiIh9NbqP9gxMnP09o7/Lwl2zeBPCWW0V6J
	BtsX4a049fLK8zeXRqcOmVH4hDPwX5jLpG43kDAo/gqOVxs1aWga6KVH1MqetkGF
	yq7fEcSINzDOkZW6bkbyJBMx/F604ScCkqkyKyT6bQHR+UaY/cyP+qieGaJUlqpQ
	54FyXILfTeqvc3McOMnMMKTXGnqq/rYjGsX5wmrf5KWQTPl0Elu4J+2qF0g8cmUP
	/xByGBYMJH5uAqxwz4PSFO9597v6Bqo7wCgE2sUisN3d11Nw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cgqv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 03:43:38 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4edb35b1147so41405041cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 19:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763091817; x=1763696617; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mtv+8EhagHKvGGr8Q7UOicIGOvkdKrYSjC6CU8FsMI4=;
        b=BoCaNCADdU1YCigZldQOUz9hmEmGilRk4bn4rcGOCs4Wp7c4Tg2mUyCndQF7+TrnCn
         C7EoXKdlG5cpZKj251JMFTJSJxZiIdor0eCATbFPae9y7rJpIvAtoDkYxHRt6i8epgRR
         1z3m/cuO58617VWd62BkRiau03wQxsamF3y3s2eF70tObhlKIgdxqm8pwSyhywdcwaCa
         QKVIE5VbIsYHXIkDEABR3OAfQvdqo1Oitf7ZkEI9O6OzTFkR1E+ImR/w8S77ULie3Kz8
         KRGvkHOXp3OS+1vAhrgEEXasvWEXqTfwh8XqzCex1tEzKVoNiCZduEYN2ZjtYSnQL597
         59zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763091817; x=1763696617;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mtv+8EhagHKvGGr8Q7UOicIGOvkdKrYSjC6CU8FsMI4=;
        b=M42fEzPxkPgJhR1b4493GUC8A/tRd0Sc2Fg3+F1A9MuUKdzrANkXM/GAON5FkEQO+a
         uqfxYOX6pZHbNirPT7kFXHCXB2J9eT1yT/m8YFNuHgh/643xQv96+jJ6mvR+yapWkZdq
         AH/TDk188aqPqTBCmU29txKbOMSg5EtxNFwqkIR1vWqL8M5lH/fJ0DNxlVvst1tcoU9W
         JOW5wLn+uhSJxTwSxW4eY0sFHxaPgYQit3eJEjP9tGJH4/FXOlElFSQqGnt/j6Zg5X/7
         piIkfOMDzM+xqvcHkH6Mvh9b9WDXzXgGOzs9OjYzh7VX8NI+bASRcmahp13mHKGotyi5
         qz0Q==
X-Gm-Message-State: AOJu0Yyv76SVga+4Q91nC/ACE94HYALtyHgrgP5gGituaX3jWKJrFO7k
	kAlyDWly0JDNa32ecCzhCWDMny6ax6w8Hxq21nZzwz+02kTqmqrxPd1xNarWNCbyxOR9vaECDR1
	o6rYQ9CdAhWjlJK7Qcjcbk+/PC/5LTQGAroyyMclmOanUPWHQTioT12hOuiysmQT0P47B
X-Gm-Gg: ASbGncvzRM6YAURGir/7SgU5Vr0R5OLkwh+jKUDDEucBGzX6+YCtziIfY2amVyKgehR
	RNMJ2+PeHfBd0gPMlvS4TSOm3OxwgyZLNGoBaPxO7+FUBnMvW1vTwAAFtrmYro3Cj/n2BJob7nH
	xxoHcDFPIBzD81t7q9vSyG9QjI8yKqqJySr/Vzuar3R+6WIF+SZSyT49I8Qdjrqw5i9Eu2cjUt0
	XuZqlARI3L3qnt77E8JsJ5uGhR584el7Sw7TTlk2quGSt91HtSiXTeeUJy2DYY5b9DtvwPF7vJE
	96qpZnN1wwhADdU6L4xdvBXvGKZv2fxRjldf2lBpsdHRxABksH4w9YifU6lenCBnCTbSq4HT9hH
	AydUJ5J4LwNoRS9Gu0giOGIjXt07q2XGTc/43/Zr5n5bRGWWMeE8WTHWdoLjDqMx0QzCWQ6257L
	koDQIenKXrH4lj
X-Received: by 2002:ac8:7e86:0:b0:4ed:aeaa:ec4d with SMTP id d75a77b69052e-4edf215e3f7mr30318001cf.77.1763091817478;
        Thu, 13 Nov 2025 19:43:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkCf90PNJaJisIe8fXiiAkfLJ0FuBztAmHnHj5XsWFwPvVi9xjN+CMEzkU6HeCl+PoDf2CKA==
X-Received: by 2002:ac8:7e86:0:b0:4ed:aeaa:ec4d with SMTP id d75a77b69052e-4edf215e3f7mr30317771cf.77.1763091817016;
        Thu, 13 Nov 2025 19:43:37 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 19:43:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 00/12] drm/msm/dpu: rework format handling code
Date: Fri, 14 Nov 2025 05:43:27 +0200
Message-Id: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF+lFmkC/23MTQqDMBCG4avIrBuZxFi1q96jdJE/a6Aam2hoE
 e/e6KZQ3Ay8A9+zQDDemgCXbAFvog3WDSmKUwaqE8PDEKtTA0NWYoUl0eNMWud7MQWCuhSGayq
 obCAtRm9a+9612z11Z8Pk/GfHI92+x06kBAnHFqUsqKxVfXUh5K9ZPJXr+zwd2LjIfkTzT7BEV
 OJccWS1Qn5ErOv6BXm/KmPwAAAA
X-Change-ID: 20250705-dpu-formats-0d5ae4d1a1b9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAspQ5te7jCD3MII2t3C1Xb9BvYL+gFWwTvuI21RIkQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVkJq/WsTptHImH1+zzrsWvVHNdYK/d/6Mak
 yMR/RIihOeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZAAKCRCLPIo+Aiko
 1dJ/B/9LsQjUuvstnTJ3Gu53nRpReK+fnzJdt/LeyMCZFxXwwQQNoXXc01qYAwLIY+Xoev/vROx
 A/P6NxL0Xk3LWTf8KvlATvOMMUmkfs8SHbg7AonsMvhRCeQys5f9CQoY1RZR8/m4hjjJlF/GqzE
 3r1aX9gVjvK49QkTojGaL1iPUVld2sUUovOKisCpEQTcq8BpWLZ4anX0rxCBDySUytKR/V0NPPW
 fcI/ZIJP2w0bfaA9zr0VUiOjd9zz0uQ/lGD7LnhQOCh+LDqPJsnzziWyR0pFmJo4EciIyshxXsb
 h6tb0ZIZHkRzymcmv5+cQpv/+TURyim5lRPkNynsKdLeGjrd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: pc1sKae3PtHQnB5pYM6t3E--UEltcaKt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfXzNZSASyMYIHZ
 Vvr3ro4IRGvTcojauaQyv+tk0PeylC1ftOAEEm7LLpjHvdbM/dzXkhX9vkxhnLf+ngutxL9VcQG
 2SGsSUuyxdibGyWtHw5ETuOwhEdeJXNC46k3Fsp3lF9o8ZsSH1ThQofaNgXO+a9LEau+aZytwT8
 BYQIF+kfdEJmFp+ppgF55qQxEYtpIyJVD6bqpAF7QKpQMj3CbARZgX1xPJ51hitbwmk81Tpk+la
 JR1JcnerpgwtxiaL3+tovrnA99/BHITgcgS+ut9CTylrCIxICLkKDEiLf8iZZ9gJKTe04uU/4DA
 TFVBFUTsJo+W9fpBir5c15YN+86zM0/VEtx6/4Os2+8fOvRghJ9MSr9+K3TAHp68e5uPb/mWLlK
 D4ZJ/ct1sdex2DRD57+RyKS/21G0CQ==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=6916a56a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fDhhjkJkotr-cB4PFRIA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: pc1sKae3PtHQnB5pYM6t3E--UEltcaKt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027

- Rework mdp_format.c in order to make format table manageable
- Rework layout population for UBWC formats in DPU driver

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v3:
- Readded disappeared YUV flag to PSEUDO_YUV_FMT_TILED
- Link to v2: https://lore.kernel.org/r/20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com

Changes in v2:
- Dropped DX flag from the tiled NV12 format structure (Jessica)
- Changed round_up(foo, 192) to the roundup() as the former one is
  supposed to be used with power of 2 argument (Jessica)
- Fixed undefined varuables warning in
  _dpu_format_populate_plane_sizes_ubwc() by dropping the always-true
  condition (LKP)
- Link to v1: https://lore.kernel.org/r/20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com

---
Dmitry Baryshkov (12):
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in _dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in _dpu_format_populate_plane_sizes_ubwc()

 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c    |  174 ++--
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h | 1155 ------------------------
 drivers/gpu/drm/msm/disp/mdp_format.c          |  614 +++++++------
 3 files changed, 391 insertions(+), 1552 deletions(-)
---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20250705-dpu-formats-0d5ae4d1a1b9

Best regards,
-- 
With best wishes
Dmitry


