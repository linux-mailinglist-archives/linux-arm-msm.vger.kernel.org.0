Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C299B7A0168
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Sep 2023 12:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237985AbjINKQj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Sep 2023 06:16:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237316AbjINKQi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Sep 2023 06:16:38 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 416571BE9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 03:16:34 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-ccc462deca6so780754276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Sep 2023 03:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694686593; x=1695291393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UwFJFBDWimEJHLZ/8UegfqhZvxXwk7rKNFnsKIIEyuU=;
        b=mcn1OksSsLH683dKHjPKvInZa2ytN72DhKqdtAorhi/lodBDjwQ15OIICib0BnM17x
         KGm+ombB3j2z0ewJngkkuaKbB9AOI1nmgybAl8MWjvqyc3+xvH+Nmr26kR1n/LPpIN5O
         zGm9hLRIFmUasJ6d3NsxTNsuxxOQK1ZIJndyYttSvflJN1+5RZ4E0WD6uNRcdFclh+em
         Sy4BX/TCGE5rM7woTfumKzg+PEQwODgPmV6VnC6e/fSsu4gXvsAGsMmJgdeSCuNNdWuF
         LUDBi7R+/nfXUINaFbQhoTyWOsNd3LXmTkGIQGCAkO0+4LET3I07GdAHp59X/eYCYwwp
         /3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694686593; x=1695291393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UwFJFBDWimEJHLZ/8UegfqhZvxXwk7rKNFnsKIIEyuU=;
        b=U+lQ+OPbUj0NPlx38OVZRwasZ6Ghm5lECs9AipIi1SfODGDNBsZZG3LGfuzCestS+T
         ygV2fIFqo+RaNGUhGaYcHMla8DkbKGa1XdQPLSfQ7BuDqKLVrwB4eM1dwvUXgQ7ygp5i
         oeF8JGtVg0jZFC20FOoFQWNFJHQIEDlmSnzD6wEUxCnX2o2l7eXrZPur1owXZsi4JgAk
         6faLXDYJWu9hSlsxiWu/DvpYD7iOhYNkuT8a0larkv0p8dD2m/6fa6nyxHpMgZh42432
         K9M+5abrka7oyFpFIL6K/Mw0UZDkb59S9fNNl7iDLgctf4rE3zItwbMR4TdXoc2cQ/n/
         QDLQ==
X-Gm-Message-State: AOJu0YwetQPER0Ll1R00RvHt/cYRF2fsXtm+jDEBSM/r/elaG0eqvOYB
        h0xyBS3jzkffrQ/+CNhq70iOs2ma438MET4n9N1JnQ==
X-Google-Smtp-Source: AGHT+IGtLUw6RReUJSsiO4WaaqntbAWdkJ8QN71j6/m0jmryUDXsZ/GYWnMqFYlMfhqyxdMh4FpbxgvyOarqoZ0k7Sw=
X-Received: by 2002:a25:8e89:0:b0:d80:fa9:38dc with SMTP id
 q9-20020a258e89000000b00d800fa938dcmr4698902ybl.65.1694686593291; Thu, 14 Sep
 2023 03:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <ZPh0Ps9UJ3HLzdeR@kuha.fi.intel.com> <CAA8EJpratbBybgk8woD3maA=J_HuQis44Unq0n+c_UvaFs__AA@mail.gmail.com>
 <ZPiAwOf00RREiYPr@kuha.fi.intel.com> <6b6bacee-f7b6-4cfe-be3d-24bda44bfbcf@linaro.org>
 <ZQBGD8CY5OVKYX63@kuha.fi.intel.com> <a97a33f4-71f3-4610-a59e-0c2d5ae86670@linaro.org>
 <ZQGAfnKt9HMB7j6H@kuha.fi.intel.com> <CAA8EJpqaipCT66x698R6dKDTSMk-D2iNHv8NSnMzPy-X_jFJ1Q@mail.gmail.com>
 <ZQG1zMbjWNLtx8lk@kuha.fi.intel.com> <CAA8EJprSH1jTa74c2P91SEC84eM8w=ACC4o2xM8t9eShvC9UeQ@mail.gmail.com>
 <ZQLRuNkNBghjKRca@kuha.fi.intel.com> <26e47780-d32d-42db-8fa7-71fed472ca29@linaro.org>
