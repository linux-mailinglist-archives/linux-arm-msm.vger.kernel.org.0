Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBAB0597123
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 16:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239871AbiHQO0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 10:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236463AbiHQO0M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 10:26:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3928A1ADBD
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:26:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id o22so17700096edc.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=dNs0Y6uk1o1u/YxE+m6kIbEgFxc0nJ0f+P3W3OXDipY=;
        b=mQ3YFFi8eI0c3jIKj4R5lYh4JR7oUjAgyqgMtK5DsZ57U7MU+2Y7eJt4IJl8wVcxlO
         7NDknvlVzhqGsIA6famrTdImfQRgQsIyxG5dRVkT8eau5+baFDGCQBFT5zRb8oR+Bjrd
         NcNBqSSzLJoi3z1ighd685OKzXZMnLMtdtqZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=dNs0Y6uk1o1u/YxE+m6kIbEgFxc0nJ0f+P3W3OXDipY=;
        b=LhDBAPxi+NqfOTa/0s2HRTySS9hED2qbJBUJNdcMcTfw20K4palLsPCYpHLRoQctOm
         rBqYktC7fZNZoneuvQSiqAPmyDaT39QKpmthPILcbwXvGk7emTd0VL1/2uCwIHRitdzM
         4ugCiGvJ27+5E/9RRTMLijipmD4MfTysUlLCIaSQmVh5Ya7wHPUXbFv0xQzCwo9W61kp
         Z2h7ejkPQwBSOFUBA8JHo3de5OKI7lCN6Gg4oM7ZhiCwJZK/wVsiBq5VZDl65oZttsTk
         m0ghORTZzM5QcTDgMOZyRyItIgMmMCtaLNR58xt98968+C5i4BxTwAEynmlLj5Jil7CE
         yfcg==
X-Gm-Message-State: ACgBeo2CTV6Dqwi0ehozTlWOzBtORPswjnLrTTzDOWRwvIVSdbqDkqJK
        kFERpto4C25WAn1Z2tzqxqg+n380LSG9FRN8
X-Google-Smtp-Source: AA6agR71buTLJTSifTYDC1C7iAPRLnowqCGz0d7LwGJaKOgT75xyp1wA9Auc2MPjhLy7ZHko/jXLRA==
X-Received: by 2002:a05:6402:2684:b0:43d:9964:d2a0 with SMTP id w4-20020a056402268400b0043d9964d2a0mr23627536edd.250.1660746369458;
        Wed, 17 Aug 2022 07:26:09 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id om10-20020a170907a18a00b00734c88dd06csm6778381ejc.184.2022.08.17.07.26.07
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 07:26:07 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id z16so16384255wrh.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 07:26:07 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr14514707wrr.583.1660746366782; Wed, 17
 Aug 2022 07:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220726173824.1166873-1-dianders@chromium.org>
 <20220726103631.v2.4.Ie85f68215ada39f502a96dcb8a1f3ad977e3f68a@changeid> <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
In-Reply-To: <CAMSo37XsawRxTnJriLUAwJAj0+ZzpACtMiR_3V7H1H9WXg3T_Q@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 17 Aug 2022 07:25:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V5c0bCOCBvdnqVJ6Sa1XKeg+d7kTEL2Okh4GAL66MGiw@mail.gmail.com>
Message-ID: <CAD=FV=V5c0bCOCBvdnqVJ6Sa1XKeg+d7kTEL2Okh4GAL66MGiw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] regulator: core: Allow specifying an initial load
 w/ the bulk API
