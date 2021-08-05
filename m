Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1BE3E19D5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 18:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231239AbhHEQvH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 12:51:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhHEQvH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 12:51:07 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019FAC061765
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Aug 2021 09:50:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id b6so12325500lff.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Aug 2021 09:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ZJydRGJM1z50ykBp1N1a18ssOJAF7uCKRh1S5r9f8hM=;
        b=f4pEHflZBIxE0pjC/Ypl05p9SnZWic+rqFPcUWAD6zUahPuC0BDwY2FWaFAZP5XDXl
         N2wKhfAm+hz+AOJMIWiQKUTLML7sUlki5C0rSdylLGqYOpo0r22oVDlCBY+ppgN00c7G
         2vV6zaNvrleIQKQL3UVOJ6pkS79udETOgC1BQdLnRcG8DmoFLwNTch/8sndEQVaTtKNf
         +0Rlio0nf4SI7BsAKouYNBH1vgkEiDqE37ft5GoDfP3oqE6OZgycYcU7VZVvG/ozDsfB
         +8oPs/OMiIwaYZ9ygH5vW19J+vAUylED1jFt/S8qb7pTStONDiZ72TQ24M//3593eOcg
         1gnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZJydRGJM1z50ykBp1N1a18ssOJAF7uCKRh1S5r9f8hM=;
        b=q+ZdFzCLq7gRbIDXBz0kpYn3OaGGNg4hv56HidmS/kyGew85jTBvy37tjy5vEjslZi
         7xu3RA8teXlcU2dw6Xm2E+VAoc5iWY9h7qD8GO008X/IqqB5WYCnd3FwLPJzSUWVIXkb
         jUaigD7uH2q73fnKkaiZMysRoJz7g2hzt0PbwGty/hPbWvRkx+lrvL/90vyZh87jW/If
         Gw4viDToBFCiZQdtTSRWkKeWRpGqpuKeV3CX+VKx5uuAlyTTZPxSWSPnGHtstUyFoN5I
         F8J+QvOVlXXUNujK3fmihBJ3SHzBqZJCL3oXBwo4tece81AcAUtRrjl6WN+XbOls4PiM
         ZLVw==
X-Gm-Message-State: AOAM5310krTtq5kxOr65jHrHftptnqbCiWffM1VzzquRVo64e5vPIcwA
        y2VIZ93/3zP5GHhyxkdxjSNS7w==
X-Google-Smtp-Source: ABdhPJy+Jn4Ado4LFHn0LSfpXch6bxM21APMHEZIZM6k/wc5Aghw4rO6vZr0FudRI8hIYSRNm17ZqA==
X-Received: by 2002:a05:6512:1329:: with SMTP id x41mr3444946lfu.327.1628182249537;
        Thu, 05 Aug 2021 09:50:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm565775lfc.225.2021.08.05.09.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 09:50:48 -0700 (PDT)
Subject: Re: disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration
To:     Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        abhinavk@codeaurora.org
References: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <3892649f-4748-b712-c28d-477e40aa8007@linaro.org>
Date:   Thu, 5 Aug 2021 19:50:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f65f219b-3f2a-63ac-5bc5-84d4f0b58f6d@kali.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 23/07/2021 20:43, Steev Klimaszewski wrote:
> Hi,
> 
> 
> As of 5.13 kernels, I've been seeing the following output in my dmesg -
> 
> Jul 22 21:41:37 limitless kernel: [    5.676335] ------------[ cut here ]------------
> Jul 22 21:41:37 limitless kernel: [    5.676337] disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.

Just wanted to check if you still have this issue?

Could you please check if the following kernel commits also show this 
behaviour:

- 170b763597d3a0a79f135e4d83a38462c3964fdf

- f4b43ac0b0af1d115effd08133046a694ac33dc2

> Jul 22 21:41:37 limitless kernel: [    5.676349] WARNING: CPU: 4 PID: 155 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676362] Modules linked in: rtc_pm8xxx msm ipa llcc_qcom qcom_common qmi_helpers ocmem ti_sn65dsi86 mdt_loader i2c_hid_of drm_kms_helper camcc_sdm845 panel_simple gpio_keys drm
> Jul 22 21:41:37 limitless kernel: [    5.676387] CPU: 4 PID: 155 Comm: kworker/u16:5 Not tainted 5.13.4 #1
> Jul 22 21:41:37 limitless kernel: [    5.676394] Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
> Jul 22 21:41:37 limitless kernel: [    5.676399] Workqueue: events_unbound deferred_probe_work_func
> Jul 22 21:41:37 limitless kernel: [    5.676412] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> Jul 22 21:41:37 limitless kernel: [    5.676420] pc : update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676426] lr : update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676432] sp : ffff800010792ea0
> Jul 22 21:41:37 limitless kernel: [    5.676435] x29: ffff800010792ea0 x28: ffff7af080dface0 x27: 0000000000000000
> Jul 22 21:41:37 limitless kernel: [    5.676443] x26: ffffb8f7b4aabab8 x25: 0000000000000000 x24: 0000000008cfdc00
> Jul 22 21:41:37 limitless kernel: [    5.676446] x23: ffffb8f804bff0d0 x22: 0000000008cfdbf6 x21: ffffb8f8042ff858
> Jul 22 21:41:37 limitless kernel: [    5.676450] x20: ffffb8f804bff0b8 x19: 0000000000000000 x18: 00000000fffffffb
> Jul 22 21:41:37 limitless kernel: [    5.676454] x17: 000c0400bb44ffff x16: ffffb8f803fa8630 x15: 0000000000000020
> Jul 22 21:41:37 limitless kernel: [    5.676458] x14: 3d2065746172206f x13: 637620676e696e72 x12: 7574657220304c4c
> Jul 22 21:41:37 limitless kernel: [    5.676462] x11: 5020495344205d5d x10: 6d736d5b20657461 x9 : ffffb8f80347e5c0
> Jul 22 21:41:37 limitless kernel: [    5.676465] x8 : 6769666e6f632073 x7 : 7469206574616470 x6 : 00000000fffff255
> Jul 22 21:41:37 limitless kernel: [    5.676469] x5 : ffff800010792c50 x4 : 0000000000000000 x3 : ffffb8f804a82690
> Jul 22 21:41:37 limitless kernel: [    5.676473] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7af0803dad00
> Jul 22 21:41:37 limitless kernel: [    5.676477] Call trace:
> Jul 22 21:41:37 limitless kernel: [    5.676478]  update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676481]  clk_pixel_set_rate+0x18c/0x1a0
> Jul 22 21:41:37 limitless kernel: [    5.676484]  clk_change_rate+0xdc/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676489]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676492]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676495]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676498]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676501]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676504]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676506]  clk_core_set_rate_nolock+0x1c0/0x2a4
> Jul 22 21:41:37 limitless kernel: [    5.676510]  clk_set_rate+0x44/0x18c
> Jul 22 21:41:37 limitless kernel: [    5.676513]  _set_opp+0x3e4/0x6b0
> Jul 22 21:41:37 limitless kernel: [    5.676517]  dev_pm_opp_set_rate+0x104/0x274
> Jul 22 21:41:37 limitless kernel: [    5.676520]  dsi_link_clk_set_rate_6g+0x4c/0xfc [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676543]  msm_dsi_host_power_on+0x16c/0x6b0 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676566]  dsi_mgr_bridge_pre_enable+0x21c/0x340 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676588]  drm_atomic_bridge_chain_pre_enable+0xa4/0xdc [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676604]  drm_atomic_helper_commit_modeset_enables+0x124/0x260 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676614]  msm_atomic_commit_tail+0x1b4/0x7e0 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676637]  commit_tail+0xac/0x190 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676645]  drm_atomic_helper_commit+0x16c/0x400 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676652]  drm_atomic_commit+0x58/0x70 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676666]  drm_client_modeset_commit_atomic+0x1d0/0x260 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676680]  drm_client_modeset_commit_locked+0x68/0x1a0 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676693]  drm_client_modeset_commit+0x3c/0x64 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676706]  drm_fb_helper_set_par+0xd4/0x12c [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676714]  fbcon_init+0x260/0x484
> Jul 22 21:41:37 limitless kernel: [    5.676719]  visual_init+0xb8/0x110
> Jul 22 21:41:37 limitless kernel: [    5.676722]  do_bind_con_driver.isra.0+0x1cc/0x3a0
> Jul 22 21:41:37 limitless kernel: [    5.676725]  do_take_over_console+0x150/0x210
> Jul 22 21:41:37 limitless kernel: [    5.676727]  do_fbcon_takeover+0x78/0xec
> Jul 22 21:41:37 limitless kernel: [    5.676730]  fbcon_fb_registered+0x10c/0x120
> Jul 22 21:41:37 limitless kernel: [    5.676733]  register_framebuffer+0x204/0x360
> Jul 22 21:41:37 limitless kernel: [    5.676736]  __drm_fb_helper_initial_config_and_unlock+0x308/0x520 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676744]  drm_fb_helper_initial_config+0x58/0x70 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676751]  msm_fbdev_init+0x94/0x100 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676774]  msm_drm_bind+0x564/0x5c0 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676798]  try_to_bring_up_master+0x230/0x320
> Jul 22 21:41:37 limitless kernel: [    5.676803]  __component_add+0xc4/0x1c0
> Jul 22 21:41:37 limitless kernel: [    5.676806]  component_add+0x20/0x30
> Jul 22 21:41:37 limitless kernel: [    5.676810]  dsi_dev_probe+0x28/0x3c [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676832]  platform_probe+0x74/0xe4
> Jul 22 21:41:37 limitless kernel: [    5.676836]  really_probe+0xf0/0x550
> Jul 22 21:41:37 limitless kernel: [    5.676839]  driver_probe_device+0x108/0x174
> Jul 22 21:41:37 limitless kernel: [    5.676842]  __device_attach_driver+0xa4/0x130
> Jul 22 21:41:37 limitless kernel: [    5.676846]  bus_for_each_drv+0x84/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676849]  __device_attach+0xe4/0x1c0
> Jul 22 21:41:37 limitless kernel: [    5.676851]  device_initial_probe+0x20/0x30
> Jul 22 21:41:37 limitless kernel: [    5.676854]  bus_probe_device+0xa4/0xb0
> Jul 22 21:41:37 limitless kernel: [    5.676858]  deferred_probe_work_func+0xc0/0x114
> Jul 22 21:41:37 limitless kernel: [    5.676861]  process_one_work+0x1f0/0x4ac
> Jul 22 21:41:37 limitless kernel: [    5.676865]  worker_thread+0x188/0x504
> Jul 22 21:41:37 limitless kernel: [    5.676867]  kthread+0x128/0x134
> Jul 22 21:41:37 limitless kernel: [    5.676871]  ret_from_fork+0x10/0x3c
> Jul 22 21:41:37 limitless kernel: [    5.676875] ---[ end trace 51b7782d0ea8dae2 ]---
> 
> Attempting to look into it further, I booted the system with drm.debug=0x3 and I get
> 
> Jul 22 21:41:37 limitless kernel: [    4.480123] [drm:msm_drm_register [msm]] init
> Jul 22 21:41:37 limitless kernel: [    4.480717] [drm:msm_mdp_register [msm]]
> Jul 22 21:41:37 limitless kernel: [    4.481515] [drm:msm_dsi_register [msm]]
> Jul 22 21:41:37 limitless kernel: [    4.482048] [drm:msm_edp_register [msm]]
> Jul 22 21:41:37 limitless kernel: [    4.485139] adreno 5000000.gpu: Adding to iommu group 6
> Jul 22 21:41:37 limitless kernel: [    4.488253] msm ae00000.mdss: Adding to iommu group 7
> Jul 22 21:41:37 limitless kernel: [    4.491705] platform ae94000.dsi: Fixing up cyclic dependency with 10-002c
> Jul 22 21:41:37 limitless kernel: [    4.493955] platform ae94000.dsi: Fixing up cyclic dependency with ae01000.mdp
> Jul 22 21:41:37 limitless kernel: [    4.497760] [drm:dsi_pll_10nm_init [msm]] DSI PLL0
> Jul 22 21:41:37 limitless kernel: [    4.498013] [drm:pll_10nm_register.constprop.0 [msm]] DSI0
> Jul 22 21:41:37 limitless kernel: [    4.498366] [drm:dsi_pll_10nm_vco_recalc_rate [msm]] DSI PLL0 returning vco rate = 1665300585, dec = 2b, frac = 17804
> Jul 22 21:41:37 limitless kernel: [    4.499346] [drm:dsi_10nm_pll_save_state [msm]] DSI PLL0 outdiv 1 bit_clk_div 1 pix_clk_div 3 pll_mux 1
> Jul 22 21:41:37 limitless kernel: [    4.501292] [drm:dpu_mdss_init [msm]] mapped mdss address space @(____ptrval____)
> Jul 22 21:41:37 limitless kernel: [    4.502291] msm ae00000.mdss: bound ae01000.mdp (ops msm_hdmi_hdcp_transfer_v_h [msm])
> Jul 22 21:41:37 limitless kernel: [    4.504576] [drm:dsi_bind [msm]]
> Jul 22 21:41:37 limitless kernel: [    4.504634] [drm:dsi_bind [msm]] dsi probed=(____ptrval____)
> Jul 22 21:41:37 limitless kernel: [    4.504805] msm_dsi ae94000.dsi: supply gdsc not found, using dummy regulator
> Jul 22 21:41:37 limitless kernel: [    4.507787] [drm:msm_runtime_resume [msm]]
> Jul 22 21:41:37 limitless kernel: [    4.507909] [drm:msm_dsi_host_init [msm]] dsi_get_config: Version 3:20020001
> Jul 22 21:41:37 limitless kernel: [    4.507909]
> Jul 22 21:41:37 limitless kernel: [    4.508598] [drm:msm_dsi_host_init [msm]] Dsi Host 0 initialized
> Jul 22 21:41:37 limitless kernel: [    4.508756] msm ae00000.mdss: bound ae94000.dsi (ops msm_hdmi_hdcp_transfer_v_h [msm])
> Jul 22 21:41:37 limitless kernel: [    4.511092] [drm:adreno_bind [msm]] Found GPU: 6.3.0.2
> Jul 22 21:41:37 limitless kernel: [    4.511656] [drm:adreno_gpu_init [msm]] fast_rate=710000000, slow_rate=27000000
> Jul 22 21:41:37 limitless kernel: [    4.511979] [drm:msm_gpu_init [msm]] ebi1_clk: fffffffffffffffe
> Jul 22 21:41:37 limitless kernel: [    4.512084] adreno 5000000.gpu: supply vdd not found, using dummy regulator
> Jul 22 21:41:37 limitless kernel: [    4.514535] [drm:msm_gpu_init [msm]] gpu_reg: (____ptrval____)
> Jul 22 21:41:37 limitless kernel: [    4.514603] adreno 5000000.gpu: supply vddcx not found, using dummy regulator
> Jul 22 21:41:37 limitless kernel: [    4.516987] [drm:msm_gpu_init [msm]] gpu_cx: (____ptrval____)
> Jul 22 21:41:37 limitless kernel: [    4.518083] platform 506a000.gmu: Adding to iommu group 8
> Jul 22 21:41:37 limitless kernel: [    4.521285] msm ae00000.mdss: bound 5000000.gpu (ops msm_hdmi_hdcp_transfer_v_h [msm])
> Jul 22 21:41:37 limitless kernel: [    4.523914] [drm:dpu_kms_hw_init [msm]] mapped dpu address space @(____ptrval____)
> Jul 22 21:41:37 limitless kernel: [    4.524191] [drm:dpu_kms_hw_init:943] dpu hardware revision:0x40000000
> Jul 22 21:41:37 limitless kernel: [    4.526823] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x807ac000, fsynr=0x100020, cbfrsynra=0x880, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.527091] [drm:drm_dp_aux_register_devnode [drm_kms_helper]] drm_dp_aux_dev: aux [ti-sn65dsi86-aux] registered as minor 0
> Jul 22 21:41:37 limitless kernel: [    4.529619] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x80888e00, fsynr=0x100021, cbfrsynra=0xc88, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.532546] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x8041d000, fsynr=0x100021, cbfrsynra=0x880, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.535181] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x804ef000, fsynr=0x100021, cbfrsynra=0x880, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.537704] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x805c8700, fsynr=0x100021, cbfrsynra=0xc88, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.540248] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x8069ad00, fsynr=0x100021, cbfrsynra=0xc88, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.542715] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x80768000, fsynr=0x100021, cbfrsynra=0x880, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.545094] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x80831b00, fsynr=0x100021, cbfrsynra=0x880, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.547425] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x808f4600, fsynr=0x100021, cbfrsynra=0xc88, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.549741] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x80446900, fsynr=0x100021, cbfrsynra=0x880, cb=6
> Jul 22 21:41:37 limitless kernel: [    4.553105] [drm:msm_dsi_runtime_resume [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    4.553195] [drm:msm_dsi_runtime_suspend [msm]]
> Jul 22 21:41:37 limitless kernel: [    4.555607] [drm:dsi_host_attach [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    4.584709] [drm:drm_irq_install [drm]] irq=163
> Jul 22 21:41:37 limitless kernel: [    4.590131] [drm:drm_minor_register [drm]]
> Jul 22 21:41:37 limitless kernel: [    4.590416] [drm:drm_minor_register [drm]] new minor registered 128
> Jul 22 21:41:37 limitless kernel: [    4.590432] [drm:drm_minor_register [drm]]
> Jul 22 21:41:37 limitless kernel: [    4.590653] [drm:drm_minor_register [drm]] new minor registered 0
> Jul 22 21:41:37 limitless kernel: [    4.590837] [drm:drm_sysfs_connector_add [drm]] adding "eDP-1" to sysfs
> Jul 22 21:41:37 limitless kernel: [    4.590858] [drm:drm_sysfs_hotplug_event [drm]] generating hotplug event
> Jul 22 21:41:37 limitless kernel: [    4.590876] [drm] Initialized msm 1.7.0 20130625 for ae00000.mdss on minor 0
> Jul 22 21:41:37 limitless kernel: [    4.590957] msm ae00000.mdss: [drm:adreno_request_fw [msm]] loaded qcom/a630_sqe.fw from new location
> Jul 22 21:41:37 limitless kernel: [    4.592674] msm ae00000.mdss: [drm:adreno_request_fw [msm]] loaded qcom/a630_gmu.bin from new location
> Jul 22 21:41:37 limitless kernel: [    4.715176] [drm:adreno_hw_init [msm]] A630
> Jul 22 21:41:37 limitless kernel: [    4.738344] adreno 5000000.gpu: [drm:adreno_zap_shader_load [msm]] *ERROR* Unable to load qcom/LENOVO/81JL/qcdxkmsuc850.mbn
> Jul 22 21:41:37 limitless kernel: [    4.864436] msm ae00000.mdss: [drm:adreno_load_gpu [msm]] *ERROR* gpu hw init failed: -2
> Jul 22 21:41:37 limitless kernel: [    4.942664] checking generic (80400000 384000) vs hw (0 ffffffffffffffff)
> Jul 22 21:41:37 limitless kernel: [    5.046140] fb0: switching to msm from EFI VGA
> Jul 22 21:41:37 limitless kernel: [    5.094360] Console: switching to colour dummy device 80x25
> Jul 22 21:41:37 limitless kernel: [    5.097083] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (2)
> Jul 22 21:41:37 limitless kernel: [    5.171318] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (2)
> Jul 22 21:41:37 limitless kernel: [    5.172109] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (3)
> Jul 22 21:41:37 limitless kernel: [    5.172260] [drm:msm_fbdev_create [msm]] create fbdev: 1920x1080@32 (1920x1080)
> Jul 22 21:41:37 limitless kernel: [    5.173509] [drm:msm_alloc_stolen_fb [msm]] allocating 8294400 bytes for fb 0
> Jul 22 21:41:37 limitless kernel: [    5.173839] [drm:msm_framebuffer_init [msm]] create framebuffer: dev=(____ptrval____), mode_cmd=(____ptrval____) (1920x1080@XR24)
> Jul 22 21:41:37 limitless kernel: [    5.173981] [drm:msm_framebuffer_init [msm]] create: FB ID: 66 ((____ptrval____))
> Jul 22 21:41:37 limitless kernel: [    5.447772] [drm:msm_fbdev_create [msm]] fbi=(____ptrval____), dev=(____ptrval____)
> Jul 22 21:41:37 limitless kernel: [    5.449444] [drm:msm_fbdev_create [msm]] par=(____ptrval____), 1920x1080
> Jul 22 21:41:37 limitless kernel: [    5.449481] [drm:msm_fbdev_create [msm]] allocated 1920x1080 fb
> Jul 22 21:41:37 limitless kernel: [    5.457328] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (1)
> Jul 22 21:41:37 limitless kernel: [    5.458464] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (2)
> Jul 22 21:41:37 limitless kernel: [    5.458563] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (3)
> Jul 22 21:41:37 limitless kernel: [    5.459921] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.463378] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.463391] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.463406] [drm:dsi_mgr_bridge_mode_set [msm]] set mode: "1920x1080": 60 147840 1920 1968 2000 2200 1080 1083 1089 1120 0x48 0x9
> Jul 22 21:41:37 limitless kernel: [    5.673016] [drm:dsi_mgr_bridge_pre_enable [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    5.673085] [drm:msm_dsi_host_reset_phy [msm]]
> Jul 22 21:41:37 limitless kernel: [    5.674242] [drm:dsi_calc_pclk [msm]] pclk=147840000, bclk=110880000
> Jul 22 21:41:37 limitless kernel: [    5.674262] [drm:msm_dsi_phy_enable [msm]]
> Jul 22 21:41:37 limitless kernel: [    5.674701] [drm:dsi_10nm_phy_enable [msm]]
> Jul 22 21:41:37 limitless kernel: [    5.674722] [drm:msm_dsi_dphy_timing_calc_v3 [msm]] 51, 13, 0, 30, 9, 8, 36, 34, 8, 8, 5, 5, 0, 0, 0, 0
> Jul 22 21:41:37 limitless kernel: [    5.674759] [drm:dsi_10nm_phy_enable [msm]] DSI PLL0
> Jul 22 21:41:37 limitless kernel: [    5.674813] [drm:dsi_10nm_phy_enable [msm]] DSI0 PHY enabled
> Jul 22 21:41:37 limitless kernel: [    5.674832] [drm:dsi_pll_10nm_vco_set_rate [msm]] DSI PLL0 rate=1665300585, parent's=19200000
> Jul 22 21:41:37 limitless kernel: [    5.674849] [drm:dsi_pll_10nm_vco_set_rate [msm]] SSC not enabled
> Jul 22 21:41:37 limitless kernel: [    5.674849]
> Jul 22 21:41:37 limitless kernel: [    5.674882] [drm:dsi_10nm_pll_restore_state [msm]] DSI PLL0
> Jul 22 21:41:37 limitless kernel: [    5.674898] [drm:msm_dsi_host_power_on [msm]]
> Jul 22 21:41:37 limitless kernel: [    5.675298] [drm:msm_dsi_runtime_resume [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    5.675321] [drm:dsi_link_clk_set_rate_6g [msm]] Set clk rates: pclk=147840, byteclk=110880000
> Jul 22 21:41:37 limitless kernel: [    5.675392] [drm:dsi_pll_10nm_vco_set_rate [msm]] DSI PLL0 rate=1774080000, parent's=0
> Jul 22 21:41:37 limitless kernel: [    5.675411] [drm:dsi_pll_10nm_vco_set_rate [msm]] SSC not enabled
> Jul 22 21:41:37 limitless kernel: [    5.675411]
> Jul 22 21:41:37 limitless kernel: [    5.675450] [drm:dsi_pll_10nm_vco_recalc_rate [msm]] DSI PLL0 returning vco rate = 1774079882, dec = 2e, frac = cccc
> Jul 22 21:41:37 limitless kernel: [    5.676335] ------------[ cut here ]------------
> Jul 22 21:41:37 limitless kernel: [    5.676337] disp_cc_mdss_pclk0_clk_src: rcg didn't update its configuration.
> Jul 22 21:41:37 limitless kernel: [    5.676349] WARNING: CPU: 4 PID: 155 at drivers/clk/qcom/clk-rcg2.c:122 update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676362] Modules linked in: rtc_pm8xxx msm ipa llcc_qcom qcom_common qmi_helpers ocmem ti_sn65dsi86 mdt_loader i2c_hid_of drm_kms_helper camcc_sdm845 panel_simple gpio_keys drm
> Jul 22 21:41:37 limitless kernel: [    5.676387] CPU: 4 PID: 155 Comm: kworker/u16:5 Not tainted 5.13.4 #1
> Jul 22 21:41:37 limitless kernel: [    5.676394] Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
> Jul 22 21:41:37 limitless kernel: [    5.676399] Workqueue: events_unbound deferred_probe_work_func
> Jul 22 21:41:37 limitless kernel: [    5.676412] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> Jul 22 21:41:37 limitless kernel: [    5.676420] pc : update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676426] lr : update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676432] sp : ffff800010792ea0
> Jul 22 21:41:37 limitless kernel: [    5.676435] x29: ffff800010792ea0 x28: ffff7af080dface0 x27: 0000000000000000
> Jul 22 21:41:37 limitless kernel: [    5.676443] x26: ffffb8f7b4aabab8 x25: 0000000000000000 x24: 0000000008cfdc00
> Jul 22 21:41:37 limitless kernel: [    5.676446] x23: ffffb8f804bff0d0 x22: 0000000008cfdbf6 x21: ffffb8f8042ff858
> Jul 22 21:41:37 limitless kernel: [    5.676450] x20: ffffb8f804bff0b8 x19: 0000000000000000 x18: 00000000fffffffb
> Jul 22 21:41:37 limitless kernel: [    5.676454] x17: 000c0400bb44ffff x16: ffffb8f803fa8630 x15: 0000000000000020
> Jul 22 21:41:37 limitless kernel: [    5.676458] x14: 3d2065746172206f x13: 637620676e696e72 x12: 7574657220304c4c
> Jul 22 21:41:37 limitless kernel: [    5.676462] x11: 5020495344205d5d x10: 6d736d5b20657461 x9 : ffffb8f80347e5c0
> Jul 22 21:41:37 limitless kernel: [    5.676465] x8 : 6769666e6f632073 x7 : 7469206574616470 x6 : 00000000fffff255
> Jul 22 21:41:37 limitless kernel: [    5.676469] x5 : ffff800010792c50 x4 : 0000000000000000 x3 : ffffb8f804a82690
> Jul 22 21:41:37 limitless kernel: [    5.676473] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff7af0803dad00
> Jul 22 21:41:37 limitless kernel: [    5.676477] Call trace:
> Jul 22 21:41:37 limitless kernel: [    5.676478]  update_config+0xd0/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676481]  clk_pixel_set_rate+0x18c/0x1a0
> Jul 22 21:41:37 limitless kernel: [    5.676484]  clk_change_rate+0xdc/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676489]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676492]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676495]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676498]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676501]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676504]  clk_change_rate+0x15c/0x440
> Jul 22 21:41:37 limitless kernel: [    5.676506]  clk_core_set_rate_nolock+0x1c0/0x2a4
> Jul 22 21:41:37 limitless kernel: [    5.676510]  clk_set_rate+0x44/0x18c
> Jul 22 21:41:37 limitless kernel: [    5.676513]  _set_opp+0x3e4/0x6b0
> Jul 22 21:41:37 limitless kernel: [    5.676517]  dev_pm_opp_set_rate+0x104/0x274
> Jul 22 21:41:37 limitless kernel: [    5.676520]  dsi_link_clk_set_rate_6g+0x4c/0xfc [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676543]  msm_dsi_host_power_on+0x16c/0x6b0 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676566]  dsi_mgr_bridge_pre_enable+0x21c/0x340 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676588]  drm_atomic_bridge_chain_pre_enable+0xa4/0xdc [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676604]  drm_atomic_helper_commit_modeset_enables+0x124/0x260 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676614]  msm_atomic_commit_tail+0x1b4/0x7e0 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676637]  commit_tail+0xac/0x190 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676645]  drm_atomic_helper_commit+0x16c/0x400 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676652]  drm_atomic_commit+0x58/0x70 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676666]  drm_client_modeset_commit_atomic+0x1d0/0x260 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676680]  drm_client_modeset_commit_locked+0x68/0x1a0 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676693]  drm_client_modeset_commit+0x3c/0x64 [drm]
> Jul 22 21:41:37 limitless kernel: [    5.676706]  drm_fb_helper_set_par+0xd4/0x12c [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676714]  fbcon_init+0x260/0x484
> Jul 22 21:41:37 limitless kernel: [    5.676719]  visual_init+0xb8/0x110
> Jul 22 21:41:37 limitless kernel: [    5.676722]  do_bind_con_driver.isra.0+0x1cc/0x3a0
> Jul 22 21:41:37 limitless kernel: [    5.676725]  do_take_over_console+0x150/0x210
> Jul 22 21:41:37 limitless kernel: [    5.676727]  do_fbcon_takeover+0x78/0xec
> Jul 22 21:41:37 limitless kernel: [    5.676730]  fbcon_fb_registered+0x10c/0x120
> Jul 22 21:41:37 limitless kernel: [    5.676733]  register_framebuffer+0x204/0x360
> Jul 22 21:41:37 limitless kernel: [    5.676736]  __drm_fb_helper_initial_config_and_unlock+0x308/0x520 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676744]  drm_fb_helper_initial_config+0x58/0x70 [drm_kms_helper]
> Jul 22 21:41:37 limitless kernel: [    5.676751]  msm_fbdev_init+0x94/0x100 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676774]  msm_drm_bind+0x564/0x5c0 [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676798]  try_to_bring_up_master+0x230/0x320
> Jul 22 21:41:37 limitless kernel: [    5.676803]  __component_add+0xc4/0x1c0
> Jul 22 21:41:37 limitless kernel: [    5.676806]  component_add+0x20/0x30
> Jul 22 21:41:37 limitless kernel: [    5.676810]  dsi_dev_probe+0x28/0x3c [msm]
> Jul 22 21:41:37 limitless kernel: [    5.676832]  platform_probe+0x74/0xe4
> Jul 22 21:41:37 limitless kernel: [    5.676836]  really_probe+0xf0/0x550
> Jul 22 21:41:37 limitless kernel: [    5.676839]  driver_probe_device+0x108/0x174
> Jul 22 21:41:37 limitless kernel: [    5.676842]  __device_attach_driver+0xa4/0x130
> Jul 22 21:41:37 limitless kernel: [    5.676846]  bus_for_each_drv+0x84/0xe0
> Jul 22 21:41:37 limitless kernel: [    5.676849]  __device_attach+0xe4/0x1c0
> Jul 22 21:41:37 limitless kernel: [    5.676851]  device_initial_probe+0x20/0x30
> Jul 22 21:41:37 limitless kernel: [    5.676854]  bus_probe_device+0xa4/0xb0
> Jul 22 21:41:37 limitless kernel: [    5.676858]  deferred_probe_work_func+0xc0/0x114
> Jul 22 21:41:37 limitless kernel: [    5.676861]  process_one_work+0x1f0/0x4ac
> Jul 22 21:41:37 limitless kernel: [    5.676865]  worker_thread+0x188/0x504
> Jul 22 21:41:37 limitless kernel: [    5.676867]  kthread+0x128/0x134
> Jul 22 21:41:37 limitless kernel: [    5.676871]  ret_from_fork+0x10/0x3c
> Jul 22 21:41:37 limitless kernel: [    5.676875] ---[ end trace 51b7782d0ea8dae2 ]---
> Jul 22 21:41:37 limitless kernel: [    5.676893] [drm:dsi_pll_10nm_vco_set_rate [msm]] DSI PLL0 rate=1774079882, parent's=0
> Jul 22 21:41:37 limitless kernel: [    5.676919] [drm:dsi_pll_10nm_vco_set_rate [msm]] SSC not enabled
> Jul 22 21:41:37 limitless kernel: [    5.676919]
> Jul 22 21:41:37 limitless kernel: [    5.677068] [drm:msm_dsi_host_power_on [msm]]
> Jul 22 21:41:37 limitless kernel: [    5.698915] [drm:dsi_intr_ctrl [msm]] intr=2000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.698942] [drm:msm_dsi_host_power_on [msm]] lane number=4
> Jul 22 21:41:37 limitless kernel: [    5.698989] [drm:dsi_mgr_bridge_enable [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    5.699095] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.699387] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.700452] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.700457] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.701578] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.701869] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.702365] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.702371] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.705452] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.705545] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.705793] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.705801] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.707593] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.707703] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.708066] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.708087] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.709521] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.709675] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.710022] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.710033] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.711419] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.711606] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.711985] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.711999] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.713399] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.713553] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.713940] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.713957] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.715236] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.715534] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.716101] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.716123] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.716932] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.717222] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.717776] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.717797] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.719388] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.719694] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.720048] dsi_err_worker: status=4
> Jul 22 21:41:37 limitless kernel: [    5.720067] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.721050] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.721106] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.721185] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.723009] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.723300] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.723867] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.725276] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.725565] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.726128] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.727031] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.727320] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.727893] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.729290] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.729582] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.730139] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.730850] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.731158] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.731503] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.732723] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.733015] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.733590] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.735026] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.735316] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.735886] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.736927] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.737219] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.737778] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.738954] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.739249] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.739794] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.740771] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.740993] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.741483] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.742804] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.743094] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.743663] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.744695] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.744985] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.745551] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.746663] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.746953] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.747526] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.748204] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.748509] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.748864] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.750739] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.751036] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.751597] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.752738] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.753031] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.753590] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.754345] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.754635] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.755223] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.756461] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.756750] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.757324] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.758209] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.758501] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.759068] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.760288] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.760578] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.761139] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.762280] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.762574] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.763131] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.763834] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.764128] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.764692] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.766273] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.766563] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.767134] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.768243] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.768532] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.769096] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.770072] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.770362] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.770939] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.772092] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.772381] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.772962] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.774045] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.774334] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.774905] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.776037] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.776329] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.776886] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.777920] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.778232] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.778578] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.779458] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.779747] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.780321] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.781900] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.782190] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.782765] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.783856] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.784147] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.784722] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.785811] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.786104] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.786680] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.787753] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.788042] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.788618] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.789695] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.789985] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.790558] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.791676] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.791972] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.792540] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.793651] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.793947] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.794467] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.794561] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    5.794639] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    5.795070] [drm:dsi_host_irq [msm]] isr=0x3000000, id=0
> Jul 22 21:41:37 limitless kernel: [    5.795124] [drm:dsi_intr_ctrl [msm]] intr=1000000 enable=0
> Jul 22 21:41:37 limitless kernel: [    5.795311] [drm:dsi_intr_ctrl [msm]] intr=3000000 enable=1
> Jul 22 21:41:37 limitless kernel: [    5.795405] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    5.795466] Console: switching to colour frame buffer device 240x67
> Jul 22 21:41:37 limitless kernel: [    5.795519] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.795551] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.795580] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.795633] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.795784] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.795971] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.812229] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    5.812263] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    5.812293] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.812338] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.812369] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.812414] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.812442] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (4)
> Jul 22 21:41:37 limitless kernel: [    5.812475] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    5.812504] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (5)
> Jul 22 21:41:37 limitless kernel: [    5.812534] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (5)
> Jul 22 21:41:37 limitless kernel: [    5.812562] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    5.812617] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.812680] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.812712] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.828763] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (5)
> Jul 22 21:41:37 limitless kernel: [    5.828949] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    5.829114] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    5.829320] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.829489] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.829792] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.829966] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.830128] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.830371] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.830690] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.830872] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.892620] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    5.892693] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    5.892760] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.892840] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.892886] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.892929] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    5.892988] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.893078] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.893127] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.895173] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    5.895213] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    5.895243] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.895271] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.895308] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.895339] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.895367] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.895405] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.895467] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.895500] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.912846] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    5.912879] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    5.912908] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.912936] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    5.912973] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.913004] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.913032] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    5.913069] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.913129] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.913161] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.928671] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    5.928727] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    5.928781] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    5.928833] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.928897] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    5.928950] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    5.929000] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    5.929064] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    5.929166] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    5.932160] msm ae00000.mdss: [drm] fb0: msmdrmfb frame buffer device
> Jul 22 21:41:37 limitless kernel: [    5.937391] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    5.945215] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.301182] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.301431] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.301646] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.311774] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.311831] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.311869] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.311906] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.311971] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.312009] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.312044] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.312120] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.312227] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.312268] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.328457] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.328502] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.328540] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.328584] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.328634] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.328673] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.328709] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.328765] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.328851] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.328891] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.345108] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.345165] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.345227] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.345275] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.360060] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.360158] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.360243] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.360370] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.360538] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.360612] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.361807] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.361921] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.362022] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.362110] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.362242] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.362314] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.362381] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.362474] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.362611] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.362687] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.378501] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.378613] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.378706] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.378793] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.378914] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.379005] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.379091] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.379286] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.379472] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.379558] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.395127] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.395195] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.395227] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.395258] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.395312] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.395344] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.395374] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.395443] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.395535] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.395568] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.411843] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.411903] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.411934] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.411965] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.412020] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.412054] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.412083] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.412160] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.412271] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.412304] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.428489] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.428553] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.428587] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.428619] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.428677] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.428712] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.428743] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.428820] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.428917] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.428953] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.445228] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.445322] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.445374] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.445424] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.461852] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.461924] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.469248] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.469306] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.469350] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.469478] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.469598] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.469648] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.469774] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.469873] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.478520] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.478576] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.478625] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.478670] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.478736] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.478783] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.478827] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.478893] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.478989] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.479039] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.495563] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.495758] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.495929] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.496095] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.496356] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.496534] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.496700] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.496924] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.497293] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.497483] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.512145] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.512189] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.512219] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.512248] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.528599] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.528792] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.630983] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.631021] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.631043] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.631106] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.631189] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.631220] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.631274] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.631311] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.645149] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.645193] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.645218] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.645240] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.661753] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.661806] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.696998] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.697044] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.697077] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.697152] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.697253] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.697292] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.697368] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.697440] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.712538] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.712583] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.712617] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.712649] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.728379] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.728458] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.780398] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.780480] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.780537] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.780676] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.780847] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.780907] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.781044] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.781157] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.795198] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.795266] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.795299] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.795331] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.811791] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.811879] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.822999] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.823056] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.823104] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.823200] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.823304] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.823358] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.823448] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.823550] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.828448] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.828482] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.828513] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.828564] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.845093] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.845186] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.908397] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.908509] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.908587] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.908760] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.908962] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.909051] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.909256] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    6.909417] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    6.916530] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.916619] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.916699] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.916779] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.916883] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.916964] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.917041] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.917142] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.917333] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.917421] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.928497] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.928531] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.928560] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.928589] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.928625] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.928655] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.928683] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.928723] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.928783] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.928816] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.945230] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.945302] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.945331] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.945359] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.945397] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.945427] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.945455] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.945497] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.945557] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.945590] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.961864] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    6.961919] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.961968] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.962016] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.962079] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    6.962129] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    6.962193] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    6.962259] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    6.962357] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    6.962410] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    6.978451] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    6.978523] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    6.978554] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    6.978584] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    6.995095] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    6.995192] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.113048] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.113120] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.113155] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.113259] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.113374] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.113414] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.113498] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.113561] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    7.129315] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    7.129360] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.129395] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.129427] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.145186] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    7.145286] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.320998] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.321047] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.321081] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.321134] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.321222] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.321263] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.321324] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.321395] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    7.329250] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    7.333773] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.333809] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.333841] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.333886] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.333919] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.333950] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.333992] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.334063] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.334101] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.336210] [drm:drm_sysfs_hotplug_event [drm]] generating hotplug event
> Jul 22 21:41:37 limitless kernel: [    7.336290] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    7.346002] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    7.346043] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.346077] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.346109] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.361840] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    7.361889] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.408577] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.408620] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.408656] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.408716] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.408791] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.408829] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.408893] [drm:msm_crtc_enable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.408967] msm ae00000.mdss: [drm:drm_vblank_enable [drm]] enabling vblank on crtc 0, ret: 0
> Jul 22 21:41:37 limitless kernel: [    7.410050] random: systemd: uninitialized urandom read (16 bytes read)
> Jul 22 21:41:37 limitless kernel: [    7.413937] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    7.413970] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.414000] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.414035] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.414094] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.414127] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.414159] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.414218] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.414285] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.414321] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.420559] random: systemd: uninitialized urandom read (16 bytes read)
> Jul 22 21:41:37 limitless kernel: [    7.428402] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    7.428462] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.428506] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.428544] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.428593] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.428633] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.428671] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.428728] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.428808] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.428850] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.434347] random: systemd: uninitialized urandom read (16 bytes read)
> Jul 22 21:41:37 limitless kernel: [    7.445304] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    7.445342] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.445372] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.445399] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.445438] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.445468] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.445495] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.445537] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.445598] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.445630] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.447772] [drm:drm_add_display_info [drm]] eDP-1: Assigning EDID-1.4 digital sink color depth as 8 bpc.
> Jul 22 21:41:37 limitless kernel: [    7.447820] [drm:drm_add_display_info [drm]] eDP-1: Assigning EDID-1.4 digital sink color depth as 8 bpc.
> Jul 22 21:41:37 limitless kernel: [    7.447851] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 70 (1)
> Jul 22 21:41:37 limitless kernel: [    7.447885] [drm:drm_add_display_info [drm]] eDP-1: Assigning EDID-1.4 digital sink color depth as 8 bpc.
> Jul 22 21:41:37 limitless kernel: [    7.468871] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    7.468957] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.469034] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.469114] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.469241] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.469322] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.469397] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.469497] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.469647] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.469731] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.478427] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    7.478492] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.478521] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.478549] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.478590] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.478942] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.479246] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    7.479379] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.479416] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.479444] [drm:drm_mode_object_get [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.479486] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.479546] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.479578] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.482691] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (3)
> Jul 22 21:41:37 limitless kernel: [    7.482726] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    7.496887] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (2)
> Jul 22 21:41:37 limitless kernel: [    7.496920] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.496948] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.496976] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.497019] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.497049] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.497077] [drm:drm_mode_object_get [drm]] OBJ ID: 68 (1)
> Jul 22 21:41:37 limitless kernel: [    7.497118] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.497190] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2200, vtotal 1120, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.497222] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 147840 kHz framedur 16666666 linedur 14880
> Jul 22 21:41:37 limitless kernel: [    7.517128] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 68 (2)
> Jul 22 21:41:37 limitless kernel: [    7.517203] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.517233] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.517262] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 69 (1)
> Jul 22 21:41:37 limitless kernel: [    7.518043] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (2)
> Jul 22 21:41:37 limitless kernel: [    7.518085] [drm:drm_mode_object_get [drm]] OBJ ID: 67 (1)
> Jul 22 21:41:37 limitless kernel: [    7.518131] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 67 (2)
> Jul 22 21:41:37 limitless kernel: [    7.518165] [drm:drm_mode_object_get [drm]] OBJ ID: 66 (3)
> Jul 22 21:41:37 limitless kernel: [    7.518209] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 66 (4)
> Jul 22 21:41:37 limitless kernel: [    7.518248] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    7.518281] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (5)
> Jul 22 21:41:37 limitless kernel: [    7.518311] [drm:drm_mode_object_put.part.0 [drm]] OBJ ID: 32 (5)
> Jul 22 21:41:37 limitless kernel: [    7.518341] [drm:drm_mode_object_get [drm]] OBJ ID: 32 (4)
> Jul 22 21:41:37 limitless kernel: [    7.518402] [drm:msm_framebuffer_prepare [msm]] FB[66]: iova[0]: 00002000 (0)
> Jul 22 21:41:37 limitless kernel: [    7.520792] [drm:dsi_mgr_bridge_disable [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    7.532570] msm ae00000.mdss: [drm:vblank_disable_fn [drm]] disabling vblank on crtc 0
> Jul 22 21:41:37 limitless kernel: [    7.532637] [drm:msm_crtc_disable_vblank [msm]] dev=(____ptrval____), crtc=0
> Jul 22 21:41:37 limitless kernel: [    7.533522] [drm:dsi_mgr_bridge_post_disable [msm]] id=0
> Jul 22 21:41:37 limitless kernel: [    7.539103] [drm:dsi_intr_ctrl [msm]] intr=2010000 enable=0
> Jul 22 21:41:37 limitless kernel: [    7.560968] [drm:dsi_10nm_pll_save_state [msm]] DSI PLL0 outdiv 1 bit_clk_div 1 pix_clk_div 3 pll_mux 1
> Jul 22 21:41:37 limitless kernel: [    7.561088] [drm:dsi_host_regulator_disable [msm]]
> Jul 22 21:41:37 limitless kernel: [    7.561155] [drm:msm_dsi_host_power_off [msm]] -
> Jul 22 21:41:37 limitless kernel: [    7.561220] [drm:dsi_10nm_phy_disable [msm]]
> Jul 22 21:41:37 limitless kernel: [    7.561276] [drm:dsi_10nm_phy_disable [msm]] DSI0 PHY disabled
> Jul 22 21:41:37 limitless kernel: [    7.561328] [drm:dsi_phy_regulator_disable [msm]]
> Jul 22 21:41:37 limitless kernel: [    7.561563] [drm:msm_dsi_runtime_suspend [msm]]
> Jul 22 21:41:37 limitless kernel: [    7.569997] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: hwmode: htotal 2080, vtotal 1112, vdisplay 1080
> Jul 22 21:41:37 limitless kernel: [    7.570043] msm ae00000.mdss: [drm:drm_calc_timestamping_constants [drm]] crtc 65: clock 138800 kHz framedur 16663976 linedur 14985
> Jul 22 21:41:37 limitless kernel: [    7.570087] [drm:dsi_mgr_bridge_mode_set [msm]] set mode: "1920x1080": 60 138800 1920 1944 1992 2080 1080 1083 1095 1112 0x48 0xa
> 
> The display does come up, but eventually this does seem to lead to issues where there are frame encoder timeouts (which is what abhinav and I were trying to figure out)
> 
> Any insight of what may be wrong?  Abhinav suggested that https://github.com/steev/linux/commit/170b763597d3a0a79f135e4d83a38462c3964fdf
>   for a similar issue?
> 


-- 
With best wishes
Dmitry
