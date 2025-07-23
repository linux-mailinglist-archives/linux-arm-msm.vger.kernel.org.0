Return-Path: <linux-arm-msm+bounces-66367-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AAAB0FC8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 00:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FD721C87259
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 22:13:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D6027055F;
	Wed, 23 Jul 2025 22:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BKX9qAAC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EBBD1F1909
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753308762; cv=none; b=Uv0TyuJH/iGdm/mvWIaBKNrsurH1fCSCrZFMou3Ek4KqJ3A3tmE0P6P0Wd/QcHO9zv2IUM+NPqfKWnw6Hz87DGKZhANm3XTKJK6TnvEi7BFrN/QUPen2r9gWX2YaRZFNX3tFUi3Sw3NRDVNVL8CKW2LL7wzJQKfZO+Q0j9HP9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753308762; c=relaxed/simple;
	bh=Clo23ghhSm2S7QltgVOxt609m/8rT+3RDFaZP5pLYcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u3ChFnceNcxmyhoQZgexxkOf+INiucRMtOkWwqlZghHYpMmNWCTxYAxGOP9C3vnDcoBtiXi7JGGGnafukIe8thOPvdk6XWFw/r7IHf7+du5EnlAiZ5QmngRB8N6oEOR+yz8UWRrlGZVVRNdnRSXwV/a+eY1I2whhb+w+9jWnMPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BKX9qAAC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHBlPO024657
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcS
	owvwXJBw=; b=BKX9qAACOypq9Ag3a8Xu0cg0OGsi6d8peARGUYNgHeyAeVeMLC6
	/d5xKbC77jzx63L3x8nsw1HKEHHaiMNzoptPWhtADvfZ2+VS9FNxn3e969zHmbrx
	ZwwpDowpS/xwL1f+JeqfdOX3wphq+JUArvuO5wMHQGR59Wb1FTf27Y2F55dxi9PW
	E5TqDpnUrfo+rEwAVKUbMwmHFzqxOY8yDh6ZVQj6Qv9yyjPxHbZu52Jj49o3w9PE
	0OmYQxXFjwj20Gjpo5/3v/CyLdzceHWam08SQwgiv98y/jpvKh/pOmr2ssoL55ol
	n6Rd5jrXEgHQv6Mgdz9VAhQHCn7hZHYJVFg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48047qenpg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 22:12:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso324840a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 15:12:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753308742; x=1753913542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcSowvwXJBw=;
        b=I6NITqpK6vcZiZcsSY0lrOu+fm8kfjZkOCsEVBd6YIDVSA7pDpWqUvF0Hgkb0PLf+j
         y1nk6DHQ++rR+fuYConvsxiDfPYR9Km35MbcBxDWzkTVSQ6tqUY3yQrBWEj/ZknosEVW
         xycY1Nh1VVUABOGfLqd9ihwmiJ4xLDgzKlRxqeFUgkzvgccwf0QQCnh7K0XEJPn+P0CA
         nRqq5q8h6k00XhzHCO0pwnO23gmyrWsPH9W6y3YkqYdiLvZGbnbgoohDmsnZNCVumfpo
         YIWg0djfVXpMgil4B6FR6WsTplUV8nLJ/TUdqm24JZdN4ctj0PFYq/iflbA9SNO/zzcV
         iqXQ==
X-Gm-Message-State: AOJu0Yz+ZMdA7i+d+dLhm1H/aEynOmq1Y2FsFrkxNMHTpyRhUtLEGcbn
	YFUJNPQwLcpRqaavf9/fZvr5r2BEdt/tFpfXKqKcprQCMzdAyqzyCjh4Tegr9K2Y2cHgsqkJaZv
	tauzcpCaxyhRyFfNZcPK0hb9l3T6wgNRq+bIi1LKFObaly/Dke9yDLUNrRr9VH0oPAopx
