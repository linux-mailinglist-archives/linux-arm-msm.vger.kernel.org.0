Return-Path: <linux-arm-msm+bounces-85990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A140ACD2469
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 01:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52F5C3018F7B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 00:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71D6222599;
	Sat, 20 Dec 2025 00:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrCFVGtP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1VHaauh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138761B4244
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 00:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766191370; cv=none; b=b1tJ6GVcUX/q6JqcKBtp3pGogz/T4B6i/OVSNoAXZYYCytKWrg5RDtgCW6h177542Dz1pZMXvi2qIzIZ5bnKde/KmdHjUme8IdILY5HMGETOdW6RfFfk8nnDo1xf6Xaj7/1npPi8XbnktmTgo6MHJJea4hN9uN1dsxj4O9fv7Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766191370; c=relaxed/simple;
	bh=St7f4yH2R0SBE/blIjn999QcxvQeyX1XLjZ3C5ODOxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dvGBl08vsx48xcWd+R9mM0z4L/gpHXdJm3nEacmIPWopT+JD/phroErgC4Li5ghvN8W0ze5Q3hEGn4AG3c/xssuQqW5l1Yt3wG0mcF5PY6oKt4+Wduduai+FaNHBbcVu8ExAkndl2v6y2FJtSkOX3zJ481Y8u5TySKYhf8D1EBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JrCFVGtP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1VHaauh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BK0gknm2374440
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 00:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=; b=Jr
	CFVGtPYigp2xekdP7NSsVHZw4ZM8O+6A+55929D2nwL9taxUVeadc98/08DQ6atw
	K0iFclY6I8x39qVt/1irZlJFKWef0alBG5nU9LeYq07HMVSHGQ/EAuk2FBTlk6z5
	ONT/Xk8buEtv4aRA/0E/n/3YwlDTvcX5AdxKKEDXy8Wls3jbmkNF5xTlQ5qsEgRJ
	0+l/uc0EjO18aRxE3iWL6cIMLzufyFDBs69Z7pjHzUGurogB5D0cw5wS4g8A7pEE
	IYzjaiURIUep4lwPZMKi25mSedKmd1KuyBSB6I+hFjePHeR7lNXahrF+N6l4szEs
	ujPBJmaARXDXOZMOlbzQ==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5hgd800q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 00:42:46 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-657486eb435so3145209eaf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Dec 2025 16:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766191365; x=1766796165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=;
        b=M1VHaauhorSS1aoH+JT7gfazJer6Y/jSW6o+VtanEtT14zRwANQZp1z0Qldwsv3l9U
         jDFnwFZFqVT31gAJEhoF7AG8ew28wAoOhTYh9yC2aVabpG2C3D9S4ci5KeejGkUyjALS
         Obc/PxIjv7k7iPAA20I1dq4cuzW16yqVHc3bNhIqenOzzECHd4rlDOx5zYe488ke93Ev
         EIE39PvInaVsqO7KLdIHGLSxCc/En3QEBlGvc+3QM1m6+7iIq1J5jVhi8z32sF4tlPZi
         Taln+JxfU6b+dukd8k+YDJIdxV8iuR/Ri6g6g19ACuUfq9TNJeDMLHu4NTSkm5THuMWk
         RFFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766191365; x=1766796165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JOGt5/7g49gJezpOEHrF48C/QV2MS3EEhUzdFDmEb1Y=;
        b=dbKog9GDpA2boaCrttVm1TxK2RlV8g4Wswr48FfExljEcQ3IyG77z10XeYEfO5fjRw
         keJCbUjLP4MJZsa6Iua5xdWBZMG4OgHUyARO2lK4g2kahClxyNb9OikmYUtPOlFY5bSK
         Rs79A2+aFDHGYUY0Xqq3EpW174wYDnA+pBT/xk9G4+zbI1TnCwxVzlk18V7fPmV9vEiC
         leAlJ2PNP3TtVYNXQmOkPwvSoeS4dc44JtrbQWXX1LyZlfeZ3HLI9G1ZS76NfCnhudhi
         xNCIA97C926BuKjfMbmNRSYDNszJiBvge85iPkgjXOD4wSEt1q6GO9oNazG9AG5YrrdP
         GQMA==
X-Forwarded-Encrypted: i=1; AJvYcCUrADr0GhdeY/Zup3DsOgeMX84e0IYOoP+MMp0v3/WqU7djscSWA/l3S6zYKp6UP0E2In5O6h2a8WIx5lym@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bqkCIBD7dWZXrVdMx1TYlEpJmtz/dbf86KRAA9nLVojJveUO
	KFppVZRWfQv6jkyVyuLQMHj6AojG3xfOYTZ/pmVjugsUVocuGPkKjximqo9J6stD2V6M6AaGte9
	X9XkM6aY3nij1lWk3lDhxhJEgyArn9CRqsL+eOVuSuONCwhXn/KV/GbItZTE6yYWSbDCSonFC75
	90vyWrZJi666M2+U1mqIUskRUEDb2p5IbeiKaLAxu642A=
