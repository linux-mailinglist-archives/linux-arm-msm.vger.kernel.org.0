Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1B54C18E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 21:32:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730226AbfFSTcj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 15:32:39 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:44647 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbfFSTcj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 15:32:39 -0400
Received: by mail-qt1-f194.google.com with SMTP id x47so388815qtk.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 12:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Q8xLvo4XJRoTTfc8mISFQW+2jt5QOewC/3/eGG/+pT4=;
        b=B9z8cIbBXSAAGkAhVirDOMtI2AzBMC5plss+zth7pSDGUd8N9fhdoqrHLDI55TNEWo
         J+rko0sHildCeJqbg6bCp3MGIDoXOwsg/rbgBJOv3c1wfEkd+bi+IScJ0OhiL9zpHHb9
         wAWbrgvkbeUAcX2j95yUEc/v9QHNS87EBQFlMoAuSmuzRb6bwSS+pc/DkqE7B13Oy6hi
         TsQTcKMNOM9UACJhQ1V9f/ngiiT6q9Cp547tjy5NFEZZrvoJhd0x3mjhDQMlIQ9GhcD/
         URvvNvzGR85eqaveHXUhfgHYlGjrtI4aC8EfeOaOZcMRxCVSwYS5mDseVoNVrwJZrjb6
         TFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Q8xLvo4XJRoTTfc8mISFQW+2jt5QOewC/3/eGG/+pT4=;
        b=iWl8tPbf9CUq/ULX++rqsAVde01/cOhXdBba62IIdUCHlBYYirYWi/AZld8hmKZp42
         D1KkthqvPtDcS4CWxYXSZ0DvXIzEzzwI5uKXdrOoTDUUahlwrfqREsP0l92WhTr7KlPc
         zdgfSzeYOJY8oaJgfUDk7rZ+7YEJRgKyCRBoKIIuT8+x5q+v0PAjC4ZRk/6jqngOQT8X
         VMZCAz+WSTq0w0BpAbTa5bGvrRf21r8uRGzrvviBcxIOSM0bebPprWOZRVrbudBU5Rqi
         VAyvDTsjZmcG0xRo77mRu51VXrBYKIcGObA6o6AUCmfUzKD00X+ndM+VV7ksL/NVJ5ac
         HL1Q==
X-Gm-Message-State: APjAAAW60ktYq+04sSEo/KgefatwCrwkREI18NUl4ZcS32jlkyDik0HR
        3agUbNykmx4RUlcheF/Avd3f4A==
X-Google-Smtp-Source: APXvYqzU3bqt6aFWYDSsMGOZgac3c+Tf4JmxtpXGKRAm2NxL0BAZ6YpXV50lUEEZqAiZHOjTqqJvGw==
X-Received: by 2002:a05:6214:10c5:: with SMTP id r5mr33543633qvs.224.1560972758652;
        Wed, 19 Jun 2019 12:32:38 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id i22sm11768509qti.30.2019.06.19.12.32.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 19 Jun 2019 12:32:37 -0700 (PDT)
Date:   Wed, 19 Jun 2019 15:32:37 -0400
From:   Sean Paul <sean@poorly.run>
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        kbuild test robot <lkp@intel.com>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Subject: Re: [PATCH v2] drm/msm/dsi: Add parentheses to quirks check in
 dsi_phy_hw_v3_0_lane_settings
Message-ID: <20190619193237.GG25413@art_vandelay>
References: <20190619161913.102998-1-natechancellor@gmail.com>
 <20190619191722.25811-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619191722.25811-1-natechancellor@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 19, 2019 at 12:17:23PM -0700, Nathan Chancellor wrote:
> Clang warns:
> 
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: warning: logical not is
> only applied to the left hand side of this bitwise operator
> [-Wlogical-not-parentheses]
>         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
>             ^                 ~
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
> after the '!' to evaluate the bitwise operator first
>         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
>             ^
>              (                                               )
> drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c:80:6: note: add parentheses
> around left hand side expression to silence this warning
>         if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
>             ^
>             (                )
> 1 warning generated.
> 
> Add parentheses around the bitwise AND so it is evaluated first then
> negated.
> 
> Fixes: 3dbbf8f09e83 ("drm/msm/dsi: Add old timings quirk for 10nm phy")

Hmm, so it looks like this patch isn't upstream. What tree are you basing this
on?

Sean

> Link: https://github.com/ClangBuiltLinux/linux/issues/547
> Reported-by: kbuild test robot <lkp@intel.com>
> Reviewed-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
> Reviewed-by: Sean Paul <sean@poorly.run>
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---
> 
> v1 -> v2:
> 
> * Fix broken link (thanks to Sean for pointing it out)
> * Add Sean's reviewed-by
> 
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> index eb28937f4b34..47403d4f2d28 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c
> @@ -77,7 +77,7 @@ static void dsi_phy_hw_v3_0_lane_settings(struct msm_dsi_phy *phy)
>  			      tx_dctrl[i]);
>  	}
>  
> -	if (!phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK) {
> +	if (!(phy->cfg->quirks & V3_0_0_10NM_OLD_TIMINGS_QUIRK)) {
>  		/* Toggle BIT 0 to release freeze I/0 */
>  		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x05);
>  		dsi_phy_write(lane_base + REG_DSI_10nm_PHY_LN_TX_DCTRL(3), 0x04);
> -- 
> 2.22.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
