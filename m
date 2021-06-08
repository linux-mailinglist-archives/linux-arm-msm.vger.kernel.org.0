Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC3B239F7FE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 15:41:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232804AbhFHNm7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 09:42:59 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:14508 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232797AbhFHNm7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 09:42:59 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1623159651; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=G9VxwWb8bGsBl7+3DbYo6VDhjWTMxkaPtN3zBTrN8ujYpCcTiNIi/w67eGaj6/32jD
    HT7Gwf7yANiLuhdj7nKlhzUIL5dMnskiErCBdNXschc2dL6Y3G3SW6Y+OFWRFVTtBWUy
    gmV9tgHZohr6KD+AFWz78myUaMRMf4ufTlQRydNl3XIZPOggqNh7mBX+98XrRkwL4EPz
    ASTL456+MVbJBRHSY9J7zEQsUp7JH8yVbvXimzruwvNG6ABSd4SvMSwwEYiewPwiL9Pt
    vuMoRXurb0hVWHFqjN8KeHRncu8sNpbnEl7XuG6OUueICaZe4t/Xax3Djgxai3zyhOTu
    7yGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623159651;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Zx4/iLLgJx/rXn9XP5ob9EuxItyt6o86j/JyvYZbqtQ=;
    b=sMSxqIAkHHi29JaRGJyC4jAKQPpEsPN8Ni5FJQrFoSy3vqy4WtoY5roTYy/7DA2ZNI
    f8MF2IJM9V1XboYEmMSoADOuauB5q1Q95ZENte9AYJMieJBOP+LU5IxemnBgo2kCWnag
    4Y50yTC+gFxhf1M1iWqYM8XXBsIrezHE/E1vO2iwr7o6a/LHVdR95R2YyuA8IoaDUp/3
    l/s0cZ9oYiBXOWHAmNWoxHLHmmGYrB95zyg/xvgFLjykITndxduhpdi6O4264eVF7UND
    ID6GCRUW3bDiulhiXdOpBLz+eAKpO90dmp5sQs8gcVCMnlyszhXshXi50iNofN3iFhQ3
    jZPQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623159651;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Zx4/iLLgJx/rXn9XP5ob9EuxItyt6o86j/JyvYZbqtQ=;
    b=G++hwdH1QyInw8NRVfntDwK/aYsME0QJKekU3kAtVytpMgwhm3FSlxpqy0Pp0qa3wN
    c03UAs+//fFdZDK4CYXbQ9iSilqo6pMZsZV1lglOurxFIqRs2bt7XvhwPRg3914zBHsf
    FUvQbI1nHAUIUhJXtYfVMY4CxoJJ4IWLNS+vPKqBNlEjHy9vNJrrg/XbNMyJAKjRqtUf
    kDebjKDht2DT1clmPiUhlJu1ZDIk8EKFfY+ngNfokuKi2Eo6wiOAshD3iHVJSe1IqKk6
    5Q0y29LoqIoBRIUd1Io14SGW2JDfGCbjwhqAskDdu5Y730sn6MxQ6yscXnrdSJGCs+MF
    CuFw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7IcbDBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.27.2 DYNA|AUTH)
    with ESMTPSA id y01375x58DepdtY
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Tue, 8 Jun 2021 15:40:51 +0200 (CEST)
Date:   Tue, 8 Jun 2021 15:40:45 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] arm: qcom: Add SMP support for MSM8226
Message-ID: <YL9zXcyj4omVheNF@gerhold.net>
References: <20210606201612.100752-1-bartosz.dudziak@snejp.pl>
 <20210606201612.100752-3-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210606201612.100752-3-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, Jun 06, 2021 at 10:16:12PM +0200, Bartosz Dudziak wrote:
> Implement support for Cortex-A7 CPU release sequence in MSM8226 SoC.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
> ---
>  arch/arm/mach-qcom/platsmp.c | 71 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm/mach-qcom/platsmp.c b/arch/arm/mach-qcom/platsmp.c
> index 630a038f45..60496554c6 100644
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
> @@ -75,6 +76,62 @@ static int scss_release_secondary(unsigned int cpu)
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
> +	/* Turn on the BHS and set the BHS_CNT to 16 XO clock cycles */
> +	writel(BHS_EN | (0x10 << BHS_CNT_SHIFT), reg + APC_PWR_GATE_CTL);
> +	/* Wait for the BHS to settle */
> +	udelay(2);
> +
> +	reg_val &= ~CORE_MEM_CLAMP;
> +	writel(reg_val, reg + APCS_CPU_PWR_CTL);
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
> +	iounmap(reg);
> +out_acc_map:
> +	of_node_put(acc_node);
> +out_acc:
> +	of_node_put(cpu_node);
> +	return ret;
> +}
> +
>  static int kpssv1_release_secondary(unsigned int cpu)
>  {
>  	int ret = 0;
> @@ -281,6 +338,11 @@ static int msm8660_boot_secondary(unsigned int cpu, struct task_struct *idle)
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
> @@ -315,6 +377,15 @@ static const struct smp_operations smp_msm8660_ops __initconst = {
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
> +CPU_METHOD_OF_DECLARE(qcom_smp_msm8226, "qcom,msm8226-smp", &qcom_smp_cortex_a7_ops);
> +

Looks good to me now. Actually this is also working well on
MSM8916/Cortex-A53 on a rather unfortunate device where the firmware
does not allow booting 64-bit kernels. I might upstream that now that
it's mostly just adding a new compatible string with the same code.

Assuming your change log is correct and you didn't change the
initialization sequence in v1 -> v2 (didn't check it again):

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks!
Stephan
