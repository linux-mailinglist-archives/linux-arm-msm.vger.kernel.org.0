Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEBD9F007
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 18:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730017AbfH0QUz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 12:20:55 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:42554 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfH0QUz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 12:20:55 -0400
Received: by mail-oi1-f195.google.com with SMTP id o6so15395156oic.9;
        Tue, 27 Aug 2019 09:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/+2YwB8+Xi4YT6vhao9F9CgIDSvyioAXjISKvURBpVM=;
        b=uUGbCQb1GWun6skhhGun3lOYHjx+zqCQLiuPiA5Q0Qv0nyORzHvmmt1S2HO0MZoNyF
         IuzWGW+sYdkOtjH4EGVglWcp5V1vbb6WlTMCvPKs9xs/BMuWZ2LiklB5Muyf0QW8saV4
         f44IT1aZo+r5rA9XE8C74Dz9ZRH46km7L/FbLU+NZT7TVokI6wwSC8j/M5MAN0KxV0jb
         qZxOvNge0Ht8Izsmp8jH7FQVml/zb4cdaEoa0Im9XTJewHrUlNzk76U3uhthrs2JrIpc
         s9lY7uXjR96pmkyX9vGRpvBzeJhdyDZql7zu4Eee5jpZ0dmSzRwhWbEyG53x2VerjuCC
         ChQg==
X-Gm-Message-State: APjAAAVWfP9nRA2qhZViU4pcl9oPm6XKYXuQmnwWV4IcuLZWN++vZOzT
        +/SimWQf6a+G9up8pIaOMw==
X-Google-Smtp-Source: APXvYqwVWvlJHLSHxm3WNh8/kzbvwC8YMUkeCo9ZURCfgjbx93rsP4tPShUQbsFtmuJHppSVq6yE2g==
X-Received: by 2002:aca:d650:: with SMTP id n77mr17486575oig.129.1566922854444;
        Tue, 27 Aug 2019 09:20:54 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 20sm5759937otd.71.2019.08.27.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:20:53 -0700 (PDT)
Date:   Tue, 27 Aug 2019 11:20:53 -0500
From:   Rob Herring <robh@kernel.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, agross@kernel.org,
        a.hajda@samsung.com, narmstrong@baylibre.com, robdclark@gmail.com,
        sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
        mark.rutland@arm.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@siol.net, linus.walleij@linaro.org,
        enric.balletbo@collabora.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 01/11] dt-bindings: drm/bridge: analogix-anx78xx: add new
 variants
Message-ID: <20190827162053.GA12094@bogus>
References: <20190815004854.19860-1-masneyb@onstation.org>
 <20190815004854.19860-2-masneyb@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190815004854.19860-2-masneyb@onstation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 14 Aug 2019 20:48:44 -0400, Brian Masney wrote:
> Add support for the analogix,anx7808, analogix,anx7812, and
> analogix,anx7818 variants.
> 
> Signed-off-by: Brian Masney <masneyb@onstation.org>
> ---
>  .../devicetree/bindings/display/bridge/anx7814.txt          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
