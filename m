Return-Path: <linux-arm-msm+bounces-103840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKeuCTmo5mm6zQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:27:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAB434971
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 00:27:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2F37030055A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 22:27:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6503A1E6C;
	Mon, 20 Apr 2026 22:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X8RgU5bH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DAqwiorV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB082BE05F
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776724023; cv=none; b=aYkIgmFmcylGgSkT3RQxuwQeX28u+WcpTKKIDCwI8jWMc4IMnSxzuVO8l7vdVxwpKM2LnYwrKqjGJx0T/aFKuSmbt3aTAFve70FRFS4AJXFfGzyKT7MLWfxQB3MHEvLJ8ntO2tU7qTSdZS9TKjbcKjaaTvvSM7fmwDpr30Kbvcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776724023; c=relaxed/simple;
	bh=NxSB2eJ6YgsZoixGZYAupeJPNn+KiJdRXm6eMhiWPKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N63WgTDjQwJQHAjozp3HSvTJN0EAC6DuEvw3KOTLp7wZsRPJwGSohOOJK4CP7yQIpnb8AAZcGMu1HJKXpRY55fahotukZq8AFmovhF78PfJS64c2Oo7u1jNlsjAgPL4RrjAJdAqnI5UNPMq5dz29OI36b0TNMgQS41bdIJii1g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X8RgU5bH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DAqwiorV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KJNp2n1011849
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:27:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=q2Dqpg4OdB+GYal1kt4hriA4lBdfXQhJrL4
	/ifmzV4A=; b=X8RgU5bHAHBYX8xmpRu/AVpa3AGhOPNttldsL0KaxFs2yZxz6gC
	3GmCNXCaJ/KVb6R7hCHZrZ2r0O88FkRXs4G+c3C6Vz8AQfdUohXqvlEKRVzH/FJP
	wuUzBllWTp0a30SoPfjxOrvKAub9ccUAvL/TfRLhz4xMve0w9zd5usg5AxhOlYGz
	wuS8ZOYdEMPKttfbAhuGJ0mNyNuSG9Fspx/NQJti7u5IE97dt/FK3Gpr4dH2eiE0
	JA6UN76AmtSg/ts42jLZnQS+F8taO3heyjXMz8rWYp+oxMf+IhSaK+RrMftpqBDg
	MsL1J+CarGiDFCyiVlWWWJCISOYz6PuZAjw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnt900ftb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 22:26:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f71437218so2229680b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2026 15:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776724019; x=1777328819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q2Dqpg4OdB+GYal1kt4hriA4lBdfXQhJrL4/ifmzV4A=;
        b=DAqwiorVuNjvs3UVIHK+NM2Ja8G4KeA9nLS13UaeDPUZrzgcWuszq06aHoG1Ds23sq
         7AfcRBWSMPA5DAxag0POrROTzWrz7Ksv5GWkI/jPGRPQPqJDiaFseRnO6BJsoealDQ41
         BNqrhsIOHyOeu9pG11cs63ZoAz7foVdqsD1iMOcWfl2lVmxTOPRNLyyxJ47mcQi/z54Q
         XCAgXz2GgRQvDHvCbd7KcoU/afAEvwfUOaYCSBmem9Radjyl9ZYnBunDfHIHb5SEq1xf
         P7aMfz59BCH66WBWP0em/CWtjxuPIbG4S6FgqGzCCer6EJRVliQSlazFvBaEsj6JzRJH
         thXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776724019; x=1777328819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q2Dqpg4OdB+GYal1kt4hriA4lBdfXQhJrL4/ifmzV4A=;
        b=e+0MWkFP1x5vN0L6ELApW53eCywsPSQUcsxZnHqWzt/W6Lc/4CBkjA94O/T7Lz8ese
         mFTsiX2ba0HJgnAjaOv6xplwuAV51UHEKbysOdDOYmzVyqeZ0WEz7FWWPQQ4bjSl2Rjf
         QobkezSWMytPQSi1E8hcs7t5oD/+Isz1Qi/manc4vMPGq1A65ri7OyIJPMDsyBMqP+nv
         oinUuL51fFhgECszCTtG8uYWiaPPdj8ta5LKy2gKKeIz6Q0VbkbWo7jK7qxrVK9x8iDA
         HjbHbUAAKvPgwlmU+Mj5KJhZUoOrmzYlS6ln0mmppmJawzbN5XDb8cUMUEU9MIs45uHw
         gvhA==
X-Gm-Message-State: AOJu0Yx4hFMBHKJx/da89zMUffEOyoFQNxjuiZhfs2tIGMuDpMsXSWJq
	3/m1XTZE7yvKEgrffkm9SfNrrFI0aNCy86Nqe+1ZPLZKHQ3G0yj/JhpQMNtKQaY7T65zfEtqeuU
	APOVZKex9psdPrfsAbJGB78pLQSOx5/vcOXs0f+PvDka2gQm6Tl0/jpSWfFfaKezITLgG
