Return-Path: <linux-arm-msm+bounces-57465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05FDAB17AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 16:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 240A11766E4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 May 2025 14:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F80E225792;
	Fri,  9 May 2025 14:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO0gSqyF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93F41E502;
	Fri,  9 May 2025 14:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802096; cv=none; b=mZZcPuY4drLNH0hKvK2lMp1dJJ4/DK7lg6iYGdhQLxIRLciB/1SwyVJ08/M6z6bKGofHdwRtacm2LQvVbyuRjx0y656+5Hn4QY25LPs3c5U6LA9m9/H9UFfVI7bRbg6fu/OBR6GteCSd6l8topJBOkmsfymqYxYP/Pw+rdqOXc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802096; c=relaxed/simple;
	bh=mARamw7lUsmL/I3Kzqf41NTjnfcBpH049UKr+MaBAho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jynOZmLhMOSm0K2s7H/ID3EV4A48RlM4C1kNOa/2Z3bT8uu/4WLAyeJNqk6F0gkbuALo6ISw8NRvpqQq9o5rSbbW+2ReGp+O2BHqNDBfvKLIRKxAS9Rbp8aXOxjd9BgOGUNDHAFzRCxt7hnR+qK6FtBORQrqADhQf19k9Zi1z4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO0gSqyF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30c1fe19b07so297481a91.2;
        Fri, 09 May 2025 07:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746802094; x=1747406894; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mARamw7lUsmL/I3Kzqf41NTjnfcBpH049UKr+MaBAho=;
        b=hO0gSqyF8LF0moXQTBwickFMCTZF7EtU+giKMmBpGkdyI4acy2vME3aZHKdj9V0toe
         N3GcyVvDxVa36BOP/VEsc4wx8+UZutYCpDPeew2AH0iixjyh2kGI6ygX3ZBxUh1zE7vP
         11eCW3Kx888fCTKZofReiaplkFcGHpL+lJVzbu8tuT3BAzlcfca1NukGAMsvdeHhC9qm
         tvvKOeliq+AbJ0qpWwaU/ByMSxwApA0JBbCWFXDg5QoD18V5QJtQ8sVrtxBvQx7FtxPH
         xvFC/t6wUubb0ak4sMuPAJmXq2Sw3L4Dw3qnkL2GfEmUCv5mIVWYxbwPmTSNxGVUe8eu
         GvMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746802094; x=1747406894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mARamw7lUsmL/I3Kzqf41NTjnfcBpH049UKr+MaBAho=;
        b=DfNLGqCoMFyhhgsVCnQ3rFMvFtG83buCu9iCVBVtEWY+QP4/H6rFLY4GmH1hZPf8sN
         QCExM5kH76qNcVTavD4SH64snOZvTtmtihKiT+x3t4vtKxDTm/g5e1/Uw8rg8P240pTQ
         4SUt2znPVARF5M5ievqoj+6eeNzXkiKd+maeFhmGsdVeQ/nUGccrlpmCHj/Dt1oY2oRD
         DiX0aHYyit2WKWQEHUk4nsXWaHfDTgKww/jU7loFSC3LrjWuayjhNA/wtrSGGl6gc1ux
         pMkEOmuYtQqfZMAIUJ0Yl55gW2QbRZZVmJH8SFvyOaQ2TxwwrKWrig1LHb1k/oPKKmfl
         KBAw==
X-Forwarded-Encrypted: i=1; AJvYcCVTq5LLyapKJWABM0TISaT7i3KZMJb6axicq5CHqbvTre+fhUduTfZ7k3fYXllajYQsor5+a2GcIO4TT6rZ@vger.kernel.org, AJvYcCWWOkgiPbv/2BmRYKbTd6J4VJwUI1/MCs3mzDN/Xv+vdmiiSg3OBh/d9lB0NIboTsplsaX0QBxuz64gqYOb@vger.kernel.org
X-Gm-Message-State: AOJu0YzjYh0zmXR/77swsWLDsnRied8U858hXj9iH8neRiCw8xOtOJTf
	OO3jaRoHVO4Me9zrEoeorP26sP08jqQC/DH6kqher4/5NTJaJxJe4NMJ0TzwGgCo2+p/dZdz8EU
	YyDL7qvV6y/2xByIVBSu8h32Vd66avw==
X-Gm-Gg: ASbGnctuZOrcFiNhUeWcQtnXYSs+X5g6qdhmQ7vQNPUFs2Sd/eD6uqtXOR5hHmT6dkb
	FnRsFYDalSp1WQwCgxqiy0YBWU33jck3AdtfWoXExMUWonj9dugTX6Suj0wWVGsjMpz2OMVOQan
	zu8g9YMC4jQ6viRnVK1qPJkQ==
X-Google-Smtp-Source: AGHT+IFa+1K23FbGssXhKRVsJgrzYJ5or5/KFBu3auQ6eL8QQ6Og83ldhpGgIYC/Xa1BzTwzbCW/k+eY4LIKoaFiBEM=
X-Received: by 2002:a17:90b:1a81:b0:30a:80bc:ad5 with SMTP id
 98e67ed59e1d1-30c3d62eb56mr2270414a91.3.1746802093903; Fri, 09 May 2025
 07:48:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-13-035c4c5cbe50@oss.qualcomm.com>
 <CACu1E7E9yU-cygZxBqVypP7aFkXJCNTfXA2uqdvU84mi9T51Xg@mail.gmail.com>
 <5f5e512c-ae0e-43aa-856f-06820ac4b147@oss.qualcomm.com> <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
In-Reply-To: <dedbfb2f-012a-404f-87d1-2f3cd04b0e74@oss.qualcomm.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 9 May 2025 10:48:02 -0400
X-Gm-Features: ATxdqUH7m-SRD5rFdt3OSCvmnhthEka5DCwMJApoXPZk7CfFgdIwZBmJF-0jfvI
Message-ID: <CACu1E7EfgPFcSgGA5TkAVqpO=K2G1AjNVbRij60TknCx5PcoqA@mail.gmail.com>
Subject: Re: [PATCH RFT 13/14] drm/msm/a6xx: Drop cfg->ubwc_swizzle override
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 9:37=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/9/25 3:17 PM, Konrad Dybcio wrote:
> > On 5/8/25 9:26 PM, Connor Abbott wrote:
> >> On Thu, May 8, 2025 at 2:14=E2=80=AFPM Konrad Dybcio <konradybcio@kern=
el.org> wrote:
> >>>
> >>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>>
> >>> On A663 (SA8775P) the value matches exactly.
> >>>
> >>> On A610, the value matches on SM6115, but is different on SM6125. Tha=
t
> >>> turns out not to be a problem, as the bits that differ aren't even
> >>> interpreted.
> >>
> >> This is definitely going to break userspace, because the kernel
> >> doesn't expose the UBWC version, instead exposing just the swizzle and
> >> userspace expects that it sets the right value for older UBWC versions
> >> before it became configurable (0x7 for UBWC 1.0 and 0x6 for 2.0-3.0).
> >> It looks like the data for SM6125 is just wrong.
> >
> > Oh that's sad.. I'll drop this commit
>
> Wait uh, we have this data in the common config.. why would it break
> userspace?
>
> Konrad

As you said in the commit message SM6125 has ubwc_swizzle =3D 1 which
seems wrong to me (it should be 7), it just didn't matter before that
it was wrong. You should probably just fix that.

Connor

