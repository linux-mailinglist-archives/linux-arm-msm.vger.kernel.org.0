Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC5257F454
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jul 2022 11:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231551AbiGXJVl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jul 2022 05:21:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231394AbiGXJVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jul 2022 05:21:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DB62214010
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658654499;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CQD2xwofWiChWZD5Abuxut34tayqB/fYJMY5NWUwUE4=;
        b=ZKq/E7MBFRSdX5E6lugjzRME4c6FJx1tlhnAewTdqWYNJsVH7nwI62sptTcc1fmT6Xlg7J
        xBMiPdsPh6xjXs90V+GAUYDSDGBbJpY6p398yppKSWXIGIivbYlMEYtG9PobEhDwTlxUrP
        Cg2oPoY4gnqu3OC+3wiKge5HJpEEOVU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-329-U4lwZjG4OQORXa5Qv3YGhQ-1; Sun, 24 Jul 2022 05:21:37 -0400
X-MC-Unique: U4lwZjG4OQORXa5Qv3YGhQ-1
Received: by mail-wm1-f70.google.com with SMTP id i133-20020a1c3b8b000000b003a2fe4c345cso3367381wma.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Jul 2022 02:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=CQD2xwofWiChWZD5Abuxut34tayqB/fYJMY5NWUwUE4=;
        b=NIYc15SOMBWVdvJXpVxicOaFj1PAoCwMeuHpI8e0SZ1/BTJAk8Z3HekmVC480opUNK
         qorCVGN1kGURPWJ7PeEtYgnPQercDflaA4h1UqVVxm1UAt8eEcIQ7r7sdXe7ll+YaXqK
         mHQPYLEj9RHRPpWvRhKnzZxOrIe83qaAzrYHMhLrGSe3LU/nZb8TsZcU8gnGOsRbBZLs
         LX7cqbb0H3s2VgLt2ohFYK+srMMzKY08FpdcQb2BUUhASYXP97mtdtjLCIr3u/BFc2nQ
         ZTv1tb2QsgEtfOxqp10EG4BfD6F4+R1lOXuYOgj1CUwQBHTtMWsFb7BtAHSs6FN6e9lt
         lNtA==
X-Gm-Message-State: AJIora/0aDpRcPgK2FYoz4gM5yiie1XYob88bp/8TQQhlKkKOKMhwwGh
        /qXtVUIVKFg3MUARe21Jsb5Q5o5mTLxczGIWafqpoiVRe6quTFH/b1Ym4cf/6Vtps9Gpu8H5QPJ
        /UBAAKFEh2EQ5Dq5bNe6gdAZAaw==
X-Received: by 2002:a05:600c:4fd4:b0:3a3:2c30:5749 with SMTP id o20-20020a05600c4fd400b003a32c305749mr4934458wmq.62.1658654495770;
        Sun, 24 Jul 2022 02:21:35 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQfFgxOgsOMpNytIhcbpqDEMBVPLcSwYXjuVdhK+uj3/JGPUaDozysqkQPXiHOH96z5Cmryw==
X-Received: by 2002:a05:600c:4fd4:b0:3a3:2c30:5749 with SMTP id o20-20020a05600c4fd400b003a32c305749mr4934436wmq.62.1658654495413;
        Sun, 24 Jul 2022 02:21:35 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g18-20020a05600c001200b003a31169a7f4sm13892191wmc.12.2022.07.24.02.21.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jul 2022 02:21:34 -0700 (PDT)
Message-ID: <b28c1fab-4476-8856-fca5-5f205af4b2c5@redhat.com>
Date:   Sun, 24 Jul 2022 11:21:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/msm: Make .remove and .shutdown HW shutdown
 consistent
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20220723210825.564922-1-javierm@redhat.com>
 <CAA8EJpqr3GmQ3=p5_02dAnrK8HrUsf1yYxVKZL6g27eZXZ_U8w@mail.gmail.com>
 <7dc80ce9-83d5-2dc2-f660-fb8f6162c893@redhat.com>
In-Reply-To: <7dc80ce9-83d5-2dc2-f660-fb8f6162c893@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 7/24/22 11:06, Javier Martinez Canillas wrote:

[...]

> 
> I guess one option is to do the if (dev->registered) check in the callers but
> then it won't really be worth it to have a helper and we could just add that
> check in msm_drv_shutdown() to conditionally call drm_atomic_helper_shutdown().
> 

By the way, the motivation of this patch is to fix a kernel oops during poweroff:

