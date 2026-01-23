Return-Path: <linux-arm-msm+bounces-90378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cBBcHjLGc2lZygAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90378-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:04:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1A479F36
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 20:04:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF3D53029637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4349E2417F2;
	Fri, 23 Jan 2026 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="goh2bH50"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6CD28505E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 19:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195051; cv=pass; b=c3Qjrfxs7Akl5+1cXUyp1l3KLWIcnTDkZ5f59C+5PLNWEHjMAQVOSuLIrO1uwb2mN4b/n30P8+AlpExmQsyp3162kPOTYhubEC04Rb34WlO4W90JQjX6xmLcGNzbl4DB9MLFFuZQs4VSlyi4EjfJedbmKaxdwMRAKR1TVti95l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195051; c=relaxed/simple;
	bh=K0pAg25bqlKRMqmthJYpJ8RkGjoWdq77pzsvbH/9Sqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ug41Qkfq4kUQQQ4QCEfRscdZnK6mYPgx7NbbOp5rOVWOCsi35nCIjVa4yD5YZlrfCcqrAdVnWkxFniL+n7gk7y2f9OmyHsjXHuq+VxvRLVSDrYjJMae3YgEoLQto89xQQpERu4NBuIL0qSrViMQVx0Ar3iqlGRoS/IIB/rRGffM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=goh2bH50; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35338b3dd31so1216546a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 11:03:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769195028; cv=none;
        d=google.com; s=arc-20240605;
        b=jHE4Gb2lgPoyRiuGq44tGNRTLgbwSqT6E67AmtNhUQZrTw2cvUz9qy7p0t4zePFUWD
         gMmUbsNJFDBaDfmzUGoDjpRthM7dmbdK+U1NWfUoiapVFE9c3q9GCVfR8SIzr9Lft6Hj
         P2oqoDxwuIF/TCvrUNTdsBqqLIoEF3JDIeAnn3KT0bpfm+hJnF+OQeLFV/ujrkrTIVVV
         h/+KNfk0omEYm9wYuMuoVJWg+ypEpLiFaQAjYkBia+z9zlwJSg1dew9rTyBRj3IkVpQ+
         eBKEQhsbRtlMgoy34DaA09Hd1/g/nRKZjW86F388YbUNWjA6/GjcWUZSgQchmmQl4Vgs
         ZG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
        fh=nPI54fk2ylA6LWQidldrlH23QVjxBBfPz0zGqximQBA=;
        b=C3P/X4M6CtlAdX8K3OtwzQTvYVE8tVvaqXP5Fm02791yPCVYpQH+k8sF43Iok4LNw7
         /B0M2JbwdWiNh09VCnicy0VHQ/D3bb/ylpSunxvArfijvcOFEt9khuql2Yg/EOyMWMs7
         zQ+cx+KLPYOUekhIGwReMC21UqOVM8ANkSlOHzB/Gx2tb9klhe+ZHqafZ8arR3UuMwP4
         ieCP5LrzQZYlqdFJrrihMB5B5OQOovZnpdme8EtP0yo/fXC1XdgGFf6IKN4RlV2d/f+A
         /oP+N0tJTwfs4i37rLdtI1idQYXhqLH3IyvKjH6s/8Ae4kG4AgUD8/1/GaljqKQwnjf4
         Lvlg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769195028; x=1769799828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
        b=goh2bH50Ry9Qn2tDkOD1F0/HBv+ASJmF+VyWuqC+Mwui73JQT1SWyAN+ATUPXbX/Ba
         cR1+Cpd9cftGyahxidMmPY5KL7tx24QPdQ7VZBI8DLR61UfzAa/3pWWa0W5ONv35e+Mt
         TaYffu1GEOprfpqxRDgMEXbV+QdKtgTF2WJw9vADfPKcPXRRqC65CJTlPnzJQ7SOhHgA
         X6CF4MdNlZpqb8uSgKOtU5KaVJxOWfrzvysmonN+Ppd8I2S6Fy30rY9myuqSum75X2Au
         ju3T22Z6xTXalBYJerfgFfaOy2p8Ywb9IeJqQYr4md9wtebo0CtKtYmXtlXQ+Vi/Ac4w
         nfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769195028; x=1769799828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNdMOi8yaIIpgWgtclFMzIdtjcYfgL65/4LYK8TeDjM=;
        b=A3wi9gbTRb0sR76uABuE/At6eZIa+/KaBCNDfbjEco3Fc3enuPNl9dERTwZQDbEqME
         qe7Y9CINUvlu5V0dlP3ldZUyqq+OkGz7iHYzufjLJQGFUxg//66lYSZ3XQ/2os93Q6SZ
         vIqTE5yksh6uC3Oc1SOsXLLA46t0ABLKGT4K9SjUIOM8P5qhtf6VIIG/LtBHBtASkygh
         n07Enpz2S3+2xs3op6iTVcJMSq2vqNPwsrHZioT2xvde/ojhu7iaj9SBXHKgEL+Zk7PO
         eMPYjIOzSapHu89OC3GgBqpWtiHDAeGHnMMCybl77pXapfYJZi7qZ0Aa0f+KP085CXhX
         2qkw==