In-Reply-To: <26e47780-d32d-42db-8fa7-71fed472ca29@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 14 Sep 2023 13:16:21 +0300
Message-ID: <CAA8EJppqAe3HgZ4+G=SFNAhxXAFQKLHseDa2JneRYjaMnwvWaA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
To:     neil.armstrong@linaro.org
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        freedreno@lists.freedesktop.org, Won Chung <wonchung@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 14 Sept 2023 at 12:35, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 14/09/2023 11:26, Heikki Krogerus wrote:
> > Hi Dmitry,
> >
> > On Wed, Sep 13, 2023 at 04:47:12PM +0300, Dmitry Baryshkov wrote:
> >> On Wed, 13 Sept 2023 at 16:15, Heikki Krogerus
> >> <heikki.krogerus@linux.intel.com> wrote:
> >>>
> >>> On Wed, Sep 13, 2023 at 01:26:14PM +0300, Dmitry Baryshkov wrote:
> >>>> Hi Heikki,
> >>>>
> >>>> On Wed, 13 Sept 2023 at 12:27, Heikki Krogerus
> >>>> <heikki.krogerus@linux.intel.com> wrote:
> >>>>> On Tue, Sep 12, 2023 at 08:39:45PM +0300, Dmitry Baryshkov wrote:
> >>>>>> On 12/09/2023 14:05, Heikki Krogerus wrote:
> >>>>>>> On Tue, Sep 12, 2023 at 12:15:10AM +0300, Dmitry Baryshkov wrote:
> >>>>>>>> On 06/09/2023 16:38, Heikki Krogerus wrote:
> >>>>>>>>> On Wed, Sep 06, 2023 at 03:48:35PM +0300, Dmitry Baryshkov wrote:
> >>>>>>>>>> On Wed, 6 Sept 2023 at 15:44, Heikki Krogerus
> >>>>>>>>>> <heikki.krogerus@linux.intel.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On Tue, Sep 05, 2023 at 01:56:59PM +0300, Dmitry Baryshkov wrote:
> >>>>>>>>>>>> Hi Heikki,
> >>>>>>>>>>>>
> >>>>>>>>>>>> On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
> >>>>>>>>>>>> <heikki.krogerus@linux.intel.com> wrote:
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> Hi Dmitry,
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> >>>>>>>>>>>>>> The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> >>>>>>>>>>>>>> dev_fwnode() checks never succeed, making the respective commit NOP.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> That's not true. The dev->fwnode is assigned when the device is
> >>>>>>>>>>>>> created on ACPI platforms automatically. If the drm_connector fwnode
> >>>>>>>>>>>>> member is assigned before the device is registered, then that fwnode
> >>>>>>>>>>>>> is assigned also to the device - see drm_connector_acpi_find_companion().
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> But please note that even if drm_connector does not have anything in
> >>>>>>>>>>>>> its fwnode member, the device may still be assigned fwnode, just based
> >>>>>>>>>>>>> on some other logic (maybe in drivers/acpi/acpi_video.c?).
> >>>>>>>>>>>>>
> >>>>>>>>>>>>>> And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> >>>>>>>>>>>>>> breaks drivers already using components (as it was pointed at [1]),
> >>>>>>>>>>>>>> resulting in a deadlock. Lockdep trace is provided below.
> >>>>>>>>>>>>>>
> >>>>>>>>>>>>>> Granted these two issues, it seems impractical to fix this commit in any
> >>>>>>>>>>>>>> sane way. Revert it instead.
> >>>>>>>>>>>>>
> >>>>>>>>>>>>> I think there is already user space stuff that relies on these links,
> >>>>>>>>>>>>> so I'm not sure you can just remove them like that. If the component
> >>>>>>>>>>>>> framework is not the correct tool here, then I think you need to
> >>>>>>>>>>>>> suggest some other way of creating them.
> >>>>>>>>>>>>
> >>>>>>>>>>>> The issue (that was pointed out during review) is that having a
> >>>>>>>>>>>> component code in the framework code can lead to lockups. With the
> >>>>>>>>>>>> patch #2 in place (which is the only logical way to set kdev->fwnode
> >>>>>>>>>>>> for non-ACPI systems) probing of drivers which use components and set
> >>>>>>>>>>>> drm_connector::fwnode breaks immediately.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Can we move the component part to the respective drivers? With the
> >>>>>>>>>>>> patch 2 in place, connector->fwnode will be copied to the created
> >>>>>>>>>>>> kdev's fwnode pointer.
> >>>>>>>>>>>>
> >>>>>>>>>>>> Another option might be to make this drm_sysfs component registration optional.
> >>>>>>>>>>>
> >>>>>>>>>>> You don't need to use the component framework at all if there is
> >>>>>>>>>>> a better way of determining the connection between the DP and its
> >>>>>>>>>>> Type-C connector (I'm assuming that that's what this series is about).
> >>>>>>>>>>> You just need the symlinks, not the component.
> >>>>>>>>>>
> >>>>>>>>>> The problem is that right now this component registration has become
> >>>>>>>>>> mandatory. And if I set the kdev->fwnode manually (like in the patch
> >>>>>>>>>> 2), the kernel hangs inside the component code.
> >>>>>>>>>> That's why I proposed to move the components to the place where they
> >>>>>>>>>> are really necessary, e.g. i915 and amd drivers.
> >>>>>>>>>
> >>>>>>>>> So why can't we replace the component with the method you are
> >>>>>>>>> proposing in this series of finding out the Type-C port also with
> >>>>>>>>> i915, AMD, or whatever driver and platform (that's the only thing that
> >>>>>>>>> component is used for)?
> >>>>>>>>
> >>>>>>>> The drm/msm driver uses drm_bridge for the pipeline (including the last DP
> >>>>>>>> entry) and the drm_bridge_connector to create the connector. I think that
> >>>>>>>> enabling i915 and AMD drivers to use drm_bridge fells out of scope for this
> >>>>>>>> series.
> >>>>>>>>
> >>>>>>>>
> >>>>>>>>> Determining the connection between a DP and its Type-C connector is
> >>>>>>>>> starting to get really important, so ideally we have a common solution
> >>>>>>>>> for that.
> >>>>>>>>
> >>>>>>>> Yes. This is what we have been discussing with Simon for quite some time on
> >>>>>>>> #dri-devel.
> >>>>>>>>
> >>>>>>>> Unfortunately I think the solution that got merged was pretty much hastened
> >>>>>>>> in instead of being well-thought. For example, it is also not always
> >>>>>>>> possible to provide the drm_connector / typec_connector links (as you can
> >>>>>>>> see from the patch7. Sometimes we can only express that this is a Type-C DP
> >>>>>>>> connector, but we can not easily point it to the particular USB-C port.
> >>>>>>>>
> >>>>>>>> So, I'm not sure, how can we proceed here. Currently merged patch breaks
> >>>>>>>> drm/msm if we even try to use it by setting kdef->fwnode to
> >>>>>>>> drm_connector->fwnode. The pointed out `drivers/usb/typec/port-mapper.c` is
> >>>>>>>> an ACPI-only thing, which is not expected to work in a non-ACPI cases.
> >>>>>>>
> >>>>>>> You really have to always supply not only the Type-C ports and partners,
> >>>>>>> but also the alt modes. You need them, firstly to keep things sane
> >>>>>>> inside kernel, but more importantly, so they are always exposed to the
> >>>>>>> user space, AND, always the same way. We have ABIs for all this stuff,
> >>>>>>> including the DP alt mode. Use them. No shortcuts.
> >>>>>>>
> >>>>>>> So here's what you need to do. UCSI does not seem to bring you
> >>>>>>> anything useful, so just disable it for now. You don't need it. Your
> >>>>>>> port driver is clearly drivers/soc/qcom/pmic_glink_altmode.c, so
> >>>>>>> that's where you need to register all these components - the ports,
> >>>>>>> partners and alt modes. You have all the needed information there.
> >>>>>>
> >>>>>> To make things even more complicate, UCSI is necessary for the USB part of
> >>>>>> the story. It handles vbus and direction.
> >>>>>>
> >>>>>>> Only after you've done that we can start to look at how should the
> >>>>>>> connection between the DPs and their USB Type-C connectors be handled.
> >>>>>>
> >>>>>> But sure enough, I can add typec port registration to the altmode driver.
> >>>>>> This will solve the 'port not existing' part of the story.
> >>>>>>
> >>>>>> I'd like to hear your opinion on:
> >>>>>>
> >>>>>> - components. Using them breaks drm/msm. How can we proceed?
> >>>>>
> >>>>> I don't think replacing the components is going to be a problem once
> >>>>> you have described everything properly in you DT. I'm fairly certain now
> >>>>> that that is the main problem here. You don't have this connection
> >>>>> described in your DT as it should.
> >>>>
> >>>> We have. See https://lore.kernel.org/linux-arm-msm/20230817145940.9887-1-dmitry.baryshkov@linaro.org/
> >>>> (for non-PMIC-GLINK platform)
> >>>> Or arch/arm64/boot/dts/qcom/sm8350-hdk.dts, which already has a full
> >>>> description of USB-C connector and signal flow.
> >>>>
> >>>> In fact, thanks to this representation I can properly set
> >>>> 'connector->fwnode' to point to the OF node corresponding to the
> >>>> connector's drm_bridge. I can even propagate it to the kdef->fwnode /
> >>>> kdev->of_node in drm_sysfs_connector_add(). But then a component_add()
> >>>> call looks the kernel up.
> >>>>
> >>>> And to add on top of that, here is another reason why I think that
> >>>> this sysfs links ABI/implementation was not well thought. The
> >>>> typec_connector_ops are added to all fwnode-enabled connector devices.
> >>>> It doesn't even bother checking that the device is really the DP
> >>>> connector and that the device on the other side of fwnode link is a
> >>>> typec port device. The symlink is named 'typec_connector', so one can
> >>>> not easily extend this ABI to support SlimPort aka MyDP (which uses
> >>>> micro-USB-B connectors instead of USB-C). Neither can we extend it to
> >>>> represent MHL connections (again, micro-USB-B).
> >>>>
> >>>>>> - PATH property usage. This way we make USB-C DisplayPort behave like the
> >>>>>> MST ports.
> >>>>>
> >>>>> That looks to me like an attempt to exploit a feature that is not
> >>>>> designed for this purposes at all. Just drop all that.
> >>>>
> >>>> But why? From the docs: 'Connector path property to identify how this
> >>>> sink is physically connected.'
> >>>>
> >>>> So far we have been using it for MST only. But the description above
> >>>> also suits properly for the 'connected to the Type-C port0 device'
> >>>> kind of data. Then the userspace can use this property to change the
> >>>> representation of the controller. Or to rename it as it does for
> >>>> DP-MST connectors. Or just add the USB-C icon in the UI.
> >>>>
> >>>> Having this data in sysfs only requires userspace first to map the
> >>>> connector to the device under sysfs (which is not trivial since Xorg
> >>>> renames DP-MST connectors), then to look for the symlink value. Quite
> >>>> complicated compared to checking the DRM property.
> >>>>
> >>>> Moreover, once we get to the SlimPort / MyDP / MHL, we can extend the
> >>>> schema to support 'microusb:something' values for this property.
> >>>>
> >>>>> The connection has to be first described in your DT, and the way you
> >>>>> usually describe connections in DT is by using the device graph (OF
> >>>>> graph). It seems that you have everything needed for that - the USB
> >>>>> Type-C connectors have their own OF nodes (what you register as
> >>>>> drm_bridges are in fact USB Type-C connectors), and presumable you
> >>>>> also have OF nodes for all your video ports (DisplayPorts) - so
> >>>>> applying the graph between the two really should not be a problem. The
> >>>>> DP is endpoint for the USB Type-C connector, and vice versa.
> >>>>
> >>>> Not quite. There is no direct connection between the USB Type-C
> >>>> connector and DP controller. The USB-C connector has three ports.
> >>>>
> >>>> port@0 goes to theHS-USB controller. This is simple.
> >>>>
> >>>> port@1 goes to the USB+DP PHY. All retimers and SS line muxes are
> >>>> included in between. And it is the USB+DP PHY that is connected to the
> >>>> DP and USB-SS controllers.
> >>>>
> >>>> port@2 goes to SBU lines mux (e.g. fsa4480).
> >>>>
> >>>>> After you have everything needed in your DT, the problem here isn't
> >>>>> actually much of a problem at all. We will have options how to move
> >>>>> forward after that.
> >>>>
> >>>> Could you please describe what is missing there?
> >>>
> >>> We are not after the direct connections here, we are after the final
> >>> endpoints. So you are missing description of the logical connection
> >>> between your DP and Type-C connector.
> >>
> >> Adding Krzysztof, as one of DT maintainers, to the CC list.
> >>
> >> >From what I understand, DT describes hardware. There is no description
> >> for the 'logical' connections.
> >>
> >>>
> >>> I understand that the idea is to build the graph to describe only the
> >>> physical connections, but with just the physical connections you are
> >>> doomed to write separate software solution for almost every single
> >>> platform, even though the final endpoints are always the same (DP to
> >>> Type-C). You just can not generalise the components (muxes, phys,
> >>> retimers, etc.) behind USB Type-C connectors (or anything else for
> >>> that matter), it's not possible. The components and their order vary
> >>> on almost every single platform. On some platforms the stack of parts
> >>> after the connector is also incredibly complex.
> >>
> >> Yes. And this is why we have a chain of DRM bridges, going from the DP
> >> controller to the final drm_bridge at the Type-C port manager. When
> >> there is the altmode event, it gets sent via this chain using the
> >> normal DRM HPD event.
> >
> > We will not have drm bridges between the thunderbolt controller and
> > the connector, but you still need to be able to show the connector to
> > the user when DisplayPort is tunneled over thunderbolt. DP alt mode is
> > only one way of getting DisplayPort through USB Type-C. You just can't
> > make any assumptions with USB Type-C.
> >
> > The drm bridge chain could only solve the port/connector relationship
> > problem from a single angle, but we need a common solution. The
> > problem is after all completely generic. It is not DisplayPort
> > specific or even USB Type-C specific problem. Those are just two of
> > the many possible last endpoints for these connections that need to be
> > aware of each other.
> >
> > So we really have to have a common way of getting this straight from
> > the hardware description somehow.
> >
> > To me the obvious solution would be to just have a port in the graph
> > that points directly the last endpoint regardless of what you have in
> > between. But if that's not an option, then so be it. Then there just
> > needs to be some other way of getting that information from DT.
>
> The DT must describe the HW interconnection, this is what we do, but
> we're allowed to parse it as we want and ignore the bridges/endpoint
> between the connector node and the display node, all this is implementation.
>
> We added intermediate bridge because they are part the displayport signal
> chain, and they may need to react to the display enable/disable/check
> if there's some limitations or init sequence in the retimer for example.

Moreover, this way we do not have to care about exact binding of the
interim devices. They can have different connections and order ports
as they do see fit. Parsing the whole chain from DP controller would
require having standard bindings for all retimers / muxes / switches
in the chain.

>
> Neil
>
> >
> > Maybe DT could use similar physical location object/attribute like
> > ACPI - the DP would have matching physical location with its connector?
> >
> >>> Having the logical final endpoint connection described in your DT/ACPI
> >>> on top of the physical connections costs very little, but at the same
> >>> time it's usually the only thing that the software needs (like in this
> >>> case).
> >>
> >> Maybe there is some misunderstanding here. We have this connection. We
> >> have connector->fwnode and connector->of_node pointing to the correct
> >> device - the last bridge in the chain. Each TCPM driver knows the
> >> relationship between the in-built drm_bridge and the Type-C port. The
> >> DP host controller port can be terminated with other endpoints, e.g.
> >> eDP panel. Or there can be a non-DP host, which is then connected
> >> through a series of bridges to the eDP or external DP port. This is
> >> what anx78xx bridge does: it converts the HDMI link into an external
> >> DP (SlimPort) connection. Bridge chains permit this to be handled in a
> >> seamless way.
> >>
> >> What you are asking for looks like a step backwards to me: it requires
> >> the host to know that there is a USB-C connector.
> >>
> >>> So, either you add one more port to your graph for the DP to Type-C
> >>> connection, or, if that's not an option, then you need to describe
> >>> that connection in some other way. Named references work also quite
> >>> well in my experience.
> >>
> >> Named references were considered and frowned upon by DT maintainers.
> >
> > thanks,
> >
>


-- 
With best wishes
Dmitry
