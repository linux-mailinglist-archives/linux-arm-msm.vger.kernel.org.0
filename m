Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F4736829EB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Jan 2023 11:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230044AbjAaKGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Jan 2023 05:06:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231538AbjAaKGw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Jan 2023 05:06:52 -0500
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02B564B8A2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Jan 2023 02:06:51 -0800 (PST)
Date:   Tue, 31 Jan 2023 10:06:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1675159608; x=1675418808;
        bh=PKjpB873KFVEKBlEethlWB5JT7+2UnaIsAv0b3E2kIs=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=wsuOR3mX603RNEeWhABWWFmL2nbJYBaLdk8yrFbaio/m0XrH/Sy/Kt6xgSjDJSeV5
         GP7z7pl1OWG1AXhl9IBrPmjfBsK4QyElr+Me+wOu3Jl4WY7Ye6XIcECf+A6lSSYPQm
         ckdzRe3aK3Q+Ehk7D/XtwcrVqP5S75ZlCG+G3x4AmeFAXROjgCIRdHHywO+h4NOASu
         XK+5QRcX/wVTHAtlZSe3tKrzyae5weCO+FNRz5uWBY3o8MkyFw25gpX/Do6fm+bx0F
         K6fEcLUjTsEpPAiQo0ZDvpRtxNhvZDBKvbbLeqc31PG6rNGZl8Otf77HuWUkNoDVVk
         j7H6oOD6Fi51A==
To:     Pekka Paalanen <ppaalanen@gmail.com>
From:   Simon Ser <contact@emersion.fr>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com, sebastian.wick@redhat.com,
        wayland-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
Subject: Re: [RFC PATCH v3 0/3] Support for Solid Fill Planes
Message-ID: <9Q0ano1jjZ1LTNWaVcVkDp0-jsTSUJKoNrKwvpGpIuejUSB33DK-uOpeLmyMbbk6tdfWG8RS83AGyB--EPEHqJe5shq6RC_gVpPLR7sUScY=@emersion.fr>
In-Reply-To: <20230131112527.32ab8ba5@eldfell>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com> <Y7a1hCmsvJHKdW1Y@phenom.ffwll.local> <58caf08c-3a02-82ce-4452-8ae7f22f373d@quicinc.com> <CAA8EJppnAmN6+S-emEfXJEc1iVf+DjeLBmCQpGd-nRY2M2AAQQ@mail.gmail.com> <Y7hrWDpg8msuefgZ@phenom.ffwll.local> <CAA8EJppoejPPNhu3eHBc_vsstHvEEwYx67HZLo8+4W3K-gHkag@mail.gmail.com> <20230131112527.32ab8ba5@eldfell>
Feedback-ID: 1358184:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tuesday, January 31st, 2023 at 10:25, Pekka Paalanen <ppaalanen@gmail.co=
m> wrote:

> indeed, what about simply using a 1x1 framebuffer for real? Why was that
> approach rejected?

Ideally we don't want to allocate any GPU memory for the solid-fill
stuff. And if we special-case 1x1 FB creation to not be backed by real
GPU memory then we hit several situations where user-space expects a
real FB but there isn't: for instance, GETFB2 converts from FB object
ID to GEM handles. Even if we make GETFB2 fail and accept that this
breaks user-space, then there is no way for user-space to recover the
FB color for flicker-free transitions and such.

This is all purely from a uAPI PoV, completely ignoring the potential
issues with the internal kernel abstractions which might not be suitable
for this either.
