Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4D781E531D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 03:34:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725294AbgE1Beu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 21:34:50 -0400
Received: from mail-il1-f195.google.com ([209.85.166.195]:46974 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgE1Beu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 21:34:50 -0400
Received: by mail-il1-f195.google.com with SMTP id h3so3523168ilh.13;
        Wed, 27 May 2020 18:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nc1xYCw1KD9ef91XiAdzK+QPSDWo/LFHJ3pQwzb/o8c=;
        b=D7nm92qkKmlxxc3ZQk2SOda/m6atE7TkoGgw6fSTSEQ8qM1WrBJghX6N+IvsCX3W89
         efeD+aKQvaDDyoN4RyN5RQgri4AT4BkqVa8e9INfeJG71e9sy22WuWqNcgFEAqx7hbOT
         732mGeJuWF9C3sR5m0Ts5+PoLYao5vtgSjy1HbtxAZ4RtKUgQ6OkfRurzhmuLfHN4hyf
         WNFEZrDQUEvBFFNbJKzUOm1uDqJbyUBq6X3M796zeLiTW7PP+xw4Du8ZyfMmeph+SS1V
         sNSLnWFrUhydRS5LaqAW1+8zzPSZQTwSgL1BC0AKk8+GdQCt+8wmBGGfPmY58bldD1FS
         n2fg==
X-Gm-Message-State: AOAM53010Nqs0TIVn30Ie4zJyU8Zkz/3sgU4OeesTgzAgLh8xZ1pYOmg
        gOrk9u+Lpndua+vLs7UVxg==
X-Google-Smtp-Source: ABdhPJwymYNAx4sILLom9EnIknxnjsBziqxYdE/dhdeJiSyDuDoWGYDh8BcOShip3SBpBmyPzfQqxA==
X-Received: by 2002:a92:5dd4:: with SMTP id e81mr959365ilg.288.1590629688029;
        Wed, 27 May 2020 18:34:48 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id d16sm2507512ilg.71.2020.05.27.18.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 18:34:47 -0700 (PDT)
Received: (nullmailer pid 3167518 invoked by uid 1000);
        Thu, 28 May 2020 01:34:44 -0000
Date:   Wed, 27 May 2020 19:34:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Rob Clark <robdclark@gmail.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Lontium vendor
 prefix
Message-ID: <20200528013444.GA3166896@bogus>
References: <20200513100533.42996-1-vkoul@kernel.org>
 <20200513100533.42996-2-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200513100533.42996-2-vkoul@kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 13 May 2020 15:35:31 +0530, Vinod Koul wrote:
> Add prefix for Lontium Semiconductor Corporation
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
