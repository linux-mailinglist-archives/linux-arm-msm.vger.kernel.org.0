Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CB8825FF65
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Sep 2020 18:31:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbgIGQbT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Sep 2020 12:31:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729833AbgIGOYU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Sep 2020 10:24:20 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E121FC061573
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2020 07:24:18 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id y4so16339836ljk.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2020 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c3o7vSrPtfVLY+L0kjQIwvaz2ovSHjf+IEqBu3OCb/o=;
        b=ZfsQVh5sOFI6WXpScSWpbNwdBgiRHlDc06CeoPETYDVo+zJ2ZfpvWawcA10tLMKKD9
         KXZ1Uvms4FAp8JxcirPU3z6GhpGTlnOK1EZ6D0+CZNjDsZm8WZFPHPlX9+1edSK5LOVb
         s4cXB5Rw1O8xiYBKLdol3oQMaZOCHO4uolymrxNK1Xv5zLDX55nfQDY7dZxoIfRxoTqr
         AvbaMT0+vfuRN3JXo1OAcDTmPRmS34ql8nFZKAiKqucLL5+UJ9MdfJMTZRAmqLDMkDEW
         WWS6JlMemfEFb6yXqAF9NK8gplj4KJ58tMQcA1mFVxOSQnSg9dvyflu+8f1BhLcNmLyx
         Gw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c3o7vSrPtfVLY+L0kjQIwvaz2ovSHjf+IEqBu3OCb/o=;
        b=rO8LHycaLHVRO+i8p56rFInO72azeTF6YvMMM8jUeTfE/7BFSTvdQ0htDUQoKCnY7T
         fmVSAJRtTH36FZCtnbnooGAqh59NMqVREL0t3GD4yLq26CG+QX520ghp/Bs3bW0wJdpu
         4yosnda41lyoVxA/aBdeVsyw7pxtqh16RCe3l17Ww1lUDcL3n3Uhj8b7aLfkmjRbc7R3
         2VG4q32meV6/pDlKq8qiHdUrr5s3owOjHA5WfuEApVnHWpX4hArxZFCLfBybPQnS6Ivr
         MwdaqfIETH5Yg0s5LNwWtEwFDkTDvbZaIZ47l9sxHgU1jtxBoozquHQNG5zP9sBkK54a
         oOXQ==
X-Gm-Message-State: AOAM530divakFXJQZ8HFXNNXqVML3VvNlx+UAJzN1Ew2JAJG6Ig79xKT
        ycO7GKJ0jhWQLRwL6N7dEuCY3A==
X-Google-Smtp-Source: ABdhPJziSj5qaeVTYIzqn7mGp3GSDS6K4Y8Yf+iGVKSihjNsDajXJdMvFBL//9rql7id5+Q2WjAVlQ==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr10319433ljj.289.1599488657317;
        Mon, 07 Sep 2020 07:24:17 -0700 (PDT)
Received: from [192.168.1.211] ([188.162.64.144])
        by smtp.gmail.com with ESMTPSA id t14sm7558507lfp.77.2020.09.07.07.24.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:24:16 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm/msm/dsi: support SM8150 and SM8250
To:     Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        Harigovindan P <harigovi@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Krzysztof Wilczynski <kw@linux.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>
References: <20200904172859.25633-1-jonathan@marek.ca>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <87a45d1e-328b-99f5-4990-d4746a24c864@linaro.org>
Date:   Mon, 7 Sep 2020 17:24:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200904172859.25633-1-jonathan@marek.ca>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/09/2020 20:28, Jonathan Marek wrote:
> Add support for SM8150 and SM8250 DSI.
> 
> Note I haven't tested SM8150 recently, but DSI is almost identical to SM8250.

On SM8250:
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Jonathan Marek (3):
>    drm/msm/dsi: remove unused clk_pre/clk_post in msm_dsi_dphy_timing
>    drm/msm/dsi: add DSI config for sm8150 and sm8250
>    drm/msm/dsi: add support for 7nm DSI PHY/PLL
> 
>   .../devicetree/bindings/display/msm/dsi.txt   |   6 +-
>   drivers/gpu/drm/msm/Kconfig                   |   7 +
>   drivers/gpu/drm/msm/Makefile                  |   2 +
>   drivers/gpu/drm/msm/dsi/dsi.h                 |   2 +
>   drivers/gpu/drm/msm/dsi/dsi.xml.h             | 423 ++++++++
>   drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   5 +-
>   drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   2 +
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         | 102 ++
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   6 +-
>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 255 +++++
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.c         |   4 +
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll.h         |  10 +
>   drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c     | 902 ++++++++++++++++++
>   13 files changed, 1721 insertions(+), 5 deletions(-)
>   create mode 100644 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>   create mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c
> 


-- 
With best wishes
Dmitry
