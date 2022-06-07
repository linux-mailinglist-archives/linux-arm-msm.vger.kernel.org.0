Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF8A54277E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jun 2022 09:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiFHHFV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jun 2022 03:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344148AbiFHF4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jun 2022 01:56:12 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 832BD153517;
        Tue,  7 Jun 2022 14:31:12 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id k16so25824507wrg.7;
        Tue, 07 Jun 2022 14:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6dyegJ835SphWTsNBqySaDW+KZborTC+d08ajYqSReg=;
        b=ALiNEgN8fGMa/xWIg6XeX6eOBYpNheAJzSfvaSwtYWGBR+/FugJY8xMhrKT4iaOsMs
         QkJ9jrXIpX0UNCzssfNwXEDUofdghlxWv5uepajClafPx1xBX6SRhXRo8nSVrrC8pVzV
         TpdOlZSHbonUji004KENUNGhOJ0wbgCcjLIJmasCe4cp0IMyMRNQ3FqvCcU5ft8ozlXh
         OTnUKuc/O4h/oAQn50S4QQXCuI+r3txD2dK8jE4qvr/NQe9xnEPQDPZS4s16IcviS/8f
         zQ8OSr8egNB7j5NX0h8MQsQ8A4OFDBEwo3Z5Hyw5zjEtCl8rqKsLkLe6bxO/mJJBnGng
         RQEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6dyegJ835SphWTsNBqySaDW+KZborTC+d08ajYqSReg=;
        b=I8Yfjvi4iG9Cw1Y1MT1u5qQKgVAIyR8oYf5n97HMaEzcgPVdrTi/cT0/FsZ4tZPKvz
         J2oKqCkHG1rwCUmHLnnKZ4E39o/yGOCSDRHj1pFuf+HwlXnNV0DnfmRAmOdpQQh8UxBf
         iA8KmMOLraHRM8EroU3IJv3CrHG95aEIUOkm218a0kJiO9eqB7hVc0IScRHqdRTvxer2
         VGh74gKxCrDfM6G8uPbn+wdp9nthRTtF2MFEzdGPvLKk5Lxt8wRbNSZck+UQmleHqqqW
         6l/R6KJAPo3BtnBXty3uBAOKULpZS/prVm2+JPiyBG1Eaahi4v6TXG8Vs9mmw5PJC/hC
         qBzw==
X-Gm-Message-State: AOAM532KnEYHfWvMb8U7iHUJRamPVTnRY6ZGkhXpGktbHkzWDY7fHuWH
        L7UHSjRogxLxcByoFMGz3T9vwqjLqb/v14w6+1w=
X-Google-Smtp-Source: ABdhPJzwBr3G8vXVdcNxkh8k1wHi1ib5MLhQOQtSWLstQP8ZmoZFNcN1WccMs+qZLLWQBnzR3YZeFOANb950bayQd4A=
X-Received: by 2002:adf:fb0d:0:b0:20d:97e:17ce with SMTP id
 c13-20020adffb0d000000b0020d097e17cemr30233397wrr.585.1654637470976; Tue, 07
 Jun 2022 14:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210927152928.831245-1-robdclark@gmail.com> <f1c6fff0-a220-86d9-8572-2de3d47ab96a@codeaurora.org>
