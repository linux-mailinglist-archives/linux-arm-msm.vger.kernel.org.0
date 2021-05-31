Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DB943961D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 16:46:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232924AbhEaOrK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 10:47:10 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:21408 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234192AbhEaOpH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 10:45:07 -0400
ARC-Seal: i=1; a=rsa-sha256; t=1622472196; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=pdx5kWR3ZwW4ErUT94+FZPObYCFadP5ETYHs+u0NEhhGMBQyHpUBBOtnAcTcmkl/Nw
    AfErtxSzExzYIkNrBxFQnKhhBabU+n+Ig/o3UdC7Ei764VZAFgZQKznVB+KNytoCefvS
    5VwB/8CkUPlrw4vC+BoXhr6y3DSX931nxfYD3dVHb5cNjlDTkMvRtBnqR0VvnSpAt4m7
    TVduW96XIjxEKBUoL4g+P9zAxBBmiYZh8W2FHpveBi6nngDTE2Sw6cXdyEuM62N/AuNI
    JNxX0vdgT33VSvbNdF7BrZ6a1UGGMJWcHjhE1DYUFVPLm90LHSA5QRT9750d3xnVZ6Hh
    p0Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1622472196;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Jg2H/1U2Rc29N+b/uXCyre5UMUQOhLUihSa0cmLxZHY=;
    b=sstw1Fb35nWuKZaxRk5Ygu8fdf5lfd3zuRryVyU3i8mIHsw6Rky0UbB9/p1d6C0Yb2
    OxMCrKATnwqiZtbtRNZLoInVerTq5dXKqlUX9SYsvV1xrn+i1qyf95KWuU6clLhCurTy
    f7zYq2GM5HW3REp2R7DB/sSErtu6oxsG24/47U0KRAtdGdESzFi0mkZbAXXgSwj+3HKY
    uY48iW7W/UJNq48+ZyNF00rqWSSON06u5V+cBrLPmkorIL1dSdC09HKTUHVazQ3NxEdP
    gNEPbw4akdzTt6xJpkYz+1/s6herNNWOhfHExfV0EFIk0SVkU4U8hm4icYfqfBiRp0/5
    fy9w==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1622472196;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Jg2H/1U2Rc29N+b/uXCyre5UMUQOhLUihSa0cmLxZHY=;
    b=JKjt6WmatMwO7xveKf716GY6Qwz0GSjcNuHvoGJXWnLv/M6bTColeiX5biq77hOwCQ
    9APlAsm9hRjLwddt2aCc/LqwSJIK8CQyt9/SVtnuRz3GsjdD3TeCkympSLKnhmuV5zD1
    AfopwoRSFF8geC5fpL/MSyOOFKFxeS0XUzl5bP/Uo4w339PK8M9ZOTIY0yAWxuMJGy0u
    xXfAQXpW2A+Pkg9Gw+39KTSDlfjWytVgOaDhn44xccnSpF5dv2muHOK/naZ36ZHG5T0F
    g7CFrtkRO4lDJEJWmpICBDommKAbphhOuhwslQoxYj68U5054I9gLFPaJWkxdWVwu4XW
    UxGQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcjHBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.26.3 DYNA|AUTH)
    with ESMTPSA id U0b2c9x4VEhFLpE
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 31 May 2021 16:43:15 +0200 (CEST)
Date:   Mon, 31 May 2021 16:43:11 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Cc:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        David Sterba <dsterba@suse.com>, Jens Axboe <axboe@kernel.dk>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/2] cpuidle: qcom: Add SPM register data for MSM8226
Message-ID: <YLT18iBg20DZYyA4@gerhold.net>
References: <20210530121803.13102-1-bartosz.dudziak@snejp.pl>
 <20210530121803.13102-3-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530121803.13102-3-bartosz.dudziak@snejp.pl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 30, 2021 at 02:18:03PM +0200, Bartosz Dudziak wrote:
> Add MSM8226 register data to SPM AVS Wrapper 2 (SAW2) power controller
> driver.
> 
> Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>

I checked that the values added here match the ones I see in
msm8226-pm-v2.dtsi in the downstream kernel, so FWIW:

Reviewed-by: Stephan Gerhold <stephan@gerhold.net>

Thanks,
Stephan

> ---
>  drivers/cpuidle/cpuidle-qcom-spm.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/cpuidle/cpuidle-qcom-spm.c b/drivers/cpuidle/cpuidle-qcom-spm.c
> index adf91a6e4d..c0e7971da2 100644
> --- a/drivers/cpuidle/cpuidle-qcom-spm.c
> +++ b/drivers/cpuidle/cpuidle-qcom-spm.c
> @@ -87,6 +87,18 @@ static const struct spm_reg_data spm_reg_8974_8084_cpu  = {
>  	.start_index[PM_SLEEP_MODE_SPC] = 3,
>  };
>  
> +/* SPM register data for 8226 */
> +static const struct spm_reg_data spm_reg_8226_cpu  = {
> +	.reg_offset = spm_reg_offset_v2_1,
> +	.spm_cfg = 0x0,
> +	.spm_dly = 0x3C102800,
> +	.seq = { 0x60, 0x03, 0x60, 0x0B, 0x0F, 0x20, 0x10, 0x80, 0x30, 0x90,
> +		0x5B, 0x60, 0x03, 0x60, 0x3B, 0x76, 0x76, 0x0B, 0x94, 0x5B,
> +		0x80, 0x10, 0x26, 0x30, 0x0F },
> +	.start_index[PM_SLEEP_MODE_STBY] = 0,
> +	.start_index[PM_SLEEP_MODE_SPC] = 5,
> +};
> +
>  static const u8 spm_reg_offset_v1_1[SPM_REG_NR] = {
>  	[SPM_REG_CFG]		= 0x08,
>  	[SPM_REG_SPM_CTL]	= 0x20,
> @@ -259,6 +271,8 @@ static struct spm_driver_data *spm_get_drv(struct platform_device *pdev,
>  }
>  
>  static const struct of_device_id spm_match_table[] = {
> +	{ .compatible = "qcom,msm8226-saw2-v2.1-cpu",
> +	  .data = &spm_reg_8226_cpu },
>  	{ .compatible = "qcom,msm8974-saw2-v2.1-cpu",
>  	  .data = &spm_reg_8974_8084_cpu },
>  	{ .compatible = "qcom,apq8084-saw2-v2.1-cpu",
> -- 
> 2.25.1
> 
