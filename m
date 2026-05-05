Return-Path: <linux-arm-msm+bounces-106030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIhmCw1m+mmnOgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:50:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64F4D411E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 23:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B96EE3000B1D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 21:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA4804A138E;
	Tue,  5 May 2026 21:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m7qXeu7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XAJr2/Oe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB6E3CB2D7
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 21:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778017802; cv=pass; b=OsVm+mUQPn8eoVfSIc3R+rXq4SLXY2APydL1DryeM/PkElxL7H0kvSNTRynY/hZzAWGu9PgguxN3wR5q4RL2dXlCWyd7ATbs8twBhcKL1xcfOQrAoogTfldmvj1DO7ooCNVdiTg4eDKPEuBk/eXA9r2G8tGVBpZ+/hSp9WRu8vA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778017802; c=relaxed/simple;
	bh=Thv4BPtf8cWtZMW8SrrSWbJdMlVqenK6asKH6VRaP9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYPSQyclxaMssRL7ACypUEe9SqSpoYEsMAuAnMoQbvLLX2MGeyYd82d7LBk+picjrI4tEpSNlPOBMPm4qs9UoIlPKdcVm2fZ2IACN4mu3omWNnqNj/nRtKKZclo2cd6l6S1iIaoPaY1lmavY6fx2T2b3JxrC3C3gfoHfMKpBLjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m7qXeu7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XAJr2/Oe; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645FtwPp2445835
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 21:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=; b=m7
	qXeu7SooJdrbzx+ez3ztpKc8cu4TsY67cSrZycclEIrhwsW0CPKHbigfETGzDAPo
	tDqs6F0tR7ATCG+ZsPLPnFrmhwwUQ/ifgBs/SMVU2SUCt1oT+iq91dPTztQBzWZv
	JR3GwgS4ydL6REZZuzArZCL4ngfEDkhvxYDX/IRdqIHX8xdU9Ew/yhHUcUE4gK/4
	mx2taIugSHfLnsEH9EFhiShR8bnIVERJvLpIUpS6QKzBTrep28ncwwO6kesUM+sa
	6bdttxzy5hSDRCGFKJheAH2SKwfus8FipmeSM3biuol0d3GkT9OdoAe5U4gU3Fta
	mFB81t83iwxS1HHbUXLw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dykmhsbmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 21:50:00 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-475f6d0de69so7116827b6e.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 14:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778017799; cv=none;
        d=google.com; s=arc-20240605;
        b=CyjpYNP/mXPX/B+Iaz3c5BTXPw9bqYINhTo380BYb1szGmkJ2Swbfi/PYDP+PFiw94
         LfZ5PdywzMeFmUowhl1+jlKa0XkXNgHM3xN4xxwm0eUlZv1Xu7Afpi9Dyb+V0722Ti34
         fJKafLH//Wsa2qq/MP/afZGOV16lcQPCb5UEyRbHA44rgLRWSuvAngfxsl5tv5ZMSU3I
         YkoULPB74iLeS9FsHszUdhhebqPLEfGmvXMovpAwazRSDz+p/uzGHYX2V974+v76uita
         7T+QueA27RUJQXZFJI33wt0nF5xpFlJEoc9o70FXMWhEBLsHhG0Id02zb/57tt71GtsD
         4bvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=;
        fh=fW1TMrZoHiAAtbrrzf8zZ3hVk0sSRRKnWQWszX8taq4=;
        b=SS4Z0o1ejZvX5AJ75YJP5l94Bk2LT9+okqQIL7zUXt4W4WfjQOf+RkTPs5XVly+8OK
         z9YFjsA1aIB6VbvzrMQIQmkJBiPGObj1UZaZQ2xYT67FNIBgKcTjw+4dait6fiPcVJet
         GfXBw7Agm1DEqflLbYC21Ls6bXeIweStPGPzC3s6hXQkP6sCHMAa3ZJSQ8u7wYOY8k0M
         eLsnqUK+RE4L2yBt/Ldx7BHkzp0UmdW2b9qUYvl+OdtxBH9Fkk/dZLvgtk7JlOBb0D5R
         z3e2VzZhR0aKZk+aFhcRnvkORMA3aOp4whRAohCMc5GwPynXbatm6qffIek3NfyfLApL
         DVXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778017799; x=1778622599; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=;
        b=XAJr2/Oex+pMOIZ4i2y76TvfSoOGxNGTH8SLR8eDwfqwLCpD/j8hLte3TCIVQqT1DX
         eiFVYCuRG1ffc9s5eM9iG8+k3g1PSqahoI6qM4YbSjT+kqsbdMkF6J57dpK1G6pVDqGs
         a52RFPPR7Z+dl8HMPx1kVocydxYI6ITK97bINatYhFDeqkXhRR2rEIhHOGGZf2n/QEH6
         GWYeG0MeoIhshsQyZYBFy1T/ULleXBGcMFCZJuKZfNQJ6tMzZcBJJE3wrDiYVmlQa04D
         eE+OCk7ZvWzkUXhKbyWaZGPHP8hmE7Y9s4pPGOiCoXA+H9p1nYdZi4qMg+oh+mqXNdCf
         LCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017799; x=1778622599;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GWoubTXPQdVwM4tS4Rj7Dbfl7e/Ff9zwszps/EZhuKk=;
        b=HyoV3UDEZ58Kd73gaDFFGcZDiNLnOJGYGcrEGfQEuJ7Oo5xOMZ4nzNVeM9MlE+VCwE
         otOF3/+Lx9Jyj1bIC3u8J8AyvizcLGZ4VXf5xbVocxnVmlhiZZf5oJOmZdyJ259hTYtx
         YOJSe/5HWWYXCdmh4CELh+lRCQtebinoyEGUdgxKoIFZISZqQODPF9NeOmsdYiTSUicA
         P2RS9udCO96JB129Fh/r7n7ncV+xFvKxN31Att6egVdO23tjXi5voUZU2DuDDdbJWSOQ
         U3hmbMa0lvfgACtok95illYickyCIraN+n6nlRqN89DrjCF0+UbS+hJ3E0WjCOAA1FW2
         uZaw==
