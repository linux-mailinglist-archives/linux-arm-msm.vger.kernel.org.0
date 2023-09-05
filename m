Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B86D79256D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Sep 2023 18:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236595AbjIEQFG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Sep 2023 12:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354353AbjIEK5P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Sep 2023 06:57:15 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EA7D1A8
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Sep 2023 03:57:12 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-d78328bc2abso2011683276.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Sep 2023 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693911431; x=1694516231; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nFp9JN673sSpwa45B4q2HQSN730WX8grbrKR4m9d76A=;
        b=EUXkgM9iKYXkdGIhIzbe0Itxp2yGw47ebDol5/1/y+FAIKyO0+TNzTkz2rcND3U6fS
         jckDEAQeYd5rZR9WWdHcOokHRuwM4/z/i7YsuVJF1KXbPYYLbDJecjbmt9lPW9RQP9O5
         WyQz5iq0B8r4JXgUbrzzAPBByLp5L5SFEGQ7Wnpb5y/eeeZOluqSkfbhPULLLxMOcakP
         NnQtRwyeB7bIoB+/I7d1OhvvSqaxFfTpNPqiyU03tUMnyf2DsHDW6q377XRkNzFriyLI
         8KbRILHkmBs9rbilXa5PiIXF9ob+IfoTdcOh8ynfamc5OFRq/yaJvJJHbCZDozTk/xHF
         itKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693911431; x=1694516231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFp9JN673sSpwa45B4q2HQSN730WX8grbrKR4m9d76A=;
        b=D4n09VTmzSJLH0vEZi9eXFiPhDbiXn6Igi9ak4wvghO30E8h8D9HB5s2LNy2Lk2uZk
         VlryE9Qf9sYfSDX7xKK1J6yUEqci68ZRWECsS0u8c3N7QIMl5YD7fgegrN4HjkkTl2Gh
         GIhVAWGMvqgc9A5Pow14K1zTRNdOSCnPdkmnJXD68RbmpJhzPndtGezmp4KrCqp7tljH
         s7o6aeiIZQltlAOw39AwYLAjBMQcIBidB6KZEKhBM2kIxcO0DDr+bDSs0YldDtCxEFXG
         s+suqzPRMCREiudwCcG8fx3aw+KtBNQSBA3r9Ek2GQzzLb3JrS2zg0hgNkVeTrmxibMr
         ujwg==
X-Gm-Message-State: AOJu0Yx9yof2EymVbzbUSkhi1GKVhhfh4c+Lz4jXgcfBrG9aBoM5/M2r
        ewQcMM3sQ4L8v+6Bor4J7bzkrQhqzh24RWxrR/XGzA==
X-Google-Smtp-Source: AGHT+IGZHwMQlo/ityKImZ2VeEtB90rqhklF5U6Gv8PiiU7XpveUbpNUVJmNlPMw3mBk4Obk/SUY2ph1gPYN6jbIHDo=
X-Received: by 2002:a25:ac20:0:b0:d53:f98f:8018 with SMTP id
 w32-20020a25ac20000000b00d53f98f8018mr13526068ybi.65.1693911431284; Tue, 05
 Sep 2023 03:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
 <20230903214150.2877023-2-dmitry.baryshkov@linaro.org> <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
In-Reply-To: <ZPbrtAlO2Y+bjDhf@kuha.fi.intel.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 5 Sep 2023 13:56:59 +0300
Message-ID: <CAA8EJpqUg2-k7LLBL38RHU1sThkXB54ca68xEMd1yMnHQcQ++w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 01/12] Revert "drm/sysfs: Link DRM connectors to
 corresponding Type-C connectors"
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
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
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Heikki,

On Tue, 5 Sept 2023 at 11:50, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Dmitry,
>
> On Mon, Sep 04, 2023 at 12:41:39AM +0300, Dmitry Baryshkov wrote:
> > The kdev->fwnode pointer is never set in drm_sysfs_connector_add(), so
> > dev_fwnode() checks never succeed, making the respective commit NOP.
>
> That's not true. The dev->fwnode is assigned when the device is
> created on ACPI platforms automatically. If the drm_connector fwnode
> member is assigned before the device is registered, then that fwnode
> is assigned also to the device - see drm_connector_acpi_find_companion().
>
> But please note that even if drm_connector does not have anything in
> its fwnode member, the device may still be assigned fwnode, just based
> on some other logic (maybe in drivers/acpi/acpi_video.c?).
>
> > And if drm_sysfs_connector_add() is modified to set kdev->fwnode, it
> > breaks drivers already using components (as it was pointed at [1]),
> > resulting in a deadlock. Lockdep trace is provided below.
> >
> > Granted these two issues, it seems impractical to fix this commit in any
> > sane way. Revert it instead.
>
> I think there is already user space stuff that relies on these links,
> so I'm not sure you can just remove them like that. If the component
> framework is not the correct tool here, then I think you need to
> suggest some other way of creating them.

The issue (that was pointed out during review) is that having a
component code in the framework code can lead to lockups. With the
patch #2 in place (which is the only logical way to set kdev->fwnode
for non-ACPI systems) probing of drivers which use components and set
drm_connector::fwnode breaks immediately.

Can we move the component part to the respective drivers? With the
patch 2 in place, connector->fwnode will be copied to the created
kdev's fwnode pointer.

Another option might be to make this drm_sysfs component registration optional.

> Side note. The problem you are describing here is a limitation in the
> component framework - right now it's made with the idea that a device
> can represent a single component, but it really should allow a device
> to represent multiple components. I'm not saying that you should try
> to fix the component framework, but I just wanted to make a note about
> this (and this is not the only problem with the component framework).
>
> I like the component framework as a concept, but I think it needs a
> lot of improvements - possibly rewrite.

Yes. There were several attempts to rewrite the component framework,
but none succeeded up to now. Anyway, I consider rewriting components
framework to be a bigger topic compared to drm connector fwnode setup.

--
With best wishes
Dmitry
