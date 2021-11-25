Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE0F45D486
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Nov 2021 07:06:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345842AbhKYGJO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 01:09:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346211AbhKYGHO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 01:07:14 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC21AC06175F
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 22:04:03 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 71so4264465pgb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Nov 2021 22:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=H4HGalLWPoVzFfPEimJE+jSmxShewGOJaaasN5eIRFY=;
        b=Yzolavh8EgkLLQNjLrl92FoQDZ1jXBMTGsHtIbaDhmR5Ma95uIWI7NMCc4mUHZhVYq
         6tVImTXu4OqG1Sl9c8zUbm15NBTorwhGsT5Be3sQ45sXhlbqP88TeEFaTNdSyqqh9LvX
         UO6o51fG77tfwqMQ3qLCAvefkJP4crErJn4znvUYoPOxJ/VviydR2/QL4ClGJQyWrObh
         gXBnSuOqom9ByInHTijSXG6M2nbuqvc47jpocSSGd/lQfqsggs+dYxMw6EooylMBQxIv
         1V+0B6al0w/KVhfgH7XicUSn00JebhOe4tX5Izt0DWkN9I8VpPp1SQ2knsfa8UgrD8R/
         oh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=H4HGalLWPoVzFfPEimJE+jSmxShewGOJaaasN5eIRFY=;
        b=Zyhkmy38iNl1v3gIv4rRrKOu3TmzZ82uY8y9Z0OkFUSWAf6XFfh7NTx0M1BPJez2Ee
         0RKdeKz+4yvY2/Ve4t5J872bZEZa6OqbyvL5z025WnThfaoXBsNyDYIOw9BuPBn6u5kR
         AhMEL/uX17TKktQ3WTbOXuN6lV694PLFC3I1lzMKplRL2wVEwe6iY3iouMiCTw61+UqC
         xm0ibpr8MX2q0lwnbY7wZzh9ku5sl1d67IXadwrANNmmDeP6Dj1US/V8NaeIxvtRnHn0
         ItOOmToo+u4R3eL1hyF24F9oxBvb5hxelKsVR9/5OvvDIvwj3w2pBeVjCYx2tpqn3SNm
         Q1KA==
X-Gm-Message-State: AOAM5308xvFGiKnlkxvK1ZVZfvA1F58p356cgAFRgjaLJvyDoDGsuyUJ
        hRSZ23jciXt8cA5DG1ZchVqOcw==
X-Google-Smtp-Source: ABdhPJxX+JigNlEsGnLVlcVZ4PEeRBHwNV2cngtjzEmmJD5jrW7yOVvbTC/efI18E8K7OL72LYonaQ==
X-Received: by 2002:a05:6a00:244d:b0:44d:c279:5155 with SMTP id d13-20020a056a00244d00b0044dc2795155mr11835871pfj.0.1637820243399;
        Wed, 24 Nov 2021 22:04:03 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id pj12sm6973544pjb.51.2021.11.24.22.04.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Nov 2021 22:04:03 -0800 (PST)
Date:   Thu, 25 Nov 2021 14:03:57 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add Qualcomm MPM irqchip driver support
Message-ID: <20211125060356.GA10105@dragon>
References: <20211122075207.20114-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211122075207.20114-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 22, 2021 at 03:52:05PM +0800, Shawn Guo wrote:
> It adds DT binding and driver support for Qualcomm MPM (MSM Power Manager)
> interrupt controller.
> 
> Shawn Guo (2):
>   dt-bindings: interrupt-controller: Add Qualcomm MPM support
>   irqchip: Add Qualcomm MPM controller driver

Please disregard this version.  I would like to update the driver for
better alignment with qcom-pdc, so that DT can be wired up in the same
way as PDC.  Sorry for the noise!

Shawn
