Return-Path: <linux-arm-msm+bounces-108267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GN1LZVjC2rwGwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:08:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4657292E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 21:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BDFBD300690D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C03338B7AA;
	Mon, 18 May 2026 19:08:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rc8Ej0nU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jn2t7r+b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EFC38A720
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131280; cv=none; b=QmTGd231k0mvfZ70vFpSz17a+4gqn3xyW9Iyi9T2mHrx+n4Imh1WGlPoO6slOWDJr/7VAvKEhVMW4rN4ekGnA418FeZra3VZ9JarNBjVwmGqCG/fniWgR3zURYks2ApOIGpevnMBSb5LSI5awp4GbKpYc7I9ff5f4jCkYbiJgUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131280; c=relaxed/simple;
	bh=zLCxhUjlEO7hiU0cgdkQo1iKLCAt05wiEMeDar1hHSs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sq2V0ahzlf6rATjFdODX5lx0+tVG7XlqPYcZsqWVC76YFqbX6pK+SZ2a8tx13Jk2kwi+e7g2NhhRXSLmFA19+lmvxDGGvs65Vi/SlNSTk1V1nAN4IAPASqOG1mh/Nt6su6H8/rvCt48TAqi6Uas3gGVhfPlqM9q312HQ+dHfifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rc8Ej0nU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jn2t7r+b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICoxre2437958
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=sNlcHMTJjZebXoe4HRzps1kie9SV5KzjtW3
	FlVVL4zY=; b=Rc8Ej0nU+1edGn4q0FrMUcdkGptepRDg+/QVr6i1cgSr8o8rIzw
	YxLcvk2rBzNe89guNxTg4pMjdHAMkTP/Wchq22HwLm0rScGEDzjmCVD3C9TTAxhp
	hLcTJNY2l5WioWq0FQwb5+9ogKwjQn1tJKYKonX2d4FI2pUryM96r9mAG4BC1sQe
	vPbhQzHmYpJ/tSMvPN1M81SiKHua2qA8VATq8uoXJP0bdmEyGO4W7/iCA6NzNUID
	fu/x7msTCcH0Rtugts1HQjgKz3cYrBvkaa2U4OwlPZeJW3LM7MkCQvQwCPQ6cuhT
	O+lZTzcRHEtyqWjijatDlZkJAUg15IFoyww==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v1fmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 19:07:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bc7f9b2213so20597105ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 12:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779131277; x=1779736077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNlcHMTJjZebXoe4HRzps1kie9SV5KzjtW3FlVVL4zY=;
        b=jn2t7r+bbZtD/o3yfIlu3jzbyqxtLaU/8GBocpeWXsEUo/5Oseuzdw5f8vzPVXRU3i
         X/F2zUu5Teu4abqsrGFHdGl/uVeMdSI+K2ljP1RwRQbSfg6Wbs5Ju6xPaadmBKX+Mkqf
         q3hU4wDrW14oi9qAOG6Mbj/k2osa1Y7GeHLeZa88tuEsxWNuZDaULPVCLKb9h8M3TYsA
         bpmURNsl/9CJGt7q0PltvLOkGI94feBBl8TvWQofV4V54f3tDhsahGjQUivLeJoiu/Lu
         B76ze7IbRDp3ucKYAFc69ywxnnAiIlh59/E88TU7AmHllVKw4F9KqObuDb0UdYTvW4W8
         myDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131277; x=1779736077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNlcHMTJjZebXoe4HRzps1kie9SV5KzjtW3FlVVL4zY=;
        b=PUw5wKNiXB9GDR4h5BfcYE+5tWc/YgYtCrNsq014DB6kg7Ft6KYKC0K5hhzHfOPbqA
         CNEBXfgHWu472ag60o+s32Zoa0FV67GldnAU7HjNZFwpIb3anCNL5kmtbD2d8Km0WuZW
         A2tL+EB5XpjGojhVQznhLvcIWwEm0cIzzWuKcoIPemtcMjhOEYhGf0pWTS0kFdGuEZrj
         oIJ4JDP6T0qsnFO+q5CGNWThIQPyUIFWtrfQ3qOU5GvmLPDIbvoW/3QIpRZfkcHEEbfC
         kihgpugmXYvP3urVCWXTHUEh+vcVZgV4dfgwQ6XEgHv1jqTjnev6tJsjCf20+FRS5T8E
         uRrA==
