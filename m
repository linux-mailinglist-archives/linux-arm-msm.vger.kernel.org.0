Return-Path: <linux-arm-msm+bounces-99935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJdWD/0vxGkAxQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:57:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E31A32AE22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 19:57:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A4176300C34B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 18:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EC7D34CFDA;
	Wed, 25 Mar 2026 18:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dqi8fZhE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TZMvA+bR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD36B34BA57
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774464982; cv=pass; b=KhLGITYlt0jO3mF+3AgkC73oCcOP3SJRmy/K7rfKYaHyuI5Yq5OuscWoTdgDLHe0eOy13xZbFg/fM9BsBK5Bl2CuTWVrK7pPQAYK2nWFTovA7rNUai6X6uVqAHFwhztdv+SITOFpikHKit03BjzbT6O2NIzkRBCd55wDVZVech4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774464982; c=relaxed/simple;
	bh=M5gpeGBdwHqLQIzLfyzmlKhIqbhH0tHgDQEEZ5vfjzo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZ+IFbP8BN3MBQdPB38E32WOj4WwYTjazWCtfd6u/+D4Yp1/RGH4nFZrEtO+qxfJA9v4GBpa8qkqNDfcgPN8RaqIHLVd5JBkKie6e+rMhSQqIMiTELnSypzA00rOkxKR5DFihoQ9j8ZYn0bruteb0yH36ZYF1uehKjvZsjKNOok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dqi8fZhE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TZMvA+bR; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFH6MQ3628124
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=1e2MlX7Q5yGvC4wRUrIN7z7NiBV97AYd7Lbslop8jFk=; b=Dq
	i8fZhEOE4bdDjHrrgnNQW6t+IFgODulEIF3FcQPkXf2Gi60GyZMD3ujRaxwnUwXx
	Ye/p3pyIrfBeV5wNSpUH5zFawDjb6sj1B5UQZKoOPoPrYKoTWDRSdGomUwtA9BcC
	Z5Lgo2JHE46tSmZ2caJauPgZ8lt3rr0BwQ5W7mt+NHbyqCMcn3IVri6gyqVwyChk
	RBbxIlT4h6zcx9UuvOCyV1SSouBYtvIKvYLZ+Dqa8JLqRnyPwCgUrEoyulGqxAt4
	WTfn3Si56k3DW2LiS+y53RVfMwskK448oGEvC9dt/9E+X40lNOd4/WhJSf3zTDnq
	Q05Ee7O+HOTKrKx475iw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dmpt08j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 18:56:19 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d4be1dee67so503781a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 11:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774464979; cv=none;
        d=google.com; s=arc-20240605;
        b=MKMxnISJowRq6LGwiQfKVsh1EJjgS1hgeNRXAIU4bPSoEYi2rPJMnZbG7YE/4gVbDW
         iS7AKHO5ZEyZZecWQ7PCVjnKIP+d3U0J+nucmx5HPo3Kxeq/m3CqtXJ6jni4DgateIZZ
         kAypB4DwlGEZFkpR7zJM51XVZfCuMabAF40bs5ZlbPZ1+q8UCi1Riz8FyPiVYK8Fb+ZA
         lACPqc9gNvHSsNVIm+OSci/57wNVkDsZzHmy5AFcrjSsH0krX02L16tJMjC93BHPnC53
         L2p2PvuQtTTcxRLXrur+HB0FmdVd6XcPJJyJWYCSLQWNorS3Sx3SSY6l9MA8n753TieF
         lcoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=1e2MlX7Q5yGvC4wRUrIN7z7NiBV97AYd7Lbslop8jFk=;
        fh=3X2hTfXtSbo520oTVb6cjhw6uX+jW0KSTQWDT13QyHY=;
        b=hY7fZE0G0p//rMRTypL3haYZ9vKOAFeGmJYIHzCB15hLBIgJ0dYoonk3Joc2sa/qlq
         xKsDBNm3Js0Qpj08eEaCAIFx2LBSeV+AttwZ04jmgAzI4VbpAIh9wUQHxRWc6v2HL+Jy
         cPeLPTgMYHA2LcELumkaMyBb9xQf5i6kbtQO8vhA71nUfIlY6OO9MXAF3ZtJME5CtwwU
         1SLHAq7xud6LYcuxT0h/clJaFLW1loY/jMzeKirV/aaNWT9zdMT3V/m84peCAK5+zCOw
         mSsYnhK9xxu8pc9ANkEBMcekXYssskIC2B5zFdlhaLsC4BJVeg1GoCRMfr781At3yemy
         Fswg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774464979; x=1775069779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1e2MlX7Q5yGvC4wRUrIN7z7NiBV97AYd7Lbslop8jFk=;
        b=TZMvA+bRsrvQRlVnC7gt5sYcA+UtLc5I0HXNhOuR/3AnH8KXdUIpfpauqlBjYN7u8y
         6uwSqgquGGjQX+tCO62GP/ouJER7A0CgSzrJXysoiHctNX3QNa7AImHH+jkbFyGdKn+o
         lc8k12oEzgV7PJkm7SiVHI27huPQb1aGo1boA3xCZwwQITpyoJKUoN1RhtnBMFqd2Q1+
         Waf/MHL2TebDv1kp9YmQSIooBQCXgqqry2CeV4ORdCHv6gxnLnlE+wdN9ORBpKOggZFR
         e79vLavD7rvrhTiGXydAnPRF1m2JqWBMXdNj4vBPiyomjkiSUx8+a6cMKh5KxFFDUfc3
         bTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774464979; x=1775069779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1e2MlX7Q5yGvC4wRUrIN7z7NiBV97AYd7Lbslop8jFk=;
        b=CoaxBPrFSX2Banq2bsSt7IbahSv69g9LaDleA8a2oR7DH74iL81AQTLoQYABN9YHmJ
         6JYVq4Nm9I6fUWhBdHSHCAywa/hdhgujXByoS3XJzUXuG6LLNwgW5eWvvPxqWnxoMSDd
         w7yfFQ4n92nmbzWSMswIr1t4uUGua6wJfEQFencBDg1e+MATL4f0BO2ijGNNi169plid
         V0qzrhug+XEW9OSiNxE1+byqK1iqjdc6LWauuP4sab3iSgxuJjoGtyKD78bQgKxy2v9D
         /dq+7pw9DyC5/0dpH0+iaV+xcbWdAqFfLlUeVgPpKtu6IbnXuzrX7cxfNtN9SSV691GC
         L3TA==