X-Forwarded-Encrypted: i=1; AJvYcCVxo2hFm+Xv9FzA91egQOjszZ6JaCLSU/iV4hLyh9CEdZPRd8DDynLDiUIBppwkSse2nKDLmj8gsPuc1/Lc@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNtRrbthmsOkFeyxuzhe3Ww7Xdtrt1+Y5FdUkyasT4QuW3/bh
	vL2x2XHW6J5Lrk6/NbEJ2V5rHA6CUVO76eue3T/94jnjkrvlSWL75B1oxwYofzh6D1Yb+liFvZG
	0nzwsh9Jfkg7a8FYVOf4yFJmbTrK4FCXCmpXJmjA5XWnF+6Q=
X-Gm-Gg: AZuq6aICyJHYdZptI4lHyRJBTzvWfhyg3r8hZdj0Qd6IVOWi2vSkdsCbpcI8ZKMtRZK
	yZ2R+YJC/BX4bK4cTy4FHsGcBOJ9ZJl9x9nD8JBYNL1gIu1MwKnzDFSe4vDsnXW9mFKfx701OgI
	JdPshrNxU2MOGaxn3eSRrqMaZEMDpeExdYz1TcVL8o/Q5JV6nLf2DOYPWicqPJYNV6I1QNLSFhB
	rnzvyCITKKCbBPOCma2GwoOavE4M7oJ2lo9a+QjOU2MNoMBRXghWK1fO/AaRZPvkcf2GG1UUpzL
	iKNTvG3kLHBf4JBXRJyVWdbdHr/rJSrgwGUuUdPd
X-Received: by 2002:a17:90b:35cf:b0:34c:fe57:278c with SMTP id
 98e67ed59e1d1-3536940db8fmr3166428a91.34.1769195027943; Fri, 23 Jan 2026
 11:03:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
 <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com> <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
In-Reply-To: <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 03:03:36 +0800
X-Gm-Features: AZwV_QivjQ34-CL7g8z5Ds3bC6eKMP2w7Yc-5ipaWGaKWB4sFP-reRfInpFIWaU
Message-ID: <CAN4SLj2QtbSGG6h+iwEFjNat=5xZxjF9r4GRmfePz=tYGkjGMQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Akhil P Oommen <akhilpo@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90378-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 3C1A479F36
X-Rspamd-Action: no action

On Sat, Jan 24, 2026 at 2:23=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On 23/01/2026 20:21, Felix Gu wrote:
> > Hi Dmitry,
> > Thanks for your review.
> > linux/cleanup.h is included in linux/of.h.
> > So it should be included already.
>
> Yes. However we should not depend on include files being provided by
> other kernel-wide includes.
Understood, I will send out V2 to fix it.
>
> Also, please don't top-post when replying to the emails on public MLs.
Sorry for that, thanks for coaching.

Best regards,
Felix Gu

>
> >
> > Best regards,
> > Feix Gu
> >
> > On Sat, Jan 24, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >>
> >> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> >>> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> >>> While there was a manual of_node_put() at the end of the
> >>> common path, several early error returns would bypass this call,
> >>> resulting in a reference leak.
> >>> Fix this by using the __free(device_node) cleanup handler to
> >>> release the reference when the variable goes out of scope.
> >>>
> >>> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> >>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >>> ---
> >>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >>>   1 file changed, 2 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/=
msm/adreno/a6xx_gpu.c
> >>> index 2129d230a92b..0bc518d9fd65 100644
> >>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>        struct msm_drm_private *priv =3D dev->dev_private;
> >>>        struct platform_device *pdev =3D priv->gpu_pdev;
> >>>        struct adreno_platform_config *config =3D pdev->dev.platform_d=
ata;
> >>> -     struct device_node *node;
> >>>        struct a6xx_gpu *a6xx_gpu;
> >>>        struct adreno_gpu *adreno_gpu;
> >>>        struct msm_gpu *gpu;
> >>> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>        adreno_gpu->registers =3D NULL;
> >>>
> >>>        /* Check if there is a GMU phandle and set it up */
> >>> -     node =3D of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> >>> +     struct device_node *node __free(device_node) =3D
> >>> +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> >>
> >> Missing include for cleanup.h.
> >>
> >>>        /* FIXME: How do we gracefully handle this? */
> >>>        BUG_ON(!node);
> >>>
> >>> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm=
_device *dev)
> >>>                ret =3D a6xx_gmu_wrapper_init(a6xx_gpu, node);
> >>>        else
> >>>                ret =3D a6xx_gmu_init(a6xx_gpu, node);
> >>> -     of_node_put(node);
> >>>        if (ret) {
> >>>                a6xx_destroy(&(a6xx_gpu->base.base));
> >>>                return ERR_PTR(ret);
> >>>
> >>> ---
> >>> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> >>> change-id: 20260123-a6xx_gpu-cbc095dbe423
> >>>
> >>> Best regards,
> >>> --
> >>> Felix Gu <ustc.gu@gmail.com>
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry

