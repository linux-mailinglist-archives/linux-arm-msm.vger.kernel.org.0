Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 414083AF833
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 00:02:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229789AbhFUWEW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 18:04:22 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:59919 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230283AbhFUWEV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 18:04:21 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624312927; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=mKdPiX5ceufqkEx8Nci/j3NszUX+oF1c+HY50pFYGus=;
 b=hFYWEmVzIa6b5at/hWEJEW7uxtgeCgWzuhl3AItchua26tlDrNT4Oz9227Y93W0vnR31zATx
 y4EwqZ1uRFyJLIV+sWwyNwIa+ZAJhI65IQ+giS8dXMF62Z5R7j+HxuMbUqMTEMIHsMdLVmIj
 oXwLc6g3cMiTpf9lbJov9legxVU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60d10c38e27c0cc77f0b46e7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Jun 2021 22:01:28
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82A3DC4338A; Mon, 21 Jun 2021 22:01:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8895CC433F1;
        Mon, 21 Jun 2021 22:01:26 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 21 Jun 2021 15:01:26 -0700
From:   abhinavk@codeaurora.org
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 0/8] dsi: rework clock parents and timing
 handling
In-Reply-To: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
References: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
Message-ID: <5156aeb320b5625959fff8364e216c2f@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-05-15 06:12, Dmitry Baryshkov wrote:
> This patch series brings back several patches targeting assigning 
> dispcc
> clock parents, that were removed from the massive dsi rework patchset
> earlier.
> 
> Few notes:
>  - assign-clock-parents is a mandatory proprety according to the 
> current
>    dsi.txt description.

Is this comment still right? dsi.txt has now moved to YAML format, but 
even before
that I am not able to see that this was a mandatory property. With these 
changes yes,
it becomes a mandatory property and hence needs to be documented that 
way.

>  - There is little point in duplicating this functionality with the 
> ad-hoc
>    implementation in the dsi code.
> 
> On top of that come few minor cleanups for the DSI PHY drivers.
> 
> I'd kindly ask to bring all dts changes also through the drm tree, so
> that there won't be any breakage of the functionality.
> 
> 
> The following changes since commit 
> f2f46b878777e0d3f885c7ddad48f477b4dea247:
> 
>   drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
> 16:26:57 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.linaro.org/people/dmitry.baryshkov/kernel.git 
> dsi-phy-update
> 
> for you to fetch changes up to 
> f1fd3b113cbb98febad682fc11ea1c6e717434c2:
> 
>   drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy (2021-05-14
> 22:55:11 +0300)
> 
> ----------------------------------------------------------------
> Dmitry Baryshkov (8):
>       arm64: dts: qcom: sc7180: assign DSI clock source parents
>       arm64: dts: qcom: sdm845: assign DSI clock source parents
>       arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
>       arm64: dts: qcom: sm8250: assign DSI clock source parents
>       drm/msm/dsi: stop setting clock parents manually
>       drm/msm/dsi: phy: use of_device_get_match_data
>       drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
>       drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy
> 
>  arch/arm64/boot/dts/qcom/sc7180.dtsi            |  3 ++
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts         |  3 ++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi            |  6 +++
>  arch/arm64/boot/dts/qcom/sm8250.dtsi            |  6 +++
>  drivers/gpu/drm/msm/dsi/dsi.h                   |  7 +---
>  drivers/gpu/drm/msm/dsi/dsi_host.c              | 51 
> -------------------------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c           |  8 +---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 46 
> ++++++++++------------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 10 ++++-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 11 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 11 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 10 +----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 12 ++----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +----
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 13 ++-----
>  15 files changed, 67 insertions(+), 140 deletions(-)
> 
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
