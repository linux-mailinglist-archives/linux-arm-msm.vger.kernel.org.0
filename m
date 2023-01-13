Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C62A668A61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 04:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233122AbjAMDrj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 22:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230161AbjAMDrP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 22:47:15 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF97C63F55
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:47:09 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id z23so5010164uae.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 19:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F5kMETa20Qu6ItpxV0mRse3K5tdc5qHdZQS6loUXEaU=;
        b=d8+eaKnNtIc6jsYiCN8ZTh7gqDJjM88Kf3ah8AZCBMsYTpgZU89RLXonu1FKpofgA+
         9CH/ZN32AWtwx7aXOrzFKfE+/NpT8Z0oaOrO7zl7PG4ZopTWwA3zE4PIaSB0NR7rxsLx
         Krd+wVk59xews5gf24Fw1V1ijGIvLV7i4K+H4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5kMETa20Qu6ItpxV0mRse3K5tdc5qHdZQS6loUXEaU=;
        b=cbuILcc9MCZhkYaN4CAjfgBr8tezQUrPgB84stuKirTThF0k0exxfJNxSzR+EuCp0v
         +leu3KmUL/Hq41CpS5ifGsMiY3Ol5lWCcqEWQ6+pjvQbQfypCTHfwC0TA0vZvEeadnxY
         RcSeSWxb6o2DiU5eyYJS5U85O/PkK2cCFQ3OJza41pLrZsib1Igm3IzRSH3/GYzhQMfW
         tRyzEIZNXhdNo4JqUn8xXbaNn1LHBf+z1OYnOmp4UKTOgRiUdu9aRYj4I/FRRsk2UiFg
         c4P7I/m9kjPNra3Sp0IjM/uFjjVD0PhdiWI74pwdBGz6EPqXnsW9rsnOJufOODHZSk8W
         W21A==
X-Gm-Message-State: AFqh2koFtyMUPuoSlrcnmswYDMPE2qh5Rvl9sqOdJii8U2Cz6tg4TLj/
        1Lr3LOZiddmgGVUORmItBUhJ1DjwAK9fwkfSa8KJHw==
X-Google-Smtp-Source: AMrXdXsXZJKVVo/KQ9p2ZM6nSQrHOBcqSGOkt1Pm90Ty82zbmAubYOiRCLTCA0PcVoTkeioT7Thg0WbtxYDMgHu0Xgs=
X-Received: by 2002:a9f:3189:0:b0:4c7:b2c7:d054 with SMTP id
 v9-20020a9f3189000000b004c7b2c7d054mr7782247uad.97.1673581628987; Thu, 12 Jan
 2023 19:47:08 -0800 (PST)
MIME-Version: 1.0
References: <20230112154247.1532202-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230112154247.1532202-1-dmitry.baryshkov@linaro.org>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 13 Jan 2023 11:46:57 +0800
Message-ID: <CAGXv+5ExVciOk2JfbweQc5+4rvqAJOiLx0W1ApA3T7pEK6rj6A@mail.gmail.com>
Subject: Re: [PATCH] drm/probe_helper: sort out poll_running vs poll_enabled
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        freedreno@lists.freedesktop.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>,
        dri-devel@lists.freedesktop.org,
        Stephen Boyd <swboyd@chromium.org>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 12, 2023 at 11:42 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> There are two flags attemting to guard connector polling:
> poll_enabled and poll_running. While poll_enabled semantics is clearly
> defined and fully adhered (mark that drm_kms_helper_poll_init() was
> called and not finalized by the _fini() call), the poll_running flag
> doesn't have such clearliness.
>
> This flag is used only in drm_helper_probe_single_connector_modes() to
> guard calling of drm_kms_helper_poll_enable, it doesn't guard the
> drm_kms_helper_poll_fini(), etc. Change it to only be set if the polling
> is actually running. Tie HPD enablement to this flag.
>
> This fix the following warning reported after merging the HPD series:
>
> Hot plug detection already enabled
> WARNING: CPU: 2 PID: 9 at drivers/gpu/drm/drm_bridge.c:1257 drm_bridge_hpd_enable+0x94/0x9c [drm]
> Modules linked in: videobuf2_memops snd_soc_simple_card snd_soc_simple_card_utils fsl_imx8_ddr_perf videobuf2_common snd_soc_imx_spdif adv7511 etnaviv imx8m_ddrc imx_dcss mc cec nwl_dsi gov
> CPU: 2 PID: 9 Comm: kworker/u8:0 Not tainted 6.2.0-rc2-15208-g25b283acd578 #6
> Hardware name: NXP i.MX8MQ EVK (DT)
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : drm_bridge_hpd_enable+0x94/0x9c [drm]
> lr : drm_bridge_hpd_enable+0x94/0x9c [drm]
> sp : ffff800009ef3740
> x29: ffff800009ef3740 x28: ffff000009331f00 x27: 0000000000001000
> x26: 0000000000000020 x25: ffff800001148ed8 x24: ffff00000a8fe000
> x23: 00000000fffffffd x22: ffff000005086348 x21: ffff800001133ee0
> x20: ffff00000550d800 x19: ffff000005086288 x18: 0000000000000006
> x17: 0000000000000000 x16: ffff8000096ef008 x15: 97ffff2891004260
> x14: 2a1403e194000000 x13: 97ffff2891004260 x12: 2a1403e194000000
> x11: 7100385f29400801 x10: 0000000000000aa0 x9 : ffff800008112744
> x8 : ffff000000250b00 x7 : 0000000000000003 x6 : 0000000000000011
> x5 : 0000000000000000 x4 : ffff0000bd986a48 x3 : 0000000000000001
> x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000000250000
> Call trace:
>  drm_bridge_hpd_enable+0x94/0x9c [drm]
>  drm_bridge_connector_enable_hpd+0x2c/0x3c [drm_kms_helper]
>  drm_kms_helper_poll_enable+0x94/0x10c [drm_kms_helper]
>  drm_helper_probe_single_connector_modes+0x1a8/0x510 [drm_kms_helper]
>  drm_client_modeset_probe+0x204/0x1190 [drm]
>  __drm_fb_helper_initial_config_and_unlock+0x5c/0x4a4 [drm_kms_helper]
>  drm_fb_helper_initial_config+0x54/0x6c [drm_kms_helper]
>  drm_fbdev_client_hotplug+0xd0/0x140 [drm_kms_helper]
>  drm_fbdev_generic_setup+0x90/0x154 [drm_kms_helper]
>  dcss_kms_attach+0x1c8/0x254 [imx_dcss]
>  dcss_drv_platform_probe+0x90/0xfc [imx_dcss]
>  platform_probe+0x70/0xcc
>  really_probe+0xc4/0x2e0
>  __driver_probe_device+0x80/0xf0
>  driver_probe_device+0xe0/0x164
>  __device_attach_driver+0xc0/0x13c
>  bus_for_each_drv+0x84/0xe0
>  __device_attach+0xa4/0x1a0
>  device_initial_probe+0x1c/0x30
>  bus_probe_device+0xa4/0xb0
>  deferred_probe_work_func+0x90/0xd0
>  process_one_work+0x200/0x474
>  worker_thread+0x74/0x43c
>  kthread+0xfc/0x110
>  ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
>
> Reported-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Fixes: c8268795c9a9 ("drm/probe-helper: enable and disable HPD on connectors")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

on multiple MediaTek-based Chromebooks.
