Return-Path: <linux-arm-msm+bounces-105792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJXsJqju+Gla3QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:08:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA104C2E94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 21:08:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1364B302F5AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 19:08:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FE83EE1F2;
	Mon,  4 May 2026 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nu/yXbXE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jhHdp5Fe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6723E3159
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777921697; cv=none; b=ZgEgD/HMP5hC3TjqQh534fEUgJuCbiqrwXpJ3uNczg4TqjXRAMJL7+THflky2zcv0J0R7u6yhE2eLpnPCuL6ln8mJOV2eYC7mwXMFuwv2zYOhUJl0W9DqPJ+TFJlGbJiKjV51EuvHqE8y1ItPF/Kq1DcLDKdwob3Jg0rbwmsgSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777921697; c=relaxed/simple;
	bh=9XOxtD2FkxCRVp38qZa0+vWVTVVedi8ZqdizEow1hsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L1cqIACG2EujV509Fykn1sCo0BiQ9NFIdg2X9y1uaiNSpV8KO+UytdoFLE86apGBs0MquVbM3R46ybTfkA/GS/E99t1WFVEziKLVYaTbRwEuV+rqqRzz/j1o9ejQH+jOA3YHxaJLYQGbdWkAtpIyixFu8Rl2iKKGBa+CFlUh0VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nu/yXbXE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jhHdp5Fe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FIWPm3409266
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 19:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QzGN39/k9vpS2EcWVM+qBeoV72MYzkEJR6Q
	UrJ9Mhpw=; b=nu/yXbXEAggVijSGVSH2hkK5whhv+yzflbOZRmeJM9IfWao+Q2c
	Xoz1ddKSClBPYDIH1YAbNMXyLjxgBWYb7iTM8XeSbEyZoabZIMS/pR6l+An/Z1O+
	nKs7DydhtrP7sL8aH7UM0TM8JSyYgtAx87oZqnTTR4/ROPSsDIQ4nCF6C9C7bkEo
	riljkVYbYs49/0CW/pINQQnC/UvgDsftCrOZrAX35nr3XOAAzBO8wpddj/8P3rpS
	EwaD5CHwx4rg2rPykIipZdkfqT4xL9GZICQTywKIb+H75na0Dacxb2dxo+tyJ3vh
	zF1wJCJzvw59gA/e9kyeFrb2C0Zu/+HATkQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx00rwrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 19:08:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b2eba42b8dso42749715ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 12:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777921693; x=1778526493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QzGN39/k9vpS2EcWVM+qBeoV72MYzkEJR6QUrJ9Mhpw=;
        b=jhHdp5FeCjoKuevEdiIY4kq9pOZ0t+ZemYt/WYARTduITCaDRCLKJZo5i09ahR1GFd
         AbDr37JR7g+e6iMwNvh4hEq2Q4d5tReTmztSvEp6p3FI/Rzfr7F44JzsDKCBSje8nj1L
         6pKT4wBst1LB04mrejIzfSU1I6G+1MnR7A6/T0tvSwaQ3LoY1ecS8YuwqujHZPXEXFO4
         hp0PstIf/q708uDbEehQfxUMA8U4/FgWV2jvp9+0UeLH2wvGQ/hbBWyPOVmztNBchI0Z
         Ym01fVeoZUnDaURr+x2HYJEc/DuXFERIh1zkjxi7x0GzXF1bUNnrtqVWi3irGZeehc5c
         wt4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777921693; x=1778526493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzGN39/k9vpS2EcWVM+qBeoV72MYzkEJR6QUrJ9Mhpw=;
        b=suXWepfKLf9TZaldAJqZZLYy8Y/Sdq7JE9sj+Oqh6hR0Egfla79V4EKWr65A5ZjhFB
         IWxxCWT6UY5sozDE/Y3c8IMCmzMhOP43Wp2+FdYGZVekqR3WXiIzH8oXXPZnzTMnI5Cc
         cJ6cmbXMn6VlhXlVpnoMNsJuDyUaJaRRun7l1/ztfSg4Mx7GMWiTmRgD2qMQhq7KaLKR
         UQVHmdNn5Da/HeUZNS2Wz1zyMoPe++vK8xF2g5IapdvxABkJWPCQIu+O5hnmsT6ULhPT
         KBVV/GXewl8ww5i8OqEQRu+DO62+GZnuqt+cAvzY0isBKVKo6COij0NFLM4yPWmQ9SIL
         C24Q==
