Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD7FF40B8ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 22:21:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhINUWu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Sep 2021 16:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233749AbhINUWt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Sep 2021 16:22:49 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080F4C061574
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:21:32 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id f6so470855iox.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=opbU04o7Av2seByLDm+85tUZqupNHweB2QHyYQl46u0=;
        b=Cg4NzZFqSaeWh4iwIopzkDRdf9YkC4YU7w7K6lGW+bGKsuACZacPGqTiw32dbnvhK9
         xKTisVlvzsBA9DGgELL0LAVERYePLiDfLtDhTF6kMZZh9bTierktXrVkazV0+fd34DWy
         +kSKoNkXw7p2UWJVuUyM2SnhvGt0usal+Z5KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=opbU04o7Av2seByLDm+85tUZqupNHweB2QHyYQl46u0=;
        b=xdSOzsvWhVfmcksofTp1jWLf72uwFFS0Akonh5pdX/tATccVXyovyChUJbNkFtDfF5
         aaz306Fk3ZVLhiATcnJ0w6F64z2S6NeLVuOlxwDMyCUDlTDejzL48wGtWTUYWWoMLllR
         7MZM3EF1om6n9hrw0bgAdfZ+YhPlc8AcG3+A1gDLVe3RsCQliagYbGqPZMHB3ebCajxd
         rWD37AreOSEwj2m4+6k5Np66JVUnidylWmppfNpOcuwLlhj4ATDIAX5KYUBgdYeRtjeI
         IO//y1EPHoHxNGg7mvrnnE++HQPfVrsLxGYUPx571q5PtF2gFPEidgCjwjlsKFTvqQlI
         oJMg==
X-Gm-Message-State: AOAM531RJq4s/rZnibhkI2Ifym9YKhfQ1VSaK1qN94pL44F5xgSc4Bqf
        arCz1H3Q9hfyRxbc3cuDRz/WjoIHlpoDqg==
X-Google-Smtp-Source: ABdhPJzkfm3W0hZDBQV2rWQ1/zdLns1lifL/F7kpw3tV5ICMrK5hQ+R5F0k3jYtogYNTuilHEtmfFQ==
X-Received: by 2002:a05:6638:1403:: with SMTP id k3mr7346451jad.102.1631650891421;
        Tue, 14 Sep 2021 13:21:31 -0700 (PDT)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com. [209.85.166.174])
        by smtp.gmail.com with ESMTPSA id r16sm7507432ile.66.2021.09.14.13.21.31
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Sep 2021 13:21:31 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id i13so434600ilm.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Sep 2021 13:21:31 -0700 (PDT)
X-Received: by 2002:a05:6e02:214e:: with SMTP id d14mr12547218ilv.142.1631650416432;
 Tue, 14 Sep 2021 13:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210909210032.465570-1-dianders@chromium.org>
 <20210909135838.v4.1.I1116e79d34035338a45c1fc7cdd14a097909c8e0@changeid> <CAE-0n53Pp1F5dZRk98WT5+K9jz_XpMkKUvYAs_suZFaOE0K39w@mail.gmail.com>
In-Reply-To: <CAE-0n53Pp1F5dZRk98WT5+K9jz_XpMkKUvYAs_suZFaOE0K39w@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 14 Sep 2021 13:13:25 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uc77p-BifFvr=GkWVbP=KKb-eHNtvnOKQJ5D86ogi8hA@mail.gmail.com>
Message-ID: <CAD=FV=Uc77p-BifFvr=GkWVbP=KKb-eHNtvnOKQJ5D86ogi8hA@mail.gmail.com>
Subject: Re: [PATCH v4 01/15] dt-bindings: drm/panel-simple-edp: Introduce
 generic eDP panels
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Linus W <linus.walleij@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Sep 14, 2021 at 12:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2021-09-09 14:00:17)
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-edp.yaml b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> > new file mode 100644
> > index 000000000000..6a621376ff86
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-edp.yaml
> > @@ -0,0 +1,188 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Probable (via DP AUX / EDID) eDP Panels with simple poweron sequences
>
> Should that be "Probeable" or "Probe-able" or "Detectable"? It's not
> about statistical probabilities right?

Thanks for the catch! Will be fixed in v5.

-Doug
