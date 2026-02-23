Return-Path: <linux-arm-msm+bounces-93786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7pMmDf6nnGk4JwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93786-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:18:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2117C3E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 20:18:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B881318E7E9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 19:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61B7336F43A;
	Mon, 23 Feb 2026 19:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VaMxXBFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="el0QxgYF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9287436C58F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771873870; cv=none; b=kjOGVGCRfSykdAXEAcmOB/GYvQH38HqiCqTaEfY15nZ/c+2HVg/Pjux+JPbQZJLli9ZJGu8tsdSgvc4qvob5NE8NCP9rds90vIp3UmUUfiXB080FSZoYO6i7n76oEmxegQfsAvxByFZSDK7gklHoPijrnyfnMDyheOfwZDQkNKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771873870; c=relaxed/simple;
	bh=LP9i9ig3VGFbL0Tg+t9lMqkV/Cy5BCef5+MBvLQoGoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNprE2ez0j4bpaTWWOmWJ08xd/p6CZAxDr5hL2IDl+x+FRJTieMFHSzhXi1P+CYdA/cUG8y6i1oUS5y51RVH2HJOCnH5o6K62xO4FUoNW0ZPeypLCaxIZZXh8QZE0u9Y/m+QYG9pZ+cVrZYYd9sX+5h1AGXxg8m6OK/bbu7BP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VaMxXBFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=el0QxgYF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NGRJAu1640611
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyVWr6Qau3rhDJHT+sQwBpb2oQCOb8Vk2I9d75FaZu0=; b=VaMxXBFG93TIrk2d
	Dg8CUSu3Ouswh19mxirbiUlrO8SFCYUxvRL7lS6ly1ked5N697QC1S3KfBTw6VwK
	BgsPr5xGTzLipAkUp81HBcwJxWmEd3VoPF1u/2wv4GBugO3ptAj2gauAX+sE/BRt
	+Q3hqtdR5EhCQfR3RhhysO6QVFyFC0TSvcYWI+BobF/TpsxGGlhNagOYK26wjc3G
	+EfadqkG35CbLLykuHWSXMUep72l24B9l8XICsxgQRMdVB4kcbva6bt8dGSeccVO
	tcSpNSD4w/YtyI9hr08PmbQmthPtKHqcQyCFyw0fv1R9+jV+sMQSpGdkWXdjyL/H
	q4xE/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgte8rhhm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 19:11:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a90510a6d1so41155015ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 11:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771873867; x=1772478667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hyVWr6Qau3rhDJHT+sQwBpb2oQCOb8Vk2I9d75FaZu0=;
        b=el0QxgYF773Ml0VCZBINL8oY5k173IadOs9ZpLrXBXTntfyRPXQVrHd4rz0k0IXlXU
         zdkOJznRMN9i9Ca5qtE7DssyPouQ6u2fdygs7GlddGUcMp7uW/afuidK7AgwjbsG5xeX
         5HRB+Ckc3Y06ah6SV8fNwvBdh05cTnXkZirU50GjkcgnYGG1dsBgtiqUDMq8BYNRTRad
         6vNMlhtVb3LGSO8wVEbgK9IJlvAhE7jUnZ34RqPY6T/L+5EIA3LAEQEnrutZaFbV06BK
         SLSmx/cbHrqwZHT3059F38KvtsNkgVYoFy1cd5fCVFDQY9SAspiqsrrIRvfRitJSehxy
         8RWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771873867; x=1772478667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyVWr6Qau3rhDJHT+sQwBpb2oQCOb8Vk2I9d75FaZu0=;
        b=ZJrXagvN1OuZJxF+RH8yhMdptQWAAStDcCun8VyFwsgk2tc+Vhf3P8jzH0f7/leEwo
         NqvU5ZVIUNzHjiuEDCzYAXgEvwqGwgQ2uv0goOwyRUYUTDPKM1MPjpJQNrXL2McutcKN
         dT9eIHj2dWeIkqUPANxgAlydDnTydA6QlU3JXMSpD+gzHu7JawHKxLp+osQvVvEn1ybZ
         tbNRdZksGbV6anWPfdv/3JAJA4AyfFb6Nl2SUYmugUweGS1+5KbgsvsAEnNFXZ/qhVJn
         wnxbwjrGgrsVD05mt8H+uArCpIRQoBWkjnyktYa94GmNwpaDB/IMRgbbf7i0/Z4KUEhS
         uJDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMbVXZYCbQYwuE+1qhFNHa9WDeV3pd3za6dn8JnQri3uXpbSPnpbalA+sXULUz2a4VyCUwxAKlacO76AWd@vger.kernel.org
