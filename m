Return-Path: <linux-arm-msm+bounces-14197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA8187C5DB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Mar 2024 00:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08A921F21EB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 23:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB19E1078F;
	Thu, 14 Mar 2024 23:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UZlgFMr3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24DE6101CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710458480; cv=none; b=n0v9ZqDHfw5fVDdDcytQK+6NPE4NIMpqFOJr6Kyx8CpSqas7Z+itQXbmSNW1FfpO/qTTNltVZllqq2Z3n8yICW6Mqwiz92vRRFOuc1eTNTBxzSDK+4bhp1W2oxjmR3ij4A7RtzvGCsELT83rA2Lg5l2yaXoddG1UfLjblm1doD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710458480; c=relaxed/simple;
	bh=1nZ1koHEL3nJ3Z4WOjyBj9l6GAQC4q9nTZpHJxmXIvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L4N6fQ9S6cNIS8xQM4H6uguem1FDZrwBw6fRmJN6FD9AIpH77vr1gUGvpWtgjew5scnn1Dz21OTUTS7Pf2AH6S5pqRAk0K29tLg/9sNFVbghwJJj2zLAb2PwjYfyaGH91xtT/RkCx8mcYg3NmuDIzQrDOKHW3Hv1bTeCIlISaJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UZlgFMr3; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e67451b084so504175a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 16:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710458476; x=1711063276; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYkkAOiHkqIfOBWqACZEdL7PfJhzMKheJAaNem7Ve48=;
        b=UZlgFMr3Z+3EWLUE501NMd5nrNWGj5MPXd/ZJEfZlHiBQ+RjxydfbqPWdStUbTLFIy
         PiVphh6dbnjSzskoB+pVoJsV4zHlmrpCK1L5CtZgrMAYowFZNAekdsU0h2+lPIMcJPIv
         zyRu3D39pk0V4lQJiehfjyc7bpnSTfDG4gzA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710458476; x=1711063276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYkkAOiHkqIfOBWqACZEdL7PfJhzMKheJAaNem7Ve48=;
        b=UrB1D0inSBZDd54PJJcwZySDt2jWIJ/T8L9sxlZCnZLDuSQE5n16nDn5ZU649pORkW
         dygBch5/2sloPdindDXArnnStxwzUWYHWoO/rRKeV7uFcy+ju/binJJ59PEBdBrZ6mwJ
         QnbvkuLDWb3XaMCiPwqhL73aIe/puhz91TwVhC6AeDC4O0u2+zxOU8bTWX7PuO7wKXLw
         P6PgN+v9WRTAMiHPkqYzUWdt4zkXSbpotDFcmfVt5HYdaunwUuBJuUszzj+daOugrb2q
         GAEOC3RouWi+2Mg7hDFz6GhdLFdGDgQeznRRzn24uV8j0nOGfzqxiP34/BA4fiCXItX/
         76kw==
X-Forwarded-Encrypted: i=1; AJvYcCXpYP85roEDqtK+XyUlPBfOS2xlLA1cqTi+IXFZehygeJe6bcErRFDRzID98axHHhLd0icgMpCnBvTG1u30Fiww2GexQaCWKkpG/B7SQA==
X-Gm-Message-State: AOJu0Yw53DhipaDVj6k+4d0xU5BJ0u3ecCqaWTgwPT0D+8EQ+vMHagHa
	qPYjQo+1P3LuVZUZ9alMi2KPAutJAaagdtVxY6j4jtpeluLMHiaLXA4HTRm/hU/HOqE/4KSD6s0
	=
X-Google-Smtp-Source: AGHT+IHczAKqo9CCtskIioOGtTRbpCFxNV4rGv5P41IYtMOeeACmHNohRsXDz7UZz6tbFGkLQ2amLg==
X-Received: by 2002:a9d:7d99:0:b0:6e6:6d42:c61 with SMTP id j25-20020a9d7d99000000b006e66d420c61mr3360553otn.16.1710458476617;
        Thu, 14 Mar 2024 16:21:16 -0700 (PDT)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com. [209.85.160.175])
        by smtp.gmail.com with ESMTPSA id qr3-20020a05620a390300b00789e220b7b0sm427288qkn.0.2024.03.14.16.21.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 16:21:15 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-43095dcbee6so129501cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 16:21:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/uM6GFkDBTG73s7uxjdloks7Hdat7BVEsn1NiS0Oj6KnAXcm8ddJc48/q+VwxA8Hg4r0CCDriQgoIg6h7GvDmTHax+GdARFWzpU6tVg==
X-Received: by 2002:ac8:6618:0:b0:42e:ef12:8025 with SMTP id
 c24-20020ac86618000000b0042eef128025mr64373qtp.25.1710458474993; Thu, 14 Mar
 2024 16:21:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20230703085555.30285-1-quic_mkshah@quicinc.com> <20230703085555.30285-4-quic_mkshah@quicinc.com>
In-Reply-To: <20230703085555.30285-4-quic_mkshah@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 14 Mar 2024 16:20:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWH+Eoa9XjDns--NSDTZHeUwTdrX_r_QZhSPpbZNwz+w@mail.gmail.com>
Message-ID: <CAD=FV=XWH+Eoa9XjDns--NSDTZHeUwTdrX_r_QZhSPpbZNwz+w@mail.gmail.com>
Subject: Re: [RESEND v4 3/3] arm64: dts: qcom: sc7280: Add power-domains for
 cpuidle states
To: Maulik Shah <quic_mkshah@quicinc.com>
Cc: andersson@kernel.org, ulf.hansson@linaro.org, swboyd@chromium.org, 
	wingers@google.com, daniel.lezcano@linaro.org, rafael@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, sudeep.holla@arm.com, jwerner@chromium.org, 
	quic_lsrao@quicinc.com, quic_rjendra@quicinc.com, devicetree@vger.kernel.org, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Rob Clark <robdclark@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 3, 2023 at 1:56=E2=80=AFAM Maulik Shah <quic_mkshah@quicinc.com=
> wrote:
>
> Add power-domains for cpuidle states to use psci os-initiated idle states=
.
>
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 98 +++++++++++++++++++++-------
>  1 file changed, 73 insertions(+), 25 deletions(-)

FWIW, I dug up an old sc7280-herobrine board to test some other change
and found it no longer booted. :( I bisected it and this is the change
that breaks it. Specifically, I can make mainline boot with:

git revert --no-edit db5d137e81bc # arm64: dts: qcom: sc7280: Update
domain-idle-states for cluster sleep
git revert --no-edit 7925ca85e956 # arm64: dts: qcom: sc7280: Add
power-domains for cpuidle states

(I get an ath11k crash after that, but that's easy to hack out since I
don't need WiFi)

I suppose the two options here are to either:

1. Track the problem down and figure out why the breaks boot and then
fix it. I'm personally not going to track this down, but if someone
wants me to test a patch I can do that.

2. Delete all the herobrine dts files.

So far we've been keeping the herobrine dts files alive because I
thought some graphics folks (Rob, Abhinav, Jessica, for instance) were
still using it. ...but Rob says he hasn't booted his in a while. No
idea if Abhinav and Jessica are using theirs. Any opinions? Is
herobrine hardware support near and dear to anyone these days?


-Doug

