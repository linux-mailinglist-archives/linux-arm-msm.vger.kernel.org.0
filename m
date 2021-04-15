Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26031361132
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 19:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbhDORiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Apr 2021 13:38:04 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:28165 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233589AbhDORiE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Apr 2021 13:38:04 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618508261; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=vMuapGc6r+sQXc4RIPpj5//TOg7JGDyrIsFu9NTNbKI=;
 b=jQkjGowT5oILd7uIBn6l1NsDA+0CrEIr8x7Jp3EEyXYymN9FirpH1sD5TkJqk8c8G1UIH/QI
 Ouvw1lvudY90vAU0g1C+jHDUk6qAoGp1yEB/30nudFnHv9pSM4FLdJXbVnQ79qISpSGamYTL
 kcUuI451/cpC1q+OQdM5AyA5jPA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 607879dbe0e9c9a6b678540c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Apr 2021 17:37:31
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D6856C43463; Thu, 15 Apr 2021 17:37:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 742A8C433C6;
        Thu, 15 Apr 2021 17:37:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 15 Apr 2021 10:37:29 -0700
From:   khsieh@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     robdclark@gmail.com, sean@poorly.run, abhinavk@codeaurora.org,
        aravindh@codeaurora.org, airlied@linux.ie, daniel@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/msm/dp: check main link status before start
 aux read
In-Reply-To: <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
References: <1618355504-5401-1-git-send-email-khsieh@codeaurora.org>
 <161843459482.46595.11409016331159748598@swboyd.mtv.corp.google.com>
