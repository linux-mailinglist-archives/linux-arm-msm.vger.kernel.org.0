Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 264C43A2D70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 15:49:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhFJNvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 09:51:10 -0400
Received: from mail-lj1-f182.google.com ([209.85.208.182]:44976 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbhFJNvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 09:51:10 -0400
Received: by mail-lj1-f182.google.com with SMTP id d2so4956703ljj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jun 2021 06:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=11Ch0zTg4bYtpXueHaxR43aR9wj+nY2f+mnI1visPCM=;
        b=p6sA4x678ac8IQLT9xziTdZq+TRG/++h6dI2/3JwzP08t15EgvXPi8f2AEOitzli8q
         5eyaZK9gP4Ada5VPEUL9gbNzSvSsdZ5bK9TDa5mjNaGnlbEmOFMOvdlNj9/QiVsZDhDZ
         6ktHQAJ+SS/anBSoh3v2SPrKebwGPKnWbx8R8CdQFkUlUWzxbyVZtdk0MWPA/+AIhjvV
         xGum1knZriI6JwQVk1ioFLoxwya2uVc4xlkPOnBe/D6imfB3Us1SWQS1ah0LZAY+J6Qs
         7iSmF4FJFG6zkmDukULyDe5b5V3jG3bsOanWMg4b1nLIf0ig1XZ+k0gGWh9mcHD5rnTs
         Y+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=11Ch0zTg4bYtpXueHaxR43aR9wj+nY2f+mnI1visPCM=;
        b=Qe+fAAxWvzcCnHcXvGIsPjV7I8NAdAghOb8oVqWDf0a8Psk8zQQMElUIyMvylpJLYo
         xvhdOv4396pH2UtKvzw1Iyj98aKJ6q++fmlQAq0s6aTacRTUqxaE84jQ8rfMsUjPWqIx
         Ll3py4LAKGyrucjlJGTjA9Y4ZKUbOED7fvhk4rvUKeF2tRTG4b4CQ7Y50So/hp7SZeDC
         PESGu6nM6ns1zLc3zmxctBheoGon5/IdjSBooKzjIAqckWfQ3wn7T01F+lrY58+CGSGq
         dMpqbuE7nzDf6pQVjC9tfGHNUYJdnHizvfupzkmdCKqH19IsCEAGCuD4oDB6La5ENZU/
         X1Hw==
X-Gm-Message-State: AOAM530FP8WpiGU8sraub7cBPtvRnnyeQm8pqQX1Tq+riCM3kupMd1WC
        imjV1eOtowaXCB3bE5DZExcT6A==
X-Google-Smtp-Source: ABdhPJwZJzIOkSGhqqb3zGVBIHgRHoDBffm+2prh3DOdKwTImss/wxSYFdKGwgKHyvtT9OscgyAjyw==
X-Received: by 2002:a2e:9b96:: with SMTP id z22mr2330119lji.164.1623332893362;
        Thu, 10 Jun 2021 06:48:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a14sm305055lfs.108.2021.06.10.06.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 06:48:12 -0700 (PDT)
Subject: Re: [PATCH 0/8] dsi: rework clock parents and timing handling
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
Message-ID: <71839b49-554c-fcc4-d110-0c8a49905413@linaro.org>
Date:   Thu, 10 Jun 2021 16:48:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/05/2021 16:12, Dmitry Baryshkov wrote:
> This patch series brings back several patches targeting assigning dispcc
> clock parents, that were removed from the massive dsi rework patchset
> earlier.

Gracious ping for this series. I'd ask to skip patch 8 for now (as we 
might bring that back for moving PHY to drivers/phy), but patches 1-7 
are still valid and pending review/acceptance.

> 
> Few notes:
>   - assign-clock-parents is a mandatory proprety according to the current
>     dsi.txt description.
>   - There is little point in duplicating this functionality with the ad-hoc
>     implementation in the dsi code.
> 
> On top of that come few minor cleanups for the DSI PHY drivers.
> 
> I'd kindly ask to bring all dts changes also through the drm tree, so
> that there won't be any breakage of the functionality.
> 
> 
> The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:
> 
>    drm/msm/dp: initialize audio_comp when audio starts (2021-05-06 16:26:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-update
> 
> for you to fetch changes up to f1fd3b113cbb98febad682fc11ea1c6e717434c2:
> 
>    drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy (2021-05-14 22:55:11 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (8):
>        arm64: dts: qcom: sc7180: assign DSI clock source parents
>        arm64: dts: qcom: sdm845: assign DSI clock source parents
>        arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
>        arm64: dts: qcom: sm8250: assign DSI clock source parents
>        drm/msm/dsi: stop setting clock parents manually
>        drm/msm/dsi: phy: use of_device_get_match_data
>        drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
>        drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy
> 
>   arch/arm64/boot/dts/qcom/sc7180.dtsi            |  3 ++
>   arch/arm64/boot/dts/qcom/sdm845-mtp.dts         |  3 ++
>   arch/arm64/boot/dts/qcom/sdm845.dtsi            |  6 +++
>   arch/arm64/boot/dts/qcom/sm8250.dtsi            |  6 +++
>   drivers/gpu/drm/msm/dsi/dsi.h                   |  7 +---
>   drivers/gpu/drm/msm/dsi/dsi_host.c              | 51 -------------------------
>   drivers/gpu/drm/msm/dsi/dsi_manager.c           |  8 +---
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 46 ++++++++++------------
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 10 ++++-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 11 ++----
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 11 ++----
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 10 +----
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 12 ++----
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +----
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 13 ++-----
>   15 files changed, 67 insertions(+), 140 deletions(-)
> 
> 


-- 
With best wishes
Dmitry
