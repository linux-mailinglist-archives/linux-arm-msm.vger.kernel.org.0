Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A77D2513987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 18:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349864AbiD1QTA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 12:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349899AbiD1QS7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 12:18:59 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615CA29808
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 09:15:43 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id g8so2250393pfh.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 09:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Dfa1bV+l0rTD/48Pn9eH0bLjlOwV1+aYl2ofQSrXJUM=;
        b=hWZiuHu8JdkaW16COERrDY5bK6U72h+rWDMYgBl2WsnIVOQwa3cmfWdmXW3QL4ho3D
         GmDWhfJ6qhqQrHlZlJGNhkQ4RDqj4dHbwdCIPbADdhn/LLzhC7ZiLboE0eHKGeypFLv4
         cReOdJ48psk9nQNdUBp8jsYfW60zM2w7XKXMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Dfa1bV+l0rTD/48Pn9eH0bLjlOwV1+aYl2ofQSrXJUM=;
        b=kSbie+qREWM7L0izq2qzOjvhdGVCilpVcPeLKZhds59z0yfeM4SSZkKsCI2nt3X+IA
         PLbxl6USIBN5pjwD5oz1keCdzmacaK7OPC31l+5NAjgeW7+iAWxhag1REiMksM3yxrVf
         3RdgTBrwOVnHQmwtu6temNvk1XDqMQ8bbKV3HMDAhbTDcI+4pO+ge59U+6Nf7FDnRBi2
         dR1pB86emgJnFQpoabBPsVzJ/hOtkbeclHL5tYU2Ai6kgHIxrOxLKifQRxc9iOShQdQ/
         aN//1cCgb0uHW4QkkgmEJERroViglNzy0DMpjVdqo8bTYD8cB8NwzJm6dgFNN3IFakML
         1Tnw==
X-Gm-Message-State: AOAM530iw+IVi6xicErLPatGswGz+9ZtSTCunMsELGoqCR7IYWwV+J8G
        XCcvK9UaGyx3NdOOxBl6aRjxHpieydbjbw==
X-Google-Smtp-Source: ABdhPJzlBNQOMivdc1V03Wr32p3jvOOeJtUJvOQ9TbIPp9SCu1XaxHBr07iH7lOg3BRvs0j4aFP0wQ==
X-Received: by 2002:aa7:83c2:0:b0:505:723f:6ace with SMTP id j2-20020aa783c2000000b00505723f6acemr35965537pfn.86.1651162542894;
        Thu, 28 Apr 2022 09:15:42 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:7a56:fc44:2682:8a2e])
        by smtp.gmail.com with UTF8SMTPSA id 132-20020a62168a000000b004f40e8b3133sm293538pfw.188.2022.04.28.09.15.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 09:15:42 -0700 (PDT)
Date:   Thu, 28 Apr 2022 09:15:39 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH v22 1/2] arm64: dts: qcom: sc7180-trogdor: Add nodes for
 onboard USB hub
Message-ID: <Ymq9qzzd+OV6xjh8@google.com>
References: <20220426170306.v22.1.I7a1a6448d50bdd38e6082204a9818c59cc7a9bfd@changeid>
 <CAD=FV=UzhOrXgB4LrHO4kaSrfw1GQJMb0RNsQXYfG5kG8EwcRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=UzhOrXgB4LrHO4kaSrfw1GQJMb0RNsQXYfG5kG8EwcRA@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 27, 2022 at 02:05:04PM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Apr 26, 2022 at 5:03 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> >
> > Add nodes for the onboard USB hub on trogdor devices. Remove the
> > 'always-on' property from the hub regulator, since the regulator
> > is now managed by the onboard_usb_hub driver.
> 
> There are people out there that are running trogdor devices with
> upstream Linux. There's not much we can do about it, but probably this
> patch will cause them to fail to probe USB because they won't have
> "CONFIG_USB_ONBOARD_HUB=y". Luckily the commit subject has "USB" in it
> so hopefully it'll be easy to spot, but I wonder if we should add
> something to the commit message that makes that super obvious and
> tells them about the relevant commit, like:
> 
> For anyone using trogdor-based devices on Linux, it should be noted
> that this requires "CONFIG_USB_ONBOARD_HUB=y".

Ok, I'll respin and add the note.

> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Depends on "usb: misc: Add onboard_usb_hub driver" [1] which landed in
> > https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=usb-testing
> >
> > This patch was split off the above series.
> >
> > [1] https://patchwork.kernel.org/project/linux-usb/list/?series=615531&state=%2A&archive=both
> 
> I presume it will be moderately annoying if this lands in the Qualcomm
> branch before the driver lands in mainline? Otherwise USB will fully
> stop working on the Qualcomm branch. Do we want to postpone landing
> this?

Postponing the trogdor patch sounds good to me.
