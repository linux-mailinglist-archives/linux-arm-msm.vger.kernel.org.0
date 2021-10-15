Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88EA142F41B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Oct 2021 15:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236167AbhJONrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Oct 2021 09:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239789AbhJONrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Oct 2021 09:47:02 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC74EC061764
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 06:44:55 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id q5so8643508pgr.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Oct 2021 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=zimEHaa8boz7suXsDIx5TYAWL4pCIFUnpVjWJ99Ya3Q=;
        b=MMacAUqGHA05CB6dO+d10bTCMV6YZg8fNsN8QjMkWyCUbh1cvhp+jLwLYNoEi0ANPi
         tT5UckVy4yelnkGZRUloIFfqD6gCT4yeq0c4biaz1U4ac6lPMk/qJQLW4/goyvoMhvDN
         iG1pfRX/ccLrvySqpWyRFKktEzR5fWB4JEnyBJ/rPy6kWz4t5xhMwbg6OU5faLMzAVBZ
         t4ubC5CJnuuyG5zAHSuO7cSi9dfYB507+YJKheKAWNJu+ckfSDophohTtKMFZCqkpeYx
         KbkDCbNguoPwIhMgW9hI1CW9MMlxaUQaglQUB1aBoYYsle+TG7O4LcDH2ABI3RY1NW3i
         5c6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=zimEHaa8boz7suXsDIx5TYAWL4pCIFUnpVjWJ99Ya3Q=;
        b=qpwDiPPqPNhUefOi9BR1XnOUbjIk81riW4mlcUOmHMZyQm2AC8gvwKeS320Ckfph0u
         4ts+mihN5ImI9j0qb2HESERZ73WMu3F9PhejHjZyt7/gblePIex42kAJ8EO4KKGqG5Bg
         GNylNTtyhwGcAKsRWAqg0m7ajd0xbVoY87xcKwh2bPs7OqNEWK4CATP/5HYett/0nD+0
         b/D0709dygHZpoa3xljSlfrQLPxynMBhhA8n4lOyiD6J5Icb4kDx+VUwluda2YLMKNLk
         IWZWwBWeyr5734zemSXO/TLSPSpnCTxFV/ETche3+ECustXOxwmsl/lwNokvKo1RB11C
         wxGQ==
X-Gm-Message-State: AOAM533rp1n3l58hWP3GQF3/hvE6KdDj+CYyxrQSGvymRT8V+6yX4jCc
        zYFNVLRqHHVDk/dlseDvZrviKw==
X-Google-Smtp-Source: ABdhPJyXcW0NY6hb5uxr9hkmKKgxAfPW45Ii+fi04i4RUJ0SArTy2VUA4xhiREiWN2dPrSkvQbQcLQ==
X-Received: by 2002:a62:5fc6:0:b0:44c:591a:5bf6 with SMTP id t189-20020a625fc6000000b0044c591a5bf6mr11446966pfb.36.1634305495222;
        Fri, 15 Oct 2021 06:44:55 -0700 (PDT)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id y22sm5069176pjj.5.2021.10.15.06.44.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 06:44:55 -0700 (PDT)
