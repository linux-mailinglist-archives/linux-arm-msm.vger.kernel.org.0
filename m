Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8CE5EC6AB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 16:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbiI0Ojr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 10:39:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233145AbiI0OjW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 10:39:22 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B693B5FDCD
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 07:35:24 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id b24so11133336ljk.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 07:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=/clpfezaOe8mLPrQfl3pX+kpaqNYyTiLhiE5Y1A/Axg=;
        b=ZyxJ0VAXz3Yx6wVEKSkMktMdGFJ+xOEWNqSzclwgt627nnfNxbSWBkdUOdDVZIdPeO
         ztKr1AfIi1u6h4wPXg0FlTTwg/AM2jMJONWfS9196v7E7IgYRPzJ/YrgMBsmiV4AGi9E
         BZtY7qdtZg80u0PwB1t3FI+gH9HiiKMDR+3fhvMlpQyVAM74KbmRPelfIgKkO5/eRmIe
         WQf37Y2jfiKxOBPKiXsa/rTdHymfI3YNyXBi8U3BLwu6w0/Q9bF0gsmUdr9B01p8PSGW
         sbBayxucHNKPWzlzFqQi0sB/QK0yX49GQwHuULeeybmD+opaRa0BiJ7ZQ7WIosw7tFch
         UDSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/clpfezaOe8mLPrQfl3pX+kpaqNYyTiLhiE5Y1A/Axg=;
        b=ZFUGjrBwTeRCuoQygBlWSvJe4/tEpvdM4IVsFoiKUw3VDzJjAty0r44VxGApmYJ/vY
         lEpgKeBsjHoDBKGY/OKGBnPJhnCxJnxneGFgfaElhZCLC0nqkwrhxqpAQ+kAOIikK7ux
         RYHSdA4IyB1M2VirDVnGDPhGzmAxqK8PHNNZoCXobD97ARFsYzpuNAS1T3r4UKo9qTCd
         91J4p34U4UbW+R6LQ3e1hVxMVkw+NzZeigJaidp7I+l/9ObeZd891vVyEgnXYxpnrDMZ
         oomAJbJ2O+SP0eSWnryF5r/8w1ccRsq5EE8G7IylLTuJ+UAmFybO7CQi8Hiun9nioHUg
         OzzA==
X-Gm-Message-State: ACrzQf3B5PpZTEOIHoA8a4C81VIuTYUc3n9KI1XEvJ7awM3IWX9Zvl6V
        FzDEveFrIl6r1RN6fObmP46Qng==
X-Google-Smtp-Source: AMsMyM6PT4U1pTFDQtF2QivAJie+RqkxW7ZZSiD2PM7A3oNR4iAzYYKKhCpfzt7mx7GPKsQjtnSovA==
X-Received: by 2002:a05:651c:23a1:b0:26d:9eb6:7b60 with SMTP id bk33-20020a05651c23a100b0026d9eb67b60mr3329748ljb.208.1664289321468;
        Tue, 27 Sep 2022 07:35:21 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0048b143c09c2sm178450lfu.259.2022.09.27.07.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 07:35:20 -0700 (PDT)
Message-ID: <5e269e1a-8819-a326-90e0-a020cb2c0d73@linaro.org>
Date:   Tue, 27 Sep 2022 17:35:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v5 00/30] Rework the trip points creation
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20220927143239.376737-1-daniel.lezcano@linaro.org>
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220927143239.376737-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Daniel,

On 27/09/2022 17:32, Daniel Lezcano wrote:

[skipped]

>   drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |   2 -
>   .../ethernet/chelsio/cxgb4/cxgb4_thermal.c    |  41 +----
>   drivers/platform/x86/acerhdf.c                |  73 +++-----
>   drivers/thermal/armada_thermal.c              |  39 ++---
>   drivers/thermal/broadcom/bcm2835_thermal.c    |   8 +-
>   drivers/thermal/da9062-thermal.c              |  52 +-----
>   drivers/thermal/gov_bang_bang.c               |  39 +++--
>   drivers/thermal/gov_fair_share.c              |  18 +-
>   drivers/thermal/gov_power_allocator.c         |  51 +++---
>   drivers/thermal/gov_step_wise.c               |  22 ++-
>   drivers/thermal/hisi_thermal.c                |  11 +-
>   drivers/thermal/imx_thermal.c                 |  72 +++-----
>   .../int340x_thermal/int340x_thermal_zone.c    |  33 ++--
>   .../int340x_thermal/int340x_thermal_zone.h    |   4 +-
>   .../processor_thermal_device.c                |  10 +-
>   drivers/thermal/intel/x86_pkg_temp_thermal.c  | 120 +++++++------
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c   |  39 ++---
>   drivers/thermal/rcar_gen3_thermal.c           |   2 +-
>   drivers/thermal/rcar_thermal.c                |  53 +-----
>   drivers/thermal/samsung/exynos_tmu.c          |  57 +++----
>   drivers/thermal/st/st_thermal.c               |  47 +----
>   drivers/thermal/tegra/soctherm.c              |  33 ++--
>   drivers/thermal/tegra/tegra30-tsensor.c       |  17 +-
>   drivers/thermal/thermal_core.c                | 161 +++++++++++++++---
>   drivers/thermal/thermal_core.h                |  24 +--
>   drivers/thermal/thermal_helpers.c             |  28 +--
>   drivers/thermal/thermal_netlink.c             |  21 +--
>   drivers/thermal/thermal_of.c                  | 116 -------------
>   drivers/thermal/thermal_sysfs.c               | 133 +++++----------
>   drivers/thermal/ti-soc-thermal/ti-thermal.h   |  15 --
>   drivers/thermal/uniphier_thermal.c            |  27 ++-
>   include/linux/thermal.h                       |  10 ++
>   32 files changed, 559 insertions(+), 819 deletions(-)


Could you please cc mailing lists on all patches? It's really hard to 
determine whether qcom changes are correct without seeing other patches.

-- 
With best wishes
Dmitry

