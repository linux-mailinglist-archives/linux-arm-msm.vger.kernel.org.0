Return-Path: <linux-arm-msm+bounces-106780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I7lNg1U/2lZ4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 17:34:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 806385004DC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 09 May 2026 17:34:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1371930107FC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 May 2026 15:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F462C3244;
	Sat,  9 May 2026 15:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ABpwWVjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lh0PWwr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FCD2D47E9
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 May 2026 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778340870; cv=pass; b=XFmVVJcnXSnSiACV2p3Zx5pq/Au0kfgPBeZWVXV+wx5veuQiu9i6u2gmXdnqBQBJLcf/LZl+8Cpf0XmmUAcU2x0z1vM1NicI+AwHdA668GOzCLM8iVaZtL+6K4bpyHk3ygfZNOoSnbWB7nKi8orNSwErZcHddekNPuet+ZWIkCY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778340870; c=relaxed/simple;
	bh=4XX3VmIcDvHqIF/LrlDKXDrML4vVKj9rQoTDDvjcKMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MUCVmO376WfapeLQthISkMYqfOsye48nC40u5OAmxMLxbejlR1CbEU+DFn1sXg9OFB2+1KmJNntQ1Whdnu78MIOzuuLqbyvae4HDQ75p7lA97yL72fx5cq/Ak/q3Jr5AFdXBZBVHVdDSuTptIj85hdW60Q2504PPGTQV3DYeP/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ABpwWVjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lh0PWwr+; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6492C4c2656896
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 May 2026 15:34:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=AQTiS5P2oiFWdLEgVOdRu7bU4r8wnKpKMw3wR2rV5pQ=; b=AB
	pwWVjwZQZtcSo607odhyhAjGd0VqF/8yXabsIaq+sFmSvGLAeGq5fvg6t4wEdmee
	GjwCV//lEhszZGpmEZz7kubXqcq/FU4EFiMoWvmGqGAUO8W3QoF4wJxuoK+L/cDg
	soZZUCVwNY1lJj3OF4kpjp2Ts2rcFu9CmGAhNXDZvQQlZtx/xwzu5ZKZv+LADwhG
	jgOYZDUfUkrhvWrB/7JefuVUs33eePVFU/1Cwj5AVQVfUF3fSfAjm1KT/IVcJYHR
	nOa7XYJ+BGyB0HkUUMxP2CZ/pnGETkmeaXmPba6Qm80RvzGwb6tLbTHantHCkR6L
	nBDdzi7DQwDmoAwumyCA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1ux6sb7v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 15:34:27 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-479ef25c477so1078096b6e.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 May 2026 08:34:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778340867; cv=none;
        d=google.com; s=arc-20240605;
        b=iaxO+/QKsEnjSpI6k8Xop7FJxvjTjbXfTYkagLo+k5pqx+AL8V4hQXqqagvTzylY5I
         TGRWsrNru3q9msh4bLAvjgh0xXf9S3+WRVY7Kp8cScuab1Wt9CgAsNWpsBe+YUefQN5J
         hAKtjPgDYhu/t1sprbpoe4RD8TbmLJ7vHmCfnp3rkP40LviXmBzzNGEc97vyLAH7P1Mm
         K0RXz17MJGudh0GO0GydIjpNCADV6Z9QUKVQmLP+F75zKe7HrSCUrU9Rgzwll5Z9ZmqY
         rdaVrcQnGtUP6u9qZZq2meT67qUReiitBJUD/9o3J7pKk3zsYO2hv819tofNyeu9p4g3
         SWog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=AQTiS5P2oiFWdLEgVOdRu7bU4r8wnKpKMw3wR2rV5pQ=;
        fh=WoV7TTpQAVBsGfsp7oDvX/yXy2NThVpCbbF5x+AmKuw=;
        b=lbOheIJoXNIL7BgBEzUEGv6sk+XsN7y0LH89I/5qSkM54e+MAtH6K5PkhVRy3V7pHo
         afWRSWc1MKVuDJxvaGoKzACWw29wu9tXz/wBMe7f5wIwTX0xna6YIeyIaJE0GPLz1JF6
         sY6pY43nj3wnJl3jgfWLgsKLYws0AeqHIsalNMKsDB2sPp631XiyVGCMteRWeP3f/QHI
         rTvTXsdfXszBIM87WjeD/QPrtOQ0fr5JRW0PJVEvUsrCxPJtNvHSu7gOE+WJLUlm/B1o
         BydKmhGT93nM9LPeYBZjLcY5eHJkI1JQpXZ10yRGWcuWauz3lsZzdpHb/qJi3Ed5tUn7
         NtUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778340867; x=1778945667; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AQTiS5P2oiFWdLEgVOdRu7bU4r8wnKpKMw3wR2rV5pQ=;
        b=Lh0PWwr+/+2jfmU0cE+ujylN+eBC1UngFsC9moeUG4tcHaDh9BSC4q59mn78IanuOS
         VsmwpnWaHI0Z4xeCDe0MIFmTc2Uln0S0b4G0nthnPnJsYFD/TzOaLqeLbBmIIuUdJB6q
         KJKhJeo1ZE26pfOq9rDUIDTXv0yEapVlvB7h7dJ2BN85w+/YBDApJZy+AoGfw2nIMu7N
         QSkQYQIo6B0vrsentog8r7S8n3iK6iwx5qqFCRKhabvDFcp0G7+Qhk7/WldDzdzASvV2
         dGC5JEil8Gc8STfpTQT1yWA2jRxyNg9dKfEK0qlnekXj8EAShTccD6FtGWuPvGy2lzfj
         2X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778340867; x=1778945667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AQTiS5P2oiFWdLEgVOdRu7bU4r8wnKpKMw3wR2rV5pQ=;
        b=OirQE3PC2RlHVC9uMGHviXwk1ZapZe/tBQ0b7QOOjkx3rDhjawa3EexS7FY8OL4FKK
         YgoSy44mznbLoyVilp8mQDcCeEiMR77bqhITvooxJadSJbfOv97aOPsZPWzeBHe5RTeC
         jXbAITdxggBNyDQ3oOTvaLgaedYTGv5CpwF/5FUIFXLXYegQrOX0oAw7et6gyrjh0beC
         6e/VJupnzw0Vxnb0sIC4q3aSBuTtsXytNYZ69ywcgYBiRkQ+rriK+ex1SccAqQEYkJu2
         Hk1vJMXPGHgSSNYlfy/Ow5+sdg6uf7a4l0H1fFm19eE+Jf+bguXkSe1vNHXHzfHVH8WS
         6dWA==
