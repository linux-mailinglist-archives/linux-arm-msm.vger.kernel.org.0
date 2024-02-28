Return-Path: <linux-arm-msm+bounces-12888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECC386B344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 16:37:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6B371C2162C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 15:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1490A15CD6C;
	Wed, 28 Feb 2024 15:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TUKVQzDh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1018015CD73
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 15:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709134632; cv=none; b=WDL5UuHo0pfDRB7xLPJYkqvusE/+hrMFozgltMFyXy4DQtwY6MOrGCSD+GzNvTa+Wcewy8amvZRTzgP8+ux5Il1FqMXVEwkABUxV5jJCNtkhZHj+aVXCz3Pykhdgh+7ZKZEuHuiTn0dgY2+05opILXrnCAj1g8JTaEDMJlfnRrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709134632; c=relaxed/simple;
	bh=zGa+IyFAz8kwIE7x38Wl0fe/t7lkIR01+L6mE1MqudM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7Vh2drP9ATkvbqgVlOOxnYMQ5H3Llg0QLIv4RFKeZvpPVkG3SYMmWxUgmwPu68JxyL+aeAmogEbuK9dPHrEYwlI4625mEB+12VEWHJuw7Gna/FoAVSGykwkEwH/eLf5WOUIVU7gCEFcGmwD9LwWIc8GMRcOld4+VhDqng0Yr5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TUKVQzDh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56657bcd555so1560820a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 07:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709134628; x=1709739428; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8dVCImcIlLLiITmfEBgBjhdVxqWWMzlc8Dv1nyWSOGo=;
        b=TUKVQzDhnvGkhODw3ShNo58Wb7gAODf+QVCs7R7LbdhcBr0/Mw1AVlyMs3ZoulFJWd
         YggH7IsV3h8mzUYvY/4FsOxcxyqgYf71gNNkrxYJyNgjfEVNdRuopE/r1wFjYv9KyeSz
         Vv7c2kZV7sprdNuc3FMsYw4t9LCjc7eBrV4kjpSsoC2gzwJ/6s519UyKuvKZmn27Lqe8
         c7bOhv8h7DGN3iXo6jbjgncU3aIVkfSexCEzRCjc2aFTpNuSmoF8dpnEnZqf1Bk0jxsu
         gCAW9KpiwyjWQl0d4YHCV6Pky+PqMn/TgEQ3pZhJfUFKHSygIRYIWjafunFdbpAroape
         TYHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709134628; x=1709739428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dVCImcIlLLiITmfEBgBjhdVxqWWMzlc8Dv1nyWSOGo=;
        b=aQQKgT1sco1rnwYnfzHNxpRmTzA6jU2GaboTCu+eMgdIr/vJ1a6vOJ8QwqoI6sWU+k
         oGRxZ/fSZSB77IB/Sg6sYLBWnU4cYqxzlSganrq2Pke6PbOtmLpipCBqPCiZ9iwRjota
         JfEuc6FFig6tdZ792bkF9b/KufZpSyxGwe0BvZ3Vtb2vD/8hYIfJXL2xruJ3cC32ZFVD
         1NyhgSUNBw78qvLk5gAg+T64PYTLB9gP0WgRk9TLeiYlJf0OJ19PuuNp1KpcgKmhy41b
         4GnzYjyPXfvKTnjR6IY9gPpDZSK56rA401sLn24v87U8RdXNn2YlfUqzOq2HWjPnG1XH
         MxOA==
X-Forwarded-Encrypted: i=1; AJvYcCVo42Pt8OqAzrtoMG0C3Hylh6pkOQ2cqueJ3psRT2Ixcsfb1ScqZJmeqQDbz/TsGuhfhK7yPr+/24xQt8dA142d77i0p8G8ecBJkMbW7Q==
X-Gm-Message-State: AOJu0Yxr9BkXNmcVUWZ4zk11747LJK/EOSBt/gKSliI4WlO4+2ZJgpvh
	8YzZaQGoDpbkaMhVQzskY/I+oKdYEwpFCNak6YgbkOnyelvoFKNBbF0baw51iEia89MwEpUMkHk
	XGNrjyxfOfkzfg2iN+Xm5BYWuytC0DYfhLlS7vQ==
