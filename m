Return-Path: <linux-arm-msm+bounces-99890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPAMLvP+w2lXvQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:27:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3170D327F05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 16:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CEF3731853AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 15:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 047D53E6DDF;
	Wed, 25 Mar 2026 15:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QyWLm4OJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XL2TWc4I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2ED396D0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774451861; cv=pass; b=aQP1lF/hn6UKSV7GcVrazhXpr5kEmIWPj7hByb81w2Y6Ni9mmfixF492vTbU8E2UZ2vaswhrrDZgaPAvdwQf2fbTwY7YW23lPQx++h0BbYfM/t1pMi7krdQPvYaLTZEr55BbBs7/MH3ijPI0XeWmxJX1pi5vkEx20ZMVEh25IbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774451861; c=relaxed/simple;
	bh=3Cm6k11K9bu3g4PG6o3HhxeHGzUd+8T/2xEZsv2XO0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OYBB79xfAYciyKSxtqA2S0wOdUYhDvjJkuZZpz49uMA0YGgNsxYdg84AnAM1SGXMQiFsO1EXPxrh4gR7U+2KaMHoouVhdwLVzlDg8bDNQGiDMToob1SQQMZnlsdbzkc0TppdUxsJH9O+6K7BPLUlgEMrNXtQCR8uSLGeQPBSv/Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QyWLm4OJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XL2TWc4I; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH5TA265571
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:17:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=qIVcfQ0TGWgvjXq0OCDlbAoWHyoRDZrDfX+tWrwMbdU=; b=Qy
	WLm4OJjQ1bx33Pw41uggMemnb31xqDbzCUjX/sQobnZY6pLGl2vUDo+tc1VFW11j
	eiYjDik0JEpn9nJ+FAHpPPhu/AdxwfBOZse7RkdnarhiR4dMj+8KZFzI8qHLSKLc
	BNcCi4j5erjLjmKM5IA5H4kqK5d5tyyAVDjtV9ljkPwOyxB5dM++VaEXlNidCu4g
	Llp7fks546U+SGFJ3W/Xy1PooKk1siYz5PmqcurX+9avCKEvtjMycYLcJw0qYTnI
	rUpCBKg4DFg42VnuKxkcMWKvinnQQYET9HGhrpkegHelvsD73+lFgAaUBRHTrSn8
	Q5iF9Vsk995UIhDVXTjA==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40rauqhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:17:39 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d9d3230cf8so3182594a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 08:17:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774451859; cv=none;
        d=google.com; s=arc-20240605;
        b=Db8xZ0YSWbpauEPqiscAYQ0RAoTM+e9BWRAf2MU6EkqdS89k8nxqvJi60pNJ0lhdxT
         bJkDKkyFOolaLrEMg7K+vfwU3eWoLVuYsXxK2eDcUc80MfKW3C+LqJE/7s796glIPFmh
         /zCrI6Pu6iXpHPXY1ycsnvUZs+Up//DXyRY9M3FrHHb82gCls8QH1w4PTCJpSZ6bDxBp
         No/lPk6Rbtcc5XRu98H2h394hZIhV8ioraF1PFXSFz6LpuOPm43rgX0X/NahSwUNXwIY
         E/EX7ty/7wnIc4YcAtB4lCiUhcjUABSX5pHZKRgNVxRAhwAVLbEmqpSyYINg1Cbpvr7T
         LXhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=qIVcfQ0TGWgvjXq0OCDlbAoWHyoRDZrDfX+tWrwMbdU=;
        fh=e1jBhe4eF75bXXznIaafdR3AmTWdobprEDQVE6wCf/g=;
        b=XEAoei9OZBf05zkWk8Er9ghhPeW3kjpdr5DIx0vfsOfR49x9tNi9BuM30QlV+Y1JKj
         e1lgVfjabjlSH5PB4tbzyoZEXzjbvgkWc32/gUDYdqmBXhYEq3hcvn5gnsP4NoP4dTGa
         okSjchLpO/2PGSgZezPKylztOnRfq4zQ9OD2mTSJgZwjy/dMxAn9/hUMLK7b/47nL4fT
         FhYz5T0VWFYxWJ9qIBb720t/m95LhO2Hop49Ko1Gc/+FudJmWc4NLDj77N13Q0lz/VKT
         E0Mdd83O4QZyLEQPDfsJz4oadtZmIrf3g1awK2j2yGF4IVN333WjBLLf/wVxRQPVuxkc
         Kj+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774451859; x=1775056659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qIVcfQ0TGWgvjXq0OCDlbAoWHyoRDZrDfX+tWrwMbdU=;
        b=XL2TWc4IBvb5M2/Zp+WSKkFUXSpEgOzDjKLTk6MlU1/9QdEhM4nBQhqMP2/KMiDwfS
         v3TtQQgSgCTm0J6q5PHp4P6HAK1h/b4ZRfxkpTyb7QWyHvxy4qGcTyOSNQXoTSK9bYDR
         RIKASb+2UEwMMvVAj6GfOQAoYadzU1Ki4mGOj5vYgjdLw8kNSD8l5860ri1ZG2nLbWSz
         MaCyuRlhJe8WeF8NAj000/6UJSauM+tmh+ztKodpBHB7B9a0MWYnTOovPEwOIyD0Ov9v
         QrTpLBWE3tpclEEGsxiYmEB1I/SWyt9a5oBCd60Ew8XSkk9lzGQ5cHDCcDXimnCOfd+/
         u3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774451859; x=1775056659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIVcfQ0TGWgvjXq0OCDlbAoWHyoRDZrDfX+tWrwMbdU=;
        b=T16w8EgdV+GszeYwIjUZ8glWsy/DXXByYC7TgbEhA5eTplT+6rQ9PUOG/PSrqsykS9
         IyG5KpLeAedgwKs+/6zTobj2w8+ftIp2ZRS6uH47DPlsP+hSpGacmmvNhRU7wo7/HlvG
         4jMMRFGIMC5hHYqg4/D278F57y8RPpHGimlGjrMdPpYZESdFinuY0n9nueNEsPQOMWuM
         QLUqTGmFTowk8ibvOH1szoI8c964vyCiInjXSyMoQYkpH6FX6W0mgcSm/aoG1HO3hf9C
         roKPI+uzfoy/gf9SNp94CVy1iq/Vva2+KsmFenuGt5v/mREP6XJ1BwJosyVflRaIBAnx
         30oA==
