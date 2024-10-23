Return-Path: <linux-arm-msm+bounces-35624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05F9AD469
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 21:02:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 01C571C21CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 19:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A8B14AD20;
	Wed, 23 Oct 2024 19:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="fiTTBrvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1036D78C9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729710143; cv=none; b=t309IW0htXtEfDsnIjKgdt+rMATULId2xfiwRerm9Nt6QdQDnYc1E6FV41WBtwlD9vQ6W3Zmk+4JXRlpSNaw7MifRcMinuc9s0cIx0Zx9+DJNW00NLz1V+xfudCMvvDY+auDqB6yeV3IvfGInpA/CtiubzETu4PJXyNO3jsZmlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729710143; c=relaxed/simple;
	bh=uFtI7F/Qs6GJxEpny9dYB80paYb1IKlSpQXJYGSHSjo=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CwAOuYUWmM/ri0djSjKKeNES9OC27azIjQLTYokRkj3PmlY/KqZOGqhR6IWwNK7k0d8L3lSL5lZ5/EIbU0XjjNvoQnEEu2O4V1MqgIki0aJNtUe+P7Ezf9n3eSxmpOHh/99H7ZtMpOsI7heTppQNqOK+/GBQU5W7lnVUQbw7G6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=fiTTBrvO; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-288661760d3so129703fac.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Oct 2024 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729710140; x=1730314940; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rdy7AbHrdibZ9InPm8yIrXzTxAu9C/oEPTb0YZD94xo=;
        b=fiTTBrvOFKQLXkdnI34daEUl4dBjUWiIQI0IEw24xHRw+dys+YwF09EJd7tfYNZHTq
         Q0/ta/MVOxrPF0H9oSOFNmasm1SbGLANeEsmKqr730raAHe8Y8Uys2GK5V9Q0ogoSG3j
         oCRmSJw3L3WzVWza2tj/DCdnxaqDoR+pER5N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710140; x=1730314940;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdy7AbHrdibZ9InPm8yIrXzTxAu9C/oEPTb0YZD94xo=;
        b=nnXOZhAfjMhDPQWbCGURbRt7ShJacFjHB+uMmr58535sm/pgVvN7TUbDIQhOr+LsBM
         mnWHKjUGx6NUS1ke1kPR3Hm1/8/tIGpxMGNaMk7wDwhQ33vlk8FjUQ4jH28Z9wUi6jNP
         yw7n3iRAJ8IriX5CcMO8JlHDQIeXG65oyeBh74zbfLXoAvmFXF59vsYA6XgquiCtfx50
         wsv3v5kRDcescVMb0LtQ5MPZQ6lRvugAYPU9TRxzGnU8CxXwgmQyyJJGKxOtinA1zDrj
         RBei8g17qY9QNsblCP4HsO5pAKi30dohoKzGKZaDGDtwnd5xq/AwSqC85TYPwo9mbeEN
         MBjg==
X-Forwarded-Encrypted: i=1; AJvYcCVAvyAkP0XfUUy19pMXLKt/c7mNRRuczF/CnTnsmc1gn9ZhWxHkejLgojKJ29C9GY3fst1nYo0h5azMGYMR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/heIhjFwx/rmPzWX87zTAoDcwIkFSPv80xy1eYJDmvsMvLDll
	BpKOQxxedzKI6BDufJXpoOZvEIGYZpPHI6YgExssR/IuNAhHDspLti0ZRElDqSXB93ObvbdQ+qW
	aTIxorQmO6HHP1kDj0OoCFaO1b4SrlPEij3/O
