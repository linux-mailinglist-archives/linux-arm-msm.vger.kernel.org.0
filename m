Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA55F39A4A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2019 05:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbfFHDc5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Jun 2019 23:32:57 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:34376 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729924AbfFHDc5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Jun 2019 23:32:57 -0400
Received: by mail-pl1-f193.google.com with SMTP id i2so1533081plt.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2019 20:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OC4ha/gavEmQ9A1g/pl9ZGbgw4r/3XC6pB7BtZ0jhE0=;
        b=m6KBNxDE2SKGyhMty2QeqhwjxXrI8BuN494ubr8ejix2tRtzacu7vJAR9Hs5i2q5F8
         5mjBF6z9SHYnxu+ReKYZyAQW2MDGYXCVdFAwVfYP4Vpc2/OJxR2lLEu4zl+yc6t3r7u7
         R7Gql7Y81TjdALjHPpYhruVZauxUVGFFLKTh+Pf0y9JtDWux7EITRf5FZ76ii8YKY+bc
         rFINbch2+tJrIKuq6FUllUvcrZLYZrGKhqKv94s0ErCZUtCtUSzVAn3aqdvQt+RjrfTP
         JHRlX4E9kdnYolMBVwq/phhgqpnmvu7sTuVSX6d8RwzRbBvvHkRxzFyid/W4ur35QzDK
         RAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OC4ha/gavEmQ9A1g/pl9ZGbgw4r/3XC6pB7BtZ0jhE0=;
        b=oSK1bsMm+69apmVKynqUkeG/V3oxzXNw+nDcG0EtdBZNzct1cONNPUPBKxRgl8ReEK
         kftyUNTG9kX58/TYEkduSBeX+MdnUvMdBVuMoDZYpfGj/jOW1mM1vLAy3EBd6hlQCKXU
         t2646tLBJzHkn3vXNGAqwNyeCYqtJZioPjSXmmG7s2F6eAc6IFofaNL1Msv4vXEcl8so
         u8vVFea306I16dfODQql2WwgqEmYu+Wdxck2e6nHjMRtrEyVPVmCdSVIVIulPz+Gvpy5
         4mYmUAIi76+5vis5MIGripcQUH2U0FZKQMfYgGbYFYyKURjWpJSWl8kbs/ccsN54YLg+
         g2WA==
X-Gm-Message-State: APjAAAXAxC2nHJBB3UREhfDX5ziaPVK7NxxuQuL/e8cfqUXf6u5d/5WA
        nqaIwzHg9p1EV931QTZLhHNE8w==
X-Google-Smtp-Source: APXvYqyvURItZPpNCAxXxcxVo3Fg5EhKFWFD5HtYD68smQYpsMoXzfLjZs+9l9buosxYpioclI20Ww==
X-Received: by 2002:a17:902:6b03:: with SMTP id o3mr59043693plk.85.1559964776069;
        Fri, 07 Jun 2019 20:32:56 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id m6sm3546820pjl.18.2019.06.07.20.32.55
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 20:32:55 -0700 (PDT)
Date:   Fri, 7 Jun 2019 20:32:53 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sricharan R <sricharan@codeaurora.org>
Cc:     robh+dt@kernel.org, sboyd@codeaurora.org, linus.walleij@linaro.org,
        agross@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/6] arm64: defconfig: Enable qcom ipq6018 clock and
 pinctrl
Message-ID: <20190608033253.GF24059@builder>
References: <1559754961-26783-1-git-send-email-sricharan@codeaurora.org>
 <1559754961-26783-7-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559754961-26783-7-git-send-email-sricharan@codeaurora.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 05 Jun 10:16 PDT 2019, Sricharan R wrote:

> These configs are required for booting kernel in qcom
> ipq6018 boards.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4d58351..abf64ee 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -373,6 +373,7 @@ CONFIG_PINCTRL_MAX77620=y
>  CONFIG_PINCTRL_IMX8MQ=y
>  CONFIG_PINCTRL_IMX8QXP=y
>  CONFIG_PINCTRL_IPQ8074=y
> +CONFIG_PINCTRL_IPQ6018=y
>  CONFIG_PINCTRL_MSM8916=y
>  CONFIG_PINCTRL_MSM8994=y
>  CONFIG_PINCTRL_MSM8996=y
> @@ -646,6 +647,7 @@ CONFIG_COMMON_CLK_QCOM=y
>  CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_QCOM_CLK_RPMH=y
>  CONFIG_IPQ_GCC_8074=y
> +CONFIG_IPQ_GCC_6018=y
>  CONFIG_MSM_GCC_8916=y
>  CONFIG_MSM_GCC_8994=y
>  CONFIG_MSM_MMCC_8996=y
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
> 
