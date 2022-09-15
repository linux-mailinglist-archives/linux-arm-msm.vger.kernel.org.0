Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D32BE5BA271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 23:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiIOVx5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 17:53:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiIOVxz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 17:53:55 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9826A5071C
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 14:53:54 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id b136so29824094yba.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 14:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FAlU1of09I0TtyPSb8nI7+Yal20j3EXvCGA6NT/FrL0=;
        b=AfZuTRV4qIib4IuXwKzLoeTAFrkWZLTtUup0MlnvCitSehSg3jqtHQFO8bmynaDW3l
         9GEG16w44KjstI3RmBcGoVuKiR1Umv+v8jVNwwgW5m85uHecEJFYEKuqAktqTja54hQr
         DoviuF6txy/jMcjz1BoV4vjCdv5KHPL9p1zqsMsaas2a3ypaEy5xKqpDuD3W8i3qzwFQ
         yZ0mBvZHT7e0aCmUvDBZG365TEJqMQ+CjzJ4nfhiz+IAfUVLzX7atl1EsjIasYz5Gi9P
         nKDX8hmbcJ7gLB55aJm/1YEXE0qgVJuUTsw3uFTRzDCBiJ3iI4VhnAJn7ergLRYqFFNT
         XWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FAlU1of09I0TtyPSb8nI7+Yal20j3EXvCGA6NT/FrL0=;
        b=5EhFD4vSNd3TQNAQAU5OM5zeKREhMdgEhg+q3K7b4E72JDWm7J7DWoyiUmPyjJX4SC
         WZ4yDSCDIR+AclD8NfRtcodoHdkOwm66t6KBhgjr6+HjGkJhOPE/bYkRLv0P8XIDVkiT
         Gl9EudOFWKVn9odTOg9f6xqvlx08hEiwL+HnywTC9ePa2ozkd4xU75YG+qwhmj//Tw+t
         x7GPRlqmED+BNv+9RQxplen/EeEgncjUpPtyKjEs0n3D5oOQOO23jgD9BPMsN6xR744i
         iz15Va9jFwtjewl08eOkAxNP9e/vABy20fKuJ1HUo1nVCjGeeD+iAfPg2Z+rKAz+nrCh
         XsvA==
X-Gm-Message-State: ACrzQf1++/aaRc4IuLJQVMTYmfx1YTFxxeUqEs1L0lcioneR+G50rHmH
        US5wb5nJkPAjojYSU1HVmfvtX2LQJj4txMZKFe0PMQ==
X-Google-Smtp-Source: AMsMyM534IJbImH3Ol9YVPB8Abj280Fxq/iOUwHG+8Y4m+vJtUvPGRsqe9ay35n6VGrjMivGXmM9cvjyJRZPO4MAtDM=
X-Received: by 2002:a25:3182:0:b0:676:e9d3:3d16 with SMTP id
 x124-20020a253182000000b00676e9d33d16mr1736404ybx.275.1663278833798; Thu, 15
 Sep 2022 14:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220810030500.2793882-1-bjorn.andersson@linaro.org>
 <20220810030500.2793882-3-bjorn.andersson@linaro.org> <20220913104545.2u6mcyy3bg4dp6ly@mercury.elektranox.org>
 <20220915212545.q6vxcnrffwr3buq2@builder.lan>
In-Reply-To: <20220915212545.q6vxcnrffwr3buq2@builder.lan>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 16 Sep 2022 00:53:42 +0300
Message-ID: <CAA8EJpoNyc1_eM7mi3D3s4voqLZFHvJtiBd_TOB4dmxcSpwdWg@mail.gmail.com>
Subject: Re: [PATCH 2/2] power: supply: Add Lenovo Yoga C630 EC driver
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lee Jones <lee@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Sept 2022 at 00:25, Bjorn Andersson <andersson@kernel.org> wrote:
>
> On Tue, Sep 13, 2022 at 12:45:45PM +0200, Sebastian Reichel wrote:
> > Hi,
> >
> > [+Cc Lee Jones, DRI devel]
> >
> > On Tue, Aug 09, 2022 at 10:05:00PM -0500, Bjorn Andersson wrote:
> > > The Qualcomm Snapdragon-based Lenovo Yoga C630 has some sort of EC
> > > providing AC-adapter and battery status, as well as USB Type-C altmode
> > > notifications for Displayport operation.
> > >
> > > The Yoga C630 ships with Windows, where these operations primarily are
> > > implemented in ACPI, but due to various issues with the hardware
> > > representation therein it's not possible to run Linux on this
> > > information. As such this is a best-effort re-implementation of these
> > > operations, based on the register map expressed in ACPI and a fair
> > > amount of trial and error.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > > [...]
> > > +   val = yoga_c630_ec_read8(ec, LENOVO_EC_BAT_ATTRIBUTES);
> > > +   if (val < 0)
> > > +           goto out_unlock;
> > > +   ec->unit_ma = val & LENOVO_EC_BAT_ATTR_UNIT_IS_MA;
> > > +   if (!ec->unit_ma)
> > > +           ec->scale = 1000;
> > > +   else
> > > +           ec->scale = 1;
> >
> > Since I'm not sure how much of information was gained by reverse
> > engineering: Is this really milliamps vs microamps and not milliamps
> > vs milliwatt? SBS batteries usually report either mA or mW.
> >
>
> Unfortunately I don't know the answer to this.
>
> > > [...]
> > > +   case POWER_SUPPLY_PROP_SERIAL_NUMBER:
> > > +           val->strval = "05072018";
> > > +           break;
> >
> > why is this hardcoded? :)
> >
>
> I don't know, but as Daniel suggests, it would make sense to just drop
> it.
>
> > > [...]
> > > +   device_for_each_child_node(dev, fwnode) {
> > > +           ret = fwnode_property_read_u32(fwnode, "reg", &port);
> > > +           if (ret < 0)
> > > +                   continue;
> > > +
> > > +           /* Got multiple ports, but altmode is only possible on port 1 */
> > > +           if (port != 1)
> > > +                   continue;
> > > +
> > > +           ec->bridge.funcs = &yoga_c630_ec_bridge_funcs;
> > > +           ec->bridge.of_node = to_of_node(fwnode);
> > > +           ec->bridge.ops = DRM_BRIDGE_OP_HPD;
> > > +           ec->bridge.type = DRM_MODE_CONNECTOR_USB;
> > > +
> > > +           ret = devm_drm_bridge_add(dev, &ec->bridge);
> > > +           if (ret) {
> > > +                   dev_err(dev, "failed to register drm bridge\n");
> > > +                   fwnode_handle_put(fwnode);
> > > +                   return ret;
> > > +           }
> >
> > I wonder if DRM people want to see this in drivers/gpu/drm/bridge.
> > Maybe it's better to make this a MFD driver?
> >
>
> I did consider it, but it adds a whole bunch of boiler plate code
> without a lot of benefit.
>
> There are a few other cases where I think it would make sense to have
> drm bridges outside of drivers/gpu/drm, such as
> drivers/usb/typec/altmodes/ and drivers/platform/chrome/...

What about a solution which might sound simpler than MFD: from your
driver's probe() register a platform device which represents a drm
bridge. Add drm_bridge driver for it into drivers/gpu/drm/bridges/.



-- 
With best wishes
Dmitry
