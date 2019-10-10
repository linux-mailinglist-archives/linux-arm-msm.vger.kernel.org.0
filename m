Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B949D30FB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2019 20:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfJJS5T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Oct 2019 14:57:19 -0400
Received: from mail-yw1-f68.google.com ([209.85.161.68]:47095 "EHLO
        mail-yw1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbfJJS5T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Oct 2019 14:57:19 -0400
Received: by mail-yw1-f68.google.com with SMTP id l64so2437776ywe.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2019 11:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mYkYKZa/IAW40qve7RH1LUnrxfude3aPqx7Bo9IiEv4=;
        b=UZFnzXEhuzt61QVzj95dAbZOvJ0ddWU6/oG5/XPc8ZqLaDrICqCqw8WzVXKn8RxcRB
         b9xkIHX8nJuKhNF3/T39PDCFj4R/87HfwO8bquG1h/RWWlwXrTC11Cj5JoAr7c6LUapy
         EotDLgJoyENJw8z96hVdo4QYqeiDqtJNBCOycKtSdH+4w8fhYbHJiL+Bj6GZufLw46JX
         kwPtlQxKLV2KfGXQubdbuHW+zzdnwlLPZA7nutvPnPPc0gqL8jhRpZA1h1gpQm5uIkuN
         eXfRSsl0Exhuqs9eCqbnQv5fwyz8IACv620I+/EeyhO1L5DAl0o0oyh6ohkiEjGLP3jX
         oEOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mYkYKZa/IAW40qve7RH1LUnrxfude3aPqx7Bo9IiEv4=;
        b=HVI99HtdkCuNnM5d8c3f/3V1VCaZJ7vRoO2fQ0EEpkZboY2lghtzE78fvHmtilv42U
         oTJ8LRql1ApiBKhRDRjxb9O50Kp+04GmAuS74FsDZLYqirPpHn2w9mcp9kvlF/L68HO8
         U9IYJgrp+y79FYnazc5mvBT3s4IMwU0djiGVc9wvS//IpYxrMQC2yHTCDXGRIDJuZYfw
         0C6nj4bpDsfEvn+EUoftL6zx5x8cSRcMpjwLcWiWgashhKB+8Mjg9s5b1msr+dIAAVNu
         BvLzVKbn5ZM5UT93zvbGqPEIJwoKo+f4m2qLX6XpbfebkZ5mvUPBgPt5IpjFEVJv2brC
         JqoQ==
X-Gm-Message-State: APjAAAUsIts03TNGtFZk9hRJZ4neHC5yQ4nN04zbHyw2IuARFCPRDmZp
        enbWAraWTLIk1PStjNvjCEjZDQ==
X-Google-Smtp-Source: APXvYqySCH3C8J2Ty5BHwit0g2ny5UP/WmSooJooTN0l8IoUdxx0irRLuBVLWsOUjetHHXeo07b9Ug==
X-Received: by 2002:a81:33cf:: with SMTP id z198mr8509359ywz.165.1570733838187;
        Thu, 10 Oct 2019 11:57:18 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id f127sm1653890ywe.89.2019.10.10.11.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 11:57:17 -0700 (PDT)
Date:   Thu, 10 Oct 2019 14:57:17 -0400
From:   Sean Paul <sean@poorly.run>
To:     kholk11@gmail.com
Cc:     linux-arm-msm@vger.kernel.org, marijns95@gmail.com,
        robdclark@gmail.com, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com,
        tglx@linutronix.de, jonathan@marek.ca, bjorn.andersson@linaro.org,
        georgi.djakov@linaro.org, gregkh@linuxfoundation.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/5] drm/msm/mdp5: Add optional TBU and TBU_RT clocks
Message-ID: <20191010185717.GL85762@art_vandelay>
References: <20190926105256.61412-1-kholk11@gmail.com>
 <20190926105256.61412-2-kholk11@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926105256.61412-2-kholk11@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 26, 2019 at 12:52:52PM +0200, kholk11@gmail.com wrote:
> From: "Angelo G. Del Regno" <kholk11@gmail.com>

Hi Angelo,
Thank you for your patches!

> 
> Some SoCs, like MSM8956/8976 (and APQ variants), do feature these
> clocks and we need to enable them in order to get the hardware to
> properly work.

Could you add an explanation to the commit message of what these
clocks are/do, for those of us who don't know?

> 
> Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
> ---
>  Documentation/devicetree/bindings/display/msm/mdp5.txt |  2 ++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c               | 10 ++++++++++
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h               |  2 ++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/mdp5.txt b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> index 4e11338548aa..43d11279c925 100644
> --- a/Documentation/devicetree/bindings/display/msm/mdp5.txt
> +++ b/Documentation/devicetree/bindings/display/msm/mdp5.txt
> @@ -76,6 +76,8 @@ Required properties:
>  Optional properties:
>  - clock-names: the following clocks are optional:
>    * "lut"
> +  * "tbu"
> +  * "tbu_rt"

Bindings updates should be in their own patch, and you'll need to cc the correct
dt lists and maintainers (especially Rob Herring) in order to get their
attention. (hint: use scripts/get_maintainer.pl)

Sean

>  
>  Example:
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index fec6ef1ae3b9..23be9b95dd7e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -293,6 +293,10 @@ int mdp5_disable(struct mdp5_kms *mdp5_kms)
>  	mdp5_kms->enable_count--;
>  	WARN_ON(mdp5_kms->enable_count < 0);
>  
> +	if (mdp5_kms->tbu_rt_clk)
> +		clk_disable_unprepare(mdp5_kms->tbu_rt_clk);
> +	if (mdp5_kms->tbu_clk)
> +		clk_disable_unprepare(mdp5_kms->tbu_clk);
>  	clk_disable_unprepare(mdp5_kms->ahb_clk);
>  	clk_disable_unprepare(mdp5_kms->axi_clk);
>  	clk_disable_unprepare(mdp5_kms->core_clk);
> @@ -313,6 +317,10 @@ int mdp5_enable(struct mdp5_kms *mdp5_kms)
>  	clk_prepare_enable(mdp5_kms->core_clk);
>  	if (mdp5_kms->lut_clk)
>  		clk_prepare_enable(mdp5_kms->lut_clk);
> +	if (mdp5_kms->tbu_clk)
> +		clk_prepare_enable(mdp5_kms->tbu_clk);
> +	if (mdp5_kms->tbu_rt_clk)
> +		clk_prepare_enable(mdp5_kms->tbu_rt_clk);
>  
>  	return 0;
>  }
> @@ -948,6 +956,8 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
>  
>  	/* optional clocks: */
>  	get_clk(pdev, &mdp5_kms->lut_clk, "lut", false);
> +	get_clk(pdev, &mdp5_kms->tbu_clk, "tbu", false);
> +	get_clk(pdev, &mdp5_kms->tbu_rt_clk, "tbu_rt", false);
>  
>  	/* we need to set a default rate before enabling.  Set a safe
>  	 * rate first, then figure out hw revision, and then set a
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> index d1bf4fdfc815..128866742593 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h
> @@ -53,6 +53,8 @@ struct mdp5_kms {
>  	struct clk *ahb_clk;
>  	struct clk *core_clk;
>  	struct clk *lut_clk;
> +	struct clk *tbu_clk;
> +	struct clk *tbu_rt_clk;
>  	struct clk *vsync_clk;
>  
>  	/*
> -- 
> 2.21.0
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
