Return-Path: <linux-arm-msm+bounces-104134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLYsH6LZ6Gl7QwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:22:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3E5447318
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFCE8303277D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 14:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7125E3EC2F6;
	Wed, 22 Apr 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSncKpUF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ecg8Udvw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328543EAC94
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776867623; cv=pass; b=EUMMtUIcZShuxa1IF9d0RFVy+J0x6/s0X4f78S2upa2AiT894wQTAxh5zZ5Y0BeYIUfGmWNE2nPI6Epr7pC+AYOx29ZDDWEo/58A6Pl2dhiWF/7meeUiaav8Zh59nkonHCL4benSNHY0m4T+T80hmcIJdCOiOG4YdLoRFTCZ178=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776867623; c=relaxed/simple;
	bh=em15QV+Kf1oHAlC1S3eDATF7nv7vOQcA9wvY1hrcuUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jyH7xohGi2/chFDmciWjVKEvqCjt07Vd6Bzyr3J2VR/Ba/MqaVvO6Yy70CogCJKNXukSKq+HaCmppcg+mWg/dnniqutbmlPuxDNXzFHiDRQ9tErZME99xV67j98GBFRzjVEMiwh/6r/Un6neQm6JkjGEMGXiiiJJfiBtjkMaX1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSncKpUF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ecg8Udvw; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MAT81L3083122
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:20:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=OKOSdDLSZ2i+7JWxoJ8CJ7tIXKTkfw3JnQ/LRRVa3Us=; b=RS
	ncKpUFNPaT1hhx03WuBvOQWAQxyvvI405U5hngETePwB/7mtBqmu2EA5eSDOWbpo
	DHLh/x9kMY7mCzJAY7qnWPA38O6OGVh3Oz9r0gfCOCSv/dKbc7jRaa4SE2+fFjOR
	aikVXrsGAaqSSReNvOqniG80O1pw+7cBypWTu5xaq+ajtNHoX9VODUiL/K0s+a81
	Tm0iOM6fsZomBBGhzTXKZD8UNSjgDX1PV/uyMId3dFowFHkEuGomengnFB4SoWki
	wQv72o98NdMFCPqMAewjeq4aavHNhEJyR1hkT1Ir9bfhBX794No+HxZMZOuBI72i
	iJyTs+fzMi8nwCLrtDwg==
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpenmkvg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 14:20:21 +0000 (GMT)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-694a25a6645so1264029eaf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 07:20:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776867620; cv=none;
        d=google.com; s=arc-20240605;
        b=JzM9+FiC4niqLeD9X2pzVilcfj6SJNQ68FAfaMaTzkNazeDP//WodMy/rtANtS6YTC
         xAYxnOXeGy39y7uFr++wrUjfYEQtAqaNMF6Di+O0LZY2UZuT17TbOaP0xHVey53wFzlf
         F/zNOAOlV+7yYFI8d+Tuq4jYhKwJsAhAaEnF7ONn0GX5LmlsSRXcDoB4af4WUxptfiTs
         uKfBELTFF6elUur7QCsviIPd+J7L/e+qBbl60sl7WsdjKPKNjreV280F5dLDpoeBihTJ
         iV7sx0XjOeVNSj/KFbms3MIHYz1ot2kg0xTCW4XZkmVT7/pXS2wHHSlsIcnTSC0CpZSY
         U/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=OKOSdDLSZ2i+7JWxoJ8CJ7tIXKTkfw3JnQ/LRRVa3Us=;
        fh=3o0V80+ZGRjK5ozm3deT1sBQqNN+RZORhkYSExsFQsE=;
        b=SpxhuB3BNXl6rMxxygDvBmYOv8Evee0ql9kTOif5Z7oOPyll9NTxZ9wfcku7dAFXIz
         DSeJHom8uP4ZdjD+BdABa4N1UT40C8czPuiOiIo6aIiFhnM2az2l2Rvke5YOMsWH5fFF
         lOL600F5OR4Ti25aAlNInf/RKqcPDTHDB/3zNBWqAl4xJSe+N2DW8H9EIE978WCUk5xy
         AcwZn/ft7zbTtCDKTrTy+oImQ3XIjjwcqZV5WAf6D/0Cm2Zfc8SK6GHSG65BZhWUGjAA
         4EgYyzDyU2NoilWX9wKIVMAn0b5p6X2WdvH84IvecymrO9pajC2rJ+/cvHzActelFCv9
         lUPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776867620; x=1777472420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OKOSdDLSZ2i+7JWxoJ8CJ7tIXKTkfw3JnQ/LRRVa3Us=;
        b=ecg8UdvwvZesxuMnUP+XOkmGyN5VWk0V4xcK+nD3vBWziBFmnC0o57TxFDnzGydAm9
         TFe2sEBL9QYsUMgpIJIXcvOU52zWPn8/mAisdqj6uVPbx37VbsDHaZ01e+LlsV+5wHL2
         gzb5ec35JtTn6sgo1Cvgx2qKjSxqhnYBGsrnTAdohygIpntkrJsbHmgcEMGaHFnG4YZM
         yefAjIf9g9DstdKrEeKRGgCWATqgLDOcOHaI24D5dvVsJjA4Yei3dNvE4a4Vf3OOYFbD
         eKZJcGfGBCZAxZimlpaL8QqyV5AGXGxnrdb9R3wxjIIGF7jpvxFOLyPA1/rOXuiB7qpo
         6QxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776867620; x=1777472420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKOSdDLSZ2i+7JWxoJ8CJ7tIXKTkfw3JnQ/LRRVa3Us=;
        b=ONd4qT2bEEY8bRFlZ1og297HRbD65Yt5NG4dZl3j7ZlvtqV3v2Hmd8JFI4KQjZfQ8G
         EDHZZ8eew9HBqea1vTNA++iS4Dfmp3L8l2axnBd8rYS04Q7Wc+UhxrS6UYdqsNU06tt2
         OwHuGuIayD80OojTgPmLoXdTx7nc70Y6RP/AXKpZNDL7nLT0pC99DdxexOprigWKLcry
         8hK8XTUFbzb6MFG5J6xHGlNpGeKl5FtkW9EgVKdP8Gxo1DuU74j4s5qk+d0U9gyIK0O1
         OIwTqtxVjvqLSFW6b91guVbu14CFOka+TuZcnTnUuJpgeZZxNZ0o4w7aMcloV4d/vDNI
         DmLQ==