Date:   Fri, 15 Oct 2021 21:44:47 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org
Subject: Re: [PATCH v12 0/5] Introduce SoC sleep stats driver
Message-ID: <20211015134446.GA7231@dragon>
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Oct 13, 2021 at 12:08:19PM +0530, Maulik Shah wrote:
> Changes in v12:
> - Address Stephan's comments from v11
> - Rename driver and compatible to qcom,rpm(h)-stats
> - Skip reading SMEM for RPM targets
> - Make driver register in late_init to avoid -EPROBE_DEFER from smem.
> - Change size to 0x10000 for RPM targets since area contains many others stats.
> 
> Changes in v11:
> - Address Bjorn's comments from v10
> - Add a case for RPM based targets dynamic offset in driver
> - Update commit messages to use qcom sleep stats instead of soc sleep stats
> - Drop individual target dtsi changes for sc7180 and sc7280
> - Add single change to enable sleep stats for RPMh based targets
> - Add single change to enable sleep stats for RPM based targets
> 
> Changes in v10:
> - Updated device node name to use memory instead of aop_msgram
> - Remove Lina's email from maintainers 
> - Rename driver to qcom_sleep_stats. Update makefile, Kconfig accordingly
> - Address Bjorn's comments from v9
> 
> Changes in v9:
> - Remove soft dependency on smem module
> - Return -EIO to userspace in case of error
> - Make struct sleep_stats *stat a const pointer
> - Remove the driver from soc_sleep_stats_driver name
> - Remove offset address and directly mention the msgram address in dtsi
> - Use devm_platform_get_and_ioremap_resource() to ioremap dtsi address
> - Update device node name to mention aop_msgram instead rpmh-sleep-stats
> - Update dtsi and documentation accordingly but retain the reviews
> 
> Changes in v8:
> - Addressed bjorn's comments in driver from v7
> - Update aoss_qmp device node reg size for sc7280
> 
> Changes in v7:
> - Fix example in bindings documentation as per #address/size-cells = <1>.
> - Add comment in driver from where 'ddr' subsystems name is read.
> - Update comment in driver to s/beside/besides and others from v6.
> - Rename debugfs_create_entries() from v6.
> - Drop use of memcpy_fromio() to find the name.
> - Use sizeof(*prv_data) in devm_kzalloc().
> - Add change to define readq() if its not yet defined for compile support.
> - Add wpss subsystem in the list of subsystems.
> - Add module soft dependency on smem module.
> - Add new change to add device node for sc7280.
> 
> Changes in v6:
> - Address stephen's comments from v5 which includes below
> - Pad 0 in documentation example to make address 8 digit
> - define macro to calculate offset in driver
> - Add appended_stats_avail to prv_data instead of using entire stats_config
> - make array subsystems[] as const
> - Add comment for SSR case
> - Use memcpy_fromio() and devm_kcalloc() during probe
> - Change file permission mode from 444 to 400 
> 
> - Address guenter's comments to add depends on QCOM_SMEM
> 
> - Add adsp_island and cdsp_island subsystems
> - Use strim() to remove whitespace in stat name
> 
> Changes in v5:
> - Remove underscore from node name in Documentation and DTSI change
> - Remove global config from driver change
> 
> Changes in v4:
> - Address bjorn's comments from v3 on change 2.
> - Add bjorn's Reviewed-by on change 3 and 4.
> 
> Changes in v3:
> - Address stephen's comments from v2 in change 1 and 2.
> - Address bjorn's comments from v2 in change 3 and 4.
> - Add Rob and bjorn's Reviewed-by on YAML change.
> 
> Changes in v2:
> - Convert Documentation to YAML.
> - Address stephen's comments from v1.
> - Use debugfs instead of sysfs.
> - Add sc7180 dts changes for sleep stats
> - Add defconfig changes to enable driver
> - Include subsystem stats from [1] in this single stats driver.
> - Address stephen's comments from [1]
> - Update cover letter inline to mention [1]
> 
> Qualcomm Technologies, Inc. (QTI)'s chipsets support SoC level low power
> modes. SoCs Always On Processor/Resource Power Manager produces statistics
> of the SoC sleep modes involving lowering or powering down of the rails and
> the oscillator clock.
> 
> Additionally multiple subsystems present on SoC like modem, spss, adsp,
> cdsp maintains their low power mode statistics in shared memory (SMEM).
> 
> Statistics includes SoC sleep mode type, number of times LPM entered, time
> of last entry, exit, and accumulated sleep duration in seconds.
> 
> This series adds a driver to read the stats and export to debugfs.
> 
> [1] https://lore.kernel.org/patchwork/patch/1149381/
> 
> Mahesh Sivasubramanian (2):
>   dt-bindings: Introduce QCOM Sleep stats bindings
>   soc: qcom: Add Sleep stats driver
> 
> Maulik Shah (3):
>   arm64: defconfig: Enable Sleep stats driver
>   arm64: dts: qcom: Enable RPMh Sleep stats
>   arm64: dts: qcom: Enable RPM Sleep stats

On SDM660:

Tested-by: Shawn Guo <shawn.guo@linaro.org>