[  169.495897] systemd-shutdown[1]: Powering off.                                                                                                                                                                                             
[  169.500466] kvm: exiting hardware virtualization                                                                                                                                                                                           
[  169.554787] platform wifi-firmware.0: Removing from iommu group 12                                                                                                                                                                         
[  169.610238] platform video-firmware.0: Removing from iommu group 10                                                                                                                                                                        
[  169.682164] ------------[ cut here ]------------
[  169.686909] WARNING: CPU: 6 PID: 1 at drivers/gpu/drm/drm_modeset_lock.c:317 drm_modeset_lock_all_ctx+0x3c4/0x3d0   
[  169.697450] Modules linked in: af_alg rtl8192cu rtl_usb cros_ec_sensors rtl8192c_common cros_ec_sensors_core rtlwifi industrialio_triggered_buffer venus_enc venus_dec sbs_battery kfifo_buf cros_ec_typec videobuf2_dma_contig hid_multito
uch cros_usbpd_logger typec cros_ec_chardev cros_usbpd_charger videobuf2_memops ath10k_snoc ath10k_core hci_uart btqca venus_core btbcm ath mac80211 bluetooth v4l2_mem2mem videobuf2_v4l2 libarc4 videobuf2_common qcom_spmi_adc_tm5 qrtr cfg
80211 videodev qcom_spmi_adc5 qcom_q6v5_mss ecdh_generic qcom_pil_info ecc qcom_vadc_common mc crct10dif_ce qcom_spmi_temp_alarm rfkill qcom_q6v5 spi_geni_qcom qcom_sysmon qcom_common qmi_helpers snd_soc_max98357a socinfo ip6_tables ip_ta
bles x_tables ipmi_devintf ipmi_msghandler fuse zram zsmalloc ipv6                                                     
[  169.767126] CPU: 6 PID: 1 Comm: systemd-shutdow Tainted: G        W         5.19.0-rc7+ #20                         
[  169.775691] Hardware name: Google CoachZ (rev3+) (DT)
[  169.780874] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)                                         
[  169.788021] pc : drm_modeset_lock_all_ctx+0x3c4/0x3d0
[  169.793205] lr : drm_modeset_lock_all_ctx+0x48/0x3d0
[  169.798299] sp : ffff80000805bb80
[  169.801701] x29: ffff80000805bb80 x28: ffff327c00128000 x27: 0000000000000000                                       
[  169.809025] x26: 0000000000000000 x25: 0000000000000001 x24: ffffc95d820ec030                                       
[  169.816349] x23: ffff327c00bbd090 x22: ffffc95d8215eca0 x21: ffff327c039c5800                                       
[  169.823674] x20: ffff327c039c5988 x19: ffff80000805bbe8 x18: 0000000000000034                                       
[  169.830998] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000                                       
[  169.838322] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000                                       
[  169.845646] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000                                       
[  169.852971] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000                                       
[  169.860295] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000                                       
[  169.867619] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : ffff327c039c59b0                                       
[  169.874944] Call trace:                                 
[  169.877467]  drm_modeset_lock_all_ctx+0x3c4/0x3d0
[  169.882297]  drm_atomic_helper_shutdown+0x70/0x134
[  169.887217]  msm_drv_shutdown+0x30/0x40
[  169.891159]  platform_shutdown+0x28/0x40
[  169.895191]  device_shutdown+0x148/0x350
[  169.899221]  kernel_power_off+0x38/0x80
[  169.903163]  __do_sys_reboot+0x288/0x2c0
[  169.907192]  __arm64_sys_reboot+0x28/0x34
[  169.911309]  invoke_syscall+0x48/0x114
[  169.915162]  el0_svc_common.constprop.0+0x44/0xec
[  169.919992]  do_el0_svc+0x2c/0xc0
[  169.923394]  el0_svc+0x2c/0x84
[  169.926535]  el0t_64_sync_handler+0x11c/0x150
[  169.931013]  el0t_64_sync+0x18c/0x190
[  169.934777] ---[ end trace 0000000000000000 ]---
[  169.939557] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000018
[  169.948574] Mem abort info:                                                                                         
[  169.951452]   ESR = 0x0000000096000004           
[  169.955307]   EC = 0x25: DABT (current EL), IL = 32 bits
[  169.960765]   SET = 0, FnV = 0                                                                                      
[  169.963901]   EA = 0, S1PTW = 0                                                                                     
[  169.967127]   FSC = 0x04: level 0 translation fault
[  169.972136] Data abort info:
[  169.975093]   ISV = 0, ISS = 0x00000004
[  169.979037]   CM = 0, WnR = 0
[  169.982083] user pgtable: 4k pages, 48-bit VAs, pgdp=000000010eab1000                                               
[  169.988697] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000                                           
[  169.995669] Internal error: Oops: 96000004 [#1] PREEMPT SMP                                                         
[  170.001396] Modules linked in: af_alg rtl8192cu rtl_usb cros_ec_sensors rtl8192c_common cros_ec_sensors_core rtlwifi industrialio_triggered_buffer venus_enc venus_dec sbs_battery kfifo_buf cros_ec_typec videobuf2_dma_contig hid_multito
uch cros_usbpd_logger typec cros_ec_chardev cros_usbpd_charger videobuf2_memops ath10k_snoc ath10k_core hci_uart btqca venus_core btbcm ath mac80211 bluetooth v4l2_mem2mem videobuf2_v4l2 libarc4 videobuf2_common qcom_spmi_adc_tm5 qrtr cfg
80211 videodev qcom_spmi_adc5 qcom_q6v5_mss ecdh_generic qcom_pil_info ecc qcom_vadc_common mc crct10dif_ce qcom_spmi_temp_alarm rfkill qcom_q6v5 spi_geni_qcom qcom_sysmon qcom_common qmi_helpers snd_soc_max98357a socinfo ip6_tables ip_ta
bles x_tables ipmi_devintf ipmi_msghandler fuse zram zsmalloc ipv6                                                     
[  170.071041] CPU: 6 PID: 1 Comm: systemd-shutdow Tainted: G        W         5.19.0-rc7+ #20                         
[  170.079614] Hardware name: Google CoachZ (rev3+) (DT)
[  170.084801] pstate: a0400009 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)                                         
[  170.091941] pc : ww_mutex_lock+0x28/0x32c
[  170.096064] lr : drm_modeset_lock_all_ctx+0x1b0/0x3d0
[  170.101254] sp : ffff80000805bb50
[  170.104658] x29: ffff80000805bb50 x28: ffff327c00128000 x27: 0000000000000000                                       
[  170.111977] x26: 0000000000000000 x25: 0000000000000001 x24: 0000000000000018                                       
[  170.119296] x23: ffff80000805bc10 x22: ffff327c039c5ad8 x21: ffff327c039c5800                                       
[  170.126615] x20: ffff80000805bbe8 x19: 0000000000000018 x18: 0000000000000034                                       
[  170.133933] x17: 000000040044ffff x16: ffffc95d80cac920 x15: 0000000000000000                                       
[  170.141252] x14: 0000000000000315 x13: 0000000000000315 x12: 0000000000000000                                       
[  170.148571] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000                                       
[  170.155890] x8 : ffff80000805bc28 x7 : 0000000000000000 x6 : 0000000000000000                                       
[  170.163209] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000000                                       
[  170.170528] x2 : ffff327c00128000 x1 : 0000000000000000 x0 : 0000000000000018                                       
[  170.177847] Call trace:                                 
[  170.180364]  ww_mutex_lock+0x28/0x32c
[  170.184127]  drm_modeset_lock_all_ctx+0x1b0/0x3d0
[  170.188957]  drm_atomic_helper_shutdown+0x70/0x134
[  170.193876]  msm_drv_shutdown+0x30/0x40
[  170.197820]  platform_shutdown+0x28/0x40
[  170.201854]  device_shutdown+0x148/0x350
[  170.205888]  kernel_power_off+0x38/0x80
[  170.209832]  __do_sys_reboot+0x288/0x2c0
[  170.213866]  __arm64_sys_reboot+0x28/0x34
[  170.217990]  invoke_syscall+0x48/0x114
[  170.221843]  el0_svc_common.constprop.0+0x44/0xec
[  170.226672]  do_el0_svc+0x2c/0xc0
[  170.230079]  el0_svc+0x2c/0x84
[  170.233215]  el0t_64_sync_handler+0x11c/0x150
[  170.237686]  el0t_64_sync+0x18c/0x190
[  170.241451] Code: aa0103f4 d503201f d2800001 aa0103e3 (c8e37c02)                                                    
[  170.247704] ---[ end trace 0000000000000000 ]---
[  170.252457] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b                                 
[  170.260654] Kernel Offset: 0x495d77c00000 from 0xffff800008000000                                                   
[  170.266910] PHYS_OFFSET: 0xffffcd8500000000
[  170.271212] CPU features: 0x800,00c2a015,19801c82
[  170.276042] Memory Limit: none                                                                                      
[  170.279183] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

