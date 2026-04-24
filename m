Return-Path: <linux-arm-msm+bounces-104471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AYjHkaI62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1214608CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4C72302C6F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81D7B29D288;
	Fri, 24 Apr 2026 15:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pvb9NuDA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8hIpt0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FE92874F5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043510; cv=none; b=QqRUfUu8ecKSxkjG1ZnsusmiuQrJXOdOt+hVNItgj8iXlUhts8Uu2ooP5pKitxXKsQjMtGxxKJP1WJ8aN+a0pGopQB5EmsV1j1d8W9iejzxjMTCM3/raRYR8JTnUfYg7ejUQsY/QGPNBs+LfvIaxVlO/D2YfDr0itHnLG1CX8a0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043510; c=relaxed/simple;
	bh=pwN15j13SgeQDD83DFsDYUczR4ayt8mgnLWv120ds6U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WzAUM9Ty6zqFTO67wsqjWKQVSntFFkWC4/JD7euKMM1Zqe35cKzgOlTYCQCyU+jxuVLdLStjc5IgTntbgWHb/YjtOEaL1PXiFuKz00o2WtKTtU/csig4KikpN6WXQl16nM0fUsOKtLq91O4/zB7EFVjofJE1AhIez1BWxUTdcSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pvb9NuDA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8hIpt0Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63ODwqYe2291550
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TQKV5i7FQV7McTrmvPRkI8jVP94ZVtnhau3
	TwLw+RTI=; b=Pvb9NuDAjz3q4XgF6OPkb5+GfqXrFSlPilaYDxNlkSs7cgQ9UYB
	MmR1rj/dE4QOurE0Qfqh2C7npncirw285BHSHwU/35/lw1/Wf+OhFkSoyS7YvJLq
	Yr4fl89P6J5sXdC+fpNL7KmJI5rM0ep3g/ROYPGOBbLLlY5fKQPHMmfVKxXmKIkJ
	rqVLd8h0YO+coX8d+lr/fsWsoPJh43KHJ1un+7md4mJIQ7nfRLT9FS3B2ewd0MsV
	bxnU69jzy+RF/8oMm9QL0IZEDMOlaI+qZl35dpsFVVrfOLrZ/8e26K7ovWoa9SlI
	yahIpcGdNjs1f3oiFdhSPHZ1rHOJoeiDJdw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqxbpb69r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:11:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c76bfd7b9cdso3369512a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043506; x=1777648306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TQKV5i7FQV7McTrmvPRkI8jVP94ZVtnhau3TwLw+RTI=;
        b=M8hIpt0YTFrXVeSho31slDRO5RkYPKbSEiYSqO3KrWkI128ou64YPjwvAuprw8sjt6
         /7I/0b/yloERVSg1YJNz6B4GfjVu2IEp3kfvXrOxq/vSCTPjhmXDFtiTw9rTo7bY2fqe
         EJeAiGMwq2Zup81jf99uWXxUlnerID547gIv/gWb9yCYV5Re7cVYUo9GismlT7uVCpr4
         qBpcIu9VKOhs/OSfi3F2NxUrSkCgIjvm5yCw1+xCImo5g8VqLD1Si0kc2Da3dHvHGwPE
         j30Ll7epQk5gF6KccpLP4Q9TTNPWN9RMRiBQ3Q+rCktsMiYgmIuqzTuzm6YUAsMkT0R6
         f1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043506; x=1777648306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQKV5i7FQV7McTrmvPRkI8jVP94ZVtnhau3TwLw+RTI=;
        b=nk8mOPxX9XHHdzCGk4PxaCIgsTIE4fUqthkFSWpGX8wp10PaCgk7V4iHkQkg672hCj
         6nnGkOZsZHKkJr2BdgqOZ8A3Ljpypl39D8xtHg1neSr0zT/ROVLRiSvS/7lWoalw6R6W
         i3OtKfm7Y/lEuMjzCVwkeil9K3KHViDw7Pr9ldIKT2kKvGGu+0RkXd/dNKZPsx2wNhch
         BOS0pj7g4DoI5cS4N0y0xh6rSJvunJOA0z6BqrTnfZMF/cF9m5O7Td5zZxzZkeKkHEvk
         TVwczwvni+mOrdlD/+EVEj2EfDf7pFIlLJuTJBg+otNC7JMJmsesSmbQL1HIoYJUc/R6
         6QKg==
