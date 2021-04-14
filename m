Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFF035FCF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Apr 2021 23:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhDNVKV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 17:10:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229875AbhDNVKU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 17:10:20 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B213C061756
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 14:09:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id z22so5722247plo.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Apr 2021 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=XUvEjx9oD+o9hXej8wFRxK1F3qgbozxnuSdrWd2xpgI=;
        b=D2A9kqVTe/moJOZjuMVQFpDyVvkfac9TvaUNuCYOtTDV9K+RZvk3kfLq/SynNJyPfO
         lFeEoFc3Ur5Qcw7KuYPpt5mOnjJTctQIbwRrVJPo1y6Mg5IJb2Umtvh9qAJqui6aCV/S
         4s7sD0Enom1zEr7SOGdDNsAesHWWg3RKpK6f0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=XUvEjx9oD+o9hXej8wFRxK1F3qgbozxnuSdrWd2xpgI=;
        b=WXIojza+QXUsDEBjsJIq3XeyIrnRtD1UawmWN+IGdwcBYbc+ror0d4JJrqArKw+Dl6
         1FzDhOrLCfH2Sk56A16ZPU/YzovIgCP2otcGea0mlf8OfBSImBngU4Wbr2i1FY+LUerX
         Cec/fwdJ0oKd0nvsRB5HK012FYbavyIDHlSLC+GTNKxDqKjfCQGXP7nMavbDjrEFevbU
         84kJrgaRk+M2U4P+QxCeYLuDO5r/uE+62UulhgsL/NwRXt2kl5gq7c2SG730JDGFf6uc
         m5ZoJQ24usTti7Gtp1AknmQuAwgxGe7FXAFt+vouf+JshEHdNXM179+8TRh/Ab6ITus1
         gLAg==
X-Gm-Message-State: AOAM5316VzcETazH5bgfEs9wdawpvDDyMrctGV7vT4FJrAwrynxaShRx
        LAgCIpdzzepH/FsrbfRK88gNPg==
X-Google-Smtp-Source: ABdhPJyLdprVA+RHvHefmzwZ02g2RSj3jvVTfeyAqpxEnX8Z3stwk65vqAm8Skr/d/2SV1J+OJU2IA==
X-Received: by 2002:a17:90a:ff06:: with SMTP id ce6mr100952pjb.204.1618434596539;
        Wed, 14 Apr 2021 14:09:56 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:753e:814e:f002:498a])
        by smtp.gmail.com with ESMTPSA id v11sm383741pgg.68.2021.04.14.14.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 14:09:56 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start aux read
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     tanmay@codeaurora.org, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, khsieh@codeaurora.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
To:     Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com,
        sean@poorly.run
Date:   Wed, 14 Apr 2021 14:09:54 -0700
Message-ID: <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Kuogee Hsieh (2021-04-13 16:11:44)
> Make sure main link is in connection state before start aux
> read/write operation to avoid unnecessary long delay due to
> main link had been unplugged.
>=20
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c  |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_link.c | 20 +++++++++++++++-----
>  2 files changed, 20 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_=
aux.c
> index 7c22bfe..fae3806 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp=
_aux,
> =20
>         mutex_lock(&aux->mutex);
> =20
> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> +               ret =3D -ETIMEDOUT;
> +               goto unlock_exit;
> +       }

I get a crash here sometimes when plugging and unplugging an apple HDMI
dongle during suspend/resume. I guess device power management
(dp_pm_suspend()) is happening in parallel with aux transfers from the
kthread. Why doesn't the aux communication start reporting NAKs once the
cable is disconnected?

