Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DD9043D291
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 22:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243950AbhJ0UOa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 16:14:30 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:37739 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244050AbhJ0UOI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 16:14:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.west.internal (Postfix) with ESMTP id 3F7E32B01466;
        Wed, 27 Oct 2021 16:11:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 27 Oct 2021 16:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        xCSt7V+GF1Mz9Uk1XjErTP0d3bB70YKlH2mV7rVj/xU=; b=Z10bedxqzGVDF06Y
        qebXonYbWkHR0ShulzD/mD1ajBluc7oF/qtP+SyE3fbQAS7Bd7u0mKV9y/o9O5aJ
        1vTvbCofnqCTgW43bAUF9kd0TZ45G/khV62ygrlEJVnMZCZxJxI1TXowcj5GUhsY
        PHecaNvXAqEbCHaJz9e4rNpygyfNQf8N4xYqWqVTZnPdLxTvW6Sm/dZoTJo+sM37
        56ibBF9PZBtX4NFom6gZtMUcwHdx2SfcyUFXE06D+69c+AhPX8zNWh6IdAGERp4U
        xz5dutphPZJ0b4UEKEIv5shFfiA4VCbp859VD4NiHBGHvznyD29vP2icnfQqsBYK
        Buc55A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=xCSt7V+GF1Mz9Uk1XjErTP0d3bB70YKlH2mV7rVj/
        xU=; b=gVNhs6a3SrBUN6yO7Bf9lidqEIh8YLVA3i2v2RHslZRRGoeq9LZYBfeKY
        MnpFmLhtIWonuxNLpLkfSWwloo3+k9HbN4CmmCuT1vJagyoZ9c19OEQtkUenR2nR
        nIsrReuUGKCa/y8myy5g3OFOk409qH70cobBRwlKI/uNyNGTv9XJgF9Jy1qkcnS0
        4cfgSx0KnERkAvaViPkVufhw2jpN1Z2jUsYz6Vs5lybGwa5ULsna5HM+fQS0bPbW
        pBwvdoM1f9RwG292I8Y8fFkaC/qaKCo+EbTPe2nJcMH62BJQGGkiMReEsLMuSQeC
        Bfywg5VlyEALERwFQQEOFhhLlmAKA==
X-ME-Sender: <xms:e7J5YVQXX6PsPWwEQNJbNKekxOaXloAHAp_Eo5HIX4RMAwQQmbYOhQ>
    <xme:e7J5YeyC2J8ucbPay6UZTARtTBmlv2FSWyHPITgmzuYz0MR6ptn6La0gr6o7EUR1e
    qL0iAoRLDIf4-nYM1w>
X-ME-Received: <xmr:e7J5Ya0ewOVPbps051psyx-AHQ322NMJEbCjjTHDyMFiXXCnluzbW-64qBuR_FtDRQfzT4_Rf1fmor18hCd2-OuHhJFt16awxRnbbU4x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
    geeikeeknecuvehluhhsthgvrhfuihiivgepheenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:e7J5YdDpuwBkpMTA6O6tI20gadbFFXibBCkO4xUIQNH2OJ7PVfpcAA>
    <xmx:e7J5YegxF0zWMuSJENuqFk-1qRcbtUL8xOYMpS_g19QCbqmkMD4H0w>
    <xmx:e7J5YRpMfe8KTlKCYgZ2cYKmJjDRVmMADrgxKcOQXdgjkHsjfjn_pA>
    <xmx:e7J5YeCN6UK3NgoUty7NOSKbd-QbU9c-MDJI7PyQZ0jcRIGOinEpmN8sJLY>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:11:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Robert Foss <robert.foss@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <maxime@cerno.tech>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        linux-kernel@vger.kernel.org, Tian Tao <tiantao6@hisilicon.com>,
        Rob Clark <robdclark@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
        Chen Feng <puck.chen@hisilicon.com>,
        linux-samsung-soc@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 20/21] drm/kirin: dsi: Adjust probe order
Date:   Wed, 27 Oct 2021 22:09:51 +0200
Message-Id: <163532324665.18245.9629721147812502503.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-21-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-21-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Oct 2021 17:15:35 +0200, Maxime Ripard wrote:
> Without proper care and an agreement between how DSI hosts and devices
> drivers register their MIPI-DSI entities and potential components, we can
> end up in a situation where the drivers can never probe.
> 
> Most drivers were taking evasive maneuvers to try to workaround this,
> but not all of them were following the same conventions, resulting in
> various incompatibilities between DSI hosts and devices.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