X-Forwarded-Encrypted: i=1; AFNElJ/QzTl0luLjwXdOz03VwnEs0Xp8kYBRALGp66PUpdbjMb3KXnzOau8NaixmJ690Ay1dcee3zfg65K6qFLMO@vger.kernel.org
X-Gm-Message-State: AOJu0YwlLLbKjInhUdxwkHKni4U7ZhKu+GImwMDbjPK6pcxWCkRC5ooD
	XKK5ulPhq58lq+KjLJpMPg5pSwNukAf4MY5u3NInwwk8vGKEXaZm7+IkKY6Uytvl0sBgu0xEhjD
	dUzhTZfBkTdigNq9obLonItbjfDB4mXFtGlixjPQ99FvgkuzXipU890D8xlh7gYAsZKOtqoOO9n
	0FmpYV29Ix6wDai1SWGhqBlcPh7YB5ag8RyIa1Y2/623A=
X-Gm-Gg: AeBDievjqkQPLO+FSlWtXaQhIk2yiJ3l60yLVEutf51p/ey98kFguA5fyhvLp6/kXnk
	xFCKH2K+vx/2OgB9WjEeIlE1m2YPfgklmY57BwLrWnLyNlLfeT0A7x04E1Ax0cR5/SXDLvbbXpz
	09fJT+CqzDG+sHoBQErz0mQrIBgws4nYuZpwwLiUKd3WuXLLAzXCeIJh24EYu5lOTGxmn5SxmQS
	xyA7RCtqAEniEXm/mYZMGPEkQr1oPsf4oALz/2Ia4R3GV48
X-Received: by 2002:a05:6820:4de3:b0:67e:21c9:ab55 with SMTP id 006d021491bc7-69462e16702mr12186095eaf.3.1776867620571;
        Wed, 22 Apr 2026 07:20:20 -0700 (PDT)
X-Received: by 2002:a05:6820:4de3:b0:67e:21c9:ab55 with SMTP id
 006d021491bc7-69462e16702mr12186075eaf.3.1776867620173; Wed, 22 Apr 2026
 07:20:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420222621.417276-1-robin.clark@oss.qualcomm.com>
 <20260420222621.417276-14-robin.clark@oss.qualcomm.com> <a3nvz2coifdazaoyssm7xtxmyiusvofxu5f2p44kvrgvpa7hbc@jmj6gyttetcr>
