Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A452D648C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 19:12:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387633AbgLJSLa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Dec 2020 13:11:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391053AbgLJSLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Dec 2020 13:11:17 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50801C0613CF;
        Thu, 10 Dec 2020 10:10:37 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id y23so6288060wmi.1;
        Thu, 10 Dec 2020 10:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wDwuL12IczAPOhxBFyPNsIIWvM6LMR+E8NDDRLcU6Nw=;
        b=g2y0TAtRoMP8c9jZu55sJlQ75jVO9eyZZ9gtvtGRzMZNWNVbFz366X5lYVyK+g+Dlh
         fk7xGO8qyBg11JruAnUI1iZzNBEI4jk+gm/Ld0tfm+zPvDp9pk9y1y/V02giNELvKD2b
         FlDDGApTgu7rJmy57rjnI01JdZLquMCXewGTnAuRjBaV6VkGUN6PQng4O87KKbNdK+Cg
         5OwFKl7uZhprFH1Z2/qQRzrc0gvVkDnZimSJScbkUSpDFxaBZkwa8V59Yl3d2Qf8KIlY
         +oY41KWOiPZySzOD+dsxVGIFILGuJTuwc9MmkVQmG7galm7SY21dOruMxrk0046ceb+l
         MGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wDwuL12IczAPOhxBFyPNsIIWvM6LMR+E8NDDRLcU6Nw=;
        b=j188lId16qnl0FJPCZ8HBOg9LAHQHyjPwb+jzHrHr1YqS4chpGtxCt06HZHePlWkR/
         /GhKH4fC7Pos0eOQg/mKSOgZclhPF+ZOO+w91xLng2SCvfne62ijnofABvxlqo03pGp6
         gAchBbSf43wLCstOY0CJzI9MUrjcpDB+sDxW4d9JEYS5ogVlhqPd6zZo8xrcfJ51Eqja
         gOZ/Vd/7N8ymgSIh0x3qxFmbd6lJrBEMtyPr4lRBIJHX/GOjCZFB1ciFYvONRBx/Y6/S
         PRYNA1Xv4K6OajLnlAIL+Lv0R8A7AA40/UPdfggQCvL8BGHOPnEcd5QVfLL+WLZ2IMBd
         otmg==
X-Gm-Message-State: AOAM532d/r6Le43hwls/K3u2bsJuQ5oiwkP1yTFVrSaFT1uVWRGDSEy2
        LKZupVmdeAy5uibIB1qIKHoiC5PR2tWGoD2Z
X-Google-Smtp-Source: ABdhPJzX0p8ZUOSDcXY4kNaVw2eoXft+C9VLCqxeQ3qbXozcplZiLKWaEBh3nTQomSn05yWKE9NEjw==
X-Received: by 2002:a1c:f715:: with SMTP id v21mr9701137wmh.2.1607623836076;
        Thu, 10 Dec 2020 10:10:36 -0800 (PST)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id d16sm11151321wrw.17.2020.12.10.10.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Dec 2020 10:10:34 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Fix WARN_ON() splat in _free_object()
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201210174028.2060883-1-robdclark@gmail.com>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <edc8a69e-647f-fda3-574e-432faac45e55@gmail.com>
Date:   Thu, 10 Dec 2020 20:10:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210174028.2060883-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/10/20 7:40 PM, Rob Clark wrote:
 > From: Rob Clark <robdclark@chromium.org>
 >
 > [  192.062000] ------------[ cut here ]------------
 > [  192.062498] WARNING: CPU: 3 PID: 2039 at 
drivers/gpu/drm/msm/msm_gem.c:381 put_iova_vmas+0x94/0xa0 [msm]
 > [  192.062870] Modules linked in: snd_hrtimer snd_seq snd_seq_device 
rfcomm algif_hash algif_skcipher af_alg bnep xt_CHECKSUM nft_chain_nat 
xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 
nft_counter xt_tcpudp nft_compat cpufreq_powersave cpufreq_conservative 
q6asm_dai q6routing q6afe_dai q6adm bridge q6afe q6asm q6dsp_common 
q6core stp llc nf_tables libcrc32c nfnetlink snd_soc_wsa881x regmap_sdw 
soundwire_qcom gpio_wcd934x snd_soc_wcd934x wcd934x regmap_slimbus 
venus_enc venus_dec apr videobuf2_dma_sg qrtr_smd uvcvideo 
videobuf2_vmalloc videobuf2_memops ath10k_snoc ath10k_core hci_uart 
btqca btbcm mac80211 bluetooth snd_soc_sdm845 ath snd_soc_rt5663 
snd_soc_qcom_common snd_soc_rl6231 soundwire_bus ecdh_generic ecc 
qcom_spmi_adc5 venus_core qcom_pon qcom_spmi_temp_alarm qcom_vadc_common 
v4l2_mem2mem videobuf2_v4l2 cfg80211 videobuf2_common hid_multitouch 
reset_qcom_pdc qcrypto qcom_rng rfkill qcom_q6v5_mss libarc4 libdes qrtr 
ns qcom_wdt socinfo slim_qcom_ngd_ctrl
 > [  192.065739]  pdr_interface qcom_q6v5_pas slimbus qcom_pil_info 