In-Reply-To: <f1c6fff0-a220-86d9-8572-2de3d47ab96a@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 7 Jun 2022 14:30:58 -0700
Message-ID: <CAF6AEGtRO2VdweN014JpApQ460=KxEU9uF8jf1U__Gh-bMRo7w@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Switch ordering of runpm put vs devfreq_idle
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Sep 28, 2021 at 7:52 AM Akhil P Oommen <akhilpo@codeaurora.org> wro=
te:
>
> On 9/27/2021 8:59 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > I've seen a few crashes like:
> >
> >      Internal error: synchronous external abort: 96000010 [#1] PREEMPT =
SMP
> >      Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp=
 llc tun nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp esp6 ah6=
 ip6t_REJECT ip6t_ipv6header vhost_vsock vhost vmw_vsock_virtio_transport_c=
ommon vsock rfcomm algif_hash algif_skcipher af_alg uinput veth xt_cgroup x=
t_MASQUERADE venus_enc venus_dec videobuf2_dma_contig qcom_spmi_adc5 qcom_s=
pmi_adc_tm5 hci_uart qcom_vadc_common cros_ec_typec qcom_spmi_temp_alarm ty=
pec btqca snd_soc_rt5682_i2c snd_soc_rt5682 snd_soc_sc7180 bluetooth snd_so=
c_qcom_common snd_soc_rl6231 ecdh_generic ecc venus_core v4l2_mem2mem snd_s=
oc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu snd_soc_lpass_platform=
 snd_soc_max98357a ip6table_nat fuse iio_trig_sysfs cros_ec_lid_angle cros_=
ec_sensors cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cro=
s_ec_sensorhub lzo_rle ath10k_snoc lzo_compress ath10k_core ath zram mac802=
11 cfg80211 ax88179_178a usbnet mii uvcvideo videobuf2_vmalloc joydev
> >      CPU: 3 PID: 212 Comm: A618-worker Tainted: G W 5.4.139-16300-g88d8=
e1285982 #1
> >      Hardware name: Google Pompom (rev1) with LTE (DT)
> >      pstate: 60c00009 (nZCv daif +PAN +UAO)
> >      pc : a6xx_gmu_set_oob+0x114/0x200
> >      lr : a6xx_gmu_set_oob+0x10c/0x200
> >      sp : ffffffc011b7bc20
> >      x29: ffffffc011b7bc20 x28: ffffffdad27c5000
> >      x27: 0000000000000001 x26: ffffffdad1521044
> >      x25: ffffffbef7498338 x24: 0000000000000018
> >      x23: 0000000000000002 x22: 0000000000014648
> >      x21: 0000033732fe638b x20: 0000000080000000
> >      x19: ffffffbef7433bc8 x18: 0000000040000000
> >      x17: 000000243508d982 x16: 000000000000b67e
> >      x15: 00000000000090d4 x14: 0000000000000024
> >      x13: 0000000000000024 x12: 0000000000017521
> >      x11: 0000000000000b48 x10: 0000000000326a48
> >      x9 : 1a130d33f6371600 x8 : ffffffc011e54648
> >      x7 : 614948e00005003c x6 : ffffffbe3cd17e60
> >      x5 : 0000000000000040 x4 : 0000000000000004
> >      x3 : 0000000000000000 x2 : ffffffbef7488000
> >      x1 : ffffffbef7488000 x0 : 0000000000000000
> >      Call trace:
> >      a6xx_gmu_set_oob+0x114/0x200
> >      a6xx_gmu_set_freq+0xe0/0x1fc
> >      msm_devfreq_target+0x80/0x13c
> >      msm_devfreq_idle+0x54/0x94
> >      retire_submit+0x170/0x254
> >      retire_submits+0xa4/0xdc
> >      retire_worker+0x1c/0x28
> >      kthread_worker_fn+0xf4/0x1bc
> >      kthread+0x140/0x158
> >      ret_from_fork+0x10/0x18
> >      Code: 52800c81 9415bbe5 f9400a68 8b160108 (b9400108)
> >      ---[ end trace 16b871df2482cd61 ]---
> >      Kernel panic - not syncing: Fatal exception
> >      SMP: stopping secondary CPUs
> >      Kernel Offset: 0x1ac1400000 from 0xffffffc010000000
> >      PHYS_OFFSET: 0xffffffc280000000
> >      CPU features: 0x88102e,2a80aa38
> >      Memory Limit: none
> >
> > Which smells a lot like touching hw after power collapse.  I'm not
> > *entirely* sure how it could have taken 66ms (the autosuspend delay)
> > before we get to a6xx_gmu_set_oob(), but to be safe we should move
> > the pm_runtime_put_autosuspend() after msm_devfreq_idle().
> https://elixir.bootlin.com/linux/v5.15-rc1/source/drivers/gpu/drm/msm/adr=
eno/a6xx_gmu.c#L132
> We have this check in the gmu freq set path which should avoid this
> scenario. I might be a bit pedantic here, but I feel that the original
> code is more accurate. We should immediately mark last busy and put
> runtime_pm refcount.

So, I've been doing some experiments, changing the _put_autosuspend()
to _put_sync(), in the course of tracking down some remaining "GMU
OOB" timeout type issues and related badness, and discovered things
very quickly die with SError splats like below.  Possibly the issue is
that runpm has some race conditions, but I'm not sure we can trust
pm_runtime_get_if_in_use() quite as much as one would like..

-----------
[   33.225332] CPU: 0 PID: 216 Comm: A618-worker Tainted: G        W
      5.4.196 #7
[   33.225337] Hardware name: Google Wormdingler rev1+ INX panel board (DT)
[   33.225343] pstate: 20c00009 (nzCv daif +PAN +UAO)
[   33.225353] pc : msm_readl+0x14/0x34
[   33.225361] lr : a6xx_gpu_busy+0x40/0x80
[   33.225365] sp : ffffffc011b93ad0
[   33.225371] x29: ffffffc011b93ad0 x28: ffffffe77cba3000
[   33.225377] x27: 0000000000000001 x26: ffffffe77bb4c4ac
[   33.225384] x25: ffffffa2f227dfa0 x24: ffffffa2f22aab28
[   33.225390] x23: 0000000000000000 x22: ffffffa2f22bf020
[   33.225397] x21: ffffffa2f22bf000 x20: ffffffc011b93b10
[   33.225404] x19: ffffffc011bd4110 x18: 000000000000000e
[   33.225410] x17: 0000000000000004 x16: 000000000000000c
[   33.225416] x15: 000001be3a969450 x14: 0000000000000400
[   33.225423] x13: 00000000000101d6 x12: 0000000034155555
[   33.225429] x11: 0000000000000001 x10: 0000000000000000
[   33.225436] x9 : 0000000100000000 x8 : ffffffc011bd4000
[   33.225443] x7 : 0000000000000000 x6 : 0000000000000007
[   33.225450] x5 : ffffffc01d8b38f0 x4 : 0000000000000000
[   33.225457] x3 : 00000000ffffffff x2 : 0000000000000002
[   33.225463] x1 : 0000000000000000 x0 : ffffffc011bd4110
[   33.225471] Call trace:
[   33.225478]  msm_readl+0x14/0x34
[   33.225484]  a6xx_gpu_busy+0x40/0x80
[   33.225490]  msm_devfreq_get_dev_status+0x70/0x1d0
[   33.225500]  devfreq_simple_ondemand_func+0x34/0x100
[   33.225510]  update_devfreq+0x50/0xe8
[   33.225517]  qos_notifier_call+0x2c/0x64
[   33.225523]  qos_max_notifier_call+0x1c/0x2c
[   33.225532]  notifier_call_chain+0x58/0x98
[   33.225539]  __blocking_notifier_call_chain+0x74/0x84
[   33.225545]  blocking_notifier_call_chain+0x38/0x48
[   33.225554]  pm_qos_update_target+0xf8/0x19c
[   33.225560]  freq_qos_apply+0x54/0x6c
[   33.225566]  apply_constraint+0x60/0x104
[   33.225572]  __dev_pm_qos_update_request+0xb4/0x184
[   33.225578]  dev_pm_qos_update_request+0x38/0x58
[   33.225584]  msm_devfreq_idle_work+0x34/0x40
[   33.225591]  kthread_worker_fn+0x144/0x1c8
[   33.225597]  kthread+0x140/0x284
[   33.225604]  ret_from_fork+0x10/0x18
[   33.225617] Code: f9000bf3 910003fd aa0003f3 d503201f (b9400260)
[   33.225623] ---[ end trace f6309767a42d0831 ]---
[   33.236185] SMP: stopping secondary CPUs
[   33.236186] Kernel Offset: 0x276b600000 from 0xffffffc010000000
[   33.236186] PHYS_OFFSET: 0xffffffdf80000000
[   33.236187] CPU features: 0x088102e,2a80aa38
-----------

>
> -Akhil.
>
> >
> > Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gp=
u.c
> > index d1a16642ecd5..2b2bbe7499e6 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu.c
> > @@ -667,9 +667,6 @@ static void retire_submit(struct msm_gpu *gpu, stru=
ct msm_ringbuffer *ring,
> >
> >       msm_submit_retire(submit);
> >
> > -     pm_runtime_mark_last_busy(&gpu->pdev->dev);
> > -     pm_runtime_put_autosuspend(&gpu->pdev->dev);
> > -
> >       spin_lock_irqsave(&ring->submit_lock, flags);
> >       list_del(&submit->node);
> >       spin_unlock_irqrestore(&ring->submit_lock, flags);
> > @@ -683,6 +680,9 @@ static void retire_submit(struct msm_gpu *gpu, stru=
ct msm_ringbuffer *ring,
> >       mutex_unlock(&gpu->active_lock);
> >
> >       msm_gem_submit_put(submit);
> > +
> > +     pm_runtime_mark_last_busy(&gpu->pdev->dev);
> > +     pm_runtime_put_autosuspend(&gpu->pdev->dev);
> >   }
> >
> >   static void retire_submits(struct msm_gpu *gpu)
> >
>
