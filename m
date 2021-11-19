Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE7FB456714
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Nov 2021 01:54:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233810AbhKSA5w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Nov 2021 19:57:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbhKSA5v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Nov 2021 19:57:51 -0500
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FACC061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 16:54:51 -0800 (PST)
Received: by mail-ot1-x331.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so14135472otg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Nov 2021 16:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=YtbzYcH20HCvxqP+/jnZdYoOJLvfi4p9cYsZ82G0wxg=;
        b=YSnwXhgG+0sOhhkkxQeMAYOVA85727/2DFwIjcMcfM/zcjtmmeC1PIyXziCTpkvPXt
         wljKrwBJEJE7wOsVd1n8S2q+pf/4KXSpBswfDCjylJAL4OU9ceH8BPCdBbySaMhljf4k
         tZbmbP9GTznrgxAwaqf/T4p69Tq4loztfAzhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=YtbzYcH20HCvxqP+/jnZdYoOJLvfi4p9cYsZ82G0wxg=;
        b=lOtCp/MHkfyIdiXkIa1emsf1PMKl6vtA9cx0ascAkgyw+85k2LRSsOvn8lvMt2P3id
         z8zjuhm6Z3sJ7d6AsJ/GkSh8GMF+TdlcF8D/bDA6NiGGPopq0txiSZ3H9dYeg2lZuvWR
         hIId43hVBnlLpKjlslKfBPcI7IiAvu+JrONVSF8KgpxF7ZzeSe4b92dhmCWAZH8KCEIm
         0ascA5c4P7vQJ1HW97yt+luGMlLP1YVfipi3aEdR3bpezGaqU95PAt5/8w1Z9vGOQ88o
         eWnUAr1m17VF1PZ5b1cAYxlv6Tejk5C5bskuAn4TXQ1vxVbXgiKQGoLnvfPfLKJcycJy
         RZ2A==
X-Gm-Message-State: AOAM531g1ItvAJdNnPIDRkmbwRprFWP8wT9IjHhCDet9+vEsvkhL5hAc
        rbhJKvMvSZiaCJaWJFqk1n30OZX3JejXSGDuQuQctA==
X-Google-Smtp-Source: ABdhPJyDd0hrbleHezY0hLWJtqvrTiRAue5bx79zJQJU08DkPgzeJPBPBOXM/6epGLykUFqeI1tAQP9RrBpuGgDBAuE=
X-Received: by 2002:a05:6830:30b7:: with SMTP id g23mr1190918ots.159.1637283290320;
 Thu, 18 Nov 2021 16:54:50 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Nov 2021 01:54:49 +0100
MIME-Version: 1.0
In-Reply-To: <1637250620-8926-4-git-send-email-pillair@codeaurora.org>
References: <1637250620-8926-1-git-send-email-pillair@codeaurora.org> <1637250620-8926-4-git-send-email-pillair@codeaurora.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Fri, 19 Nov 2021 01:54:49 +0100
Message-ID: <CAE-0n5371rNqs6+_ZRtPDqOb7WCrzXUHbxGMjPAdVeLsGgX8_w@mail.gmail.com>
Subject: Re: [PATCH v9 3/3] remoteproc: qcom: q6v5_wpss: Add support for
 sc7280 WPSS
To:     Rakesh Pillai <pillair@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        ohad@wizery.com, p.zabel@pengutronix.de, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibis@codeaurora.org, mpubbise@codeaurora.org, kuabhs@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rakesh Pillai (2021-11-18 07:50:20)
> Add support for PIL loading of WPSS processor for SC7280
> - WPSS boot will be requested by the wifi driver and hence
>   disable auto-boot for WPSS.
> - Add a separate shutdown sequence handler for WPSS.
> - Add multiple power-domain voting support
> - Parse firmware-name from dtsi entry
>
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> ---

Just a couple nitpicks. Otherwise looks good to me.

