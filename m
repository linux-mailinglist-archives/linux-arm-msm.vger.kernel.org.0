Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC92324808E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 10:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgHRI1P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 04:27:15 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58742 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgHRI1O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 04:27:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597739233;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YE9v2iUUt0C+eIB9363k6FZZUNnKbdhJpiU9fX/PhuY=;
        b=Af/2mKqOvbxTNoooOkwf2vMQkD1fX7Bsqo7+NuMpZbcr6pnrUM1vF+jLc9VRucj8HrUKuL
        iv8JWKvDfGeaP6e6lk06lWGvq0CYSjuR8dJzCJjewDkHxveVPC8sQTfsNg041G6Adz/VOk
        MDAIKk1NmMkqOi9RnmuJ569MwcKJXQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-ahIv83ehNsqc6ofMzQXlaA-1; Tue, 18 Aug 2020 04:27:09 -0400
X-MC-Unique: ahIv83ehNsqc6ofMzQXlaA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B292C1DDF1;
        Tue, 18 Aug 2020 08:27:06 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com [10.36.112.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A5EAA261B9;
        Tue, 18 Aug 2020 08:27:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id C21E09CBD; Tue, 18 Aug 2020 10:27:03 +0200 (CEST)
Date:   Tue, 18 Aug 2020 10:27:03 +0200
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc:     dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" 
        <nouveau@lists.freedesktop.org>, Sandy Huang <hjc@rock-chips.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        "open list:RADEON and AMDGPU DRM DRIVERS" 
        <amd-gfx@lists.freedesktop.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        "open list:ARM/Rockchip SoC support" 
        <linux-rockchip@lists.infradead.org>,
        Ben Skeggs <bskeggs@redhat.com>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" 
        <etnaviv@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR NVIDIA TEGRA" 
        <linux-tegra@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        "moderated list:ARM/Rockchip SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Alex Deucher <alexander.deucher@amd.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm: allow limiting the scatter list size.
Message-ID: <20200818082703.7z6fcvoymiqow5kw@sirius.home.kraxel.org>
References: <20200818074828.9509-1-kraxel@redhat.com>
 <20200818074828.9509-2-kraxel@redhat.com>
 <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c355d64-1a61-eb59-be80-d9fc863ddf22@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 18, 2020 at 09:57:59AM +0200, Christian König wrote:
> Am 18.08.20 um 09:48 schrieb Gerd Hoffmann:
> > Add max_segment argument to drm_prime_pages_to_sg().  When set pass it
> > through to the __sg_alloc_table_from_pages() call, otherwise use
> > SCATTERLIST_MAX_SEGMENT.
> > 
> > Also add max_segment field to gem objects and pass it to
> > drm_prime_pages_to_sg() calls in drivers and helpers.
> > 
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> I'm missing an explanation why this should be useful (it certainly is).

virtio-gpu needs this to work properly with SEV (see patch 2/2 of this
series).

> And the maximum segment size seems misplaced in the GEM object. This is
> usually a property of the device or even completely constant.

Placing it in drm_device instead would indeed work for virtio-gpu, so I
guess you are suggesting that instead?

take care,
  Gerd