X-Forwarded-Encrypted: i=1; AFNElJ/0RhWo21IQavl01Co4YmrikPF8hq5Z5a9OL4Trpai6Uf11HJEDHgPOapdk4oRWnIEI+f+4Oh0EUe2CfnlF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7/NLSy2+tAJZ866CuiVeLlTdfh4XIM3VMY/IxlFB+Es2G+NFI
	TUu9xaiGGlTA6mcER+DO8PGr2kWYMtWmWY66mXftkn+9wkD4f4Ql6tfUJzCjofE7ah5fkEuKFcX
	XmqFMzqDym5nERwkmaAvTAShZS9fiTlDOUyHAWOT0QrLKHzp/LpMDNml8ah5vacwMBnPuOJE+a0
	22XjP4ClP5sVli+ynpniDUthWl0G5SaE7Wo/gW9gXYje0=
X-Gm-Gg: AeBDiesFnSBYTXktDjDLAZE+BL9LcT032PPv7I0UC8fNyiFJv3RzwukAfqgrIJmFlE0
	5F0CeB3lM5erZVmHH6X5UwiL4UHdRNNVyWMGQ4m//dA0543jldyvs8NWsVWi7kUlBRyzuvu14Sy
	hM/fjlw4VNmubfmSEGi8N0OCICgYSpjy03IBp/tRXQIKQwcNotB1mAfsvIyR68ZOIS5jbLP0+Pk
	OETCsijHd26ljk8sb/Kw+J76lsRwQ2rb7ffWpymKD5FJqtA
X-Received: by 2002:a05:6808:d52:b0:467:9ca:4b8a with SMTP id 5614622812f47-4804221828cmr643111b6e.11.1778017799401;
        Tue, 05 May 2026 14:49:59 -0700 (PDT)
X-Received: by 2002:a05:6808:d52:b0:467:9ca:4b8a with SMTP id
 5614622812f47-4804221828cmr643081b6e.11.1778017798961; Tue, 05 May 2026
 14:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505-wb-drop-encoder-v5-0-42567b7c7af2@oss.qualcomm.com> <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
