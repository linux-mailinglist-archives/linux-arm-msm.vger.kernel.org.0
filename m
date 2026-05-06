Return-Path: <linux-arm-msm+bounces-106154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 1HjKIl12+2lVbgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:11:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9224DE9F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 19:11:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D4D430041FB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 17:11:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673574ADDA6;
	Wed,  6 May 2026 17:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmkOwblY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g96TjbzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9144A1380
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 17:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778087511; cv=none; b=lsJ9v9/iTpWI175exKTERROdcyxtlyrwnGUnplWESykoUSsCvWnP00wtdajbSGlxCzUmNVo3Xc4qq7ZJY37uN1ggDNWWe8Gp1LfCkW9NQYQgp6lZMrADO9mWLaGKVhzmGZOZ2zgjJ+tAuGLpJ/0kNGOxGfxwLENpZtfDK8Qfv4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778087511; c=relaxed/simple;
	bh=fK/E9TlgsHX+lBPStROOkUF/7Po7WWb6qG9opVhAUVk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tTI0aU0lC4KPpxhMmZ3/lr3bX/Fk5Ku8FUtloMxkVdF0O8UJ2lwW61tQ5LzyTIEPxcihi4it8iw5Z9GWTwwlV9lfEwdzpo1v1XaCfA0Pu7L1eucvJ+o3NcKQrNQ+ZZ2iGRivtU2lABGomBDZ67bNSbToVbHivaAkUO5dLcRr+ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmkOwblY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g96TjbzY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646EGASt3309052
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 May 2026 17:11:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=un3yVwWjhGsMpiYluHyNBGdsRgvIh0stQSQ
	2hPW6rbQ=; b=LmkOwblYOW9eQr4d0meXPmxgBYpmcZ5tw78+ewWA3mXPFDJUGYC
	CFSIC6c3MDylMFl4ULaXK95mA85K43T+I7dH2RRJR87CoiowcnGQpGtWh1Afzz/U
	xtZ/R0HUlrzQpQ5RnkXtGJbwh/X1D+y+xoreQosMb31g7PMyxAdwfZu8gr//zkkc
	AhhgT9x3gpMIJN2hqWdZKB63Pvm/RRXAWcDiU+FeexH08PMfe0nllmFz8zeTyOmD
	4IkY8f2UZ1lYOCxZFYMwMSOM19KXnSApDH6Are+hRa5elCARCuus8i+lGjb0u7tg
	rhiKBO6dt6jGVHAl4kdZHcRYyJgKLJ83l+A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e078sgqgm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 17:11:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b7c2ee830aso140392155ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 10:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778087501; x=1778692301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=un3yVwWjhGsMpiYluHyNBGdsRgvIh0stQSQ2hPW6rbQ=;
        b=g96TjbzYHSEgJfImaeKFr0N1sawWR0hCCSGRBmTwvejO7jzhalEpi2gkuTPYbyKS8c
         fMxgcSO+tgbmRDcgqPWn+iI86kgyG7ZMPINlOOidVnj3KTjnKdle6U3bfdsDDuhV17KA
         OQu+rKhckJWahTUiJgF4vLPncqfo9Om7atCdzc+i7DN7wUxzwhPaOvU5it6ZZ4cqBxFz
         6iXIs/VA1UJyUWgzixFAzznaX/KSdJHxUkhYqrpV4ovFSHX0ocFAasrfKV0U3CwxXubY
         R5MbM1HIOANTuInTnQkqgBPhsv5JI4kaySbJlmHknhbrOUF2apd6249IyeBTU/AXIz0N
         TJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778087501; x=1778692301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=un3yVwWjhGsMpiYluHyNBGdsRgvIh0stQSQ2hPW6rbQ=;
        b=pMyNqgGgdCXuoDVNsob3KDHH1L8mTdr0YWPy9UfCzTRVr4FGUp4tkrolsPnfDL+6MM
         tliBjOzinPCxhI05sxvhq+dzEoVYWKsWah1K3oitWx3A1Ba0ljYXelo+YTBfU6INRplo
         +VRmwEVBDbxfwDDoY0GKtgEMxcZN/1njDz9zd1TXo5ugnZAQ4ieLWXVJQrrJy4tktTK9
         uCDGs93hj0C7sMD6uYLmv0Y1rJ9emEX5EU6O0sj8xkI8fxJeba+AtPShmeKN49zKhkO5
         4tHTb9R4FmvytBFno39u2sl05rcso2/zISHihFLem1DUNURPYwYSQsTW45Z8k2/g1Adi
         ktMQ==