X-Forwarded-Encrypted: i=1; AFNElJ+c5wGEOYpKCdOOvj7y/kixkoy3S/h70YMPdkYokvr7SfUNfHofXJibg9FnI+6ufiuVW6a7q/IJYDdRsNLD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+FjFUzsEIlHrBDXkaH/c82ZjCaY2uDSTi5KjgwQUzMlAXNY1y
	i7GS2Rw8f5KQpIC0/HYm3D/Ju/fgFI9dDISacs/Ks3MrrS13kLgzK3LUVVqLNleenBTxSbIXCjV
	2na4T5Isu2h0IKLnTZO19AvLCWdmZcdL4z4J3kT490bW6iKEJv4XA3Ev7BJF/WfKPqgsyERM/Go
	xhSGbxiNK1khkHR/JHNIYZOeZ/3M48PytckrCpu+RcNEM=
X-Gm-Gg: Acq92OGBXydwBDgiv+ZsHr5aYvVN+fetvjZG/FfDrWpg6xewmJ27AnA5f7cHTV7dChv
	WVUYLLCbO/35QkscEsTP6AhksQoR4WcgUzUsctsyCmRA9ZUoXeD+V73lFe39iQAVJIV1kOUoNmb
	UxHsV/dtj7/yv1zb1RTH37cozJtB6FNw5QxtEzaBbniX3gf7U5tMKVR8C3kTar1mmThkFO0FdyK
	rU9C0/PKdlvllRokmNK0abgncDvK3hXfcjUnw==
