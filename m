Return-Path: <linux-arm-msm+bounces-67716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DA8B1AA79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 23:43:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6313A3A2D3B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 21:43:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA25723AE79;
	Mon,  4 Aug 2025 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U1I2kJOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B476019C556
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 21:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343803; cv=none; b=JaobhtmtbI5Ie3j07TZcnTGDt5uyrLfVmUufFcUUD8Y6Fx6BEX7pqu1nMrZxgmxaV5az0ZVlV8McZIs9nt+3awgt6LgmnqR/p/tyDA+axmFIIM55f3lBu16to28pt6CCt2VZWq2fdHaGFk4cg6taPT3CZ36R4Oy0IAKZx7tPGZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343803; c=relaxed/simple;
	bh=Clo23ghhSm2S7QltgVOxt609m/8rT+3RDFaZP5pLYcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qriofjYeAGFnfYdStYg10L3HCIKOKEWxTINrxRHFtTZnqXjIMIvXvy3E1wqSw9Z4f+EKk8TPEyuw3s+yZzV8Cwb1gdqjIwNVC1h7vqWeUu2hdqZem2W7wV/f+O/WqHLAu3uH6u64xRvD5zUqvSjfIiEMcOtEvRnp3FjotEKYz5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U1I2kJOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574G9R05029566
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 21:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcS
	owvwXJBw=; b=U1I2kJOXu5Ur4+sTw5Sjtrk6MaCayoLLEJ7Y3QgF2BJtdTpyCSy
	1ibQv0Xan7sDVGeT5SdNiPJfB9RfP82+zQ/K9kDoHoXQGb8fS9s1DFhAfx/kd7Fe
	KyWn42hhOhM4+kZcA23Ky7/8+f3sYt+Mk0ZdOWAZz6dqS+Oh3PTBDlhoYCuPzyH+
	f49Lgr7QfXcZf8FLh4GrwMeWeknEt6yzoZctsFOi8HsP4nc1D1/N6L2YJ0zc3uId
	gVTOQG4nijVeiO4XrLNcpJhoq523VzB+QZqXEPAYbP1HU+lfhL/hppHEdsuWkC9D
	1dkCL0sQDAUSfSDhwcRjeeuSOt7vy5yLtGg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489buqpb2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 21:43:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2403e4c82ddso36418335ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754343800; x=1754948600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Es8yYGkoaL9WsWMGWRUXzp1VH7ftdQ84HcSowvwXJBw=;
        b=qM/umAhy9Rl19q0k262D421TrMwV1lXeSwHKjuxGvgnLzVvDrClbgSFzDownS6bPr6
         X0C2PV2ah3HapB8XTpMp/Z5em12UpGuZiYYj4scHWVk4Jc3fd8qufPIA4IG8Ft8BBf+P
         fFBscVUsnzbjPgLlMeNLRHBan6jhKW+5svl05Slw+3maiys2z+REw2F4/pjZUFpmwVhh
         tRx9hDDPtbnzhN+y74rY2Yj/XP7O1b4wtn8oJMsb2ZSzrOA5YS/KiW4wkFWvO0K2qSQB
         P3AQ4GbWvUnGBbxLQAF5VpLFf3pFukGtehhmyi/QoM+yqZ3L93AneUf22ksgLtkoBBIE
         eqDA==
X-Forwarded-Encrypted: i=1; AJvYcCXACg1aMQV1F1xxyJPixJ7ieHPt5OkQCZM8tp7tuI4BfT7Sk8KumINgq9G+XRxlUrxNf31j4XD9wkvkw8Kz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5rGQqxrarRvWf5WpVua1Zf7yE6L07gKcwZnbFdhQvPSPNJ1yZ
	wJxvutzbVzlJN7IULSNQ+LUBCc9FqEqx79F7UNF7EW56ooXViKZ4/0s6ujkOawCE33hQ5a5dNps
	+hzU7kZi+o6ORGYicKp/2WzxtSsbnKd9tIWAgIxHBS5dxx5/hIpPI6ZKeS7VBulVljiuF
X-Gm-Gg: ASbGncvFFfFHiWK7cleaW88/woAWhRwyMERZWrIwggM7bG5N5TkJvPC6zC4LSN46gRB
	rtFw37uf+xUvIcwVG/WpvbZG18nMZg88TBYyjqVLGqVgoyYIcMYC4jR0LXlNAJxZf8LLr4Z0Ujj
	qq40Ia+lUF058cDRncA2XKESrdDgZTJvFD7YdFQfQX1bSkS9pf6OvBwLlPH11VSa0ezvfvOpDuE
	EkSp5r2i9/bsXb6cQWJBxw2UEvX02bFvAFqpm3jtukLb/tTTZqhIjl7xLnJtCe1naJUu/TXGql5
	XXi86SkubpG/vK5Hl0cnYhpOSEnIDkgWdyoPewhRtj2g51fALeQ=
X-Received: by 2002:a17:902:db03:b0:240:a559:be6a with SMTP id d9443c01a7336-24246ffc07fmr168919655ad.34.1754343799937;
        Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMENcFBVOU5CPFNiVaukbmJxZDsOzIZHTpJidiDWnGmFiPem5d1xxZ1nYXWM9QrZ0SYd5T+A==
X-Received: by 2002:a17:902:db03:b0:240:a559:be6a with SMTP id d9443c01a7336-24246ffc07fmr168919345ad.34.1754343799505;
        Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8976cfdsm116217775ad.101.2025.08.04.14.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 14:43:19 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
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
Subject: [PATCH RESEND 0/2] drm/gpuvm+msm: Handle in-place remaps
Date: Mon,  4 Aug 2025 14:43:14 -0700
Message-ID: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4P5RKqSXHIZA4oiLMdkxBWyTvUN-ZBpj
X-Authority-Analysis: v=2.4 cv=VZT3PEp9 c=1 sm=1 tr=0 ts=68912978 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=r9eiMqSCUvIwoLEqkV8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMCBTYWx0ZWRfX2Gox3MOeU2AU
 ACGbBngs41iVhFVmtwTuuLJy4+oxdwsW1s/NeWG8jBoziZkS5kKKEJS0Cji9zBJmZw+VECK+Sth
 QbPJ2eGf5LDFr6g+BFDfXPF66coRv6X5tUjZ00cKCDuGo/rEOTv1ShcVJsi366kPLL3nKxBXWMg
 XvW5j1q9DR9vlPQqABTLSQuaFifGsDKaJlKwPZdby4aZdqZy80+8fdmQbY0YwHYUxNL/sPSXDB/
 TtYb6OXdH262DrHG1kHqxeqA4z9qKFwG1YrbBa+oyGrK5RpOiCFUVq9FJ/bg3RlVbtZIih0Ph1C
 Y0Y6Whag4JfRex0KKEPIRBLheIA5BS+nRsD77rvVIkKJ9CBhG0pnSWz47KlpvVwOKKXCt64t+/B
 68Mr7nexqyPIgaiG/GFgqy8+ZxhE9Bw6DVCP8IlO5xnVrHmLFtSwvyE75FsrtX8/MmdcudFt
X-Proofpoint-ORIG-GUID: 4P5RKqSXHIZA4oiLMdkxBWyTvUN-ZBpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=749 malwarescore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040130

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