X-Gm-Message-State: AOJu0YwjmJhAEfjCkRssd9SloO2F+oZApNrxmWIaYdLine/Sr9YhIXfp
	RyF/9ym2A0WWX4JELukkAPnLzRU/ddvaky8lWQTh+G8u2WRnfyZhdpB0SanAPgB/wEP5lTlm2s7
	A4ngGauzNboRBxkU0DG8hoykHFBkcP5hI3HRnQZ7ZlS5Muyp6nFbxUXa3bOVVqML1+Bhd
X-Gm-Gg: AeBDieviveV6Dtu9Ob2+Q2SsUu457ohgiFvi3IGUcp0pmsu7f99F0pnehR/URiffIr+
	2VRLfh2VpNRYzK5coTJ40m/jOpq/82YalY5E2xhp2m78PyZzCuPUzKhVC8/8BAoVxxsRY2J2myp
	hVClsSxChBkp9oZoKnSqP/S60ovv3F3jHXG7C/upZb1AClvq/4nu7/CvdX4B0rg6dTKuMRIRiO0
	6JsWT3iTn4efBQ5O5Jzsz62s6RUe7YWRqzEtfSJ4z2TEDPy8cfmNvDsvC+T3kVMQuOzYMOsGNDy
	/Ed1CAG3xozOMk9UKTaq4lbJXy1YKAdQWs7mzrjbQ9/gRLqCfhseT6e+LwDi72q30xLupiDS0xS
	M9sCty9eW9BmqQINUf/6zygzqmd3+G6uyftxFPC8f8lA=
X-Received: by 2002:a17:902:db02:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2ba79bdcd67mr42125205ad.28.1778087500639;
        Wed, 06 May 2026 10:11:40 -0700 (PDT)
X-Received: by 2002:a17:902:db02:b0:2b0:67a7:5c4b with SMTP id d9443c01a7336-2ba79bdcd67mr42124695ad.28.1778087499967;
        Wed, 06 May 2026 10:11:39 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ba7be21fabsm30423975ad.1.2026.05.06.10.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 10:11:39 -0700 (PDT)
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
Subject: [PATCH v3 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Wed,  6 May 2026 10:10:24 -0700
Message-ID: <20260506171127.133572-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Lc8MLDfi c=1 sm=1 tr=0 ts=69fb764d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j6mXroKpKqDHY7BEWhIA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE2OCBTYWx0ZWRfX/OCYs1NbD82c
 qNiwXLb6LfWjB9C9lG36Wa0CN89poL5bSxW2sekrtHFL6ttFYy5VWEFbfMaXFpoDJYWGpbnFqc5
 YsfiI5m8yVmjvMQ+KZ490wyFakm4DqE4acoBzK8QtvLIVlTwZziq+eEsXCuhepG2/EloAOPW+kN
 Ow/9T8HLyS1oLYacspi1TmFyLI0utoi23FSplKZzn+ZqxR1po8R9L5lgd+ch6XtdVtGLkD+zZTm
 uyK3KB4LOS+KRHrwy79ilWcdEKjIrjbOXPYig2o3+wfK02k5jatGKWuBMS0/LBi3RjxJM4UF6DY
 OYD8jQcg4X2luvvJqOnWHhdDV/AtqYkLv82B7SW3XQMGh5/BlrOD3qwOWXecn076S1A/NEDLPXS
 L2xOaZ2Kbczf8+atbKQ9VqRet2TFg/U4g7d8URwQuSOH+VGGhy0h3TaAsssvMMj1WabRI/6rN4t
 Qtj8OIy7pLifJin6tSw==
X-Proofpoint-ORIG-GUID: GPKVhzK-Q1Cirm5PqCi0548srbIFfOBb
X-Proofpoint-GUID: GPKVhzK-Q1Cirm5PqCi0548srbIFfOBb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060168
X-Rspamd-Queue-Id: 0F9224DE9F0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-106154-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

The "at least Claude reviews my patches" edition.

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

wiki page about the design:
https://gitlab.freedesktop.org/drm/msm/-/wikis/adreno:-perfcounter-UABI

Changes in v4:
- Fix null ptr deref on older gens without perfcntr support [Claude]
- Add upper limit to userspace controlled FIFO size [Claude]
- Fix nr_regs calculation [Claude]
- Link to v3: https://lore.kernel.org/all/20260504190751.61052-1-robin.clark@oss.qualcomm.com/

Changes in v3:
- Fix loop counter issue spotted by Claude review
- Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
  available counters in case of -E2BIG
- Proper barriers for modifying pwrup_Link
- Link to v2: https://lore.kernel.org/all/20260424151140.104093-1-robin.clark@oss.qualcomm.com

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
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  217 +-
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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  650 ++++++
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
 include/uapi/drm/msm_drm.h                    |   48 +
 39 files changed, 6017 insertions(+), 2212 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

-- 
2.54.0


