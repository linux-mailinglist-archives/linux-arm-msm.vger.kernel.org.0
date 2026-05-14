Return-Path: <linux-arm-msm+bounces-107608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FRqNQXUBWrxbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:54:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8213D542886
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:54:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7C3CA3020C0C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2393F20E7;
	Thu, 14 May 2026 13:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9pgVHti";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUjLPSPY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8A03DD869
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766850; cv=none; b=og8h85enXW7KNzPGo07LY4FWmy3xMv0NWzVdz9tRK1v/YXmVlCH6E4KSrWBKBq+krdtzhEtEBJKOoeQXhpI4Wu+3IAw8yXBWC56L53ezawuWt7fng+yOaX93Skb9i0F6/pojeoJxWXaHvbRL95l4iVwblKeFDXxrJX8PsWNfAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766850; c=relaxed/simple;
	bh=DOeFcLmbLl6/c6PNL41fdFCwCvPpUFyJ4gmuzNba82A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMEhENluU/7/zJEMGEBROBjxrfyU3PTvvS5KZVOC707eQVRakck7Plvs+Y69Fg6Y5DczsdyF0gFrqEX0ATFCOdhK0xRIOlwV7UPkDsUUxL/fs3RAN4nLdb29A0FuvPmgg6HAptC+sarDXvbXAVZFkhbFig9kmjjTx7Ke9PizrgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9pgVHti; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUjLPSPY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUCv2241699
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UfNdfXL9HFmBgf8J4W1GiVknjJBwcKvLIPV
	YPC3419o=; b=I9pgVHtinYWTOfU5xSAu2koTsED3qjnLsFWnZNXdgIrmw0xEsbl
	cOaV5qe1G/vDgTAPdEUxlt1V1JwhUIaRIFcqGcDHsMN223IU8JH2Qz1C2ciqxA1o
	cVr7XXLhf/qaLNL4GWol+FPh0sz+2WluV/zKKqNHrDefH5I+ETqeP20Qajwa40wK
	0wXIH5ZhTZn3dFSXPSwJYzZIk0RPjeHmejZ6EVhkEXapwLnqOhTrWx3jEWHn9X15
	i//pwG9dgH7HcM1DumFNU1F0Ed9V64ij+1mOEBs8vOW0XwJNLE1Ec3ero0y4TL1B
	ktPfyMtNa5cYAK1ctlETyCVYlLaWadSJICA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gavtw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:54:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2bd6cc53fd6so4864995ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778766846; x=1779371646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UfNdfXL9HFmBgf8J4W1GiVknjJBwcKvLIPVYPC3419o=;
        b=ZUjLPSPYVNWurD4pbsZyJ1xqCF/B7fCqLwMU4pJ+tGgieVkyqulGRvzCVtGdmEURnu
         cTO+v8pfX71YMC8xrsgLgwSF9B49aP6k4kDkqkbysWHnsoVulTTlQg3rCzsgymhThn19
         1U9sWnmQ+UYEmtoGELv5jApV5kgZxANJ4p9v8MKie9J+DksxYsuQq2Icg4aahREsEOdl
         AvaMxcK/q+gXIoebpqNNRLwroBx0YDfkdDwx8t/MsuSSRk0dmclN37LG9dvXGmUvtEy1
         Ahz6zRsGzI0GD5+jVm8GjAK7EEdd5lvogwct4fqfIY0ZxW1dt/ZFta/YQIZ3rSbiMkLQ
         HsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778766846; x=1779371646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfNdfXL9HFmBgf8J4W1GiVknjJBwcKvLIPVYPC3419o=;
        b=UHGeqezqZxf2gX1tHWBAOjYm40b17jsWWFvXgga3bdhZ/eymoMZq98ozwKTPzC95iI
         505IbCFjUzSvg0RAVhR13eZUf14WWZu6UlAc2MFPxRKtilaYwkVUZDLVy2yPiql6eGlN
         qYYoOCjSaq82UvJV5ppbmLu0hSQl6lSIRiKW2fA9dZ/sI7ZprnaYhi6EpSB24/v8cMH6
         yH4yn9VoE2IBHbLuSc3RC1BAWg9nc571SFTgx60RzuAhgOauMUGgEmPaIRw2Oi5GLGPo
         MsY+B68Mf3U6DNaNEaYFRZ8iS5mg7/MEfq7u0xTRJGH2XjDIbkKKJDmqinRwsAhrQBLl
         d55g==
