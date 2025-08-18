Return-Path: <linux-arm-msm+bounces-69586-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A20EB2A4BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:25:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 18B1F4E31BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F215532A3F2;
	Mon, 18 Aug 2025 13:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgkubE49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DA932A3E7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 13:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755523113; cv=none; b=OJ2MG4U4jWN3PljGc3MioxMA82vm0JGrnoH9tbyWG/XHTlHcUQv8ZIm49sY6PbocsewE9JH/JpeZgBDYkE8oWCvt7/LvybIyursOdeEmLsjmx2de8gnegTv9PPdlak5yZ9/YmrRbRJpYkyBVHMQua+MoSrBvFGp2x9U21zZC7g0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755523113; c=relaxed/simple;
	bh=nD4WjbGJdw3kZOukN10XmnnKhQqpuiYa2alxhLucS2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBtaRMzxLfHYUWJTRlvYdyieStuaOAFhrqKwBqawhWxPmGEExqyIX6CDwhPlPezMmVO8HD6L7T4JevFt3JWXOO5fYJJizN3IRAGeXAf6vdMJf50irIiuHTNSGFsEAC7eGPs9BYZqpb6Brzeskf313BSwv9SfUwms2x4stN2oNRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgkubE49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8N8HS030849
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 13:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=uAqSYAJyc6fudwrnw7aEgAWXtSLsyi9zS9YKc9k28UI=; b=Og
	kubE49ddQr+RVjC0zLPjcLMSYsoaZ4ngHP5tExkWKwoWTgi+jaeHJu0JOqNMU0Fk
	ytIztsUG9m8+ufTEfE51/0IXZmoyML88+Yp1m1dWeVjuof/g0qcCtRmY3zJAaOUs
	c/AoHmqycXNWNag0FKtLqwAMbRghcaHvm9lGBiz6zziGYCreqyblA8yDuLTAvXBN
	1tIzIjOG2EsXrFfuJqHnaBJ9RxvPYdL2dlois1UNOxqREom615QtZl7x4IG2N0ul
	PNZrayfj2lg+pNoGVQxZ9P+KYiNOIv+Y0cNaWZf9poL6B0k0H3dxAiS9/3vRadwI
	TNveSsdgxbrvz66pjqrA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjrfvryw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 13:18:30 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-74381df1c24so8169482a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 06:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755523109; x=1756127909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uAqSYAJyc6fudwrnw7aEgAWXtSLsyi9zS9YKc9k28UI=;
        b=dFtOAuNqyhpyGSabgLvvbp2C5Ttt8pES+S+GhjtFamwgv2QEqFzj1cq0u0DticSNaM
         9SGHTd3S15rF6YjObRlsyZyqmYypEN69n1IkldTIGOE5WgRS2DIP1j21BObkN8I3gbdR
         5B4Ne55SVUVoH6y103uhuktDaK88keFSUOhzy7v+FbpnP5FVhxqWU6fNQPGmez2Rw55s
         IO+zVioZ+i6DL4DunOVlTuDEFXzlhxLDAAeWc49PtiUo1XqFuWnw672a1B6HAWo11j0P
         lteN6E0mXLuJmnIjL4jc7O2LCcqYkeouQ6kt5XvmOA7mchzBmIgnpl7TvQjXRCvZWD4C
         q7TA==
X-Forwarded-Encrypted: i=1; AJvYcCUrSE1LEflsi/OfuT0LK4R3M9YQ2hTTgwfgmGAhSW9dveEOqUzdS+cbaIOnRbMTGWLqybRw5NGQuAUBM58b@vger.kernel.org
X-Gm-Message-State: AOJu0YzV1R0PsvorAWxWMzqX+89CxcTkKWjJ59nAmp0o3qojG/VCFgLH
	992cH0YQkXeSHptxwbQ34GixEGk8Kh3whUmZq653f919NedFuvwb83ojQuGi/WZK3RxW8s9PDWI
	DajeOKj5GxBujmfv4q3FGisYTrqATNPTurhdXJb55KBdErkOwUc7t4JEj0p+Hkd9awNjZwrt4Ms
	Zogs3mMpUiExqcR1r4dIQAwY8tOvKeVxhvEPKcKiFM2sg=
X-Gm-Gg: ASbGncvCcCURQdRFUlQ3DHNrZ3rwsE0u1bO1y1if6l2FQxRIKpgiFEpP1ll2IA+2ll6
	7kibGm2goQLdywqSvR9PUSB81RpMP67bZ/XDmpfMeORw4u8hjkmxRSTtceL+H6IACmTs2TF8doe
	r54c46MpKidLuWk7W3Q6Y/qq7aXSm7iLg0aO5MKnIVFJ4qXo7SPxIa
