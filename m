Return-Path: <linux-arm-msm+bounces-101334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Os2A0QHzWl/ZgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:53:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D435379E9B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 13:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AE32A306AB66
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 11:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B693F7AA8;
	Wed,  1 Apr 2026 11:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BR2R1v0e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC123E866D
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 11:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043724; cv=pass; b=XD6pVvk+XIG/oQIp92b7s57jVP99St5KgPv8Hde+H6Qgqolwp27e6APPpxFhDK3BQSdAXfp/tRv0QJGblYKL5JfykGzljvSdTHo46rSduBmIm2nR3CgcOu928RqapzTKYILFnUczmqhV1v9aIqZ7tY/ia2q8HaCPT344sCChh8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043724; c=relaxed/simple;
	bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiZC+ZPt8ld/4UOOlwp46pevfs+VYxwr6nvqtVvJh8WXRKUjfd53dTIZPLJIUEX3DbEONLoqCxIAgiU2wS1K2s3MXS/QroO78xRumDSV4NLf2iedoQ08Rv/pS/dz6c1Pk8dQBPcpGJLENu3lSPqo8nRRlZsBaU51UkKR/9e2cpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BR2R1v0e; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a279ce9475so916941e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 04:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775043721; cv=none;
        d=google.com; s=arc-20240605;
        b=kf2tR9RsWWLut7Vdky3yiFw4UmFSr2QIhUTWI5tdmeuA2o5+ayJ70gW8rvN/CuRUEO
         687XyZ51JSS5BwkJDh/l7Om/4XwD1rDvM/3eIrSuW+k75XL4A4OlhpY7wK3QaO5COTqd
         j8SEYMT72QKRxiCIudQCya3S1ClUa1gLra5YeJvgneZDl1MHVBbmXcuGLoeQbOsW7SIN
         TmdpMPyrYmjMzzUGKaPE2WVAcHaJuAgApzlcfUa8kXvUQa9VjezeEqXkD0TI0cYNNBFk
         EoiaOHTlCLFhCYF5VMNW8E13tcJP2ELpwQuvthEil7d8sMI1PSb8eBHEe94VVlxzx1N5
         Q+Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        fh=7KZKEWqSpSXLGiF73i0T4qm4gCRt8EGgyzGioCV4qBI=;
        b=Uw0VQz6uJPdMEX/Ug140TdFnVrkvmNfeDbPdR6SWu2isKABQ7n9AEyRyJDisfnp+f2
         H4R0GPf2KMi2cE93fTJf9jjxpEXhA0WpwUUM9vINSotNxdhvpLv/pKfr1fkGtw37G5Cg
         EWcJ/Dgdo++/qmVMnH+bulFFMWpeqr1OJOiMK4vWBPv91DPLve/rHdrrbOyh+pCMQ+Cd
         0yTL1OFdzAbX49WTGHUX/VwwRscg+9M/AE0rNTZ7WufNXUQMWCpbCnxNjf5fyFOS1U1t
         trFq5F9SEoIwwwFjO9tgE3+BOyZhvMZEwN3POi422vL8dJ2IQgk8IQf5UFCN+mIPLIuA
         zwJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775043721; x=1775648521; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=BR2R1v0e0PaGNJeS1VJkA2AzBVblBa7e+P4LYXlp/xUbfOh4B4zcznrJuYV6FlyDGM
         +DoPIdY25DO9uBhPM0tCiaxh4WS3ohjSsBt1i3/0yeIpcOHMXBPNG6qWNLriK7fOUS/w
         U+YFVGRqPoDicGKLXANVVHkrxU85qIZxxJapMlU0Ezlc5lI6UKzkiREo4r+PXTHdy9im
         WwWI5rYjnVTb6YOmGEVGu5l4slMQAgAne8qAk1p4BXhanDYgzp4xBH8XArkzR3UGs8Hu
         YwJoDivTehJGoyn/pPPF6BeObx8Bau9C6fbVhMWWIsvSlZcW2VUWtRX2RzEWGPUU/lpl
         mPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775043721; x=1775648521;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYZ67gNA0pDvTW5bg1nbkHWatH4Q1qHBC4hwtpn+QI4=;
        b=F8PUrZXzX4OQxdMTIXMk21rBmKChW9qxEImLwMjI/KBU7+Zbb/7rTeQPiXdHED18rh
         Wzob07rVPnPXaVQlzbU030CF+77BqG4rJBiPMUr+VR7m7aWaS5S3mXTYcBk+hBFvj2iI
         0qbSR5yINgF2eEhRoJl97NRzqIWWVgBd+h2GUE1pxJESpmBpMvrOEMoI6sPh40iEeOAV
         OuQ7MjYSsnUKPdt6vvrgAWiKd3uOS7K8Zss2B4QVDKW9u2KmlfRfvgzVVN5xn8SaT9vn
         tfNdnYiuAvyZC19vJhYIDb+uSJsfrQ8dpVbx7JCaFY2VAAVXed9MQJ4ZHBTjXHSLRawM
         eG1A==
