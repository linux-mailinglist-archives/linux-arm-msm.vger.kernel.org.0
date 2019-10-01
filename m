Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C277CC3458
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2019 14:36:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfJAMev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Oct 2019 08:34:51 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:44101 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726086AbfJAMev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Oct 2019 08:34:51 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 4639E3845;
        Tue,  1 Oct 2019 08:34:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 01 Oct 2019 08:34:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=engestrom.ch; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:content-transfer-encoding:in-reply-to; s=fm2; bh=Z
        CFe4FL8sKu9d7TI/87cwj1RdFKXW/Wz6HLGUaYeNnI=; b=m1Gp8kez+Mhsuoi4T
        59CzNqI2xz6J0ri2zucjgbPVBpCPvNnfW1I72iQXt6Ccox2FP7sJPMmq5zedAaAe
        u1VPItyQPpjyQRFyXLABtQZVCX0P0uH2FzLn2NmqOuLaYJOSN5VU47/lOSUjOe4l
        10L619Byl8rGD3Bll6LxYMBHAxSGFk/BmfxVcx4iWebAmS73+F/KI7qTkY1uHh/u
        C0WCeIIomn/3XwiQbITJhzqN1mrZD5QWT4nuM3wTpeVcbSZ/r9g4GRzGfwndPcn/
        wMgufUBTsqR1gaqBjh/OsDNHbxl/DETQWdRettbCLJMo/c3CU6qnDoAlsIiSYJcu
        dGINA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=ZCFe4FL8sKu9d7TI/87cwj1RdFKXW/Wz6HLGUaYeN
        nI=; b=dFkaVP4Bn7gJ7omMjlTiFoZ3cnoGb1zVvbfEcidS6uuin4hSKTI/FQkpM
        zrpw4kCydNUWW7HHlHwEnvhRD7bC8pH6CPFbq78ZkvF4NIT1YfBW+xrlFYJFuZOQ
        oPz3LA8UEE7ymCFnz42v4YbUbuOgW2PGFPpIwXDhwnycwEArIuViJveZv9+mc1A2
        +27Xa/s1R5THXnZEuGDNHmWyN/l73sFel1UlCWLVpA/KJUcbo1S4UxTA4lC2Rqit
        RGfhGguKP2Fa3PcNJbplp03LkW3LzoonmSTQXJeTngjexH5pZEZ3mTvq9vJlbKss
        tgX+5AvE3XsovZdSMK6O9JZjXKo4A==
X-ME-Sender: <xms:6EeTXaSmkTPeD39T2XSHPMTkp-WY5YDiPJ21ZP7vgHNsw9n7GZVnGw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgeeggdehvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggugfgjfgesthekredttderjeenucfhrhhomhepgfhrihgt
    ucfgnhhgvghsthhrohhmuceovghrihgtsegvnhhgvghsthhrohhmrdgthheqnecuffhomh
    grihhnpehmrghilhdqrghrtghhihhvvgdrtghomhenucfkphepudelvddrudelkedrudeh
    uddriedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegvrhhitgesvghnghgvshhtrhhomh
    drtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:6EeTXRq02QouW8yYwmy576gHcxbzTACIpWRw9FmcOKU-dphW9L1tPA>
    <xmx:6EeTXcdHOdUg3DLb04l7Uhsu16HO86uiu8934PHotLo8U-m-CLnLAA>
    <xmx:6EeTXUiivZCN_PjMxsSFybsxeAROleH822OQOgl6Mn1QOHG761oRwg>
    <xmx:6UeTXTH9iBGYqKpoM4s6_nphjJRotkce6hOVza1LY-Dt49PiVZuoKQ>
Received: from engestrom.ch (unknown [192.198.151.62])
        by mail.messagingengine.com (Postfix) with ESMTPA id 0DE7680063;
        Tue,  1 Oct 2019 08:34:45 -0400 (EDT)
Date:   Tue, 1 Oct 2019 13:34:44 +0100
From:   Eric Engestrom <eric@engestrom.ch>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
        nouveau@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francisco Jerez <currojerez@riseup.net>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        etnaviv@lists.freedesktop.org
