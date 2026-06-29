Return-Path: <linux-arm-msm+bounces-115154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kOBLG56BQmoa8wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:30:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D6C6DC104
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 16:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P2wTpEwj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Uy1vJEi6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115154-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115154-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2D52B328596F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 14:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDC340DFD8;
	Mon, 29 Jun 2026 14:17:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6393783D8
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742631; cv=none; b=SVILrD8eTjMPVddStljLBPxccyesdIMUJ9ARsq12F8UGIeHGTqDDqr9AqFza06OYVrrEC3r3DpdXi8LOlo6/Qi0aJ3GHM2H/T/9jnHmQJcxaJQNag0pTNPpvmlgryV0SF1VTiRxM9YpA2zMQ6CqYjaEXtnXjOyAA0B74ZXU1cc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742631; c=relaxed/simple;
	bh=8Q0kaRXdJPFTHOcwRknvKY1GOQFvstfIBVRZDBLDPzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lm0GHim3Bl0QYg4n4H+UWGGJGZKO5ab97LasfQe4XBXY5BmpDnQVJm/ISNylVM4Swg0g8Qh38NZfBLTM0BqGuQc0owRaoKgz0eXldtx9JMXBYxkVMMSgWD6MpmAlYCG/vRwhnqiFE2lNLhp/Y98hPdZA6aAtEjH+hAj2PTZe+i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P2wTpEwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uy1vJEi6; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT4SC2618912
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAKaqJFhKPCGDQ3R8sGusebfry2IODdhGk4iYzmSg8E=; b=P2wTpEwjhb28cgQQ
	A94F6y0ygsFRnrrKKEwX/TR5J11JGOUa/Di8nFe2oHHEPPljRSj5M4Y1s0rlE5el
	eyvdzk+zIS3MIgT2NmRydTxiz2d388rp7TjFkgzkI8ZxUxc5RV1fdMvcJcfR9AJ1
	3zv6tScADrAeANS69QW3+UhqQrjjKgCIsrB5NOPhR9mFBCwwWOMIYqyTvJ4+mm5F
	+VtythobCR5GuzQFt9TyjLhRhExrb7MkI/HRA6sj2r+Biu0wxPiHnzTWwz8RsrFJ
	+zusx7m4JgLS9a01TU3urh/vmTH2BKZLwOgr9eiREnwxPHdJnbPXrYgM8tOG2aeJ
	CB/zdg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3pdks044-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 14:17:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ae405b5eeso425540485a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 07:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742628; x=1783347428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAKaqJFhKPCGDQ3R8sGusebfry2IODdhGk4iYzmSg8E=;
        b=Uy1vJEi6ZAqGcQcjIy6JNjANAsLo+FWZXfvOZj/uEMHFNJBcR0qUjTcRE6KbPZez1n
         VhMgFGNcxjxt9fuRat7wR9T2hfb/yRVNbe0YvBT2BQGyxoDALIFiJsDmymuv3a0uUlw7
         UUx5HDxqysM34nIkDG994hcbnEknMnExq4dyNVLf9HcK1X3urtCb03z4FuqX+GZHOxL6
         JcFARpnogInWVYwr60KQZzaXvoQBgoSqrS7ehgM5/gT1AGqBHK1lzJegGawCA2x1y+Ek
         upBS2stn5u9B2nNrJriSomuC2ZIxciohWSpm/4FBr5Oq5ju5XR55mYIp92aaraG91Ptd
         YALA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742628; x=1783347428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DAKaqJFhKPCGDQ3R8sGusebfry2IODdhGk4iYzmSg8E=;
        b=HCvsz3v8TFCtX0CgeQ3NgTZMc9WuwtZTvbbWWakpoHKPblQEL4mFQys8gpFpZHTos7
         4RHdWVslztX43LCdobZdVylZEbaJjvXK4nhH4VO5XFS/ls3T1wEQIf75dkMOoNF8ywwc
         cVcDtlgnbiXU28+AdxA9/deA+RtrO5ZprHj4klyKT32M3J37nVZZRl7RVbdAFBGO+Gbg
         W9DpS83xJt3RitXSLlo3yc6CDkasi/OLSXPLXkZ+wyHNPncEcaC6ETkxG29xv5+JxaXb
         JLBaTjr+dERzfUPct2/6GOqUshRGaBFR5EuaG94ylupxLY+TVdh5MzsuC5qMWhjuqRPo
         nx7g==