X-Forwarded-Encrypted: i=1; AJvYcCU1yBYzOCvhZ0/O1Xy7jK3ut+aWBE1qVcEQzmx0jQCvqk4p8Ed1k+1RgbTUMvtzdd63HKhVmpIKgDcbK4J7@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKZm/OToj2DJG2pfOfCD4+TGHgX8t9d59Ru+STgydcDJOrGAG
	qApTTkw8RojthIqff3tUdOyd+szjmmS8D5zGSDMnf2ihhuULcMa5QLQ1MtUXd4NzznuefcuCyR4
	RKoGgH4qmDb8uqQxFm+mbWApV9vzJr9yoXjjCwbbevw==
X-Gm-Gg: ATEYQzxzoqM2wi3u4Va/FNPfPgbQ/vvWJZ0glPHHh1JjJkGFg+dAzdHd5KMtL61qmaf
	9oQOa8W5qlqLSjqXfGeiXxW4Ebdq5CBnBp1T00ayAF6TKDenGJzbPQyyOjo8VKK0gWR1ZNVdVye
	mzfUfOmyB5i8I2zLrdUM2E4ndH2d9RHtWk5Zmvipw/8elyUr/MHCJ6gbOhQUp2z0Ooo+/mtB159
	Pmb0PXe0OXS7hnsOfKfxEw5rRFBq2OWN182g51jyNnt9lvdFm0RdUOBD2/UmT5icwouSPlxpaN4
	G69Of2ocFM0cewR+KgU=
X-Received: by 2002:a05:6512:1048:b0:5a1:1de6:bc66 with SMTP id
 2adb3069b0e04-5a2c2204c2bmr963346e87.18.1775043719389; Wed, 01 Apr 2026
 04:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209-iris-venus-fix-sm8250-v5-0-0a22365d3585@oss.qualcomm.com>
 <20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com>
 <5e2635ac-35de-645b-b5e7-235923f844ce@oss.qualcomm.com> <x5gv6dxdum5klzfjyo7xjqull6o43okkmkn7avssg26epbvrz6@z2brpssbk7iv>
 <0b41ee7c-83fe-d604-b750-8a5a0bd62bf8@oss.qualcomm.com> <CAPDyKFrO3DzfG0aW4z4w87j_iWM=3dpvp=2Wgr4MX1Bin5-6ZA@mail.gmail.com>
 <6yfn6ux3gbin2dtopdxxv4okinspueryuey5vfdq633gsewc6r@ttp56brnpgvr>
 <gX7v5Lyaw6K_7HLFrWAPRIukMU5BJ9bGDg4RNePhYxZ4A9KcMe1HWULG-XqG1czNCzN3e2BMPQV85a2184NwPQ==@protonmail.internalid>
 <CAPDyKFpm7ujNw51dVpPaHCwssjgYe1JVBEyrQ_1CsPbDJuW0Ww@mail.gmail.com> <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
In-Reply-To: <39b31606-b4e1-48bb-b9cc-911c1ac350fc@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 1 Apr 2026 13:41:23 +0200
X-Gm-Features: AQROBzC6yQBtymEM8RF6AwP2-8_VypiX8OajhW6JswzQtD6SYu97waxO7DoNljg
Message-ID: <CAPDyKFrkVbvZcnbhxbLqFySn4V+USCKAjooT3yXN56jq+D9XGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] media: iris: scale MMCX power domain on SM8250
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101334-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4D435379E9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 1 Apr 2026 at 12:58, Bryan O'Donoghue <bod@kernel.org> wrote:
>
> On 01/04/2026 11:46, Ulf Hansson wrote:
> >>> The intent was for this patch to be part of v7.0-rc1, but I failed
> >>> with my pull-request to Linus.
> >>>
> >>> Instead this will be part of v7.1-rc1, assuming everything goes as expected.
> >>>
> >>> Is it possible to drop/defer these changes until v7.2?
> >> It would be very sad.
> > Right.
> >
> > Since it's my mistake, let me reconsider. If I rebase my branch and
> > share the necessary commit through an immutable branch that you can
> > pull in. Would that work for you?
> >
> > Kind regards
> > Uffe
>
> Yes. Please go ahead.

The patch is available for you to pull from the immutable branch:

git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git pmdomain

Kind regards
Uffe

