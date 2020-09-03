Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB1B25CE59
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 01:30:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgICXa3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 19:30:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725782AbgICXa3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 19:30:29 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F13EFC061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 16:30:28 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id f2so4823137qkh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 16:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tER5efoKTXhoRI49DGq6kR5MKl16jgpcrniDIS3TWH4=;
        b=P8Iz+tAMI2G73pmBCBPMKVteWRhgCOG8kZ5NkoW2pKohWNkpkYbaHlAfkCEVU1i2gN
         EpI9213e0JXvYg81is2Tf8AXYcM5zB3+GMa1m+VTd8CuWnjRbRYk4Q1LOkFOU6eJVT3F
         /gNZAcSmaqEmyH3DGWNvEQ7BNp0BWGhL6UFdvjy5Da5osKR6IDu1kVuECdiG88Mk8uqZ
         5ta4+ky/SkoRH0zQKDx6eLfToQTXUvKv7Gn/VAxX4qV8d1MEelj9BKISJfLvW3wlcz2Q
         gkknVBseAEIHH6qhcjO/fzbJpauwUvoeJrpSX50rQ108IuSpBKsJsZo5bVeHf9De5Kp/
         n+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tER5efoKTXhoRI49DGq6kR5MKl16jgpcrniDIS3TWH4=;
        b=nojVdL84yRuf3tgDn5+7Af5g/zPsgGenUfrl8tZC52gU+VYn/xa1RA95gzGqLmHvYp
         S3VyhNDXZ7Q+LNJUObc/0xZucCxY6L0j1yVYqPqDbTjMrau7f26v5KJQx8AnzSAUDoqf
         L4aykeMZDR5A2o7DFVXModZxDuri4Ekd2uIt4qwxu7UD9Go6qEqZb6noLDMbwvuxmf+5
         tNhNSvJmziGz/LEKB3cWAv6xi2rzwfSWoJubCVOjLkf+aAY2RXg1823SyPxnJ9P3wZ80
         LhYM3mgG6RkQSlZ1Uo5hZOhUsim04v0NpLQATWK8for9AOPye+idrB44ZBd0r9rWsljN
         HyzQ==
X-Gm-Message-State: AOAM531gQuOqxkWE3wg4QnsKXvwZZmIDtoec4EUVddxBlb31bA/1vHOn
        HUl9GPqJTOvc+n3QBMCb0Gf24A==
X-Google-Smtp-Source: ABdhPJzGeyHICZQjuWnQYHvAm4kf2dcs+Bx6pEomtDyhHgZ0jZPH7Hh0NrALaByHL5XLSyHLvrHSsw==
X-Received: by 2002:a37:c404:: with SMTP id d4mr5392815qki.273.1599175827627;
        Thu, 03 Sep 2020 16:30:27 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id m26sm3209338qtc.83.2020.09.03.16.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 16:30:27 -0700 (PDT)
Subject: Re: [PATCH v2 08/10] phy: qcom-qmp: Add support for sc7180 DP phy
To:     Stephen Boyd <swboyd@chromium.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        Vara Reddy <varar@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
 <20200902230215.3452712-9-swboyd@chromium.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <c53059ac-dd88-f8fb-5473-ebc6f70f00d4@marek.ca>
Date:   Thu, 3 Sep 2020 19:29:43 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200902230215.3452712-9-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/2/20 7:02 PM, Stephen Boyd wrote:

...

> +static const struct qmp_phy_cfg sc7180_dpphy_cfg = {
> +	.type			= PHY_TYPE_DP,
> +	.nlanes			= 1,
> +
> +	.serdes_tbl		= qmp_v3_dp_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(qmp_v3_dp_serdes_tbl),
> +	.tx_tbl			= qmp_v3_dp_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(qmp_v3_dp_tx_tbl),
> +
> +	.serdes_tbl_rbr		= qmp_v3_dp_serdes_tbl_rbr,
> +	.serdes_tbl_rbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_rbr),
> +	.serdes_tbl_hbr		= qmp_v3_dp_serdes_tbl_hbr,
> +	.serdes_tbl_hbr_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr),
> +	.serdes_tbl_hbr2	= qmp_v3_dp_serdes_tbl_hbr2,
> +	.serdes_tbl_hbr2_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr2),
> +	.serdes_tbl_hbr3	= qmp_v3_dp_serdes_tbl_hbr3,
> +	.serdes_tbl_hbr3_num	= ARRAY_SIZE(qmp_v3_dp_serdes_tbl_hbr3),
> +
> +	.clk_list		= qmp_v3_phy_clk_l,
> +	.num_clks		= ARRAY_SIZE(qmp_v3_phy_clk_l),
> +	.reset_list		= sc7180_usb3phy_reset_l,
> +	.num_resets		= ARRAY_SIZE(sc7180_usb3phy_reset_l),
> +	.vreg_list		= qmp_phy_vreg_l,
> +	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),

You need a ".regs = qmp_v3_usb3phy_regs_layout," here, otherwise phy 
init functions like qcom_qmp_phy_serdes_init() can crash on a NULL 
reference.

> +
> +	.has_phy_dp_com_ctrl	= true,
> +	.is_dual_lane_phy	= true,
> +};
> +

...