X-Gm-Message-State: AOJu0YxDYduYnLswthkyajIms2H8EnCIaHYXXAeVRgUki7ZzvEgXOOga
	s9txtOUd+EYTkWak3cYFHoKIw8bDWUrJ/6SQ97iBFbvhI+yPhjngu7c5WG0QZxun9h8x1hVr15N
	TXPZoChyCnjx6w8Y0patKh9rLVVScEJA9JLspEzmhxW+GBo4UtsHP9m3tgdMDcU+K4k8f
X-Gm-Gg: Acq92OFvz7tMKLpN1Yi/3PLCZ4F4plY8uTa2IafXemGmL2mcCfQ9o77mvPMY2kiWVIu
	WnaBgxLLtO1GSolTOEYKmb7icpxt6/wCpLNILI9eEwFM2D0Fk0q5NmqroRSQu8rhz7MJ1YUYqW1
	pB4m00WoNCTyDYvf9OzHHwRKfZQYdYHn3nfNrV93K0kLW53hWFP3qc7Fyj91prZooP0q0Sz7moj
	Zd46zkxZgAX+t49f7tarqRYJrb/UYO5QAWyHy+FyLEv7xIrila3WCRNa2Rlfji29jOL1l+ujHa2
	EU3fSmu3j01+qNlKpG/prglwKqbh2qnBujuceBxFUKIm8US42Bz209O/jpoF1FidXx4x9Wdmkpj
	LhpJmWNhYPFWS8qB40Thh+bZgGJ49B3RL
X-Received: by 2002:a17:903:8cd:b0:2bd:6727:d68d with SMTP id d9443c01a7336-2bd6727d7d0mr23343675ad.23.1778766845264;
        Thu, 14 May 2026 06:54:05 -0700 (PDT)
X-Received: by 2002:a17:903:8cd:b0:2bd:6727:d68d with SMTP id d9443c01a7336-2bd6727d7d0mr23343215ad.23.1778766844707;
        Thu, 14 May 2026 06:54:04 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fe67sm28572595ad.3.2026.05.14.06.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:54:04 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
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
Subject: [PATCH v6 00/16] drm/msm: Add PERFCNTR_CONFIG ioctl
Date: Thu, 14 May 2026 06:39:48 -0700
Message-ID: <20260514134052.361771-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDE0MCBTYWx0ZWRfX5dyxNY6sV+Pd
 nQjv6QBd6vFnxBEJxxVzL0ZNjawbWuvd7RESOdH439786oPdo+fjzMizC1aG5WkoLcpX8bNoPzR
 pwjYigmx4ngkhJ0HjYoufA0VZEj84LOA4Hq+rJkQtZoa4MExj+LcfOtnl4L+2zcJkJYUzJU7SIY
 F09gx8eyf1/eDsQBxa9II5VnrU6XmvxAWpGNQu/QHHAbatShzf+SctktwS41qzPNKQ9z7BiGDz6
 T2UgJmW9B5lJMNhzfzPiBDZioDmgA6sX9wG/FPG7zHZNsCHqSCAInTNwR/GEu7owPyQKqWGWQN2
 MD+ahvuC2HsQPVHSwodLpD1y0ZvKzIIADOW+DBWUT1Z1Ycsp/4GTOeokbrzAfy1BiTy7POImHQF
 lJHbNQsq5CttqNCSL2MbFPoQbo7bf6GAb0CqCEOTMmKieBliZTAXkIY+CPAhH0pFsIRb94hLr2c
 M/6jij71ghtQKuMhzhg==
X-Proofpoint-ORIG-GUID: qXX04wsEOGokrT7xYmK2RhOUoBHLPpA5
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05d3fe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=y2SdjSjt7DsdxN5ViJQA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: qXX04wsEOGokrT7xYmK2RhOUoBHLPpA5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140140
X-Rspamd-Queue-Id: 8213D542886
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,gmail.com,linux.dev,google.com,kernel.org,lists.linux.dev,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-107608-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gitlab.freedesktop.org:url,gen_header.py:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

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


