Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81BC145A28D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Nov 2021 13:28:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhKWMbZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Nov 2021 07:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236458AbhKWMbZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Nov 2021 07:31:25 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D1CC06173E
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:17 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 133so18618416wme.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Nov 2021 04:28:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=SXnHndjn1TOt11Ey5a67F+PAyOVaDD8SBwIn9/hXTOM=;
        b=hAgpuZ3ZelFNHDs14F8O7CNddFyVIvYYLC1f5ruDP/PKnI9kflh+utx2/asmqUK1AJ
         lPaqaxDTY3ddf1sUNNhR67szBqPHix0sPG6UIx6kLte7pf+9gQimeBoBJ6P15uJ0FSV2
         Iw1YUpB3mmwicwd8pEdxkCXYDIgYDhCZRS8YFd20kx/1et6aCDdKGegyzjNvAnxIdPoZ
         51OtpXreyBi80oayfgBrs1HdyynqKFtWowUwz/E+PQaj6JGjeEkSqJak6DfaY0JCq0/R
         XKDqZVbx6sGN8Sfy1geBahySSHiOFb8C9mYaNMgBWSCdG1dxEh43UTwRGhzwPM/UwYjd
         0A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SXnHndjn1TOt11Ey5a67F+PAyOVaDD8SBwIn9/hXTOM=;
        b=WwCKJb3VolPpNFkqj2UHHLmMM89XBNahiytdeZ9OY73AVvOm2wws4OX/vrkp1tF+bi
         FLLzlOkCCH3D/X0dMwHjo/YJ31u7n5L+s2x31pfsJ4yOtshjC+76P35AXtyYGuibLvJx
         Tz5DWJ1msrygDzaCfteftTlXWJU8J+KOPOaLaEvqxOgQUnMfZg/JbjyFw3EYkMPdKKq+
         VTnDnYv0lMcFy5RoGVpgMcsgbR0smoC2ubolJ0v20D1Bm0cZiDb8f9CfcP+INR0eKL7d
         HWBig/pf9tHSX6YP2oUb2EILU16UWT9kgaWY/BQ0s39ZLHAunXGVuBsMi8kM2w9o7R5X
         O0xg==
X-Gm-Message-State: AOAM532i2jsZat4TW41aFutEOFuTcZQk5WzjoCfADAX7ypWhF5ZI71c+
        ndMba4UILQC9L3MmL6aTbBh/zQ==
X-Google-Smtp-Source: ABdhPJz1cNKjWzjauR6ApzjhPMHe+RsJS+qFP85xeN5g7/aYwUtSn7orNwnE24JsXrdNFJ8YPG7k/w==
X-Received: by 2002:a7b:c102:: with SMTP id w2mr2567233wmi.151.1637670495657;
        Tue, 23 Nov 2021 04:28:15 -0800 (PST)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id z7sm964800wmi.33.2021.11.23.04.28.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 04:28:15 -0800 (PST)
Subject: Re: [PATCH v5 00/10] Add support for audio on SC7280 based targets
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <5f750cfc-dace-59a7-2eb4-4831a313064c@linaro.org>
Date:   Tue, 23 Nov 2021 12:28:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1637239714-11211-1-git-send-email-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 18/11/2021 12:48, Srinivasa Rao Mandadapu wrote:
> This patch set is to add support for Audio over wcd codec,
> digital mics, through digital codecs and without ADSP.
> This patch set depends on:

> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=570161

> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=572615

Except this one, rest of the patches are already in sound-next.
and the only dependency I see here is the final patch which adds 
Kconfigs to the soundcard SND_SOC_SC7280.
Why not just move those two lines in the patchset that adds the soundcard?



--srini


> 	-- https://patchwork.kernel.org/project/alsa-devel/list/?series=559677

> 
> Changes Since V4:
>      -- Remove unused variable in lpass-sc7280 platform driver.
> Changes Since V3:
>      -- Remove redundant power domain controls. As power domains can be configured from dtsi.
> Changes Since V2:
>      -- Split lpass sc7280 cpu driver patch and create regmap config patch.
>      -- Create patches based on latest kernel tip.
>      -- Add helper function to get dma control and lpaif handle.
>      -- Remove unused variables.
> Changes Since V1:
>      -- Typo errors fix
>      -- CPU driver readable/writable apis optimization.
>      -- Add Missing config patch
>      -- Add Common api for repeated dmactl initialization.
> 
> Srinivasa Rao Mandadapu (10):
>    ASoC: qcom: Move lpass_pcm_data structure to lpass header
>    ASoC: qcom: lpass: Add dma fields for codec dma lpass interface
>    ASoC: qcom: Add register definition for codec rddma and wrdma
>    ASoC: qcom: Add lpass CPU driver for codec dma control
>    ASoC: qcom: Add helper function to get dma control and lpaif handle
>    ASoC: qcom: Add support for codec dma driver
>    ASoC: qcom: Add regmap config support for codec dma driver
>    ASoC: dt-bindings: Add SC7280 sound card bindings
>    ASoC: qcom: lpass-sc7280: Add platform driver for lpass audio
>    ASoC: qcom: SC7280: Update config for building codec dma drivers
> 
>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  |  69 ++-
>   sound/soc/qcom/Kconfig                             |  13 +
>   sound/soc/qcom/Makefile                            |   4 +
>   sound/soc/qcom/common.c                            |  39 ++
>   sound/soc/qcom/common.h                            |   1 +
>   sound/soc/qcom/lpass-cdc-dma.c                     | 195 ++++++++
>   sound/soc/qcom/lpass-cpu.c                         | 245 +++++++++-
>   sound/soc/qcom/lpass-lpaif-reg.h                   | 103 ++++-
>   sound/soc/qcom/lpass-platform.c                    | 513 ++++++++++++++++++---
>   sound/soc/qcom/lpass-sc7280.c                      | 416 +++++++++++++++++
>   sound/soc/qcom/lpass.h                             | 150 ++++++
>   11 files changed, 1669 insertions(+), 79 deletions(-)
>   create mode 100644 sound/soc/qcom/lpass-cdc-dma.c
>   create mode 100644 sound/soc/qcom/lpass-sc7280.c
> 