In-Reply-To: <a3nvz2coifdazaoyssm7xtxmyiusvofxu5f2p44kvrgvpa7hbc@jmj6gyttetcr>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 22 Apr 2026 07:20:09 -0700
X-Gm-Features: AQROBzCZ07nuyFpPgTQpdOSrlOKgniqgnA3n71Gpw9w2xyS4h0hWal8wB6s-rLI
Message-ID: <CACSVV03+aZUnLWfGjMLAJmvHm7LxnugJDQ=_ZZFV00-UWeZ98g@mail.gmail.com>
Subject: Re: [PATCH 13/13] drm/msm: Add PERFCNTR_CONFIG ioctl
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: X8wGsranRQWAZRSmkXE9oTqTn1kgLpCx
X-Proofpoint-ORIG-GUID: X8wGsranRQWAZRSmkXE9oTqTn1kgLpCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEzOCBTYWx0ZWRfX6iiP2CwIxC6c
 sarA8V/jFoJgUX9sqEthu4508mVrW5GliTzX+ZF1LIAbW+FE8W/vAdT5xzzuRu1NbOpwyYaRk+q
 QrpkoBrmYQPZnr2/oe2WdATDF2q33x2WrZKLMceV03H78NW3t4+JJ1sSGhTEbT8v6gDXBCZXJyf
 yjwf1D8kC3qUONEXBjni6Ex5M7vhfpjnis9na7CmrEzf6XUPNP/7xdNaDA4L+2Z9dc5DRCcTAS3
 ygNUwlkrUUIpsHnnQQCzFF0covEuF3TfWEYTOygAcQ8lAkKkR3YOseElnuDdubuaQmMfjPBWh+J
 a8ITQdhkYGGwEkOHhS8UpqHOaN5Rk7JTmkrJ74sl7isg9nuychQUEYJRDltF0buDYT2RZgQD0TN
 Dw7om5CynkQDXlTxND0st3yislIs7tpF98afvX0BNsRyLEI0WuHqDVsnRQUAWloPLg1G+khT8W/
 imvhGc6Lk1UslTfULAA==
X-Authority-Analysis: v=2.4 cv=Xd65Co55 c=1 sm=1 tr=0 ts=69e8d925 cx=c_pps
 a=wURt19dY5n+H4uQbQt9s7g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=JrfraD0a6nxK02t0JjQA:9
 a=QEXdDO2ut3YA:10 a=-UhsvdU3ccFDOXFxFb4l:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104134-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	MAILSPIKE_FAIL(0.00)[172.234.253.10:query timed out];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: DC3E5447318
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 21, 2026 at 8:41=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Mon, Apr 20, 2026 at 03:25:35PM -0700, Rob Clark wrote:
> > Add new UABI and implementation of PERFCNTR_CONFIG ioctl.
> >
> > A bit more work is required to configure the pwrup_reglist for the GMU
> > to restore SELect regs on exist of IFPC, before we can stop disabling
> > IFPC while global counter collection.  This will follow in a later
> > commit, but will be transparent to userspace.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/msm_drv.c      |   1 +
> >  drivers/gpu/drm/msm/msm_drv.h      |   2 +
> >  drivers/gpu/drm/msm/msm_perfcntr.c | 489 +++++++++++++++++++++++++++++
> >  drivers/gpu/drm/msm/msm_perfcntr.h |  54 ++++
> >  include/uapi/drm/msm_drm.h         |  41 +++
> >  5 files changed, 587 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_dr=
v.c
> > index 3066547f319b..0a7fc06113e0 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -801,6 +801,7 @@ static const struct drm_ioctl_desc msm_ioctls[] =3D=
 {
> >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_cl=
ose, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_qu=
ery, DRM_RENDER_ALLOW),
> >       DRM_IOCTL_DEF_DRV(MSM_VM_BIND,      msm_ioctl_vm_bind,      DRM_R=
ENDER_ALLOW),
> > +     DRM_IOCTL_DEF_DRV(MSM_PERFCNTR_CONFIG,   msm_ioctl_perfcntr_confi=
g,    DRM_RENDER_ALLOW),
> >  };
> >
> >  static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *fi=
le)
>
>
> Should we also increase MSM_VERSION_MINOR?

Generally I only bump minor for a change that can't
otherwise/reasonably be probed for.  In this case, userspace can try
the new ioctl to see if it succeeds.  And since it is only supported
on gens w/ perfcntr support, userspace would still need to probe even
if we bumped minor.

BR,
-R

> --
> With best wishes
> Dmitry

