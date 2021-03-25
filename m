Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1543C349AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 20:50:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbhCYTty (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 15:49:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhCYTtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 15:49:50 -0400
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com [IPv6:2607:f8b0:4864:20::c34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC8CCC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 12:49:45 -0700 (PDT)
Received: by mail-oo1-xc34.google.com with SMTP id h3-20020a4ae8c30000b02901b68b39e2d3so759613ooe.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 12:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=nPyfa3tdZg5YJlujQBMN77iBdGymMtxtucxMRbtykRw=;
        b=QMtupPrOLFcTY12pZ6EL/DsVqmckaCyZPUrR8LE3Fw7H6dEut3cVxma4aoST9B0L7O
         4zM1qbp4e1gXoyTfUOtkueMnXZRU4Jz+x4nOTHX0GZfw/SNQZnzThvcqagJjLW+8rmI+
         5G+pyZ//hFZu1zS8rlMh8YvGHKdoZifH7BmUAH+3yh9gfgdBqYxqSbQ5e2myX2WDBv5s
         HeNg+ZntRv0dzdz29evT/iGzih2D/LR4ZhGUTi228jwIsv/b6geWy88S23dpE+q+eKgL
         m0Z9WTyVRGE0Um/GKDntiPJLp/mThpHpNAqqb2+dxOO3mEa1PmqbNaHh8yFm78ssWae4
         hsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=nPyfa3tdZg5YJlujQBMN77iBdGymMtxtucxMRbtykRw=;
        b=s21TUnz3PTeeoS3fDT29xlEZf5u7Q+KQztOSlD+164qQdkaaXUsIzoDv27jK92uy86
         cM38rUN6N4W/4KIvUqoUon5+vjRNjsfKb8fGQMPxV57cpqyFO9kjWzSWTG7114hJ3ZNG
         uS5RNqFGTK/8zTeM3amQ4aOl1uqWM402YMHbXReKFuawxzgyavDKfnNWM+/YXBrorTCF
         uJWg3OkJ7oY9ZEq//9Zygem5D6PfehprEBPdkvOyuGc+LyB5KpeXhwEgHlroTvHATynr
         TZO0uKMFwMXzAlCce/vdX6dUmaTkDgHS5f78zuiSjgwO0PWoViSci1DNUQCXrfriX8l4
         gNFw==
X-Gm-Message-State: AOAM533TbJYp7cK+Gmq58QTyuW5xGtlb68/8qK/h/U8UFx1mF1+rdhnM
        O6GQAPHWlcIx1Nk7xdwRv75vN833i8kGtOXo
X-Google-Smtp-Source: ABdhPJxcZVt5lIkooKV44FXaC8t8PEvdeP2XTy2xq+BbHfk+bWRlFYO9tKEzM9R1d9QDMEI4sJ+xdQ==
X-Received: by 2002:a4a:dd14:: with SMTP id m20mr8365125oou.47.1616701784120;
        Thu, 25 Mar 2021 12:49:44 -0700 (PDT)
Received: from MacBook-Pro.hackershack.net (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id i4sm738161otj.56.2021.03.25.12.49.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 12:49:43 -0700 (PDT)
To:     linux-arm-msm <linux-arm-msm@vger.kernel.org>
From:   Steev Klimaszewski <steev@kali.org>
Subject: Boot issues with 5.11.9 on Lenovo Yoga C630 in qcom-ngd-ctrl
Message-ID: <bb5ee15c-6477-7714-8473-aff52cf0fe52@kali.org>
Date:   Thu, 25 Mar 2021 14:49:42 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey all, I'm running into a weird boot issue with 5.11.9 and I'm not
even sure why, as it's a config option that I seem to be missing and/or
a dependency isn't being properly declared.  

A full dmesg output of a failed boot can be found at
https://dpaste.com/8B35ASEJU - problematic lines seem to start around
1277 (I'm copying and pasting in from a different log, but the results
are the same, just different times.)

Mar 24 23:14:29 c630 kernel: [    9.785159] qcom,slim-ngd-ctrl
171c0000.slim: Failed to request RX dma channel
Mar 24 23:14:29 c630 kernel: [    9.785173] qcom,slim-ngd-ctrl
171c0000.slim: rx dma init failed

Which then eventually leads to a NULL pointer dereference:

Mar 24 23:14:29 c630 kernel: [   12.029331] Unable to handle kernel NULL
pointer dereference at virtual address 0000000000000028
Mar 24 23:14:29 c630 kernel: [   12.031582] Mem abort info:
Mar 24 23:14:29 c630 kernel: [   12.033938]   ESR = 0x96000044
Mar 24 23:14:29 c630 kernel: [   12.031582] Mem abort info:
Mar 24 23:14:29 c630 kernel: [   12.033938]   ESR = 0x96000044
Mar 24 23:14:29 c630 kernel: [   12.035302]   EC = 0x25: DABT (current
EL), IL = 32 bits
Mar 24 23:14:29 c630 kernel: [   12.036673]   SET = 0, FnV = 0
Mar 24 23:14:29 c630 kernel: [   12.038043]   EA = 0, S1PTW = 0
Mar 24 23:14:29 c630 kernel: [   12.035302]   EC = 0x25: DABT (current
EL), IL = 32 bits
Mar 24 23:14:29 c630 kernel: [   12.036673]   SET = 0, FnV = 0
Mar 24 23:14:29 c630 kernel: [   12.038043]   EA = 0, S1PTW = 0
Mar 24 23:14:29 c630 kernel: [   12.039587] Data abort info:
Mar 24 23:14:29 c630 kernel: [   12.040938]   ISV = 0, ISS = 0x00000044
Mar 24 23:14:29 c630 kernel: [   12.041898]   CM = 0, WnR = 1
Mar 24 23:14:29 c630 kernel: [   12.039587] Data abort info:
Mar 24 23:14:29 c630 kernel: [   12.040938]   ISV = 0, ISS = 0x00000044
Mar 24 23:14:29 c630 kernel: [   12.041898]   CM = 0, WnR = 1
Mar 24 23:14:30 c630 kernel: [   12.042771] user pgtable: 4k pages,
48-bit VAs, pgdp=000000010919d000
Mar 24 23:14:30 c630 kernel: [   12.043658] [0000000000000028]
pgd=0000000000000000, p4d=0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.044559] Internal error: Oops:
96000044 [#1] SMP
Mar 24 23:14:30 c630 kernel: [   12.045597] Modules linked in: q6asm_dai
xt_tcpudp nft_compat q6routing bridge stp llc cpufreq_powersave
cpufreq_ondemand cpufreq_userspace cpufreq_conservative nf_tables
q6afe_dai q6asm q6adm q6dsp_common q6afe q6core nfnetlink wcd934x
regmap_slimbus binfmt_misc nls_ascii nls_cp437 venus_enc vfat fat
venus_dec videobuf2_dma_sg ath10k_snoc ath10k_core ath mac80211 uvcvideo
hci_uart apr btqca btrtl videobuf2_vmalloc videobuf2_memops btbcm
venus_core v4l2_mem2mem btintel videobuf2_v4l2 videobuf2_common videodev
mc fastrpc bluetooth qrtr_smd snd_soc_sdm845 snd_soc_rt5663
snd_soc_qcom_common snd_soc_rl6231 soundwire_bus snd_soc_core
snd_compress snd_pcm_dmaengine snd_pcm snd_timer snd ecdh_generic ecc
soundcore qcom_spmi_adc5 qcom_spmi_temp_alarm qcom_vadc_common
industrialio hid_multitouch joydev qcom_rng pm8941_pwrkey bfq
qcom_q6v5_mss cfg80211 sg qcom_wdt qrtr ns rfkill libarc4
slim_qcom_ngd_ctrl evdev pdr_interface slimbus qcom_q6v5_pas
qcom_pil_info qcom_common qcom_q6v5 qcom_sysmon
Mar 24 23:14:30 c630 kernel: [   12.045742]  rmtfs_mem tcp_bbr sch_fq
fuse configfs sunrpc efivarfs ip_tables x_tables autofs4 ext4 mbcache
jbd2 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx xor xor_neon raid6_pq libcrc32c raid1 raid0 multipath linear
md_mod qmi_helpers aes_ce_blk crypto_simd cryptd aes_ce_cipher
crct10dif_ce ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce rtc_pm8xxx
ti_sn65dsi86 msm mdt_loader llcc_qcom ocmem drm_kms_helper camcc_sdm845
panel_simple gpio_keys drm
Mar 24 23:14:30 c630 kernel: [   12.055839] CPU: 6 PID: 57 Comm:
kworker/6:1 Not tainted 5.11.9 #1
Mar 24 23:14:30 c630 kernel: [   12.057202] Hardware name: LENOVO
81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
Mar 24 23:14:30 c630 kernel: [   12.060191] Workqueue: events
deferred_probe_work_func
Mar 24 23:14:30 c630 kernel: [   12.063238] pstate: 20400005 (nzCv daif
+PAN -UAO -TCO BTYPE=--)
Mar 24 23:14:30 c630 kernel: [   12.066290] pc :
qcom_slim_ngd_xfer_msg+0x16c/0x638 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.069388] lr :
qcom_slim_ngd_xfer_msg_sync+0x68/0xd8 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.072487] sp : ffff80001069b8f0
Mar 24 23:14:30 c630 kernel: [   12.075574] x29: ffff80001069b8f0 x28:
ffff40790a02e080
Mar 24 23:14:30 c630 kernel: [   12.078685] x27: ffff800010333cc8 x26:
ffff407880c2146c
Mar 24 23:14:30 c630 kernel: [   12.081781] x25: ffff80001069bb34 x24:
ffff40790a02e378
Mar 24 23:14:30 c630 kernel: [   12.084872] x23: 0000000000ff0000 x22:
ffff4078803ee900
Mar 24 23:14:30 c630 kernel: [   12.087948] x21: ffff40790a02f3a0 x20:
0000000000000028
Mar 24 23:14:30 c630 kernel: [   12.091014] x19: ffff80001069baf0 x18:
0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.042771] user pgtable: 4k pages,
48-bit VAs, pgdp=000000010919d000
Mar 24 23:14:30 c630 kernel: [   12.043658] [0000000000000028]
pgd=0000000000000000, p4d=0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.044559] Internal error: Oops:
96000044 [#1] SMP
Mar 24 23:14:30 c630 kernel: [   12.045597] Modules linked in: q6asm_dai
xt_tcpudp nft_compat q6routing bridge stp llc cpufreq_powersave
cpufreq_ondemand cpufreq_userspace cpufreq_conservative nf_tables
q6afe_dai q6asm q6adm q6dsp_common q6afe q6core nfnetlink wcd934x
regmap_slimbus binfmt_misc nls_ascii nls_cp437 venus_enc vfat fat
venus_dec videobuf2_dma_sg ath10k_snoc ath10k_core ath mac80211 uvcvideo
hci_uart apr btqca btrtl videobuf2_vmalloc videobuf2_memops btbcm
venus_core v4l2_mem2mem btintel videobuf2_v4l2 videobuf2_common videodev
mc fastrpc bluetooth qrtr_smd snd_soc_sdm845 snd_soc_rt5663
snd_soc_qcom_common snd_soc_rl6231 soundwire_bus snd_soc_core
snd_compress snd_pcm_dmaengine snd_pcm snd_timer snd ecdh_generic ecc
soundcore qcom_spmi_adc5 qcom_spmi_temp_alarm qcom_vadc_common
industrialio hid_multitouch joydev qcom_rng pm8941_pwrkey bfq
qcom_q6v5_mss cfg80211 sg qcom_wdt qrtr ns rfkill libarc4
slim_qcom_ngd_ctrl evdev pdr_interface slimbus qcom_q6v5_pas
qcom_pil_info qcom_common qcom_q6v5 qcom_sysmon
Mar 24 23:14:30 c630 kernel: [   12.045742]  rmtfs_mem tcp_bbr sch_fq
fuse configfs sunrpc efivarfs ip_tables x_tables autofs4 ext4 mbcache
jbd2 raid10 raid456 async_raid6_recov async_memcpy async_pq async_xor
async_tx xor xor_neon raid6_pq libcrc32c raid1 raid0 multipath linear
md_mod qmi_helpers aes_ce_blk crypto_simd cryptd aes_ce_cipher
crct10dif_ce ghash_ce gf128mul sha2_ce sha256_arm64 sha1_ce rtc_pm8xxx
ti_sn65dsi86 msm mdt_loader llcc_qcom ocmem drm_kms_helper camcc_sdm845
panel_simple gpio_keys drm
Mar 24 23:14:30 c630 kernel: [   12.055839] CPU: 6 PID: 57 Comm:
kworker/6:1 Not tainted 5.11.9 #1
Mar 24 23:14:30 c630 kernel: [   12.057202] Hardware name: LENOVO
81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
Mar 24 23:14:30 c630 kernel: [   12.060191] Workqueue: events
deferred_probe_work_func
Mar 24 23:14:30 c630 kernel: [   12.063238] pstate: 20400005 (nzCv daif
+PAN -UAO -TCO BTYPE=--)
Mar 24 23:14:30 c630 kernel: [   12.066290] pc :
qcom_slim_ngd_xfer_msg+0x16c/0x638 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.069388] lr :
qcom_slim_ngd_xfer_msg_sync+0x68/0xd8 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.072487] sp : ffff80001069b8f0
Mar 24 23:14:30 c630 kernel: [   12.075574] x29: ffff80001069b8f0 x28:
ffff40790a02e080
Mar 24 23:14:30 c630 kernel: [   12.078685] x27: ffff800010333cc8 x26:
ffff407880c2146c
Mar 24 23:14:30 c630 kernel: [   12.081781] x25: ffff80001069bb34 x24:
ffff40790a02e378
Mar 24 23:14:30 c630 kernel: [   12.084872] x23: 0000000000ff0000 x22:
ffff4078803ee900
Mar 24 23:14:30 c630 kernel: [   12.087948] x21: ffff40790a02f3a0 x20:
0000000000000028
Mar 24 23:14:30 c630 kernel: [   12.091014] x19: ffff80001069baf0 x18:
0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.094070] x17: 0000000000000000 x16:
0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.097115] x15: 0000000000000000 x14:
0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.100139] x13: 0000000000000003 x12:
0000000000000074
Mar 24 23:14:30 c630 kernel: [   12.103137] x11: 071c71c71c71c71c x10:
0000000000000001
Mar 24 23:14:30 c630 kernel: [   12.106111] x9 : ffffd84daaa42de8 x8 :
0000000000000220
Mar 24 23:14:30 c630 kernel: [   12.109055] x7 : ffffffffffffffff x6 :
ffff40788397a218
Mar 24 23:14:30 c630 kernel: [   12.111971] x5 : 0000000000000000 x4 :
ffff80001069b978
Mar 24 23:14:30 c630 kernel: [   12.114869] x3 : 0000000000000000 x2 :
0000000000000028
Mar 24 23:14:30 c630 kernel: [   12.117766] x1 : ffff40790a02e0b0 x0 :
000000000000000a
Mar 24 23:14:30 c630 kernel: [   12.120664] Call trace:
Mar 24 23:14:30 c630 kernel: [   12.123544] 
qcom_slim_ngd_xfer_msg+0x16c/0x638 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.126480] 
qcom_slim_ngd_xfer_msg_sync+0x68/0xd8 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.129408] 
qcom_slim_ngd_get_laddr+0xdc/0x278 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.132323] 
slim_device_alloc_laddr+0x60/0x178 [slimbus]
Mar 24 23:14:30 c630 kernel: [   12.135216]  slim_device_probe+0x84/0xa0
[slimbus]
Mar 24 23:14:30 c630 kernel: [   12.138113]  really_probe+0xf0/0x4d8
Mar 24 23:14:30 c630 kernel: [   12.141010]  driver_probe_device+0xfc/0x168
Mar 24 23:14:30 c630 kernel: [   12.143908] 
__device_attach_driver+0x94/0x120
Mar 24 23:14:30 c630 kernel: [   12.146818]  bus_for_each_drv+0x80/0xd0
Mar 24 23:14:30 c630 kernel: [   12.149705]  __device_attach+0xf8/0x178
Mar 24 23:14:30 c630 kernel: [   12.152570]  device_initial_probe+0x1c/0x28
Mar 24 23:14:30 c630 kernel: [   12.155413]  bus_probe_device+0xa4/0xb0
Mar 24 23:14:30 c630 kernel: [   12.158248] 
deferred_probe_work_func+0xa0/0xf0
Mar 24 23:14:30 c630 kernel: [   12.161094]  process_one_work+0x1e0/0x498
Mar 24 23:14:30 c630 kernel: [   12.163954]  worker_thread+0x158/0x4c0
Mar 24 23:14:30 c630 kernel: [   12.166812]  kthread+0x104/0x130
Mar 24 23:14:30 c630 kernel: [   12.169676]  ret_from_fork+0x10/0x34
Mar 24 23:14:30 c630 kernel: [   12.172541] Code: 53103ef7 b9007fff
51000400 39000260 (b900029f)
Mar 24 23:14:30 c630 kernel: [   12.175415] ---[ end trace
d5a10ca5a9f43b60 ]---
Mar 24 23:14:30 c630 kernel: [   12.094070] x17: 0000000000000000 x16:
0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.097115] x15: 0000000000000000 x14:
0000000000000000
Mar 24 23:14:30 c630 kernel: [   12.100139] x13: 0000000000000003 x12:
0000000000000074
Mar 24 23:14:30 c630 kernel: [   12.103137] x11: 071c71c71c71c71c x10:
0000000000000001
Mar 24 23:14:30 c630 kernel: [   12.106111] x9 : ffffd84daaa42de8 x8 :
0000000000000220
Mar 24 23:14:30 c630 kernel: [   12.109055] x7 : ffffffffffffffff x6 :
ffff40788397a218
Mar 24 23:14:30 c630 kernel: [   12.111971] x5 : 0000000000000000 x4 :
ffff80001069b978
Mar 24 23:14:30 c630 kernel: [   12.114869] x3 : 0000000000000000 x2 :
0000000000000028
Mar 24 23:14:30 c630 kernel: [   12.117766] x1 : ffff40790a02e0b0 x0 :
000000000000000a
Mar 24 23:14:30 c630 kernel: [   12.120664] Call trace:
Mar 24 23:14:30 c630 kernel: [   12.123544] 
qcom_slim_ngd_xfer_msg+0x16c/0x638 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.126480] 
qcom_slim_ngd_xfer_msg_sync+0x68/0xd8 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.129408] 
qcom_slim_ngd_get_laddr+0xdc/0x278 [slim_qcom_ngd_ctrl]
Mar 24 23:14:30 c630 kernel: [   12.132323] 
slim_device_alloc_laddr+0x60/0x178 [slimbus]
Mar 24 23:14:30 c630 kernel: [   12.135216]  slim_device_probe+0x84/0xa0
[slimbus]
Mar 24 23:14:30 c630 kernel: [   12.138113]  really_probe+0xf0/0x4d8
Mar 24 23:14:30 c630 kernel: [   12.141010]  driver_probe_device+0xfc/0x168
Mar 24 23:14:30 c630 kernel: [   12.143908] 
__device_attach_driver+0x94/0x120
Mar 24 23:14:30 c630 kernel: [   12.146818]  bus_for_each_drv+0x80/0xd0
Mar 24 23:14:30 c630 kernel: [   12.149705]  __device_attach+0xf8/0x178
Mar 24 23:14:30 c630 kernel: [   12.152570]  device_initial_probe+0x1c/0x28
Mar 24 23:14:30 c630 kernel: [   12.155413]  bus_probe_device+0xa4/0xb0
Mar 24 23:14:30 c630 kernel: [   12.158248] 
deferred_probe_work_func+0xa0/0xf0
Mar 24 23:14:30 c630 kernel: [   12.161094]  process_one_work+0x1e0/0x498
Mar 24 23:14:30 c630 kernel: [   12.163954]  worker_thread+0x158/0x4c0
Mar 24 23:14:30 c630 kernel: [   12.166812]  kthread+0x104/0x130
Mar 24 23:14:30 c630 kernel: [   12.169676]  ret_from_fork+0x10/0x34
Mar 24 23:14:30 c630 kernel: [   12.172541] Code: 53103ef7 b9007fff
51000400 39000260 (b900029f)
Mar 24 23:14:30 c630 kernel: [   12.175415] ---[ end trace
d5a10ca5a9f43b60 ]---

I did a diff of a working config (with 5.11.9) versus the config where
the above happens, looking at differences between QCOM and DMA, and
those can be found at https://pastebin.com/Z2LwDXeh (working config is
"-", non-working config is "+")

For giggles, I attempted to take the non-working config and make
QCOM_BAM_DMA built-in, instead of module, assuming that maybe that was
the issue, and see if that would at least work around the issue, but
that did nothing.

I tried talking about it a bit with bamse on IRC last night, but my
skills aren't really up to snuff on this, and he asked which pointer is
NULL, and I'm not sure; he also mentioned something about the return
value of qcom_slim_ngd_init_dma() being ignored, so there's possibly an
issue there as well.

The configs themselves are/can be found at http://dpaste.com/6AEEDXX2D
(working) and https://paste.ubuntu.com/p/cxSSYYQx4w - apologies for
using pastebins all over the place, but some reported that what I was
attempting to paste is too big.  Essentially, the non-working config is
closer to a distro defconfig, and mine is closer to the defconfig with a
few extra bits that I would use in Kali. 

The kernel tree that I'm using is https://github.com/steev/linux-1.git
branch is linux-5.11.y - this is the stable 5.11 tree, with the patches
for c630 and flex 5g applied on top.

--steev


