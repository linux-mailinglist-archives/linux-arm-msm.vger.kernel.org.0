Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0622F7982FA
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Sep 2023 09:00:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230307AbjIHHA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Sep 2023 03:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233811AbjIHHA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Sep 2023 03:00:26 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9F5E1BD8
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Sep 2023 23:59:58 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426CC433CA;
        Fri,  8 Sep 2023 06:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694156398;
        bh=zbZ1I7JzmzE453M4flL7FQ8fpJujMB0sIcmHWS3u5BY=;
        h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
        b=VRuzso6N4nYp1eIKoN5VPAJpbswVbGZQ3MUYebMdiLjN6ffhy3tU0Upzx4BQtmyrT
         oBbGNHqehmxMsgqLOEX6nNoxV0cdnIprz2KrumXBW5GGUE/HRoO3HOA57UM2/xcoqS
         hC1U5Bb2UDITRrJV2ak/6h3PEbZq530Okjvk/+6MR+M4yimBq68prS1XSZ7ST9GB/h
         MF6JvpXepgVeknPkrPig7JPm51BAd+0qQNI5tuYh/ylB9LQFVSpi9rGzQorF+HURRP
         5vDruVJpxHDzppNCpn83Lmt2FmcYoZXLg4E1ivqMI8VKDNRC0/FQXO/1EirHNselER
         GgC+fIjRKBWSg==
Message-ID: <79decdf3b3d30c90467b6048a5928cf7.mripard@kernel.org>
Date:   Fri, 08 Sep 2023 06:59:55 +0000
From:   "Maxime Ripard" <mripard@kernel.org>
To:     "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/5] drm/msm: cleanup private obj handling
In-Reply-To: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
References: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org,
        "Abhinav Kumar" <quic_abhinavk@quicinc.com>,
        "Daniel Vetter" <daniel@ffwll.ch>,
        "David Airlie" <airlied@gmail.com>,
        "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
        "Maxime Ripard" <mripard@kernel.org>,
        "Rob Clark" <robdclark@gmail.com>,
        "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 8 Sep 2023 06:05:16 +0300, Dmitry Baryshkov wrote:
> While debugging one of the features in DRM/MSM I noticed that MSM
> subdrivers still wrap private object access with manual modeset locking.
> Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
> private objects") this is no longer required, as the DRM framework
> handles private objects internally. Drop these custom locks, while also
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
