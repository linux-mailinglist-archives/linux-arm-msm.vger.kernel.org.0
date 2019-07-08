Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9075B61AB2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jul 2019 08:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728124AbfGHGbJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jul 2019 02:31:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727420AbfGHGbI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jul 2019 02:31:08 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C10092086D;
        Mon,  8 Jul 2019 06:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562567467;
        bh=jSFgFxfe9o6my7UL5i7G5MALdVwquHyxK2t082xybpk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=2W0oFgvM8jehuH1WGpPclJGgCz5Euh0X8QfxgB4RHK3b/0wL0s/xa5DG99yiknKhB
         jOXmSSsSE+eC7GyUi6BeAOVy+x3g55T/YQPQ74zYMARUWisOzHtIjXaKyQ+PE67jLc
         0NutBdH3expYHb6inxFGDxwf02VtJhwjfi6sQplU=
Received: by mail-ua1-f42.google.com with SMTP id v18so4493867uad.12;
        Sun, 07 Jul 2019 23:31:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUnyDj7QGvVJbBYIQukmHcxO42EGtEpEvIksAWbbP5yBiii0vqR
        UX05/LaI9vH/1X8s5vVfQQmnu5YinQsglf3Ys+s=
X-Google-Smtp-Source: APXvYqx29+GQuxJJpk8peZuVuc8MajdoF3HA8kL7xSMlrhJYsSDPgcpnbSAVXYzCmk9Jbhwog2A2rJdLjksUcrk4Jos=
X-Received: by 2002:ab0:3007:: with SMTP id f7mr5689027ual.12.1562567466013;
 Sun, 07 Jul 2019 23:31:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190705095726.21433-1-niklas.cassel@linaro.org> <20190705095726.21433-5-niklas.cassel@linaro.org>
In-Reply-To: <20190705095726.21433-5-niklas.cassel@linaro.org>
From:   Ilia Lin <ilia.lin@kernel.org>
Date:   Mon, 8 Jul 2019 09:30:54 +0300
X-Gmail-Original-Message-ID: <CA+5LGR1epG=1yFfY=kVoLLAU2psXQXPFywoeWw13CE=gZbOTdQ@mail.gmail.com>
Message-ID: <CA+5LGR1epG=1yFfY=kVoLLAU2psXQXPFywoeWw13CE=gZbOTdQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] cpufreq: qcom: Refactor the driver to make it
 easier to extend
To:     Niklas Cassel <niklas.cassel@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-arm-msm@vger.kernel.org, jorge.ramirez-ortiz@linaro.org,
        Stephen Boyd <sboyd@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Ilia Lin <ilia.lin@kernel.org>