>  drivers/remoteproc/qcom_q6v5_adsp.c | 222 +++++++++++++++++++++++++++++++++---
>  1 file changed, 206 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 098362e6..34a6b73 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -32,6 +32,7 @@
>
>  /* time out value */
>  #define ACK_TIMEOUT                    1000
> +#define ACK_TIMEOUT_US                 1000000
>  #define BOOT_FSM_TIMEOUT               10000
>  /* mask values */
>  #define EVB_MASK                       GENMASK(27, 4)
> @@ -51,6 +52,8 @@
>  #define QDSP6SS_CORE_CBCR      0x20
>  #define QDSP6SS_SLEEP_CBCR     0x3c
>
> +#define QCOM_Q6V5_RPROC_PROXY_PD_MAX   3
> +
>  struct adsp_pil_data {
>         int crash_reason_smem;
>         const char *firmware_name;
> @@ -58,9 +61,13 @@ struct adsp_pil_data {
>         const char *ssr_name;
>         const char *sysmon_name;
>         int ssctl_id;
> +       bool is_wpss;
> +       bool auto_boot;
>
>         const char **clk_ids;
>         int num_clks;
> +       const char **proxy_pd_names;
> +       const char *load_state;
>  };
>
>  struct qcom_adsp {
> @@ -93,11 +100,146 @@ struct qcom_adsp {
>         void *mem_region;
>         size_t mem_size;
>
> +       struct device *proxy_pds[QCOM_Q6V5_RPROC_PROXY_PD_MAX];
> +       size_t proxy_pd_count;
> +
>         struct qcom_rproc_glink glink_subdev;
>         struct qcom_rproc_ssr ssr_subdev;
>         struct qcom_sysmon *sysmon;
> +
> +       int (*shutdown)(struct qcom_adsp *adsp);
>  };
>
> +static int qcom_rproc_pds_attach(struct device *dev, struct device **devs,

Can 'devs' be replaced by 'struct qcom_adsp'? And then we can compare
the size against ARRAY_SIZE(adsp->proxy_pds) instead of the #define.

> +                                const char **pd_names)
> +{
> +       size_t num_pds = 0;
> +       int ret;
> +       int i;
> +
> +       if (!pd_names)
> +               return 0;
> +
> +       /* Handle single power domain */
> +       if (dev->pm_domain) {
> +               devs[0] = dev;
> +               pm_runtime_enable(dev);
> +               return 1;
> +       }
> +
> +       while (pd_names[num_pds])
> +               num_pds++;
> +
> +       if (num_pds > QCOM_Q6V5_RPROC_PROXY_PD_MAX)
> +               return -E2BIG;
> +
> +       for (i = 0; i < num_pds; i++) {
> +               devs[i] = dev_pm_domain_attach_by_name(dev, pd_names[i]);
> +               if (IS_ERR_OR_NULL(devs[i])) {
> +                       ret = PTR_ERR(devs[i]) ? : -ENODATA;
> +                       goto unroll_attach;
> +               }
> +       }
> +
> +       return num_pds;
> +
> +unroll_attach:
> +       for (i--; i >= 0; i--)
> +               dev_pm_domain_detach(devs[i], false);
> +
> +       return ret;
> +}
> +
> +static void qcom_rproc_pds_detach(struct qcom_adsp *adsp, struct device **pds,
> +                                 size_t pd_count)
> +{
> +       struct device *dev = adsp->dev;
> +       int i;
> +
> +       /* Handle single power domain */
> +       if (dev->pm_domain && pd_count) {
> +               pm_runtime_disable(dev);
> +               return;
> +       }
> +
> +       for (i = 0; i < pd_count; i++)
> +               dev_pm_domain_detach(pds[i], false);
> +}
> +
> +static int qcom_rproc_pds_enable(struct qcom_adsp *adsp, struct device **pds,
> +                                size_t pd_count)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < pd_count; i++) {
> +               dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
> +               ret = pm_runtime_get_sync(pds[i]);
> +               if (ret < 0) {
> +                       pm_runtime_put_noidle(pds[i]);
> +                       dev_pm_genpd_set_performance_state(pds[i], 0);
> +                       goto unroll_pd_votes;
> +               }
> +       }
> +
> +       return 0;
> +
> +unroll_pd_votes:
> +       for (i--; i >= 0; i--) {
> +               dev_pm_genpd_set_performance_state(pds[i], 0);
> +               pm_runtime_put(pds[i]);
> +       }
> +
> +       return ret;
> +}
> +
> +static void qcom_rproc_pds_disable(struct qcom_adsp *adsp, struct device **pds,
> +                                  size_t pd_count)
> +{
> +       int i;
> +
> +       for (i = 0; i < pd_count; i++) {
> +               dev_pm_genpd_set_performance_state(pds[i], 0);
> +               pm_runtime_put(pds[i]);
> +       }
> +}
> +
> +static int qcom_wpss_shutdown(struct qcom_adsp *adsp)
> +{
> +       unsigned int val;
> +
> +       regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 1);
> +
> +       /* Wait for halt ACK from QDSP6 */
> +       regmap_read_poll_timeout(adsp->halt_map,
> +                                adsp->halt_lpass + LPASS_HALTACK_REG, val,
> +                                val, 1000, ACK_TIMEOUT_US);
> +
> +       /* Assert the WPSS PDC Reset */
> +       reset_control_assert(adsp->pdc_sync_reset);
> +       /* Place the WPSS processor into reset */
> +       reset_control_assert(adsp->restart);
> +       /* wait after asserting subsystem restart from AOSS */
> +       usleep_range(200, 205);
> +       /* Remove the WPSS reset */
> +       reset_control_deassert(adsp->restart);
> +       /* De-assert the WPSS PDC Reset */
> +       reset_control_deassert(adsp->pdc_sync_reset);

Please add newlines between comments and previous code. The above chunk
is really hard to read.

> +
> +       usleep_range(100, 105);
> +
> +       clk_bulk_disable_unprepare(adsp->num_clks, adsp->clks);
> +
> +       regmap_write(adsp->halt_map, adsp->halt_lpass + LPASS_HALTREQ_REG, 0);
> +
> +       /* Wait for halt ACK from QDSP6 */
> +       regmap_read_poll_timeout(adsp->halt_map,
> +                                adsp->halt_lpass + LPASS_HALTACK_REG, val,
> +                                !val, 1000, ACK_TIMEOUT_US);
> +
> +       return 0;
> +}
> +
>  static int qcom_adsp_shutdown(struct qcom_adsp *adsp)
>  {
>         unsigned long timeout;