X-Forwarded-Encrypted: i=1; AJvYcCVkqC0GNuk4S9HRF6F+xujTavgxCluVpGVuJsg8/x9FUvRF5bieIdYcy8cvN7e3JxF2+IGMG7JmbbizagK0@vger.kernel.org
X-Gm-Message-State: AOJu0Yze1PopEgBTllNESEVRpTITFpYYdshbzvYy2JLMKlkSsNp8cq30
	u/7jYYiyBUEiedfNS8Im0ruTeW5a75WFRzSR5xSWidCoeTL398vfb8MM/8J8AyYH9a8ZH6ppqg/
	FRD0tkVyAEFoFVfWhdjaSWFrUyqvKHh7ecZ83uVh7zKmSQvdIEivfqaWG9jvgegRmj09GKqmNrE
	qR3RkGgfm4KfuXHphD7pEkZhjqqTsvpgJHfB+/bYYX2Ns=
X-Gm-Gg: ATEYQzwV7YJ4ylC0+mFaLEvTdh0Cv15hZIRDn9GLu1Eomnyb6UX2K81875eiIzcImL6
	5oQnsuV4sJwclw0Br+BRbmv+CcnUWRUcikSDPZQl4o0VNL76g1+VC2JMJ9qMKDywUids1t1QKft
	mKo9l0kryFt/3gEXqKKeGDWl9zdzf+lO6x4XLBaSTyJShfNyR3E8BPmSvLMsmsNl77WryQ/l+mV
	mTpfoxgQBMyYZHUtgZbmdLYFwBwGCEULN48qw==
X-Received: by 2002:a05:6830:498b:b0:7d7:e844:7f4e with SMTP id 46e09a7af769-7d9d677ea27mr2451084a34.22.1774464979225;
        Wed, 25 Mar 2026 11:56:19 -0700 (PDT)
X-Received: by 2002:a05:6830:498b:b0:7d7:e844:7f4e with SMTP id
 46e09a7af769-7d9d677ea27mr2451070a34.22.1774464978853; Wed, 25 Mar 2026
 11:56:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324220519.1221471-1-robin.clark@oss.qualcomm.com>
 <u45hgj7ypgf4jzbqxlaxihskk7gmfy675ez7lcxnkm4mg2sxiu@skqnmucupa5m> <CACSVV02g3=4BqNEVx6aviR_zhe6frz8JHEvW7SgF3bbdwFkQwg@mail.gmail.com>
