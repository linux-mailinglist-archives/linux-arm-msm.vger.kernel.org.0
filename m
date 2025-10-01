Return-Path: <linux-arm-msm+bounces-75704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5733FBB113C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Oct 2025 17:31:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 955651897E0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Oct 2025 15:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D7526FDBD;
	Wed,  1 Oct 2025 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9s2vJhw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA6258EFB
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 15:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759332676; cv=none; b=Tuv+nBODtGEn27GN+3MqdpeOocLMIBFJufBnFRt5QN81e8gyIxuOJYo8KxWBMW/2z3OLjyjVv+XfNj08qtXu3H7vMjgGuF5rt2E9+4Y+OaZgDTJNd/Yvxsx4gJu/7IwBD0RtYdffhtsYARoj0BPNmt/TakRznuWRe62WcuaVfJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759332676; c=relaxed/simple;
	bh=JDTAEyiZbcLvVT3hNia51TXKC13VHjeiGUJS8Hgu32o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SsZgJAMKj6bLm90LAIZ0mIZfmHfo0MG7aWqpHwVu++sjRUmVp3D/Xxa4VruzUXzgYfMGzxhveWXUwuPN+kJwa+0EL6+GVnU3vr2EZFOvaqkWIYUy8SvgbNlPy1N3WwdSNGs++qerr8mjLg5XJTLY3rCSxUWc58MAk3oMbatAK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9s2vJhw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFABC4CEFD
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Oct 2025 15:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759332675;
	bh=JDTAEyiZbcLvVT3hNia51TXKC13VHjeiGUJS8Hgu32o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X9s2vJhwFvLYgnC7gK/o4ZbL5fgFDbWMo2m9DC8rtEEL4x7JKB9d/kOIlK6IYksaN
	 ijhj3/MjlbSKUq9Cl3tPq3qd/b1tYIW3KmahqNu87DAYfkDQw2S5qap5UV98S0admZ
	 qoho8gFivpdh6iRA7RKqJs/Zdn1xWauCh/w8Pi2m/gvqKzs2sFuRz2vrMA6JrKvxta
	 9deqCRJK7jSWhpKZ6fV2sHYyxMocueDWW/lHZFl/xf28Xr/J1r3NfrCV187VMuIBXh
	 Wq6sHMJNs7zHCcA3E+xXXTMZqKFCgApgkYRjXMcnAWJ3oafrGKHZjtl7xZUqe/nTfH
	 stqn8akp4VTkg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b3be330b1f5so481966b.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Oct 2025 08:31:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwtj9bJxWccuuq4CQKSuYkKWJ/z9Gw7bqqO0ibM0s0HD76v+yVFNThndXI0+MjaorU7FPOWShPJe39kn1K@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/F9yAIOCWWb0rsQ9t0t7D6OUpZ/x5pN11ZspsIXRSWDrdnCOE
	Mmrt2bo++7r8/IOXSKxAX3G5cp3WMojT7bB+NXg4Da5K+192bFxDgiOkSEf+b59LLfWnwX3bmXk
	iHhE/DmdnlF4WET9FD2qamjrJH6cf8Q==
X-Google-Smtp-Source: AGHT+IGuAt8OqaKidKIuidndmLKgwuYuRdG+PcQotC2WNIt9dyJsL6bKltHzJtdGvoLIdTuZkQcvUO0000wUNzWaOnw=
X-Received: by 2002:a17:906:730f:b0:b2e:6b3b:fbe7 with SMTP id
 a640c23a62f3a-b46df909bf3mr469061166b.0.1759332674337; Wed, 01 Oct 2025
 08:31:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <CAL_JsqKG+dcMgp1QF4F3Oxh5Shvagg6cSde=g1JMcEAquZhH_Q@mail.gmail.com>
 <990cb5af-3846-44a3-b373-ded62d3309b9@oss.qualcomm.com> <CAL_Jsq+zC91GPdzQQa9F8KEw5UL4xc13u5U_5vTyQG1WeJa5rw@mail.gmail.com>
 <82906e08-9583-4f4c-91ad-d5b53b2dffd6@kernel.org> <CAL_JsqLtLbCqzHzcaGAuYwxqr=e9HZFX8X20tndx7US-XjhH3Q@mail.gmail.com>
 <CAL_JsqLcinpeJyib+JG7UFspUqXDTzCLguF3Nt4JJY9YncTb9A@mail.gmail.com>
 <b8c1365a-545d-40ae-a39c-e15a3e1f07e7@kernel.org> <b3147370-11da-4202-abac-36218487578f@oss.qualcomm.com>
