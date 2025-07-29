Return-Path: <linux-arm-msm+bounces-67019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFC1B14FB7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 16:57:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7036116F2ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 14:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DAF1FC7CB;
	Tue, 29 Jul 2025 14:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwrQamTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BD5A933
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753801062; cv=none; b=n97R0U2dpDBW2Aa/bjgbIrycwg1cDRxJWgCCiMQd+0oiqPKKZV5HvAVxdysStwBSJojeJzOnn5Oc6ZQgfc1hfA9SqW651FwiY9Dlp+cTtLE3zTboB80qU/pxaGDlTNV+41coaxRdAnUVHhU1OO+kj8jhIvR9hQVx7kjUFBby8cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753801062; c=relaxed/simple;
	bh=vbFmQ/+esHqUIOpLQSHDhOMZseDsbrI+zmf98HJ10M8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aST+niUABcQKw2k8dhnFUzK0Q42t8fEUmEEscTrrI17HX+kLkMLVc8sMDPnpV1+Q4Aff7MTDjnyt9uJfgO2twqDwMqPcwtrjKhb4YLnGs9pMeYte7QVDreneWUHn5xbcFF+vFUgUe0JKkQZjBKvvSXXhlHYdHhOEVx+fg3Xd1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwrQamTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8p1EG023457
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=r5UPSy+ehArJ0kieZ3fL0Y0tSoDuquiGCGJ
	+T2zz/U4=; b=iwrQamTTYmbGr5OuuQJyvBsvyoBJHBz7WmIenzJNu2bJlTmmqUt
	14wBqLSUfgr3VZj6ZS7/vDOFRcQln0hnbbhSMXXMYlJePJLhCvjqeAqCyaRcHT18
	vF0eqM7eyZJEkgMZzDot1ZGpOqGhT0sEe/Vt9zqQqDfVCQuY9wvN/f5UA2fZeFg7
	wR3VV2bc8cP2zA0Auyal7KvfwJsdnTHh1Jbp3BYDyRQG6+Fr1ES6FMMmv17vWw80
	Mem4gyOpU7iLgGoUntkNLusn5OtOUMd5vMdhAi13udf7EAnCsMS9EitRv7PrfOBv
	Ax4VJQ5klh29ZlNctBDciBlm9va/9P34R1Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qrfvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 14:57:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2400b28296fso34889375ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Jul 2025 07:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753801059; x=1754405859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r5UPSy+ehArJ0kieZ3fL0Y0tSoDuquiGCGJ+T2zz/U4=;
        b=nf6qXoDxSU9t0hfRqYDzgKUeZLQyDzPUb1AhRWrr4D+uNCEEC3aeEBpqtIVbn5CIVY
         wqPKdV1YtntzrAFoz/piRRp3V4HMHC5vfGdF9+JGDeV0RbAN24w/H0ncZWauUMogiOWH
         USUYvBM/Ro2s3HZUbct10ttJdDpwB8+3sYGGAXHCvszj+uTD1O/8nxNj7dtaOPW3r0i0
         6FLmdVAZ8JiALhNchjkQhQr4pnlekXQB1c7KJH+y7w0V26/Uiz0tlF/9ffiWi9ntL6h8
         NbU1cZ/T/C5i5SApHHv21NphcIwJanFfkZBGnhCFs778+xLVLndiDSzPdpmCIISiSrbb
         lFJA==
X-Gm-Message-State: AOJu0YzsBjIexp7Dj6MLbcIXx/o8Vgg9iKZKbkNyQPvxQNPToJZFus6B
	pkutku3+jse9XS17Kln8Qbro6wzoNx6JI8jVrdQOtQ6q1PQ6r/G0s0NRO2EFj9PQlbkp01mT6KY
	52boZ6RdRs6wCNuEDK37XaDpMxqD4bdnTWNKTZBjct8grbR5Epbw3/vI4ktNSkLFuluDe
X-Gm-Gg: ASbGncuEDqxTTapuVxKH91h15lrYJNoAig/OQBwUvNuIK6V9shmy6T3VGLta0MdiTGm
	BURvk8pLsvXyTP2I3Adr4IjDbQSiYIsREoHytAF4YFaVNYLmD3J9SRqBAEYipyNLuagEn6UyyLx
	l7JrDjUsvVwvGNWfTnbO5T+ZfxddRP4GV/oQ2vzt0HCJH7xAq5ZuNa8cou+IpzFivo190PWuIUj
	fP5H2SPEzYRLZu7bX6lGmzHVPRtLgEnFwnl65X2wMdeB0JTlS/kwDrJfAz26gfrTXelc2Hd3tCt
	NYGbJ3DPkaypDhOuBLNWsGZnpL7ARh0PLLStM33FClF8BctdGk0=
X-Received: by 2002:a17:903:283:b0:240:6740:6b11 with SMTP id d9443c01a7336-24067406f22mr49778545ad.40.1753801058921;
        Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFQovZlrhwFov5F/FdQdGq2gSTgHMjBMBeH8Fux2H9TUnRq58+154f4BSUz7QjrZqjwgo7yA==
X-Received: by 2002:a17:903:283:b0:240:6740:6b11 with SMTP id d9443c01a7336-24067406f22mr49777165ad.40.1753801057121;
        Tue, 29 Jul 2025 07:57:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2404483f5a0sm38202595ad.191.2025.07.29.07.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 07:57:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/7] drm/msm: Various snapshot fixes
Date: Tue, 29 Jul 2025 07:57:17 -0700
Message-ID: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExMyBTYWx0ZWRfX2Wk7XYqtJZ1J
 Wlko21+yBA6oH0pRHMb2vfIKutnPPbdBSSs9z2dZmKIk38v9NvHlGsbiNm4D1Cp1oZtQZvKo7XA
 hQu8+GAL6a4KTftLd5XatSzC6McPYcTq8JN5GpByPEjyFc3l0OOFg4yntvuhkfZ6tXI/NgzQZhQ
 gZRABY0UyHc1rVZc21D3G1NA8IcZV0lX5/CZaEa2K7rl2zvEqHEWmIsFDVZ1i0ADTDYoiD3DO/G
 C5kRgGzzUG8h9S1haJ9eVpfUhDgNSR3Kv+1gq7dtfOXUmwtA0aw+QQllQ/7waUF3N7LLxFfx1TC
 rKk79PgUgHdckWpMtcpOtDKuPnIfTzBtDuvSjIcq9CSbFZPcwVsPHhpQDQ5Prbh+eSVpRbj3p56
 4HTmP/6TKd6NcKPfb7YR6kIIzBTElOJRneL1IWXrxnqb/vDUjZm73AukuInmcqkH6MQf5+MS
X-Proofpoint-ORIG-GUID: D9UWa6IAx6_Dq3EiDBvAgXjYrzGW8tvI
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6888e164 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: D9UWa6IAx6_Dq3EiDBvAgXjYrzGW8tvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290113

Various fixes I've found so far while ingesting upstream devcore dumps
into internal tools.

Rob Clark (7):
  drm/msm: Add missing "location"s to devcoredump
  drm/msm: Fix section names and sizes
  drm/msm: Fix order of selector programming in cluster snapshot
  drm/msm: Constify snapshot tables
  drm/msm: Fix a7xx debugbus read
  drm/msm: Fix debugbus snapshot
  drm/msm: Fix a7xx TPL1 cluster snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 26 +++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 +++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 ++++++++---------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  6 ++-
 6 files changed, 78 insertions(+), 55 deletions(-)

-- 
2.50.1