X-Google-Smtp-Source: AGHT+IFYINQGLEbR2sm7FvSsNQwO1DKseiMVQJ/wPdU7mDzWulIqePkZvyFPajM+sGcM+ZTlwH4bMrwbRtYbYEfMP10=
X-Received: by 2002:a05:6870:b17:b0:277:ef0f:cde4 with SMTP id
 586e51a60fabf-28ccb68e27emr3295811fac.46.1729710140223; Wed, 23 Oct 2024
 12:02:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Oct 2024 12:02:19 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20241018-arm-psci-system_reset2-vendor-reboots-v6-0-50cbe88b0a24@quicinc.com>
 <20241018-arm-psci-system_reset2-vendor-reboots-v6-3-50cbe88b0a24@quicinc.com>
 <CAE-0n515sUkmTWptgY8pOaMDBPfDp5pZBy9Nby+4cMdMAnAZfA@mail.gmail.com> <20241023092251529-0700.eberman@hu-eberman-lv.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 23 Oct 2024 12:02:19 -0700
Message-ID: <CAE-0n50s1gUt7jOWLEjDzi7ABVRLmAr1kG-6V6YjTZnPD2EMQw@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] firmware: psci: Read and use vendor reset types
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Andy Yan <andy.yan@rock-chips.com>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Will Deacon <will@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Melody Olvera <quic_molvera@quicinc.com>, 
	Shivendra Pratap <quic_spratap@quicinc.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Florian Fainelli <florian.fainelli@broadcom.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Elliot Berman (2024-10-23 09:30:21)
> On Fri, Oct 18, 2024 at 10:42:46PM -0700, Stephen Boyd wrote:
> > Quoting Elliot Berman (2024-10-18 12:39:48)
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > index 2328ca58bba6..60bc285622ce 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -305,9 +315,29 @@ static int get_set_conduit_method(const struct device_node *np)
> > >         return 0;
> > >  }
> > >
> > > +static void psci_vendor_sys_reset2(unsigned long action, void *data)
> > > +{
> > > +       const char *cmd = data;
> > > +       unsigned long ret;
> > > +       size_t i;
> > > +
> > > +       for (i = 0; i < num_psci_reset_params; i++) {
> > > +               if (!strcmp(psci_reset_params[i].mode, cmd)) {
> > > +                       ret = invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
> > > +                                            psci_reset_params[i].reset_type,
> > > +                                            psci_reset_params[i].cookie, 0);
> > > +                       pr_err("failed to perform reset \"%s\": %ld\n",
> > > +                               cmd, (long)ret);
> >
> > Do this intentionally return? Should it be some other function that's
> > __noreturn instead and a while (1) if the firmware returns back to the
> > kernel?
> >
>
> Yes, I think it's best to make sure we fall back to the architectural
> reset (whether it's the SYSTEM_RESET or architectural SYSTEM_RESET2)
> since device would reboot then.

Ok. Please add a comment in the code so we know that it's intentional.

>
> > > +               }
> > > +       }
> > > +}
> > > +
> > >  static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
> > >                           void *data)
> > >  {
> > > +       if (data && num_psci_reset_params)
> > > +               psci_vendor_sys_reset2(action, data);
> > > +

I'd add a comment here as well indicating that a fallback is used.

> > >         if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
> > >             psci_system_reset2_supported) {
> > >                 /*
> > > @@ -750,6 +780,68 @@ static const struct of_device_id psci_of_match[] __initconst = {
> > >         {},
[...]
> > > +                       continue;
> > > +
> > > +               num = of_property_read_variable_u32_array(np, prop->name, magic, 1, 2);
> >
> > ARRAY_SIZE(magic)?
> >
> > > +               if (num < 0) {
> >
> > Should this be less than 1?
> >
>
> of_property_read_variable_u32_array should return -EOVERFLOW (or maybe
> -ENODATA) if the array is empty. I don't see it's possible for
> of_property_read_variable_u32_array() to return a non-negative value
> that's not 1 or 2.

I think you're saying a return value of 0 is impossible? Ok. I was
mostly looking at the usage of the return value later on in this patch
and trying to understand why 0 would be allowed as a possible return
value without looking at the details of
of_property_read_variable_u32_array(). I guess the 1, 2 are the min/max
though so it's fine.

