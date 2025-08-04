Return-Path: <linux-arm-msm+bounces-67717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9DB1AA7B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 23:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA3718A2D79
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Aug 2025 21:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E2E23BD1A;
	Mon,  4 Aug 2025 21:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIvPB8cF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B268239E9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 Aug 2025 21:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343804; cv=none; b=WfAP7HRTyfP4l8GwkKaktyUl0VFJP0xS7z+QAPsaHXQk8BeVh1eRM2wCANwi9Or+99NdTaNmbxCIUYQHCjXv5G+yI3ajjzW6jQx23x4kjdnpBnegloHdM81VxKMBd/cQ4bgu8YsUCSQ5KszIWIQ7U0Siv2gbkH7SwE9vbvRXjHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343804; c=relaxed/simple;
	bh=CB2Y8BaCKhdCfoJDmALSTSTK4hRfQx5XIImjd7vhr1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q5F0smMlUxyMTJD9b2qisBoqL/AqVAfWcsFXHpUh1Je01Lw4WzWFLVs+o2mqI912zXK/GPFuYiBi60dm1xhKcXrEWMarAXqLMGU+czhCKIWh7tMCH12zoqNyfKatgbb6BUKiUBupYIf6Y53Jxyy1j0x1zUw4XFIX+p2l7HNo/gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIvPB8cF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 574CC1v1016093
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 Aug 2025 21:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4iMQZAqx3JH
	WA1prynQ+6hJlCX8ujFNqsZgwdOw+rDs=; b=gIvPB8cFPv1IRFNTmqYWqEWuixR
	Rwv7bmlaMzqpBylwNtRi/TG3UiM5k84mwatQE10PeUBNVzoEhsZC/kEPjRmRctDC
	+4ryya9XDg//UPR17UUtiH/UY+Becav0ePCMrFVJlEzmhGQalUXJG9cFtGnElobB
	qlSlHwe5N9O8RqWjBAnqJ8u1dxf87h6e8PXE5AZAC8ytxEBqBzKaeLCFYkRG+iXS
	ZPKaXijDwUfqLCd6gmGJkhRVPcGNg/6HUPKEFA9trUtMYvvoMAgwYgrrRcN7XsLw
	7GLN1tfWws+oetwv6VI5XGTLxVbDC8BxqoxJmILgFmZRwmtdCQzjbkQWuKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48aqyv2k3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 21:43:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24249098fd0so30288795ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Aug 2025 14:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754343801; x=1754948601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4iMQZAqx3JHWA1prynQ+6hJlCX8ujFNqsZgwdOw+rDs=;
        b=EcEg8OhPe7xw9jv8+pIlAA/8fGpvpuA9gCsYsIeqLq237RDdYw4Q1WrEpgRXzUIZyT
         H1RqTJyXxHJ3Edb9kFf5ilcOSIVJO4qucnXTOPRBhBg6HPO7TBu654bB/dZnyV2NIjI+
         R5pot7eKP2Cpaf03fAJhHR4TUBlyn/WG58yf2ugyuect4w17tz0/06aGj1+nAQFqK/yA
         6zFmtCYJLdktvMSvh6GZJCVuAOFwVcYvs7sZfHqRTlMf7k1gP2yv0xKRk/O6g8Q76CdJ
         +euXGhqAa1hWY1LOpcyAQA/f7X7AnS3uJ5myKsXifaKwKl3F+8sFoL5LItkVqHLCYEJS
         k0MA==
X-Forwarded-Encrypted: i=1; AJvYcCUc4EIUFq3BQBykC31Wy0UaNjoSnc1r++WuFkqj8/AUi44YZAcZ6B8ThnRt+7cGCSATthf2g4+Tsm8IDkak@vger.kernel.org
X-Gm-Message-State: AOJu0YxVP0YZnZWDsVaRzRGNpN0A632mysqE9N/RElvGGxVIoYE3HlcA
	xuQ7h3vRlMLzQ7cOqybFX8C5ZzWzkGsI/xFf8HZhkzjvdxV+4c4ll0SK9g8f1oQcDqSM042h6DD
	dm+qzqsq5gmgLADwcfaTOoo/z4Km07YgRFag/GXiaDaWVe8Ti5NwSI/6MbtUwek2auiGT