X-Gm-Message-State: AOJu0YyA8KLzqRjyuNxn8/1lRrgQWvqGTPxUDWFNVuDBPjmMVecBa+Wc
	jKaPLdGvIQzWFInpbdCaZMWTo1+3wAfiVEuaO/RR8T2kn6zlJDxTtgpZDZDUaNykMTqNjKPDqEq
	Yf7vo+1tfaLMbGKgTQD89vCR5t1Qw1CXZlmpmZsTY6bz+7cv1wAyQdVWp68RoFknQ7jMf
X-Gm-Gg: ATEYQzxBL4u9Ipy8DmlWBpWKuledH1Dc8pZfHE5eNRhiQKuTurrOxsLGgoKYQOcvlAc
	uF2BdI6C2sHwhrWPlTxQrOCa2QA8pOVg3F11qSN+f1Wz6eEphrqw6PpOCohtq8Kbu8vixTeKXvE
	2a5uMgBMxd3o5c5oNRI8MQc6UaaCm9SnjZMSFlc9yP/g4Duippm13N4jmUWcMy2XTzFeNZlo1bC
	31D+FZd0o1YfmIm2qKkv1U8D7fmFi2KP3DeEa6tueqw+yQu4mEr9rLg2S545Ut3l2MwSU/crWNs
	CNghRD+gJF1H8PSkq+xU1j5PkrkgrSQOzHskIY9wjMPjKAlefMQPk7qpxY2CpWDmt8lDn6Tp/YN
	En4qAMrqfcqtQWJCQsCWtYctDdoMjofoIHozq7e/cd+GnsmZrBHAK/g==
X-Received: by 2002:a17:903:388d:b0:2a9:4c2:e50 with SMTP id d9443c01a7336-2ad742841f4mr98514185ad.14.1771873866473;
        Mon, 23 Feb 2026 11:11:06 -0800 (PST)
X-Received: by 2002:a17:903:388d:b0:2a9:4c2:e50 with SMTP id d9443c01a7336-2ad742841f4mr98513765ad.14.1771873865955;
        Mon, 23 Feb 2026 11:11:05 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74e34e18sm83501505ad.10.2026.02.23.11.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:11:05 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Tue, 24 Feb 2026 00:39:08 +0530
Subject: [PATCH RFC 14/18] accel/qda: Add FastRPC dynamic invocation
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260224-qda-firstpost-v1-14-fe46a9c1a046@oss.qualcomm.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
In-Reply-To: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771873753; l=8065;
 i=ekansh.gupta@oss.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=LP9i9ig3VGFbL0Tg+t9lMqkV/Cy5BCef5+MBvLQoGoo=;
 b=MMaaD/3fgwctLex7y+a1+TjziqZMaPbxIFndYu5wqWZj3DdR9N3avZnwlgQUVmh/wq/G1Mj4F
 THPXli9Fs4RASCdG3h3jMVTjKpg2a6ExM41ymAu16lbjaw1zWtuF1Ij
X-Developer-Key: i=ekansh.gupta@oss.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: DeZ7Ky-5HRtw5bb5581--hrjX5zdz9WP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDE2NiBTYWx0ZWRfXyPxUjQCfn/5Z
 k9jtib/yR1PMdqJmwrii7hzjho2EeDR+d6n0xERge3zE98kNcoPtcNjopiNGFglF280qf4c6xFT
 iZ74OVMhiwt1818ymUqYz6u/dzkKm0BZR9Cj/zPG6B01CrrPMHPqP5sHMr/VeP51KMh1VAY+rr4
 9oO/IjdaxjBJmYrQBfvSdQpqrT52a+MVmkKvsb7zhy0xefRBqsLOJqnTeMOpDYw/g3k4Nxavh0i
 Y1O+wVfsunyCmxTqD9EqVGDiezuZYuvchyEWlG5jQdqJfgcw6NG68g/oIpR0Gk5NEHr6hJiY9Nz
 69a/cxTqBrFONlR6BHDHVWT6+tH4Hr3BvEk5WDnrvx5KHREAXSOWGTs71Q95FVnMy0UJjeHIxAe
 +0b1iROOsvGMDVM2k2XuL5iuGOYfvE6rp/iPw7v4lB/PTQIVb6XCjHu3f2AYMHBMtfeEK+BChxp
 HF/mCb+ilM86sYqmR9Q==