X-Received: by 2002:a05:6830:2aa7:b0:73b:1efa:5f40 with SMTP id 46e09a7af769-743923c5666mr8065601a34.10.1755523109211;
        Mon, 18 Aug 2025 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrs0mWeBrCCfWhxt3WgLSgIDxLQ6Kc1gX26Zji/sZVYHQF86VSLnVDmuBOOzeWaaZ7/d1hEb9Nw7+/Ihh/Pb4=
X-Received: by 2002:a05:6830:2aa7:b0:73b:1efa:5f40 with SMTP id
 46e09a7af769-743923c5666mr8065579a34.10.1755523108735; Mon, 18 Aug 2025
 06:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813-unusable_fix_b4-v1-1-3218d166b8a8@gmail.com> <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
In-Reply-To: <272d2a39-19ce-4ac5-b3c6-3e3d6d9985c5@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 06:18:17 -0700
X-Gm-Features: Ac12FXxrj6x20sKrGWwLUDNi8HYqMcVUNVM5TGMtv8mw9iPJlUONr9yAcK4nzW8
Message-ID: <CACSVV00Yo=cZxUztB5Jf7153bsnnuATrh3L1utw4SrOQmYERug@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: skip re-emitting IBs for unusable VMs
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Antonino Maniscalco <antomani103@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: E1G-hGXaDnlicqMnIpqeXKcKyaqdawys
X-Authority-Analysis: v=2.4 cv=YrsPR5YX c=1 sm=1 tr=0 ts=68a32826 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=3oEuPgIEOckFOmJ0i24A:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzOSBTYWx0ZWRfX8S2NcPeVuunj
 oEzCY+W+/1Owf+7qybwD/w1eM6s6mZ4rCNugwcLtiP5mjmSgB/zznp0R1CE8Ffwvfvr40N2aBjd
 XVf8rSg4iiPtlMdQ/ydobHso2mkfWVtB/d+gc5z6M+e70SpGsYBxrsQE8Ma9kFYdA0v1hUnVT58
 ARG+wcCjea6GPvH7SusiuYprNqHjfBCJA4sPkJ5BWGwz3Sz19g0ntfBjQn9aVL2skuWhV6qezRF
 6R4DO/smrSpEXhRS/CLF9TjATvO4YqSCJoq3NqkzPpHUCLU1DH1HgHMO+bn/vI00oPScb9Julf4
 N9UQH61Rf8taT0yqnc4t/6JJxL2YFsgWj7yeOW+DMD9mmn8xVPF4a+pnRcAVp6mGqhKyAwQG0D1
 xbMY+eXq
X-Proofpoint-ORIG-GUID: E1G-hGXaDnlicqMnIpqeXKcKyaqdawys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160039

On Mon, Aug 18, 2025 at 5:10=E2=80=AFAM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> On 8/13/2025 6:34 PM, Antonino Maniscalco wrote:
> > When a VM is marked as an usuable we disallow new submissions from it,
> > however submissions that where already scheduled on the ring would stil=
l
> > be re-sent.
> >
> > Since this can lead to further hangs, avoid emitting the actual IBs.
> >
> > Fixes: 6a4d287a1ae6 ("drm/msm: Mark VM as unusable on GPU hangs")
> > Signed-off-by: Antonino Maniscalco <antomani103@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/msm_gpu.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index c317b25a8162edba0d594f61427eac4440871b73..e6cd85c810bd2314c8bba53=
644a622464713b7f2 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -553,8 +553,15 @@ static void recover_worker(struct kthread_work *wo=
rk)
> >                       unsigned long flags;
> >
> >                       spin_lock_irqsave(&ring->submit_lock, flags);
> > -                     list_for_each_entry(submit, &ring->submits, node)
> > +                     list_for_each_entry(submit, &ring->submits, node)=
 {
> > +                             /*
> > +                              * If the submit uses an unusable vm make=
 sure
> > +                              * we don't actually run it
> > +                              */
> > +                             if (to_msm_vm(submit->vm)->unusable)
> > +                                     submit->nr_cmds =3D 0;
>
> Just curious, why not just retire this submit here?

Because then you'd end up with submits retiring out of order (ie.
fences on the same timeline signaling out of order)

BR,
-R

> -Akhil
>
> >                               gpu->funcs->submit(gpu, submit);
> > +                     }
> >                       spin_unlock_irqrestore(&ring->submit_lock, flags)=
;
> >               }
> >       }
> >
> > ---
> > base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
> > change-id: 20250813-unusable_fix_b4-10bde6f3b756
> >
> > Best regards,
>

