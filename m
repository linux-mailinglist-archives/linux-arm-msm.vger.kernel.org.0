Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0796313A14E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2020 08:06:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgANHGW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Jan 2020 02:06:22 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:29072 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728831AbgANHGW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Jan 2020 02:06:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578985580; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WWozYwzV8wpxXTXDNMKUiypi+fLPiDmlCGXOZnnyItM=;
 b=IZcHoD5/PkYm9FBLIIvQvwwW+kGn1zqh3/n35uGeGlKUWktTNZ8vDxJiwYAxCyc1DeUv2TeD
 q4attBJJk81+ke4ScEP7gb+o74lTp5hQu1rxlNS+doyJtLcZVNWU3WjHyjhrY9DYd947iNeR
 w14r38ob8DPsB85n9t05SwOL/Kk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1d686b.7f62d87e4960-smtp-out-n02;
 Tue, 14 Jan 2020 07:06:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 807C4C4479F; Tue, 14 Jan 2020 07:06:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EF682C43383;
        Tue, 14 Jan 2020 07:06:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 14 Jan 2020 12:36:17 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Evan Green <evgreen@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>, ohad@wizery.com,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>
Subject: Re: [PATCH v2 2/2] remoteproc: mss: q6v5-mss: Add modem support on
 SC7180
In-Reply-To: <CAE=gft56MhTCBX+EQt8=DMdK96Wj8Kg4ww7TbLjj_oON0zbKyw@mail.gmail.com>
References: <20191219054506.20565-1-sibis@codeaurora.org>
 <20191219054506.20565-3-sibis@codeaurora.org>
 <CAE=gft56MhTCBX+EQt8=DMdK96Wj8Kg4ww7TbLjj_oON0zbKyw@mail.gmail.com>
Message-ID: <4a72f7691f9ee1d887bca9b1109da6df@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Evan,

Thanks for the review!
sry for the delayed response