In-Reply-To: <CACSVV02g3=4BqNEVx6aviR_zhe6frz8JHEvW7SgF3bbdwFkQwg@mail.gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:56:07 -0700
X-Gm-Features: AQROBzAIj3aK3dp0n1ee0bOtWSWXRjR_MI1rtJw_xSIbBPYbwdgK_uvXCOkauIs
Message-ID: <CACSVV03uBvrdG0c8g3dzWbq5TeDXM6K9HGGmvSxMPORBNH+aRw@mail.gmail.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDEzOCBTYWx0ZWRfX30foV8olmx/h
 juzspZCPvkermTAlaaY3Tx3z56vPZYou1gND6s+s/XYl3jnRoV6aABlmVc3pD84doMUb8eqL4EQ
 Ay6jaAg9jidH0sdzkSqwVN07MPL+Cc0vVjt0MQD5KCPMyZ9UX+QhZVVGiBSoWU3BSz1S2vA6JH1
 zwtzAAwX/MSgYOcIr3CQP7Q8bDItW84FK5wuVwjjjc+zP02v1VKwljsk5WLouLEn4oI3V8nfy4W
 v4/+7doa/mLgm8h41aLhM4t9CcjISuf0AnBc7CwYWZBmXlF4U0TKmtOECdfXtEFUslK8yf1+l6j
 3IUwNr03vJ8MqnqN9KgBk5vdrZwSodSYO01KKee8m8SrlXrAa5asGi8xHNXvBq/v7rUFBW4vykd
 0T8HN8u1xodXPfM7hkG4VeRqC/bc22vH/nFFEpO37z1GfXPGblJstDDy8lGxTz4Mqlq5x871nF5
 JgR0r1SnrMNsvRhqK8g==
X-Proofpoint-GUID: M6QD13QIX8wUSyLha5JAlja5q5A5eTHr
X-Proofpoint-ORIG-GUID: M6QD13QIX8wUSyLha5JAlja5q5A5eTHr
X-Authority-Analysis: v=2.4 cv=O7w0fR9W c=1 sm=1 tr=0 ts=69c42fd3 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=H6UpWBCqU9_EBLoxlZIA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250138
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-99935-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com]
X-Rspamd-Queue-Id: 5E31A32AE22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 8:17=E2=80=AFAM Rob Clark <rob.clark@oss.qualcomm.c=
om> wrote:
>
> On Tue, Mar 24, 2026 at 3:20=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Tue, Mar 24, 2026 at 03:05:17PM -0700, Rob Clark wrote:
> > > This restriction applies to mapping of _NO_SHARE objs in the kms vm a=
s
> > > well as importing/exporting BOs.  Since the DPU has it's own VM, scan=
out
> > > counts as "exporting" a BO from outside of it's host VM.
> > >
> > > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > > ---
> > > v2: Fix issue with MAP_NULL
> > >
> > >  drivers/gpu/drm/msm/msm_gem_vma.c | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/=
msm_gem_vma.c
> > > index 1c6b0920c0d8..43d61e0919bd 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> > > @@ -373,6 +373,12 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct =
drm_gem_object *obj,
> > >       struct msm_gem_vma *vma;
> > >       int ret;
> > >
> > > +     /* _NO_SHARE objs cannot be mapped outside of their "host" vm: =
*/
> > > +     if (obj && (to_msm_bo(obj)->flags & MSM_BO_NO_SHARE) &&
> > > +         GEM_WARN_ON(obj->resv !=3D drm_gpuvm_resv(gpuvm))) {
> >
> > Can this be used to spam the logs?
>
> yeah, perhaps it should use UERR() instead

So, for the case that I was concerned about, we should actually just
reject creating a drm fb from _NO_SHARE BO(s) (and report error w/
UERR()).  I'll send a patch for that.  With that, I think it is safe
to keep this WARN_ON(), since the only path to hit it should be a
driver bug.

BR,
-R

> >
> > > +             return ERR_PTR(-EINVAL);
> > > +     }
> > > +
> > >       drm_gpuvm_resv_assert_held(&vm->base);
> > >
> > >       vma =3D kzalloc(sizeof(*vma), GFP_KERNEL);
> > > --
> > > 2.53.0
> > >
> >
> > --
> > With best wishes
> > Dmitry

