Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBBB621BD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 19:25:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiKHSZq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 13:25:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiKHSZp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 13:25:45 -0500
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1946922B22
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 10:25:44 -0800 (PST)
Date:   Tue, 08 Nov 2022 18:25:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail3; t=1667931941; x=1668191141;
        bh=T6k7Oj7EY2w+LC1uS+UDLi5XK+UXqTD36hc3aqLUeoA=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=FNPse4MA24s6RhlcgZ6BZL5k9SSoA65INajZwvKl/o2qdpQ6oYYl/fcP+90aNha9u
         t5UBRENp6HkSHsFMY0R5sVSrpXcDEob2tY8/immYwiFuC9+HJUSptIcgwaTtg4tqXS
         LTBS0YywF3zcE7Ag5ar8V+RLEr4Cnqwpi0YufuIhrDtxtMa0ZYKuhOx92nRtSiYbIL
         ghaf00GJJprroM/3LYPgfJBvEDvYavZTefaTo3ivqYbU9ql5/i2IceMvLPZiUwAzzv
         EJ9neF4QJq+84aG2uuyzCeFGft479SKd0/sv75rYaMq9mdWJxAzz7wT9whQ+lPf49d
         RlRIyRvVkGaIA==
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, daniel.vetter@ffwll.ch,
        laurent.pinchart@ideasonboard.com
Subject: Re: [RFC PATCH 1/3] drm: Introduce color fill properties for drm plane
Message-ID: <fqY-wVvRxd553E0flH80_NaZMpmiVTIdhvu6F31qM9T4yQ0L5fbT9JiixWIhDcDAt3Hxy1roQxwntvgVEnqm5WK6dzEIKqXnlLRcywGhYH4=@emersion.fr>
In-Reply-To: <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
References: <20221028225952.160-1-quic_jesszhan@quicinc.com> <20221028225952.160-2-quic_jesszhan@quicinc.com> <eddf4726-3d7e-601a-51ac-03adb2dd822b@linaro.org>
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

On Saturday, October 29th, 2022 at 13:23, Dmitry Baryshkov <dmitry.baryshko=
v@linaro.org> wrote:

> On 29/10/2022 01:59, Jessica Zhang wrote:
>=20
> > Add support for COLOR_FILL and COLOR_FILL_FORMAT properties for
> > drm_plane. In addition, add support for setting and getting the values
> > of these properties.
> >=20
> > COLOR_FILL represents the color fill of a plane while COLOR_FILL_FORMAT
> > represents the format of the color fill. Userspace can set enable solid
> > fill on a plane by assigning COLOR_FILL to a uint64_t value, assigning
> > the COLOR_FILL_FORMAT property to a uint32_t value, and setting the
> > framebuffer to NULL.
>=20
> I suppose that COLOR_FILL should override framebuffer rather than
> requiring that FB is set to NULL. In other words, if color_filL_format
> is non-zero, it would make sense to ignore the FB. Then one can use the
> color_fill_format property to quickly switch between filled plane and
> FB-backed one.

That would be inconsistent with the rest of the KMS uAPI. For instance,
the kernel will error out if CRTC has active=3D0 but a connector is still
linked to the CRTC. IOW, the current uAPI errors out if the KMS state
is inconsistent.
