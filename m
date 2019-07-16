Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA8076B01C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 21:55:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388536AbfGPTwr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 15:52:47 -0400
Received: from mail.fireflyinternet.com ([109.228.58.192]:58458 "EHLO
        fireflyinternet.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388355AbfGPTwr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 15:52:47 -0400
X-Default-Received-SPF: pass (skip=forwardok (res=PASS)) x-ip-name=78.156.65.138;
Received: from localhost (unverified [78.156.65.138]) 
        by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id 17351699-1500050 
        for multiple; Tue, 16 Jul 2019 20:52:32 +0100
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
From:   Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190716174331.7371-2-robdclark@gmail.com>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Dave Airlie <airlied@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Laura Abbott <labbott@redhat.com>,
        Imre Deak <imre.deak@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Eric Biggers <ebiggers@google.com>,
        Deepak Sharma <deepak.sharma@amd.com>,
        linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20190716174331.7371-1-robdclark@gmail.com>
 <20190716174331.7371-2-robdclark@gmail.com>
Message-ID: <156330674940.9436.18083089508232951941@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH v2 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Date:   Tue, 16 Jul 2019 20:52:29 +0100
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2019-07-16 18:43:22)
> From: Rob Clark <robdclark@chromium.org>
> 
> Needed in the following patch for cache operations.

What's the base for this patch? (I'm missing the ancestor for drm_gem.c)
-Chris