X-Gm-Message-State: AOJu0YySzR+OVhNa7/4zOFzphM258XOBXThKi6g617WQwnC/qaUAtbTm
	+zt1X2gqt9bBe3a6yokMD08Gpelt+/695V2b/TQwiXXn403A6kiehnxsZcnCr34w0aVbFto7UOF
	ERvezd5drum/YV8qvpcjmMbXc7vNBtY2NBeelhFJSsF0D5mUgdfjaRP74qCFcBSKVTPzk
X-Gm-Gg: AeBDieu5uEUjmd7XnsuCmaBNbJETcWzJjCiZk+tr6azIbvVC9TobqAi7pGiWsMbdfOp
	kzWfzv6ql39t2KZ7ZibDVBqa8hkkwi/hQlXLb6TBDbSMl0Lxtn0B++bCNvJphiGXWAO95vmDDJq
	IXrU6XXjMrwfClLcYmQPbqR4x7QZy75qq6opIjfP9ps4JOYViZaqz59Vnu82aIYgDnktKR1/YMz
	GOQWMC+ybb7ncP4iti25kaztA9FxqPTUG6oH1lKYbJokncx9FRhx2DhnNM5IjTsNYUcK1Rf44Nc
	L0MWwzPSNQC7pCVQrK1g/QDYO8Nl1GLoTgFYsMnG84lExs8PpN95RcF2YLPAAZcTJraCcP0otiR
	0VlyFJ3Kg11ehqgFMT+bVAYfnEbzEAKL1LVB3982ikpo=
X-Received: by 2002:a17:903:3c2e:b0:2b9:ff02:a15a with SMTP id d9443c01a7336-2b9ff02aa03mr94424915ad.9.1777921692871;
        Mon, 04 May 2026 12:08:12 -0700 (PDT)
X-Received: by 2002:a17:903:3c2e:b0:2b9:ff02:a15a with SMTP id d9443c01a7336-2b9ff02aa03mr94424425ad.9.1777921692207;
        Mon, 04 May 2026 12:08:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae1e293sm119619435ad.45.2026.05.04.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 12:08:11 -0700 (PDT)
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
Date: Mon,  4 May 2026 12:06:43 -0700
Message-ID: <20260504190751.61052-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APflyhIR c=1 sm=1 tr=0 ts=69f8ee9e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=j6mXroKpKqDHY7BEWhIA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE3NSBTYWx0ZWRfXxAl+GfHeyIPw
 FilhcJE8ewY684ZcKu6EqRPVcBudarIWXVnYguAr2AOfcuHFI1ydmrRVy13AFO7ICwSJnyiv9pj
 mT5hPRV10qQek/pWMmgDFeF+SbfNMbj0fFr2oX9KQmyfVTF73B1agLA5BadnhGNlDa+BEjXmTEx
 kB6aHnFv1hw3cHnBtJL0yJvAKmOEMNF7i2SaPSQtdNGNrbd+BKheGfgwW9RF9cxTG+wczFwDstQ
 dlMzaSPUK3Xvb7WmzYwebfvJcG+iDadXr8H3bkY/Q+ZuT/7u/IjcMtS0UZxQw+G5eEgSDRNCupD
 Ob99m2KPnqHNNpMRg/2DxASo6rUU+HJK9AZtbIDbVc+zXwV5L7ZmjaZ/LcN1yEF8M78gxi9rGjJ
 sV1TN0piecNrCEAPKqoxK6RiZGiWNDkzl+pCc8qHxsQjk3PA6OViMXO9MWUxAo4GMEKPwni3kd+
 GSR7PQYcYNvuNvad26Q==
X-Proofpoint-GUID: YZ3z4CvJtiJ0Etscy_LPbF9XKEPlMKoX
X-Proofpoint-ORIG-GUID: YZ3z4CvJtiJ0Etscy_LPbF9XKEPlMKoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040175
X-Rspamd-Queue-Id: EEA104C2E94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,google.com,gmail.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-105792-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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

Changes in v3:
- Fix loop counter issue spotted by Claude review
- Add MSM_PERFCNTR_UPDATE flag to ask kernel to return the actual # of
  available counters in case of -E2BIG
- Proper barriers for modifying pwrup_reglist
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
 drivers/gpu/drm/msm/msm_perfcntr.c            |  638 +++++
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
 39 files changed, 6005 insertions(+), 2212 deletions(-)
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


