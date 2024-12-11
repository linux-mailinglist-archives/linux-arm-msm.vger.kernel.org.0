Return-Path: <linux-arm-msm+bounces-41397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8D39EC3A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 04:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F25F285EE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 03:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E1B217705;
	Wed, 11 Dec 2024 03:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kc2cuFuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F15216606;
	Wed, 11 Dec 2024 03:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733888613; cv=none; b=Lzi/Rlbwj10reobTn6gIyO5gwjICHNouG9E6ZeUpXpFRbvQrWdjLcDwB5DlAgwMbloMwQRiJjXQRMv4AYoZGw5LuPa8Lle4wQcN/NjZNpXYpnS/NzreOkHfmQ7y3RSpAl14CmzznSb377gxghrXJMtGDacZk4kVGeHNvWJ479Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733888613; c=relaxed/simple;
	bh=FvFYPTnLGoS3l29r5HECoJIln4Fn2udEW3QBykqJqx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VSeGFTr0CBvusb5T0o27kgQA9RfklFkJzPMxxXiYjDvEZ4qsBcfj/CHWc8rEp2ENBF92daDWCn/5g2/BcbhynUgN8Yld5P6cy046MjHy9vMmLOfDsVBDnVTs2/XkxVDYuAB+ylFXiRISMB+35mC3QozZUWTWRYTonyrU/b/OhMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kc2cuFuH; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a813899384so18927925ab.1;
        Tue, 10 Dec 2024 19:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733888611; x=1734493411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cH1mM7zgDjQ29maw8yzbllsYQuAR43E0lxlHNTTv4o=;
        b=kc2cuFuHUN1oNuSJZFpQLmrfqmyYRTLfPdtbD9PgFHxnQH35VNjji4+vKnk9beJ6rq
         FUj8QlDce1Y5uAbMBJOSAhN2dd2p8enYfzX7q+Zdc7Yg3bBcwkt9aUh1r7qfujjq0leS
         17ZJsqvudb1e/ajhRkO2EQtJeoAdJjbT8CVfFE7PutWdK5kgMqHiKoQTAhrC7HLGWebT
         3of0fXMFbOo+7C0omXUNrZ1tW0hGT4oSir+2cqanQbj1M7vNr0hM56AgF3broXjwPGME
         wTbIpbiFomrhYioQ/DjwUMt9tdecHd7HxDpAv0Ktk5CXAZcTknuXhz90mzqAW9ATLyaE
         tgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733888611; x=1734493411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cH1mM7zgDjQ29maw8yzbllsYQuAR43E0lxlHNTTv4o=;
        b=vcneptcffBGAf+MG9RBQXqUl1oM0WCSdhXgAzl1QlYl0Ar4Dnhk3Na60fNTJye4caO
         NntyHN4M9FbVLlvXYHYCYVNMtFLp0E8egERqo2LBAHlvtkB+qpmujWV6345H4QQliZti
         jp3eZZth6xXjpaDbcjt6zgcw6an3wkxO26VpONv5V2hy9szZjynEoIJ0KTe7yITmqxD6
         Ue1HmDhNNaEwkB9AKOgIIP1KDR+raF1ryOs7F+gqnsmurAK5kzrI3qgOYqs2pSaqx+P4
         uPPfW04+I2YaUib+CLbOSceo6bOiB9/y7ePv3UWa3Y7t+QFjFizz7farWQr7G3G6XmWf
         w6lw==
X-Forwarded-Encrypted: i=1; AJvYcCUcBXdpNS1c3iRR75UinMkLT7u5espjdGIsWzUgCQg+ibPXM2O3dKnt3UsZFsDZJN+OaWjnkKKrs9ev2vf4@vger.kernel.org, AJvYcCUfoKU+EF5Lf+T2nJAam/ARkbis7WLhNP4cSsfPuH9/KDSeOghqGmW93lKpTZjVJEuwmtyruuOqnM5LEq38@vger.kernel.org
X-Gm-Message-State: AOJu0YxH61F694lsp+fhvQ6RkTVVsPPK8mH7zM9+FQH2ibqQ2FT3b7WB
	zVxpwYFpk87pjyc8MEVtIffNmtwuMwoUUf/uFHxLPfQDqQmzuEOKKEMYZ2aKgFYi1Y+UzTbg7UZ
	zzWmkRRBQPta6DNRnfaSwAVWnP2qdrg==
