Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783503900D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 14:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232587AbhEYMXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 08:23:40 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:21036 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232591AbhEYMXa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 08:23:30 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1621945276; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=OKz07d+O49cqaMLeo/Rt7OD7MqYPrAKU03s+8gNlSVU96SLZmQ8S/wv0TIUBG9KhpB
    ynd+LE+9tFAluCp/VbLhRqIq3uBWdpl+9pjXXYHNwhqf8U46aFVhbdSIMNSH8beaBsPg
    PEdRlBEd4pIF57/sDmbGKPNsnZemPSC9mYSXPr8gmpTHkBa9QuzgHm6ilXkrNUROw4Sr
    dsT4cxzSZ7nkqre0yHn+IZtrOJ89L4MWaEeELboHpJMhgBBvJGMw/46eTIoremm4dC9I
    ZukxRUOcarkYb0WPZ+DZbNW0nsVu81GmdMSqmMQpZfeZVZ87jJy7YkibBYJsu/LG/uUK
    0fYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621945276;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=KV/2nj4skug8FbuclXnVJfsWZvYOWwsCbnrR2X4xTMY=;
    b=Fdgxu++gjLGjLMJaYda5lA2SWNo4+nrCv1h86dC8iH6vafkFEYtipZHdryp/KtPW1i
    nzBquWhY8+Wcy6tl4JtDOhHwXwNGhcpRMKRabHWFbpROT7dm4RH5qEwalXpboHxxKGSY
    UkL7lSPjl6JsgxW3rOa968wPE2rp35DI4mJcrAUFL2jEY3YkUUnK5/5pAcp5ZqPcBviN
    Vw5rqRRuv59t0ZupaoUGhz7Pu2rvKzUN1zXypa7l08juk858nbSWHgihsm21AfsRDM0f
    7JsHK5zswLMq1Bwcy5Fikxd7uMIOprg4qTmPd3xlTN+FrAGxhDVZfgSEqIpRx03pcVRK
    Eg0Q==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621945276;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=KV/2nj4skug8FbuclXnVJfsWZvYOWwsCbnrR2X4xTMY=;
    b=qjZrdFBsYZjJqBRakBJdI0cX1ZSjquKrj6VTfArcU/QZgj6kplyeEzAq946s4Z5/c6
    2og8jZ3HPA+n9zaj52l1PyllfX30Lg1cpDJjwqZRgPgQ8/eFPmIl+/tbCuSaSRbjpTcJ
    9jqr8iWPLQPsWgYNftHKL3gTEkytVDmA3kjjmSFqgUIKKQfnDXlG4uigztm5uTOOqncL
    +MZMsiwXOHDkDk02vzjMbly7GNbZQStlqSIRco0SAmrvgqotPfSsVSX1FoBjP5g0N1pB
    QfJ4ldiQX/n4tq1LQ+SldTbpQavbjQcMjj2a5r7o9y4ov7WUvbf0dYxg6Y/PyX/DR4rJ
    QH6g==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9Icyp"
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.26.2 DYNA|AUTH)
    with ESMTPSA id 6078a4x4PCLF0Xv
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 25 May 2021 14:21:15 +0200 (CEST)
Date:   Tue, 25 May 2021 14:20:59 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm: qcom: Add SMP support for Cortex-A7
Message-ID: <YKzrq8V4c2HScgP4@gerhold.net>
References: <20210513153442.52941-1-bartosz.dudziak@snejp.pl>
 <20210513153442.52941-3-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210513153442.52941-3-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, May 13, 2021 at 05:34:42PM +0200, Bartosz Dudziak wrote:
