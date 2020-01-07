Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83A981333F7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728860AbgAGVWl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:22:41 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:46714 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727736AbgAGVWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:22:33 -0500
Received: by mail-lj1-f196.google.com with SMTP id m26so1032956ljc.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 13:22:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=upIRRQW73BC+5OwB1lwnOCiWDmq0SrAYssOINmYVJzs=;
        b=DWh/4Bn3q0Q8ccMnGqeKv0rCOm695ZaxgP7IAfIZRzhlXJAc6pSOtXpj/y68LzWgoF
         1YwWFL4CB0tAHsBdfDRwaEqIcQ1ZRIeyz++TPFaPCcZ/L8by3UA6Ov2t8Rr3PeqflagB
         PV25FfbdHkMbWMVHlTl58b5CZ9vA6a0SXs1Bc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=upIRRQW73BC+5OwB1lwnOCiWDmq0SrAYssOINmYVJzs=;
        b=QbHke6++Dqz7EkzyKWAFUxhTa2S3G+fVKx7w6gQCVRhxao6LrUW86dtGze1Yn49+X5
         j2DegMMTaDo+KiO97lsGeUuKh9Zj8ie9C3r0GZ6NnCBg6KqgyRds0EIhyWGUZp5/sN52
         BPGQbwbfxj2ntUu7p5WBJHh6GJwj5RQHG8QnSyVH5wQNxTiCAtX9JPsRyEtf35VwkyLj
         VzDc0GIlu9JPxhTr0l/CwvLxFV7fhfkHvik2APbcj4d6QIain5T4V4wqzQBMQ3nqOuZq
         yxwaIPX5McbWhsysLCE3gvZSvaKyq1CPS6tY2N2fLJmoSQG0sokdhIwEa0kKiWKBbXC8
         nAJw==
X-Gm-Message-State: APjAAAWjlUZ0IuqxkZor5R91+640IfYhsArsXI03RCp7rUQrMTiS2Vy2
        FI6/0bs6J18TLHwtfvJPoB5GtyyJQVM=
X-Google-Smtp-Source: APXvYqwtUnYtEg9rerEz3+vr9RWxR2i5uAYbldDy1b/4lKXvuWYvitM6eQPmYLeaV3DM2MB8Sf1fcg==
X-Received: by 2002:a2e:9e55:: with SMTP id g21mr812471ljk.245.1578432149445;
        Tue, 07 Jan 2020 13:22:29 -0800 (PST)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id o12sm316118ljj.79.2020.01.07.13.22.27
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2020 13:22:28 -0800 (PST)
Received: by mail-lj1-f178.google.com with SMTP id o13so1090219ljg.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2020 13:22:27 -0800 (PST)
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr863943ljk.186.1578432147204;
 Tue, 07 Jan 2020 13:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20191219054506.20565-1-sibis@codeaurora.org> <20191219054506.20565-3-sibis@codeaurora.org>
