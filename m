Return-Path: <linux-arm-msm+bounces-98037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CBAtJMOGuGndfQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:40:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D322A19F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 23:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAE6D3016924
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 22:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A56372EE4;
	Mon, 16 Mar 2026 22:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c4lEHNXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ExzN9yL4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B29A373C1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773700744; cv=none; b=VCTNh6g3KWng03WOc1gu0gwCt8sJQuAJMH/EX8XkNHaxHNg/tb3l0frObr3p3cWKZBN/zRWkyYwlH2v0DO9CRT+0vSlxFosvILK0g49VZ4c7WKt9rU3SnBu6dwh0PM3xUUXlbB0P1IArYQkEvX+1mjGFwa3sK52gpl6dbPrcS1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773700744; c=relaxed/simple;
	bh=BwdX5YBGKqxs++fBPlS4wWWg5PtwQeRiKD/Ivgn44AM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jxtgMxPzbO+dSvyknq9acFgU9D7/yeI5LkS0kNbdG3cWShrVaOVR1xGPtXNJHp6G3N0H0Z19nT/v3A6/jjTfGccuUJ9SzvENbzJCoYe7ULhGv2y+SZ4XoMnQZf9KOEp+Cpm45PqpUrVdrdqs773OWRtbA21Ob+BmP3MhFilDTfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c4lEHNXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ExzN9yL4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GGMvb13101974
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4IbsLGrI1KKIjHx8jj+lvuMaQvi9KqTTUAq
	216gBs4E=; b=c4lEHNXzOMMt6Tsnrcv8LX2gDNa01bQ9WGJWzrcpWAwL8MrFHat
	8HAObURz4QPkv7sE2VBirGtBLz83IWik32HUQtRnH/3uaGCyU0zUp69xrSK4Hkxj
	UQTS2nScvde5/iCi+5Gsj/TBRbSkUvlgGduDKwfBATFAweadu+REEmu4whhOL6N6
	UVpNdKMqAWf91/11Wf4SWMTAVefTmoy7rWzNFluNky92zxhcIl+MeNbb/Eag2ARE
	kAaSFtA2OKZGOf4kC4XQryTCBSRN3xyXTLS83XKGECezw85d/nvVxjG8rzadSDcu
	ydAuS0CmTWYki9/waK7WBgv608mXq4yfipQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxnb796ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 22:39:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35a0998a441so32338889a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 15:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773700741; x=1774305541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4IbsLGrI1KKIjHx8jj+lvuMaQvi9KqTTUAq216gBs4E=;
        b=ExzN9yL4uZ9a2SnZLTzbYApmg0ZBOKWUPPwU1j99kyUpfiGerGQ+CYgmdEkI9I0aCg
         W5xvFOQ4jEhSI406cg/cPmyMbmcO1hg4MQsTLb9wzFG6VEfL+q+WIMFe9v2Nn+1kdSga
         FUchrKnPZcxQN91RtbpKfBLYE6oKrI48W4QVS7hMKKymhwOBQN496xTaouLOUSm3zNdM
         CnkkDk1ea7cbsXqQekasz/mh8Rj2UNcvwn9de02AWL/f/X8YdCrm3LsP84MQJM038iuz
         h6fX/d9pXP6V/C5uupkYAAljyC6fJryVaJ7Zx6gHHDyAjdx3jfWCo3M7p1dHcvuuDbT3
         yxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700741; x=1774305541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IbsLGrI1KKIjHx8jj+lvuMaQvi9KqTTUAq216gBs4E=;
        b=HI55ep42/TVNe2ocWnsmTdEwJzyRhPx2yfg9IZiq5sGguEiuwrwBvw4U+VyWfgMvly
         CbiwXHWgn7syOXWS+mUlBi+6pcDvX/vq8kvLkztrE7HW+YAqJ8PIZC2SakgxcC1gy0/Q
         iu49jP+rBmgtEPn4ctGZJzyyJL5G100/g2ujwgjcTw9yQYTSnbwsdHZI+uBR0b8/beZM
         LUgVAYfwqd4gCKwGwJ1Y7x6jw0NOZzo7q2isze7qZnt8tCE2ZghyUhFz7GjIS9u3c4L1
         IoZ1W+OKwOiP9Aqy4k46tI2TvPZ1RRYN7MJSYMNucIho4MmNNSnz6yc8TQaCR/H+AGMn
         WYHw==
X-Gm-Message-State: AOJu0YxfS0apWzQv6Hlx8GyMjHjH6nymzl0qQlmx8IOf/J23CXiJ2Qlz
	fB6Cacn0SI+95P2xA/oiuLjlyIhvqAZX002bq5EdJhqIylqjDyoPcPVo/zM4nasyeyxwozKAl26
	pxMQdNEiG//1tNiRDiR2ucUe5luZlLh+BtA8zig08EEKpklm/Frozd7BbzCHOsZV568SS
