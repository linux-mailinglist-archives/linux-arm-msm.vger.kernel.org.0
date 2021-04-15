Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E058F361347
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 22:06:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235215AbhDOUGz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 16:06:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbhDOUGz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 16:06:55 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 476B1C061756
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 13:06:32 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id b17so17658638pgh.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Apr 2021 13:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=jH5Y/jYiEd8BAumb39ZSp62akhKfkF4oHbg7bRC1GB4=;
        b=dcWnDgjfU9wvJxYW2dGJbSe4i9kziLHnpYjXLcucn8o+tUW0XBfkt95r97vw/Jop4F
         pHE2zGd+8GjQ7MKmj3YXAHXnrO48Fj5v9zSZvpNeGQUFQRjUFC0tZWKnF/hBY/0F2eNY
         aLU7hvMgvdb1aFKQJsSQ54RiyRz8tkel3Mfik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=jH5Y/jYiEd8BAumb39ZSp62akhKfkF4oHbg7bRC1GB4=;
        b=pkeSTI3sQQXbLMwdyATOun3bEgPaxk3JwvO2LZ7Kzbgn3x7sXBx/tT2uAkll06msyk
         QKjkxYIBtPo/xvd1GGb+GYydkLj5npiBzetcGW1HpNnGu2QP1gNNSxBOYbd0xkEdlKGG
         wJkBKATD76vbls58FzhLTxG4U3zY9kja1qZEuI0o027Gs6GSsgLvL/qyCZozWZkT4Yc+
         10QKWTp711IZGHmTbPJOXFxxGvsCYbjquXnXVzmY4e1ntrToOn5JMFfyfw9l2HOMHRFd
         xxiBC7xDAs8+2pwneNldMDPhc+Y8TgBBaNm5oHq917FvqJn3wU5sDCSJ594Hcg/uCr6e
         pADA==
X-Gm-Message-State: AOAM532Dhnqz8Ixibns97RSzDYs1VKrH8LBqDC1FppJSSxHW+2rGXYMk
        8nOnXkI3qQOr/o22aRe/5L0isg==
X-Google-Smtp-Source: ABdhPJz2SgWpsvyQk8G7qt6TDFndYoqrUnLYgkQSF+gDSeTaUnxRbjIpKMh6Lc+N4LSkNgVW7NykHQ==
X-Received: by 2002:a63:1b10:: with SMTP id b16mr4894813pgb.308.1618517191654;
        Thu, 15 Apr 2021 13:06:31 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1ddc:37d8:5171:510d])
        by smtp.gmail.com with ESMTPSA id e1sm3058109pgl.25.2021.04.15.13.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 13:06:31 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org> <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com> <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org>
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start aux read
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
To:     khsieh@codeaurora.org
Date:   Thu, 15 Apr 2021 13:06:29 -0700
Message-ID: <161851718969.46595.12896385877607476879@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting khsieh@codeaurora.org (2021-04-15 10:37:29)
> On 2021-04-14 14:09, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-04-13 16:11:44)
> >> Make sure main link is in connection state before start aux
> >> read/write operation to avoid unnecessary long delay due to
> >> main link had been unplugged.
> >>=20
> >> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> >> ---
> >>  drivers/gpu/drm/msm/dp/dp_aux.c  |  5 +++++
> >>  drivers/gpu/drm/msm/dp/dp_link.c | 20 +++++++++++++++-----
> >>  2 files changed, 20 insertions(+), 5 deletions(-)
> >>=20
> >> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c=20
> >> b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> index 7c22bfe..fae3806 100644
> >> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> >> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> >> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux =

