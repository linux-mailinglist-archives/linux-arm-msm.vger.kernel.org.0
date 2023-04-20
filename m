Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A98F6E974F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 16:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjDTOhX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 10:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbjDTOhV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 10:37:21 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0B143A8B
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 07:37:19 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l15so3025130ljq.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 07:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682001438; x=1684593438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FFnlJ6IPLJiXgZ+usawh9hc3QyVA/TfElwRSCMP1YKY=;
        b=z6klQflWiOHTnhUAVXNPRxiQyWVzRCkOF+nxe3qwjrKpvYQ0c8fdMQy5AqYR3q6JrI
         i1S4+guEniNWQcmSl+M/Yzpq+dfdS5Bj7dlL7gG41k2Z6KZK2vdsJIsn5YiChcw1qFrz
         AbRbti+YXbZMY/X8oVORZPXVMDyk5Mb/bVLTmUP5aDFT/tdAqv+D6FBSk5YB0ol8rtvJ
         jU/PVpJE1Iv+E5B6NWvjywxHhvytpk8Rt5dThE6U4it/DPrxWKG3ny1oQmjAkqGl3I0D
         /0OfLQtvrRrLVL0Mv+l2dJRxCQabVKKm0mEtH8/OqT2tgyEOYUqWq24g+C8c0x3YVY5M
         I9yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682001438; x=1684593438;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FFnlJ6IPLJiXgZ+usawh9hc3QyVA/TfElwRSCMP1YKY=;
        b=V99jk9zDx6mwuIcdCPe/eSAkQRqseWDQUJhP0Mdape4SPypEe6pFhLKLUiU6u1b0yP
         yZJ75notlenWz6LwXJPKyp+niD7dSpE37bj0RIbHb3s9en/SaEk1f/r/PNPeYGmqpUtL
         rp9wDmISVuClecE7pNGzed3hVbqBnly6h4AdyNFgkWjdnFQg9xThoFrYr07+A6Pjn9Ws
         AqvJpbGvt2Jd9jpOgxX3yswE9AIe1n1nle90zPaMl1lBLjQxRrQ8ASifJ2CwybKNKDpq
         8amdnFT+lHxSOIyOBZAVs6s6NnRIax/3HDZe6I3nvAhXa9BlhfDjRehm3lkfMsqdFoNr
         0Ckw==
X-Gm-Message-State: AAQBX9e7QC18ndN5fMe/P6y5thddkRcv9kmLza15kfk5HWgWE6Njb9Tn
        S31V8apTmzZ/VVPajTYxF5iC4A==
X-Google-Smtp-Source: AKy350ZpdMtuG/0Tpzm5teiN31A6tAjNCXvueSOpOgIpb7lGzeNDOFyDiRJmoL5S3zhmpMHw4jN6oA==
X-Received: by 2002:a2e:9851:0:b0:2a8:ce32:864 with SMTP id e17-20020a2e9851000000b002a8ce320864mr501831ljj.16.1682001437831;
        Thu, 20 Apr 2023 07:37:17 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v22-20020ac25596000000b004e845b49d81sm237902lfg.140.2023.04.20.07.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 07:37:17 -0700 (PDT)
