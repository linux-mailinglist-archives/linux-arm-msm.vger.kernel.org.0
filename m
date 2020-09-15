Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E70CE26AA6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 19:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgIORWS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 13:22:18 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39611 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727871AbgIORVb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 13:21:31 -0400
Received: by mail-qt1-f193.google.com with SMTP id h6so3778260qtd.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2020 10:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UjmOVn51US4ye5ub9FFJR5dw7eba8fmk19nqIQFg/Ps=;
        b=YpnhS1RvsGw7U+RHGn3SWdPsMPNF1mbAlnVGAr3t9XYpe4kTCemGWspqtYv5iFFJwN
         muFzBMSgKHQLCZavShn4yK38AQiyMHaiHWWE6JtQhyDxGiXLax9ZJkKj/OjMka1wrTqo
         awYIjXni4PCWsN+1tIjDrNtZuJPpJDlMNPJCjqzFVVvqntbw+7cQCasjI263G0uT7vMi
         gklJkv8EYU4shR08QhfJkTbEPx6lsNkJqFdFy95qSkhN9pDDCxgC5meZRDnO2hK41Nqp
         zjbSEcxIkgXDNGlO2tMMLUT6ul3DBkZRC2kg3jGIqM04Oy7ms/Mgo7XdwtzZtn5cu69i
         2ybQ==
X-Gm-Message-State: AOAM533sTz8rwggIVKBXHLZ09/oBVkouQgixNqOHPsS0b+Rh7GEBYaGM
        0fyy3udIzORiFH0QUwpvFtsqXE7TRz5O5ds=
X-Google-Smtp-Source: ABdhPJxxfh2vAvVlCQhrRap2W6x+iat3Ht+bngSXEAH4nORPd70SAjRVOx5rKBHvI6PMcuxpXlmvwg==
X-Received: by 2002:a02:6043:: with SMTP id d3mr18818985jaf.122.1600190087443;
        Tue, 15 Sep 2020 10:14:47 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z10sm7806877ioi.13.2020.09.15.10.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 10:14:46 -0700 (PDT)
Received: (nullmailer pid 2146621 invoked by uid 1000);
        Tue, 15 Sep 2020 17:14:44 -0000
Date:   Tue, 15 Sep 2020 11:14:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     David Airlie <airlied@linux.ie>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation
 for LT9611UXC
Message-ID: <20200915171444.GA2146589@bogus>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
 <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 09 Sep 2020 12:28:22 +0300, Dmitry Baryshkov wrote:
> Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output. The LT9611UXC chip is
> handled by a separate driver, but the bindings used are fully compatible
> with the LT9611 chip, so let's reuse the lt9611.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
