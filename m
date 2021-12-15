Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8C9475D3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 17:19:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238053AbhLOQS3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 11:18:29 -0500
Received: from mail-0201.mail-europe.com ([51.77.79.158]:44188 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237946AbhLOQS2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 11:18:28 -0500
Date:   Wed, 15 Dec 2021 16:18:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1639585104;
        bh=qlSXnq0k9kLv7nAnJZp1tofYWVGCcWW/pkPYUjzUV2I=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=Gef2vX2f3I7SfHHMlyJWYCtqW3GziCDaC0KTj+FmAwTK/RUhlQNf2S7ir9Lnh6MNv
         2yjnkV5vePFxxreGveg7ErShI1Zfy7PNBPPord7CSfltMmOkriLeUKtwJCOyg0zfuC
         wU6EiTnxXvjrBFMexLOH4hF2bzlIRPDdr+znC/zg93YGhVpngK7NUKPPEWAcpgKbjw
         7CYQe8l3lVZh9nGf7SpqW+dwO1AB53wczI5K8lcAF/AqveHtndklIIOcI8X2D/RXgz
         +hPgRnGMhUhB9YVWprDSlRBE2Qn5ZanoCEz/8CeXnXi1WCuTrQmqnmkpa/IBq4RmwS
         2Ce1xj4vyLKtQ==
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm/plane: add alpha and blend_mode to atomic_print_state
Message-ID: <VFr2GRLAih_hmjQXq2OZOGbYRN5vBU3dlBTULK8PlsT25MfW_Son4YjNOuFzJs4429UYxGlghaik1W655rbctOLRCTHfK7J6zk10q6fGi40=@emersion.fr>
In-Reply-To: <20211215160837.2715448-1-dmitry.baryshkov@linaro.org>
References: <20211215160837.2715448-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

v2 looks good to me. A little bit sad about the stringifier duplicating cod=
e
with drm_plane_create_blend_mode_property but it's not that of a big deal.

Reviewed-by: Simon Ser <contact@emersion.fr>
