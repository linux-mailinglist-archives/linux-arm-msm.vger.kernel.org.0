Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D16D6B4C8E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Mar 2023 17:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbjCJQRF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Mar 2023 11:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231509AbjCJQQj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Mar 2023 11:16:39 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96678E1BB
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 08:11:50 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id t11so7282763lfr.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Mar 2023 08:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678464706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgrrtVXcXoBhLHwYlL2ZmjJulTfMAxf2BJAvZD5H/sU=;
        b=kVCzvjeX96TdNxosuIrSFG5os1W065hthaq9nDITldNm8lJesKKkugkTSW4zO4pH1k
         TtVHvC0uQEGA51VyoaLbcfAcAftW42JLGYq3HJu7Tt+JkmOInELoeC+dHxJw69dwBu9H
         p2vLVqVH4oC0ZbM+QSlWtO0d6cbxsQPNt9PDi/yeOusnuy4qXQqs9RIhsfKJNS64aygI
         s1EVXxBOyG3gQf4wPJzYaKqYSBSPxGDmOSjUY7D5biEMSZ6HkBVV0QcLT80t8q76VbVK
         i9xNHjZjs536UToVWEsju6/lWEPVLriO/pzn+AjtmTsRSuEvAlbj86IFFj4qB8i7E7e1
         ubjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678464706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrrtVXcXoBhLHwYlL2ZmjJulTfMAxf2BJAvZD5H/sU=;
        b=Va6v+w3qQvwDHuK8rwWQ7jwLhjlgPdic6KNtZE3G7EW0yjh/qxYhS4K7XbsS8uBQNT
         RCD1f5No2cStzkS4fWqjyZuVs7jHqiidNvvxsFB9f1oWdypGEeR7fYtIeIPVoo7VVEEh
         lIG/WxOzi6jvd48kkwbUOZ6tLsyC20s9kQ/0Y5PUzXMCu4jePOM4CQ2pR3PYONMYO/Xz
         c87fK2Bv/Ztq7KX8JO67I2LkBztGQ59W0L/dSoivSu9qiTBwygXCOfrQs14mXR0Ykvtc
         Ai7g40ISxPwFUJ9tgiDWXJXD0MuB3oF/oG7YDjokIosjwgljT9IqM93ACFXBlgy9r1VY
         zx/A==
X-Gm-Message-State: AO0yUKUwtugXnWYGNcOab2PLuKFxt1BMvnHwbp14IeiqC1vWEld56b1+
        Ufzf8lDbtnTL04At926nc2MmoA==
X-Google-Smtp-Source: AK7set8J5jtfiYfv5YJAjgU7fZImKJYY+vgWRAuLrjMUdpQruM+6QMUBDqq1V6xNPdHM4ytZ9vNmNg==
X-Received: by 2002:ac2:50d6:0:b0:4b0:2a2f:ea6d with SMTP id h22-20020ac250d6000000b004b02a2fea6dmr7766049lfm.35.1678464706414;
        Fri, 10 Mar 2023 08:11:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512376f00b004d58bf6a61asm28800lft.230.2023.03.10.08.11.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 08:11:46 -0800 (PST)
Message-ID: <a3ef8bf7-8ed7-b9c3-e682-db26671b0d57@linaro.org>
Date:   Fri, 10 Mar 2023 18:11:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm: Use of_property_present() for testing DT property
 presence
Content-Language: en-GB
To:     Rob Herring <robh@kernel.org>, Liu Ying <victor.liu@nxp.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Emma Anholt <emma@anholt.net>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-sunxi@lists.linux.dev
References: <20230310144705.1542207-1-robh@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230310144705.1542207-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/03/2023 16:47, Rob Herring wrote:
> It is preferred to use typed property access functions (i.e.
> of_property_read_<type> functions) rather than low-level
> of_get_property/of_find_property functions for reading properties. As
> part of this, convert of_get_property/of_find_property calls to the
> recently added of_property_present() helper when we just want to test
> for presence of a property and nothing more.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c | 2 +-
>   drivers/gpu/drm/drm_mipi_dsi.c                  | 2 +-
>   drivers/gpu/drm/msm/adreno/adreno_gpu.c         | 2 +-

For msm part:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   drivers/gpu/drm/sun4i/sun4i_backend.c           | 2 +-
>   drivers/gpu/drm/sun4i/sun8i_mixer.c             | 2 +-
>   drivers/gpu/drm/vc4/vc4_hdmi.c                  | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
-- 
With best wishes
Dmitry

