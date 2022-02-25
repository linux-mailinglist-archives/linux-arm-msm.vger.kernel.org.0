Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7468D4C4BCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Feb 2022 18:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238376AbiBYRPk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Feb 2022 12:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238153AbiBYRPj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Feb 2022 12:15:39 -0500
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F9F210D6A
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Feb 2022 09:15:06 -0800 (PST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 055605801FE;
        Fri, 25 Feb 2022 12:15:04 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Fri, 25 Feb 2022 12:15:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=iUgs2R/IwLQZ5n
        lNE4MGZv9HXqqJZHvXl5mJ7B8lu5o=; b=oRmvCz91/PJg9Rrmhvsz7HwPGdd26O
        QMm32XzeRYouAgJxLugPxt4AxVypPIKBP+sV1msLK7FHeJcNqjsoJZj6EEpDlSbu
        fGrbeILuEzO80Ejx9TGU7Du0i4LPvmpmPdrfC3fRNJ4hWU4XBf6Km/Ya3qdbs2Wp
        L4+YN2ZgOfVKeQWLNQSKPwerQHumRbc72w3xpNCnY8J5bEQ/KvL/5H9z7ng/7Rhb
        p/Qa1X+ktYxkNnGNZU8riC5ELQXEP1cLgDBF9p/sB9zr04So/wvVQYwOZRjSOLmN
        kJv0G2C/v97I6LcYSTUYxi/nJyA9xStJsC93KHXLY8b33QZmSvbvZBuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=iUgs2R/IwLQZ5nlNE4MGZv9HXqqJZHvXl5mJ7B8lu
        5o=; b=T1iiqR/uxNXc8cIfG6kBDNrAwcOXxXF3KGDcPJEgbXvmaOOlyG0Cn6AWF
        8iq2YshO0GKQLioCHRhbSwmZd+L3jCx2FE0hKIyGLYKCOr0TaMIz1BpFzFos8GH4
        1TbbXKJg14BCk/g00YLmtLaDr4+7AZPJPtFf4pb1+Jyhs9GiQbyAyoEATBQjFkRW
        wUj94bP8EmZBiL72HmCohVsy2MssuKDPNm+tvG39GjElz/VNJz2vs3kVjSodRXt/
        tJ9X5XPQqe7ND3h0Obw8lIosBoIX/59QOTJds2rjlS7bbj1jca61XrbP99/11Mx8
        ZUxZ1SG4Wpa+nXUfDXpleFzU9lkAw==
X-ME-Sender: <xms:lg4ZYjxhBO7JhE7TKGxyWlfmalvHiOXT9KZsLHNsn86q7kYKyjmB3w>
    <xme:lg4ZYrRqfzq6IjH1bJsIefBKwfK_KFVDI0uahv8L6F_jTPc9-rpKNkLhdQ4X7SPFx
    3_78smvJKoyxRmc-Uw>
X-ME-Received: <xmr:lg4ZYtV-bs9ZtwBSMtHOXZ2UjXfsTTJXsiThf04jPpoNHXFpPxf8CGQizARa7lcENS8Lk2ljcJu8g3VegXqbHouMGzoybbni-HJcDwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdellecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepjeeugfegkeffgfeuvedtvddufffhjeffjeejvddvudduteehhfefhfefgeei
    keeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:lw4ZYtjKPn9UdvYvxOJrr1nRiiOSqOQPhaXWqqszTD5G-QOW2-q6QA>
    <xmx:lw4ZYlAyXiNcGM6ouRj99KDwqgZKdC6UooVpTmwMMtDVs7naPxwoHw>
    <xmx:lw4ZYmLo9fKhutur7r3Z_i_FFM1ttRFQDVDwKZdhLb_oRWL_AjIDWw>
    <xmx:mA4ZYtbH8qFZSS710j8-LVax9tjlrNipMqW4ck3WguOBrUnLp0kVKw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 12:15:02 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel.vetter@intel.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Rob Clark <robdclark@gmail.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dom Cobley <dom@raspberrypi.com>, Sean Paul <sean@poorly.run>
Subject: Re: (subset) [PATCH v2 12/22] drm/msm/mdp5: Remove redundant zpos initialisation
Date:   Fri, 25 Feb 2022 18:14:43 +0100
Message-Id: <164580928297.726994.399905348574066667.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-13-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech> <20220221095918.18763-13-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, 21 Feb 2022 10:59:08 +0100, Maxime Ripard wrote:
> The mdp KMS driver will call drm_plane_create_zpos_property() with an
> init value depending on the plane purpose.
> 
> Since the initial value wasn't carried over in the state, the driver had
> to set it again in mdp5_plane_reset(). However, the helpers have been
> adjusted to set it properly at reset, so this is not needed anymore.
> 
> [...]

Applied to drm/drm-misc (drm-misc-next).

Thanks!
Maxime
