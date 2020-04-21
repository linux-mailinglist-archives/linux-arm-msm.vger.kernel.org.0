Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4921B1E02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 07:11:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgDUFKd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 01:10:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725902AbgDUFKd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 01:10:33 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2D0CC061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:10:32 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id l25so4961219vso.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=paY1iS0XEZ77enyUCSAjc82NPQz1vfWi3ogs5RoLTF8=;
        b=cTY27kyZpzya/ce62x2DSXdivxksVD4ic99dmmaHrZAhFeLPacuvPUA7XTHalvr8xs
         f++kpfBsi0pzd7nkKr6rmRE0tbOihYyHCpqRejn3tKBVDvBqPyinzwDi5+TFD5KCGAlX
         LTKqc/x4oYbutmj1ygpL8EF+z+YXVnQTkiuRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=paY1iS0XEZ77enyUCSAjc82NPQz1vfWi3ogs5RoLTF8=;
        b=P4SVxTzZV4QiemPeiT7K71DdA/KR5CSmaCbEDZTxqhQ1cJEt6IJH8wuUrKxe07kioA
         oJHIcj8sYPSkXHR1AfFjY58//vUJKLYY+fkn+llmRJzZteuPqRnbnR5oINLtjy07nOV3
         XVCwssAOhYHwjOKOBwMrvWM50h+ka5iQspblrYDVGscsZyQtykKoHjLOGSezW/cC5IOe
         Pxql/1K/efiQndj0wryyt3lFOS9IjQEzyIiXM+MDInTyrN03KUsKbj4wQyuHpuLqLow+
         6madZvoDV9EDS8OzGqxwC3ox3AJg6PHaxMTnVGsdFgqNIm6teZZSm5qPsWGDqRKrf6Fe
         V7OA==
X-Gm-Message-State: AGi0PuZZ+WNKqeszpFBD2MTQGhe3EdBlbOYFb4uBolYWXZ9mUFfio0py
        mArjr4Y3LTdvXEzxiGAk/O4EYgIyX4Y=
X-Google-Smtp-Source: APiQypIY5SWVkernb0EkDn8EzClaYnV4XXp6WyJmzhjgzwuN7UT5r5dlgwtFrHMX58D35cR1oXznTQ==
X-Received: by 2002:a67:63c3:: with SMTP id x186mr13588045vsb.63.1587445830843;
        Mon, 20 Apr 2020 22:10:30 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id g130sm473825vke.15.2020.04.20.22.10.29
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Apr 2020 22:10:29 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id 1so7629915vsl.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 22:10:29 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr9130800vsq.109.1587445828879;
 Mon, 20 Apr 2020 22:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200415084758.1.Ifcdc4ecb12742a27862744ee1e8753cb95a38a7f@changeid>
 <20200415084758.2.Ic98f6622c60a1aa547ed85781f2c3b9d3e56b734@changeid>
 <158698038289.105027.2860892334897893887@swboyd.mtv.corp.google.com>
 <20200415203256.GP4758@pendragon.ideasonboard.com> <CAD=FV=U1U7y_U4+zySzA9e_uYE0ECdM1Bd-ew0OxG3ciqjRVSA@mail.gmail.com>
 <20200416005409.GR4758@pendragon.ideasonboard.com> <CAD=FV=WWZ1txHYOQZuCASbspLUP-Ds6OtrzetbJLHySpUyW6YQ@mail.gmail.com>
 <20200417180819.GE5861@pendragon.ideasonboard.com>
In-Reply-To: <20200417180819.GE5861@pendragon.ideasonboard.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 20 Apr 2020 22:10:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UpYALN6xrN5bpZTqqPLVUDB-MJ7BaQE28vrSRR3b+8MA@mail.gmail.com>
Message-ID: <CAD=FV=UpYALN6xrN5bpZTqqPLVUDB-MJ7BaQE28vrSRR3b+8MA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: drm/bridge: ti-sn65dsi86: Add hpd-gpios
 to the bindings
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sandeep Panda <spanda@codeaurora.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Apr 17, 2020 at 11:08 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> As for the hpd-gpios, it should be specified in the DT node of the
> component that provides the HPD signal, and contain a GPIO specifier
> describing what the signal is connected to. When dealing with a physical
> DP connector and external monitor, the HPD signal is provided by the DP
> connector, the hpd-gpios property shall then be specified in the DP
> connector DT node. The display-connector driver already handles that
> property. When dealing with an eDP panel, the HPD signal is provided by
> the panel, the hpd-gpios property shall be specified in the panel DT
> node.

OK, patch posted to add "hpd-gpios" to "panel-common.yaml" which is I
think the summary of what you're saying above.

I _think_ this also means that I need to add support to panel-simple.c
for it so I've posted got a patch for that.  If I followed your whole
description of the future plans it might eventually move somewhere
else but we're not there yet.  If I screwed this up hopefully it's OK
to continue the conversation in v2.  It seemed nice to have code to
talk about.


> As the SN65DSI86 has native HPD detect capability with a dedicated HPD
> input (note that this doesn't make the SN65DSI86 a providder of the HPD
> signal in the sense described above), the bridge driver, in the new
> model, shall implement the HPD-related operations and the .detect()
> operation. The drm_bridge_connector_init() helper will then delegate HPD
> and detection to the ti-sn65dsi86 driver.

I guess this assumes that anyone ever uses it.  Right now the driver
hardcodes HPD to be off and it seems hard for me to imagine anyone
would have a real use for the hardware line given the terrible
debouncing.  Maybe a panel whose hardcoded delay is super bad?