X-Gm-Message-State: AOJu0YzAF8DteyUFt24ngPSKfhFlUFxQwKEA5XFXaLahalrbtQTuqmVY
	DvI3BSuw1PtBXXtsq271OKAxFtqj4kEYV3ETXX7U7AtruDMqjspBdxPRtL5RNYtyHEAJ2h2Pvx7
	otingnbtq7DCdb9NCfsq7jvdH7algPHGYUL/aLlfXrfP5LnVnf8yfGMq/TSW8VnGe0sks
X-Gm-Gg: AeBDievh5Ec5oXgD5n6Vfn6FM8VCRRBt4IHeAtvKXlNO8HCqiBAMPBV7gbrdM/x0MnQ
	awBKmt9LQKl4Ls24Le8jIZmNI6zztbCbhKj4Gpxh9PYbuAbhNimhcf0wLrd6duEwQZ5wMctNXsb
	eWsOuFeh4WFPtNequ2+Tq2ZVSaxi9SARxQJuXf0mK23tdny4U4N3rFSEV4AdAsFG8hji0hRTENK
	U5KJIuG9PTpQ3jPJtsoLMRoT9HLLJnj4GoP40E3qld0wFEAZiU46h+Frq0Ubp2yMEaVwYTxrL0h
	YZdwMxfDYJTjWp7Kfp1dMCxZdzl19wWdlStDNZz61GkNuhQ4bmqlip16AJeyaAfaafThvvwF5Sz
	0UhKfjTM4V5PMsFegUrcKCGWrU+yxeRK/UCp6CIbUcVI=
X-Received: by 2002:a05:6a00:6c87:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-82f8c80e36bmr31088716b3a.11.1777043506338;
        Fri, 24 Apr 2026 08:11:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c87:b0:82f:84c6:6510 with SMTP id d2e1a72fcca58-82f8c80e36bmr31088654b3a.11.1777043505645;
        Fri, 24 Apr 2026 08:11:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec0566dsm24084461b3a.57.2026.04.24.08.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:11:45 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bill Wendling <morbo@google.com>, David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Justin Stitt <justinstitt@google.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Fri, 24 Apr 2026 08:10:35 -0700
Message-ID: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pbRw-pQrb8NkA8HsnwpoCug0wwxbHmsK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX84DlydfeActH
 Ic+lgn/QqICmr08VVwdT+um71oKpQ7aaNwt0+4igKJ3/HTT/Y8Q9zBa7KL2+8FGNWu95hN0KBGV
 1BrqyOkYKtM5Pdo66L3CxVdZDm54JQGQO2iH/UsVy65m/fC0PPNMEm3OvvNtX9Nw5W3Crs66VfO
 wvMjcZKV0YGAEGT2PK2TzNU47MssE4MdJk1ukTfp0PLjVwitDIUIxtM0UYudqkqwCR91tW+daO6
 FZz6n5fC8Yom0atOpISNkjGwcxy6NoHlpREOON4cmwP5qj3k1F3i1KyNN072eSLwbyLK+4GXjxv
 CNXnW2JP2zxKhCQJWnMEfmuGATG/UESW4qvoCzdZN21qhDuE+L2BSsilAhJ8r3Cv+EIP5dYlIWl
 PBPV8J4t6ntTKh/LVn23SD/SgEJVxS2G1TYaal5BANcFCX2RG27qUVF7whQailzxRA0gl57zSA6
 Xz6EbL365Lf6kyBD7Vw==
X-Proofpoint-ORIG-GUID: pbRw-pQrb8NkA8HsnwpoCug0wwxbHmsK
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69eb8833 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j6mXroKpKqDHY7BEWhIA:9 a=bFCP_H2QrGi7Okbo017w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: CD1214608CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104471-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gen_header.py:url,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gitlab.freedesktop.org:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Add a new PERFCNTR_CONFIG ioctl, serving two functions:

1. Global counter collection (restricted to perfmon_capable()) using the
   MSM_PERFCNTR_STREAM flag.  Global counter sampling is, global, across
   contexts.  Only a single global counter stream is allowed at a time.
