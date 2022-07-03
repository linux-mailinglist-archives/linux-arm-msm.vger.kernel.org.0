Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68327564697
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Jul 2022 12:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbiGCKOM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jul 2022 06:14:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiGCKOM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jul 2022 06:14:12 -0400
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [81.169.146.165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3DAC615F;
        Sun,  3 Jul 2022 03:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1656843246;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=3dxEyMqHzzsFuWVcEwH40m4/4bzynqSKKxtXxi1Ci70=;
    b=GWi8VxyGxQC96Ieg4OyEQdBrkTOCnjmZKnW21/ycAzYH7ov1V8ddZY45Zh/jNPcSyp
    1OdPSJA4NQ/ayvEmbvV1HrRQMsP43hKbnq9/5snoGX5VNIYg40JLeRMWOGui6e/29FmL
    tHIpx5KlOno198HmaQQxhSnLR6v1TqySoPP5/SoOkkR6C4u0OOW7MPIzFAC42iQyJSQv
    f5i33wIP7EyRCey/UVJ27zAIuO1Y7TPeTs9TjHIRslB7fOL0JCRtNgFTcEQqk3oxZhgm
    Q4mBrP3ZTUtkof7FBIJpnnlYiqpGVUoV/qc5d3Ty9E10TsqX+J0yAZZ8+y3WyRYF7hsg
    uSnA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrKY7lg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.46.1 AUTH)
    with ESMTPSA id yfdd30y63AE5AcK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Sun, 3 Jul 2022 12:14:05 +0200 (CEST)
Date:   Sun, 3 Jul 2022 12:13:51 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>
Subject: Re: [PATCH 3/4] remoteproc: qcom: q6v5-mss: Add support for
 SDM630/636/660 MSS remoteproc
Message-ID: <YsFrtn0X6ywJh6d3@gerhold.net>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
 <20220514000108.3070363-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220514000108.3070363-4-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, May 14, 2022 at 03:01:07AM +0300, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konradybcio@gmail.com>
> 
> This adds support for sdm630/636/660 modem subsystem
> remote processor.
> 
> Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
> [DB: fixed commit message, removed note about modem restarting regularly]
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I was only looking at this by coincidence recently but since it doesn't
seem to be applied yet(?) some comments below.

> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 111 +++++++++++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index af217de75e4d..7a4cca30db8a 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
[...]
> @@ -754,6 +759,79 @@ static int q6v5proc_reset(struct q6v5 *qproc)
>  			val |= readl(qproc->reg_base + mem_pwr_ctl);
>  			udelay(1);
>  		}
> +		/* Remove word line clamp */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val &= ~QDSP6v56_CLAMP_WL;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +	} else if (qproc->version == MSS_SDM660) {
> +		int mem_pwr_ctl;
> +
> +		/* Override the ACC value if required */
> +		writel(QDSP6SS_ACC_OVERRIDE_VAL,
> +		       qproc->reg_base + QDSP6SS_STRAP_ACC);
> +
> +		/* Assert resets, stop core */
> +		val = readl(qproc->reg_base + QDSP6SS_RESET_REG);
> +		val |= Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
> +		writel(val, qproc->reg_base + QDSP6SS_RESET_REG);
> +
> +		/* BHS require xo cbcr to be enabled */
> +		val = readl(qproc->reg_base + QDSP6SS_XO_CBCR);
> +		val |= 1;

val |= Q6SS_CBCR_CLKEN; (like in the existing 8996 code)

> +		writel(val, qproc->reg_base + QDSP6SS_XO_CBCR);

I would also expect this to wait for !Q6SS_CBCR_CLKOFF like on all the
other SoCs. Pretty sure downstream does that for all of them in
q6v55_branch_clk_enable().

> +
> +		/* Enable power block headswitch and wait for it to stabilize */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val |= QDSP6v56_BHS_ON;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		mb();
> +		udelay(1);
> +
> +		for (i = BHS_CHECK_MAX_LOOPS; i > 0; i--) {
> +			if (readl_relaxed(qproc->reg_base + QDSP6V62SS_BHS_STATUS)
> +			    & QDSP6v55_BHS_EN_REST_ACK)
> +				break;
> +			udelay(1);
> +		}

This looks like readl_poll_timeout().

> +		if (!i) {
> +			pr_err("%s: BHS_EN_REST_ACK not set!\n", __func__);

dev_err()

> +			return -ETIMEDOUT;
> +		}
> +
> +		/* Put LDO in bypass mode */
> +		val |= QDSP6v56_LDO_BYP;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +
> +		/* Remove QMC_MEM clamp */
> +		val &= ~QDSP6v56_CLAMP_QMC_MEM;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +
> +		/* Deassert QDSP6 compiler memory clamp */
> +		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +		val &= ~QDSP6v56_CLAMP_QMC_MEM;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +

Why does this clear QDSP6v56_CLAMP_QMC_MEM twice?

> +		/* Deassert memory peripheral sleep and L2 memory standby */
> +		val |= Q6SS_L2DATA_STBY_N | Q6SS_SLP_RET_N;
> +		writel(val, qproc->reg_base + QDSP6SS_PWR_CTL_REG);
> +
> +		/* Turn on L1, L2, ETB and JU memories 1 at a time */
> +		mem_pwr_ctl = QDSP6V6SS_MEM_PWR_CTL;
> +		i = 29;
> +
> +		val = readl(qproc->reg_base + mem_pwr_ctl);
> +		for (; i >= 0; i--) {
> +			val |= BIT(i);
> +			writel(val, qproc->reg_base + mem_pwr_ctl);
> +			/*
> +			 * Read back value to ensure the write is done then
> +			 * wait for 1us for both memory peripheral and data
> +			 * array to turn on.
> +			 */
> +			val |= readl(qproc->reg_base + mem_pwr_ctl);
> +			udelay(1);
> +		}
> +
>  		/* Remove word line clamp */
>  		val = readl(qproc->reg_base + QDSP6SS_PWR_CTL_REG);
>  		val &= ~QDSP6v56_CLAMP_WL;

All in all this looks almost exactly like the existing code for
MSS_MSM8996/8. Wouldn't it be cleaner to just add an if statement for
the QDSP6V62SS_BHS_STATUS readl_poll_timeout() to the existing code?

Thanks,
Stephan