> Implement support for Cortex-A7 CPU release sequence.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  arch/arm/mach-qcom/platsmp.c | 72 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/arch/arm/mach-qcom/platsmp.c b/arch/arm/mach-qcom/platsmp.c
> index 630a038f45..10780bf14a 100644
> --- a/arch/arm/mach-qcom/platsmp.c
> +++ b/arch/arm/mach-qcom/platsmp.c
> @@ -29,6 +29,7 @@
>  #define COREPOR_RST		BIT(5)
>  #define CORE_RST		BIT(4)
>  #define L2DT_SLP		BIT(3)
> +#define CORE_MEM_CLAMP		BIT(1)
>  #define CLAMP			BIT(0)
>  
>  #define APC_PWR_GATE_CTL	0x14
> @@ -75,6 +76,63 @@ static int scss_release_secondary(unsigned int cpu)
>  	return 0;
>  }
>  
> +static int cortex_a7_release_secondary(unsigned int cpu)
> +{
> +	int ret = 0;
> +	void __iomem *reg;
> +	struct device_node *cpu_node, *acc_node;
> +	u32 reg_val;
> +
> +	cpu_node = of_get_cpu_node(cpu, NULL);
> +	if (!cpu_node)
> +		return -ENODEV;
> +
> +	acc_node = of_parse_phandle(cpu_node, "qcom,acc", 0);
> +	if (!acc_node) {
> +		ret = -ENODEV;
> +		goto out_acc;
> +	}
> +
> +	reg = of_iomap(acc_node, 0);
> +	if (!reg) {
> +		ret = -ENOMEM;
> +		goto out_acc_map;
> +	}
> +
> +	/* Put the CPU into reset. */
> +	reg_val = CORE_RST | COREPOR_RST | CLAMP | CORE_MEM_CLAMP;
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
> +
> +	/* Turn on the BHS, set the BHS_CNT to 16 XO clock cycles */
> +	writel(BHS_EN | (0x10 << BHS_CNT_SHIFT), reg + APC_PWR_GATE_CTL);
> +	/* Wait for the BHS to settle */
> +	udelay(2);
> +
> +	reg_val &= ~CORE_MEM_CLAMP;
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
> +
> +	reg_val |= L2DT_SLP;
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
> +	udelay(2);
> +
> +	reg_val = (reg_val | BIT(17)) & ~CLAMP;
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
> +	udelay(2);
> +
> +	/* Release CPU out of reset and bring it to life. */
> +	reg_val &= ~(CORE_RST | COREPOR_RST);
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
> +	reg_val |= CORE_PWRD_UP;
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
> +

I think you forgot to add

	iounmap(reg);

here :)

> +out_acc_map:
> +	of_node_put(acc_node);
> +out_acc:
> +	of_node_put(cpu_node);
> +
> +	return ret;
> +}
> +
>  static int kpssv1_release_secondary(unsigned int cpu)
>  {
>  	int ret = 0;
> @@ -281,6 +339,11 @@ static int msm8660_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  	return qcom_boot_secondary(cpu, scss_release_secondary);
>  }
>  
> +static int cortex_a7_boot_secondary(unsigned int cpu, struct task_struct *idle)
> +{
> +	return qcom_boot_secondary(cpu, cortex_a7_release_secondary);
> +}
> +
>  static int kpssv1_boot_secondary(unsigned int cpu, struct task_struct *idle)
>  {
>  	return qcom_boot_secondary(cpu, kpssv1_release_secondary);
> @@ -315,6 +378,15 @@ static const struct smp_operations smp_msm8660_ops __initconst = {
>  };
>  CPU_METHOD_OF_DECLARE(qcom_smp, "qcom,gcc-msm8660", &smp_msm8660_ops);
>  
> +static const struct smp_operations qcom_smp_cortex_a7_ops __initconst = {
> +	.smp_prepare_cpus	= qcom_smp_prepare_cpus,
> +	.smp_boot_secondary	= cortex_a7_boot_secondary,
> +#ifdef CONFIG_HOTPLUG_CPU
> +	.cpu_die		= qcom_cpu_die,
> +#endif
> +};
> +CPU_METHOD_OF_DECLARE(qcom_smp_cortex_a7, "qcom,cpss-acc", &qcom_smp_cortex_a7_ops);
> +

I'm a bit curious about the name "CPSS". Is that something you came up
with yourself similar to KPSS? There is a slight naming collision here
with the "Chip peripheral subsystem" (CPSS) on APQ8064E (Snapdragon 600),
see https://developer.qualcomm.com/download/sd600/snapdragon-600-device-spec.pdf

Thanks,
Stephan