Message-ID: <33f006e1-d57d-8f64-bef3-43b298a67049@linaro.org>
Date:   Thu, 20 Apr 2023 17:37:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/msm/atomic: Don't try async if crtc not active
Content-Language: en-GB
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20230418164158.549873-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418164158.549873-1-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/04/2023 19:41, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> For a similar reason as commit f2c7ca890182 ("drm/atomic-helper: Don't
> set deadline for modesets"), we need the crtc to be already active in
> order to compute a target vblank time for an async commit.  Otherwise
> we get this splat reminding us that we are doing it wrong:
> 
>     ------------[ cut here ]------------
>     msm_dpu ae01000.mdp: drm_WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev))
>     WARNING: CPU: 7 PID: 1923 at drivers/gpu/drm/drm_vblank.c:728 drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
>     Modules linked in: snd_seq_dummy snd_seq snd_seq_device bridge stp llc tun vhost_vsock vhost vhost_iotlb vmw_vsock_virtio_transport_common vsock uinput rfcomm algif_hash algif_skcipher af_alg veth venus_dec venus_enc cros_ec_typec typec qcom_spmi_temp_alarm qcom_spmi_adc_tm5 qcom_spmi_adc5 xt_cgroup qcom_vadc_common qcom_stats hci_uart btqca xt_MASQUERADE venus_core 8021q coresight_tmc coresight_funnel coresight_etm4x coresight_replicator snd_soc_lpass_sc7180 coresight snd_soc_sc7180 ip6table_nat fuse ath10k_snoc ath10k_core ath mac80211 iio_trig_sysfs bluetooth cfg80211 cros_ec_sensors cros_ec_sensors_core ecdh_generic industrialio_triggered_buffer ecc kfifo_buf cros_ec_sensorhub r8153_ecm cdc_ether usbnet r8152 mii lzo_rle lzo_compress zram hid_vivaldi hid_google_hammer hid_vivaldi_common joydev
>     CPU: 7 PID: 1923 Comm: DrmThread Not tainted 5.15.107-18853-g3be267609a0b-dirty #16 a1ffc1a66e79c21c3536d8c9a42e819236e39714
>     Hardware name: Google Wormdingler rev1+ BOE panel board (DT)
>     pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
>     lr : drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x144/0x370
>     sp : ffffffc012e2b800
>     x29: ffffffc012e2b840 x28: ffffff8083676094 x27: ffffffc012e2bb28
>     x26: ffffff8084539800 x25: 0000000000000000 x24: ffffff8083676000
>     x23: ffffffd3c8cdc5a0 x22: ffffff80845b9d00 x21: ffffffc012e2b8b4
>     x20: ffffffc012e2b910 x19: 0000000000000001 x18: 0000000000000000
>     x17: 0000000000000000 x16: 0000000000000010 x15: ffffffd3c8451a88
>     x14: 0000000000000003 x13: 0000000000000004 x12: 0000000000000001
>     x11: c0000000ffffdfff x10: ffffffd3c973ef58 x9 : 8ea3526b3cc95900
>     x8 : 8ea3526b3cc95900 x7 : 0000000000000000 x6 : 000000000000003a
>     x5 : ffffffd3c99676cd x4 : 0000000000000000 x3 : ffffffc012e2b4b8
>     x2 : ffffffc012e2b4c0 x1 : 00000000ffffdfff x0 : 0000000000000000
>     Call trace:
>      drm_crtc_vblank_helper_get_vblank_timestamp_internal+0x148/0x370
>      drm_crtc_vblank_helper_get_vblank_timestamp+0x20/0x30
>      drm_crtc_get_last_vbltimestamp+0x68/0xb0
>      drm_crtc_next_vblank_start+0x5c/0xa8
>      msm_atomic_commit_tail+0x264/0x664
>      commit_tail+0xac/0x160
>      drm_atomic_helper_commit+0x160/0x168
>      drm_atomic_commit+0xfc/0x128
>      drm_atomic_helper_disable_plane+0x8c/0x110
>      __setplane_atomic+0x10c/0x138
>      drm_mode_cursor_common+0x3a8/0x410
>      drm_mode_cursor_ioctl+0x48/0x70
>      drm_ioctl_kernel+0xe0/0x158
>      drm_ioctl+0x25c/0x4d8
>      __arm64_sys_ioctl+0x98/0xd0
>      invoke_syscall+0x4c/0x100
>      el0_svc_common+0x98/0x104
>      do_el0_svc+0x30/0x90
>      el0_svc+0x20/0x50
>      el0t_64_sync_handler+0x78/0x108
>      el0t_64_sync+0x1a4/0x1a8
>     ---[ end trace a0f587e1ab9589e8 ]---
> 
> Fixes: 52ff0d3073d2 ("drm/msm/atomic: Switch to vblank_start helper")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/msm_atomic.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

