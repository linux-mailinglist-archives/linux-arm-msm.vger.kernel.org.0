Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 603C5790E0E
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Sep 2023 23:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348141AbjICVCf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Sep 2023 17:02:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234544AbjICVCe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Sep 2023 17:02:34 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA949103
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Sep 2023 14:02:30 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-d7830c5b20aso1139582276.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Sep 2023 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693774950; x=1694379750; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wyrVivbOL8H2+2oy0DBeynxfE8rpivKsaojvi9l90MQ=;
        b=p22sGb/i+SVGE9WanSm9rLz+/ozUiX0KBepGI1TwSXgw+RhLGpfaLNgZ8HrBsucKEI
         k0hT8LK2f0v1U7lgz3ONEmt/v3JApVoB5WQ7Pox0E6QQ7o48xo63zsX/jMhl0OkRbNPp
         2fwlEdYJlxifG91TuoJbBPGT6JyYAh1Gcyp+VqEGBOfmzvW2NhlkfWumZICd0LO0ooUg
         kX+xwV1YZABzjrMZChWeTfepQNaIwdKjulXIsfJDnQxDFMGJ/9fJBzorKWhihbJk5rIb
         C6+MKPX13hTsO3+hJ5t5F6Wuh0YXhTE42SrpeOplLHtZpoeCFwrEO28e+HYXRvSOszhE
         sRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693774950; x=1694379750;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wyrVivbOL8H2+2oy0DBeynxfE8rpivKsaojvi9l90MQ=;
        b=Hsb80VwzAJnvVU0St8rxkwqBty9jMSjT+j18Fuip0zO9Ig+2BHZRt4q0C8ZYiOZcQM
         4ZSPuSC4EV3nznB+V9gsT5NVIbPaSMBSdBpmte6MQu7fh6Canwuzc/pOfa1pJxIhxU8+
         K9mFcyivDz5G1qKqrTrxQyKT5Qh/hTnAwxcadVOhOolw37/7ftxFKgkfcqm/slWqWtQD
         A9vkETuEdQ7gBEIUs2q6xk35JUfMWn+pmyF28KXwDYjz08twAbpbjnOy+pRDMQ/T5axq
         X8dosNaPckVoWbBqUAi6C/jYru+rW8zpD9+mYXZm55SAuhLe2DUcdMG6pzRRMU8++mA8
         /uFA==
X-Gm-Message-State: AOJu0YzwEWdcdFOMCVVlKOBTwcsM2FmeWWIS031eeTJlqmXs2HUeQNIn
        HYpNYPVd0U1CoMBGC7xiLLC2ung4AIIq/z6xvFittA==
X-Google-Smtp-Source: AGHT+IEIksLV6i1JQnXxmFBaEbAx0vYPQzKu+YxnPk5mSfeHKOjrFxxCLATBwQ5f3mGZqO72LEeDFc4Kwock6sj7f10=
X-Received: by 2002:a25:d20e:0:b0:d74:6cb3:bb77 with SMTP id
 j14-20020a25d20e000000b00d746cb3bb77mr10416043ybg.28.1693774950042; Sun, 03
 Sep 2023 14:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230817145516.5924-1-dmitry.baryshkov@linaro.org> <20230822141735.GA14396@pendragon.ideasonboard.com>
In-Reply-To: <20230822141735.GA14396@pendragon.ideasonboard.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 4 Sep 2023 00:02:18 +0300
Message-ID: <CAA8EJpp_FYOKHziHOWF6E1RTkHEJ8oXXH90EDmJbLG1UDO1ofA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] drm: simplify support for transparent DRM bridges
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 22 Aug 2023 at 17:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dmitry,
>
> Thank you for the patches.
>
> On Thu, Aug 17, 2023 at 05:55:13PM +0300, Dmitry Baryshkov wrote:
> > Supporting DP/USB-C can result in a chain of several transparent
> > bridges (PHY, redrivers, mux, etc). This results in drivers having
> > similar boilerplate code for such bridges.
>
> What do you mean by transparent bridge here ? Bridges are a DRM concept,
> and as far as I can tell, a PHY isn't a bridge. Why does it need to be
> handled as one, especially if it's completely transparent ?
>
> > Next, these drivers are susceptible to -EPROBE_DEFER loops: the next
> > bridge can either be probed from the bridge->attach callback, when it is
> > too late to return -EPROBE_DEFER, or from the probe() callback, when the
> > next bridge might not yet be available, because it depends on the
> > resources provided by the probing device.
>
> Can't device links help avoiding defer probing in those cases ?

It looks like both Neil and I missed this question.

Two items wrt devlinks. First, I view them as a helper. So if one
disables the devlinks enforcement, he'd still get a deferral loop.

Second, in this case we can not enforce devlinks (or return
-EPROBE_DEFER from the probe() function) because the next bridge is
not yet available when the main driver probes. Unfortunately bridges
are allocated in the opposite order. So, using AUX devices helps us to
break it. Because first typec mux/retimer/switch/etc devices probe (in
the direction from the typec source to the typec port). Then DRM
bridge devices are probed starting from the end of the chain
(connector) to the DP source (root DP bridge/controller).

>
> > Last, but not least, this results in the the internal knowledge of DRM
> > subsystem slowly diffusing into other subsystems, like PHY or USB/TYPEC.
>
> Why so ? The PHY subsystem should provide a PHY, without considering
> what subsystem it will be used by. This patch series seems to me to
> actually create this DRM dependency in other subsystems, which I don't
> think is a very good idea. Resources should be registered in their own
> subsystem with the appropriate API, not in a way that is tied to a
> particular consumer.
>
> > To solve all these issues, define a separate DRM helper, which creates
> > separate aux device just for the bridge. During probe such aux device
> > doesn't result in the EPROBE_DEFER loops. Instead it allows the device
> > drivers to probe properly, according to the actual resource
> > dependencies. The bridge auxdevs are then probed when the next bridge
> > becomes available, sparing drivers from drm_bridge_attach() returning
> > -EPROBE_DEFER.
>
> I'm not thrilled :-( Let's discuss the questions above first.

Laurent, please excuse me for the ping. Any further response from your side?
I'd like to send the next iteration of this patchset.

> > Proposed merge strategy: immutable branch with the drm commit, which is
> > then merged into PHY and USB subsystems together with the corresponding
> > patch.


-- 
With best wishes
Dmitry