Subject: Re: [PATCH v2 0/9] drm/print: add and use drm_debug_enabled()
Message-ID: <20191001123444.xtp7wpickwjus4m2@engestrom.ch>
References: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
 <875zl8d8x0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875zl8d8x0.fsf@intel.com>
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tuesday, 2019-10-01 14:03:55 +0300, Jani Nikula wrote:
> On Thu, 26 Sep 2019, Eric Engestrom <eric@engestrom.ch> wrote:
> > On Tuesday, 2019-09-24 15:58:56 +0300, Jani Nikula wrote:
> >> Hi all, v2 of [1], a little refactoring around drm_debug access to
> >> abstract it better. There shouldn't be any functional changes.
> >> 
> >> I'd appreciate acks for merging the lot via drm-misc. If there are any
> >> objections to that, we'll need to postpone the last patch until
> >> everything has been merged and converted in drm-next.
> >> 
> >> BR,
> >> Jani.
> >> 
> >> Cc: Eric Engestrom <eric.engestrom@intel.com>
> >> Cc: Alex Deucher <alexander.deucher@amd.com>
> >> Cc: Christian König <christian.koenig@amd.com>
> >> Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>
> >> Cc: amd-gfx@lists.freedesktop.org
> >> Cc: Ben Skeggs <bskeggs@redhat.com>
> >> Cc: nouveau@lists.freedesktop.org
> >> Cc: Rob Clark <robdclark@gmail.com>
> >> Cc: Sean Paul <sean@poorly.run>
> >> Cc: linux-arm-msm@vger.kernel.org
> >> Cc: freedreno@lists.freedesktop.org
> >> Cc: Francisco Jerez <currojerez@riseup.net>
> >> Cc: Lucas Stach <l.stach@pengutronix.de>
> >> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> >> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> >> Cc: etnaviv@lists.freedesktop.org
> >> 
> >> 
> >> [1] http://mid.mail-archive.com/cover.1568375189.git.jani.nikula@intel.com
> >> 
> >> Jani Nikula (9):
> >>   drm/print: move drm_debug variable to drm_print.[ch]
> >>   drm/print: add drm_debug_enabled()
> >>   drm/i915: use drm_debug_enabled() to check for debug categories
> >>   drm/print: rename drm_debug to __drm_debug to discourage use
> >
> > The above four patches are:
> > Reviewed-by: Eric Engestrom <eric@engestrom.ch>
> >
> > Did you check to make sure the `unlikely()` is propagated correctly
> > outside the `drm_debug_enabled()` call?
> 
> I did now.
> 
> Having drm_debug_enabled() as a macro vs. as an inline function does not
> seem to make a difference, so I think the inline is clearly preferrable.

Agreed :)

> 
> However, for example
> 
> 	unlikely(foo && drm_debug & DRM_UT_DP)
> 
> does produce code different from
> 
> 	(foo && drm_debug_enabled(DRM_UT_DP))
> 
> indicating that the unlikely() within drm_debug_enabled() does not
> propagate to the whole condition. It's possible to retain the same
> assembly output with
> 
> 	(unlikely(foo) && drm_debug_enabled(DRM_UT_DP))
> 
> but it's unclear to me whether this is really worth it, either
> readability or performance wise.
> 
> Thoughts?

That kind of code only happens 2 times, both in
drivers/gpu/drm/drm_dp_mst_topology.c (in patch 2/9), right?

I think your suggestion is the right thing to do here:

-   if (unlikely(ret && drm_debug & DRM_UT_DP)) {
+   if (unlikely(ret) && drm_debug_enabled(DRM_UT_DP)) {

It doesn't really cost much in readability (especially compared to what
it was before), and whether it's important performance wise I couldn't
tell, but I think it's best to keep the code optimised as it was before
unless there's a reason to drop it.

Lyude might know more since she wrote 2f015ec6eab69301fdcf5, if you want
to ping her?

> 
> BR,
> Jani.
> 
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center
