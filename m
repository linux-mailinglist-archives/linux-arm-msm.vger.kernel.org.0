Return-Path: <linux-arm-msm+bounces-32687-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB379888AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 18:02:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9611A1C2141D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 16:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1BB1487F1;
	Fri, 27 Sep 2024 16:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rwq9bjBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E30313CA81
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727452946; cv=none; b=caTPMJSzHEY7zBZ3vwe1lZc3qS4YkN/Q5c71A1THCr3GCyekRj0MmYOYmtnXj+6XDqwwQZA+NHDkTTqFleoKYdCBQFrR8Gz3xCB8F+PxGdHwX3pSc3sIZNxedLzh35d5xWocs4zQ9nq2OuZ+385LoFOKrWVa5Nt7r6T+AhpOtII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727452946; c=relaxed/simple;
	bh=j8EKtiti6A+WnBNT10RaewPAngTEUNXpu20Lyhq973s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NbFrb4f8OA7cbWDXaGN96hUa2TndMlKa/I8WDx1DFdZNzPV6lcpwixowswyoBdn5nh5Se3QGWSPJ8L5n6Urp6Owxa4czUbZSmokEHfgSiPb1ruqjDgmWvN4zTvxEu2yxl4XlUhvbxzzMCo4eB3RLPtoeRSE0WnUepROkCA2hMiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rwq9bjBy; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e25cc9e94eeso1993262276.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Sep 2024 09:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727452944; x=1728057744; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGIro/Gw+pG6C+1E3sPWUSd5s24w2G8NI6gHk8UMPKw=;
        b=rwq9bjByPwFN22KNJJR8pzRG4aSSA35BrjNnERmKZ4ATj1aTUWPPpiANEoCHdkPogW
         8wJOK6BBNLGDLLrUk1gKYRpRmpTF3yD4TDu58k3m+jsfRcjIAuHJ4C6EHIrmcXotNZKX
         q0KPxWUeUJUnW04dgzj3OW+f7ZM5qeIaJ7t7f+QK0QKjJTFFmyIcklOGOE3TTzfccTr1
         VUqha4gscggkvPgVOKCB/x63uLCc4QVg9e2oX8kp8kliBBYQMu8B1qM8m+NQWlEd2aFG
         Z+wYtPQZkYPVOGeDxZ1EbQgVknSEUn1lJUu9ae7Hx2hve2SQ6yqRglYsX6YLAHbghS5x
         M8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727452944; x=1728057744;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGIro/Gw+pG6C+1E3sPWUSd5s24w2G8NI6gHk8UMPKw=;
        b=L/drzDjm1Bx5K5FcD/ockUAV7+tiYDKLpoKl62s0DOkt6U47W1SwI0Cqs+Gc8agRJ3
         ZGE/OZB5/Uq5elsGpaGH2Lgfs6N4qJb5eiB+Yy68bu/obWuP7KxtV5NAvUVk+Bya7NpL
         yFAaKRWUROdok+KMtabgJ/yowlg1JGXCumB9JDKaGvKKqoko8+XEu5HjFCSONdjid/BN
         b6ifKmxT5HmendlvD1qEnUqWJkwVXeKSHFFAMPAycSDeipC972m86arWgoT/Ogeyrfy/
         8+w6WPA5Ibcab7gmOxfY8rWjIBOYQOXg2kxl13xJWLtP8Op7RsCLh3taObRj7ki0z2vR
         U4vA==
X-Forwarded-Encrypted: i=1; AJvYcCX8OMIWbD8g2rPxQpaOamCInOB6DRzD+x/N+8Fx0BwLVkDZSO0NvdfNpcDVQeJGesHztwcEvsbR9p6kvr4N@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+7HxJT+vp+ldcWRabASp3WOlfF6XFLDuqW7Z4gwRSHNJsuwEQ
	klxS9shm4NMROLM4t4b7nsWK1G+fUv5K/1tOa9RWImRdLV13a2blSQ2DqQorOCMrMwmeI+vI8TA
	kVVicNiISegB+JR6QZtcGc615cgha8ZT0OgcYwQ==
X-Google-Smtp-Source: AGHT+IFKb/vMmnggV56geE4/LB9PLjbBe1DnuIle3XzTmcqytPrRsrd/oj6ZHjXqBbLDkzsVtWhd/O27c6gwZgRbuEk=
X-Received: by 2002:a05:690c:f0e:b0:6dd:c768:e58c with SMTP id
 00721157ae682-6e2473b6783mr34335307b3.0.1727452944048; Fri, 27 Sep 2024
 09:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240628-dpu-msm8953-msm8996-v1-0-a31c77248db7@mainlining.org>
 <zeek3j7skstysho5bduxn23xipz3fpqsfwggue66dlyozhepnn@4wnnd7q6xf22> <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
In-Reply-To: <05c1f93940c38087e8d245d2b6bf90e0@mainlining.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 27 Sep 2024 18:02:13 +0200
Message-ID: <CAA8EJpr0C-gXDoJsStTxJzCMEkbZaPeEAcBES3GqZp1FcKb=4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add MSM8996/MSM8953 dpu catalog
To: barnabas.czeman@mainlining.org
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Sept 2024 at 17:39, <barnabas.czeman@mainlining.org> wrote:
>
> On 2024-08-01 21:25, Dmitry Baryshkov wrote:
> > On Fri, Jun 28, 2024 at 04:39:38PM GMT, Barnab=C3=A1s Cz=C3=A9m=C3=A1n =
wrote:
> >> This patch series add dpu support for MSM8996/MSM8953 devices.
> >>
> >> Note, by default these platforms are still handled by the MDP5 driver
> >> unless the `msm.prefer_mdp5=3Dfalse' parameter is provided.
> >
> > Could you please provide a summary of features actually tested with the
> > DPU driver? Have you tested YUV output? Have you tested RGB planes?
> I have checked all planes they are working fine.
>
> > Which LMs have you tested?
> I have done some more testing and msm8953 LMs are fine but i have found
> out
> on msmm8996 LM_3 and LM_4 is not working as i see in downstream sde code
> they are not exists.
> This kind of messages i got for LM_3 and LM_4
> [   34.751091] [drm:_dpu_rm_make_reservation] [dpu error]unable to find
> appropriate mixers
> [   34.751112] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> resources: -119

I think LM_3 / LM_4 are WB-only, but I didn't have time to check that.
Maybe it's easier to omit them for now.

I hope to get back to those platforms during the forthcoming or the
next development cycle, after (hopefully) finishing the HDMI
conversion story.

--=20
With best wishes
Dmitry