In-Reply-To: <20260505-wb-drop-encoder-v5-1-42567b7c7af2@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 5 May 2026 14:49:47 -0700
X-Gm-Features: AVHnY4LH0uDMjgYOgFKujr3D57r6UVTyvfwJmoAF1iOOVmgpBbGDoiGs-TovmEk
Message-ID: <CACSVV00TsXn=yx2UeGpxvCWRkSdj0=_=3_s01wCaO1RDH8t_vA@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] drm/msm/dpu: don't mix devm and drmm functions
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
        "Kandpal, Suraj" <suraj.kandpal@intel.com>,
        Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
        Rodrigo Siqueira <siqueira@igalia.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Louis Chauvet <louis.chauvet@bootlin.com>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=X6Zi7mTe c=1 sm=1 tr=0 ts=69fa6608 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lAOjoZoF1AEScRdHVYcA:9 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: JLId1FBPQpfkej8Nt7MBnSBeRra-cNK0
X-Proofpoint-GUID: JLId1FBPQpfkej8Nt7MBnSBeRra-cNK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDIxMiBTYWx0ZWRfXwy0oQ+zPa0bP
 wgXCkUKtTK4uAj+Tof4k1UJy0ifYgYTE1SkSvij0NuKNn4BT3EW891yYnj4qzqF4EttPowNUwsz
 VjtnfTQ4EB2ZCJFq8/1o8LuhdxZP6Jp8IjqmKz0ne4+Ql1h3PwjDUZYPSahLnxdfReiIAvzh9Cq
 cJ1853FQxnG0xlT0+lnNMsj2+p8mk6OT0bA5bBfD/9TdcVKt3oZQfhn99yXqLvFQ2J8jck11Upv
 /GR+yrXwWioaqOOtm7qZiSDxf9kugLGWX3EQrzRrHU8XWMMfV1s51U4CRDiDfvYmWZIafo+zX5k
 +nTfbrSkKUxzIOTe5ZZAX1CYlQhYjSFxKEtcst1SNmxE/eYuBo7Kvs19/iKwmUwyz6VrUr+athv
 /vfMXiXOCMBqokiDpF2bYiqOJ0M8zc9DAZnOddmDtyyNJ8oO+NZZIkJPGytq1lP+28C1FHNeXJq
 b9phQyyBorOEuxpDMvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050212
X-Rspamd-Queue-Id: BB64F4D411E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106030-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,intel.com,amd.com,igalia.com,gmail.com,ffwll.ch,arm.com,kernel.org,suse.de,linux.dev,poorly.run,somainline.org,ideasonboard.com,glider.be,raspberrypi.com,wanadoo.fr,bootlin.com,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email]

On Mon, May 4, 2026 at 5:25=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Mixing devm and drmm functions will result in a use-after-free on msm
> driver teardown if userspace keeps a reference on the drm device:
> The WB connector data will be destroyed because of the use of
> devm_kzalloc()), while the usersoace still can try interacting with the
> WB connector (which uses drmm_ functions).
>
> Change dpu_writeback_init() to use drmm_.

From [1] it doesn't sound like userspace holding the drm device open
is the issue (if that were possible, it seems like it would go badly),
but rather the order of managed cleanup?

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
/commit/drivers/gpu/drm/xe/xe_hwmon.c?id=3D3a13c2de442d6bfaef9c102cd1092e6c=
ae22b753

> Fixes: 0b37ac63fc9d ("drm/msm/dpu: use drmm_writeback_connector_init()")
> Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Closes: https://lore.kernel.org/r/78c764b8-44cf-4db5-88e7-807a85954518@wa=
nadoo.fr
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_writeback.c
> index 7545c0293efb..6f2370c9dd98 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -5,6 +5,7 @@
>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_framebuffer.h>
> +#include <drm/drm_managed.h>
>
>  #include "dpu_writeback.h"
>
> @@ -125,7 +126,7 @@ int dpu_writeback_init(struct drm_device *dev, struct=
 drm_encoder *enc,
>         struct dpu_wb_connector *dpu_wb_conn;
>         int rc =3D 0;
>
> -       dpu_wb_conn =3D devm_kzalloc(dev->dev, sizeof(*dpu_wb_conn), GFP_=
KERNEL);
> +       dpu_wb_conn =3D drmm_kzalloc(dev, sizeof(*dpu_wb_conn), GFP_KERNE=
L);
>         if (!dpu_wb_conn)
>                 return -ENOMEM;
>
>
> --
> 2.47.3
>