X-Gm-Gg: ASbGnctGnB5CVlQZr9TBXDJSRM2efzeWBGFEb8pgiE0aCrfEBjITepXdgU9wG4ZFvzK
	0qmTY6x3BlNSr6/ziYk9XNVx4h85OJcfMzFLFIrS12oQmUyFXk7H/kKxz2iKD3DhJCoxR5JTc97
	Zkd2IUL+S//d2WTZvysiHeqNb/Xw2Nz5kthtJNWQevwyvOximH50vi9QohMSiQPYxrWp2tG1D+7
	OIOcqgQpZTNEYlNNy2GmynNMacvADJFG+SzkP9LEJBPf3Pgw0Cd4/NrenvX+JxsWajn4QDaASuE
	A7QDiS2vlSzoxFeidOSrQFxTU/NqfW5Edy0U0/MX1EK0eqWrhyU=
X-Received: by 2002:a17:90b:3d4c:b0:313:f6fa:5bca with SMTP id 98e67ed59e1d1-31e507c451bmr5990920a91.22.1753308742102;
        Wed, 23 Jul 2025 15:12:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzd56I31a4tiJMX9/aFKEr6IuO0MhOWD335Z5swX27LPpZumR9v/x7YlbWBlBa4lwLXzCKwQ==
X-Received: by 2002:a17:90b:3d4c:b0:313:f6fa:5bca with SMTP id 98e67ed59e1d1-31e507c451bmr5990882a91.22.1753308741676;
        Wed, 23 Jul 2025 15:12:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e639f6c1esm72938a91.14.2025.07.23.15.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 15:12:21 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Danilo Krummrich <dakr@redhat.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list),
        Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS),
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm+msm: Handle in-place remaps
Date: Wed, 23 Jul 2025 15:12:10 -0700
Message-ID: <20250723221213.36325-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE5MSBTYWx0ZWRfX0IfuaYU5Nzfp
 I+W/fBHozr59oXp4wt9Sz1/Jxj2Sg6qeiwJoZgoaVsesRaM1z0Bhq+rjNIlwY0KqpuxvYLhXdZu
 8h16sa5TnDZlhlmHf258QzWhyCBgPcNfYCQpvafSmmJkbGOAibXaagGud2N1JDOWJo12n74bPAz
 Z1lOlD9iWw+YnqzoQWEl4wLZTGVa3/75GR8/ospXio6alsRnztKTqetTNz2NLMsoxNsW9yCY8FU
 RAqFtV2/iBi0wUgPhreMAU3T65CIfkgO7HU7bLQ1WYPL5BsjOCi5Pck6O4VAy1keSUy58jmvX6x
 ZWKryBMCweDP/0WKvBWChQYut3CSjjo/AZH5WeCQ2hB6hbfJqSXh6vEQXgCxS1IYktsk/RrMr8T
 ljkpFF26WE5KdGd0Kb7dCU5JW5eSWi4BC2hvbsYCXGQmqsVngz4Hhuv7wPbH52A26ZeEYKn7
X-Proofpoint-ORIG-GUID: dO8uwT4ewTArvXHSK73KQtGfCfeNxd4p
X-Proofpoint-GUID: dO8uwT4ewTArvXHSK73KQtGfCfeNxd4p
X-Authority-Analysis: v=2.4 cv=IrMecK/g c=1 sm=1 tr=0 ts=68815e57 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=r9eiMqSCUvIwoLEqkV8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=758 phishscore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230191

turnip+msm uses a DUMP flag on the gpuva to indicate VA ranges to dump
(ie. for devcoredump).  In most cases (internal BOs like shader
instructions) this is known at the time the BO is MAPd, and the DUMP
flag can be set at the same time as the BO is initially bound into the
VM.  But for descriptor buffers, this isn't known until VkBuffer is
bound to the already mapped VkDeviceMemory, requiring an atomic remap
to set the flag.

The problem is that drmvm turns this into discreet unmap and remap
steps.  So there is a window where the VA is not mapped, which can
race with cmdstream exec (SUBMIT).

This series attempts to avoid that by turning an exact-remap into a
remap op instead, where the driver can handle the special case since
it can see both the unmap and map steps at the same time.

Rob Clark (2):
  drm/gpuvm: Send in-place re-maps to the driver as remap
  drm/msm: Handle in-place remaps

 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/msm_gem_vma.c      | 17 +++++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 3 files changed, 38 insertions(+), 3 deletions(-)

-- 
2.50.1


