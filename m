Return-Path: <linux-arm-msm+bounces-1459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91B757F42B8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 10:48:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 228E7B21119
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 09:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20D2456476;
	Wed, 22 Nov 2023 09:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KNQRS8NL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CE63212D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 01:48:34 -0800 (PST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-db40b699d2bso261790276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Nov 2023 01:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700646513; x=1701251313; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PK84ms7FIdVTsWWVQYLYZx3PA5nxXbNykyMrmNGcMno=;
        b=KNQRS8NL8IsmuTVzFZwfYdbMjbi3vDIsR2prWjyS9ZlkFqPbXaAzwTzmD6R7Wa0GSz
         EFAJLT8iy+E47G4w/adtkViXdXQzScJmiK/Qn8wp8cJKdiZAt64r/xYjqT3QcCyKUL2Y
         CtbPsW4Xs8vN2g2tzVLsQY9dlnzmciwdsf4v8baxluBe0db4tvRjHEug0ZlrD4J0x0kO
         O6VLCTV4cSjN0uWbyRXRu2TmuZKaZHsre6XiDduFtPIS37w3uz1EP+dLAfH3qTpuzM+F
         engiaK/xea8F1cmVVXu0PPZ3B14TRDJHjh6EEncxUDUyEmtLLSR499/GJuXgr15I6JQW
         jC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700646513; x=1701251313;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK84ms7FIdVTsWWVQYLYZx3PA5nxXbNykyMrmNGcMno=;
        b=Pg7ucabOynSiWKD95qWH9nNUVvGwSKEtmQ1g4lHoYoWKsVCeaNMyaNv8rhZVJLCevJ
         OLVE15jIV+2DkB7HR42C5uojTiH51DhFenrfWz/ShowvXLbz2OYTzO1RvxvsYL3c5hyK
         oJ/W7NPv51PyY6R5XEUTBZQPfEtOf1SgIxTqOCZDqWX7MHkoSu6+746Y9oOlZsDInvu+
         Agsrl8i3Jez4Km8XS7Xw4NzzNHef16LzfHNnukwWRQtoAA21YOUiF7iy19vD+msbzIKr
         ZZ2tSnS9kZprg2s7omHhxvjkmcIB9atcN1+MR5X5J9aZRHZFRjvLIXdmSTV8G13vcdhe
         AqAw==
X-Gm-Message-State: AOJu0YzyygcPWOlbG6Wt0r225KGhyFGxf616XDnf3liQw0wfnbTyepjS
	8KW1Cqs1aHojAm7K1coz8os55u17I6AC00300SQKUA==
X-Google-Smtp-Source: AGHT+IHdTV/0/uZlSh9c9qAIbY49um8FRdZxhgynjgw4EjeHTUqDJf8dzPOKOyax7hcrRcwOpVSAULDyg7MeFztEyxc=
X-Received: by 2002:a25:c547:0:b0:db3:8b55:1951 with SMTP id
 v68-20020a25c547000000b00db38b551951mr1542151ybe.63.1700646513271; Wed, 22
 Nov 2023 01:48:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231114-msm8909-cpufreq-v3-0-926097a6e5c1@kernkonzept.com> <20231114-msm8909-cpufreq-v3-1-926097a6e5c1@kernkonzept.com>
In-Reply-To: <20231114-msm8909-cpufreq-v3-1-926097a6e5c1@kernkonzept.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Nov 2023 10:47:56 +0100
Message-ID: <CAPDyKFqa2U3g-7xVjxmsiYHsxujvJc0QCXWXHxPZAQR0ZJJo8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] cpufreq: qcom-nvmem: Enable virtual power domain devices
To: Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Stephan Gerhold <stephan@gerhold.net>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 14 Nov 2023 at 11:08, Stephan Gerhold
<stephan.gerhold@kernkonzept.com> wrote:
>
> The genpd core caches performance state votes from devices that are
> runtime suspended as of commit 3c5a272202c2 ("PM: domains: Improve
> runtime PM performance state handling"). They get applied once the
> device becomes active again.
>
> To attach the power domains needed by qcom-cpufreq-nvmem the OPP core
> calls genpd_dev_pm_attach_by_id(). This results in "virtual" dummy
> devices that use runtime PM only to control the enable and performance
> state for the attached power domain.
>
> However, at the moment nothing ever resumes the virtual devices created
> for qcom-cpufreq-nvmem. They remain permanently runtime suspended. This
> means that performance state votes made during cpufreq scaling get
> always cached and never applied to the hardware.
>
> Fix this by enabling the devices after attaching them.
>
> Without this fix performance states votes are silently ignored, and the
> CPU/CPR voltage is never adjusted. This has been broken since 5.14 but
> for some reason no one noticed this on QCS404 so far.
>
> Cc: stable@vger.kernel.org
> Fixes: 1cb8339ca225 ("cpufreq: qcom: Add support for qcs404 on nvmem driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@kernkonzept.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 46 +++++++++++++++++++++++++++++++++---
>  1 file changed, 43 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index 6355a39418c5..d239a45ed497 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -25,6 +25,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/slab.h>
>  #include <linux/soc/qcom/smem.h>
>
> @@ -55,6 +56,7 @@ struct qcom_cpufreq_match_data {
>
>  struct qcom_cpufreq_drv_cpu {
>         int opp_token;
> +       struct device **virt_devs;
>  };
>
>  struct qcom_cpufreq_drv {
> @@ -424,6 +426,18 @@ static const struct qcom_cpufreq_match_data match_data_ipq8074 = {
>         .get_version = qcom_cpufreq_ipq8074_name_version,
>  };
>
> +static void qcom_cpufreq_put_virt_devs(struct qcom_cpufreq_drv *drv, unsigned int cpu)
> +{
> +       const char * const *name = drv->data->genpd_names;
> +       int i;
> +
> +       if (!drv->cpus[cpu].virt_devs)
> +               return;
> +
> +       for (i = 0; *name; i++, name++)
> +               pm_runtime_put(drv->cpus[cpu].virt_devs[i]);
> +}
> +
>  static int qcom_cpufreq_probe(struct platform_device *pdev)
>  {
>         struct qcom_cpufreq_drv *drv;
> @@ -478,6 +492,7 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         of_node_put(np);
>
>         for_each_possible_cpu(cpu) {
> +               struct device **virt_devs = NULL;
>                 struct dev_pm_opp_config config = {
>                         .supported_hw = NULL,
>                 };
> @@ -498,7 +513,7 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>
>                 if (drv->data->genpd_names) {
>                         config.genpd_names = drv->data->genpd_names;
> -                       config.virt_devs = NULL;
> +                       config.virt_devs = &virt_devs;
>                 }
>
>                 if (config.supported_hw || config.genpd_names) {
> @@ -509,6 +524,27 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>                                 goto free_opp;
>                         }
>                 }
> +
> +               if (virt_devs) {
> +                       const char * const *name = config.genpd_names;
> +                       int i, j;
> +
> +                       for (i = 0; *name; i++, name++) {
> +                               ret = pm_runtime_resume_and_get(virt_devs[i]);
> +                               if (ret) {
> +                                       dev_err(cpu_dev, "failed to resume %s: %d\n",
> +                                               *name, ret);
> +
> +                                       /* Rollback previous PM runtime calls */
> +                                       name = config.genpd_names;
> +                                       for (j = 0; *name && j < i; j++, name++)
> +                                               pm_runtime_put(virt_devs[j]);
> +
> +                                       goto free_opp;
> +                               }
> +                       }
> +                       drv->cpus[cpu].virt_devs = virt_devs;
> +               }
>         }
>
>         cpufreq_dt_pdev = platform_device_register_simple("cpufreq-dt", -1,
> @@ -522,8 +558,10 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         dev_err(cpu_dev, "Failed to register platform device\n");
>
>  free_opp:
> -       for_each_possible_cpu(cpu)
> +       for_each_possible_cpu(cpu) {
> +               qcom_cpufreq_put_virt_devs(drv, cpu);
>                 dev_pm_opp_clear_config(drv->cpus[cpu].opp_token);
> +       }
>         return ret;
>  }
>
> @@ -534,8 +572,10 @@ static void qcom_cpufreq_remove(struct platform_device *pdev)
>
>         platform_device_unregister(cpufreq_dt_pdev);
>
> -       for_each_possible_cpu(cpu)
> +       for_each_possible_cpu(cpu) {
> +               qcom_cpufreq_put_virt_devs(drv, cpu);
>                 dev_pm_opp_clear_config(drv->cpus[cpu].opp_token);
> +       }
>  }
>
>  static struct platform_driver qcom_cpufreq_driver = {
>
> --
> 2.39.2
>