X-Proofpoint-GUID: DeZ7Ky-5HRtw5bb5581--hrjX5zdz9WP
X-Authority-Analysis: v=2.4 cv=WqQm8Nfv c=1 sm=1 tr=0 ts=699ca64b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=e3qgzkqCo8F0wNjWc_sA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_04,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93786-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,inv.sc:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B3E2117C3E8
X-Rspamd-Action: no action

Extend the QDA FastRPC implementation to support dynamic remote
procedure calls from userspace. A new DRM_QDA_INVOKE ioctl is added,
which accepts a qda_invoke_args structure containing a remote handle,
FastRPC scalars value and a pointer to an array of fastrpc_invoke_args
describing the individual arguments. The driver copies the scalar and
argument array into a fastrpc_invoke_context and reuses the existing
buffer overlap and packing logic to build a GEM-backed message buffer
for transport.

The FastRPC core gains a FASTRPC_RMID_INVOKE_DYNAMIC method type and a
fastrpc_prepare_args_invoke() helper that reads the qda_invoke_args
header and argument descriptors from user or kernel memory using a
copy_from_user_or_kernel() helper. The generic fastrpc_prepare_args()
path is updated to handle the dynamic method alongside the existing
INIT_ATTACH and INIT_RELEASE control calls, deriving the number of
buffers and scalars from the provided FastRPC scalars encoding.

On the transport side qda_ioctl_invoke() simply forwards the request
to fastrpc_invoke() with the dynamic method id, allowing the RPMsg
transport and context lookup to treat dynamic calls in the same way as
the existing control methods. This patch establishes the basic FastRPC
invoke mechanism on top of the QDA GEM and RPMsg infrastructure so
that future patches can wire up more complex DSP APIs.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 48 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h |  1 +
 drivers/accel/qda/qda_ioctl.c   |  5 +++++
 drivers/accel/qda/qda_ioctl.h   | 13 +++++++++++
 include/uapi/drm/qda_accel.h    | 21 ++++++++++++++++++
 6 files changed, 89 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 3034ea660924..f94f780ea50a 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -162,6 +162,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_GEM_CREATE, qda_ioctl_gem_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_GEM_MMAP_OFFSET, qda_ioctl_gem_mmap_offset, 0),
 	DRM_IOCTL_DEF_DRV(QDA_INIT_ATTACH, qda_ioctl_attach, 0),
+	DRM_IOCTL_DEF_DRV(QDA_INVOKE, qda_ioctl_invoke, 0),
 };
 
 static struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index eda7c90070ee..a48b255ffb1b 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -12,6 +12,16 @@
 #include "qda_gem.h"
 #include "qda_memory_manager.h"
 