X-Gm-Gg: ASbGncuYkSah3jrLKyMzRmIKf6U8XTO53mrzcVuLFuuOIfgJUiGDsyNPWTGy7gAi7S2
	mFD9KWAY57am8Cw/OiDc8Z4Q3YF6URrSMobc=
X-Google-Smtp-Source: AGHT+IGyFs2ybV2TpGqUFfLsmDGPrsekx8uabC3DOBZW5+y8ecKLujGvlTe7kk+e78b8/IN04qEwyEGNin5DhKkcZs4=
X-Received: by 2002:a05:6e02:1d8a:b0:3a7:1a65:2fbc with SMTP id
 e9e14a558f8ab-3aa0933d97dmr15169745ab.23.1733888611229; Tue, 10 Dec 2024
 19:43:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241209-drm-msm-kvm-support-v1-1-1c983a8a8087@quicinc.com>
 <CAF6AEGtKfWOGpd1gMfJ96BjCqwERZzBVmj5GzmjKxw8_vmSrJg@mail.gmail.com>
 <f4813046-5952-4d16-bae6-37303f22ad1a@quicinc.com> <iyknardi445n4h74am22arpgc4vlchh6z6cvkbff2xg76pd655@nozwz7snt476>
 <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
In-Reply-To: <1219b46d-2aea-4377-a8ca-024039ee1499@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Dec 2024 19:43:19 -0800
Message-ID: <CAF6AEGs4EebrwyQZviNXqB2=3h2wgZpmbrdGHuEU4z1D014GRA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Skip gpu secure fw load in EL2 mode
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Pavan Kondeti <quic_pkondeti@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Elliot Berman <quic_eberman@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 7:08=E2=80=AFPM Akhil P Oommen <quic_akhilpo@quicin=
c.com> wrote:
>
> On 12/11/2024 6:43 AM, Bjorn Andersson wrote:
> > On Tue, Dec 10, 2024 at 02:22:27AM +0530, Akhil P Oommen wrote:
> >> On 12/10/2024 1:24 AM, Rob Clark wrote:
> >>> On Mon, Dec 9, 2024 at 12:20=E2=80=AFAM Akhil P Oommen <quic_akhilpo@=
quicinc.com> wrote:
> >>>>
> >>>> When kernel is booted in EL2, SECVID registers are accessible to the
> >>>> KMD. So we can use that to switch GPU's secure mode to avoid depende=
ncy
> >>>> on Zap firmware. Also, we can't load a secure firmware without a
> >>>> hypervisor that supports it.
> >>>
> >>> Shouldn't we do this based on whether zap node is in dtb (and not dis=
abled)?
> >>
> >> This is better, isn't it? Otherwise, multiple overlays should be
> >> maintained for each soc/board since EL2 can be toggled from bootloader=
.
> >> And this feature is likely going to be more widely available.
> >>
> >
> > The DeviceTree passed to the OS needs to describe the world that said O=
S
> > is going to operate in. If you change the world you need to change the
> > description.
> > There are several other examples where this would be necessary
> > (remoteproc and watchdog to name two examples from the Qualcomm upstrea=
m
> > world).
>
> But basic things work without those changes, right? For eg: Desktop UI

It isn't really so much about whether certain use-cases can work with
a sub-optimal description of the hw (where in this case "hw" really
means "hw plus how the fw allows things to look to the HLOS").. It is
more about the hw/fw/whatever providing an accurate description of
what things look like to the HLOS.

I'm leaning more towards the hw+fw providing HLOS an accurate view...
and the fact that that carries over into other areas of dtb (ie. it
isn't the only thing that slbounce needs to patch, as I previously
mentioned) reinforces my view there.  This seems like a thing to fix
in fw/bootloader tbh.

BR,
-R


>
> >
> > So, if we can cover this by zap-shader being enabled or disabled, that
> > sounds like a clean and scaleable solution.
>
> I think we are focusing too much on zap shader. If the driver can
> determine itself about access to its register, shouldn't it be allowed
> to use that?
>
> -Akhil
>
> >
> > Regards,
> > Bjorn
>

