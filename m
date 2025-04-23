Return-Path: <linux-arm-msm+bounces-55026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E08A97D09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 04:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C14C7A8882
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 02:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADA4179BF;
	Wed, 23 Apr 2025 02:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h+m0yruc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6296A262D0C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 02:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745376638; cv=none; b=DVtvmame4Z7yIrNiX0zxg6lHXrDAAm5Xmf3iMBBaoXlOSq0Y3xNw8Kkl7w8tmtosoXZNlrlFgqgVwj8DrlIBsQzxv6Z5EhTnRRKQbNyC8QLz7NhvGoYEMcYwb0Xe0hTlpE2thCARJIOFi48EzXBu0e0482+oALd1VFiCov2O+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745376638; c=relaxed/simple;
	bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oa7sNg1Hgpv5qtMP6wOSEdkhw4rHJD5hOepq8JRZFvkSYSQ1EkGOz3zoUCxg2DlR8MUPD0TEqZrC3FQogvak6Y05YrTcSzzE1zHNhK8WFCiFESRFg5JJz4lS5IoTLXa3hHOrH3SKMPJvMkmN6tpF8iGxet6dBDxy9FQ7LYoHcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h+m0yruc; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e637edaa652so4628375276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Apr 2025 19:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745376635; x=1745981435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
        b=h+m0yrucOX5HIpsRlq7lN321h5ppvDnWIK/JC1wvEWRjWg+E2MaG51nmfjGBqEvT9B
         aV/y8G/ZHmCMuOx3O/uWrkilShB3xHPlUpW+ivkIvfMc4jBk+vNKv3zhTNzhaQ14nukg
         TrnH2ze9cRQ5NNiPGeJ/APrZAO4zf/nds2YWJRi72/eNL6sPrNICdyp2A2Wsvy6XJ04/
         /U8knONifkjMlYGs4hkteCekqRM28nmG45SQ5VjvAZj7mwKcDK7+sh7RJlgMpWoPjNj8
         tGo5wSfVB6MbjrxRc+FNy46QFwP4QaHkzNdZ07+uZvA1QsrcDwL9wdFuAxW+yfWdTGFM
         wvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745376635; x=1745981435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvLBDDsYBas19wUJSHN+4qLHbj0kQt2zzQgLxxn1VJw=;
        b=xElWlIJU1gOdMerThuZBkJULxYahHPRv01TnQD0fyhnfSC7YoGFP2XNPOSw3QklL4b
         RqtwMooAv7Wz/TfoQex1W3vilRCIkIfKiPcMJ9YPeyUTpUvWP+3z784grL31Pma310T1
         gd0tx7v9PDP+sKeRSzadJgWMYgDY8EZQGnK5s/8wKZw2ynF7YVY5qgConLGeH5KAN8VL
         ZKEQEns+t7b+sFxo+Z9k6jAOnZ4JnpBNc8aGl16471N6jIHF5A0Zm/FCuGKArWIzPU42
         DsSPVHpsbb4evgooYucspPVs72aXNDHT01sf1Zc1nKJSBxFzrdiWm4foOI4ery0zFwFJ
         nauA==
X-Forwarded-Encrypted: i=1; AJvYcCXrjYx3ZXwRqDCdNcJhqVwyA+9PYjskojVx4N8n/8FaQZtWl9NRT1eCjW2dGgTsH8zOvuCGPePoxL+BcYty@vger.kernel.org
X-Gm-Message-State: AOJu0YzctE53/HhbWMcfEa3SsEy6TCPQkpp5tqkkgATJY5lwKlvYb+mW
	DpgkHdtZPMRQ8IiYzuxRhLRo9Lzth9IiwCYeHuxtcbjwN5BSfXKEyDFwZlSz/C3Ed80OmfA8GPu
	RLchkAI54zKjtXOfCJclaw3VT2m63w8G14JAh2g==
X-Gm-Gg: ASbGncvYYN8nRuJ0s8auPBsXo/ijTfIpBbjoU4PYTXAkToqcSAOOD48NkwVVlHRSQQC
	eiAE0+opvXGsptfGlgzkrNeqvHxFyQ9cMCSku5ydltgqoKSDgEzuQUQS17b8XdojL2bOuzhgpmG
	98Ra16x+fm6y1hkc/o9l9MsA==
X-Google-Smtp-Source: AGHT+IFS7GMJaX0GM076iPvZ4Mqv8sbSOQ2aAa8tFq8e5VIVWaIK11j6XpLBL5g1xrPI44TmKCq1OKq9pAfO+Q9jung=
X-Received: by 2002:a05:6902:1381:b0:e69:371d:67ef with SMTP id
 3f1490d57ef6-e7297e9ab9amr24210024276.33.1745376635244; Tue, 22 Apr 2025
 19:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
 <20250418183236.209236-1-mitltlatltl@gmail.com>
In-Reply-To: <20250418183236.209236-1-mitltlatltl@gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 23 Apr 2025 10:50:23 +0800
X-Gm-Features: ATxdqUHPz54vm6pZFuzIqsgbIcK5d4qHYfWOJGGxPj-jtXf6WoRf3GOGq6HIB5k
Message-ID: <CABymUCNL2FQax13vie8kqX_FpNOTZBPwKbxvKzmXHaXr2OjbAw@mail.gmail.com>
Subject: Re: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: airlied@gmail.com, dmitry.baryshkov@linaro.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	marijn.suijten@somainline.org, quic_abhinavk@quicinc.com, 
	quic_jesszhan@quicinc.com, robdclark@gmail.com, sean@poorly.run, 
	simona@ffwll.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Pengyu Luo <mitltlatltl@gmail.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=8819=E6=97=
=A5=E5=91=A8=E5=85=AD 02:34=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, 03 Mar 2025 23:14:29 +0800 Jun Nie <jun.nie@linaro.org> wrote:
> > 2 or more SSPPs and dual-DSI interface are need for super wide panel.
> > And 4 DSC are preferred for power optimal in this case due to width
> > limitation of SSPP and MDP clock rate constrain. This patch set
> > extends number of pipes to 4 and revise related mixer blending logic
> > to support quad pipe. All these changes depends on the virtual plane
> > feature to split a super wide drm plane horizontally into 2 or more sub
> > clip. Thus DMA of multiple SSPPs can share the effort of fetching the
> > whole drm plane.
> >
> > The first pipe pair co-work with the first mixer pair to cover the left
> > half of screen and 2nd pair of pipes and mixers are for the right half
> > of screen. If a plane is only for the right half of screen, only one
> > or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
> > assinged for invalid pipe.
> >
> > For those panel that does not require quad-pipe, only 1 or 2 pipes in
> > the 1st pipe pair will be used. There is no concept of right half of
> > screen.
> >
> > For legacy non virtual plane mode, the first 1 or 2 pipes are used for
> > the single SSPP and its multi-rect mode.
> >
> > To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
> > are needed:
> > https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=3Dhe=
ads
> >
>
> [...]
>
> > base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
>
> Hi, Jun. The display of my sm8650 device requires 4:4:2(lm, dsc, intf)
> topology, I want to test this series, these patches can't be applied to
> the latest linux-next tree, and I can't find the commit id in linux-next
> or msm-next. Where can I fetch the tree?
>
> Best wishes,
> Pengyu

This is staging patch set. Code clean and formatting is still needed.

https://gitlab.com/jun.nie/linux/-/tree/sm8650/v6.15-quadpipe-staging?ref_t=
ype=3Dheads

Regards,
Jun