X-Received: by 2002:a05:6808:f8c:b0:467:255a:7453 with SMTP id 5614622812f47-4824a6c5a04mr1570574b6e.14.1778340866780;
        Sat, 09 May 2026 08:34:26 -0700 (PDT)
X-Received: by 2002:a05:6808:f8c:b0:467:255a:7453 with SMTP id
 5614622812f47-4824a6c5a04mr1570561b6e.14.1778340866232; Sat, 09 May 2026
 08:34:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508065722.18785-1-daniel@quora.org>
In-Reply-To: <20260508065722.18785-1-daniel@quora.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 9 May 2026 08:34:15 -0700
X-Gm-Features: AVHnY4LYyvwLr8XG8e2YiuOn8i1bG5G0Km9pemR5eMsqy_jRO5574zgwrGB50VQ
Message-ID: <CACSVV02t99r2JpT9EUar_YRs+zgpzjNYgNvvB9BGLLnpssY4BA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix shrinker deadlock
To: Daniel J Blueman <daniel@quora.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDE2OSBTYWx0ZWRfX3rCQS9NYAo1Z
 vECttUL8R9d47qDel3DzAw8nVCuNqZH/nJhXT7mfav7Sa+fquEKT3uJC+L0LRnXEWIZGEsWrzJj
 ZS51o4/s4UfaOLyIC0+R0gVygSubpfYHzoP/qnzworzNQzE8MML+WxaOoDu+1ADECOHhC5vJFHP
 llGlOY+FbVZe7QuFMv7R6fTEF5Ph+kun+75k1HaDcznF/ar46hD413NlwQYpZWj8YkgM3F4vjbS
 ClaZsF0wsxOLCjH1OrfPqiAtAq72hWh4GEBBhQwsiSRm5m99WP20D94i6QFkEbXVtRIa/vIpQ79
 HWEWT67hfaT/qCVywZvyxT3MY0wQVjHOAHCpUGi6KU6oyt6LJrqV2CIbnTpJl5L0ftpE1Z/aioC
 jkaFdApTzQ0lP/LgCBPRzrYvyMikXUu8zxgx0Y1cbvDksrzM+ZfUX57eoJa5bOlMDr+z+PTQju4
 /fNBm83f4N1Z2MuQk/A==
X-Authority-Analysis: v=2.4 cv=QJZYgALL c=1 sm=1 tr=0 ts=69ff5403 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=t9ty7G3lAAAA:8 a=VwQbUJbxAAAA:8
 a=T09HirTOTrSZx1JCU_UA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: xsZ7aWcbaPGJTmTxzmFAN0TrblHlrBhl
X-Proofpoint-GUID: xsZ7aWcbaPGJTmTxzmFAN0TrblHlrBhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605090169
X-Rspamd-Queue-Id: 806385004DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106780-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,collabora.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,quora.org:email]
X-Rspamd-Action: no action

On Thu, May 7, 2026 at 11:57=E2=80=AFPM Daniel J Blueman <daniel@quora.org>=
 wrote:
