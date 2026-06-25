Return-Path: <linux-arm-msm+bounces-114569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UFMFHGh+PWq33ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:15:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 445E96C851E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 21:15:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XE7T3LJP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Wlbh+axT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114569-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114569-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 37E24300372F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 19:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE2928C5CB;
	Thu, 25 Jun 2026 19:15:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B02F2868B5
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782414945; cv=none; b=X4P39CMXNlwqAdpz6VX6f3kTpJ03Q5qZFTyfOZ40gV1OxBhy8/me5gj4Z4S17stOAaYRsaZ2Zc26vWo1JtU00qrncZgQc/dNUAkUYtychgBgRWFxpGwGv91UOFOjayGFd4nF1NdKPBMQqNvFsoCY0TesOMC5U+QUcAcv8C/1oPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782414945; c=relaxed/simple;
	bh=ZunfKDOzMcK3bandJ2wNW8/d3s1IAX92TcygAg8uGMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dh9SbThVVVm8AlNUtjIkM3lxvS4Ctqio7qKg6+Hegg2qsPQdIY8pfVh/YHBpdkwgzYGp1NgHP/nMFOc9iWvAzAvQ1iNMCFokdawI8ICXGij3zFtcXJ0XzlfqZBJ1GLK/nmjw337PPMM0p1z98Yj2vaivzpbZIv3ipQfUp/V2fC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XE7T3LJP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wlbh+axT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFe7B32192123
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uCz4HSt/dV0azaZEYvFQYeRALcLMsCkH8qo
	rWINBu7k=; b=XE7T3LJP38kcY6/dj/8vTLLV7SvfY0QX4aawwvgkaV6sQ6YQkD6
	jRDKXhxoCkabE3/nhqQRJtX4msZ1pmzz/14eRLHB218qVJbJuzlqL4egtl0l0g/0
	yFXYP6jbS/L85rxb9RVozt30z43oeS8n7w21BB9JqXfLECjc/KR+S9kEQe2aU+04
	vT6Psw/91RZT5E3wAmg4H5f/rxRQi3wokT10MBZVKtSMRffoYhuv+NsSdTgZ2gG7
	J6mJsqtiIjODbLXmP2zHBeBD35o8mOPf1aZja64uWFn67szTKK78DvdLHhnNICwx
	FSUN7I9lhYPHGxKCfHWQGVRGCHVHjgLWh4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uudkv9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 19:15:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8453e61d6f0so79894b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 12:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782414943; x=1783019743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uCz4HSt/dV0azaZEYvFQYeRALcLMsCkH8qorWINBu7k=;
        b=Wlbh+axT70XXaUlgyKhhsMrX1ZARLK9TJBkCUme3utcQ1iJafJgz17oMwQCYRelA6T
         UgqLCurPrVnuyDry+xtF79nhgDPDjMVYq2G0HQjOvbOeudXvHdBCszV6IUTWGLeV5REL
         l7Vd1OHbGx6ZKVxjucbo/Kr7UwLWCjTg3oaWAk5WWWfZx9iLjCj/Th4VZAtQpl4Yj4hP
         sSaNn/4egtk01Vsdo1fIgRlqYGe9y2GH5LQjQj/5GRBrYVaViIYgdWpUcq/MDI5ymgr+
         w5lfJNdndtD8xf00Cd3+qOhu+twZLDuy9jdUg86rip4LplgktyFD50WMszdxG0OzAwja
         l6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782414943; x=1783019743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCz4HSt/dV0azaZEYvFQYeRALcLMsCkH8qorWINBu7k=;
        b=VCon3XaCHsp4FDOpghkPY3Z31Z67NqF/qxYpJu3UV5uaUs6xse9DD6GrgpovyQcP9K
         d47AwIq/7Cyd6yvXhI+xkabSkHS1LPnbd2hCJw7Ahqi5p/nQZJCNrmvcPHflM353U71B
         NLDQS1XDwQ6eJjPmKRWgYB1Iv6KtDCYn9/Dh8WgkGiKwpzq1i85OEGb7Fj84J3z9YQyb
         QY3dT+GVr86DpA6Scrips7ldzKLIzeDxXXMccgz/qpq0IN3hh4z0YQKzwMcesJYBkqSn
         +Tu+wBRbin1JhUpRsYSt1Z4d1EVLp86T2IJ7WEI0gi0ishLiOkRkosEHXTt2wou6ZLo9
         etJg==
X-Gm-Message-State: AOJu0YxjvL10EsElBc5AqIk/Sfr7W1/gGjbbwAr5swLbRD7zlvTtJEUr
	ZhG2pe9aqwHmAmW5Y8pvSB5aVWSZtAF1Dy3mhZMzHLOWZZDuplcdblSNVk6DIqRpt/kI5ZVadwL
	W4NFLz3BoBiptUMX6dhXpWgFe2sXhdqIgbklS3tdcqTdTXWDd2lSd4aWmAoXizW7oztF4