Message-ID: <60bceecc3d4dcc71c66a4b093d0e6c0f@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-04-14 14:09, Stephen Boyd wrote:
> Quoting Kuogee Hsieh (2021-04-13 16:11:44)
>> Make sure main link is in connection state before start aux
>> read/write operation to avoid unnecessary long delay due to
>> main link had been unplugged.
>> 
>> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
>> ---
>>  drivers/gpu/drm/msm/dp/dp_aux.c  |  5 +++++
>>  drivers/gpu/drm/msm/dp/dp_link.c | 20 +++++++++++++++-----
>>  2 files changed, 20 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
>> b/drivers/gpu/drm/msm/dp/dp_aux.c
>> index 7c22bfe..fae3806 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
>> @@ -343,6 +343,11 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
>> *dp_aux,
>> 
>>         mutex_lock(&aux->mutex);
>> 
>> +       if (!dp_catalog_link_is_connected(aux->catalog)) {
>> +               ret = -ETIMEDOUT;
>> +               goto unlock_exit;
>> +       }
> 
> I get a crash here sometimes when plugging and unplugging an apple HDMI
> dongle during suspend/resume. I guess device power management
> (dp_pm_suspend()) is happening in parallel with aux transfers from the
> kthread. Why doesn't the aux communication start reporting NAKs once 
> the
> cable is disconnected?
> 
> [  366.210058] hdmi-audio-codec hdmi-audio-codec.15.auto: calling
> platform_pm_suspend+0x0/0x60 @ 7175, parent:
> ae90000.displayport-controller
> [  366.222825] hdmi-audio-codec hdmi-audio-codec.15.auto:
> platform_pm_suspend+0x0/0x60 returned 0 after 1 usecs
> [  366.232939] msm-dp-display ae90000.displayport-controller: calling
> dp_pm_suspend+0x0/0x80 @ 7175, parent: ae00000.mdss
> [  366.244006] msm-dp-display ae90000.displayport-controller:
> dp_pm_suspend+0x0/0x80 returned 0 after 79 usecs
> [  366.254025] msm_dsi ae94000.dsi: calling
> pm_runtime_force_suspend+0x0/0xb4 @ 7175, parent: ae00000.mdss
> [  366.263669] msm_dsi ae94000.dsi: pm_runtime_force_suspend+0x0/0xb4
> returned 0 after 0 usecs
> [  366.272290] panel-simple panel: calling
> platform_pm_suspend+0x0/0x60 @ 7175, parent: platform
> [  366.272501] ti_sn65dsi86 2-002d: calling
> pm_runtime_force_suspend+0x0/0xb4 @ 176, parent: i2c-2
> [  366.281055] panel-simple panel: platform_pm_suspend+0x0/0x60
> returned 0 after 0 usecs
> [  366.281081] leds mmc1::: calling led_suspend+0x0/0x4c @ 7175,
> parent: 7c4000.sdhci
> [  366.290065] ti_sn65dsi86 2-002d: pm_runtime_force_suspend+0x0/0xb4
> returned 0 after 0 usecs
> [  366.298046] leds mmc1::: led_suspend+0x0/0x4c returned 0 after 1 
> usecs
> [  366.302994] Internal error: synchronous external abort: 96000010
> [#1] PREEMPT SMP
> [  366.303006] Modules linked in: vhost_vsock
> vmw_vsock_virtio_transport_common vsock vhost rfcomm algif_hash
> algif_skcipher af_alg xt_cgroup uinput xt_MASQUERADE venus_enc
> hci_uart venus_dec btqca cros_ec_typec typec bluetooth qcom_spmi_adc5
> snd_soc_sc7180 qcom_spmi_temp_alarm ecdh_generic qcom_spmi_adc_tm5
> qcom_vadc_common snd_soc_qcom_common ecc snd_soc_rt5682_i2c
> snd_soc_rt5682 snd_soc_rl6231 venus_core v4l2_mem2mem
> snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu
> snd_soc_lpass_platform snd_soc_max98357a fuse iio_trig_sysfs
> cros_ec_sensors cros_ec_sensors_ring cros_ec_lid_angle
> cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf
> cros_ec_sensorhub lzo_rle lzo_compress zram ath10k_snoc ath10k_core
> ath mac80211 cfg80211 cdc_ether usbnet r8152 mii uvcvideo
> videobuf2_vmalloc joydev
> [  366.303211] CPU: 0 PID: 224 Comm: dp_hpd_handler Not tainted 5.4.109 
> #27
> [  366.303216] Hardware name: Google Lazor (rev3+) with KB Backlight 
> (DT)
> [  366.303225] pstate: 60c00009 (nZCv daif +PAN +UAO)
> [  366.303234] pc : dp_catalog_link_is_connected+0x20/0x34
> [  366.303244] lr : dp_aux_transfer+0x44/0x284
> [  366.303250] sp : ffffffc011bfbbe0
> [  366.303254] x29: ffffffc011bfbbe0 x28: aaaaaaaaaaaaaaaa
> [  366.303262] x27: 000000000000000c x26: ffffff896f8212bc
> [  366.303269] x25: 0000000000000001 x24: 0000000000000001
> [  366.303275] x23: 0000000000000020 x22: ffffff896ff82118
> [  366.303282] x21: ffffffc011bfbc50 x20: ffffff896ff82090
> [  366.303289] x19: ffffff896ffc3598 x18: 0000000000000000
> [  366.303295] x17: 0000000000000000 x16: 0000000000000001
> [  366.303303] x15: 0000000000000000 x14: 00000000000002ef
> [  366.303311] x13: 0000000000000400 x12: ffffffeb896ea060
> [  366.303317] x11: 0000000000000000 x10: 0000000000000000
> [  366.303324] x9 : ffffff896f061100 x8 : ffffffc010582204
> [  366.303331] x7 : 000000b2b5593519 x6 : 00000000003033ff
> [  366.303338] x5 : 0000000000000000 x4 : 0000000000000001
> [  366.303345] x3 : ffffff896ff432a1 x2 : 0000000000000000
> [  366.303352] x1 : 0000000000000119 x0 : ffffff896ffc3598
> [  366.303360] Call trace:
> [  366.303367]  dp_catalog_link_is_connected+0x20/0x34
> [  366.303374]  dp_aux_transfer+0x44/0x284
> [  366.303387]  drm_dp_dpcd_access+0x8c/0x11c
> [  366.303393]  drm_dp_dpcd_read+0x64/0x10c
> [  366.303399]  dp_link_process_request+0x94/0xaf8
> [  366.303405]  dp_display_usbpd_attention_cb+0x38/0x140
> [  366.303411]  hpd_event_thread+0x3f0/0x48c
> [  366.303426]  kthread+0x140/0x17c
> [  366.303439]  ret_from_fork+0x10/0x18
> [  366.303458] Code: d503201f f85f0268 f9400508 91081108 (b9400108)
> 
it needs to make sure core clock enabled before access dp ctrl registers
I am look into it
>> +
>>         aux->native = msg->request & (DP_AUX_NATIVE_WRITE & 
>> DP_AUX_NATIVE_READ);
>> 
>>         /* Ignore address only message */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
>> b/drivers/gpu/drm/msm/dp/dp_link.c
>> index be986da..d35b18e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> @@ -737,18 +737,25 @@ static int dp_link_parse_sink_count(struct 
>> dp_link *dp_link)
>>         return 0;
>>  }
>> 
>> -static void dp_link_parse_sink_status_field(struct dp_link_private 
>> *link)
>> +static int dp_link_parse_sink_status_field(struct dp_link_private 
>> *link)
>>  {
>>         int len = 0;
>> 
>>         link->prev_sink_count = link->dp_link.sink_count;
>> -       dp_link_parse_sink_count(&link->dp_link);
>> +       len = dp_link_parse_sink_count(&link->dp_link);
>> +       if (len < 0) {
>> +               DRM_ERROR("DP lparse sink count failed\n");
> 
> Is it 'lparse' on purpose?
> 
>> +               return len;
>> +       }
>> 
>>         len = drm_dp_dpcd_read_link_status(link->aux,
>>                 link->link_status);
>> -       if (len < DP_LINK_STATUS_SIZE)
>> +       if (len < DP_LINK_STATUS_SIZE) {
>>                 DRM_ERROR("DP link status read failed\n");
>> -       dp_link_parse_request(link);
>> +               return len;
>> +       }
>> +
>> +       return dp_link_parse_request(link);
>>  }
>> 
>>  /**
>> @@ -1032,7 +1039,10 @@ int dp_link_process_request(struct dp_link 
>> *dp_link)
>> 
>>         dp_link_reset_data(link);
>> 
>> -       dp_link_parse_sink_status_field(link);
>> +       ret = dp_link_parse_sink_status_field(link);
>> +       if (ret) {
>> +               return ret;
>> +       }
>> 
>>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> 
> These are probably good fixes on their own given that
> dp_link_parse_sink_count() can return an error and that was being
> ignored.