X-Gm-Gg: ATEYQzy5U1kA7gurW34MYHU9zRYSx5ez4MLwLmVC4vm30bVKlJRK16LL7UUrPDxezQA
	FmRM8MC0exQN324cXvjofmQXeJ4YDN50Y0dOb9zA1zTUDVMhWu33FjtAVLaqmsFBODkR6n33zMX
	PpmYwl8cx17CDD1CF3xSylExQjkJGdrS/xng6NvTCH6LyhnDpJ1TRa4EX48spzJlA8IH+dIeL3y
	ag8rS77VbOoU01V9n5+xTtJcwJNq2ObK1rf1Ds/PjDY7ZeXDUaAh/HLs0m2SBi6H16rzKxCjZqC
	rUYlizJEWEdTnAQ6MkdUL28nnHjlQOx6du2iAciysN2fPfbv0b2o3rGsK2Tp9N466VoZ4AV+uJd
	VsuGdou6NBKyFI4tIM1ab5XUiFoE0/njG
X-Received: by 2002:a05:6a21:398d:b0:398:c4e6:fec1 with SMTP id adf61e73a8af0-398eca9c789mr13168481637.23.1773700740997;
        Mon, 16 Mar 2026 15:39:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:398d:b0:398:c4e6:fec1 with SMTP id adf61e73a8af0-398eca9c789mr13168449637.23.1773700740490;
        Mon, 16 Mar 2026 15:39:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072612e2sm18573605b3a.21.2026.03.16.15.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:39:00 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
        Simona Vetter <simona@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [RFC 0/2] drm: Add sysrq handler to kill GPU
Date: Mon, 16 Mar 2026 15:38:48 -0700
Message-ID: <20260316223855.711574-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE4NyBTYWx0ZWRfX6iKrqPBLV8e3
 nEWokzhPRC0ambdzHc20ZEBP1oyS1JESpjOrNjFd6ycRr/1Iia2s9p2ft9SubT9nalbuimjxXCV
 WOTkv7jrSOu7hi9SsFgv2eepbFt2u09h/S5R7IUwPfM6nTSddj9qqVZ5vdOO/oSGAqzRy87y0OI
 fF1GM71iZDj2FGcyECwUDiMK9L+ouyf7VJbkav2TqQXLN5iqQVimeQeLe19u53lZ8eWssTIs4Kr
 HEY0GNq7PQ39glYkwBGc0c6S/1HVeynj27qANGaDjri1xZZciudgJQoVT07qmnXFsocajBNT5km
 W5JW70r0q6xn++Ym5X159JWWn1sqmb2j5XOEWw+J4HwCLrNKX+gJB6bouTI2KjsaHOKpjURFTWa
 LJEDV10xqUYXM1M5i9m8LjI9n2oJCCuaGg9v+BdIbJj6iMeLC/QVv4DZnqqbpforUkTQYC5bj+m
 t6cE0tXIAAuN6PEfbEg==
X-Authority-Analysis: v=2.4 cv=D7pK6/Rj c=1 sm=1 tr=0 ts=69b88685 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=zUJ0Y04Mm8-B5XzwJDsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: z2iNHJXFQbvg5fWZOJ0a93bjB4CKelEO
X-Proofpoint-GUID: z2iNHJXFQbvg5fWZOJ0a93bjB4CKelEO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_06,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160187
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,gmail.com,kernel.org,linux.intel.com,somainline.org,poorly.run,ffwll.ch,suse.de];
	TAGGED_FROM(0.00)[bounces-98037-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7D322A19F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Depending on contraints around preemption (ie. on what boundaries can
the GPU preempt) and priority of other processes using the GPU, the
compositor can get starved behind a long-running job.

This can be handled by a hangcheck timer that kills jobs that run too
long, but then there is a conflict between legit long running jobs
(opencl) and UI responsiveness.

This series adds a new sysrq key handler (SysRq-G because SysRq-g was
already taken) that kills the current job running on the GPU.  So a
longer hangcheck timer could be used but the user could still reclaim
their "hung" desktop by using SysRq-G to kill the background GPU job.

Sending this out as RFC to see what others think of the idea.  Possibly
the driver implementation should check how long the job has been
running to make sure it is only killing a long running job.  Possibly
we should kill the process behind the long running job, or at least
mark the context as unusable to prevent it from spamming more long
running jobs.  Etc.

Rob Clark (2):
  drm: Add sysrq key to kill current job on GPU
  drm/msm: Add sysrq_kill handler

 drivers/gpu/drm/Makefile        |  1 +
 drivers/gpu/drm/drm_dev_sysrq.c | 67 +++++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c       |  3 ++
 drivers/gpu/drm/drm_internal.h  | 11 ++++++
 drivers/gpu/drm/msm/msm_drv.c   | 12 ++++++
 drivers/gpu/drm/msm/msm_gpu.c   | 18 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h   |  1 +
 include/drm/drm_device.h        |  8 ++++
 include/drm/drm_drv.h           |  7 ++++
 9 files changed, 128 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_dev_sysrq.c

-- 
2.53.0


