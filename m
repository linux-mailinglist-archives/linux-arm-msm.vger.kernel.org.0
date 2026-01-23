Return-Path: <linux-arm-msm+bounces-90374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH8zKhi9c2kmyQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:25:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 104277993A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 19:25:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 950FB301703F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 18:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B44248891;
	Fri, 23 Jan 2026 18:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9bl/xrw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B43284880
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 18:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769192517; cv=pass; b=Y6UP6A9pBa+MelT0E7NP+MwnjCwtfuj0eeQOfcfktiIQKAojKFpIDWnGt/Qkxor1KEHwoJxZBDKo2e6+rzzmz/r5Z7foQCLtvSHbHNzdUZQLmxOz3QiEAeHfPVF8Bu8nJGhr1g5ALhrWTpdi5j0bCXoWAFe5K7uffI1vq0SzaCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769192517; c=relaxed/simple;
	bh=IoizLtGvZzE7EHR7vdfZIM/MBKIm5VtRYDBJ8YCIFr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qgt40wFcief04nCIg+qXKS0EymWKLwi/ea7t0yg16WCGCeK9nrprdetbr/9A6d/DZbzhuH5gprQik6NX9PMqpLYnqxcnhTO1ug2ML6zSadnX/22tidv1X62dWWFYuBSjviu2ilDfhToc2KDX97nJwEeDfEpN0bgvDvrFExy7zkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9bl/xrw; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c5e051a47ddso1641810a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 10:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769192514; cv=none;
        d=google.com; s=arc-20240605;
        b=kVFCEqU4OIUDFxznbzMZm52LSRHjwdU36Hzh2bmo6ojpgi8XUudXXUJEYOPjkuscuH
         EqxAHtrS9Ta1XFsTN1ET5zlMExPuR43XdU834IrZUkjw12wfSLjB0kdM7idn2zAWpwR4
         do+9aoQLE3KDyBu2kTkVJJh4KrAZ9Mvbjc7KnS5V/YNnHC4r5ijNKuC7Aqbfa0eZcR0c
         RQNqEelTdga4Kki2InzRo3GvkmmX3lttB6Fzg4fg7DBX4dozAuvdj1kzshZD9FGCVN9j
         1qlJuB2qgXfE0kkQqydc02A+/AeT4/ZCXvPlvVnJ6UT6fnOhYdMe0Vq4gJU24rudyCIl
         A1LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
        fh=0DcN0fv7FU2ukmzarJWJKheVvdAQCHnTnLDuwuny0KQ=;
        b=j7VIfgfF5bPRZhxroPG2h48BdV74qvxHd8voW+0eXBY/LeghDkUCDyHErCsthM96f4
         qZWsrT8KOz8xobkn6ssHmn1v3yF+gHt8RyFwdHRTvglP51xbxcwrYr6tpLc1rYO3SSRj
         bzwiEvsDBGnGXOGL9RAn8iTMSTdZqYKcbxgJfsXYJI41diEuaxOPpnrG87EGDj6skmap
         oTZJ1ZBVnCWkCfgfRC3um5xObrT2CZrBELCeqFqK0flmMRJi96/9ydPc52XwlcN6qzmv
         juQxb6cGPray+dz+sCYGHQgIjOMWoLylfoIGcH0dq2Tx9fMF4JWtbPXdrEySyb5Pfb0C
         9//Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769192514; x=1769797314; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
        b=b9bl/xrweUh3v2PqBhBRuQ7f1pT13a3M7ORUVmQXRjxdu+Z3fxf9hK9mV5jV1vcpC+
         +8epKi7bTQALagsUMGhc/kZRxX3w/qzLyv1/CTANLP17NeyEXcyRmgVztELmoA+6yHrN
         nCFTHOQeXiQy7s7wjrXEuuqjRjOxj2BYt/A3QQ5VMUT3ub6XMi+M5gqONkqF9nNGFH9o
         iCoG4NOyVQzKUibx2w+ay19+piXTZMwHRKowgrV7kRDum67F3cuC+9fGlvqds/akZOrP
         UorSjJJ10PBuwCJqiKV/3VAqkvdMm/rPfCCqHXNdtnDehSnnX4rGrXujOqjgeMagFUQD
         EY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769192514; x=1769797314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yCV0rABcHHLAJwar86UEQL7DmpIVuCp1PbvDYYKyGWE=;
        b=Mc/EwrlPrSz3NKNrg9XajTu4diRDgCDYrksd77YUqeeOk5+vaTQQRAJDWzsTYAffLU
         MUYP7RFKJkxRoXejDO7/lcp1Y49kdAomQvsVGDtlxifNLqwjMXxVFritpjmivKyVfsE/
         UCh3EDFVDg3v7xPT7shOgFIj2M4ctNIo+gY7mJLLJEkz8y1eTExr/fezIdLaQxQ5FXCN
         udL2DJlPsk212mke45NpQTY0nrf7/162XeIltyxjuk93QqlA54jvO71n+VJ6/F6Gw53M
         EKKxs68w32qJFwnP7G03wxLLFXCksz+psOPKL6/ZX9hL174W2qCzMerzdfE9N94oOU3J
         CMPA==
