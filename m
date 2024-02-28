Return-Path: <linux-arm-msm+bounces-12890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACB686B379
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 16:43:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FA1BB28152
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Feb 2024 15:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AFE615DBDD;
	Wed, 28 Feb 2024 15:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X44IyKpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7371315DBBA
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 15:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709134899; cv=none; b=CfD34A6BVJJAu2K3Dqpe1RH/EHrnt8VceussWrI5mnuQNWasNnUv6K4fhYIKEgJ3gHUx/UziNQQTRHnwgFVQOvCj8XO65fClZeTrvEA8VUPEsIDWo3Oyng04qCGIJ40Sy7ZFdFNmMIiM4qgJ8vpen62t833uo9oInOlnhUC6tFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709134899; c=relaxed/simple;
	bh=Y3CqL3ZtH8qv+iuGi9/RE7DcS3/Oa1WDQHkXAOzWuWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jDVt031R/rq1sIgDvQzvKf+UWXE0/NAqPXJ//nuFiq8se6JTyRTJIaNeviAwDjyylxlUjnJm8r88eMQGImqFnPGc/y8K326QxGj2yADQQaELMU82c61RVZtlMERJYgze0NMAd0xYQO/2S0HIYTcNLnXAZ4SmTiOxBRiRcgfr/Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X44IyKpN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5661b7b1f51so4364766a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Feb 2024 07:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709134896; x=1709739696; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BUg2H32plNGlq0vHABZiW3cHIK6mnZ+TaVaS2PgJthI=;
        b=X44IyKpN0Jq1Oy/R7g+eEGcAj+NhfzZPl7T4kDdMZUrmnZ9B1rJb32z4g0XrLsZmZr
         ApupvEm0tYxPfqjAhjmJehr5lI/u3whZWNwdUSWJP55BuGxA6VHyUONIjphNeBAPOBmO
         GcAeOlR8yaXlLq2s5dQ6oZ7PjYR8oUyObDFl8jcwCeMDr0Nt2nO2aYTbq9c+OY8SNfAh
         NdqDs8XQMMOSUOYd30gT3hJuatcB6oYaErgizeeD7NX31dzXFWh0Gg/D5XQRzW2W9Qpb
         wBuTwJOJwrbkkDK0bBJV6DulGhoqPLIlwWkgwkK9GFbGkP0JItjRhVz8zfF6U5PHPaJU
         7rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709134896; x=1709739696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUg2H32plNGlq0vHABZiW3cHIK6mnZ+TaVaS2PgJthI=;
        b=icghP5+LtdUiNL1FGLzP6ugrldV3w8ZdDVCXPllprfZzue4VFcnTicOjl4wItSn2Ta
         EbaLm6sXTTA44E47POSbedDJitv+ehfQAymF6Yxd45Cx4nA2zoqNcEiye+g1PJxr3ull
         7HRpJ3PLuJgIhYCoRfdSfySp8bc3NeAC9M0m0/SIie4AapfxjZIG4h+/6uBDqRzm8xgL
         KNY0jop3E8Ir+A+TpijyUcEomTkaPvrYfzLUa9/5BZQTCMObkGX1UOEh2Xmhhhz3fR0E
         vflmP0jL6694GtBN9hH+SEDveMGz1TmugL3eDgluXanvtB78v2SB7aSqeFxqL/w31wa0
         w1TA==
X-Forwarded-Encrypted: i=1; AJvYcCVI/zzqCskdikKlCzTDFJ0IqtMc3N9BJq+vzSCNauaPDFO6GsOdml3WV/uNzxW8gVGDMcQWrxtWv56tQjp5AQahUKlKspJd0o4RDvycCw==
X-Gm-Message-State: AOJu0YxkopQlQJqyE7ZcLa7JfobyJQJfdXP4HMc5VMIv/YCBk0X0gwtG
	R97ondhJZ6xQ3NLbifzmsL+aLb7Dh9mrFgEKwS4UtpCL1Z1DF4+j9ozFKblVw9vXM401YsdSi+P
	Bp1KcBPQen9Hf7ZoTuYdsUVLEL8sZ5TUYYbZiBQ==
X-Google-Smtp-Source: AGHT+IEdoGphs4qV9yXffW2xSbebK1gxJ1XCt7GmQTsCwVCc1R6Uk48iHbYCDQmdSAdkDcUcqwe5iX6aNn0qqtrYjDA=
X-Received: by 2002:a05:6402:556:b0:565:cbba:b79a with SMTP id
 i22-20020a056402055600b00565cbbab79amr7175525edx.13.1709134895902; Wed, 28
 Feb 2024 07:41:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240217-init_level-v1-0-bde9e11f8317@quicinc.com> <20240217-init_level-v1-2-bde9e11f8317@quicinc.com>
In-Reply-To: <20240217-init_level-v1-2-bde9e11f8317@quicinc.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 28 Feb 2024 16:40:59 +0100
Message-ID: <CAPDyKFoBmZ1CW1OrT5WW64jKHnRMw2P7DCc8bRxR18PJhmUMig@mail.gmail.com>
Subject: Re: [PATCH 2/2] cpuidle: psci: Update init level to core_initcall()
To: Maulik Shah <quic_mkshah@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_lsrao@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 17 Feb 2024 at 14:57, Maulik Shah <quic_mkshah@quicinc.com> wrote:
>
> Clients like regulators, interconnects and clocks depend on rpmh-rsc to
> vote on resources and rpmh-rsc depends on psci power-domains to complete
> probe. All of them are in core_initcall().
>
> Change psci domain init level to core_initcall() to avoid probe defer from
> all of the above.
>
> Signed-off-by: Maulik Shah <quic_mkshah@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/cpuidle/cpuidle-psci-domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
> index b88af1262f1a..3e5b1150f75b 100644
> --- a/drivers/cpuidle/cpuidle-psci-domain.c
> +++ b/drivers/cpuidle/cpuidle-psci-domain.c
> @@ -200,4 +200,4 @@ static int __init psci_idle_init_domains(void)
>  {
>         return platform_driver_register(&psci_cpuidle_domain_driver);
>  }
> -subsys_initcall(psci_idle_init_domains);
> +core_initcall(psci_idle_init_domains);
>
> --
> 2.22.0
>