X-Gm-Gg: AeBDietEOm96XuxRLscxWynhu1VdJmt8T8f4xco4SAsSFnfLzjrYAxzBwCQ4Z0HJJVS
	HWh5CWB0ZVCni7IenXko5UJMlJHkX6zWOAJPRaRMB3dyV2ml2e32fmCIeRvBNwuBOYYrXOCLe44
	U1Ks6eeP7Q9XRv66Rjnz/7UXysaWixEiExArXLWuDNIfYvUsIaaD1r0H/UHuSzXZPXSxhg/Vx4K
	+GlDwvhrxneGVDPSIS1SZ3U2frfW4ncpv28o3VaQ59C0xpGiqMCMRPxgWu6dZ5Jld2vBglG/8W0
	6RrrRKoreMJVKRJboMLl2V8eM16do6ISMEFqnBS/TEvLD3RoAEDt9sKsFotTQ1WsqQb46CfYw7/
	OLt+Kd/XeZ8MFE9mKYDTxN7MsPS6FqSIE5diyAuvdxMY=
X-Received: by 2002:a05:6a00:4186:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f8c89e97fmr16027068b3a.11.1776724018970;
        Mon, 20 Apr 2026 15:26:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:4186:b0:82c:212a:8023 with SMTP id d2e1a72fcca58-82f8c89e97fmr16027034b3a.11.1776724018495;
        Mon, 20 Apr 2026 15:26:58 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebbf0e5sm11610522b3a.28.2026.04.20.15.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 15:26:58 -0700 (PDT)
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
Subject: [PATCH 00/13] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Mon, 20 Apr 2026 15:25:22 -0700
Message-ID: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KfbidwYD c=1 sm=1 tr=0 ts=69e6a833 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=e5mUnYsNAAAA:8 a=hBlBM7czq62D-dRUyHYA:9
 a=OpyuDcXvxspvyRM73sMx:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: ttrF4WEUp8tF--tqaCLP7emssPR0mfWy
X-Proofpoint-GUID: ttrF4WEUp8tF--tqaCLP7emssPR0mfWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDIyMCBTYWx0ZWRfX8T/OcwY/5IZG
 0adw7b/k+pJtKhibLZvcTkXyTqDNq8KVblLnyqTJpLP0mrp/eHS6kyFfvck+FApt2B167zii+dH
 +iNSVvdaHAtIHQbCQ5+gAi+ijqGVcihcxVGpG5Pq7FWaDW+QfZnU16+y1ixAegCKRgdNwP6wF9d
 h0GIGG7UJFGbc97P35nZDGISt63LsHKMNXUrjjutRPYeEtQzI4E5iGR6kyTUN4K7pv8jsiGxz69
 m7ZCLOt+U1YEV7sEbUktUFZ9qgFmHF8PjXsyCXhXueZjuKijEjiMqjcIV8BxTF/Y1bQTi+w52wI
 OdzifGpNLOYEj+BklT9dGCTHGuDqjNqaDC6l696DesBEi4qVrx5hjaB7Eifu/75+zrkC5TD7Oiq
 ydAvzCRhx4LXGDxYl20kbia3VI0NRjw9xGcxKOPLSfW2HFNpP/PwF+8adhGk7zSGvxVQaUOXBZy
 PCx+JW+3NGG9IxXPCOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_04,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200220
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-103840-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,gen_header.py:url,gitlab.freedesktop.org:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-0.977];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BCEAB434971
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Since the counter sampling is done in the kernel, this prepares us for
not having to disable IFPC while global counter sampling is active.  But
wiring this up will come in a later patch.

The mesa side of this is at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522

Rob Clark (13):
  drm/msm: Remove obsolete perf infrastructure
  drm/msm/adreno: Sync registers from mesa
  drm/msm/registers: Sync gen_header.py from mesa
  drm/msm/registers: Add perfcntr json
  drm/msm: Allow CAP_PERFMON for setting SYSPROF
  drm/msm: Add a6xx+ perfcntr tables
  drm/msm: Add sysprof accessors
  drm/msm/a6xx: Add yield & flush helper
  drm/msm: Add per-context perfcntr state
  drm/msm: Add basic perfcntr infrastructure
  drm/msm/a6xx+: Add support to configure perfcntrs
  drm/msm/a8xx: Add perfcntr flush sequence
  drm/msm: Add PERFCNTR_CONFIG ioctl

 drivers/gpu/drm/msm/Makefile                  |   19 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |    7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         |   16 -
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |    8 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  142 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c         |   32 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c     |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c    |    8 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |    7 +-
 drivers/gpu/drm/msm/msm_debugfs.c             |    6 -
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   13 +-
 drivers/gpu/drm/msm/msm_gpu.c                 |  119 +-
 drivers/gpu/drm/msm/msm_gpu.h                 |  105 +-
 drivers/gpu/drm/msm/msm_perf.c                |  235 --
 drivers/gpu/drm/msm/msm_perfcntr.c            |  609 +++++
 drivers/gpu/drm/msm/msm_perfcntr.h            |  152 ++
 drivers/gpu/drm/msm/msm_submitqueue.c         |    1 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml |  141 +-
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
 36 files changed, 5634 insertions(+), 2205 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

-- 
2.53.0