X-Forwarded-Encrypted: i=1; AJvYcCUez9k2hi/4/dwDXzFwuBRXUr+JLvlBLzILatEIeTRAOkR8cPvInEFUQUkqU1QD2vHhpsM0/vMhwZemp8bb@vger.kernel.org
X-Gm-Message-State: AOJu0YwV6xaKcgJ9hlJ7kRLHyf9d9f5RAavyyIsGBCHxiU9iQO7xWU4X
	AnhEWAMqXufxJL/SHAwjYvFCFlYFUcg8tfhN9IlefNSFhLXR7NPr1l70dx8l1/H1LvnlVeFyd0t
	yKAKgxer+qcpv01HsldYGUicWxuj4LDQ=
X-Gm-Gg: AZuq6aIHybJBxfoik9I8UjtJC5W6Vp7I5Kt3L8G6SR5S9dnZ2WpIUtSA3WwS68nk+49
	J71RJNReIZfjkzQ5Afgn3T0cESPT35N4J2KpkJFDXJscEZGhsrjs/Vzp2XPZ6s6SIBUNG+hrtcM
	3HgN8q29rw7eqtm2GRDx795YkEoGp79gQ9Vq46KHGWmDtANjfzXdtloV5mk6UaSb3p8fglocxqZ
	wUscK6xPJnKdIus2IvFgiVyQl6k7Sha8oyhWFoPYKrUttr1bpWSNKMbBHHKvogrKxOzvUHX7yFX
	qpVBf/0j6Omnj6PMAfTCRP6J5Yv7/w==
X-Received: by 2002:a17:90b:5190:b0:34c:2db6:578f with SMTP id
 98e67ed59e1d1-3536885694cmr3448666a91.19.1769192514010; Fri, 23 Jan 2026
 10:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com> <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
In-Reply-To: <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sat, 24 Jan 2026 02:21:42 +0800
X-Gm-Features: AZwV_QiUVgt6zT7LCvtUzjgnH_aqDOORlzA2yXQGNZS9mCONN_by2qCehnk_F_w
Message-ID: <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90374-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 104277993A
X-Rspamd-Action: no action

Hi Dmitry,
Thanks for your review.
linux/cleanup.h is included in linux/of.h.
So it should be included already.

Best regards,
Feix Gu

On Sat, Jan 24, 2026 at 1:58=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
> > In a6xx_gpu_init(), node is obtained via of_parse_phandle().
> > While there was a manual of_node_put() at the end of the
> > common path, several early error returns would bypass this call,
> > resulting in a reference leak.
> > Fix this by using the __free(device_node) cleanup handler to
> > release the reference when the variable goes out of scope.
> >
> > Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index 2129d230a92b..0bc518d9fd65 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >       struct msm_drm_private *priv =3D dev->dev_private;
> >       struct platform_device *pdev =3D priv->gpu_pdev;
> >       struct adreno_platform_config *config =3D pdev->dev.platform_data=
;
> > -     struct device_node *node;
> >       struct a6xx_gpu *a6xx_gpu;
> >       struct adreno_gpu *adreno_gpu;
> >       struct msm_gpu *gpu;
> > @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >       adreno_gpu->registers =3D NULL;
> >
> >       /* Check if there is a GMU phandle and set it up */
> > -     node =3D of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
> > +     struct device_node *node __free(device_node) =3D
> > +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>
> Missing include for cleanup.h.
>
> >       /* FIXME: How do we gracefully handle this? */
> >       BUG_ON(!node);
> >
> > @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_d=
evice *dev)
> >               ret =3D a6xx_gmu_wrapper_init(a6xx_gpu, node);
> >       else
> >               ret =3D a6xx_gmu_init(a6xx_gpu, node);
> > -     of_node_put(node);
> >       if (ret) {
> >               a6xx_destroy(&(a6xx_gpu->base.base));
> >               return ERR_PTR(ret);
> >
> > ---
> > base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> > change-id: 20260123-a6xx_gpu-cbc095dbe423
> >
> > Best regards,
> > --
> > Felix Gu <ustc.gu@gmail.com>
> >
>
> --
> With best wishes
> Dmitry