X-Gm-Message-State: AOJu0YypgOARNET6HTAKj70l3amhBDyz0izUONmbCNfBQEZbVpVJ6pwX
	qavhArk37U50leECq5Jw/Bq9FqxMGFr8BSkp96YWhckVDv8032A5w5RhWvQFVShljNMHYLEiwN4
	oxvYmy8fn+/1sKEHQdr4sSghEG7qWJymdNa8/JAykY3AJ4NdrUGbPUV7YaeYxQp+OA5IS
X-Gm-Gg: AfdE7cmTfiMqYd+a/Qkuo278a/DobuNdz7jCnGBzP4U7zK7PZuVLZpNGF8N9U/ge1ax
	1wBEAWJsSRedGMjOUuny5zWZuK++qLMsEXMtknkPko8IugtKi2w6kSFx9vpslMgceDx6Nfldl3N
	Ru5dSl6o9iebqJCrCLXGQSnoMXG3Zl+Z/GBZ/jQGQ/aPA+inBqskgl3qc1Nzur/rML/kSkwR/pK
	qUZ76rO0KbWj4LZ17u2l0l/wP9q0IbFRRl/uDNvLt7IVOGqQ3mDy3tjETStAveaRb+3EDu2QYRa
	fq5hzeGqDI5NgzwrJErDG9sMfAHew797uaysBVd7/xW6cD4tcf3g/wa875t8qO3hfWkdEk8sCKu
	E2pZBgcn8MoBnbp788gGJDLkyIHx+3E24U4bB0N+m9EkvSo+h0Ncna3HOh6D3VB67mCOGQA==
X-Received: by 2002:a05:620a:a193:10b0:92b:6805:91a2 with SMTP id af79cd13be357-92b680594b8mr1017590485a.74.1782742627340;
        Mon, 29 Jun 2026 07:17:07 -0700 (PDT)
X-Received: by 2002:a05:620a:a193:10b0:92b:6805:91a2 with SMTP id af79cd13be357-92b680594b8mr1017586085a.74.1782742626646;
        Mon, 29 Jun 2026 07:17:06 -0700 (PDT)
Received: from yongmou2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9260079070bsm2143165885a.40.2026.06.29.07.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:17:06 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH RESEND v5 23/25] drm/msm/dp: add dp_mst_drm to manage DP MST encoder operations
Date: Mon, 29 Jun 2026 22:14:44 +0800
Message-ID: <20260629-msm-dp-mst-v5-23-2ed6aee1867a@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782742144; l=13405; i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id; bh=8Q0kaRXdJPFTHOcwRknvKY1GOQFvstfIBVRZDBLDPzg=; b=B4J+q46lV8xP4CI7gkndX7lKxkZ49Y7QsTY3sjZKtnNb0qF3vgBhomFvlYbKn5SzE4KJ3uAWa 8Oc+Pb1sl6cDtAs5rsVSfUTunST41qlfonu0Odcjy0/K75yKAYz/vOz
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519; pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a427e64 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9C1gJ3GtsS6FW9a-24MA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: I2bX1OX5s-Cb1lw8ZGTD4LXTIT_7Nxy3
X-Proofpoint-ORIG-GUID: I2bX1OX5s-Cb1lw8ZGTD4LXTIT_7Nxy3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX948sRAPz4xEB
 H+ZGjI2s1CoO2T/0ETRfTzstU19IGabG2BsJRndZWtwSAqphJ8JaYMG0MdJrMKDhi9iZA/83+eZ
 8HJNQZxjcKK/GNweHBeJNxH84b++XXAHolyipPbJ3YCUrJcsLdqtxAZKuYaCsVNmjFisOxWUjzz
 O2aumg72Bh0RuzvIFd9kiR4H7wRpeVY5rc/D9Fwwt4Y2LkQNrLqaswVVQdfr5u7HEUOqNWoqk74
 mGzGbWtpH0PqcOdLXOJN/V396QcEpgWpL2CsDiTck/tdRvCsWlr7tfaiYjH7wqudUOiAtyVhzVj
 HXvl1x1n/HlUwv17nXKi/IbVloOdOob3YWyxq+HXrim5NkI3fKNUk8sywdAE1lALUEIdXWcLxjq
 JgnXCALoNhDtK18y2QG841/a1GeNuiyA0el5v/VQ03ocyvNNZQ0AQJX7RyFaSiuulR719liQVOa
 u9dASdyHlu64NoOIOQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOCBTYWx0ZWRfX5jzsF5pItYCd
 nLbHVijeRI0V4OQWwPajhMdpHAg3hxTDoQKk5Q3QDqro4Nap20fsu4CFCZZuxEPlwRekxOA07Oo
 9WCMh8F2XG3Oj1mOm34Qzp6ruFgI0HU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115154-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 06D6C6DC104