X-Gm-Gg: AfdE7cnCDZVfeeVmJj7EKngmDw0vI20eM8DTWxP9n4E6/NYaVkBtgthNqAFbRkNJB3X
	+BBQwlMfsurzjng/h22Mzqv9g91je15WHtQSLFVLkH4eVekwn3orD4dkTfN17lNM0PgwnnQ04ol
	yQWsSCIH5nIhCkpltizFlZGc+QR+C9shCQRBLJQpQ8Q2/+Dbf/juWh8cwD8xhR1ALRwAg5xzduP
	zUdUOZsKoI1WJT4+Bn10kiN0XR05P7RrdC9i1Yxdeh4oww/67g8dTM9ibjBNIOexk+xzX4u4/lU
	d8uIqpoaHHhiu0LCdM91eTtjlt+jYma5Kvka6uCEpVe5ZBMNCWro+M64aR6PVfKKpnMAGNfCrDE
	7m1HSoE3yAMZs99nO4do1b1ch7ItJrW6+wgC2/U2dK0BtZAzpraJRtdup6Q==
X-Received: by 2002:a05:6a00:cd5:b0:842:6e1f:c8fc with SMTP id d2e1a72fcca58-845b3acc185mr4310595b3a.32.1782414943032;
        Thu, 25 Jun 2026 12:15:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:cd5:b0:842:6e1f:c8fc with SMTP id d2e1a72fcca58-845b3acc185mr4310554b3a.32.1782414942575;
        Thu, 25 Jun 2026 12:15:42 -0700 (PDT)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc65csm5185755b3a.6.2026.06.25.12.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 12:15:42 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/3] drm/msm: A couple lazy-vm fixes
Date: Thu, 25 Jun 2026 12:15:32 -0700
Message-ID: <20260625191537.47965-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX/W8M5qDW0nGs
 gfjkdViZX7hlYOs/GezveV+U3pVWqoDrz46bzNOqa/5TZ9aHDpU2MjSv281YyDQuZ3uncA0Bdw6
 FgcCcfeUGtCPHStDbC+6m+N3WTTAVCQ=
X-Proofpoint-ORIG-GUID: BFG0tgR4LX9hn3KkrAKPUjAOFOWC46zG
X-Proofpoint-GUID: BFG0tgR4LX9hn3KkrAKPUjAOFOWC46zG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE2NSBTYWx0ZWRfX8N6ImygF+AEX
 gY9t1nKe8qdFhQdUyCDfjtu6cuiTdLRipFrQ5eifuksJM16yVrCxwHW0OtZq3s/1qE8EyPHYrXG
 ZECuyOZLXOK2WUzbtAThxxhduI1Dzi6QXhITtDqVtJXmSE0xSRIxqtLRC0DoyqQB5lu4pC1Khov
 CV/tb82A8YkfaD025tqOjAkbQlQ48ReVpAmX7ZSSSDQR107kOIpED/Y9CxW3HcHSJvgS6Ayi1Wl
 O6ugXwE3SQoWTyvZK54E097+Vtb5YC4/ozbUDf7vxhgl8KGiO1TPYwJptyWkmlrwoJqsitTOkxg
 7jAnfqDmNtA00GimMgxz2PuMhL5ZnqVjnBWWjIDtcqHdjrM9N28lJGM2c8jFwvyLKyA3FGfmel7
 4kXCIKDV/gby5jUu1TQeHvhFSYxQOr8MnYq7rfr5x0+0bmZ4q1Otwmp/rqPRYmC27em2s+cOFvV
 yeo4n5ti13259d4xH1w==
X-Authority-Analysis: v=2.4 cv=HdckiCE8 c=1 sm=1 tr=0 ts=6a3d7e5f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=384pi0yy4wJ6F0PkkBwA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606250165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,linux.dev,gmail.com,kernel.org,somainline.org,poorly.run,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-114569-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:dri-devel@lists.freedesktop.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:airlied@gmail.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,m:marijn.suijten@somainline.org,m:sean@poorly.run,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 445E96C851E

The VM is created lazily to give userspace a chance to opt-in to
VM_BIND.  But Sashiko noticed a couple paths that were not handling
this properly.

Rob Clark (3):
  drm/msm: Fix barriers accessing ctx vm
  drm/msm: Validate lazy VM is created in GEM_SUBMIT
  drm/msm: Validate lazy VM in GEM_NEW

 drivers/gpu/drm/msm/msm_drv.c        | 13 +++++++------
 drivers/gpu/drm/msm/msm_gem.c        |  7 ++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c |  9 +++++----
 3 files changed, 18 insertions(+), 11 deletions(-)

-- 
2.54.0