> The new drm_bridge model has support for this use case. It makes a
> difference between the intrinsic capability of a device to provide a
> feature (for instance the SN65DSI86 has the intrinsic capability to
> provide the HPD feature), and the fact that the feature is actually
> provided by that device on a particular system (in the case you describe
> here, the SN65DSI86 intrinsic HPD capability isn't used, as the HPD
> signal isn't connect to the SN65DSI86 HPD input). The former is reported
> by implementing the corresponding drm_bridge_funcs operations, the
> latter is reported by setting DRM_BRIGE_OP_* flags in drm_bridge.ops.
> This mechanism allows bridge drivers to unconditionally set function
> pointers in their drm_bridge_funcs structure (allowing the structure to
> make stored in read-only memory), while exposing, for each device
> instance, whether the feature is actually provided or not.
>
> The drm_bridge_connector_init() helper, to delegate drm_connector
> operations to bridges, will look for the first bridge in the chain,
> starting at the output of the pipeline (connector or panel), that
> supports the corresponding feature. If your DP connector DT node, or
> your eDP connector DT node, specifies that the HPD signal is routed to a
> GPIO (through the hpd-gpios property), then the corresponding bridge
> driver shall reprot the DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD
> capabilities. The display-connector driver already supports this, the
> panel bridge driver doesn't and needs to be extended. The
> drm_bridge_connector_init() helper will then detect that the drm_bridge
> for the DP connector or eDP panel supports HPD, and will delegate the
> related drm_connector operations to that bridge. If the HPD signal is
> routed to the HPD pin of the SN65DSI86, the DP connector or eDP panel DT
> node should not contain an hpd-gpios property, the corresponding
> drm_bridge will not set DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD, and
> the drm_bridge_connector_init() will look at the next component in the
> next bridge in the chain, which will be the ti-sn65dsi86. That bridge
> will report support for the HPD-related operations, and will be used.
>
> To be fully correct the ti-sn65dsi86 shouldn't set the
> DRM_BRIDGE_OP_DETECT and DRM_BRIDGE_OP_HPD flags when the HPD signal
> isn't routed to its HPD input pin. As it should not peek into the DT
> node of the DP connector or eDP panel for its output, it should have an
> additional no-hpd DT property in this case. In practice that's may not
> always be required, as if an hpd-gpios property is specified in the DP
> connector or eDP panel DT node, the drm_bridge_connector_init() will not
> look further, but for the case where the HPD signal isn't routed
> anywhere, we need to make sure that the ti-sn65dsi86 driver will not
> incorrectly advertise HPD support.

Sounds like you've thought out a lot of the corner cases!

Right now the 'ti-sn65dsi86' driver is hardcoded not to look at HPD
but its bindings doesn't have the 'no-hpd' property.  Sounds like that
should be OK-ish as long as the panel either has "hpd-gpios" or
"no-hpd" because then nobody will actually query the bridge.  ...but
it would be cleaner to add it.


> > 5. The GPIOs on 'ti,sn65dsi86' cannot generate IRQs and can only be
> > polled.  ...but this is OK.  I'm specifically trying to support the
> > case of a panel that is always connected and I just want HPD to be the
> > signal that the panel is ready for me to talk to it.  Polling is fine.
> > Specifically the bridge driver doesn't try to poll HPD to decide if we
> > have something connected--it always returns
> > 'connector_status_connected'.  ...and this is the correct behavior for
> > eDP because you know the hardware is always there and HPD won't even
> > be asserted until you start to power up the panel.
>
> If you look at bridge/display-connector.c, you will see that it reports
> DRM_BRIDGE_OP_DETECT if there's an hpd-gpios property, and additionally
> reports DRM_BRIDGE_OP_HPD if that GPIO has interrupt capability. If a
> bridge in the pipeline reports DRM_BRIDGE_OP_DETECT but no bridge
> reports DRM_BRIDGE_OP_HPD, drm_bridge_connector_init() creates a
> connector that uses polling. This is another reason why a no-hpd
> property is needed for the ti,sn65dsi86, as otherwise the helper would
> incorrectly consider that the SN65DSI86 will report HPD through an
> interrupt.

Hrm.  I guess technically it breaks bindings compatibility that
"no-hpd" wasn't there before but there's something that will break if
we don't specify it.  ...but it won't break anything until someone
actually tries to add DRM_BRIDGE_OP_HPD to ti-sn65dsi86.  Maybe we're
OK as long as we fix it before then?

I've put this in v2 so we can discuss.


> > 6. My current implementation in patch #3 actually doesn't fully
> > implement a Linux GPIO provider in the bridge driver.  See that patch
> > for justification.  While I could do the work to do this and I'll do
> > it if folks insist, I think the current simpler code is nice.  If
> > there was a separate "edp-connector" driver then presumably I'd have
> > to add the complexity of implementing the GPIO provider API.
>
> This is the only reason why I don't like asking you to change your
> implementation, due to the additional complexity required to expose a
> GPIO provider. However, I think that the new bridge usage model is much
> cleaner than the current one, and this justifies in my opinion
> additional complexity in a small number of places, even if it's
> unfortunate. That being said, if we can put the DT properties where they
> belong for the new model with isolated bridge drivers to only handle the
> features of the hardware they correspond to, I wouldn't be opposed to a
> localized hack (without any derogatory meaning implied) on the driver
> side to ease the implementation. I'm willing to look at you at how this
> could be done, once we complete this discussion about the new model,
> with the hard rule that DT bindings should be designed based on the new
> model.

OK, I managed to implement the GPIO controller.  Let's see how it
looks.  I threw GPIO folks on the series too so hopefully they can
tell me if I'm doing something stupid.


-Doug
