Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2900139924F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 20:16:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhFBSSX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 14:18:23 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:37509 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229467AbhFBSSX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 14:18:23 -0400
Received: by mail-ot1-f42.google.com with SMTP id v19-20020a0568301413b0290304f00e3d88so3279274otp.4;
        Wed, 02 Jun 2021 11:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGs3ySUz+5yWOPGnnKcSs4d7r1g1klxeD4AjriZfMMk=;
        b=Tr81xTfmb1HafzhrqT+YQzEngE/wBfTSh5/aGZ2m/YWSXq2KOy9IHn/OnaIGOkrxgq
         bwwxhRnzS9yiEN4aibdlomUjUzfRFO9QUbJ2HVD640ZY3LzeFif3P+9DVS746eJmnP5C
         AbkSuKTLyCBXT4sOaStlZVPUMSbuF3h4ZSeQcvCQATJoA3Xs5qMnrQSRYGEM6Tb4kMc1
         AAjpqtda8AuaDiy1jhE4+RhVWz6PVOfxP8RgZCcY4u8l2qHGW65AthPfmRgwq6HRHRJ9
         /GzZ7Djtvtr9mk+QbWCHRNVOjM5+Zgu+SvaJc04ehPBXTxxEQiGZ1Cn0wWpeTaSHh+pM
         H1zg==
X-Gm-Message-State: AOAM531vxGmXB+dhey5lGxMPigoLQLWmIEYcJmNLkVNlQyX3/No++5Cv
        vCEnIeu9q9wbf9henCl5xg==
X-Google-Smtp-Source: ABdhPJy6S/YWhSYolU2l1/6RinXushQyOPCztVxygHdQZ9YEIyxTE/T30sxKhvx+av2QZ1DrkGThfQ==
X-Received: by 2002:a9d:729d:: with SMTP id t29mr5989930otj.256.1622657784498;
        Wed, 02 Jun 2021 11:16:24 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m66sm138702oia.28.2021.06.02.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 11:16:23 -0700 (PDT)
Received: (nullmailer pid 3703237 invoked by uid 1000);
        Wed, 02 Jun 2021 18:16:21 -0000
Date:   Wed, 2 Jun 2021 13:16:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>, linux-arm-msm@vger.kernel.org,
        Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
Message-ID: <20210602181621.GB3692772@robh.at.kernel.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, May 24, 2021 at 05:01:52PM -0700, Douglas Anderson wrote:
> Now that we have an eDP controller that lists aux-bus, we can safely
> add an example to the aux-bus bindings.
> 
> NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
> one. It feels useful to have the example in both places simply because
> it's important to document the interaction between the two bindings in
> both places.

Don't forget the 3rd copy that exists in some .dts file most likely. 
That's 3 places to fix when we improve or add some schema.

I've generally been trying to de-duplicate examples...

Rob