To:     Yongqin Liu <yongqin.liu@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <jstultz@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 16, 2022 at 5:58 AM Yongqin Liu <yongqin.liu@linaro.org> wrote:
>
> HI, Douglas
>
> With this change, I get one kernel panic with my hikey960
> android-mainline based Android build,
> if it's reverted, then the build could boot to the home screen successfully.
> From the log information I shared here, not sure if you have any idea
> what I could do to have the hikey960
> build work with this change,
>
> The kernel panic is something like this, for details, please check the
> log here: http://ix.io/47Lq
>
> [   10.738042][  T193] adv7511 1-0039: error 0000000000000000: Failed
> to get supply 'v1p2'
> [   10.748457][  T194] apexd: Found pre-installed APEX
> /system/apex/com.android.os.statsd.apex
> [   10.752908][   T67] Unable to handle kernel read from unreadable
> memory at virtual address 000000000000004c
> [   10.753116][    T8] Unable to handle kernel read from unreadable
> memory at virtual address 0000000000000078
> [   10.753130][    T8] Mem abort info:
> [   10.753135][    T8]   ESR = 0x0000000096000005
> [   10.753142][    T8]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   10.753152][    T8]   SET = 0, FnV = 0
> [   10.753159][    T8]   EA = 0, S1PTW = 0
> [   10.753166][    T8]   FSC = 0x05: level 1 translation fault
> [   10.753174][    T8] Data abort info:
> [   10.753179][    T8]   ISV = 0, ISS = 0x00000005
> [   10.753184][    T8]   CM = 0, WnR = 0
> [   10.753192][    T8] user pgtable: 4k pages, 39-bit VAs, pgdp=0000000003098000
> [   10.753204][    T8] [0000000000000078] pgd=0000000000000000,
> p4d=0000000000000000, pud=0000000000000000
> [   10.753232][    T8] Internal error: Oops: 96000005 [#1] PREEMPT SMP
> [   10.753245][    T8] Modules linked in: adv7511(E+) tcpci_rt1711h(E)
> hci_uart(E) btqca(E) btbcm(E) cpufreq_dt(E) hi3660_i2s(E)
> hisi_hikey_usb(E) hi6421_pmic_core(E) syscon_reboot_mode(E)
> reboot_mode(E) hi3660_mailbox(E) dw_mmc_k3(E) hisi_thermal(E)
> dw_mmc_pltfm(E) dw_mmc(E) kirin_drm(E) snd_soc_simple_card(E)
> snd_soc_simple_card_utils(E) spi_pl022(E) kirin_dsi(E)
> phy_hi3660_usb3(E) i2c_designware_platform(E) drm_cma_helper(E)
> i2c_designware_core(E) mali_kbase(OE) k3dma(E) cma_heap(E)
> system_heap(E)
> [   10.753436][    T8] CPU: 2 PID: 8 Comm: kworker/u16:0 Tainted: G
>        OE      5.19.0-mainline-03487-g86d047950300-dirty #1
> [   10.753454][    T8] Hardware name: HiKey960 (DT)
> [   10.753463][    T8] Workqueue: events_unbound async_run_entry_fn
> [   10.753497][    T8] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT
> -SSBS BTYPE=--)
> [   10.753516][    T8] pc : regulator_bulk_enable_async+0x3c/0x98
> [   10.753540][    T8] lr : async_run_entry_fn+0x30/0xf8
> [   10.753559][    T8] sp : ffffffc009ed3d20
> [   10.753567][    T8] x29: ffffffc009ed3d40 x28: 0000000000000402
> x27: ffffff801ad99828
> [   10.753592][    T8] x26: ffffff803217b010 x25: 0000000000000002
> x24: ffffff8003385da8
> [   10.753617][    T8] x23: ffffff8003385da0 x22: ffffff801ad94805
> x21: ffffff8003385da0
> [   10.753642][    T8] x20: 0000000000000000 x19: ffffff8003143d20
> x18: ffffffc008075028
> [   10.753667][    T8] x17: 000000040044ffff x16: 0000000000000001
> x15: 0000000000000010
> [   10.753691][    T8] x14: 0000000000000000 x13: 0000000000000f58
> x12: 0000000082355555
> [   10.753715][    T8] x11: 00006acfbfa2f400 x10: 0000000000000016 x9
> : 00ffffffffffffff
> [   10.753740][    T8] x8 : da9ecda1b63b0500 x7 : 0000000000008080 x6
> : 0000000000000000
> [   10.753764][    T8] x5 : 0000000000000001 x4 : 0000646e756f626e x3
> : ffffff801ad99828
> [   10.753788][    T8] x2 : ffffff8003385da8 x1 : ffffffc009ed3d20 x0
> : ffffff8003143d20
> [   10.753812][    T8] Call trace:
> [   10.753818][    T8]  regulator_bulk_enable_async+0x3c/0x98
> [   10.753839][    T8]  async_run_entry_fn+0x30/0xf8
> [   10.753859][    T8]  process_one_work+0x1d0/0x404
> [   10.753879][    T8]  worker_thread+0x25c/0x43c
> [   10.753897][    T8]  kthread+0xf0/0x2c0
> [   10.753912][    T8]  ret_from_fork+0x10/0x20
> [   10.753940][    T8] Code: f81f83a8 f9400814 a900ffff f90003ff (f9403e95)
> [   10.753950][    T8] ---[ end trace 0000000000000000 ]---
> [   10.760621][  T194] apexd: Found pre-installed APEX
> /system/apex/com.android.permission.capex
> [   10.767672][   T67] Mem abort info:
> [   10.779658][  T194] apexd: Found pre-installed APEX
> /system/apex/com.android.art.capex
> [   10.783690][   T67]   ESR = 0x0000000096000005
> [   10.792424][  T194] apexd: Found pre-installed APEX
> /system/apex/com.android.scheduling.capex
> [   10.794713][    T8] Kernel panic - not syncing: Oops: Fatal exception
> [   10.794723][    T8] SMP: stopping secondary CPUs
> [   10.798141][    T8] Kernel Offset: 0x70000 from 0xffffffc008000000
> [   10.798150][    T8] PHYS_OFFSET: 0x0
> [   10.798156][    T8] CPU features: 0x0000,00649020,00001086
> [   10.798167][    T8] Memory Limit: none

Are you fixed by the patch ("regulator: core: Fix missing error return
from regulator_bulk_get()") [1]

[1] https://lore.kernel.org/r/20220809142738.1.I91625242f137c707bb345c51c80c5ecee02eeff3@changeid
