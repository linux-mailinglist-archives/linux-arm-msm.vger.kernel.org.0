Return-Path: <linux-arm-msm+bounces-74235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0875B8AC18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 19:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70134189402D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 17:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88ED3112C9;
	Fri, 19 Sep 2025 17:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y2hKqOgT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C435D277C9B
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758302754; cv=none; b=KpmUM86AjYAOrpfxanCAv9fAk3jl3Uda8IjEE/eLc5EKZmAZUBSD7Gu23hXVgncPHkFmPpnkMO6y/E07nJPwABxgPLM/iFscKDYbpwb8eAJVIYKw1Ov0DZ0OMRpTkimjAATeF1C2jEhDaOvZ78xbQ3GLnWDvzX00yITYBsEvSpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758302754; c=relaxed/simple;
	bh=e/06IG78l72vZWuwgEyPefWRsdnhck2vY6DZJfGE9Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCebc+VWLn60HHxfsolX0mJd4rAM0Sfk5M+nkobOHFiPHP6aYSyfQx0o8HLaxSkmfEaKAFA/KjiaSU6iDZ4w7jexrGrfeCu8UqxBMhXoUZBH46K6CGCASI7wBpoOlgk3i/F2p/NuV5AGaHOJB+UGpxlMpgqi6vb6zXMS1nC2v5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y2hKqOgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578E2C4AF09
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 17:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758302754;
	bh=e/06IG78l72vZWuwgEyPefWRsdnhck2vY6DZJfGE9Cc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Y2hKqOgTXj90J7Qf2177upuLgnxdRqPRGpLXV2WEeUHLWM5SKgnu3EqeJOiEENHll
	 8NQfbGikLZnZg2St+CA+mQZZdTa0WWaCm+KJnj6L7+pP72K54pvQzWFDwHwbzLU61j
	 FV3pcj3pEbzSdepH8MLViF7lvRI16FuZ2fColZfY55ePWe9civkyOd9NaGtlif98LS
	 ESRH0VdF6IxC7ezZw2lDbO/0ruHFmHPBNDLBcGFOL3V21nTiTMw4ziej2IMskrnBfj
	 GpUFv+ZonK2ZdiaQEi80R7SdVnBK076OUgw1OhL6krCUq5RwGhwKdkEI+Lj6rZzrCV
	 ar0oVcZlleW4g==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-62f28da25b9so3624229a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 10:25:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWd6Q+gdm7OM/1uNuTxC186QMzWbuFtqre8hanqn8h7jXWz6oPW/otO3Y4D0BF2NHybb1Ve4xxReQK48EL0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4awqdNIKXgRpIgacT9CRfp21JEs/B4KTvWNmc69u/QknHiAGz
	tibpWom+2sjnLEV2uSutOorAglJm3/eScUVZ6ZE8FKWZyASpFoI3vxsNiNh2ML0DTsL4ZmcIMB6
	+OBCaVulT64vyj9BH49HYgOsxTMA2rg==
X-Google-Smtp-Source: AGHT+IGeenENqJBxJjPqOrrm/JVLNxJrVj/hxvFxVCm9i7mPtSF5P6nDXH24m4UbtRCMbcE8t+bWjlGRdUoDrhKYxTE=
X-Received: by 2002:a05:6402:2111:b0:62f:50cb:764d with SMTP id
 4fb4d7f45d1cf-62fc08fa54bmr3803049a12.1.1758302752907; Fri, 19 Sep 2025
 10:25:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
 <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com> <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
 <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org>
In-Reply-To: <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Fri, 19 Sep 2025 12:25:41 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
X-Gm-Features: AS18NWB3nDWNmjlyCpk4HdoePdoXd3Gad5AK6JFUUmEhCGrdoE42mQFAkpny8zo
Message-ID: <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:30=E2=80=AFAM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 9/5/25 12:08 AM, Rob Herring wrote:
> > On Tue, Aug 19, 2025 at 8:44=E2=80=AFAM Srinivas Kandagatla
> > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> >>
> >> Thanks Rob for reporting this,
> >>
> >> On 8/19/25 2:35 PM, Rob Herring wrote:
> >>> On Thu, Jul 24, 2025 at 8:28=E2=80=AFAM <srinivas.kandagatla@oss.qual=
comm.com> wrote:
> >>>>
> >>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>>>
> >>>> Qcom Slimbus controller driver is totally unused and dead code, ther=
e is
> >>>> no point in keeping this driver in the kernel without users.
> >>>>
> >>>> This patch removes the driver along with device tree bindings.
> >>>>
> >>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm=
.com>
> >>>> ---
> >>>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
> >>>>  drivers/slimbus/Kconfig                       |   7 -
> >>>>  drivers/slimbus/Makefile                      |   3 -
> >>>>  drivers/slimbus/qcom-ctrl.c                   | 735 ---------------=
---
> >>>>  4 files changed, 831 deletions(-)
> >>>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qcom,s=
lim.yaml
> >>>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> >>>
> >>> This adds warnings to dt_binding_check:
> >>>
> >>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> >>> /example-0/soc/slim@28080000: failed to match any schema with
> >>> compatible: ['qcom,apq8064-slim', 'qcom,slim']
> >>
> >> Will replace this example with slim-ngd and fold it in the original pa=
tch.
> >
> > Still warning in linux-next...
> Its done now!

Now I get this:

Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not match
any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
property
        from schema $id:
http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#