X-Gm-Message-State: AOJu0YxYz5qqw3uEqqrweKjCfb36FQ+btXXzUSzPeFqTwdGPwFZIn/Co
	3e5D/qQ6MR/rLxLdLwVElLXfUgloyI2HgS386lX14m6ryITfk8cu6nRaQad9WZKBTBBzI/R6/SP
	tUuxOIHnzqENG5acOpvGgeK5m+fzDr6kGcM+Js9B7WXUc6+fTi579OhHfI13tcAN2Lgep
X-Gm-Gg: Acq92OEnorJnPCptykx47mKXK2d9HaTAo6CLW00yhWfkizdu7vyR6OWR2NXDSB0dGfa
	69cw8RIlMORLGL5uCq/9aOhp3Gj5gLTJkmlu/tdKnuJzSgOavHfFq99+cSaZBk8E9qwCSKRXGGx
	i+HXelnlUGoBP0HYYd9QzgxH4WWJ9xT3bdTY9EYRBnvWl/W+zgQrOXLCfQls3ngA4210RhYVpmI
	MMMXBsTFYyzZSBzLhG5tJ1/6JpZ/mN4hmFWNc/cW8iP70crFO5CCeJQGVNf6S1xlGz0L2AZopqg
	dLX02xCQMu+bLfeA2YJip/QU1vN4HFNhmXrAN08/xExqgTW8A29Pairn2nBWiFx4AN9twcBetQz
	4FRamuVS28ItYDFYqM2K8XIleMTZq8Rvp
X-Received: by 2002:a17:903:2f07:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2bda403553emr114187585ad.25.1779131276957;
        Mon, 18 May 2026 12:07:56 -0700 (PDT)
X-Received: by 2002:a17:903:2f07:b0:2bd:a403:4ab8 with SMTP id d9443c01a7336-2bda403553emr114187345ad.25.1779131276482;
        Mon, 18 May 2026 12:07:56 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05ffbesm162791025ad.27.2026.05.18.12.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:07:55 -0700 (PDT)
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
Subject: [PATCH v7 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Mon, 18 May 2026 12:06:27 -0700
Message-ID: <20260518190735.16236-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0b638d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y2SdjSjt7DsdxN5ViJQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: NBFyS2Qd8cLxYoi6zx-QH0-4iFd3bDiG
X-Proofpoint-GUID: NBFyS2Qd8cLxYoi6zx-QH0-4iFd3bDiG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE4OCBTYWx0ZWRfX6SBgjNqU6X1V
 V6noxPWrs5X52oMI04aPFgIgYUQ4ejnt9sMnkuMc/TRMIENkV5QC5UDMKV/y2kW1Jq6u8XfdUJA
 /qpVhR+0NzWn6VsvCs+LZ7XXPfvWEFNEncFqpwmdnlzrfBm5jYybp3Ps2fnSWNt4R8ZxBQTrlbH
 Cg7wAO1FdlU8WC00EA0mh4YUE26NhOzXDwoX+NHfk7u3DFCcjUYR4Nj4Ny+xEJAtYPrNqGQtkun
 F5B5qr96+WBt3dII+fCq6EEygKF4FF6vg/33PfmCAghj7jz1TLsn4MIXd0qW3mtip7zAyEPFPbT
 2yOWmmW2Mt+lgQkmhtIQL5u9yMgVfO7JJtnNFh+8Azex8/1fAqZ7V3Ki0q5b3EgHe8ZS5szTiTK
 LZ7XHzuZSdYXZGHJ4Zg1xLbCANCaBGynmlpKE4Ge3/xJDYPoYc68Fmz1pKTwV0+bwbY77P1yrGo
 gaQLYegStQzBTf5cvnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180188
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108267-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B6F4657292E
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

The final two patches wire up the needed support for global counter
stream collection while IFPC is active, and drops disabling of IFPC.

The mesa side of this is at:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158

igt test at:
https://gitlab.freedesktop.org/robclark/igt-gpu-tools/-/commits/perfcntrs

wiki page about the design:
https://gitlab.freedesktop.org/drm/msm/-/wikis/adreno:-perfcounter-UABI

Changes in v7:
- Use smp_load_acquire() for fifo_count_to_end() [Akhil]
- Defer installing stream_fd until end [Akhil]
- Link to v6: https://lore.kernel.org/all/20260514134052.361771-1-robin.clark@oss.qualcomm.com/

Changes in v6:
- Reword comment [Anna]
- Link to v5: https://lore.kernel.org/all/20260511130017.96867-1-robin.clark@oss.qualcomm.com/

Changes in v5:
- Drop unnecessary runpm in ioctl path
- Link to v4: https://lore.kernel.org/all/20260506171127.133572-1-robin.clark@oss.qualcomm.com

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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  648 +++++
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
 39 files changed, 6015 insertions(+), 2212 deletions(-)
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