2. Reserve counters for local counter collection.  Local counter
   collection is local to a cmdstream (GEM_SUBMIT), and as such is
   allowed in all processes without additional privileges.

The kernel enforces that counters assigned for global counter collection
do not conflict with counters reserved for local counter collection, and
visa versa.  Since local counter collection is scoped to a single cmd-
stream, multiple UMD processes can overlap in their reserved counters.
But cannot conflict with global counter usage.

In the case of local counter collection, the UMD is still responsible
for programming the corresponding SELect registers, and sampling the
counter values, from it's cmdstream.  But by performing the reservation
step, the UMD protects itself from the kernel trying to use the same
SEL/counter regs for global counter collection.

For global counter collection, the kernel programs SEL regs, and sets up
a timer for counter sampling.  Userspace reads out the sampled values
from the returned perfcntr stream fd.  Releasing the global perfcntr
stream is simply a matter of close()ing the fd.

The final two patches wire up the needed support for global counter
stream collection while IFPC is active, and drops disabling of IFPC.

The mesa side of this is at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158

igt test at:
https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/perfcntrs

Changes in v2:
- Rework makefile magic based on Dmitry's suggestion, and add a2xx/a5xx
  perfcntr tables (although only a6xx+ is supported at this point)
- Fix compile error for compilers that are picky about a struct that
  only contains a flex array
- Drop a6xx_idle() under gpu->lock in a6xx_perfcntr_configure(), replace
  with perfcntr_fence that sel_worker can check
- Add a7xx+ pwrup_reglist support for restoring SELect regs on exit from
  IFPC.  (a6xx doesn't support IFPC, and the pwrup_reglist works a bit
  differently)
- Stop disabling IFPC when global counter stream is active.
- Link to v1: https://lore.kernel.org/all/20260420222621.417276-1-robin.clark@oss.qualcomm.com/

Rob Clark (16):
  drm/msm: Remove obsolete perf infrastructure
  drm/msm: Allow CAP_PERFMON for setting SYSPROF
  drm/msm/adreno: Sync registers from mesa
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Add perfcntr json
  drm/msm: Add a6xx+ perfcntr tables
  drm/msm: Add sysprof accessors
  drm/msm/a6xx: Add yield & flush helper
  drm/msm: Add per-context perfcntr state
  drm/msm: Add basic perfcntr infrastructure
  drm/msm/a6xx+: Add support to configure perfcntrs
  drm/msm/a8xx: Add perfcntr flush sequence
  drm/msm: Add PERFCNTR_CONFIG ioctl
  drm/msm/a6xx: Increase pwrup_reglist size
  drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
  drm/msm/a6xx: Allow IFPC with perfcntr stream

 drivers/gpu/drm/msm/Makefile                  |   27 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |   10 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  205 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   15 +-
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   33 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  104 +-
 drivers/gpu/drm/msm/msm_perf.c                |  235 --
 drivers/gpu/drm/msm/msm_perfcntr.c            |  620 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h            |  155 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h          |    2 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |    3 +-
 .../msm/registers/adreno/a2xx_perfcntrs.json  |  109 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
 .../msm/registers/adreno/a5xx_perfcntrs.json  |  128 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 1300 ++++++-----
 .../msm/registers/adreno/a6xx_descriptors.xml |   71 +-
 .../drm/msm/registers/adreno/a6xx_enums.xml   |    3 +
 .../msm/registers/adreno/a6xx_perfcntrs.json  |  105 +
 .../msm/registers/adreno/a7xx_perfcntrs.json  |  228 ++
 .../msm/registers/adreno/a8xx_descriptors.xml |   96 +-
 .../msm/registers/adreno/a8xx_perfcntrs.json  |  240 ++
 .../msm/registers/adreno/a8xx_perfcntrs.xml   | 1929 +++++++++++++++
 .../msm/registers/adreno/adreno_common.xml    |   42 +
 .../drm/msm/registers/adreno/adreno_pm4.xml   |   50 +-
 drivers/gpu/drm/msm/registers/gen_header.py   | 2079 +++++++++--------
 include/uapi/drm/msm_drm.h                    |   41 +
 39 files changed, 5968 insertions(+), 2212 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml
---
dependency: https://lore.kernel.org/all/20260411150312.257937-1-robin.clark@oss.qualcomm.com

-- 
2.53.0


