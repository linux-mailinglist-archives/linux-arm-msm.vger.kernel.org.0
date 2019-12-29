Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B07512C5A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Dec 2019 18:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729887AbfL2RjT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Dec 2019 12:39:19 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35812 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729422AbfL2RdS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Dec 2019 12:33:18 -0500
Received: by mail-ed1-f68.google.com with SMTP id f8so30480207edv.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Dec 2019 09:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=g+ZqxN5m5gAkIByhRJf04aggcuX7J+K/cyMPSK2p+QA=;
        b=wf71Wq0yMOB58FsNbi2p888B5RLQ+mTavSy4HA7XvUnu6YC98zDS1ey+qK1HxpzbCz
         6L2tloRWFY4Q7RvQIsEA9ZbK5V1v4V5avPP+9GCeSHiPIbf7Tpmorx0qZXXba7X2DB5W
         kwmNwUUsBAk2CmQxiD6T2LL+e7bhOpjNvW2pbsPNyLF+/+jQlCa1UL01REnyBo48MJuh
         JumoHJbyuy81K+RyvAR81dhk9zZwR/fTiDARReOxK4iG/D7vF0f+jbXECX1btRxqyckv
         0ABHpABgoZ4jGMtVfG/I5hdTjow6AKldsBt3vO0+5UKn1ClaUEw6AKa9x3tu06mRS6wa
         JArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=g+ZqxN5m5gAkIByhRJf04aggcuX7J+K/cyMPSK2p+QA=;
        b=cKCs4q7cvpJiGDN6MLCIpaxG6jkyDXVv8VH2F4fUqteQx+hn1pD911s7ZXdwC3/3Hr
         4c7sRYTj89OEII2/2wYBOw1eep24R2Uf8i+QJsEuBMn1TSDwTA9WNuFP8bqwTNCtZs0O
         J8MFlRKpxU6/5ljIq5LtvldIizQOsDFth7hcQG+NZntUlu3aSlrTWEuhoIJQE15MjrPQ
         9dosToDUAP1xs5mlfjJM/yhDB2QRyq09YIb3VMz/StKvVb/PNDcvmvZnGIks+LwDZti4
         5vWlIMKcY+aYAIWehxSWs/QDLMdoEqBUedfWdfiIZxYhB5cDXzTL4hTTjgGHQdMV1xAs
         BLKQ==
X-Gm-Message-State: APjAAAW7XbecJAUENwHYPDN7i2K1M0ShYl8Skr8+mHwD4OGucrGuwkSa
        GnV1xN1fiL4rbB6KLvGjSdbGsQ==
X-Google-Smtp-Source: APXvYqxl8lf/vPqrZynpCjFh+E2DeE1Gmv+uphj+YiOjk0n+Mhaq4H+8GfqCzbvQgw4NmnTE2TrGcg==
X-Received: by 2002:a17:906:7b96:: with SMTP id s22mr65320610ejo.213.1577640796290;
        Sun, 29 Dec 2019 09:33:16 -0800 (PST)
Received: from [192.168.0.104] ([91.139.216.39])
        by smtp.googlemail.com with ESMTPSA id c19sm5162660edu.76.2019.12.29.09.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2019 09:33:15 -0800 (PST)
Subject: Re: [PATCH v3 6/6] clk: qcom: Add video clock controller driver for
 SC7180
To:     Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
 <1577428714-17766-7-git-send-email-tdas@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8f744444-428c-56e2-2565-35b55f1e4aae@linaro.org>
Date:   Sun, 29 Dec 2019 19:33:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577428714-17766-7-git-send-email-tdas@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Taniya,

On 12/27/19 8:38 AM, Taniya Das wrote:
> Add support for the video clock controller found on SC7180
> based devices. This would allow video drivers to probe
> and control their clocks.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> ---
>  drivers/clk/qcom/Kconfig          |   8 ++
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-sc7180.c | 259 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 268 insertions(+)
>  create mode 100644 drivers/clk/qcom/videocc-sc7180.c
> 

<cut>

> +static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
> +	F(19200000, P_BI_TCXO, 1, 0, 0),

Do you know is this frequency (19.2MHz) has real usage? The lower freq
I've seen for Venus was 75MHz.

> +	F(150000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
> +	F(270000000, P_VIDEO_PLL0_OUT_MAIN, 2.5, 0, 0),
> +	F(340000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(434000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
> +	F(500000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
> +	{ }
> +};
> +
-- 
regards,
Stan