drm/msm/dp: introduce dp_mst_drm for MST stream management

Add a dp_mst_drm layer to manage DP MST streams with a clear ownership
model between encoder, panel and connector.

Each MST stream is represented by a dedicated drm_encoder. At modeset
initialization time, one (encoder, dp_panel) pair is created per
stream_id and remains fixed for the lifetime of the driver. The
dp_panel thus carries a stable stream context, including stream_id
and pixel mapping.

MST connectors are created and destroyed dynamically on hotplug and
are attached to a dp_panel through atomic routing. During an atomic
commit, connectors are associated with encoders via
atomic_best_encoder(), forming a temporary binding for the duration
of the commit.

Encoder helper callbacks drive the MST stream lifecycle, including
timeslot allocation, link enable/disable and payload programming.

A per-MST-instance lock serializes operations on shared link state
across multiple streams.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c |   6 +
 drivers/gpu/drm/msm/dp/dp_display.c     |   9 ++
 drivers/gpu/drm/msm/dp/dp_display.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_mst_drm.c     | 245 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_drv.h           |   7 +
 5 files changed, 269 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b32ecd5b0777..ac5dc844fead 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -696,6 +696,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 					DPU_ERROR("encoder init failed for dp mst display\n");
 					return PTR_ERR(encoder);
 				}
+
+				rc = msm_dp_mst_attach_encoder(priv->kms->dp[i], encoder);
+				if (rc) {
+					DPU_ERROR("dp_mst attach_encoder failed, rc = %d\n", rc);
+					return rc;
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fc9c1e3e57ab..6eac390af2e0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -601,6 +601,15 @@ struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 	return dp_panel;
 }
 
+void msm_dp_display_set_link_info(struct msm_dp *msm_dp_display,
+				  struct msm_dp_link_info *dst)
+{
+	struct msm_dp_display_private *dp =
+		container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	memcpy(dst, &dp->panel->link_info, sizeof(*dst));
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index a185819ec57e..fb6bdd372b52 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -63,4 +63,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
 
 struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *msm_dp_display,
 					      enum msm_dp_stream_id stream_id);
+void msm_dp_display_set_link_info(struct msm_dp *msm_dp_display,
+				  struct msm_dp_link_info *dst);
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 78b8dffe111b..6a77fdef85e9 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -4,18 +4,259 @@
  */
 
 #include <drm/drm_edid.h>
+#include <drm/drm_fixed.h>
+#include <drm/drm_atomic_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
 
 #include "dp_mst_drm.h"
 #include "dp_panel.h"
+#include "dpu_encoder.h"
+
+#define to_dp_mst_connector(x) \
+		container_of((x), struct msm_dp_mst_connector, connector)
+
+struct msm_dp_mst_encoder {
+	struct drm_encoder *enc;
+	int stream_id;
+	struct msm_dp_panel *dp_panel;
+};
+
+struct msm_dp_mst_connector {
+	struct drm_connector connector;
+	struct drm_dp_mst_port *mst_port;
+	struct msm_dp_mst *dp_mst;
+};
+
 
 struct msm_dp_mst {
 	struct drm_dp_mst_topology_mgr mst_mgr;
+	struct msm_dp_mst_encoder mst_encoders[DP_STREAM_MAX];
 	struct msm_dp *msm_dp;
 	struct drm_dp_aux *dp_aux;
 	u32 max_streams;
+	struct mutex mst_lock;
+	struct msm_dp_link_info link_info;
 };
 
