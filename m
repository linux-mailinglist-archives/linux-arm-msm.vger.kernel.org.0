Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC462A7D88
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Nov 2020 12:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730139AbgKELvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 06:51:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729832AbgKELvQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 06:51:16 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F9DFC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 03:51:15 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id h2so1302152wmm.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 03:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DY4wXoWLKqgqsHpsVnWr1Zjo02chTnhQrM0n7Jf9nsY=;
        b=EOMNdwZOcEri47NUVHsp212SryoMIKUtfWdhXLCr8IBZSPFF6veeL5qhrSARGtVyMy
         j/hjYeSSwvOYJ7D+IOUgJuznX4wUi8ulHcpWy2IKNQXXHiQe63zbKVmPMcRQgi1S5eri
         3lgte9oFwTpf4pDPjz2EWhQPQb1D5zUYqsasU7dw6JuYcIs06jfHzu55K5QjGdxd/al1
         RPVG4As6phaMTy2mSVFUcEa4JbLRfz+xXphddu7rG1uwhvQiQumKiYpMkKMM5+ze8wre
         mdHfTEsThB5hP9dosN/rj/ZsQCfFsbz2HYufHE0FwRPsM+T8bjKsv4PEsmk2NdBqbLkZ
         U+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DY4wXoWLKqgqsHpsVnWr1Zjo02chTnhQrM0n7Jf9nsY=;
        b=gahzfAncVNyY0sIEoer3fyLEM2h0d6VCbevSAsxR6rSrT6Tlf9n0H827sWsf1s4Hkj
         c9jigKPpYezZhGbNbsMfgeA3t/P/oIyGWlae5qEQVw4N33pPoLgljHzwgDqbx5DoGUO9
         Mp7a7J5dF1NbV6rZ9fRTdU5bKdx0pddyl/RFgAdCbwZS3GVVob+NyI4a6nYbn8QSJFza
         AnwUGj/2DQs0EwVEJaUdz4LEyn0hqXPT+c8e/5z9+pwUrzTO9HAPKoL+2igMq+KrJECD
         YvoHNZFQlaGScS4ezDV0QZmSYkf2FBWivN0qEedF1ihNnyhedKm8Mw8HB43upO+6qF7A
         lJCg==
X-Gm-Message-State: AOAM532Uy60AHtkr8LtOMWhjnO+i1skMTbbOLGfr6PklHupBc50N1hMy
        yMnvI560bHQw2WAvfJM5dQv9CgAQx57ZtbpI
X-Google-Smtp-Source: ABdhPJwoXf4qQexHsClzVnpRTE4XVmgdF3/NG84LHQHY90aQrirYZOom0nujcuB9Mg+CRH4moYZh9Q==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr2375659wmp.187.1604577074269;
        Thu, 05 Nov 2020 03:51:14 -0800 (PST)
Received: from [192.168.0.2] (hst-221-89.medicom.bg. [84.238.221.89])
        by smtp.googlemail.com with ESMTPSA id y4sm2046418wmj.2.2020.11.05.03.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 03:51:13 -0800 (PST)
Subject: Re: [PATCH 3/4] venus: venc: Handle reset encoder state
To:     vgarodia@codeaurora.org, Fritz Koenig <frkoenig@chromium.org>
Cc:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alexandre Courbot <acourbot@chromium.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
References: <20201023125704.4984-1-stanimir.varbanov@linaro.org>
 <20201023125704.4984-4-stanimir.varbanov@linaro.org>
 <CAMfZQbywe7OcSRebeh0fmphmz8xz8KUyMUMOhxLgh1Uc-gyWQA@mail.gmail.com>
 <aec00b8a87e1e238b755a547b88593f0@codeaurora.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <393cc53f-6b79-faf0-00f5-c1205294a54a@linaro.org>
