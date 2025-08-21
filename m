Return-Path: <linux-arm-msm+bounces-70032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D27B2E928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 02:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 508C617B8C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 00:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F27321388;
	Thu, 21 Aug 2025 00:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aw5gBfz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8244B33F6
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755734676; cv=none; b=m4dpCdtfpLrXz7ct1W3GgjY0j+GXp7Unc01VnIbLUw/CHesCaJ368COeaBLvT+uWER5amkhKYY+QT4kq9Ep/wj0l5jazSSjHILs5SUdB/NW6jIYD4QIdxJEIu2Ie3JrWTImlL+foJdkt+Ob2pZf8AMazckEbrcN/Fz0Ip5EuF4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755734676; c=relaxed/simple;
	bh=LL0VHvueeCC9BQFNhEFs/rbo80R0kdyDYeu2Vqvp7kA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kQt/k/duFDcmyJNnoqqRXhaRe0wRNux91g3pznhLaa32+cLt/A4SgPKru6lY9LfJ8AhTIGONyjwLuP7VKdY00Tg/ZIRN0c5fs0wDIjbpite3nbVwa6y8UJPP6X7lmDciMKWkoePkSl/GvSia2J+afl8Ppl0C25FTB8KV6oH8NjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aw5gBfz9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJESic031148
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h/QHGAqsGwM2i5MHloplb39qjZWHbgGxp7s
	oSeiPiFw=; b=aw5gBfz9MKN9vJdrpHWypLK6QY5oMczoueFtm64ZjPpgTxdg/Sa
	GC02oGAioQJ/deR2sjjMx3Q0SjvzTjrYudj9s28UZhxeA0UzZb1RdJHIXqOm66yZ
	8wv1ogTsZtiDfIVrspslTr/gTY4frYeFm0QT5okVoaw9tpNucy2CdTELCTYF3i3O
	x09MuGSyYN/M8RtT7R0ewpcA++jSpGWU2sUtpnoNBA1VqWkH6HqIl6ms0FUfbawl
	QE0rnxmjUnMPU50orHI8/0XKkJ0sBxEqzbYxjr704ayXwbfWBS+tFhTZ6a2Fi3Qt
	wllcmo2m6huLXMt1Ujy5yFAbh87rCbMLN4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52dkb32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Aug 2025 00:04:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2445806b2beso12664975ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 17:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755734673; x=1756339473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/QHGAqsGwM2i5MHloplb39qjZWHbgGxp7soSeiPiFw=;
        b=nfOU/lUAXnWGjccgzGUFZeuIWiWhJwqDbLCaXqJ3mLMmfTiA/6mGP8Hlhb8FdftMnG
         jyv2rHRrHw+vCwCH9cIQYZ7A6zEjzIfXsGSq4pijmmB2wHKzD4rTKOD/r2S15dSZYUq+
         s8BgBIyKDskkGWBHep+sOGSUVXu0oEqEOOPzbL6iUqYzydgI0p0XfVTkVzRCRTmS6WOD
         BbcgvS3RGU7PUF7RnsSLvUhNN0B0taBokE4TlO0kwAMXWL8w1AwczyN8Qv99QKXmJGFd
         puzlSlEk4CW/9Nda+RQi3Ryi0RpbLhb+lozBTIw+0FWVc6M9hmwwIG8evSH5XqnbrdXZ
         3MpQ==
X-Gm-Message-State: AOJu0YykfsxVW5OAG5cstIw+KF7jToTkZ1GqBi6YVviml+6zXfbXkumd
	qX6HProoYyodY3Y23IevznsH/XPEMaIonKvC80Fi5LMoCr9Md9Qu8kmtMM9U2hbt9eUo3YOiUFh
	ZmoYrcXjr5CB9ykDzcXO2og+F+SmIH5S/uPxfT/c5uBYRJjh9Je1STRQC22TCsRWJRny1
X-Gm-Gg: ASbGncsAxjNVmkVJnYXAhiUJzgSlcU9E6EKb5h/jpT5KubbniDwnboMvJRLkAyiDYuL
	B6SN/Hpw5H6ZsjlFlHOdaLDH0jp9jRsvjipG3v1Zjs2LiVCmUjbldVOVSxjsoWs6SMafJPIXwlE
	sE6KnPs81qkCRB2gFpPAuZTX6HBKsuEfGPexBzQD2RPk95VsMqb99aS+vHMCfQilq1hiNA6Hmos
	EwLzrdmQ49ucyGLkj79/pGGzGDET3SLPaTX2WjfcFqA4yDZFOxd1hDfm75zOHVOu+orvVjOvd6v
	ZZIuRFujEQbAFqUgci1m2zhX16vzigrc+vKkE37ZGon4rwLoc6M=
X-Received: by 2002:a17:902:d2c1:b0:242:8a7:6a6c with SMTP id d9443c01a7336-245febed653mr8861315ad.17.1755734673253;
        Wed, 20 Aug 2025 17:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEK/r8TYTWkV3tyt9AedzmAuktOgPzvmoS7TFw/w6QgXED/i2kMdkuCF/pyGNYjh6kI9D4WCw==
X-Received: by 2002:a17:902:d2c1:b0:242:8a7:6a6c with SMTP id d9443c01a7336-245febed653mr8860925ad.17.1755734672663;
        Wed, 20 Aug 2025 17:04:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4c747esm37464835ad.83.2025.08.20.17.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 17:04:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm: A few GEM/VM_BIND fixes
Date: Wed, 20 Aug 2025 17:04:24 -0700
Message-ID: <20250821000429.303628-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX1nvpSI8rgEHH
 pJ9hvhgM3rTVhfETprtrNNh0ElVVIRr77XESZXUW5NLf5UpSZt5YM3iEBxrmsaELHkMWAUq+10I
 /oI1nLuRroMCEw87gKdk/g/UiC4wTI6k2m6TU6r44WesHWhkd+9j10cgSsDckwcge8/kQs1B0F7
 manronLNc371+5f5ieODyRdG2y1rVzxlVzV8U5VYyWv4ewcRYAhwApbmKgTu12PpMvaxBIMsH4Z
 pZTek4N903cFaJvFuxuzeTH58/K7ClE4MEBe5aoqU2t3sTMSRygwNkt474hl/LjH/Hz307azayf
 /+JiAMA5Ydjbxa9OzZ+L0LMOK44//SKuYeYKuuYs4FqPl2fBiYXQ/iRwufCjC9B3FC5xxL7Xrq8
 MwyKd8q8JQTgrnkaH3HQN0tOSomrNg==
X-Proofpoint-ORIG-GUID: G8znBPpwbjEwnVEJu6xpJaa8KcDyBh3Q
X-Proofpoint-GUID: G8znBPpwbjEwnVEJu6xpJaa8KcDyBh3Q
X-Authority-Analysis: v=2.4 cv=SoXJKPO0 c=1 sm=1 tr=0 ts=68a66292 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=7-57VTQsmsoFMMg7Vz0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Fixes for a few issues found in vkd3d-proton testing.

Rob Clark (3):
  drm/msm: Fix obj leak in VM_BIND error path
  drm/msm: Fix missing VM_BIND offset/range validation
  drm/msm: Fix 32b size truncation

 drivers/gpu/drm/msm/msm_gem.c       | 21 ++++++++++---------
 drivers/gpu/drm/msm/msm_gem.h       |  6 +++---
 drivers/gpu/drm/msm/msm_gem_prime.c |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c   | 31 +++++++++++++++++++++++------
 4 files changed, 39 insertions(+), 21 deletions(-)

-- 
2.50.1


