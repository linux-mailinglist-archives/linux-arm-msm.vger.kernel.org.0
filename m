Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A98EA41F297
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Oct 2021 19:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353708AbhJARBp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Oct 2021 13:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231467AbhJARBp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Oct 2021 13:01:45 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8997C061775
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Oct 2021 10:00:00 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 24so12264371oix.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Oct 2021 10:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8Gm6Q+3gL83lOfRwtpLLNfvQisAdfF3Ia6ayGbMElEw=;
        b=pDUNFyrZOcUuskHCbU/I2Y1ygu3T29/SExagNKEhufMg+lsSaRCTL/PdgaaK8dUrdk
         en1Ij7et7JzghU/zQkOXKGUzjy85AN9biL7tyCxLeWsSlZ4RyZRzNPm+WFTuaUH0crFe
         RRxmJzgLaRvTyLTR1OCjMeLuJebU8rhLsgRjNo/3zaSsJdaFAv2qEnHwr6IzjgCyprwS
         bZuwDHSiNT6f772xbLEZq26ZbgTOcNM52SlTVdJskTFA7k+khcL6ejb9RJbCOcdTxHTJ
         r9pNLF5HP5FQIIDYeTR8X7lKD5CaP0EWggtD/6BgKikedA9yTaXxeU1qlqzpEhra7Tq5
         PeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8Gm6Q+3gL83lOfRwtpLLNfvQisAdfF3Ia6ayGbMElEw=;
        b=rGnsqe0P5MCKZiGe8bL/x4g4AcNMg4rnMtn/qDpjXZ9fHURkrn+XdMqW2pEEbuQbtt
         kOq7ffbmixydDyRdi3X66PfatE/J01dB3zwr/uy2cLE9++MPahwSst+UqlIKM8sVld1q
         11Rlpr7wnrhFtVu50c1ciGY++4pHTs2O3R4KZzNczD9YJ7WrgRDw94LgL1dN8qxwE9nU
         FI9FmyBvN7RpYi/jRxi8aq+Y8BKFmGz/O6z8hvN59+gGIzhf+sz0hcIL79CTvZcKdIiU
         j6jWyZ99y4lx8956x4o+QhQR5ai4pjcliTmtW0X09iPnXjF+G2FhRpLs7G3nCOYAyvbT
         hnVg==
X-Gm-Message-State: AOAM532Y4Jlq3geQoHECiJZMUfo3Y/Z+a2ElgBgAHaTVZ0aYIA8pQ7i8
        QM7C/z2lKJW3fa6iBWVcS6qbY8nNlf9R5A==
X-Google-Smtp-Source: ABdhPJz1hAzkaVKdgCmF0JTuGVyurJ0ysGfGJZfCOzLFln+3jfpw+ThZD72FlZ3HMRQ76LtnRyBD4g==
X-Received: by 2002:aca:4007:: with SMTP id n7mr4702740oia.139.1633107600194;
        Fri, 01 Oct 2021 10:00:00 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id bi1sm1340401oib.34.2021.10.01.09.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 09:59:59 -0700 (PDT)
Date:   Fri, 1 Oct 2021 10:01:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/3] drm/msm: drop old eDP support
Message-ID: <YVc++6JzSNL2sIBm@ripper>
References: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001165011.441945-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 01 Oct 09:50 PDT 2021, Dmitry Baryshkov wrote:

> MSM DRM driver has support for eDP block present on MSM 8x74/8x84 SoC
> families. However since addition back in 2015 this driver received only
> generic fixes. No actual devices with these SoCs supported upstream (or
> by the community) seem to support eDP panels. Judging from downstream
> kernels the eDP was present only on MSM8974 LIQUID or on APQ8084 CDP.
> Remove this driver.
> 

Nice!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ----------------------------------------------------------------
> Dmitry Baryshkov (3):
>       drm/msm/mdp5: drop eDP support
>       drm/msm/edp: drop old eDP support
>       dt-bindings: display/msm: remove edp.txt
> 
>  .../devicetree/bindings/display/msm/edp.txt        |   56 -
>  drivers/gpu/drm/msm/Makefile                       |    6 -
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |   17 +-
>  drivers/gpu/drm/msm/edp/edp.c                      |  198 ---
>  drivers/gpu/drm/msm/edp/edp.h                      |   77 --
>  drivers/gpu/drm/msm/edp/edp.xml.h                  |  388 ------
>  drivers/gpu/drm/msm/edp/edp_aux.c                  |  265 ----
>  drivers/gpu/drm/msm/edp/edp_bridge.c               |  111 --
>  drivers/gpu/drm/msm/edp/edp_connector.c            |  132 --
>  drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1375 --------------------
>  drivers/gpu/drm/msm/edp/edp_phy.c                  |   98 --
>  drivers/gpu/drm/msm/msm_drv.c                      |    2 -
>  drivers/gpu/drm/msm/msm_drv.h                      |   12 -
>  13 files changed, 1 insertion(+), 2736 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/edp.txt
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp.xml.h
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_aux.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_bridge.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_connector.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
>  delete mode 100644 drivers/gpu/drm/msm/edp/edp_phy.c
> 
