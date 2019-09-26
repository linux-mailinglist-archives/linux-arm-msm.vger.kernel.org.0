Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6888BECD6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Sep 2019 09:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730002AbfIZHsZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Sep 2019 03:48:25 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:50221 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729343AbfIZHsY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Sep 2019 03:48:24 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id C921C30E6;
        Thu, 26 Sep 2019 03:48:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 26 Sep 2019 03:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=engestrom.ch; h=
        date:from:to:cc:subject:message-id:mime-version:content-type
        :content-transfer-encoding:in-reply-to; s=fm2; bh=w+s9r045arvlx/
        7fyu9GSn1qP1pE18hWMcKzZta1ao0=; b=cHYfMHXNmz4X1JJpDas6Cp3OR2p1ub
        yARL/LXju2LibRlSdvE7Y4kpqKUn3NpKtbVgoUGmXNxj8jEDjjjs4r/MSuANhtxO
        6KlVMgwDuWQMAAPOm+elAQdIexV/xQBvcRCgMxecf4OvDx9gDgFoqkKI3nCsgFs+
        E6MPnAfsrrArWaaL5Ohe/ri8NEIDiTPtfLnB/Ma7IlLPqfWKIkY2CAyctrjMe6Yg
        DLPBDtci+LWxrI8moASHkXFZ4Ozn5mbLskC5Eum/s/LmiQWnyYpw98h4s438UieO
        vmZANMPK40b/SJPC+MHFyhwwOA7y8HyPM/sDnYNvHimogDatRL80ytiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=w+s9r045arvlx/7fyu9GSn1qP1pE18hWMcKzZta1ao0=; b=zhkl16JI
        +L5HYpQBmQ8847J9Obh1ZPQO/sx2am0uy3M4JH1beGSKzGyxRwyLfrGn0z/fUfhz
        /kh35aK+i7UZsyrWpzZW6nWqVVgMUEVpRuPVVgiQSz32ehKyTdg71pBtSXil0gSn
        2Xm+Y9Qi7GYWp/UX8B7yFa1N/NhOyjEjqnvpvJUHHIwbyNmVvIDDr2TNJ6HwBE89
        ZIDhAFuuwDUIJWZmBBAK35POLFSyXEQ6IRvd9z9fiPoL72xDZMozgm1YMJ213IYY
        elcu9MyCWMgXrSY2MNcxseJEN/UC/Yxtv8O7qOeDS1JlXrYJhDZeuh9JMsGc0IxC
        R2yHYgL3ZdGSSQ==
X-ME-Sender: <xms:RW2MXTBz5sy02KvxEz3F__h8A5E6GRMtXZ_SuqCXRci3N2YrV-rNiA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdduvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggugfgjohgfsehtkeertddtreejnecuhfhrohhmpefgrhhi
    tgcugfhnghgvshhtrhhomhcuoegvrhhitgesvghnghgvshhtrhhomhdrtghhqeenucffoh
    hmrghinhepmhgrihhlqdgrrhgthhhivhgvrdgtohhmnecukfhppedukeekrddvledrudei
    hedrudefvdenucfrrghrrghmpehmrghilhhfrhhomhepvghrihgtsegvnhhgvghsthhroh
    hmrdgthhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:RW2MXeYCrpZtXzMH7FzTo2KlvyHa95r2ZIvgDEuubID58JW17PEyxQ>
    <xmx:RW2MXXIoBtJiAtOC7yGGIqT3XTt8dejFx73SBHXWSJChe11KVGLwug>
    <xmx:RW2MXXDzEPYOIelKXwiciRwa0zGZ7RWOaW9nF4l4IdQFfJ-GmJ_KzQ>
    <xmx:R22MXfyTonuRreeRd8IR2CPBzDSRL3ubmekqQfULp65TLSbHg86NAQ>
Received: from engestrom.ch (188.29.165.132.threembb.co.uk [188.29.165.132])
        by mail.messagingengine.com (Postfix) with ESMTPA id AF3CAD60063;
        Thu, 26 Sep 2019 03:48:18 -0400 (EDT)
Date:   Thu, 26 Sep 2019 08:48:14 +0100
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
Message-ID: <20190926074814.rdzxjmut6izqf4d5@engestrom.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. 1134945 - Pipers Way,
 Swindon SN3 1RJ
User-Agent: NeoMutt/20180716
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tuesday, 2019-09-24 15:58:56 +0300, Jani Nikula wrote:
> Hi all, v2 of [1], a little refactoring around drm_debug access to
> abstract it better. There shouldn't be any functional changes.
> 
> I'd appreciate acks for merging the lot via drm-misc. If there are any
> objections to that, we'll need to postpone the last patch until
> everything has been merged and converted in drm-next.
> 
> BR,
> Jani.
> 
> Cc: Eric Engestrom <eric.engestrom@intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David (ChunMing) Zhou <David1.Zhou@amd.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Cc: Francisco Jerez <currojerez@riseup.net>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Russell King <linux+etnaviv@armlinux.org.uk>
> Cc: Christian Gmeiner <christian.gmeiner@gmail.com>
> Cc: etnaviv@lists.freedesktop.org
> 
> 
> [1] http://mid.mail-archive.com/cover.1568375189.git.jani.nikula@intel.com
> 
> Jani Nikula (9):
>   drm/print: move drm_debug variable to drm_print.[ch]
>   drm/print: add drm_debug_enabled()
>   drm/i915: use drm_debug_enabled() to check for debug categories
>   drm/print: rename drm_debug to __drm_debug to discourage use

The above four patches are:
Reviewed-by: Eric Engestrom <eric@engestrom.ch>

Did you check to make sure the `unlikely()` is propagated correctly
outside the `drm_debug_enabled()` call?