In-Reply-To: <20191219054506.20565-3-sibis@codeaurora.org>
From:   Evan Green <evgreen@chromium.org>
Date:   Tue, 7 Jan 2020 13:21:50 -0800
X-Gmail-Original-Message-ID: <CAE=gft56MhTCBX+EQt8=DMdK96Wj8Kg4ww7TbLjj_oON0zbKyw@mail.gmail.com>
Message-ID: <CAE=gft56MhTCBX+EQt8=DMdK96Wj8Kg4ww7TbLjj_oON0zbKyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: mss: q6v5-mss: Add modem support on SC7180
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, ohad@wizery.com,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Dec 18, 2019 at 9:45 PM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Add the out of reset sequence support for modem sub-system on SC7180
> SoCs. It requires access to an additional halt nav register to put
> the modem back into reset.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 199 ++++++++++++++++++++++++++++-
>  1 file changed, 198 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index 164fc2a53ef11..51f451311f5fc 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -68,6 +68,9 @@
>  #define AXI_HALTREQ_REG                        0x0
>  #define AXI_HALTACK_REG                        0x4
>  #define AXI_IDLE_REG                   0x8
> +#define NAV_AXI_HALTREQ_BIT            BIT(0)
> +#define NAV_AXI_HALTACK_BIT            BIT(1)
> +#define NAV_AXI_IDLE_BIT               BIT(2)
>
>  #define HALT_ACK_TIMEOUT_MS            100
>
> @@ -101,9 +104,11 @@
>  #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
>
>  /* QDSP6v65 parameters */
> +#define QDSP6SS_CORE_CBCR              0x20
>  #define QDSP6SS_SLEEP                   0x3C
>  #define QDSP6SS_BOOT_CORE_START         0x400
>  #define QDSP6SS_BOOT_CMD                0x404
> +#define QDSP6SS_BOOT_STATUS            0x408
>  #define SLEEP_CHECK_MAX_LOOPS           200
>  #define BOOT_FSM_TIMEOUT                10000
>
> @@ -131,6 +136,7 @@ struct rproc_hexagon_res {
>         int version;
>         bool need_mem_protection;
>         bool has_alt_reset;
> +       bool has_halt_nav;
>  };
>
>  struct q6v5 {
> @@ -141,9 +147,14 @@ struct q6v5 {
>         void __iomem *rmb_base;
>
>         struct regmap *halt_map;
> +       struct regmap *halt_nav_map;
> +       struct regmap *conn_map;
> +
>         u32 halt_q6;
>         u32 halt_modem;
>         u32 halt_nc;
> +       u32 halt_nav;
> +       u32 conn_box;
>
>         struct reset_control *mss_restart;
>         struct reset_control *pdc_reset;
> @@ -187,6 +198,7 @@ struct q6v5 {
>         struct qcom_sysmon *sysmon;
>         bool need_mem_protection;
>         bool has_alt_reset;
> +       bool has_halt_nav;
>         int mpss_perm;
>         int mba_perm;
>         const char *hexagon_mdt_image;
> @@ -198,6 +210,7 @@ enum {
>         MSS_MSM8974,
>         MSS_MSM8996,
>         MSS_MSM8998,
> +       MSS_SC7180,
>         MSS_SDM845,
>  };
>
> @@ -396,6 +409,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>                 reset_control_assert(qproc->pdc_reset);
>                 ret = reset_control_reset(qproc->mss_restart);
>                 reset_control_deassert(qproc->pdc_reset);
> +       } else if (qproc->has_halt_nav) {
> +               /* SWAR using CONN_BOX_SPARE_0 for pipeline glitch issue */

Can you elaborate more in this comment, or remove it? Right now it
doesn't help me since I don't know what SWAR is, I don't see a
reference to CONN_BOX_SPARE_0 in the code, I don't know what a
CONN_BOX is, and I don't know any details about the glitch issue :)

> +               reset_control_assert(qproc->pdc_reset);
> +               regmap_update_bits(qproc->conn_map, qproc->conn_box,
> +                                  BIT(0), BIT(0));

Make a register name #define for this bit?

> +               regmap_update_bits(qproc->halt_nav_map, qproc->halt_nav,
> +                                  NAV_AXI_HALTREQ_BIT, 0);
> +               reset_control_assert(qproc->mss_restart);
> +               reset_control_deassert(qproc->pdc_reset);
> +               regmap_update_bits(qproc->conn_map, qproc->conn_box,
> +                                  BIT(0), 0);
> +               ret = reset_control_deassert(qproc->mss_restart);
>         } else {
>                 ret = reset_control_assert(qproc->mss_restart);
>         }
> @@ -413,6 +438,8 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
>                 ret = reset_control_reset(qproc->mss_restart);
>                 writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
>                 reset_control_deassert(qproc->pdc_reset);
> +       } else if (qproc->has_halt_nav) {
> +               ret = reset_control_reset(qproc->mss_restart);
>         } else {
>                 ret = reset_control_deassert(qproc->mss_restart);
>         }
> @@ -499,6 +526,54 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>                         return ret;
>                 }
>
> +               goto pbl_wait;

Ick, this could benefit from a refactor that pulls those sorta-common
steps "Remove IO clamp" through "Start core execution" into a helper
function and then calls the new function from each case that needs it.

> +       } else if (qproc->version == MSS_SC7180) {
> +               val = readl(qproc->reg_base + QDSP6SS_SLEEP);
> +               val |= 0x1;

It'd be nice if there were defines for these magic 0x1 values in this hunk too.

> +               writel(val, qproc->reg_base + QDSP6SS_SLEEP);
> +
> +               ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_SLEEP,
> +                                        val, !(val & BIT(31)), 1,
> +                                        SLEEP_CHECK_MAX_LOOPS);
> +               if (ret) {
> +                       dev_err(qproc->dev, "QDSP6SS Sleep clock timed out\n");
> +                       return -ETIMEDOUT;
> +               }

This toggling of the sleep bit is the same as sdm845, it could also be
put into a helper function.

