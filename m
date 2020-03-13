Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B43B1184F53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 20:34:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgCMTe6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 15:34:58 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40773 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgCMTe6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 15:34:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id j17so8802002lfe.7;
        Fri, 13 Mar 2020 12:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l/mRv62X0XaIBhtgVxHbjqxj2E9e8KiIBDhSyDykOU8=;
        b=vEznxUDyFq8Lr/0vdqlxPjATUeuGRpdO0OXx6eB3a+WT3UnG1oh3GDPuFUa+BV+RuY
         v6wEMjPQe2PJKghmU9N5+feQleT14v/keHpvJ0gVALkBK6dlhHpLIZ76Frr4PTy6yOKk
         Y5xKOPm2QxiQLYaIzao6m79N8C3rxPg9AxxDkP9CBU8wN6kbRBAV3XWYq1XGvKtNrNaU
         Qmu7Pbj5KHWW0wU1Bw0O6+vF7KkyO9ANdxeFcIc+q6xnwWH1Mb0kt1VGa38dDYTEqsbl
         J7rUE5c6LBNa/FestQ0Sx0XYzJr8sJJVrmrFM77JthRoHIWXG87FGq71NcVMlv0mcWYE
         pqQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l/mRv62X0XaIBhtgVxHbjqxj2E9e8KiIBDhSyDykOU8=;
        b=OCWbpa2jTfeebIIfFKJA5/PvJTnvKCX+y2jnEfyhKJcqm1btQiRMTSbMye819k5xpy
         ER+IVfVa/e8fc57K7Fkn0MbrpCCyNHqYxr82IUHGe4lgxzIDKbmEQOWQpimkaDjQTJwT
         cI/wCW/OXvcsQG8MRKedjCopzxAvmH/bCOsFg5BnADEvOJIV8bFv9M7gccQADO0WXkew
         C7OZsAYwa7V3e+Uxv6QI0iJKuEGoWhvi6gUBg9z7TetNtE31NnOywbEDh+wltIuvlhaX
         xeRogNJOeruNw99LYmNVAyrGcD+h8uNcvq3gIUgOn6fcyTHHZVgo6OEuVKVlzw/sNJPI
         hpVQ==
X-Gm-Message-State: ANhLgQ38TaaFVfFAh3YGt9mRqAIZvXqyL1AmkdkoK6Xvx5g9l7FvumHh
        dusnZ6d5lJs+HeMSw6I2s4oppGEQaVASVhr4dpg=
X-Google-Smtp-Source: ADFU+vuNNbRf7UsKESIe+ZISnm+21+iEa/4l2p9GbRhfct05mfb9xSbpUgLASXM8XnRWB0vAYE0usF96k2AOEJ39Wt0=
X-Received: by 2002:a05:6512:15e:: with SMTP id m30mr9061753lfo.120.1584128092611;
 Fri, 13 Mar 2020 12:34:52 -0700 (PDT)
MIME-Version: 1.0
References: <ilia.lin@kernel.org> <20200313175213.8654-1-ansuelsmth@gmail.com>
In-Reply-To: <20200313175213.8654-1-ansuelsmth@gmail.com>
From:   Ilia Lin <ilia.lin@gmail.com>
Date:   Fri, 13 Mar 2020 21:34:41 +0200
Message-ID: <CA+5LGR3WJkwFGPWNM2XAqdhaNZ2yXreB8Ni36BKswx0G=i_5fg@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: qcom: Add support for krait based socs
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Ilia Lin <ilia.lin@kernel.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        "open list:QUALCOMM CPUFREQ DRIVER MSM8996/APQ8096" 
        <linux-pm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reviewed-by: Ilia Lin <ilia.lin@kernel.org>