X-Forwarded-Encrypted: i=1; AJvYcCWtamCCm6xRM25swtnDWZbwSovOLn0FRYiX8SmT982SeEpHSqQV20kmXnUiLNzBkWx+bFDkDvFuBQHd5goT@vger.kernel.org
X-Gm-Message-State: AOJu0YysSiE2MYn41S98ua7xTxuqmsXVwdvFDiE3TX7WaKwetkk2roY7
	+52cg33bu46jIIXRueBlh1RF0lokvp/HHXDtGFiHv0nlU8u+SCKU2tNUpAzcuax2M1ESVam+3Xu
	24cy7ZN8f21g4c/o7WkVEEUJRiCmuTrVuhoy+94fNKvnv6R8+REbpoo8sbJVAcsWSsDVC75Rh07
	5HQiRfaRgr88iRBCTeU0lgZ94gs/p3hk+P63po0pbLseg=
X-Gm-Gg: ATEYQzxZR+ero4oENtSvme1s4eHoX02RuSY4l2pOgqWf10M7OqsrfAH1j6bLmLL83E7
	taAe+mhGnWmLZ4WN3x/Dku8JyRiwdkJmDtTTxXned039/pTw8OfmchbuaJV/GAPWMzIKvJPiOXb
	ss+20+LkXytWlP+9o/op7z1NX4uW0n0mV3RRGUzHiCxDMuO+fUMMs23pV0eV7wYC1WkAnCQ2Jk4
	7D8h7Sytb9oFk9e0pUWOwFEgsEpSs05yoqEwg==
