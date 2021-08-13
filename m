Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 807D63EBDAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Aug 2021 22:55:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234547AbhHMUzq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Aug 2021 16:55:46 -0400
Received: from mail-oi1-f177.google.com ([209.85.167.177]:33487 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhHMUzp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Aug 2021 16:55:45 -0400
Received: by mail-oi1-f177.google.com with SMTP id h11so17872901oie.0;
        Fri, 13 Aug 2021 13:55:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7BO2ChIUuNpq3WeTk0/EByYq5NnLR/krREfPVXHnjWs=;
        b=aMcjDePWqNTTND/IXoG91jTc//Vly6b3kwjIY20ebCpPSCzo8qrkcVnxSU+AumISpo
         0MLp7Nqv92GkM18ig2R1cnVluw0MQT74uPt2TgSoCwxh4MSc++EQmnkmedWpEZLvMYbK
         kU8NbAC24lOP2MH45x8qQr8dxTTryjDnrzTqYl1n45qOHSFS36dnu2pj2c4suJNBf8kc
         twUUz1VbXxN0ZN/N/kQmgx7E2SzNgVYMA7ltxKZhVfnJGPdZMi98LpmOAU+LIw92/dAv
         PIzS//DOrZ6DXV2DSkzzzio00mHCCh026/EG1tdg0/j2VLTJvM+wUKONsNJPPY1yLBuP
         GKhg==
X-Gm-Message-State: AOAM532Lcbyy6O2d5AWWjbO8SZ96xZLYCQMYN0KKNzCSHnCQ0miaVT31
        kKSUYByxst5S0WtmIBMFTw==
X-Google-Smtp-Source: ABdhPJzneb8YgUnhnQwPss2jCeHxOJcbK7td+ujVZXi3MHUQPfw/T/R3qMeWlG2j5d5ErA2Mpsy6cQ==
X-Received: by 2002:a05:6808:8c7:: with SMTP id k7mr3725650oij.53.1628888118504;
        Fri, 13 Aug 2021 13:55:18 -0700 (PDT)
Received: from robh.at.kernel.org (2603-8080-2a06-ed00-a2a6-2d62-395f-9378.res6.spectrum.com. [2603:8080:2a06:ed00:a2a6:2d62:395f:9378])
        by smtp.gmail.com with ESMTPSA id m9sm481841ooe.32.2021.08.13.13.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Aug 2021 13:55:17 -0700 (PDT)
Received: (nullmailer pid 4016157 invoked by uid 1000);
        Fri, 13 Aug 2021 20:55:16 -0000
Date:   Fri, 13 Aug 2021 15:55:16 -0500
From:   Rob Herring <robh@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add Sony Tulip Truly
 NT35521 panel support
Message-ID: <YRbcNJHLkvmoG+TM@robh.at.kernel.org>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
 <20210809051008.6172-2-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210809051008.6172-2-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 09 Aug 2021 13:10:07 +0800, Shawn Guo wrote:
> The Sony Tulip Truly NT35521 is a 5.24" 1280x720 DSI panel, which can
> be found on Sony Xperia M4 Aqua phone.  The backlight is managed
> through DSI link.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  .../panel/sony,tulip-truly-nt35521.yaml       | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