> +
> +               /* Turn on the XO clock needed for PLL setup */
> +               val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
> +               val |= 0x1;
> +               writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
> +
> +               ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_XO_CBCR,
> +                                        val, !(val & BIT(31)), 1,
> +                                        SLEEP_CHECK_MAX_LOOPS);

Nit: SLEEP_CHECK_MAX_LOOPS isn't a loop count, it should really have
been named something like SLEEP_CHECK_TIMEOUT_US. Could be done in a
separate change.

> +               if (ret) {
> +                       dev_err(qproc->dev, "QDSP6SS XO clock timed out\n");
> +                       return -ETIMEDOUT;
> +               }
> +
> +               /* Configure Q6 core CBCR to auto-enable after reset sequence */
> +               val = readl(qproc->reg_base + QDSP6SS_CORE_CBCR);
> +               val |= 0x1;
> +               writel(val, qproc->reg_base + QDSP6SS_CORE_CBCR);
> +
> +               /* De-assert the Q6 stop core signal */
> +               writel(1, qproc->reg_base + QDSP6SS_BOOT_CORE_START);
> +
> +               /* Trigger the boot FSM to start the Q6 out-of-reset sequence */
> +               writel(1, qproc->reg_base + QDSP6SS_BOOT_CMD);
> +
> +               /* Poll the QDSP6SS_BOOT_STATUS for FSM completion */
> +               ret = readl_poll_timeout(qproc->reg_base + QDSP6SS_BOOT_STATUS,
> +                                        val, (val & BIT(0)) != 0, 1,
> +                                        SLEEP_CHECK_MAX_LOOPS);
> +               if (ret) {
> +                       dev_err(qproc->dev, "Boot FSM failed to complete.\n");
> +                       /* Reset the modem so that boot FSM is in reset state */
> +                       q6v5_reset_deassert(qproc);
> +                       return ret;
> +               }
>                 goto pbl_wait;
>         } else if (qproc->version == MSS_MSM8996 ||
>                    qproc->version == MSS_MSM8998) {
> @@ -667,6 +742,39 @@ static void q6v5proc_halt_axi_port(struct q6v5 *qproc,
>         regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>  }
>
> +static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
> +                                      struct regmap *halt_map,
> +                                      u32 offset)
> +{
> +       unsigned long timeout;
> +       unsigned int val;
> +       int ret;
> +
> +       /* Check if we're already idle */
> +       ret = regmap_read(halt_map, offset, &val);
> +       if (!ret && (val & NAV_AXI_IDLE_BIT))
> +               return;
> +
> +       /* Assert halt request */
> +       regmap_update_bits(halt_map, offset, NAV_AXI_HALTREQ_BIT,
> +                          NAV_AXI_HALTREQ_BIT);
> +
> +       /* Wait for halt ack*/
> +       timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
> +       for (;;) {
> +               ret = regmap_read(halt_map, offset, &val);
> +               if (ret || (val & NAV_AXI_HALTACK_BIT) ||
> +                   time_after(jiffies, timeout))
> +                       break;
> +
> +               udelay(5);
> +       }
> +
> +       ret = regmap_read(halt_map, offset, &val);
> +       if (ret || !(val & NAV_AXI_IDLE_BIT))
> +               dev_err(qproc->dev, "port failed halt\n");
> +}
> +
>  static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct firmware *fw)
>  {
>         unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
> @@ -829,6 +937,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>  halt_axi_ports:
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
> +       if (qproc->has_halt_nav)
> +               q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
> +                                          qproc->halt_nav);
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>
>  reclaim_mba:
> @@ -876,6 +987,9 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_q6);
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_modem);
> +       if (qproc->has_halt_nav)
> +               q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
> +                                          qproc->halt_nav);
>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, qproc->halt_nc);
>         if (qproc->version == MSS_MSM8996) {
>                 /*
> @@ -1253,6 +1367,47 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
>         qproc->halt_modem = args.args[1];
>         qproc->halt_nc = args.args[2];
>
> +       if (qproc->has_halt_nav) {
> +               struct platform_device *nav_pdev;
> +
> +               ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +                                                      "qcom,halt-nav-regs",
> +                                                      1, 0, &args);
> +               if (ret < 0) {
> +                       dev_err(&pdev->dev, "failed to parse halt-nav-regs\n");
> +                       return -EINVAL;
> +               }
> +
> +               nav_pdev = of_find_device_by_node(args.np);
> +               of_node_put(args.np);
> +               if (!nav_pdev) {
> +                       dev_err(&pdev->dev, "failed to get mss clock device\n");
> +                       return -EPROBE_DEFER;
> +               }
> +
> +               qproc->halt_nav_map = dev_get_regmap(&nav_pdev->dev, NULL);
> +               if (!qproc->halt_nav_map) {
> +                       dev_err(&pdev->dev, "failed to get map from device\n");
> +                       return -EINVAL;
> +               }
> +               qproc->halt_nav = args.args[0];
> +
> +               ret = of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> +                                                      "qcom,halt-nav-regs",
> +                                                      1, 1, &args);
> +               if (ret < 0) {
> +                       dev_err(&pdev->dev, "failed to parse halt-nav-regs\n");
> +                       return -EINVAL;
> +               }
> +
> +               qproc->conn_map = syscon_node_to_regmap(args.np);
> +               of_node_put(args.np);
> +               if (IS_ERR(qproc->conn_map))
> +                       return PTR_ERR(qproc->conn_map);
> +
> +               qproc->conn_box = args.args[0];
> +       }
> +
>         return 0;
>  }
>
> @@ -1327,7 +1482,7 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>                 return PTR_ERR(qproc->mss_restart);
>         }
>
> -       if (qproc->has_alt_reset) {
> +       if (qproc->has_alt_reset || qproc->has_halt_nav) {
>                 qproc->pdc_reset = devm_reset_control_get_exclusive(qproc->dev,
>                                                                     "pdc_reset");
>                 if (IS_ERR(qproc->pdc_reset)) {
> @@ -1426,6 +1581,7 @@ static int q6v5_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, qproc);
>
> +       qproc->has_halt_nav = desc->has_halt_nav;
>         ret = q6v5_init_mem(qproc, pdev);
>         if (ret)
>                 goto free_rproc;
> @@ -1549,6 +1705,41 @@ static int q6v5_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static const struct rproc_hexagon_res sc7180_mss = {
> +       .hexagon_mba_image = "mba.mbn",
> +       .proxy_clk_names = (char*[]){
> +               "xo",
> +               NULL
> +       },
> +       .reset_clk_names = (char*[]){
> +               "iface",
> +               "bus",
> +               "snoc_axi",
> +               NULL
> +       },
> +       .active_clk_names = (char*[]){
> +               "mnoc_axi",
> +               "nav",
> +               "mss_nav",
> +               "mss_crypto",
> +               NULL
> +       },
> +       .active_pd_names = (char*[]){
> +               "load_state",
> +               NULL
> +       },
> +       .proxy_pd_names = (char*[]){
> +               "cx",
> +               "mx",
> +               "mss",
> +               NULL
> +       },
> +       .need_mem_protection = true,
> +       .has_alt_reset = false,
> +       .has_halt_nav = true,
> +       .version = MSS_SC7180,
> +};
> +
>  static const struct rproc_hexagon_res sdm845_mss = {
>         .hexagon_mba_image = "mba.mbn",
>         .proxy_clk_names = (char*[]){
> @@ -1580,6 +1771,7 @@ static const struct rproc_hexagon_res sdm845_mss = {
>         },
>         .need_mem_protection = true,
>         .has_alt_reset = true,
> +       .has_halt_nav = false,
>         .version = MSS_SDM845,
>  };
>
> @@ -1606,6 +1798,7 @@ static const struct rproc_hexagon_res msm8998_mss = {
>         },
>         .need_mem_protection = true,
>         .has_alt_reset = false,
> +       .has_halt_nav = false,
>         .version = MSS_MSM8998,
>  };
>
> @@ -1635,6 +1828,7 @@ static const struct rproc_hexagon_res msm8996_mss = {
>         },
>         .need_mem_protection = true,
>         .has_alt_reset = false,
> +       .has_halt_nav = false,
>         .version = MSS_MSM8996,
>  };
>
> @@ -1667,6 +1861,7 @@ static const struct rproc_hexagon_res msm8916_mss = {
>         },
>         .need_mem_protection = false,
>         .has_alt_reset = false,
> +       .has_halt_nav = false,
>         .version = MSS_MSM8916,
>  };
>
> @@ -1707,6 +1902,7 @@ static const struct rproc_hexagon_res msm8974_mss = {
>         },
>         .need_mem_protection = false,
>         .has_alt_reset = false,
> +       .has_halt_nav = false,
>         .version = MSS_MSM8974,
>  };
>
> @@ -1716,6 +1912,7 @@ static const struct of_device_id q6v5_of_match[] = {
>         { .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
>         { .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
>         { .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
> +       { .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss},
>         { .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
>         { },
>  };
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