X-Gm-Gg: ASbGncspqqgafchaDR0CGicpJfEWe3KSdXuE83fqtBsCHZhu8RsAfPYcIqq9pxPWbG0
	CeIWOF2avNBU1ik/F5NAsdWE/OPDF+Yqkwi3A3tp5DZ3nizJwGNSQm0qF7y499ycvIeWM+3s6Pb
	XpHWWrhMmiNYhO1JMPtgz2feIY33tBVbm3itcKP9wvrAiRjVJCIQ4ElbQ3SSVF9DHNFUU857Ixc
	LxJpaD+tcGi8wt39ytV03MMv07dbjdgQU9YD7LapJKDJLwlgW6/jYfFXRnW6wAHDYMmrqDZL2qT
	jJczYak+7sa2Y3DcL2F0d3tYu0g/gkbxjh8tuQ2LCwXj6boOE/8=
X-Received: by 2002:a17:902:c951:b0:240:25f3:2115 with SMTP id d9443c01a7336-24246f66529mr161881485ad.12.1754343801263;
        Mon, 04 Aug 2025 14:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJ42SvcJgCxFfQN88b9q64GCmdPYqi/gv07LLosxuO/N73EtGwR8zNcDRPko1iT53bOia+0w==
X-Received: by 2002:a17:902:c951:b0:240:25f3:2115 with SMTP id d9443c01a7336-24246f66529mr161881165ad.12.1754343800876;
        Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da57b4sm15506076a91.5.2025.08.04.14.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 14:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
        linux-kernel@vger.kernel.org (open list),
        nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
Subject: [PATCH RESEND 1/2] drm/gpuvm: Send in-place re-maps to the driver as remap
Date: Mon,  4 Aug 2025 14:43:15 -0700
Message-ID: <20250804214317.658704-2-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
References: <20250804214317.658704-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C_vrDoTmb6YfAlIHPrBv0LJWE8IMsJDh
X-Authority-Analysis: v=2.4 cv=F/xXdrhN c=1 sm=1 tr=0 ts=6891297a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=-LggB1lm2EvgG5rjBn0A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: C_vrDoTmb6YfAlIHPrBv0LJWE8IMsJDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDEzMiBTYWx0ZWRfX6pmphOCEP0EA
 w/6iV+iQiYbtnP70Z/IPe/8VEXNfzJG98SZWPZHAZIpm9JsoHwfq7lqNY4EjajYRbziWailjQeK
 pkeP8LVLh4sJksMbeTWNPhTo5y3/6nKDe0LEo3hZMkBKC9zKqkStBnH5E+kuFXXFw+AiPl/9/Wk
 JNMUYpennU6ll+8fTsqEqsBh5yJcHpx2PbFQO9eCuHUQGjtfNuVqbOg3zlTTCZr0vPLEbwmv3HQ
 /aYv2+Lzqr1/l4VMV2DvEvHzZTa+5ZG8x6L9kNix9nQSYaWhPUtLVRHFrwVa60HJJpP6zjWQgcd
 iDWAD3YOHWf8JruY5Ym8m7Qf42vx238OkTdrYbVNR39KvnG9j9iE84XTjKPi7494Idpdq3J6xem
 Yo1LZo6arq2pUffXRYAWRNRJ/67LpNT+x+5en6GofmAiv8UeXyjXY/tvPE57XHu4k7djZCr1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-04_09,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508040132

The 'keep' hint on the unmap is only half useful, without being able to
link it to a map cb.  Instead combine the two ops into a remap op to
give the driver a chance to figure things out.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 21 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  3 ++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index bbc7fecb6f4a..e21782a97fbe 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -2125,6 +2125,27 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
 				 offset == req_offset;
 
 			if (end == req_end) {
+				if (merge) {
+					/*
+					 * This is an exact remap of the existing
+					 * VA (potentially flags change)?  Pass
+					 * this to the driver as a remap so it can
+					 * do an in-place update:
+					 */
+					struct drm_gpuva_op_map n = {
+						.va.addr = va->va.addr,
+						.va.range = va->va.range,
+						.gem.obj = va->gem.obj,
+						.gem.offset = va->gem.offset,
+					};
+					struct drm_gpuva_op_unmap u = {
+						.va = va,
+						.keep = true,
+					};
+
+					return op_remap_cb(ops, priv, NULL, &n, &u);
+				}
+
 				ret = op_unmap_cb(ops, priv, va, merge);
 				if (ret)
 					return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 48f105239f42..c3e3a15eb3c8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -820,7 +820,8 @@ op_remap(struct drm_gpuva_op_remap *r,
 	if (r->next)
 		end = r->next->va.addr;
 
-	op_unmap_range(u, addr, end - addr);
+	if (!u->keep)
+		op_unmap_range(u, addr, end - addr);
 }
 
 static int
-- 
2.50.1