[  366.210058] hdmi-audio-codec hdmi-audio-codec.15.auto: calling platform_=
pm_suspend+0x0/0x60 @ 7175, parent: ae90000.displayport-controller
[  366.222825] hdmi-audio-codec hdmi-audio-codec.15.auto: platform_pm_suspe=
nd+0x0/0x60 returned 0 after 1 usecs
[  366.232939] msm-dp-display ae90000.displayport-controller: calling dp_pm=
_suspend+0x0/0x80 @ 7175, parent: ae00000.mdss
[  366.244006] msm-dp-display ae90000.displayport-controller: dp_pm_suspend=
+0x0/0x80 returned 0 after 79 usecs
[  366.254025] msm_dsi ae94000.dsi: calling pm_runtime_force_suspend+0x0/0x=
b4 @ 7175, parent: ae00000.mdss
[  366.263669] msm_dsi ae94000.dsi: pm_runtime_force_suspend+0x0/0xb4 retur=
ned 0 after 0 usecs
[  366.272290] panel-simple panel: calling platform_pm_suspend+0x0/0x60 @ 7=
175, parent: platform
[  366.272501] ti_sn65dsi86 2-002d: calling pm_runtime_force_suspend+0x0/0x=
b4 @ 176, parent: i2c-2
[  366.281055] panel-simple panel: platform_pm_suspend+0x0/0x60 returned 0 =
after 0 usecs
[  366.281081] leds mmc1::: calling led_suspend+0x0/0x4c @ 7175, parent: 7c=
4000.sdhci
[  366.290065] ti_sn65dsi86 2-002d: pm_runtime_force_suspend+0x0/0xb4 retur=
ned 0 after 0 usecs
[  366.298046] leds mmc1::: led_suspend+0x0/0x4c returned 0 after 1 usecs
[  366.302994] Internal error: synchronous external abort: 96000010 [#1] PR=
EEMPT SMP
[  366.303006] Modules linked in: vhost_vsock vmw_vsock_virtio_transport_co=
mmon vsock vhost rfcomm algif_hash algif_skcipher af_alg xt_cgroup uinput x=
t_MASQUERADE venus_enc hci_uart venus_dec btqca cros_ec_typec typec bluetoo=
th qcom_spmi_adc5 snd_soc_sc7180 qcom_spmi_temp_alarm ecdh_generic qcom_spm=
i_adc_tm5 qcom_vadc_common snd_soc_qcom_common ecc snd_soc_rt5682_i2c snd_s=
oc_rt5682 snd_soc_rl6231 venus_core v4l2_mem2mem snd_soc_lpass_sc7180 snd_s=
oc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_platform snd_soc_max98357a fu=
se iio_trig_sysfs cros_ec_sensors cros_ec_sensors_ring cros_ec_lid_angle cr=
os_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhu=
b lzo_rle lzo_compress zram ath10k_snoc ath10k_core ath mac80211 cfg80211 c=
dc_ether usbnet r8152 mii uvcvideo videobuf2_vmalloc joydev
[  366.303211] CPU: 0 PID: 224 Comm: dp_hpd_handler Not tainted 5.4.109 #27
[  366.303216] Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
[  366.303225] pstate: 60c00009 (nZCv daif +PAN +UAO)
[  366.303234] pc : dp_catalog_link_is_connected+0x20/0x34
[  366.303244] lr : dp_aux_transfer+0x44/0x284
[  366.303250] sp : ffffffc011bfbbe0
[  366.303254] x29: ffffffc011bfbbe0 x28: aaaaaaaaaaaaaaaa=20
[  366.303262] x27: 000000000000000c x26: ffffff896f8212bc=20
[  366.303269] x25: 0000000000000001 x24: 0000000000000001=20
[  366.303275] x23: 0000000000000020 x22: ffffff896ff82118=20
[  366.303282] x21: ffffffc011bfbc50 x20: ffffff896ff82090=20
[  366.303289] x19: ffffff896ffc3598 x18: 0000000000000000=20
[  366.303295] x17: 0000000000000000 x16: 0000000000000001=20
[  366.303303] x15: 0000000000000000 x14: 00000000000002ef=20
[  366.303311] x13: 0000000000000400 x12: ffffffeb896ea060=20
[  366.303317] x11: 0000000000000000 x10: 0000000000000000=20
[  366.303324] x9 : ffffff896f061100 x8 : ffffffc010582204=20
[  366.303331] x7 : 000000b2b5593519 x6 : 00000000003033ff=20
[  366.303338] x5 : 0000000000000000 x4 : 0000000000000001=20
[  366.303345] x3 : ffffff896ff432a1 x2 : 0000000000000000=20
[  366.303352] x1 : 0000000000000119 x0 : ffffff896ffc3598=20
[  366.303360] Call trace:
[  366.303367]  dp_catalog_link_is_connected+0x20/0x34
[  366.303374]  dp_aux_transfer+0x44/0x284
[  366.303387]  drm_dp_dpcd_access+0x8c/0x11c
[  366.303393]  drm_dp_dpcd_read+0x64/0x10c
[  366.303399]  dp_link_process_request+0x94/0xaf8
[  366.303405]  dp_display_usbpd_attention_cb+0x38/0x140
[  366.303411]  hpd_event_thread+0x3f0/0x48c
[  366.303426]  kthread+0x140/0x17c
[  366.303439]  ret_from_fork+0x10/0x18
[  366.303458] Code: d503201f f85f0268 f9400508 91081108 (b9400108)=20

> +
>         aux->native =3D msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATI=
VE_READ);
> =20
>         /* Ignore address only message */
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp=
_link.c
> index be986da..d35b18e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct dp_link =
*dp_link)
>         return 0;
>  }
> =20
> -static void dp_link_parse_sink_status_field(struct dp_link_private *link)
> +static int dp_link_parse_sink_status_field(struct dp_link_private *link)
>  {
>         int len =3D 0;
> =20
>         link->prev_sink_count =3D link->dp_link.sink_count;
> -       dp_link_parse_sink_count(&link->dp_link);
> +       len =3D dp_link_parse_sink_count(&link->dp_link);
> +       if (len < 0) {
> +               DRM_ERROR("DP lparse sink count failed\n");

Is it 'lparse' on purpose?

> +               return len;
> +       }
> =20
>         len =3D drm_dp_dpcd_read_link_status(link->aux,
>                 link->link_status);
> -       if (len < DP_LINK_STATUS_SIZE)
> +       if (len < DP_LINK_STATUS_SIZE) {
>                 DRM_ERROR("DP link status read failed\n");
> -       dp_link_parse_request(link);
> +               return len;
> +       }
> +
> +       return dp_link_parse_request(link);
>  }
> =20
>  /**
> @@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link *dp_lin=
k)
> =20
>         dp_link_reset_data(link);
> =20
> -       dp_link_parse_sink_status_field(link);
> +       ret =3D dp_link_parse_sink_status_field(link);
> +       if (ret) {
> +               return ret;
> +       }
> =20
>         if (link->request.test_requested =3D=3D DP_TEST_LINK_EDID_READ) {
>                 dp_link->sink_request |=3D DP_TEST_LINK_EDID_READ;

These are probably good fixes on their own given that
dp_link_parse_sink_count() can return an error and that was being
ignored.