On Fri, Jul 5, 2019 at 12:58 PM Niklas Cassel <niklas.cassel@linaro.org> wrote:
>
> Refactor the driver to make it easier to extend in a later commit.
>
> Create a driver struct to collect all common resources, in order to make
> it easier to free up all common resources.
> Create a driver match_data struct to make it easier to extend the driver
> with support for new features that might only be supported on certain SoCs.
>
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
> Changes since RFC:
> -Changed type of versions to u32 from u32*.
> -Make the driver use a match_data struct, so that different SoC can have
> different features.
> -Fixed error handling.
>
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 123 +++++++++++++++++----------
>  1 file changed, 79 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index fad6509eecb5..c0377b0eb2f4 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -43,6 +43,20 @@ enum _msm8996_version {
>         NUM_OF_MSM8996_VERSIONS,
>  };
>
> +struct qcom_cpufreq_drv;
> +
> +struct qcom_cpufreq_match_data {
> +       int (*get_version)(struct device *cpu_dev,
> +                          struct nvmem_cell *speedbin_nvmem,
> +                          struct qcom_cpufreq_drv *drv);
> +};
> +
> +struct qcom_cpufreq_drv {
> +       struct opp_table **opp_tables;
> +       u32 versions;
> +       const struct qcom_cpufreq_match_data *data;
> +};
> +
>  static struct platform_device *cpufreq_dt_pdev, *cpufreq_pdev;
>
>  static enum _msm8996_version qcom_cpufreq_get_msm_id(void)
> @@ -76,7 +90,7 @@ static enum _msm8996_version qcom_cpufreq_get_msm_id(void)
>
>  static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>                                           struct nvmem_cell *speedbin_nvmem,
> -                                         u32 *versions)
> +                                         struct qcom_cpufreq_drv *drv)
>  {
>         size_t len;
>         u8 *speedbin;
> @@ -94,10 +108,10 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>
>         switch (msm8996_version) {
>         case MSM8996_V3:
> -               *versions = 1 << (unsigned int)(*speedbin);
> +               drv->versions = 1 << (unsigned int)(*speedbin);
>                 break;
>         case MSM8996_SG:
> -               *versions = 1 << ((unsigned int)(*speedbin) + 4);
> +               drv->versions = 1 << ((unsigned int)(*speedbin) + 4);
>                 break;
>         default:
>                 BUG();
> @@ -108,17 +122,17 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>         return 0;
>  }
>
> +static const struct qcom_cpufreq_match_data match_data_kryo = {
> +       .get_version = qcom_cpufreq_kryo_name_version,
> +};
> +
>  static int qcom_cpufreq_probe(struct platform_device *pdev)
>  {
> -       struct opp_table **opp_tables;
> -       int (*get_version)(struct device *cpu_dev,
> -                          struct nvmem_cell *speedbin_nvmem,
> -                          u32 *versions);
> +       struct qcom_cpufreq_drv *drv;
>         struct nvmem_cell *speedbin_nvmem;
>         struct device_node *np;
>         struct device *cpu_dev;
>         unsigned cpu;
> -       u32 versions;
>         const struct of_device_id *match;
>         int ret;
>
> @@ -126,11 +140,6 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         if (!cpu_dev)
>                 return -ENODEV;
>
> -       match = pdev->dev.platform_data;
> -       get_version = match->data;
> -       if (!get_version)
> -               return -ENODEV;
> -
>         np = dev_pm_opp_of_get_opp_desc_node(cpu_dev);
>         if (!np)
>                 return -ENOENT;
> @@ -141,23 +150,43 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>                 return -ENOENT;
>         }
>
> -       speedbin_nvmem = of_nvmem_cell_get(np, NULL);
> -       of_node_put(np);
> -       if (IS_ERR(speedbin_nvmem)) {
> -               if (PTR_ERR(speedbin_nvmem) != -EPROBE_DEFER)
> -                       dev_err(cpu_dev, "Could not get nvmem cell: %ld\n",
> -                               PTR_ERR(speedbin_nvmem));
> -               return PTR_ERR(speedbin_nvmem);
> +       drv = kzalloc(sizeof(*drv), GFP_KERNEL);
> +       if (!drv)
> +               return -ENOMEM;
> +
> +       match = pdev->dev.platform_data;
> +       drv->data = match->data;
> +       if (!drv->data) {
> +               ret = -ENODEV;
> +               goto free_drv;
>         }
>
> -       ret = get_version(cpu_dev, speedbin_nvmem, &versions);
> -       nvmem_cell_put(speedbin_nvmem);
> -       if (ret)
> -               return ret;
> +       if (drv->data->get_version) {
> +               speedbin_nvmem = of_nvmem_cell_get(np, NULL);
> +               of_node_put(np);
> +               if (IS_ERR(speedbin_nvmem)) {
> +                       if (PTR_ERR(speedbin_nvmem) != -EPROBE_DEFER)
> +                               dev_err(cpu_dev,
> +                                       "Could not get nvmem cell: %ld\n",
> +                                       PTR_ERR(speedbin_nvmem));
> +                       ret = PTR_ERR(speedbin_nvmem);
> +                       goto free_drv;
> +               }
>
> -       opp_tables = kcalloc(num_possible_cpus(), sizeof(*opp_tables), GFP_KERNEL);
> -       if (!opp_tables)
> -               return -ENOMEM;
> +               ret = drv->data->get_version(cpu_dev, speedbin_nvmem, drv);
> +               if (ret) {
> +                       nvmem_cell_put(speedbin_nvmem);
> +                       goto free_drv;
> +               }
> +               nvmem_cell_put(speedbin_nvmem);
> +       }
> +
> +       drv->opp_tables = kcalloc(num_possible_cpus(), sizeof(*drv->opp_tables),
> +                                 GFP_KERNEL);
> +       if (!drv->opp_tables) {
> +               ret = -ENOMEM;
> +               goto free_drv;
> +       }
>
>         for_each_possible_cpu(cpu) {
>                 cpu_dev = get_cpu_device(cpu);
> @@ -166,19 +195,23 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>                         goto free_opp;
>                 }
>
> -               opp_tables[cpu] = dev_pm_opp_set_supported_hw(cpu_dev,
> -                                                             &versions, 1);
> -               if (IS_ERR(opp_tables[cpu])) {
> -                       ret = PTR_ERR(opp_tables[cpu]);
> -                       dev_err(cpu_dev, "Failed to set supported hardware\n");
> -                       goto free_opp;
> +               if (drv->data->get_version) {
> +                       drv->opp_tables[cpu] =
> +                               dev_pm_opp_set_supported_hw(cpu_dev,
> +                                                           &drv->versions, 1);
> +                       if (IS_ERR(drv->opp_tables[cpu])) {
> +                               ret = PTR_ERR(drv->opp_tables[cpu]);
> +                               dev_err(cpu_dev,
> +                                       "Failed to set supported hardware\n");
> +                               goto free_opp;
> +                       }
>                 }
>         }
>
>         cpufreq_dt_pdev = platform_device_register_simple("cpufreq-dt", -1,
>                                                           NULL, 0);
>         if (!IS_ERR(cpufreq_dt_pdev)) {
> -               platform_set_drvdata(pdev, opp_tables);
> +               platform_set_drvdata(pdev, drv);
>                 return 0;
>         }
>
> @@ -187,26 +220,30 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>
>  free_opp:
>         for_each_possible_cpu(cpu) {
> -               if (IS_ERR_OR_NULL(opp_tables[cpu]))
> +               if (IS_ERR_OR_NULL(drv->opp_tables[cpu]))
>                         break;
> -               dev_pm_opp_put_supported_hw(opp_tables[cpu]);
> +               dev_pm_opp_put_supported_hw(drv->opp_tables[cpu]);
>         }
> -       kfree(opp_tables);
> +       kfree(drv->opp_tables);
> +free_drv:
> +       kfree(drv);
>
>         return ret;
>  }
>
>  static int qcom_cpufreq_remove(struct platform_device *pdev)
>  {
> -       struct opp_table **opp_tables = platform_get_drvdata(pdev);
> +       struct qcom_cpufreq_drv *drv = platform_get_drvdata(pdev);
>         unsigned int cpu;
>
>         platform_device_unregister(cpufreq_dt_pdev);
>
>         for_each_possible_cpu(cpu)
> -               dev_pm_opp_put_supported_hw(opp_tables[cpu]);
> +               if (drv->opp_tables[cpu])
> +                       dev_pm_opp_put_supported_hw(drv->opp_tables[cpu]);
>
> -       kfree(opp_tables);
> +       kfree(drv->opp_tables);
> +       kfree(drv);
>
>         return 0;
>  }
> @@ -220,10 +257,8 @@ static struct platform_driver qcom_cpufreq_driver = {
>  };
>
>  static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
> -       { .compatible = "qcom,apq8096",
> -         .data = qcom_cpufreq_kryo_name_version },
> -       { .compatible = "qcom,msm8996",
> -         .data = qcom_cpufreq_kryo_name_version },
> +       { .compatible = "qcom,apq8096", .data = &match_data_kryo },
> +       { .compatible = "qcom,msm8996", .data = &match_data_kryo },
>         {},
>  };
>
> --
> 2.21.0
>