X-Google-Smtp-Source: AGHT+IEQVtJyu0GYHAWdmf+6eoRlVi/P3F2RUBvk49c7M8VZVlNSEYmKA5V/4aGFP0UZhJeY+ePLjPp6XOoBzr5CUX0=
X-Received: by 2002:aa7:d982:0:b0:565:fb4c:7707 with SMTP id
 u2-20020aa7d982000000b00565fb4c7707mr5488857eds.26.1709134628391; Wed, 28 Feb
 2024 07:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com>
In-Reply-To: <20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Feb 2024 16:36:30 +0100
Message-ID: <CAPDyKFodDx7evDGiJChDohv8qK+9QMpwp6+Z6DrJUWOtMhYfsA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
To: quic_bjorande@quicinc.com
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 27 Feb 2024 at 02:45, Bjorn Andersson via B4 Relay
<devnull+quic_bjorande.quicinc.com@kernel.org> wrote:
>
> From: Bjorn Andersson <quic_bjorande@quicinc.com>
>
> Commit 'e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable
> the domain")' aimed to make sure that a power-domain that is being
> enabled without any particular performance-state requested will at least
> turn the rail on, to avoid filling DeviceTree with otherwise unnecessary
> required-opps properties.
>
> But in the event that aggregation happens on a disabled power-domain, with
> an enabled peer without performance-state, both the local and peer
> corner are 0. The peer's enabled_corner is not considered, with the
> result that the underlying (shared) resource is disabled.
>
> One case where this can be observed is when the display stack keeps mmcx
> enabled (but without a particular performance-state vote) in order to
> access registers and sync_state happens in the rpmhpd driver. As mmcx_ao
> is flushed the state of the peer (mmcx) is not considered and mmcx_ao
> ends up turning off "mmcx.lvl" underneath mmcx. This has been observed
> several times, but has been painted over in DeviceTree by adding an
> explicit vote for the lowest non-disabled performance-state.
>
> Fixes: e3e56c050ab6 ("soc: qcom: rpmhpd: Make power_on actually enable the domain")
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/linux-arm-msm/ZdMwZa98L23mu3u6@hovoldconsulting.com/
> Cc:  <stable@vger.kernel.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
> This issue is the root cause of a display regression on SC8280XP boards,
> resulting in the system often resetting during boot. It was exposed by
> the refactoring of the DisplayPort driver in v6.8-rc1.
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
> index 3078896b1300..47df910645f6 100644
> --- a/drivers/pmdomain/qcom/rpmhpd.c
> +++ b/drivers/pmdomain/qcom/rpmhpd.c
> @@ -692,6 +692,7 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
>         unsigned int active_corner, sleep_corner;
>         unsigned int this_active_corner = 0, this_sleep_corner = 0;
>         unsigned int peer_active_corner = 0, peer_sleep_corner = 0;
> +       unsigned int peer_enabled_corner;
>
>         if (pd->state_synced) {
>                 to_active_sleep(pd, corner, &this_active_corner, &this_sleep_corner);
> @@ -701,9 +702,11 @@ static int rpmhpd_aggregate_corner(struct rpmhpd *pd, unsigned int corner)
>                 this_sleep_corner = pd->level_count - 1;
>         }
>
> -       if (peer && peer->enabled)
> -               to_active_sleep(peer, peer->corner, &peer_active_corner,
> +       if (peer && peer->enabled) {
> +               peer_enabled_corner = max(peer->corner, peer->enable_corner);
> +               to_active_sleep(peer, peer_enabled_corner, &peer_active_corner,
>                                 &peer_sleep_corner);
> +       }
>
>         active_corner = max(this_active_corner, peer_active_corner);
>
>
> ---
> base-commit: b401b621758e46812da61fa58a67c3fd8d91de0d
> change-id: 20240226-rpmhpd-enable-corner-fix-c5e07fe7b986
>
> Best regards,
> --
> Bjorn Andersson <quic_bjorande@quicinc.com>
>

