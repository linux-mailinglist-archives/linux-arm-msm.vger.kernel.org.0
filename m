Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2165925CB6D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 22:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729308AbgICUoA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 16:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728397AbgICUn6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 16:43:58 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F17AC061244
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 13:43:58 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id 60so3006019qtc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eYv0gbDpx47eQ5/qXtuRplSM/G2L1Krze2Is6VCmRm8=;
        b=Ck0KrP8L6SDHEcNpSrjN5mMhsbJsQNRkf1uukumEmBzfNRWvInrpOSZrGbW9x97lid
         yCQ/ujU3eqFXU+nJQa8a+3uWuUaMG1barputIlu3E3TTQ9M8CIzmHM6Z8mNsWP8gKPof
         QzMRxF5W6UEcs9iBDZG88sAB1VTmNDFwhkil/p3jKkRlhLn2eobUSSFCXaKoJgi6BJ5t
         /yTw8yyifVYwfkOrOiYSH867sthl4d00ceomhIBmFTr85rbRs74f9HB0yTt/1CC0s+yy
         eORe33chTcY/0hjP2YPrP0tvHNitIZk9Wy5k9CzFt/fLV309Ex0Afe/jIvJVcxentLY3
         9awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eYv0gbDpx47eQ5/qXtuRplSM/G2L1Krze2Is6VCmRm8=;
        b=miHX7dKoot8LSpjWUEm8Qc29fiBU+9T8Qj5XDluvI4d57r/e7dExNKhswNsSZ6f79K
         eqb3gQeB7DGjTFM/i5u1y9TamYtL4si+HBVm537vf8GWWi1KB31i8X1wTWpRq23UQk75
         tdccdQ9eA+shm82tzbjL3A6Ll5s5inF2Squr2HN6w6ijW9DXK13/JPKdHj9AewRjhmo7
         Lq+151vhA7lbtkn4Z7IC8TsxV6YEnft1zCqUNyWhvGHld7wJmd6t6jyxOWFryhr4VlLi
         gW8S/UmWKo3sDJBhm47NtoVKqQfJicjyrazIPdE783A6k3kDf24Z0oIcC0HJ45gMHcf7
         85Dg==
X-Gm-Message-State: AOAM530m68y668yHwtomWrWLZwwxGp1GHhWmBmssQIw1iO5QMjD38lIS
        4ynITe2kRC2VaV9mFTdGrJu9Yw==
X-Google-Smtp-Source: ABdhPJzeG1PuO6XlkbEPv7d/MdMOKoSKHaL+/NNzyAAAfZnfY3HXdFpRJ6xnMZcaQWn7420qYEOwWw==
X-Received: by 2002:ac8:c47:: with SMTP id l7mr5593873qti.112.1599165834877;
        Thu, 03 Sep 2020 13:43:54 -0700 (PDT)
Received: from [192.168.0.189] ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id j1sm1637007qtk.91.2020.09.03.13.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2020 13:43:54 -0700 (PDT)
Subject: Re: [PATCH v2 07/10] phy: qcom-qmp: Add support for DP in USB3+DP
 combo phy
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
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@chromium.org>
References: <20200902230215.3452712-1-swboyd@chromium.org>
 <20200902230215.3452712-8-swboyd@chromium.org>
From:   Jonathan Marek <jonathan@marek.ca>
Message-ID: <b6f80242-482d-b778-690b-8aefa4e8f23e@marek.ca>
Date:   Thu, 3 Sep 2020 16:43:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200902230215.3452712-8-swboyd@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 9/2/20 7:02 PM, Stephen Boyd wrote:
> Add support for the USB3 + DisplayPort (DP) "combo" phy to the qmp phy
> driver. We already have support for the USB3 part of the combo phy, so
> most additions are for the DP phy.
> 
> Split up the qcom_qmp_phy{enable,disable}() functions into the phy init,
> power on, power off, and exit functions that the common phy framework
> expects so that the DP phy can add even more phy ops like
> phy_calibrate() and phy_configure(). This allows us to initialize the DP
> PHY and configure the AUX channel before powering on the PHY at the link
> rate that was negotiated during link training.
> 
> The general design is as follows:
> 
>    1) DP controller calls phy_init() to initialize the PHY and configure
>    the dp_com register region.
> 
>    2) DP controller calls phy_configure() to tune the link rate and
>    voltage swing and pre-emphasis settings.
> 
>    3) DP controller calls phy_power_on() to enable the PLL and power on
>    the phy.
> 
>    4) DP controller calls phy_configure() again to tune the voltage swing
>    and pre-emphasis settings determind during link training.
> 
>    5) DP controller calls phy_calibrate() some number of times to change
>    the aux settings if the aux channel times out during link training.
> 
>    6) DP controller calls phy_power_off() if the link rate is to be
>    changed and goes back to step 2 to try again at a different link rate.
> 
>    5) DP controller calls phy_power_off() and then phy_exit() to power
>    down the PHY when it is done.
> 
> The DP PHY contains a PLL that is different from the one used for the
> USB3 PHY. Instead of a pipe clk there is a link clk and a pixel clk
> output from the DP PLL after going through various dividers. Introduce
> clk ops for these two clks that just tell the child clks what the
> frequency of the pixel and link are. When the phy link rate is
> configured we call clk_set_rate() to update the child clks in the
> display clk controller on what rate is in use. The clk frequencies
> always differ based on the link rate (i.e. 1.6Gb/s 2.7Gb/s, 5.4Gb/s, or
> 8.1Gb/s corresponding to various transmission modes like HBR1, HBR2 or
> HBR3) so we simply store the link rate and use that to calculate the clk
> frequencies.
> 
> The PLL enable sequence is a little different from other QMP phy PLLs so
> we power on the PLL in qcom_qmp_phy_configure_dp_phy() that gets called
> from phy_power_on(). This should probably be split out better so that
> each phy has a way to run the final PLL/PHY enable sequence.
> 
> This code is based on a submission of this phy and PLL in the drm
> subsystem.

I updated my upstream-based sm8150/sm8250 displayport stack [1] to use 
these patches.

This commit [2] might interest you, so that you can consider what needs 
to change between v3 and v4 PHYs. Note some of the V4 registers have the 
same address as V3, so the diff could be smaller.

Do you have any plan for dealing with the SS PHY and DP PHY conflicting 
with each other? For example, PHY_MODE_CTRL needs to be "DP_MODE" for 
4-lane DP, "DP_MODE | USB3_MODE" for 2-lane DP + USB3, and (AFAIK) 
"USB3_MODE" for superspeedplus usb (and it seems this gates some clocks, 
so you can't read/write dp tx2 registers in 2-lane DP mode for example). 
 From your cover letter it sounds like this isn't relevant to your 
hardware, but it looks like both PHYs are writing to the dp_com region 
which is still problematic. (in the branch I linked, I disabled the SS 
PHY to test the DP PHY)

Also some issues I noticed:
- used QSERDES_COM_RESETSM_CNTRL instead of 
QSERDES_V3_COM_RESETSM_CNTRL2, which has different value
- in sc7180_dpphy_cfg, .regs is NULL, which results in NULL references

[1] https://github.com/flto/linux/commits/sm8x50-hdk-display
[2] 
https://github.com/flto/linux/commit/ccf56912bd5e652b4daebec1300961a9d51342b1
