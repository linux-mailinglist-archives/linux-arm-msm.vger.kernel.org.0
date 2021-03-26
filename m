Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 884E9349D75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 01:09:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230221AbhCZAJX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 20:09:23 -0400
Received: from mail-il1-f174.google.com ([209.85.166.174]:41498 "EHLO
        mail-il1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229854AbhCZAJM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 20:09:12 -0400
Received: by mail-il1-f174.google.com with SMTP id r8so3646357ilo.8;
        Thu, 25 Mar 2021 17:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a11hWINvZadDTUc1x1p5mvJKc6CEu6ZdeGypWrdKiFU=;
        b=tzGOkg2CaGCTcKWWsaoRRj9XUFHwBfgkDL6O51xSFlzcdW9KykGUdslmKGswt+9wxu
         Q9Kmz5dCug1mW0OjYI6AM1ayJu4ivbjDj+WGyAjR7xPzgwROMxJ182LtotuPfEa+ccn2
         APJys/lIzUGe49uIZdxV21ard3ZI52icYqK3QyH2JHqsAE0QXO8jFJvDC6ivc0XogYXn
         omiZxrtri25o/AE/pif+cxnC8G1TEcR2figZsoS5a7WuAxA0uTq6llStnEhOYEeLM5jO
         7t5Dskzh2owOiz94mtmK0WzH26jQ/qJjgnSAc/fjY1uEtFoQRnxDMA6BhX8blxnVSvja
         L26w==
X-Gm-Message-State: AOAM532UYVPSq9n3CRt3n6c9FcL9nI8gcm4rqWf4aYLSDpRMvxifZg8p
        k5YjJVZtHyWJqV2waRxdbA==
X-Google-Smtp-Source: ABdhPJzpAml0C5TSFU9R4CKJ+PFO/N5I4vdC0tlV9SBzBs50molUg1khoXURpZiOCFbTEj49M4Tgow==
X-Received: by 2002:a92:c545:: with SMTP id a5mr7599351ilj.209.1616717351425;
        Thu, 25 Mar 2021 17:09:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id f13sm3377606ila.51.2021.03.25.17.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 17:09:09 -0700 (PDT)
Received: (nullmailer pid 2001388 invoked by uid 1000);
        Fri, 26 Mar 2021 00:09:07 -0000
Date:   Thu, 25 Mar 2021 18:09:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, robdclark@chromium.org,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, swboyd@chromium.org,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>,
        eballetbo@gmail.com, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        drinkcat@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
Message-ID: <20210326000907.GA1965415@robh.at.kernel.org>
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> The sc7180-trogdor-pompom board might be attached to any number of a
> pile of eDP panels. At the moment I'm told that the list might include:
> - KD KD116N21-30NV-A010
> - KD KD116N09-30NH-A016
> - Starry 2081116HHD028001-51D
> - Sharp LQ116M1JW10
> 
> It should be noted that while the EDID programmed in the first 3
> panels indicates that they should run with exactly the same timing (to
> keep things simple), the 4th panel not only needs different timing but
> has a different resolution.
> 
> As is true in general with eDP panels, we can figure out which panel
> we have and all the info needed to drive its pixel clock by reading
> the EDID. However, we can do this only after we've powered the panel
> on. Powering on the panels requires following the timing diagram in
> each panel's datasheet which specifies delays between certain
> actions. This means that, while we can be quite dynamic about handling
> things we can't just totally skip out on describing the panel like we
> could do if it was connected to an external-facing DP port.

Is this a 'standard' eDP connector? AFAICT, there does seem to be 
such a thing. I've said in the past I'd be okay with a edp-connector 
node. If that needs just the "HPD absent delay" property, I think that 
would be okay. It's just a never ending stream of new properties with 
each new panel that I don't want to see.

Rob