>
> With PROVE_LOCKING on an Snapdragon X1 and VM reclaim pressure, we see:
>
> """
> kswapd0/121 is trying to acquire lock:
> ffff800080ed3800 (reservation_ww_class_acquire){+.+.}-{0:0}, at:
>   msm_gem_shrinker_scan (drivers/gpu/drm/msm/msm_gem_shrinker.c:189)
>
> but task is already holding lock:
> ffffbf4ddb44ca40 (fs_reclaim){+.+.}-{0:0}, at:
>   balance_pgdat (mm/vmscan.c:7236 (discriminator 2))
>
> which lock already depends on the new lock.
>
> the existing dependency chain (in reverse order) is:
>
> -> #2 (fs_reclaim){+.+.}-{0:0}:
> lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:5825=
)
> fs_reclaim_acquire (mm/page_alloc.c:4325 mm/page_alloc.c:4339)
> dma_resv_lockdep (drivers/dma-buf/dma-resv.c:798)
> do_one_initcall (init/main.c:1392)
> kernel_init_freeable (init/main.c:1454 (discriminator 1) init/main.c:1470
>   (discriminator 1) init/main.c:1490 (discriminator 1) init/main.c:1703
>   (discriminator 1))
> kernel_init (init/main.c:1593)
> ret_from_fork (arch/arm64/kernel/entry.S:858)
>
> -> #1 (reservation_ww_class_mutex){+.+.}-{4:4}:
> lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:5825=
)
> dma_resv_lockdep (./include/linux/ww_mutex.h:164 (discriminator 1)
>   drivers/dma-buf/dma-resv.c:791 (discriminator 1))
> do_one_initcall (init/main.c:1392)
> kernel_init_freeable (init/main.c:1454 (discriminator 1) init/main.c:1470
>   (discriminator 1) init/main.c:1490 (discriminator 1) init/main.c:1703
>   (discriminator 1))
> kernel_init (init/main.c:1593)
> ret_from_fork (arch/arm64/kernel/entry.S:858)
>
> -> #0 (reservation_ww_class_acquire){+.+.}-{0:0}:
> check_prev_add (kernel/locking/lockdep.c:3165)
> __lock_acquire (kernel/locking/lockdep.c:3284
>   kernel/locking/lockdep.c:3908 kernel/locking/lockdep.c:5237)
> lock_acquire (kernel/locking/lockdep.c:5868 kernel/locking/lockdep.c:5825=
)
> drm_gem_lru_scan (./include/linux/ww_mutex.h:163 (discriminator 1)
>   drivers/gpu/drm/drm_gem.c:1681 (discriminator 1))

Your line #s don't quite match mine, but AFAICT this is from the
ww_acquire_init()

What I'm unsure about is if this could cause live-lock against another
operation which requires obtaining both obj and vm locks in a
potentially different order (which would also be using a
ww_acquire_ctx ticket to backoff in case of conflicting locking
order).  It wouldn't deadlock because we don't sleep forever if we do
sleep, but...

Possibly we should also be using trylock to also acquire the vm lock,
but lockdep would still complain as it doesn't know the ticket will be
only used w/ trylock (unless we did something hacky by using a
different ww_class?)

BR,
-R

> msm_gem_shrinker_scan (drivers/gpu/drm/msm/msm_gem_shrinker.c:189)
> do_shrink_slab (mm/shrinker.c:436)
> shrink_slab (mm/shrinker.c:667)
> shrink_one (mm/vmscan.c:5071)
> shrink_node (mm/vmscan.c:5132 mm/vmscan.c:5210 mm/vmscan.c:6198)
> balance_pgdat (mm/vmscan.c:7052 mm/vmscan.c:7228)
> kswapd (mm/vmscan.c:7501)
> kthread (kernel/kthread.c:436)
> ret_from_fork (arch/arm64/kernel/entry.S:858)
>
> other info that might help us debug this:
>
> Chain exists of:
> reservation_ww_class_acquire --> reservation_ww_class_mutex --> fs_reclai=
m
> """
>
> kswapd0 holding fs_reclaim calls the MSM shrinker, which calls
> dma_resv_lock. This in turn acquires fs_reclaim.
>
> Fix this deadlock by using dma_resv_trylock() instead, dropping the
> subsequently unused passed wait-wound lock 'ticket'.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Daniel J Blueman <daniel@quora.org>
> Fixes: fe4952b5f27c ("drm/msm: Convert vm locking")
> ---
>  drivers/gpu/drm/msm/msm_gem_shrinker.c | 34 ++++++++++----------------
>  1 file changed, 13 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm=
/msm_gem_shrinker.c
> index 31fa51a44f86..5320ef57dd90 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -43,8 +43,7 @@ msm_gem_shrinker_count(struct shrinker *shrinker, struc=
t shrink_control *sc)
>  }
>
>  static bool
> -with_vm_locks(struct ww_acquire_ctx *ticket,
> -             void (*fn)(struct drm_gem_object *obj),
> +with_vm_locks(void (*fn)(struct drm_gem_object *obj),
>               struct drm_gem_object *obj)
>  {
>         /*
> @@ -52,7 +51,7 @@ with_vm_locks(struct ww_acquire_ctx *ticket,
>          * success paths
>          */
>         struct drm_gpuvm_bo *vm_bo, *last_locked =3D NULL;
> -       int ret =3D 0;
> +       bool locked =3D true;
>
>         drm_gem_for_each_gpuvm_bo (vm_bo, obj) {
>                 struct dma_resv *resv =3D drm_gpuvm_resv(vm_bo->vm);
> @@ -60,23 +59,14 @@ with_vm_locks(struct ww_acquire_ctx *ticket,
>                 if (resv =3D=3D obj->resv)
>                         continue;
>
> -               ret =3D dma_resv_lock(resv, ticket);
> -
>                 /*
> -                * Since we already skip the case when the VM and obj
> -                * share a resv (ie. _NO_SHARE objs), we don't expect
> -                * to hit a double-locking scenario... which the lock
> -                * unwinding cannot really cope with.
> +                * dma_resv_lock can't be used due to acquiring 'ticket' =
before the
> +                * fs_reclaim lock, which is held in shrinker context
>                  */
> -               WARN_ON(ret =3D=3D -EALREADY);
> -
> -               /*
> -                * Don't bother with slow-lock / backoff / retry sequence=
,
> -                * if we can't get the lock just give up and move on to
> -                * the next object.
> -                */
> -               if (ret)
> +               if (!dma_resv_trylock(resv)) {
> +                       locked =3D false;
>                         goto out_unlock;
> +               }
>
>                 /*
>                  * Hold a ref to prevent the vm_bo from being freed
> @@ -108,7 +98,7 @@ with_vm_locks(struct ww_acquire_ctx *ticket,
>                 }
>         }
>
> -       return ret =3D=3D 0;
> +       return locked;
>  }
>
>  static bool
> @@ -120,7 +110,7 @@ purge(struct drm_gem_object *obj, struct ww_acquire_c=
tx *ticket)
>         if (msm_gem_active(obj))
>                 return false;
>
> -       return with_vm_locks(ticket, msm_gem_purge, obj);
> +       return with_vm_locks(msm_gem_purge, obj);
>  }
>
>  static bool
> @@ -164,7 +154,6 @@ static unsigned long
>  msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *=
sc)
>  {
>         struct msm_drm_private *priv =3D shrinker->private_data;
> -       struct ww_acquire_ctx ticket;
>         struct {
>                 struct drm_gem_lru *lru;
>                 bool (*shrink)(struct drm_gem_object *obj, struct ww_acqu=
ire_ctx *ticket);
> @@ -185,11 +174,14 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, st=
ruct shrink_control *sc)
>         for (unsigned i =3D 0; (nr > 0) && (i < ARRAY_SIZE(stages)); i++)=
 {
>                 if (!stages[i].cond)
>                         continue;
> +               /*
> +                * 'ticket' not needed on trylock paths
> +                */
>                 stages[i].freed =3D
>                         drm_gem_lru_scan(stages[i].lru, nr,
>                                          &stages[i].remaining,
>                                          stages[i].shrink,
> -                                        &ticket);
> +                                        NULL);
>                 nr -=3D stages[i].freed;
>                 freed +=3D stages[i].freed;
>                 remaining +=3D stages[i].remaining;
> --
> 2.53.0
>