On 2020-01-08 02:51, Evan Green wrote:
> On Wed, Dec 18, 2019 at 9:45 PM Sibi Sankar <sibis@codeaurora.org> 
> wrote:
>> 
>> Add the out of reset sequence support for modem sub-system on SC7180
>> SoCs. It requires access to an additional halt nav register to put
>> the modem back into reset.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  drivers/remoteproc/qcom_q6v5_mss.c | 199 
>> ++++++++++++++++++++++++++++-
>>  1 file changed, 198 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c 
>> b/drivers/remoteproc/qcom_q6v5_mss.c
>> index 164fc2a53ef11..51f451311f5fc 100644
>> --- a/drivers/remoteproc/qcom_q6v5_mss.c
>> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
>> @@ -68,6 +68,9 @@
>>  #define AXI_HALTREQ_REG                        0x0
>>  #define AXI_HALTACK_REG                        0x4
>>  #define AXI_IDLE_REG                   0x8
>> +#define NAV_AXI_HALTREQ_BIT            BIT(0)
>> +#define NAV_AXI_HALTACK_BIT            BIT(1)
>> +#define NAV_AXI_IDLE_BIT               BIT(2)
>> 
>>  #define HALT_ACK_TIMEOUT_MS            100
>> 
>> @@ -101,9 +104,11 @@
>>  #define QDSP6SS_ACC_OVERRIDE_VAL               0x20
>> 
>>  /* QDSP6v65 parameters */
>> +#define QDSP6SS_CORE_CBCR              0x20
>>  #define QDSP6SS_SLEEP                   0x3C
>>  #define QDSP6SS_BOOT_CORE_START         0x400
>>  #define QDSP6SS_BOOT_CMD                0x404
>> +#define QDSP6SS_BOOT_STATUS            0x408
>>  #define SLEEP_CHECK_MAX_LOOPS           200
>>  #define BOOT_FSM_TIMEOUT                10000
>> 
>> @@ -131,6 +136,7 @@ struct rproc_hexagon_res {
>>         int version;
>>         bool need_mem_protection;
>>         bool has_alt_reset;
>> +       bool has_halt_nav;
>>  };
>> 
>>  struct q6v5 {
>> @@ -141,9 +147,14 @@ struct q6v5 {
>>         void __iomem *rmb_base;
>> 
>>         struct regmap *halt_map;
>> +       struct regmap *halt_nav_map;
>> +       struct regmap *conn_map;
>> +
>>         u32 halt_q6;
>>         u32 halt_modem;
>>         u32 halt_nc;
>> +       u32 halt_nav;
>> +       u32 conn_box;
>> 
>>         struct reset_control *mss_restart;
>>         struct reset_control *pdc_reset;
>> @@ -187,6 +198,7 @@ struct q6v5 {
>>         struct qcom_sysmon *sysmon;
>>         bool need_mem_protection;
>>         bool has_alt_reset;
>> +       bool has_halt_nav;
>>         int mpss_perm;
>>         int mba_perm;
>>         const char *hexagon_mdt_image;
>> @@ -198,6 +210,7 @@ enum {
>>         MSS_MSM8974,
>>         MSS_MSM8996,
>>         MSS_MSM8998,
>> +       MSS_SC7180,
>>         MSS_SDM845,
>>  };
>> 
>> @@ -396,6 +409,18 @@ static int q6v5_reset_assert(struct q6v5 *qproc)
>>                 reset_control_assert(qproc->pdc_reset);
>>                 ret = reset_control_reset(qproc->mss_restart);
>>                 reset_control_deassert(qproc->pdc_reset);
>> +       } else if (qproc->has_halt_nav) {
>> +               /* SWAR using CONN_BOX_SPARE_0 for pipeline glitch 
>> issue */
> 
> Can you elaborate more in this comment, or remove it? Right now it
> doesn't help me since I don't know what SWAR is, I don't see a

SWAR -> software work around

I'll have to stop with the dumb
abbreviations

> reference to CONN_BOX_SPARE_0 in the code, I don't know what a

conn_box_spare_0 is at an offset
0xb3e4 in the conn_map which is
described in the bindings.

> CONN_BOX is, and I don't know any details about the glitch issue :)

lol, yes I get that the comment does
not give details on the glitch. It
was targeted towards explaining why
there is a deviation in the reset_
assert sequence from the other SoCs.
If you still feel the comment does
not add any value I can get it
removed.

> 
>> +               reset_control_assert(qproc->pdc_reset);
>> +               regmap_update_bits(qproc->conn_map, qproc->conn_box,
>> +                                  BIT(0), BIT(0));
> 
> Make a register name #define for this bit?

we'll have to make one up for it
since conn_box_spare_0 does not
have any predefined bits and seems
to be used to implement some missing
functionality.

> 
>> +               regmap_update_bits(qproc->halt_nav_map, 
>> qproc->halt_nav,
>> +                                  NAV_AXI_HALTREQ_BIT, 0);
>> +               reset_control_assert(qproc->mss_restart);
>> +               reset_control_deassert(qproc->pdc_reset);
>> +               regmap_update_bits(qproc->conn_map, qproc->conn_box,
>> +                                  BIT(0), 0);
>> +               ret = reset_control_deassert(qproc->mss_restart);
>>         } else {
>>                 ret = reset_control_assert(qproc->mss_restart);
>>         }
>> @@ -413,6 +438,8 @@ static int q6v5_reset_deassert(struct q6v5 *qproc)
>>                 ret = reset_control_reset(qproc->mss_restart);
>>                 writel(0, qproc->rmb_base + RMB_MBA_ALT_RESET);
>>                 reset_control_deassert(qproc->pdc_reset);
>> +       } else if (qproc->has_halt_nav) {
>> +               ret = reset_control_reset(qproc->mss_restart);
>>         } else {
>>                 ret = reset_control_deassert(qproc->mss_restart);
>>         }
>> @@ -499,6 +526,54 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>>                         return ret;
>>                 }
>> 
>> +               goto pbl_wait;
> 
> Ick, this could benefit from a refactor that pulls those sorta-common
> steps "Remove IO clamp" through "Start core execution" into a helper
> function and then calls the new function from each case that needs it.
> 
>> +       } else if (qproc->version == MSS_SC7180) {
>> +               val = readl(qproc->reg_base + QDSP6SS_SLEEP);
>> +               val |= 0x1;
> 
> It'd be nice if there were defines for these magic 0x1 values in this 
> hunk too.
> 
>> +               writel(val, qproc->reg_base + QDSP6SS_SLEEP);
>> +
>> +               ret = readl_poll_timeout(qproc->reg_base + 
>> QDSP6SS_SLEEP,
>> +                                        val, !(val & BIT(31)), 1,
>> +                                        SLEEP_CHECK_MAX_LOOPS);
>> +               if (ret) {
>> +                       dev_err(qproc->dev, "QDSP6SS Sleep clock timed 
>> out\n");
>> +                       return -ETIMEDOUT;
>> +               }
> 
> This toggling of the sleep bit is the same as sdm845, it could also be
> put into a helper function.

https://patchwork.kernel.org/patch/11250301/
https://patchwork.kernel.org/patch/11250317/

I did club ^^ a portion of the out of
reset sequence together reducing
code duplication initially but that
made the entire thing unreadable.

The general consensus at that time
was to introduce a patch for sc7180
that is most readable and have a
cleanup later with a lot of helper
functions and less branching like
you suggested.

> 
>> +
>> +               /* Turn on the XO clock needed for PLL setup */
>> +               val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
>> +               val |= 0x1;
>> +               writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);
>> +
>> +               ret = readl_poll_timeout(qproc->reg_base + 
>> QDSP6SS_XO_CBCR,
>> +                                        val, !(val & BIT(31)), 1,
>> +                                        SLEEP_CHECK_MAX_LOOPS);
> 
> Nit: SLEEP_CHECK_MAX_LOOPS isn't a loop count, it should really have
> been named something like SLEEP_CHECK_TIMEOUT_US. Could be done in a
> separate change.

I'll skip this for now. I'll
make sure that this gets named
appropriately during the
planned refactor.

> 
>> +               if (ret) {
>> +                       dev_err(qproc->dev, "QDSP6SS XO clock timed 
>> out\n");
>> +                       return -ETIMEDOUT;
>> +               }
>> +
>> +               /* Configure Q6 core CBCR to auto-enable after reset 
>> sequence */
>> +               val = readl(qproc->reg_base + QDSP6SS_CORE_CBCR);
>> +               val |= 0x1;
>> +               writel(val, qproc->reg_base + QDSP6SS_CORE_CBCR);
>> +
>> +               /* De-assert the Q6 stop core signal */
>> +               writel(1, qproc->reg_base + QDSP6SS_BOOT_CORE_START);
>> +
>> +               /* Trigger the boot FSM to start the Q6 out-of-reset 
>> sequence */
>> +               writel(1, qproc->reg_base + QDSP6SS_BOOT_CMD);
>> +
>> +               /* Poll the QDSP6SS_BOOT_STATUS for FSM completion */
>> +               ret = readl_poll_timeout(qproc->reg_base + 
>> QDSP6SS_BOOT_STATUS,
>> +                                        val, (val & BIT(0)) != 0, 1,
>> +                                        SLEEP_CHECK_MAX_LOOPS);
>> +               if (ret) {
>> +                       dev_err(qproc->dev, "Boot FSM failed to 
>> complete.\n");
>> +                       /* Reset the modem so that boot FSM is in 
>> reset state */
>> +                       q6v5_reset_deassert(qproc);
>> +                       return ret;
>> +               }
>>                 goto pbl_wait;
>>         } else if (qproc->version == MSS_MSM8996 ||
>>                    qproc->version == MSS_MSM8998) {
>> @@ -667,6 +742,39 @@ static void q6v5proc_halt_axi_port(struct q6v5 
>> *qproc,
>>         regmap_write(halt_map, offset + AXI_HALTREQ_REG, 0);
>>  }
>> 
>> +static void q6v5proc_halt_nav_axi_port(struct q6v5 *qproc,
>> +                                      struct regmap *halt_map,
>> +                                      u32 offset)
>> +{
>> +       unsigned long timeout;
>> +       unsigned int val;
>> +       int ret;
>> +
>> +       /* Check if we're already idle */
>> +       ret = regmap_read(halt_map, offset, &val);
>> +       if (!ret && (val & NAV_AXI_IDLE_BIT))
>> +               return;
>> +
>> +       /* Assert halt request */
>> +       regmap_update_bits(halt_map, offset, NAV_AXI_HALTREQ_BIT,
>> +                          NAV_AXI_HALTREQ_BIT);
>> +
>> +       /* Wait for halt ack*/
>> +       timeout = jiffies + msecs_to_jiffies(HALT_ACK_TIMEOUT_MS);
>> +       for (;;) {
>> +               ret = regmap_read(halt_map, offset, &val);
>> +               if (ret || (val & NAV_AXI_HALTACK_BIT) ||
>> +                   time_after(jiffies, timeout))
>> +                       break;
>> +
>> +               udelay(5);
>> +       }
>> +
>> +       ret = regmap_read(halt_map, offset, &val);
>> +       if (ret || !(val & NAV_AXI_IDLE_BIT))
>> +               dev_err(qproc->dev, "port failed halt\n");
>> +}
>> +
>>  static int q6v5_mpss_init_image(struct q6v5 *qproc, const struct 
>> firmware *fw)
>>  {
>>         unsigned long dma_attrs = DMA_ATTR_FORCE_CONTIGUOUS;
>> @@ -829,6 +937,9 @@ static int q6v5_mba_load(struct q6v5 *qproc)
>>  halt_axi_ports:
>>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, 
>> qproc->halt_q6);
>>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, 
>> qproc->halt_modem);
>> +       if (qproc->has_halt_nav)
>> +               q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
>> +                                          qproc->halt_nav);
>>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, 
>> qproc->halt_nc);
>> 
>>  reclaim_mba:
>> @@ -876,6 +987,9 @@ static void q6v5_mba_reclaim(struct q6v5 *qproc)
>> 
>>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, 
>> qproc->halt_q6);
>>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, 
>> qproc->halt_modem);
>> +       if (qproc->has_halt_nav)
>> +               q6v5proc_halt_nav_axi_port(qproc, qproc->halt_nav_map,
>> +                                          qproc->halt_nav);
>>         q6v5proc_halt_axi_port(qproc, qproc->halt_map, 
>> qproc->halt_nc);
>>         if (qproc->version == MSS_MSM8996) {
>>                 /*
>> @@ -1253,6 +1367,47 @@ static int q6v5_init_mem(struct q6v5 *qproc, 
>> struct platform_device *pdev)
>>         qproc->halt_modem = args.args[1];
>>         qproc->halt_nc = args.args[2];
>> 
>> +       if (qproc->has_halt_nav) {
>> +               struct platform_device *nav_pdev;
>> +
>> +               ret = 
>> of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> +                                                      
>> "qcom,halt-nav-regs",
>> +                                                      1, 0, &args);
>> +               if (ret < 0) {
>> +                       dev_err(&pdev->dev, "failed to parse 
>> halt-nav-regs\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               nav_pdev = of_find_device_by_node(args.np);
>> +               of_node_put(args.np);
>> +               if (!nav_pdev) {
>> +                       dev_err(&pdev->dev, "failed to get mss clock 
>> device\n");
>> +                       return -EPROBE_DEFER;
>> +               }
>> +
>> +               qproc->halt_nav_map = dev_get_regmap(&nav_pdev->dev, 
>> NULL);
>> +               if (!qproc->halt_nav_map) {
>> +                       dev_err(&pdev->dev, "failed to get map from 
>> device\n");
>> +                       return -EINVAL;
>> +               }
>> +               qproc->halt_nav = args.args[0];
>> +
>> +               ret = 
>> of_parse_phandle_with_fixed_args(pdev->dev.of_node,
>> +                                                      
>> "qcom,halt-nav-regs",
>> +                                                      1, 1, &args);
>> +               if (ret < 0) {
>> +                       dev_err(&pdev->dev, "failed to parse 
>> halt-nav-regs\n");
>> +                       return -EINVAL;
>> +               }
>> +
>> +               qproc->conn_map = syscon_node_to_regmap(args.np);
>> +               of_node_put(args.np);
>> +               if (IS_ERR(qproc->conn_map))
>> +                       return PTR_ERR(qproc->conn_map);
>> +
>> +               qproc->conn_box = args.args[0];
>> +       }
>> +
>>         return 0;
>>  }
>> 
>> @@ -1327,7 +1482,7 @@ static int q6v5_init_reset(struct q6v5 *qproc)
>>                 return PTR_ERR(qproc->mss_restart);
>>         }
>> 
>> -       if (qproc->has_alt_reset) {
>> +       if (qproc->has_alt_reset || qproc->has_halt_nav) {
>>                 qproc->pdc_reset = 
>> devm_reset_control_get_exclusive(qproc->dev,
>>                                                                     
>> "pdc_reset");
>>                 if (IS_ERR(qproc->pdc_reset)) {
>> @@ -1426,6 +1581,7 @@ static int q6v5_probe(struct platform_device 
>> *pdev)
>> 
>>         platform_set_drvdata(pdev, qproc);
>> 
>> +       qproc->has_halt_nav = desc->has_halt_nav;
>>         ret = q6v5_init_mem(qproc, pdev);
>>         if (ret)
>>                 goto free_rproc;
>> @@ -1549,6 +1705,41 @@ static int q6v5_remove(struct platform_device 
>> *pdev)
>>         return 0;
>>  }
>> 
>> +static const struct rproc_hexagon_res sc7180_mss = {
>> +       .hexagon_mba_image = "mba.mbn",
>> +       .proxy_clk_names = (char*[]){
>> +               "xo",
>> +               NULL
>> +       },
>> +       .reset_clk_names = (char*[]){
>> +               "iface",
>> +               "bus",
>> +               "snoc_axi",
>> +               NULL
>> +       },
>> +       .active_clk_names = (char*[]){
>> +               "mnoc_axi",
>> +               "nav",
>> +               "mss_nav",
>> +               "mss_crypto",
>> +               NULL
>> +       },
>> +       .active_pd_names = (char*[]){
>> +               "load_state",
>> +               NULL
>> +       },
>> +       .proxy_pd_names = (char*[]){
>> +               "cx",
>> +               "mx",
>> +               "mss",
>> +               NULL
>> +       },
>> +       .need_mem_protection = true,
>> +       .has_alt_reset = false,
>> +       .has_halt_nav = true,
>> +       .version = MSS_SC7180,
>> +};
>> +
>>  static const struct rproc_hexagon_res sdm845_mss = {
>>         .hexagon_mba_image = "mba.mbn",
>>         .proxy_clk_names = (char*[]){
>> @@ -1580,6 +1771,7 @@ static const struct rproc_hexagon_res sdm845_mss 
>> = {
>>         },
>>         .need_mem_protection = true,
>>         .has_alt_reset = true,
>> +       .has_halt_nav = false,
>>         .version = MSS_SDM845,
>>  };
>> 
>> @@ -1606,6 +1798,7 @@ static const struct rproc_hexagon_res 
>> msm8998_mss = {
>>         },
>>         .need_mem_protection = true,
>>         .has_alt_reset = false,
>> +       .has_halt_nav = false,
>>         .version = MSS_MSM8998,
>>  };
>> 
>> @@ -1635,6 +1828,7 @@ static const struct rproc_hexagon_res 
>> msm8996_mss = {
>>         },
>>         .need_mem_protection = true,
>>         .has_alt_reset = false,
>> +       .has_halt_nav = false,
>>         .version = MSS_MSM8996,
>>  };
>> 
>> @@ -1667,6 +1861,7 @@ static const struct rproc_hexagon_res 
>> msm8916_mss = {
>>         },
>>         .need_mem_protection = false,
>>         .has_alt_reset = false,
>> +       .has_halt_nav = false,
>>         .version = MSS_MSM8916,
>>  };
>> 
>> @@ -1707,6 +1902,7 @@ static const struct rproc_hexagon_res 
>> msm8974_mss = {
>>         },
>>         .need_mem_protection = false,
>>         .has_alt_reset = false,
>> +       .has_halt_nav = false,
>>         .version = MSS_MSM8974,
>>  };
>> 
>> @@ -1716,6 +1912,7 @@ static const struct of_device_id q6v5_of_match[] 
>> = {
>>         { .compatible = "qcom,msm8974-mss-pil", .data = &msm8974_mss},
>>         { .compatible = "qcom,msm8996-mss-pil", .data = &msm8996_mss},
>>         { .compatible = "qcom,msm8998-mss-pil", .data = &msm8998_mss},
>> +       { .compatible = "qcom,sc7180-mss-pil", .data = &sc7180_mss},
>>         { .compatible = "qcom,sdm845-mss-pil", .data = &sdm845_mss},
>>         { },
>>  };
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