Date:   Thu, 5 Nov 2020 13:51:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <aec00b8a87e1e238b755a547b88593f0@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/4/20 12:44 PM, vgarodia@codeaurora.org wrote:
> Hi Stan,
> 
> On 2020-11-03 06:46, Fritz Koenig wrote:
>> On Fri, Oct 23, 2020 at 5:57 AM Stanimir Varbanov
>> <stanimir.varbanov@linaro.org> wrote:
>>>
>>> Redesign the encoder driver to be compliant with stateful encoder
>>> spec - specifically adds handling of Reset state.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>  drivers/media/platform/qcom/venus/core.h |  10 +-
>>>  drivers/media/platform/qcom/venus/venc.c | 242 ++++++++++++++++++-----
>>>  2 files changed, 197 insertions(+), 55 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/core.h
>>> b/drivers/media/platform/qcom/venus/core.h
>>> index 5c4693678e3f..294d5467a6a1 100644
>>> --- a/drivers/media/platform/qcom/venus/core.h
>>> +++ b/drivers/media/platform/qcom/venus/core.h
>>> @@ -277,11 +277,11 @@ enum venus_dec_state {
>>>  };
>>>
>>>  enum venus_enc_state {
>>> -       VENUS_ENC_STATE_DEINIT          = 0,
>>> -       VENUS_ENC_STATE_INIT            = 1,
>>> -       VENUS_ENC_STATE_ENCODING        = 2,
>>> -       VENUS_ENC_STATE_STOPPED         = 3,
>>> -       VENUS_ENC_STATE_DRAIN           = 4,
>>> +       VENUS_ENC_STATE_INIT            = 0,
>>> +       VENUS_ENC_STATE_ENCODING        = 1,
>>> +       VENUS_ENC_STATE_STOPPED         = 2,
>>> +       VENUS_ENC_STATE_DRAIN           = 3,
>>> +       VENUS_ENC_STATE_RESET           = 4,
>>>  };
>>>
>>>  struct venus_ts_metadata {
>>> diff --git a/drivers/media/platform/qcom/venus/venc.c
>>> b/drivers/media/platform/qcom/venus/venc.c
>>> index c6143b07914c..aa9255ddb0a5 100644
>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>> @@ -565,6 +565,7 @@ static const struct v4l2_ioctl_ops venc_ioctl_ops
>>> = {
>>>         .vidioc_enum_frameintervals = venc_enum_frameintervals,
>>>         .vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>>>         .vidioc_unsubscribe_event = v4l2_event_unsubscribe,
>>> +       .vidioc_try_encoder_cmd = v4l2_m2m_ioctl_try_encoder_cmd,
>>>         .vidioc_encoder_cmd = venc_encoder_cmd,
>>>  };
>>>
>>> @@ -850,6 +851,69 @@ static int venc_queue_setup(struct vb2_queue *q,
>>>         return ret;
>>>  }
>>>
>>> +static void venc_release_session(struct venus_inst *inst)
>>> +{
>>> +       struct venus_core *core = inst->core;
>>> +       int ret, abort = 0;
>>> +
>>> +       mutex_lock(&inst->lock);
>>> +
>>> +       if (inst->enc_state != VENUS_ENC_STATE_RESET)
>>> +               dev_dbg(core->dev_enc, VDBGH "wrong state!\n");
>>> +
>>> +       ret = hfi_session_stop(inst);
>>> +       abort |= (ret && ret != -EINVAL) ? 1 : 0;
>>> +       ret = hfi_session_unload_res(inst);
>>> +       abort |= (ret && ret != -EINVAL) ? 1 : 0;
>>> +       ret = venus_helper_unregister_bufs(inst);
>>> +       abort |= (ret && ret != -EINVAL) ? 1 : 0;
>>> +       ret = venus_helper_intbufs_free(inst);
>>> +       abort |= (ret && ret != -EINVAL) ? 1 : 0;
>>> +       ret = hfi_session_deinit(inst);
>>> +       abort |= (ret && ret != -EINVAL) ? 1 : 0;
>>> +
>>> +       if (inst->session_error)
>>> +               abort = 1;
>>> +
>>> +       if (abort)
>>> +               hfi_session_abort(inst);
>>> +
>>> +       venus_pm_load_scale(inst);
>>
>> venus_pm_load_scale depends on inst->clk_data.codec_freq_data being
>> set up. This occurs in venc_init_session().  I am seeing scenarios
>> where the encoder is getting setup up, but before it is finished,
>> teardown occurs.  If this teardown occurs before
>> inst->clk_data.codec_freq_data is initalized, a crash occurs.  (also
>> "wrong state!" is printed out)
> 
> venus_pm_load_scale(inst) is called here to remove the votes for clock
> and bus bandwidth. This is not needed for instances which are closed
> just after moving them to INIT state. I have tried with below state
> handling
> and it works well i.e call for venus_pm_load_scale(inst) from state other
> than the INIT state.

IMO we have to check the INST state in venus_pm_load_scale(). We made
similar check in min_loaded_core() here [1].

[1] https://www.spinics.net/lists/kernel/msg3498215.html

> 
> -       venus_pm_load_scale(inst);
> +       if(inst->enc_state != VENUS_ENC_STATE_INIT)
> +               venus_pm_load_scale(inst);
> 
>>
>> [  106.593198] Unable to handle kernel NULL pointer dereference at
>> virtual address 0000000000000008
>> [  106.603916] Mem abort info:
>> [  106.608470]   ESR = 0x96000006
>> [  106.613802]   EC = 0x25: DABT (current EL), IL = 32 bits
>> [  106.619426]   SET = 0, FnV = 0
>> [  106.622619]   EA = 0, S1PTW = 0
>> [  106.625862] Data abort info:
>> [  106.628835]   ISV = 0, ISS = 0x00000006
>> [  106.632785]   CM = 0, WnR = 0
>> [  106.635850] user pgtable: 4k pages, 39-bit VAs, pgdp=000000014839f000
>> [  106.642472] [0000000000000008] pgd=000000016ab1f003,
>> pud=000000016ab1f003, pmd=0000000000000000
>> [  106.651410] Internal error: Oops: 96000006 [#1] PREEMPT SMP
>> [  106.657132] Modules linked in: rfcomm algif_hash algif_skcipher
>> af_alg uinput venus_dec venus_enc videobuf2_dma_sg hci_uart btqca
>> venus_core qcom_spmi_adc5 qcom_spmi_temp_alarm qcom_vadc_common
>> snd_soc_rt5682_i2c v4l2_mem2mem snd_soc_sc7180 snd_soc_rt5682
>> snd_soc_qcom_common snd_soc_rl6231 bluetooth ecdh_generic ecc
>> snd_soc_lpass_sc7180 snd_soc_lpass_hdmi snd_soc_lpass_cpu
>> snd_soc_lpass_platform snd_soc_max98357a xt_MASQUERADE fuse
>> iio_trig_sysfs cros_ec_lid_angle cros_ec_sensors cros_ec_sensors_core
>> industrialio_triggered_buffer cros_ec_sensors_ring rmtfs_mem kfifo_buf
>> cros_ec_sensorhub ath10k_snoc lzo_rle ath10k_core lzo_compress ath
>> zram mac80211 ipa qmi_helpers cfg80211 qcom_q6v5_mss qcom_pil_info
>> qcom_q6v5 qcom_common cdc_ether usbnet r8152 mii uvcvideo
>> videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common
>> joydev
>> [  106.732576] CPU: 7 PID: 3622 Comm: DrmThread Not tainted 5.4.72 #40
>> [  106.739004] Hardware name: Google Lazor (rev1+) (DT)
>> [  106.744103] pstate: 60400009 (nZCv daif +PAN -UAO)
>> [  106.749027] pc : load_scale_v4+0x160/0x3a4 [venus_core]
>> [  106.754396] lr : load_scale_v4+0x154/0x3a4 [venus_core]
>> [  106.759766] sp : ffffffc0120ab9e0
>> [  106.763171] x29: ffffffc0120ab9e0 x28: 0000000000000005
>> [  106.768629] x27: 0000000000000000 x26: 0000000000000000
>> [  106.774080] x25: 0000000000000000 x24: 000000000000001e
>> [  106.779530] x23: 0000000000000000 x22: ffffff80b41a8000
>> [  106.784980] x21: ffffffd344e97e98 x20: ffffff80cb5b8080
>> [  106.790431] x19: ffffff80fa3b1410 x18: 00000000ffff0a10
>> [  106.795881] x17: 000000000000003c x16: ffffffd398ec2e88
>> [  106.801329] x15: 0000000000000006 x14: ffff001000000600
>> [  106.806779] x13: 000000000002cca2 x12: 0000000000000000
>> [  106.812229] x11: 0000000000000000 x10: 0000000000000000
>> [  106.817679] x9 : 472cbd12793c4600 x8 : 0000000000000000
>> [  106.823137] x7 : 0000000000000000 x6 : ffffffd399dbcc6c
>> [  106.828585] x5 : 0000000000000000 x4 : 0000000000000000
>> [  106.834035] x3 : 0000000000000000 x2 : ffffff80ff6ae5c0
>> [  106.839487] x1 : ffffff80ff69e018 x0 : ffffffd344e990ac
>> [  106.844937] Call trace:
>> [  106.847460]  load_scale_v4+0x160/0x3a4 [venus_core]
>> [  106.852473]  venc_buf_cleanup+0x198/0x1f0 [venus_enc]
>> [  106.857656]  __vb2_queue_free+0x90/0x1f4 [videobuf2_common]
>> [  106.863374]  vb2_core_queue_release+0x3c/0x50 [videobuf2_common]
>> [  106.869541]  vb2_queue_release+0x1c/0x28 [videobuf2_v4l2]
>> [  106.875082]  v4l2_m2m_ctx_release+0x24/0x40 [v4l2_mem2mem]
>> [  106.880710]  venc_close+0x24/0x78 [venus_enc]
>> [  106.885188]  v4l2_release+0x8c/0xdc
>> [  106.888779]  __fput+0xe0/0x214
>> [  106.891916]  ____fput+0x1c/0x28
>> [  106.895148]  task_work_run+0x94/0xc4
>> [  106.898828]  do_exit+0x244/0x7c8
>> [  106.902147]  do_group_exit+0x88/0x98
>> [  106.905825]  get_signal+0x1cc/0x674
>> [  106.909415]  do_notify_resume+0x134/0x1410
>> [  106.913619]  work_pending+0x8/0x10
>> [  106.917119] Code: 97ffd58d f94032c8 90000020 9102b000 (f9400501)
>> [  106.923377] ---[ end trace a9caaf72c228e386 ]---
>> [  106.928767] Kernel panic - not syncing: Fatal exception
>> [  106.934131] SMP: stopping secondary CPUs
>> [  106.938347] Kernel Offset: 0x1388a00000 from 0xffffffc010000000
>> [  106.944426] PHYS_OFFSET: 0xffffffd900000000
>> [  106.948722] CPU features: 0x08102e,2a80aa18
>> [  106.953015] Memory Limit: none
>>
>>
>> This is the debug log before the crash:
>> [Nov 2 15:33] qcom-venus aa00000.video-codec: VenusLow : venus hw
>> version 4.44.20a
>> [  +0.000065] videodev: v4l2_open: video2: open (0)
>> [  +0.000019] video2: VIDIOC_ENUM_FMT: index=0, type=vid-cap-mplane,
>> flags=0x1, pixelformat=H264, description='H.264'
>> [  +0.000017] video2: VIDIOC_ENUM_FMT: index=1, type=vid-cap-mplane,
>> flags=0x1, pixelformat=VP80, description='VP8'
>> [  +0.000042] video2: VIDIOC_ENUM_FMT: index=2, type=vid-cap-mplane,
>> flags=0x1, pixelformat=HEVC, description='HEVC'
>> [  +0.000030] video2: VIDIOC_ENUM_FMT: error -22: index=3,
>> type=vid-cap-mplane, flags=0x0, pixelformat=\x00\x00\x00\x00,
>> description=''
>> [  +0.000068] videodev: v4l2_release: video2: release
>> [  +0.002752] qcom-venus aa00000.video-codec: VenusLow : venus hw
>> version 4.44.20a
>> [  +0.000062] videodev: v4l2_open: video2: open (0)
>> [  +0.000071] video2: VIDIOC_ENUM_FRAMESIZES: index=0,
>> pixelformat=H264, type=3, min=96x96, max=4096x4096, step=16x16
>> [  +0.000012] video2: VIDIOC_TRY_ENCODER_CMD: cmd=1, flags=0x0
>> [  +0.000005] video2: VIDIOC_QUERYCAP: driver=qcom-venus,
>> card=Qualcomm Venus video encoder, bus=platform:qcom-venus,
>> version=0x00050448, capabilities=0x84204000, device_caps=0x04204000
>> [  +0.001055] video2: VIDIOC_REQBUFS: count=0, type=vid-out-mplane,
>> memory=mmap
>> [  +0.000382] video2: VIDIOC_REQBUFS: count=0, type=vid-cap-mplane,
>> memory=mmap
>> [  +0.000227] video2: VIDIOC_S_FMT: type=vid-cap-mplane, width=96,
>> height=96, format=H264, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000027] plane 0: bytesperline=0 sizeimage=2097152
>> [  +0.000527] video2: VIDIOC_S_FMT: type=vid-out-mplane, width=384,
>> height=192, format=NV12, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000024] plane 0: bytesperline=384 sizeimage=122880
>> [  +0.000032] video2: VIDIOC_S_FMT: type=vid-out-mplane, width=384,
>> height=192, format=NV12, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000017] plane 0: bytesperline=384 sizeimage=122880
>> [  +0.000024] video2: VIDIOC_S_FMT: type=vid-out-mplane, width=384,
>> height=192, format=NV12, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000017] plane 0: bytesperline=384 sizeimage=122880
>> [  +0.000075] video2: VIDIOC_S_SELECTION: type=vid-out, target=0,
>> flags=0x0, wxh=320x192, x,y=0,0
>> [  +0.028300] video2: VIDIOC_S_FMT: type=vid-out-mplane, width=384,
>> height=192, format=NV12, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000036] plane 0: bytesperline=384 sizeimage=122880
>> [  +0.000033] video2: VIDIOC_S_FMT: type=vid-out-mplane, width=384,
>> height=192, format=NV12, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000014] plane 0: bytesperline=384 sizeimage=122880
>> [  +0.000020] video2: VIDIOC_S_FMT: type=vid-out-mplane, width=384,
>> height=192, format=NV12, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000120] plane 0: bytesperline=384 sizeimage=122880
>> [  +0.000157] video2: VIDIOC_S_SELECTION: type=vid-out, target=0,
>> flags=0x0, wxh=320x192, x,y=0,0
>> [  +0.000250] video2: VIDIOC_S_EXT_CTRLS: which=0x990000, count=1,
>> error_idx=0, request_fd=0, id/val=0x9909d7/0x1
>> [  +0.000120] video2: VIDIOC_QUERYCTRL: error -22: id=0x990b84,
>> type=0, name=, min/max=0/0, step=0, default=0, flags=0x00000000
>> [  +0.000368] v4l2-ctrls: try_set_ext_ctrls: video2: video2:
>> try_set_ext_ctrls_common failed (-22)
>> [  +0.000087] video2: VIDIOC_S_EXT_CTRLS: error -22: which=0x990000,
>> count=5, error_idx=5, request_fd=0, id/val=0x9909ca/0x0,
>> id/val=0x990a62/0x33, id/val=0x990a6b/0x2, id/val=0x990a67/0xb,
>> id/val=0x9909d8/0x1
>> [  +0.000290] v4l2-ctrls: prepare_ext_ctrls: video2: cannot find
>> control id 0x9909da
>> [  +0.000010] v4l2-ctrls: try_set_ext_ctrls: video2: video2:
>> try_set_ext_ctrls_common failed (-22)
>> [  +0.000014] video2: VIDIOC_S_EXT_CTRLS: error -22: which=0x990000,
>> count=2, error_idx=2, request_fd=0, id/val=0x9909da/0x1,
>> id/val=0x9909cb/0x0
>> [  +0.000225] video2: VIDIOC_G_FMT: type=vid-cap-mplane, width=320,
>> height=192, format=H264, field=none, colorspace=0, num_planes=1,
>> flags=0x0, ycbcr_enc=0, quantization=0, xfer_func=0
>> [  +0.000028] plane 0: bytesperline=0 sizeimage=49152
>> [  +0.002272] video2: VIDIOC_REQBUFS: count=4, type=vid-cap-mplane,
>> memory=mmap
>> [  +0.001661] video2: VIDIOC_QUERYBUF: 00:00:00.00000000 index=0,
>> type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
>> sequence=0, memory=mmap
>> [  +0.000034] plane 0: bytesused=0, data_offset=0x00000000,
>> offset/userptr=0xee18ad4840000000, length=2097152
>> [  +0.000009] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
>> userbits=0x00000000
>> [  +0.000142] video2: VIDIOC_QUERYBUF: 00:00:00.00000000 index=1,
>> type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
>> sequence=0, memory=mmap
>> [  +0.000023] plane 0: bytesused=0, data_offset=0x00000000,
>> offset/userptr=0xee18ad4840200000, length=2097152
>> [  +0.000008] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
>> userbits=0x00000000
>> [  +0.000409] video2: VIDIOC_QUERYBUF: 00:00:00.00000000 index=2,
>> type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
>> sequence=0, memory=mmap
>> [  +0.000027] plane 0: bytesused=0, data_offset=0x00000000,
>> offset/userptr=0xee18ad4840400000, length=2097152
>> [  +0.000007] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
>> userbits=0x00000000
>> [  +0.000233] video2: VIDIOC_QUERYBUF: 00:00:00.00000000 index=3,
>> type=vid-cap-mplane, request_fd=0, flags=0x00004000, field=any,
>> sequence=0, memory=mmap
>> [  +0.000023] plane 0: bytesused=0, data_offset=0x00000000,
>> offset/userptr=0xee18ad4840600000, length=2097152
>> [  +0.000015] timecode=00:00:00 type=0, flags=0x00000000, frames=0,
>> userbits=0x00000000
>> [  +0.000288] video2: VIDIOC_S_EXT_CTRLS: which=0x990000, count=1,
>> error_idx=0, request_fd=0, id/val=0x9909cf/0x30d40
>> [  +0.000184] video2: VIDIOC_S_PARM: type=vid-out-mplane,
>> capability=0x1000, outputmode=0x0, timeperframe=1/30, extendedmode=0,
>> writebuffers=0
>> [  +0.310832] qcom-venus-encoder aa00000.video-codec:video-encoder:
>> VenusHigh: wrong state!
>>
>>> +       INIT_LIST_HEAD(&inst->registeredbufs);
>>> +
>>> +       inst->enc_state = VENUS_ENC_STATE_INIT;
>>> +
>>> +       mutex_unlock(&inst->lock);
>>> +
>>> +       venus_pm_release_core(inst);
>>> +}
>>> +
>>> +static int venc_buf_init(struct vb2_buffer *vb)
>>> +{
>>> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>> +
>>> +       inst->buf_count++;
>>> +
>>> +       return venus_helper_vb2_buf_init(vb);
>>> +}
>>> +
>>> +static void venc_buf_cleanup(struct vb2_buffer *vb)
>>> +{
>>> +       struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>> +       struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> +       struct venus_buffer *buf = to_venus_buffer(vbuf);
>>> +
>>> +       mutex_lock(&inst->lock);
>>> +       if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>>> +               if (!list_empty(&inst->registeredbufs))
>>> +                       list_del_init(&buf->reg_list);
>>> +       mutex_unlock(&inst->lock);
>>> +
>>> +       inst->buf_count--;
>>> +       if (!inst->buf_count)
>>> +               venc_release_session(inst);
>>> +}
>>> +
>>>  static int venc_verify_conf(struct venus_inst *inst)
>>>  {
>>>         enum hfi_version ver = inst->core->res->hfi_version;
>>> @@ -881,61 +945,73 @@ static int venc_verify_conf(struct venus_inst
>>> *inst)
>>>  static int venc_start_streaming(struct vb2_queue *q, unsigned int
>>> count)
>>>  {
>>>         struct venus_inst *inst = vb2_get_drv_priv(q);
>>> -       int ret;
>>> +       int ret = 0;
>>>
>>>         mutex_lock(&inst->lock);
>>>
>>> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>>>                 inst->streamon_out = 1;
>>>         else
>>>                 inst->streamon_cap = 1;
>>>
>>> -       if (!(inst->streamon_out & inst->streamon_cap)) {
>>> -               mutex_unlock(&inst->lock);
>>> -               return 0;
>>> -       }
>>> +       if (!(inst->streamon_out & inst->streamon_cap))
>>> +               goto unlock;
>>>
>>> -       venus_helper_init_instance(inst);
>>> +       if (inst->enc_state == VENUS_ENC_STATE_INIT) {
>>> +               venus_helper_init_instance(inst);
>>>
>>> -       inst->sequence_cap = 0;
>>> -       inst->sequence_out = 0;
>>> +               inst->sequence_cap = 0;
>>> +               inst->sequence_out = 0;
>>>
>>> -       ret = venc_init_session(inst);
>>> -       if (ret)
>>> -               goto bufs_done;
>>> +               ret = venc_init_session(inst);
>>> +               if (ret)
>>> +                       goto bufs_done;
>>>
>>> -       ret = venus_pm_acquire_core(inst);
>>> -       if (ret)
>>> -               goto deinit_sess;
>>> +               ret = venus_pm_acquire_core(inst);
>>> +               if (ret)
>>> +                       goto deinit_sess;
>>>
>>> -       ret = venc_set_properties(inst);
>>> -       if (ret)
>>> -               goto deinit_sess;
>>> +               ret = venc_verify_conf(inst);
>>> +               if (ret)
>>> +                       goto deinit_sess;
>>>
>>> -       ret = venc_verify_conf(inst);
>>> -       if (ret)
>>> -               goto deinit_sess;
>>> +               ret = venus_helper_set_num_bufs(inst,
>>> inst->num_input_bufs,
>>> +                                              
>>> inst->num_output_bufs, 0);
>>> +               if (ret)
>>> +                       goto deinit_sess;
>>>
>>> -       ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
>>> -                                       inst->num_output_bufs, 0);
>>> -       if (ret)
>>> -               goto deinit_sess;
>>> +               ret = venus_helper_vb2_start_streaming(inst);
>>> +               if (ret)
>>> +                       goto deinit_sess;
>>>
>>> -       ret = venus_helper_vb2_start_streaming(inst);
>>> -       if (ret)
>>> -               goto deinit_sess;
>>> +               venus_helper_process_initial_out_bufs(inst);
>>> +               venus_helper_process_initial_cap_bufs(inst);
>>>
>>> -       inst->enc_state = VENUS_ENC_STATE_ENCODING;
>>> +               inst->enc_state = VENUS_ENC_STATE_ENCODING;
>>> +       } else if (inst->enc_state == VENUS_ENC_STATE_RESET &&
>>> +                  V4L2_TYPE_IS_CAPTURE(q->type)) {
>>> +               ret = venus_helper_vb2_start_streaming(inst);
>>> +               if (ret)
>>> +                       goto bufs_done;
>>>
>>> -       mutex_unlock(&inst->lock);
>>> +               venus_helper_process_initial_out_bufs(inst);
>>> +               venus_helper_process_initial_cap_bufs(inst);
>>>
>>> -       return 0;
>>> +               inst->enc_state = VENUS_ENC_STATE_ENCODING;
>>> +       } else if (inst->enc_state == VENUS_ENC_STATE_STOPPED &&
>>> +                  V4L2_TYPE_IS_OUTPUT(q->type)) {
>>> +               inst->enc_state = VENUS_ENC_STATE_ENCODING;
>>> +       }
>>> +
>>> +unlock:
>>> +       mutex_unlock(&inst->lock);
>>> +       return ret;
>>>
>>>  deinit_sess:
>>>         hfi_session_deinit(inst);
>>>  bufs_done:
>>>         venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_QUEUED);
>>> -       if (q->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
>>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>>>                 inst->streamon_out = 0;
>>>         else
>>>                 inst->streamon_cap = 0;
>>> @@ -943,33 +1019,97 @@ static int venc_start_streaming(struct
>>> vb2_queue *q, unsigned int count)
>>>         return ret;
>>>  }
>>>
>>> -static void venc_vb2_buf_queue(struct vb2_buffer *vb)
>>> +static int venc_stop_capture(struct venus_inst *inst)
>>> +{
>>> +       int ret;
>>> +
>>> +       switch (inst->enc_state) {
>>> +       case VENUS_ENC_STATE_ENCODING:
>>> +       case VENUS_ENC_STATE_DRAIN:
>>> +       case VENUS_ENC_STATE_STOPPED:
>>> +               inst->enc_state = VENUS_ENC_STATE_RESET;
>>> +               break;
>>> +       default:
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       ret = hfi_session_stop(inst);
>>> +       ret |= hfi_session_unload_res(inst);
>>> +       ret |= venus_helper_unregister_bufs(inst);
>>> +       ret |= venus_helper_intbufs_free(inst);
>>> +
>>> +       return ret;
>>> +}
>>> +
>>> +static int venc_stop_output(struct venus_inst *inst)
>>> +{
>>> +       switch (inst->enc_state) {
>>> +       case VENUS_ENC_STATE_ENCODING:
>>> +               inst->enc_state = VENUS_ENC_STATE_STOPPED;
>>> +               break;
>>> +       case VENUS_ENC_STATE_DRAIN:
>>> +               inst->enc_state = VENUS_ENC_STATE_STOPPED;
>>> +               break;
>>> +       default:
>>> +               return -EINVAL;
>>> +       }
>>> +
>>> +       return 0;
>>> +}
>>> +
>>> +static void venc_stop_streaming(struct vb2_queue *q)
>>> +{
>>> +       struct venus_inst *inst = vb2_get_drv_priv(q);
>>> +       int ret = -EINVAL;
>>> +
>>> +       mutex_lock(&inst->lock);
>>> +
>>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>>> +               ret = venc_stop_output(inst);
>>> +       else
>>> +               ret = venc_stop_capture(inst);
>>> +
>>> +       venus_helper_buffers_done(inst, q->type, VB2_BUF_STATE_ERROR);
>>> +
>>> +       if (ret)
>>> +               goto unlock;
>>> +
>>> +       if (V4L2_TYPE_IS_OUTPUT(q->type))
>>> +               inst->streamon_out = 0;
>>> +       else
>>> +               inst->streamon_cap = 0;
>>> +
>>> +unlock:
>>> +       mutex_unlock(&inst->lock);
>>> +}
>>> +
>>> +static void venc_buf_queue(struct vb2_buffer *vb)
>>>  {
>>>         struct venus_inst *inst = vb2_get_drv_priv(vb->vb2_queue);
>>>         struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>> +       struct v4l2_m2m_ctx *m2m_ctx = inst->m2m_ctx;
>>>
>>>         mutex_lock(&inst->lock);
>>>
>>> -       if (inst->enc_state == VENUS_ENC_STATE_STOPPED) {
>>> -               vbuf->sequence = inst->sequence_cap++;
>>> -               vbuf->field = V4L2_FIELD_NONE;
>>> -               vb2_set_plane_payload(vb, 0, 0);
>>> -               v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
>>> -               mutex_unlock(&inst->lock);
>>> -               return;
>>> -       }
>>> +       v4l2_m2m_buf_queue(m2m_ctx, vbuf);
>>> +
>>> +       if (!(inst->streamon_out && inst->streamon_cap))
>>> +               goto unlock;
>>> +
>>> +       venus_helper_process_buf(vb);
>>>
>>> -       venus_helper_vb2_buf_queue(vb);
>>> +unlock:
>>>         mutex_unlock(&inst->lock);
>>>  }
>>>
>>>  static const struct vb2_ops venc_vb2_ops = {
>>>         .queue_setup = venc_queue_setup,
>>> -       .buf_init = venus_helper_vb2_buf_init,
>>> +       .buf_init = venc_buf_init,
>>> +       .buf_cleanup = venc_buf_cleanup,
>>>         .buf_prepare = venus_helper_vb2_buf_prepare,
>>>         .start_streaming = venc_start_streaming,
>>> -       .stop_streaming = venus_helper_vb2_stop_streaming,
>>> -       .buf_queue = venc_vb2_buf_queue,
>>> +       .stop_streaming = venc_stop_streaming,
>>> +       .buf_queue = venc_buf_queue,
>>>  };
>>>
>>>  static void venc_buf_done(struct venus_inst *inst, unsigned int
>>> buf_type,
>>> @@ -1025,8 +1165,12 @@ static const struct hfi_inst_ops venc_hfi_ops = {
>>>         .event_notify = venc_event_notify,
>>>  };
>>>
>>> +static void venc_m2m_device_run(void *priv)
>>> +{
>>> +}
>>> +
>>>  static const struct v4l2_m2m_ops venc_m2m_ops = {
>>> -       .device_run = venus_helper_m2m_device_run,
>>> +       .device_run = venc_m2m_device_run,
>>>         .job_abort = venus_helper_m2m_job_abort,
>>>  };
>>>
>>> @@ -1098,11 +1242,9 @@ static int venc_open(struct file *file)
>>>         inst->core = core;
>>>         inst->session_type = VIDC_SESSION_TYPE_ENC;
>>>         inst->clk_data.core_id = VIDC_CORE_ID_DEFAULT;
>>> +       inst->enc_state = VENUS_ENC_STATE_INIT;
>>>         inst->core_acquired = false;
>>>
>>> -       if (inst->enc_state == VENUS_ENC_STATE_DEINIT)
>>> -               inst->enc_state = VENUS_ENC_STATE_INIT;
>>> -
>>>         venus_helper_init_instance(inst);
>>>
>>>         ret = pm_runtime_get_sync(core->dev_enc);
>>> @@ -1167,7 +1309,7 @@ static int venc_close(struct file *file)
>>>         mutex_destroy(&inst->lock);
>>>         v4l2_fh_del(&inst->fh);
>>>         v4l2_fh_exit(&inst->fh);
>>> -       inst->enc_state = VENUS_ENC_STATE_DEINIT;
>>> +
>>>         pm_runtime_put_sync(inst->core->dev_enc);
>>>
>>>         kfree(inst);
>>> -- 
>>> 2.17.1
>>>
> 
> Thanks,
> Vikash

-- 
regards,
Stan