+static int copy_from_user_or_kernel(void *dst, const void __user *src, size_t size)
+{
+	if ((unsigned long)src >= PAGE_OFFSET) {
+		memcpy(dst, src, size);
+		return 0;
+	} else {
+		return copy_from_user(dst, src, size) ? -EFAULT : 0;
+	}
+}
+
 static int copy_to_user_or_kernel(void __user *dst, const void *src, size_t size)
 {
 	if ((unsigned long)dst >= PAGE_OFFSET) {
@@ -509,6 +519,41 @@ static int fastrpc_prepare_args_release_process(struct fastrpc_invoke_context *c
 	return 0;
 }
 
+static int fastrpc_prepare_args_invoke(struct fastrpc_invoke_context *ctx, char __user *argp)
+{
+	struct fastrpc_invoke_args *args = NULL;
+	struct qda_invoke_args inv;
+	int err = 0;
+	int nscalars;
+
+	if (!argp)
+		return -EINVAL;
+
+	err = copy_from_user_or_kernel(&inv, argp, sizeof(inv));
+	if (err)
+		return err;
+
+	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
+
+	if (nscalars) {
+		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
+		if (!args)
+			return -ENOMEM;
+
+		err = copy_from_user_or_kernel(args, (const void __user *)(uintptr_t)inv.args,
+					       nscalars * sizeof(*args));
+		if (err) {
+			kfree(args);
+			return err;
+		}
+	}
+	ctx->sc = inv.sc;
+	ctx->args = args;
+	ctx->handle = inv.handle;
+
+	return 0;
+}
+
 int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 {
 	int err;
@@ -521,6 +566,9 @@ int fastrpc_prepare_args(struct fastrpc_invoke_context *ctx, char __user *argp)
 	case FASTRPC_RMID_INIT_RELEASE:
 		err = fastrpc_prepare_args_release_process(ctx);
 		break;
+	case FASTRPC_RMID_INVOKE_DYNAMIC:
+		err = fastrpc_prepare_args_invoke(ctx, argp);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 744421382079..bcadf9437a36 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -237,6 +237,7 @@ struct fastrpc_invoke_context {
 /* Remote Method ID table - identifies initialization and control operations */
 #define FASTRPC_RMID_INIT_ATTACH	0	/* Attach to DSP session */
 #define FASTRPC_RMID_INIT_RELEASE	1	/* Release DSP session */
+#define FASTRPC_RMID_INVOKE_DYNAMIC	0xFFFFFFFF	/* Dynamic method invocation */
 
 /* Common handle for initialization operations */
 #define FASTRPC_INIT_HANDLE		0x1
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index 1066ab6ddc7b..e90aceabd30d 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -192,3 +192,8 @@ int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *f
 {
 	return fastrpc_invoke(FASTRPC_RMID_INIT_RELEASE, qdev->drm_dev, NULL, file_priv);
 }
+
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	return fastrpc_invoke(FASTRPC_RMID_INVOKE_DYNAMIC, dev, data, file_priv);
+}
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index 044c616a51c6..e186c5183171 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -63,4 +63,17 @@ int qda_ioctl_attach(struct drm_device *dev, void *data, struct drm_file *file_p
  */
 int fastrpc_release_current_dsp_process(struct qda_dev *qdev, struct drm_file *file_priv);
 
+/**
+ * qda_ioctl_invoke - Invoke a remote procedure on the DSP
+ * @dev: DRM device structure
+ * @data: User-space data containing invocation parameters
+ * @file_priv: DRM file private data
+ *
+ * This IOCTL handler initiates a remote procedure call on the DSP,
+ * marshalling arguments, executing the call, and returning results.
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
+
 #endif /* _QDA_IOCTL_H */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index 4d3666c5b998..01072a9d0a91 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -22,6 +22,9 @@ extern "C" {
 #define DRM_QDA_GEM_CREATE		0x01
 #define DRM_QDA_GEM_MMAP_OFFSET	0x02
 #define DRM_QDA_INIT_ATTACH		0x03
+/* Indexes 0x04 to 0x06 are reserved for other requests */
+#define DRM_QDA_INVOKE			0x07
+
 /*
  * QDA IOCTL definitions
  *
@@ -35,6 +38,8 @@ extern "C" {
 #define DRM_IOCTL_QDA_GEM_MMAP_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_GEM_MMAP_OFFSET, \
 						 struct drm_qda_gem_mmap_offset)
 #define DRM_IOCTL_QDA_INIT_ATTACH	DRM_IO(DRM_COMMAND_BASE + DRM_QDA_INIT_ATTACH)
+#define DRM_IOCTL_QDA_INVOKE		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_INVOKE, \
+						 struct qda_invoke_args)
 
 /**
  * struct drm_qda_query - Device information query structure
@@ -95,6 +100,22 @@ struct fastrpc_invoke_args {
 	__u32 attr;
 };
 
+/**
+ * struct qda_invoke_args - User-space IOCTL arguments for invoking a function
+ * @handle: Handle identifying the remote function to invoke
+ * @sc: Scalars parameter encoding buffer counts and attributes
+ * @args: User-space pointer to the argument array
+ *
+ * This structure is passed from user-space to invoke a remote function
+ * on the DSP. The scalars parameter encodes the number and types of
+ * input/output buffers.
+ */
+struct qda_invoke_args {
+	__u32 handle;
+	__u32 sc;
+	__u64 args;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1


