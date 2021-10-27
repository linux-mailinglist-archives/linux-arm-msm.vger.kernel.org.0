Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A9843D261
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 22:11:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240533AbhJ0UNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 16:13:35 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:47151 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243888AbhJ0UNO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 16:13:14 -0400
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailnew.west.internal (Postfix) with ESMTP id 9392E2B0145F;
        Wed, 27 Oct 2021 16:10:46 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Wed, 27 Oct 2021 16:10:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        eg0kETn6naR3cNL8vdfsea62Iv5fKNbEJwaiBM1N9mA=; b=GpGkM3//TuxZLsh0
        t74PKIgfQC5sgvpD6zqBzIxwLaKmiqTZNQGWCTO5MADKWdkNQE1kcqGRzEjxGUm5
        UYm86IX1yz1a/Ik7y8mejSee2YATQ9cHr+7rYIj4ea+OT/tTn3G4mrEeBE2iTejE
        5g6S8KRNvrRCsBXD3ALFiN2Jl680vS6w2NLeX7bEL4dNQD16f6LdI8siGR4en7Yf
        2oT/e9Nn8DxkY3yj8v7VFtuiVYgOfavDxOt0a8nd7DTZOmeh3Acm+KQkBY9D/KR7
        YGn/Kb9QhYjJ2Uzv2PWmseWqNNDUqYchfysHmkXhwySVYcL6cNyZQZFYIksgsdzO
        dW6XmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=eg0kETn6naR3cNL8vdfsea62Iv5fKNbEJwaiBM1N9
        mA=; b=Ez7+zkTX1T+Cah1a/5Qgja62e2h6k5CkGQbVAR14A/K+JZ+ii5MDWZ06q
        FiME7r5nwjDPCym212s54WniSFMTn370fsp/ZeV2md8UbImuAwQvv5tAaAw4BPbd
        cE6qlUaeBB4P9071DEAzWO8svOWs9p9HBj0KuIOr1ESOjs+RRN6ldTLYaDLBYYCt
        hlWfbB+aloUeAVtWZ0BfRsyg9MwmuGVK8cIOx+MeFnDdArZd57KWczD4dAo7DX4u
        iG9NEjvFponBOIVHVpmVsqmmyUfNj/8Ata9NqM9v0M/ha4cHu6jLJFa/9Q29AnGn
        rih3GCiDcbVjP+lqZ/KnBxPGlDrCw==
X-ME-Sender: <xms:RbJ5YULx5P2qMSYpkHI2clVCUGZdnJK6d4B_ukxglc5uNtZHHZ99Dg>
    <xme:RbJ5YUIhCrg5Dkumd4xM7gx0012rZHt0Q2FQzR7aQbwabwc6ubHbEFkIrGJqi78xh
    HQfGuPEsxw7YmZrpic>
X-ME-Received: <xmr:RbJ5YUvNaVLUgIbe2ejDfzkUc8R6PBfyiIk0EwbU3L-K3sGG8ZSc5nUpcrRPtCqUv3rphAYqSoydf3fofHAL2T1pLxdkFpazAD41_d_n>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
    geeikeeknecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:RbJ5YRY3hbXu7QqYrkgl88O-SJqqc0nL86UMly7PhU6bbRmtC2xZig>
    <xmx:RbJ5Ybb8wRF0if3KuOJ_UJoKQPMCg1M-hl8IAl78pvaZHDUbZ8GwSQ>
    <xmx:RbJ5YdC5UiW2DAGJNMvbENm657bKBmnmtyKxk5Hi5gQdTszarqAKXg>
    <xmx:RrJ5YZYOhj1ByNctO902UXN1IBs_UYoqX5dSKIs0kip-pJvrkEDe5trz958>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:44 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <maxime@cerno.tech>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tian Tao <tiantao6@hisilicon.com>,
        linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Inki Dae <inki.dae@samsung.com>,
        Chen Feng <puck.chen@hisilicon.com>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 09/21] drm/bridge: lt9611uxc: Switch to devm MIPI-DSI helpers
Date:   Wed, 27 Oct 2021 22:09:40 +0200
Message-Id: <163532324663.18245.7862749159677097105.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-10-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-10-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Oct 2021 17:15:24 +0200, Maxime Ripard wrote:
> Let's switch to the new devm MIPI-DSI function to register and attach
> our secondary device.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