X-Received: by 2002:a05:6830:668c:b0:7d7:ddb9:670c with SMTP id 46e09a7af769-7d9d4f5f0e5mr2258457a34.9.1774451858994;
        Wed, 25 Mar 2026 08:17:38 -0700 (PDT)
X-Received: by 2002:a05:6830:668c:b0:7d7:ddb9:670c with SMTP id
 46e09a7af769-7d9d4f5f0e5mr2258442a34.9.1774451858552; Wed, 25 Mar 2026
 08:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com> <u45hgj7ypgf4jzbqxlaxihskk7gmfy675ez7lcxnkm4mg2sxiu@skqnmucupa5m>
In-Reply-To: <u45hgj7ypgf4jzbqxlaxihskk7gmfy675ez7lcxnkm4mg2sxiu@skqnmucupa5m>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 08:17:27 -0700
X-Gm-Features: AaiRm511hktueHPP5wRku9HWF-2ua0STDOZ1QHKDvPthw61tGoVf0ZqaxMAmJxQ
Message-ID: <CACSVV02g3=4BqNEVx6aviR_zhe6frz8JHEvW7SgF3bbdwFkQwg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm: Disallow foreign mapping of _NO_SHARE
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Jvr8bc4C c=1 sm=1 tr=0 ts=69c3fc93 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=bNE71Ysd2Sgnr7TPTuYA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: GZsRaejzF_WJuWzjM2m9ToaB4188JvCm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDExMCBTYWx0ZWRfX5ExvFrUpBxdD
 9ZoMECMMEQtC2ZonwO/kZvmadFkVAbq7ZZGb05bv/6BsG1XA60oEVko33T85UKNZJ+jYx9r0OjA
 tD7bQGOOGuT8IQbRcLAxplyw4CyD9FJ3BafyS+1/OTFPUHxY+jbLpJLluKALqxr0ocDyGFVOxBO
 hfIQSoDVcWP4/tJqX63oVbR8gE4NTadAHhgujOvl9GRosZq3Yc5cLeI18AhxSQc8Edk9Pz5zwmO
 dy4zUwomtrLdNw5imprlVerzAN5Q5xbyNY5KNsfLnavmdhoRDgRAGpvky7J92UtgxqmVTUcf2xQ
 BYBKYidN3k17WaUNycE83UZunAX4x8DMRaEGh+rj36eUymQ/CrmABZQV6RLZD20PotuNmE3WCr5
 TpfzdF8tuxoqoFXjDxHpKjD7YhMhWQ+sJfKbnLdV1rxlLOCaTfMUGAwnu0ihnx7INNw+UMu5x50
 aGdvhdxpi8+/mavPTIQ==
X-Proofpoint-GUID: GZsRaejzF_WJuWzjM2m9ToaB4188JvCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250110
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99890-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:replyto,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3170D327F05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 3:20=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Mar 24, 2026 at 03:05:17PM -0700, Rob Clark wrote:
> > This restriction applies to mapping of _NO_SHARE objs in the kms vm as
> > well as importing/exporting BOs.  Since the DPU has it's own VM, scanou=
t
> > counts as "exporting" a BO from outside of it's host VM.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
> > v2: Fix issue with MAP_NULL
> >
> >  drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/ms=
m_gem_vma.c
> > index 1c6b0920c0d8..43d61e0919bd 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > @@ -373,6 +373,12 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct dr=
m_gem_object *obj,
> >       struct msm_gem_vma *vma;
> >       int ret;
> >
> > +     /* _NO_SHARE objs cannot be mapped outside of their "host" vm: */
> > +     if (obj && (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE) &&
> > +         GEM_WARN_ON(obj->resv !=3D drm_gpuvm_resv(gpuvm))) {
>
> Can this be used to spam the logs?

yeah, perhaps it should use UERR() instead

>
> > +             return ERR_PTR(-EINVAL);
> > +     }
> > +
> >       drm_gpuvm_resv_assert_held(&vm->base);
> >
> >       vma =3D kzalloc(sizeof(*vma), GFP_KERNEL);
> > --
> > 2.53.0
> >
>
> --
> With best wishes
> Dmitry