> >> *dp_aux,
> >>=20
> >>         mutex_lock(&aux->mutex);
> >>=20
> >> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
> >> +               ret =3D -ETIMEDOUT;
> >> +               goto unlock_exit;
> >> +       }
> >=20
> > I get a crash here sometimes when plugging and unplugging an apple HDMI
> > dongle during suspend/resume. I guess device power management
> > (dp_pm_suspend()) is happening in parallel with aux transfers from the
> > kthread. Why doesn't the aux communication start reporting NAKs once=20
> > the
> > cable is disconnected?
> >=20
> > [  366.210058] hdmi-audio-codec hdmi-audio-codec.15.auto: calling
> > platform_pm_suspend+0x0/0x60 @ 7175, parent:
> > ae90000.displayport-controller
> > [  366.222825] hdmi-audio-codec hdmi-audio-codec.15.auto:
> > platform_pm_suspend+0x0/0x60 returned 0 after 1 usecs
> > [  366.232939] msm-dp-display ae90000.displayport-controller: calling
> > dp_pm_suspend+0x0/0x80 @ 7175, parent: ae00000.mdss
> > [  366.244006] msm-dp-display ae90000.displayport-controller:
> > dp_pm_suspend+0x0/0x80 returned 0 after 79 usecs
> > [  366.254025] msm_dsi ae94000.dsi: calling
> > pm_runtime_force_suspend+0x0/0xb4 @ 7175, parent: ae00000.mdss
> > [  366.263669] msm_dsi ae94000.dsi: pm_runtime_force_suspend+0x0/0xb4
> > returned 0 after 0 usecs
> > [  366.272290] panel-simple panel: calling
> > platform_pm_suspend+0x0/0x60 @ 7175, parent: platform
> > [  366.272501] ti_sn65dsi86 2-002d: calling
> > pm_runtime_force_suspend+0x0/0xb4 @ 176, parent: i2c-2
> > [  366.281055] panel-simple panel: platform_pm_suspend+0x0/0x60
> > returned 0 after 0 usecs
> > [  366.281081] leds mmc1::: calling led_suspend+0x0/0x4c @ 7175,
> > parent: 7c4000.sdhci
> > [  366.290065] ti_sn65dsi86 2-002d: pm_runtime_force_suspend+0x0/0xb4
> > returned 0 after 0 usecs
> > [  366.298046] leds mmc1::: led_suspend+0x0/0x4c returned 0 after 1=20
> > usecs
> > [  366.302994] Internal error: synchronous external abort: 96000010
> > [#1] PREEMPT SMP
> > [  366.303006] Modules linked in: vhost_vsock
> > vmw_vsock_virtio_transport_common vsock vhost rfcomm algif_hash
> > algif_skcipher af_alg xt_cgroup uinput xt_MASQUERADE venus_enc
> > hci_uart venus_dec btqca cros_ec_typec typec bluetooth qcom_spmi_adc5
> > snd_soc_sc7180 qcom_spmi_temp_alarm ecdh_generic qcom_spmi_adc_tm5
> > qcom_vadc_common snd_soc_qcom_common ecc snd_soc_rt5682_i2c
> > snd_soc_rt5682 snd_soc_rl6231 venus_core v4l2_mem2mem
> > snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu
> > snd_soc_lpass_platform snd_soc_max98357a fuse iio_trig_sysfs
> > cros_ec_sensors cros_ec_sensors_ring cros_ec_lid_angle
> > cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf
> > cros_ec_sensorhub lzo_rle lzo_compress zram ath10k_snoc ath10k_core
> > ath mac80211 cfg80211 cdc_ether usbnet r8152 mii uvcvideo
> > videobuf2_vmalloc joydev
> > [  366.303211] CPU: 0 PID: 224 Comm: dp_hpd_handler Not tainted 5.4.109=
=20
> > #27
> > [  366.303216] Hardware name: Google Lazor (rev3+) with KB Backlight=20
> > (DT)
> > [  366.303225] pstate: 60c00009 (nZCv daif +PAN +UAO)
> > [  366.303234] pc : dp_catalog_link_is_connected+0x20/0x34
> > [  366.303244] lr : dp_aux_transfer+0x44/0x284
> > [  366.303250] sp : ffffffc011bfbbe0
> > [  366.303254] x29: ffffffc011bfbbe0 x28: aaaaaaaaaaaaaaaa
> > [  366.303262] x27: 000000000000000c x26: ffffff896f8212bc
> > [  366.303269] x25: 0000000000000001 x24: 0000000000000001
> > [  366.303275] x23: 0000000000000020 x22: ffffff896ff82118
> > [  366.303282] x21: ffffffc011bfbc50 x20: ffffff896ff82090
> > [  366.303289] x19: ffffff896ffc3598 x18: 0000000000000000
> > [  366.303295] x17: 0000000000000000 x16: 0000000000000001
> > [  366.303303] x15: 0000000000000000 x14: 00000000000002ef
> > [  366.303311] x13: 0000000000000400 x12: ffffffeb896ea060
> > [  366.303317] x11: 0000000000000000 x10: 0000000000000000
> > [  366.303324] x9 : ffffff896f061100 x8 : ffffffc010582204
> > [  366.303331] x7 : 000000b2b5593519 x6 : 00000000003033ff
> > [  366.303338] x5 : 0000000000000000 x4 : 0000000000000001
> > [  366.303345] x3 : ffffff896ff432a1 x2 : 0000000000000000
> > [  366.303352] x1 : 0000000000000119 x0 : ffffff896ffc3598
> > [  366.303360] Call trace:
> > [  366.303367]  dp_catalog_link_is_connected+0x20/0x34
> > [  366.303374]  dp_aux_transfer+0x44/0x284
> > [  366.303387]  drm_dp_dpcd_access+0x8c/0x11c
> > [  366.303393]  drm_dp_dpcd_read+0x64/0x10c
> > [  366.303399]  dp_link_process_request+0x94/0xaf8
> > [  366.303405]  dp_display_usbpd_attention_cb+0x38/0x140
> > [  366.303411]  hpd_event_thread+0x3f0/0x48c
> > [  366.303426]  kthread+0x140/0x17c
> > [  366.303439]  ret_from_fork+0x10/0x18
> > [  366.303458] Code: d503201f f85f0268 f9400508 91081108 (b9400108)
> >=20
> it needs to make sure core clock enabled before access dp ctrl registers
> I am look into it

Is it really necessary to have this patch at all? I think there are
bigger problems with suspend/resume of the DP driver in relation to the
kthread stopping. I hope that the aux channel would start NAKing
transfers once the cable is disconnected too, so that we don't need to
do an extra check for each aux transfer.
