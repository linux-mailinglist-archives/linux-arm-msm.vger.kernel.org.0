Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0D5043D238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Oct 2021 22:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243853AbhJ0UMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Oct 2021 16:12:48 -0400
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27]:50233 "EHLO
        wnew2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243830AbhJ0UMq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Oct 2021 16:12:46 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailnew.west.internal (Postfix) with ESMTP id 128E72B0145C;
        Wed, 27 Oct 2021 16:10:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Wed, 27 Oct 2021 16:10:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        jLs2r1zDl/69wi6ikC/R/ADci8RrfsDbJ/iNqiDxJSU=; b=cyk1/80xqQsy27Nh
        8OTBk8En3NhH/K+ULwpXqUqLiAtenQIUDzGxvjhbdabWpFNunwC7GQrqhvIj5965
        2U/Q7hl3Ey6CjiQ90oDkS3Mq8O9APk5sLn5DEtoinRNNUfHPZzLDSPEHHWGreHSD
        IeHZ0BPYqqNvXnmW5dfx81tgEiCKqSAHRwhto8VVaJ+W93B4gslFMJ+xygub2YIC
        h9BKnQLSnaFHimSTIaQ5x/2A7VfTW/IDex3HE+9nqIAWZ/QTkHTa1GZH3LzsbJEO
        SoNQpUaET+tu7yqFy8Bm+pc1SWLgEQo/5wjppyzhyhsDwafcz+VD8u/gA0H/1gde
        i5LH0g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=jLs2r1zDl/69wi6ikC/R/ADci8RrfsDbJ/iNqiDxJ
        SU=; b=HibrOR3S2iB2quNO4SEdx/CINaEY8ijgpomz3jodIm7GwuKwhw/+2Kezv
        ptDh0HKz3iWQoQVovSKWSn/4OzYcuBqCLldPRiGVtqxxrYGurg9AvVJEOunaLf4q
        Efv8Edj+/t8GKe26MkBy3APGf+6FkKQ1jWqVfc6s8LmqROHBpcPewNVhKTiLEbLd
        TxB+YZ/GsCQs0u9Deqv44lNgmaZMSe45b2l009cEMUbmhkm2/yBn5fndsni8A66g
        iGBytACgH5fowV3SkVwedpvpr0GOqH7wVCSXTyDdkqYlsf1M6yiBRTyCDPjL+DpQ
        RMnyrvCxoIA13Kjdg5pKd8Ql7vLMA==
X-ME-Sender: <xms:KbJ5YZli9ZyecaZe5_0lXL1jOf4GI7I2tw_Mwv3ZJdlDFBtgrPSxlg>
    <xme:KbJ5YU2NEiaaAZeYRvl-7DPqhPpGKOMdLRJyQ98dp9IqEvjae5ikp1JaLcPB0s58F
    rnnG9Fi2qbdXk96DoE>
X-ME-Received: <xmr:KbJ5YfqvNeHKiger_7QPepCeI1OeLHB1BbSrdOfYRuhEwenvNpQbB6sqEZnTUya59sDxS8VzMrDWQkja-tWbcKftKIPp2TYGog6snkmv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdegtddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfef
    geeikeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:KbJ5YZn1UWsUiGNuCRrVr8qPyDZoGms1Oornprx-BoYmogfrhee8Lw>
    <xmx:KbJ5YX3M3Kdf4ZXqa2GRlqJh_aKYka9mtzZVfNxUYunFqJ9arHYfsg>
    <xmx:KbJ5YYv73UJPWMr7tOvWehDYIC26ReNUVWJM6eUfNVZ7kIrCNftUsw>
    <xmx:KrJ5YdHJ82k9-oD4AqMOZ_Nz6UT2WLIQ1v7jxbbFwgKWmPbOPR7tBnAydD8>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Oct 2021 16:10:16 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
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
        Chen Feng <puck.chen@hisilicon.com>,
        dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
        Sean Paul <sean@poorly.run>, linux-samsung-soc@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Xinliang Liu <xinliang.liu@linaro.org>
Subject: Re: (subset) [PATCH v6 04/21] drm/bridge: anx7625: Register and attach our DSI device at probe
Date:   Wed, 27 Oct 2021 22:09:35 +0200
Message-Id: <163532324663.18245.8805629524058287692.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025151536.1048186-5-maxime@cerno.tech>
References: <20211025151536.1048186-1-maxime@cerno.tech> <20211025151536.1048186-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 25 Oct 2021 17:15:19 +0200, Maxime Ripard wrote:
> In order to avoid any probe ordering issue, the best practice is to move
> the secondary MIPI-DSI device registration and attachment to the
> MIPI-DSI host at probe time. Let's do this.
> 
> 

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