qcom_q6v5 qcom_sysmon qcom_common qcom_glink_smem qmi_helpers rmtfs_mem 
tcp_bbr sch_fq fuse ip_tables x_tables ipv6 crc_ccitt ti_sn65dsi86 
i2c_hid msm mdt_loader llcc_qcom rtc_pm8xxx ocmem drm_kms_helper 
crct10dif_ce phy_qcom_qusb2 i2c_qcom_geni panel_simple drm pwm_bl
 > [  192.066066] CPU: 3 PID: 2039 Comm: gnome-shell Tainted: G        
W         5.10.0-rc7-next-20201208 #1
 > [  192.066068] Hardware name: LENOVO 81JL/LNVNB161216, BIOS 
9UCN33WW(V2.06) 06/ 4/2019
 > [  192.066072] pstate: 40400005 (nZcv daif +PAN -UAO -TCO BTYPE=--)
 > [  192.066099] pc : put_iova_vmas+0x94/0xa0 [msm]
 > [  192.066262] lr : put_iova_vmas+0x1c/0xa0 [msm]
 > [  192.066403] sp : ffff800019efbbb0
 > [  192.066405] x29: ffff800019efbbb0 x28: ffff800019efbd88
 > [  192.066411] x27: 0000000000000000 x26: ffff109582efa400
 > [  192.066417] x25: 0000000000000009 x24: 000000000000012b
 > [  192.066422] x23: ffff109582efa438 x22: ffff109582efa450
 > [  192.066427] x21: ffff109582efa528 x20: ffff1095cbd4f200
 > [  192.066432] x19: ffff1095cbd4f200 x18: 0000000000000000
 > [  192.066438] x17: 0000000000000000 x16: ffffc26c200ca750
 > [  192.066727] x15: 0000000000000000 x14: 0000000000000000
 > [  192.066741] x13: ffff1096fb8c9100 x12: 0000000000000002
 > [  192.066754] x11: ffffffffffffffff x10: 0000000000000002
 > [  192.067046] x9 : 0000000000000001 x8 : 0000000000000a36
 > [  192.067060] x7 : ffff4e2ad9f11000 x6 : ffffc26c216d4000
 > [  192.067212] x5 : ffffc26c2022661c x4 : ffff1095c2b98000
 > [  192.067367] x3 : ffff1095cbd4f300 x2 : 0000000000000000
 > [  192.067380] x1 : ffff1095c2b98000 x0 : 0000000000000000
 > [  192.067667] Call trace:
 > [  192.067734]  put_iova_vmas+0x94/0xa0 [msm]
 > [  192.068078]  msm_gem_free_object+0xb4/0x110 [msm]
 > [  192.068399]  drm_gem_object_free+0x1c/0x30 [drm]
 > [  192.068717]  drm_gem_object_handle_put_unlocked+0xf0/0xf8 [drm]
 > [  192.069032]  drm_gem_object_release_handle+0x6c/0x88 [drm]
 > [  192.069349]  drm_gem_handle_delete+0x68/0xc0 [drm]
 > [  192.069666]  drm_gem_close_ioctl+0x30/0x48 [drm]
 > [  192.069984]  drm_ioctl_kernel+0xc0/0x110 [drm]
 > [  192.070303]  drm_ioctl+0x210/0x440 [drm]
 > [  192.070588]  __arm64_sys_ioctl+0xa8/0xf0
 > [  192.070599]  el0_svc_common.constprop.0+0x74/0x190
 > [  192.070608]  do_el0_svc+0x24/0x90
 > [  192.070618]  el0_svc+0x14/0x20
 > [  192.070903]  el0_sync_handler+0xb0/0xb8
 > [  192.070911]  el0_sync+0x174/0x180
 > [  192.070918] ---[ end trace bee6b12a899001a3 ]---
 > [  192.072140] ------------[ cut here ]------------
 >
 > Fixes: 9b73bde39cf2 ("drm/msm: Fix use-after-free in msm_gem with 
carveout")
 > Signed-off-by: Rob Clark <robdclark@chromium.org>
 > ---
 >  drivers/gpu/drm/msm/msm_gem.c | 5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)
 >
 > diff --git a/drivers/gpu/drm/msm/msm_gem.c 
b/drivers/gpu/drm/msm/msm_gem.c
 > index 68a6c7eacc0a..a21be5b910ff 100644
 > --- a/drivers/gpu/drm/msm/msm_gem.c
 > +++ b/drivers/gpu/drm/msm/msm_gem.c
 > @@ -990,6 +990,8 @@ void msm_gem_free_object(struct drm_gem_object *obj)
 >          if (msm_obj->pages)
 >              kvfree(msm_obj->pages);
 >
 > +        put_iova_vmas(obj);
 > +
 >          /* dma_buf_detach() grabs resv lock, so we need to unlock
 >           * prior to drm_prime_gem_destroy
 >           */
 > @@ -999,11 +1001,10 @@ void msm_gem_free_object(struct drm_gem_object 
*obj)
 >      } else {
 >          msm_gem_vunmap(obj);
 >          put_pages(obj);
 > +        put_iova_vmas(obj);
 >          msm_gem_unlock(obj);
 >      }
 >
 > -    put_iova_vmas(obj);
 > -
 >      drm_gem_object_release(obj);
 >
 >      kfree(msm_obj);

Ah, the put_iova_vmas needs to happen inside the msm_gem_lock|unlock.
My bad!

Acked-by: Iskren Chernev <iskren.chernev@gmail.com>