X-Gm-Gg: AY/fxX7Lh7rqIyqlPM3GRNOqomgqKuhizJKIiZUMNUC2XP5w1zNxkjXROrKRiz/DG6S
	+vFx1D1VgUkYAulKL5jJ/R+a26mcDLe5zPMaQ+L0kM6uqrtM+OgDEtoOXDLlewiSEHYgRTBxcU0
	kTaf2jOkBCMSSt7UjpPqjHjIwDysNc3g7zfNUNCmcsGpEdwcuqHEHKA1olVf0CK0ae5A==
X-Received: by 2002:a05:6820:a93:b0:65d:4d4:e7c4 with SMTP id 006d021491bc7-65d0ea9d1a2mr1335941eaf.38.1766191365389;
        Fri, 19 Dec 2025 16:42:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHfWlogR9xBl/XkUR0V/unvcetOQiM2J5qVYXxc3t+LBazokeb/IMmWiP8Yax26tVKm3/hUS8y1D/qy5l0k1bc=
X-Received: by 2002:a05:6820:a93:b0:65d:4d4:e7c4 with SMTP id
 006d021491bc7-65d0ea9d1a2mr1335938eaf.38.1766191365068; Fri, 19 Dec 2025
 16:42:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117132516.18834-1-alok.a.tiwari@oracle.com> <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
In-Reply-To: <c97ee966-5864-4be5-9e6e-afc8a93dab5a@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 16:42:33 -0800
X-Gm-Features: AQt7F2o5phxtrNBceCPYAwCNEcUUmU_OixULB8ukBXOVsyDFaPSHw7bt6s4cKtU
Message-ID: <CACSVV02h-51_YvtiU0yS5UEpaO7NsjBMOyfMbuF2hk6=8oMfig@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: check state before dereferencing in a6xx_show
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Alok Tiwari <alok.a.tiwari@oracle.com>, alok.a.tiwarilinux@gmail.com,
        jordan@cosmicpenguin.net, freedreno@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        simona@ffwll.ch, airlied@gmail.com, marijn.suijten@somainline.org,
        sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
        abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: nSjIgBODZkSb66n3xGC9vroLgMsw_3Mx
X-Proofpoint-ORIG-GUID: nSjIgBODZkSb66n3xGC9vroLgMsw_3Mx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIwMDAwMyBTYWx0ZWRfXwjcEDHhWhqm2
 aiIiU4u8CNs04ONWYQI0cUgHaVgMS21kwsbejSon57tcawC6M0ymKKGkT+9xxA9w0Q+haZ4RSjH
 a4A0Yiit2uHAoeaAhdW+X5te48Xn38qxGkOVskEP4n7Ph37DawVM1PLNM9j0UxoZ2BB+30SnsiR
 rlNyonkvTouE3zTEx4oJJX8JfZ3lrz1FY3q3OWooIxSCiw37pFP8U0zEh5mTZxrUlzWVBuMAnzP
 DidicMQ7qe1CjBAxsx5F2MDr2JPeEpjL2Tn+f6Bv1XqCz4Flgc+vPDvq7rI+VkTUyJz+9y0CsSV
 kQ8Nef+cA0Sak5n/8BoTAGXoFGBPtnlLegBR6siQFMk/CPA4lZtQVi2jmRbnI39Mac3gHLrR83F
 RA0D6zcigaaMHtebeCTu5sMhR0nZMxmXPAKK65wmZ0XchDiDbKxneFXKFu3e6WMp8zxQBXc+L0V
 Awvg5/q5WKSFYwnlvgw==
X-Authority-Analysis: v=2.4 cv=dMyrWeZb c=1 sm=1 tr=0 ts=6945f106 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=yPCof4ZbAAAA:8
 a=dNUZgOZt_aCjTAHcu2AA:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_08,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512200003

On Tue, Nov 18, 2025 at 5:57=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 11/17/2025 6:55 PM, Alok Tiwari wrote:
> > Currently, a6xx_show() dereferences state before checking whether it is
> > NULL or an error pointer.This can lead to invalid memory access if stat=
e
> > is invalid.
> >
> > Move the IS_ERR_OR_NULL(state) check to the top of the function before
> > any use of state.
> >
> > Fixes: 1707add81551 ("drm/msm/a6xx: Add a6xx gpu state")
> > Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/=
drm/msm/adreno/a6xx_gpu_state.c
> > index 4c7f3c642f6a..e408e1d84ade 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
> > @@ -1976,14 +1976,14 @@ static void a6xx_show_debugbus(struct a6xx_gpu_=
state *a6xx_state,
> >  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> >               struct drm_printer *p)
> >  {
> > +     if (IS_ERR_OR_NULL(state))
> > +             return;
> > +
> >       struct adreno_gpu *adreno_gpu =3D to_adreno_gpu(gpu);
> >       struct a6xx_gpu_state *a6xx_state =3D container_of(state,
> >                       struct a6xx_gpu_state, base);
>
> Are you saying that this container_of does a dereference?
> I don't think so.

it shouldn't..  but also there is no code path that reaches here with
a IS_ERR_OR_NULL(state), AFAICT


BR,
-R

> -Akhil.
>
> >       int i;
> >
> > -     if (IS_ERR_OR_NULL(state))
> > -             return;
> > -
> >       drm_printf(p, "gpu-initialized: %d\n", a6xx_state->gpu_initialize=
d);
> >
> >       adreno_show(gpu, state, p);
>