In-Reply-To: <b3147370-11da-4202-abac-36218487578f@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Oct 2025 10:31:02 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_FoOFQ92SBx1neViyzAeiVkpn2DWqi4Nt4FFoz4pR_g@mail.gmail.com>
X-Gm-Features: AS18NWD3T-H-3Cqx3KV0EYQQkvmNWsSh9Yljc8XF87P_qTz1x5FFABioQlBsZU4
Message-ID: <CAL_Jsq+_FoOFQ92SBx1neViyzAeiVkpn2DWqi4Nt4FFoz4pR_g@mail.gmail.com>
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 1, 2025 at 10:03=E2=80=AFAM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> On 10/1/25 3:21 PM, Srinivas Kandagatla wrote:
> >
> >
> > On 10/1/25 3:19 PM, Rob Herring wrote:
> >> +Greg
> >>
> >> On Fri, Sep 19, 2025 at 12:25=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> >>>
> >>> On Fri, Sep 5, 2025 at 12:30=E2=80=AFAM Srinivas Kandagatla <srini@ke=
rnel.org> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 9/5/25 12:08 AM, Rob Herring wrote:
> >>>>> On Tue, Aug 19, 2025 at 8:44=E2=80=AFAM Srinivas Kandagatla
> >>>>> <srinivas.kandagatla@oss.qualcomm.com> wrote:
> >>>>>>
> >>>>>> Thanks Rob for reporting this,
> >>>>>>
> >>>>>> On 8/19/25 2:35 PM, Rob Herring wrote:
> >>>>>>> On Thu, Jul 24, 2025 at 8:28=E2=80=AFAM <srinivas.kandagatla@oss.=
qualcomm.com> wrote:
> >>>>>>>>
> >>>>>>>> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> >>>>>>>>
> >>>>>>>> Qcom Slimbus controller driver is totally unused and dead code, =
there is
> >>>>>>>> no point in keeping this driver in the kernel without users.
> >>>>>>>>
> >>>>>>>> This patch removes the driver along with device tree bindings.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qual=
comm.com>
> >>>>>>>> ---
> >>>>>>>>  .../bindings/slimbus/qcom,slim.yaml           |  86 --
> >>>>>>>>  drivers/slimbus/Kconfig                       |   7 -
> >>>>>>>>  drivers/slimbus/Makefile                      |   3 -
> >>>>>>>>  drivers/slimbus/qcom-ctrl.c                   | 735 -----------=
-------
> >>>>>>>>  4 files changed, 831 deletions(-)
> >>>>>>>>  delete mode 100644 Documentation/devicetree/bindings/slimbus/qc=
om,slim.yaml
> >>>>>>>>  delete mode 100644 drivers/slimbus/qcom-ctrl.c
> >>>>>>>
> >>>>>>> This adds warnings to dt_binding_check:
> >>>>>>>
> >>>>>>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> >>>>>>> /example-0/soc/slim@28080000: failed to match any schema with
> >>>>>>> compatible: ['qcom,apq8064-slim', 'qcom,slim']
> >>>>>>
> >>>>>> Will replace this example with slim-ngd and fold it in the origina=
l patch.
> >>>>>
> >>>>> Still warning in linux-next...
> >>>> Its done now!
> >>>
> >>> Now I get this:
> >>>
> >>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> >>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'audio-codec@1,0' does not matc=
h
> >>> any of the regexes: '^pinctrl-[0-9]+$', '^slim@[0-9a-f]+$'
> >>>         from schema $id:
> >>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> >>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> >>> slim@28080000 (qcom,slim-ngd-v1.5.0): #address-cells: 1 was expected
> >>>         from schema $id:
> >>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> >>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> >>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dmas' is a required property
> >>>         from schema $id:
> >>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> >>> Documentation/devicetree/bindings/slimbus/slimbus.example.dtb:
> >>> slim@28080000 (qcom,slim-ngd-v1.5.0): 'dma-names' is a required
> >>> property
> >>>         from schema $id:
> >>> http://devicetree.org/schemas/slimbus/qcom,slim-ngd.yaml#
> >>
> >> Still failing in linux-next.
>
> I was running the check against the the yaml file which missed this
> warnings, I should have run this against the folder instead which could
> have caught this. May be this is something that could be improved in the
> check by pulling in the dependency yamls too.
>
>
> make -j`nproc` dt_binding_check
> DT_SCHEMA_FILES=3DDocumentation/devicetree/bindings/slimbus/slimbus.yaml

You can also do just "DT_SCHEMA_FILES=3Dslimbus". It's just a substring
match on the path.

But any example could use any schema, so you ultimately have to run
just 'make dt_binding_check' without DT_SCHEMA_FILES.

Rob

