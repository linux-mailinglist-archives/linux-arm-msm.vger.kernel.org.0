Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47B2E666E70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jan 2023 10:41:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239924AbjALJlW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Jan 2023 04:41:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239962AbjALJkn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Jan 2023 04:40:43 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C3013D18
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:36:14 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id v25so27546448lfe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jan 2023 01:36:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U+H4r/exaxLZYtbHsCS7HbU9Fue66yphf1NkdC8hcHo=;
        b=qSO7IRdt41/NKUd9BGQbJxXGJRefyGe7meFWAvTqtCEept3q8Gc06J4ocxl9Fn1hdB
         5hgPB06ZVPHs+/forhCn+wUMCj+qhvl8ahZLQ003EMtjH0xFMnZq8uLHhGRL41UXYy4F
         Pu0FpN5WGdKebtgbsQsaNQhrgmb3eJoiOY8sSmgdkbttNg2bMhGvtCFk8J0/UUcEVscG
         tI51AEsRP0la1E9Wnbd5nSLDGQVtG/xIO5g0LnhgluKwfJyZbdEi94sJ6fvVT57brg2b
         ftcQKljYKKQyp0DX7g0gIGxIlSoEy5uKC4B3uyn5xmXVRJE7iaGyPDRVoNa8mBZ9afH/
         tlFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U+H4r/exaxLZYtbHsCS7HbU9Fue66yphf1NkdC8hcHo=;
        b=O2ZxC1CeYUKQk1Su227E1IJGhZvFo1/AAC4f78rTuBbIee6IV/ALYGfhuha3RNMJs0
         SjxDOgfi9MDsGFX3MyNPJOu3BjUwRKYZqZaesTySBUOl2fpuzmqIrBzzSTgeer740gdi
         f/ZUFB7nLaj8BYXUx3EZYphGgSLJdCPaZm41ySuy96l7fBeyLJivlSAVT5OZkiwMqJje
         0IYzF35isNf+FsivO199AE+hX6Ibi2RnULjSxtp+mdlwoundM9l2s/JsQtU5kUVq8mix
         MIMmByV8f6s7Ec85Fccy35w9klZIxGKh2Z/wwcEqSE/Yc5QjA81lOamu9j6zcDeaBHfi
         uwxA==
X-Gm-Message-State: AFqh2kopCnv1GKk1xO1VwMjk+XKl4wdackt89+PxAE/NV75QkiFVMZfD
        0RUbYnG01aKH1mpba/l2sefVm4X4dk7k6EQL
X-Google-Smtp-Source: AMrXdXt63NWqcBUwOlmjqu+gRqgGqY4uXX5P+HpkI+0qNeAzpgpyJ4OBdtQEEGJABf454vdCAiO/dg==
X-Received: by 2002:a05:6512:6d4:b0:4cb:1e1:f380 with SMTP id u20-20020a05651206d400b004cb01e1f380mr20737798lff.40.1673516172708;
        Thu, 12 Jan 2023 01:36:12 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c28-20020a056512239c00b0049ad2619becsm3171875lfv.131.2023.01.12.01.36.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:36:12 -0800 (PST)
Message-ID: <a11d3c82-1be5-2185-4ff1-48dd54ce9a55@linaro.org>
Date:   Thu, 12 Jan 2023 11:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [v3,3/7] drm/bridge_connector: rely on drm_kms_helper_poll_* for
 HPD enablement
Content-Language: en-GB
To:     neil.armstrong@linaro.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Tomi Valkeinen <tomba@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org
References: <20221102180705.459294-4-dmitry.baryshkov@linaro.org>
 <CGME20230111124140eucas1p21242c8b4cb0fc8a994d66827ca76a3ee@eucas1p2.samsung.com>
 <a3f59ce3-8426-2af0-4663-ee948490d75c@samsung.com>
 <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c7a6714c-edcc-fa1c-ff83-2e066c7bbd84@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/01/2023 11:35, Neil Armstrong wrote:
> On 11/01/2023 13:41, Marek Szyprowski wrote:
>> On 02.11.2022 19:07, Dmitry Baryshkov wrote:
>>> Use drm_connector's helpers enable_hpd and disable_hpd to enable and
>>> disable HPD automatically by the means of drm_kms_helper_poll_*
>>> functions. As the drm_bridge_connector_enable_hpd() and
>>> drm_bridge_connector_disable_hpd() functions are now unused, replace
>>> them with stubs to ease driver migration.
>>>
>>> Enabling the HPD from drm_bridge_connector_init() can happen too early,
>>> before the driver is prepared to handle HPD events. As the
>>> drm_bridge_connector_enable_hpd() is empty anyway, drop this call
>>> anyway.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>
>> This patch, merged to recent linux-next as commit 92d755d8f13b
>> ("drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD
>> enablement"), triggers the following warning on all my Amlogic Meson
>> based boards:
>>
>> ------------[ cut here ]------------
>> Hot plug detection already enabled
>> WARNING: CPU: 2 PID: 285 at drivers/gpu/drm/drm_bridge.c:1257
>> drm_bridge_hpd_enable+0x90/0xa0
>> Modules linked in: snd_soc_meson_axg_frddr snd_soc_meson_axg_fifo
>> dwmac_generic panfrost(+) reset_meson_audio_arb(+) drm_shmem_helper
>> meson_dw_hdmi(+) dw_hdmi rc_odroid drm_display_helper meson_ir(+)
>> gpu_sched meson_rng rng_core meson_gxbb_wdt crct10dif_ce dwmac_meson8b
>> stmmac_platform snd_soc_meson_axg_sound_card snd_soc_meson_card_utils
>> mdio_mux_meson_g12a stmmac meson_drm pwm_meson pcs_xpcs meson_canvas
>> snd_soc_meson_axg_tdm_interface rtc_meson_vrtc
>> snd_soc_meson_axg_tdm_formatter nvmem_meson_efuse display_connector
>> CPU: 2 PID: 285 Comm: systemd-udevd Not tainted 6.1.0-rc6+ #13236
>> Hardware name: Hardkernel ODROID-C4 (DT)
>> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : drm_bridge_hpd_enable+0x90/0xa0
>> lr : drm_bridge_hpd_enable+0x90/0xa0
>> ...
>> Call trace:
>>    drm_bridge_hpd_enable+0x90/0xa0
>>    _drm_bridge_connector_enable_hpd+0x24/0x34
> 
> Weird because _drm_bridge_connector_enable_hpd() has been removed with
> 4c00ac500d0e ("drm/bridge_connector: drop 
> drm_bridge_connector_en/disable_hpd()")
> 
> 
>>    drm_kms_helper_poll_enable.part.0+0x50/0xd0
> 
> It seems drm_kms_helper_poll_enable is called again by
> drm_helper_probe_single_connector_modes() because poll_running isn't set.

Yes, I'm currently reworking poll_running handling. I hope to post a 
patch today.

-- 
With best wishes
Dmitry