+static struct msm_dp_panel *msm_dp_mst_panel_from_encoder(struct msm_dp_mst *mst,
+							  struct drm_encoder *enc)
+{
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (mst->mst_encoders[i].enc == enc)
+			return mst->mst_encoders[i].dp_panel;
+	}
+	return NULL;
+}
+
+static void msm_dp_mst_update_timeslots(struct msm_dp_mst *mst,
+					struct msm_dp_panel *panel,
+					struct drm_dp_mst_atomic_payload *payload)
+{
+	if (payload->vc_start_slot < 0)
+		msm_dp_display_set_stream_info(mst->msm_dp, panel, 1, 0, 0);
+	else
+		msm_dp_display_set_stream_info(mst->msm_dp, panel,
+					       payload->vc_start_slot,
+					       payload->time_slots, payload->pbn);
+
+	drm_dbg_kms(mst->msm_dp->drm_dev,
+		    "[MST] stream:%u timeslots vc_start:%d slots:%d pbn:%d\n",
+		    panel->stream_id, payload->vc_start_slot,
+		    payload->time_slots, payload->pbn);
+}
+
+static void msm_dp_mst_stream_enable(struct drm_encoder *encoder,
+				     struct drm_atomic_commit *state)
+{
+	struct drm_connector *connector =
+		drm_atomic_get_new_connector_for_encoder(state, encoder);
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp *dp_display = mst->msm_dp;
+	struct msm_dp_panel *panel = msm_dp_mst_panel_from_encoder(mst, encoder);
+	struct drm_dp_mst_port *port = mst_conn->mst_port;
+	struct drm_dp_mst_topology_state *mst_state =
+		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
+	struct drm_dp_mst_atomic_payload *payload =
+		drm_atomic_get_mst_payload_state(mst_state, port);
+	int rc;
+
+	panel->connector = connector;
+
+	guard(mutex)(&mst->mst_lock);
+
+	rc = msm_dp_display_set_mode_helper(dp_display, state, encoder, panel);
+	if (rc) {
+		drm_err(dp_display->drm_dev,
+			"[MST] stream:%u set_mode failed rc=%d\n", panel->stream_id, rc);
+		goto out;
+	}
+
+	rc = msm_dp_display_prepare_link(dp_display);
+	if (rc) {
+		drm_err(dp_display->drm_dev,
+			"[MST] stream:%u prepare_link failed rc=%d\n", panel->stream_id, rc);
+		msm_dp_display_unprepare(dp_display);
+		goto out;
+	}
+
+	drm_dp_mst_update_slots(mst_state, DP_CAP_ANSI_8B10B);
+
+	rc = drm_dp_add_payload_part1(&mst->mst_mgr, mst_state, payload);
+	if (rc) {
+		drm_err(dp_display->drm_dev,
+			"[MST] payload allocation failure for conn:%d\n", connector->base.id);
+		msm_dp_display_unprepare(dp_display);
+		goto out;
+	}
+
+	msm_dp_mst_update_timeslots(mst, panel, payload);
+
+	msm_dp_display_enable_helper(dp_display, panel);
+
+	drm_dp_check_act_status(&mst->mst_mgr);
+
+	drm_dp_add_payload_part2(&mst->mst_mgr, payload);
+
+out:
+	drm_connector_get(connector);
+}
+
+static void msm_dp_mst_stream_disable(struct drm_encoder *encoder,
+				      struct drm_atomic_commit *state)
+{
+	struct drm_connector *connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp_panel *panel = msm_dp_mst_panel_from_encoder(mst, encoder);
+	struct drm_dp_mst_topology_state *old_mst_state =
+		drm_atomic_get_old_mst_topology_state(state, &mst->mst_mgr);
+	struct drm_dp_mst_topology_state *new_mst_state =
+		drm_atomic_get_new_mst_topology_state(state, &mst->mst_mgr);
+	struct drm_dp_mst_atomic_payload *old_payload =
+		drm_atomic_get_mst_payload_state(old_mst_state, mst_conn->mst_port);
+	struct drm_dp_mst_atomic_payload *new_payload =
+		drm_atomic_get_mst_payload_state(new_mst_state, mst_conn->mst_port);
+
+	guard(mutex)(&mst->mst_lock);
+
+	drm_dp_remove_payload_part1(&mst->mst_mgr, new_mst_state, new_payload);
+
+	drm_dp_remove_payload_part2(&mst->mst_mgr, new_mst_state, old_payload, new_payload);
+
+	msm_dp_mst_update_timeslots(mst, panel, new_payload);
+
+	msm_dp_display_disable_helper(mst->msm_dp, panel);
+
+	drm_dp_check_act_status(&mst->mst_mgr);
+}
+
+static void msm_dp_mst_stream_post_disable(struct drm_encoder *encoder,
+					   struct drm_atomic_commit *state)
+{
+	struct drm_connector *connector = drm_atomic_get_old_connector_for_encoder(state, encoder);
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct msm_dp_panel *panel = msm_dp_mst_panel_from_encoder(mst, encoder);
+
+	guard(mutex)(&mst->mst_lock);
+
+	msm_dp_display_atomic_post_disable_helper(mst->msm_dp, panel);
+
+	if (!mst->msm_dp->mst_active)
+		msm_dp_display_unprepare(mst->msm_dp);
+
+	panel->connector = NULL;
+
+	drm_connector_put(connector);
+}
+
+static int msm_dp_mst_enc_atomic_check(struct drm_encoder *enc,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state)
+{
+	struct msm_dp_mst_connector *mst_conn = to_dp_mst_connector(conn_state->connector);
+	struct msm_dp_mst *mst = mst_conn->dp_mst;
+	struct drm_dp_mst_topology_state *mst_state;
+	int bpp, pbn, slots;
+
+	if (!conn_state->crtc)
+		return 0;
+
+	if (!drm_atomic_crtc_needs_modeset(crtc_state) || !crtc_state->active)
+		return 0;
+
+	bpp = (conn_state->connector->display_info.bpc * 3) ?: 24; /* fallback: assume 8bpc */
+	pbn = drm_dp_calc_pbn_mode(crtc_state->mode.clock, bpp << 4);
+
+	mst_state = drm_atomic_get_mst_topology_state(crtc_state->state, &mst->mst_mgr);
+	if (IS_ERR(mst_state))
+		return PTR_ERR(mst_state);
+
+	if (!dfixed_trunc(mst_state->pbn_div)) {
+		mst_state->pbn_div =
+			drm_dp_get_vc_payload_bw(mst->link_info.rate,
+						 mst->link_info.num_lanes);
+	}
+
+	slots = drm_dp_atomic_find_time_slots(crtc_state->state, &mst->mst_mgr,
+					      mst_conn->mst_port, pbn);
+	if (slots < 0)
+		return slots;
+
+	return 0;
+}
+
+static void msm_dp_mst_enc_atomic_enable(struct drm_encoder *enc,
+					 struct drm_atomic_commit *state)
+{
+	msm_dp_mst_stream_enable(enc, state);
+	dpu_encoder_phys_enable(enc, state);
+}
+
+static void msm_dp_mst_enc_atomic_disable(struct drm_encoder *enc,
+					  struct drm_atomic_commit *state)
+{
+	msm_dp_mst_stream_disable(enc, state);
+	dpu_encoder_phys_disable(enc, state);
+	msm_dp_mst_stream_post_disable(enc, state);
+}
+
+static const struct drm_encoder_helper_funcs msm_dp_mst_encoder_helper_funcs = {
+	.atomic_check    = msm_dp_mst_enc_atomic_check,
+	.atomic_mode_set = dpu_encoder_atomic_mode_set,
+	.atomic_enable   = msm_dp_mst_enc_atomic_enable,
+	.atomic_disable  = msm_dp_mst_enc_atomic_disable,
+};
+
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+	struct msm_dp_panel *dp_panel;
+	int i;
+
+	for (i = 0; i < mst->max_streams; i++) {
+		if (!mst->mst_encoders[i].enc)
+			break;
+	}
+
+	dp_panel = msm_dp_display_get_panel(dp_display, i);
+	if (!dp_panel) {
+		drm_err(dp_display->drm_dev,
+			"[MST] failed to allocate panel for stream %d\n", i);
+		return -ENOMEM;
+	}
+
+	mst->mst_encoders[i].enc = encoder;
+	mst->mst_encoders[i].stream_id = i;
+	mst->mst_encoders[i].dp_panel = dp_panel;
+	drm_encoder_helper_add(encoder, &msm_dp_mst_encoder_helper_funcs);
+
+	return 0;
+}
+
 int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 {
 	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
@@ -27,6 +268,9 @@ int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
 			"[MST] failed to set topology mgr state to %d rc:%d\n", state, rc);
 	}
 
+	if (state)
+		msm_dp_display_set_link_info(dp_display, &mst->link_info);
+
 	drm_dbg_kms(dp_display->drm_dev, "[MST] set_mgr_state state:%d\n", state);
 	return rc;
 }
@@ -55,6 +299,7 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, struct drm_dp_au
 		return ret;
 	}
 
+	mutex_init(&mst->mst_lock);
 	dp_display->msm_dp_mst = mst;
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index f71200a790f3..854dd08eede2 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -358,6 +358,8 @@ bool msm_dp_needs_periph_flush(const struct msm_dp *dp_display,
 bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_register(struct msm_dp *dp_display);
+int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, struct drm_encoder *encoder);
+
 #else
 static inline int __init msm_dp_register(void)
 {
@@ -384,6 +386,11 @@ static inline int msm_dp_mst_register(struct msm_dp *dp_display)
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_attach_encoder(struct msm_dp *dp_display, struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.43.0