On Fri, Mar 13, 2020 at 7:52 PM Ansuel Smith <ansuelsmth@gmail.com> wrote:
>
> In Certain QCOM SoCs like ipq8064, apq8064, msm8960, msm8974
> that has KRAIT processors the voltage/current value of each OPP
> varies based on the silicon variant in use.
>
> The required OPP related data is determined based on
> the efuse value. This is similar to the existing code for
> kryo cores. So adding support for krait cores here.
>
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
> v2:
> * Use switch when possible
> * Change free_opp1 to free_opp_names
> * Check if nvmem_cell_read fails
>
>  .../bindings/opp/qcom-nvmem-cpufreq.txt       |   3 +-
>  drivers/cpufreq/Kconfig.arm                   |   2 +-
>  drivers/cpufreq/cpufreq-dt-platdev.c          |   5 +
>  drivers/cpufreq/qcom-cpufreq-nvmem.c          | 191 ++++++++++++++++--
>  4 files changed, 183 insertions(+), 18 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> index 4751029b9b74..64f07417ecfb 100644
> --- a/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> +++ b/Documentation/devicetree/bindings/opp/qcom-nvmem-cpufreq.txt
> @@ -19,7 +19,8 @@ In 'cpu' nodes:
>
>  In 'operating-points-v2' table:
>  - compatible: Should be
> -       - 'operating-points-v2-kryo-cpu' for apq8096 and msm8996.
> +       - 'operating-points-v2-kryo-cpu' for apq8096, msm8996, msm8974,
> +                                            apq8064, ipq8064, msm8960 and ipq8074.
>
>  Optional properties:
>  --------------------
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 3858d86cf409..15c1a1231516 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -128,7 +128,7 @@ config ARM_OMAP2PLUS_CPUFREQ
>
>  config ARM_QCOM_CPUFREQ_NVMEM
>         tristate "Qualcomm nvmem based CPUFreq"
> -       depends on ARM64
> +       depends on ARCH_QCOM
>         depends on QCOM_QFPROM
>         depends on QCOM_SMEM
>         select PM_OPP
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index f2ae9cd455c1..cb9db16bea61 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -141,6 +141,11 @@ static const struct of_device_id blacklist[] __initconst = {
>         { .compatible = "ti,dra7", },
>         { .compatible = "ti,omap3", },
>
> +       { .compatible = "qcom,ipq8064", },
> +       { .compatible = "qcom,apq8064", },
> +       { .compatible = "qcom,msm8974", },
> +       { .compatible = "qcom,msm8960", },
> +
>         { }
>  };
>
> diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> index f0d2d5035413..a1b8238872a2 100644
> --- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
> +++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
> @@ -49,12 +49,14 @@ struct qcom_cpufreq_drv;
>  struct qcom_cpufreq_match_data {
>         int (*get_version)(struct device *cpu_dev,
>                            struct nvmem_cell *speedbin_nvmem,
> +                          char **pvs_name,
>                            struct qcom_cpufreq_drv *drv);
>         const char **genpd_names;
>  };
>
>  struct qcom_cpufreq_drv {
> -       struct opp_table **opp_tables;
> +       struct opp_table **names_opp_tables;
> +       struct opp_table **hw_opp_tables;
>         struct opp_table **genpd_opp_tables;
>         u32 versions;
>         const struct qcom_cpufreq_match_data *data;
> @@ -62,6 +64,84 @@ struct qcom_cpufreq_drv {
>
>  static struct platform_device *cpufreq_dt_pdev, *cpufreq_pdev;
>
> +static void get_krait_bin_format_a(struct device *cpu_dev,
> +                                         int *speed, int *pvs, int *pvs_ver,
> +                                         struct nvmem_cell *pvs_nvmem, u8 *buf)
> +{
> +       u32 pte_efuse;
> +
> +       pte_efuse = *((u32 *)buf);
> +
> +       *speed = pte_efuse & 0xf;
> +       if (*speed == 0xf)
> +               *speed = (pte_efuse >> 4) & 0xf;
> +
> +       if (*speed == 0xf) {
> +               *speed = 0;
> +               dev_warn(cpu_dev, "Speed bin: Defaulting to %d\n", *speed);
> +       } else {
> +               dev_dbg(cpu_dev, "Speed bin: %d\n", *speed);
> +       }
> +
> +       *pvs = (pte_efuse >> 10) & 0x7;
> +       if (*pvs == 0x7)
> +               *pvs = (pte_efuse >> 13) & 0x7;
> +
> +       if (*pvs == 0x7) {
> +               *pvs = 0;
> +               dev_warn(cpu_dev, "PVS bin: Defaulting to %d\n", *pvs);
> +       } else {
> +               dev_dbg(cpu_dev, "PVS bin: %d\n", *pvs);
> +       }
> +}
> +
> +static void get_krait_bin_format_b(struct device *cpu_dev,
> +                                         int *speed, int *pvs, int *pvs_ver,
> +                                         struct nvmem_cell *pvs_nvmem, u8 *buf)
> +{
> +       u32 pte_efuse, redundant_sel;
> +
> +       pte_efuse = *((u32 *)buf);
> +       redundant_sel = (pte_efuse >> 24) & 0x7;
> +
> +       *pvs_ver = (pte_efuse >> 4) & 0x3;
> +
> +       switch (redundant_sel) {
> +       case 1:
> +               *pvs = ((pte_efuse >> 28) & 0x8) | ((pte_efuse >> 6) & 0x7);
> +               *speed = (pte_efuse >> 27) & 0xf;
> +               break;
> +       case 2:
> +               *pvs = (pte_efuse >> 27) & 0xf;
> +               *speed = pte_efuse & 0x7;
> +               break;
> +       default:
> +               /* 4 bits of PVS are in efuse register bits 31, 8-6. */
> +               *pvs = ((pte_efuse >> 28) & 0x8) | ((pte_efuse >> 6) & 0x7);
> +               *speed = pte_efuse & 0x7;
> +       }
> +
> +       /* Check SPEED_BIN_BLOW_STATUS */
> +       if (pte_efuse & BIT(3)) {
> +               dev_dbg(cpu_dev, "Speed bin: %d\n", *speed);
> +       } else {
> +               dev_warn(cpu_dev, "Speed bin not set. Defaulting to 0!\n");
> +               *speed = 0;
> +       }
> +
> +       /* Check PVS_BLOW_STATUS */
> +       pte_efuse = *(((u32 *)buf) + 4);
> +       pte_efuse &= BIT(21);
> +       if (pte_efuse) {
> +               dev_dbg(cpu_dev, "PVS bin: %d\n", *pvs);
> +       } else {
> +               dev_warn(cpu_dev, "PVS bin not set. Defaulting to 0!\n");
> +               *pvs = 0;
> +       }
> +
> +       dev_dbg(cpu_dev, "PVS version: %d\n", *pvs_ver);
> +}
> +
>  static enum _msm8996_version qcom_cpufreq_get_msm_id(void)
>  {
>         size_t len;
> @@ -93,11 +173,13 @@ static enum _msm8996_version qcom_cpufreq_get_msm_id(void)
>
>  static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>                                           struct nvmem_cell *speedbin_nvmem,
> +                                         char **pvs_name,
>                                           struct qcom_cpufreq_drv *drv)
>  {
>         size_t len;
>         u8 *speedbin;
>         enum _msm8996_version msm8996_version;
> +       *pvs_name = NULL;
>
>         msm8996_version = qcom_cpufreq_get_msm_id();
>         if (NUM_OF_MSM8996_VERSIONS == msm8996_version) {
> @@ -125,10 +207,51 @@ static int qcom_cpufreq_kryo_name_version(struct device *cpu_dev,
>         return 0;
>  }
>
> +static int qcom_cpufreq_krait_name_version(struct device *cpu_dev,
> +                                          struct nvmem_cell *speedbin_nvmem,
> +                                          char **pvs_name,
> +                                          struct qcom_cpufreq_drv *drv)
> +{
> +       int speed = 0, pvs = 0, pvs_ver = 0;
> +       u8 *speedbin;
> +       size_t len;
> +
> +       speedbin = nvmem_cell_read(speedbin_nvmem, &len);
> +
> +       if (IS_ERR(speedbin))
> +               return PTR_ERR(speedbin);
> +
> +       switch (len) {
> +       case 4:
> +               get_krait_bin_format_a(cpu_dev, &speed, &pvs, &pvs_ver,
> +                                      speedbin_nvmem, speedbin);
> +               break;
> +       case 8:
> +               get_krait_bin_format_b(cpu_dev, &speed, &pvs, &pvs_ver,
> +                                      speedbin_nvmem, speedbin);
> +               break;
> +       default:
> +               dev_err(cpu_dev, "Unable to read nvmem data. Defaulting to 0!\n");
> +               return -ENODEV;
> +       }
> +
> +       snprintf(*pvs_name, sizeof("speedXX-pvsXX-vXX"), "speed%d-pvs%d-v%d",
> +                speed, pvs, pvs_ver);
> +
> +       drv->versions = (1 << speed);
> +
> +       kfree(speedbin);
> +       return 0;
> +}
> +
>  static const struct qcom_cpufreq_match_data match_data_kryo = {
>         .get_version = qcom_cpufreq_kryo_name_version,
>  };
>
> +static const struct qcom_cpufreq_match_data match_data_krait = {
> +       .get_version = qcom_cpufreq_krait_name_version,
> +};
> +
>  static const char *qcs404_genpd_names[] = { "cpr", NULL };
>
>  static const struct qcom_cpufreq_match_data match_data_qcs404 = {
> @@ -141,6 +264,7 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         struct nvmem_cell *speedbin_nvmem;
>         struct device_node *np;
>         struct device *cpu_dev;
> +       char *pvs_name = "speedXX-pvsXX-vXX";
>         unsigned cpu;
>         const struct of_device_id *match;
>         int ret;
> @@ -153,7 +277,7 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         if (!np)
>                 return -ENOENT;
>
> -       ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
> +       ret = of_device_is_compatible(np, "operating-points-v2-qcom-cpu");
>         if (!ret) {
>                 of_node_put(np);
>                 return -ENOENT;
> @@ -181,7 +305,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>                         goto free_drv;
>                 }
>
> -               ret = drv->data->get_version(cpu_dev, speedbin_nvmem, drv);
> +               ret = drv->data->get_version(cpu_dev,
> +                                                       speedbin_nvmem, &pvs_name, drv);
>                 if (ret) {
>                         nvmem_cell_put(speedbin_nvmem);
>                         goto free_drv;
> @@ -190,12 +315,20 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         }
>         of_node_put(np);
>
> -       drv->opp_tables = kcalloc(num_possible_cpus(), sizeof(*drv->opp_tables),
> +       drv->names_opp_tables = kcalloc(num_possible_cpus(),
> +                                 sizeof(*drv->names_opp_tables),
>                                   GFP_KERNEL);
> -       if (!drv->opp_tables) {
> +       if (!drv->names_opp_tables) {
>                 ret = -ENOMEM;
>                 goto free_drv;
>         }
> +       drv->hw_opp_tables = kcalloc(num_possible_cpus(),
> +                                 sizeof(*drv->hw_opp_tables),
> +                                 GFP_KERNEL);
> +       if (!drv->hw_opp_tables) {
> +               ret = -ENOMEM;
> +               goto free_opp_names;
> +       }
>
>         drv->genpd_opp_tables = kcalloc(num_possible_cpus(),
>                                         sizeof(*drv->genpd_opp_tables),
> @@ -213,11 +346,23 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>                 }
>
>                 if (drv->data->get_version) {
> -                       drv->opp_tables[cpu] =
> -                               dev_pm_opp_set_supported_hw(cpu_dev,
> -                                                           &drv->versions, 1);
> -                       if (IS_ERR(drv->opp_tables[cpu])) {
> -                               ret = PTR_ERR(drv->opp_tables[cpu]);
> +
> +                       if (pvs_name) {
> +                               drv->names_opp_tables[cpu] = dev_pm_opp_set_prop_name(
> +                                                                    cpu_dev,
> +                                                                    pvs_name);
> +                               if (IS_ERR(drv->names_opp_tables[cpu])) {
> +                                       ret = PTR_ERR(drv->names_opp_tables[cpu]);
> +                                       dev_err(cpu_dev, "Failed to add OPP name %s\n",
> +                                               pvs_name);
> +                                       goto free_opp;
> +                               }
> +                       }
> +
> +                       drv->hw_opp_tables[cpu] = dev_pm_opp_set_supported_hw(
> +                                                                        cpu_dev, &drv->versions, 1);
> +                       if (IS_ERR(drv->hw_opp_tables[cpu])) {
> +                               ret = PTR_ERR(drv->hw_opp_tables[cpu]);
>                                 dev_err(cpu_dev,
>                                         "Failed to set supported hardware\n");
>                                 goto free_genpd_opp;
> @@ -259,11 +404,18 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
>         kfree(drv->genpd_opp_tables);
>  free_opp:
>         for_each_possible_cpu(cpu) {
> -               if (IS_ERR_OR_NULL(drv->opp_tables[cpu]))
> +               if (IS_ERR_OR_NULL(drv->names_opp_tables[cpu]))
> +                       break;
> +               dev_pm_opp_put_prop_name(drv->names_opp_tables[cpu]);
> +       }
> +       for_each_possible_cpu(cpu) {
> +               if (IS_ERR_OR_NULL(drv->hw_opp_tables[cpu]))
>                         break;
> -               dev_pm_opp_put_supported_hw(drv->opp_tables[cpu]);
> +               dev_pm_opp_put_supported_hw(drv->hw_opp_tables[cpu]);
>         }
> -       kfree(drv->opp_tables);
> +       kfree(drv->hw_opp_tables);
> +free_opp_names:
> +       kfree(drv->names_opp_tables);
>  free_drv:
>         kfree(drv);
>
> @@ -278,13 +430,16 @@ static int qcom_cpufreq_remove(struct platform_device *pdev)
>         platform_device_unregister(cpufreq_dt_pdev);
>
>         for_each_possible_cpu(cpu) {
> -               if (drv->opp_tables[cpu])
> -                       dev_pm_opp_put_supported_hw(drv->opp_tables[cpu]);
> +               if (drv->names_opp_tables[cpu])
> +                       dev_pm_opp_put_supported_hw(drv->names_opp_tables[cpu]);
> +               if (drv->hw_opp_tables[cpu])
> +                       dev_pm_opp_put_supported_hw(drv->hw_opp_tables[cpu]);
>                 if (drv->genpd_opp_tables[cpu])
>                         dev_pm_opp_detach_genpd(drv->genpd_opp_tables[cpu]);
>         }
>
> -       kfree(drv->opp_tables);
> +       kfree(drv->names_opp_tables);
> +       kfree(drv->hw_opp_tables);
>         kfree(drv->genpd_opp_tables);
>         kfree(drv);
>
> @@ -303,6 +458,10 @@ static const struct of_device_id qcom_cpufreq_match_list[] __initconst = {
>         { .compatible = "qcom,apq8096", .data = &match_data_kryo },
>         { .compatible = "qcom,msm8996", .data = &match_data_kryo },
>         { .compatible = "qcom,qcs404", .data = &match_data_qcs404 },
> +       { .compatible = "qcom,ipq8064", .data = &match_data_krait },
> +       { .compatible = "qcom,apq8064", .data = &match_data_krait },
> +       { .compatible = "qcom,msm8974", .data = &match_data_krait },
> +       { .compatible = "qcom,msm8960", .data = &match_data_krait },
>         {},
>  };
>
> --
> 2.25.0
>
