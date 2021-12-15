Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 353974755A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 10:58:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241395AbhLOJ6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Dec 2021 04:58:19 -0500
Received: from mail-4317.proton.ch ([185.70.43.17]:54053 "EHLO
        mail-4317.proton.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236424AbhLOJ6S (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Dec 2021 04:58:18 -0500
Date:   Wed, 15 Dec 2021 09:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
        s=protonmail; t=1639562296;
        bh=y61HC4/CbZjjotOesALb2CPVggqpksT55ESKDuNtL9w=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc;
        b=L2J2hPBpN7mSEZ7HQ1d5F6Jb61PWa6GyMdyvkWFgTkGu6uqFjZYDQFEeSv0Xtrxhc
         IUbQ1sWRz+a6wOR3jD6J9hdX/7NfIMDXEgOfrrxNDix+/ryBsSPA0TtrJx3WPqH/yY
         wnEEEWGyF6/JH23WuttQnjokKMcTegLbd/qj9ot1yk+cveGf372IADtq9xp1LFhkpE
         QdZnOu7AqdEg+9LU6R4+twkH98KDilFQMLybBPbCu9Sw5f1MqWAPV6iXHulLOM9A6E
         G7N+5DonAuPcJ58vmTZK9eLfvHr590Qk2QpcKTn3puVrsaYEp9yRE79/R9Z4W9kbVY
         5ScX6wVA/+IRQ==
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
From:   Simon Ser <contact@emersion.fr>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Reply-To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm/plane: add alpha and blend_mode to atomic_print_state
Message-ID: <NJH25z_TKgSybtTGJaa2Q4wbYBwO3q2l_MDS0YXy39faQ8F6PNg6NuEKqX2jlKiZhKkN76M_kc9UqQCQijtIeC_41J5I1nYVzmrT7m27KLs=@emersion.fr>
In-Reply-To: <20211215095636.2330563-1-dmitry.baryshkov@linaro.org>
References: <20211215095636.2330563-1-dmitry.baryshkov@linaro.org>
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

On Wednesday, December 15th, 2021 at 10:56, Dmitry Baryshkov <dmitry.barysh=
kov@linaro.org> wrote:

> +=09drm_printf(p, "\talpha=3D%x\n", state->alpha);

Maybe use %04X here to make it clearer that 0xFFFF is the max?
