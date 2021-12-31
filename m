Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59FEA482207
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Dec 2021 05:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242552AbhLaEtu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Dec 2021 23:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237595AbhLaEtt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Dec 2021 23:49:49 -0500
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA407C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Dec 2021 20:49:49 -0800 (PST)
Received: by mail-qk1-x72d.google.com with SMTP id w27so18258901qkj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Dec 2021 20:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cG20Uk3uX+eZxv5zMwmx9dHvrtiNdeQpUqghZWc8dNs=;
        b=f6nQxW6HSXXUxu/BNQj8vy2G3YhNKV7CVJWnNBu4aUhTmb6VpoAwuia7PfP0WIZGUb
         cZkx2KMop9RUXY1CYyZeQUidfi42rFalHFBL1taribmyupNYJlfw2wFKks0CO77eQLyo
         DG6yXzjIe3j9FZ4QtzaXDn9vHA1Pw6W9ym1h84PeA+viDUgV5oW2a+iOMaNte7Aj+F8g
         PgmXAesCr4MXPJbzdrY3mNNa40X9B1Nn+etxwtmQ1/bl4ExSpFSA7l7gAsmrfjoSdvSv
         eZHXJjVzhCQIdynoP7yN+En9oA7res1oGkOYs8RbFHFcGElNkV0/hrKG1+stbTO6jeDK
         e8bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cG20Uk3uX+eZxv5zMwmx9dHvrtiNdeQpUqghZWc8dNs=;
        b=dQlF/D+TXDYndjiDFCybExCdipGeMp9LTmWYckW18sFYKjRFp1Zpquwsozo9ctq8fs
         1C880JgmbBiSNg2Wgx1+f2H0WyUA/EouF6BPEHw6ZHfenQlWLYlWDG9byADJzJnkw0e9
         qGmy/g3arz2q9H+wz5BRrM7D5CDk3BVtm44rzcNE9RGcq/nih4RtPcogdHuUyiFIppwO
         8/mDukK8GTNUEPW2XwHLAZabe5MUzKKq//By49vLniw+Z0g9FjodrjnVYEYNBLG5lPZ3
         LasLz2D7TrBsbMLuXQElHw5WNWJJS/eNvl5XSkB5YpnAZo0ugRDpTv9DvK8kVnyxvDju
         cYww==
X-Gm-Message-State: AOAM532dbxnzMllf46FB3I2q01XY4xcOaNMH3yw5I1hCMil8iTdTfc5f
        z49bIVkRyziwwiMT4iCBj6JEy5H5dkJTNXQQIR5JYw==
X-Google-Smtp-Source: ABdhPJzyKNQKoRnXNkisVgJChm9BzeN2BWhAWzqt2ti0rLDZIf85+El+VKeJN1TrEGnCa+Ya0smI7RBVIxAFb+W0Xms=
X-Received: by 2002:a05:620a:797:: with SMTP id 23mr24043616qka.30.1640926188856;
 Thu, 30 Dec 2021 20:49:48 -0800 (PST)
MIME-Version: 1.0
References: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
 <20211126023516.1108411-3-dmitry.baryshkov@linaro.org> <YcvgJcxWDfaSMVVg@builder.lan>
 <CAA8EJpqQrGFhD3+SCLZg5E2zzV_62v9=abcqK7LkOWDKYZo5Xg@mail.gmail.com>
In-Reply-To: <CAA8EJpqQrGFhD3+SCLZg5E2zzV_62v9=abcqK7LkOWDKYZo5Xg@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 31 Dec 2021 07:49:37 +0300
Message-ID: <CAA8EJpqHPpdGU=xnWuEps3ymL0QhRBkdiEUZu5e7XmSJAqLv-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/msm/dp: rewrite dss_module_power to use bulk
 clock functions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 31 Dec 2021 at 07:48, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> HI,
>
> On Wed, 29 Dec 2021 at 07:12, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Thu 25 Nov 20:35 CST 2021, Dmitry Baryshkov wrote:
> >
> > > In order to simplify DP code, drop hand-coded loops over clock arrays=
,
> > > replacing them with clk_bulk_* functions.
> > >
> >
> > I've yet to debug this, but applying the two patches and attaching an
> > HDMI cable to my USB dongle results in the follwing splat on the 8350
> > HDK.
>
> Intersesting. The only major difference between original code and the
> patches code in this function is the removal of `if (clk_arry[i].clk)`
> condition in that function. Could yyou please check whether clocks are
> properly parsed at the time you receive the hpd event?

s/parsed/dp_power_clk_init called/

>
> If  we can not debug this issue,  I'd then propose to merge first
> patch and let somebody else rewrite dp_clk_util to use clk_bulk_data.
>
> >
> > [   39.658840] Unable to handle kernel NULL pointer dereference at virt=
ual address 0000000000000000
> > [   39.667883] Mem abort info:
> > [   39.670774]   ESR =3D 0x96000006
> > [   39.673940]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
> > [   39.679417]   SET =3D 0, FnV =3D 0
> > [   39.682582]   EA =3D 0, S1PTW =3D 0
> > [   39.685825]   FSC =3D 0x06: level 2 translation fault
> > [   39.690851] Data abort info:
> > [   39.693838]   ISV =3D 0, ISS =3D 0x00000006
> > [   39.697797]   CM =3D 0, WnR =3D 0
> > [   39.700864] user pgtable: 4k pages, 48-bit VAs, pgdp=3D000000010eb8d=
000
> > [   39.707501] [0000000000000000] pgd=3D080000010f097003, p4d=3D0800000=
10f097003, pud=3D080000010ba58003, pmd=3D0000000000000000
> > [   39.718425] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> > [   39.724169] Modules linked in: pmic_glink_altmode qcom_pmic_glink_po=
wer cfg80211 rfkill 8021q garp mrp stp llc microchip lan78xx snd_soc_hdmi_c=
odec pmic_glink pdr_interface rpmsg_char qrtr_smd qrtr fsa4480 qcom_q6v5_pa=
s qcom_pil_info i2c_qcom_geni qcom_q6v5 msm qcom_sysmon qcom_stats gpu_sche=
d crct10dif_ce drm_kms_helper qcom_common qcom_glink_smem gpucc_sm8350 phy_=
qcom_qmp mdt_loader typec ufs_qcom qmi_helpers qcom_rng socinfo qnoc_sm8350=
 rmtfs_mem fuse drm ipv6
> > [   39.766330] CPU: 0 PID: 85 Comm: kworker/0:3 Not tainted 5.16.0-rc5-=
next-20211215-00046-g2f90133452d9 #280
> > [   39.776256] Hardware name: Qualcomm Technologies, Inc. SM8350 HDK (D=
T)
> > [   39.782969] Workqueue: events pmic_glink_altmode_worker [pmic_glink_=
altmode]
> > [   39.790235] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BT=
YPE=3D--)
> > [   39.797393] pc : __pi_strcmp+0x1c/0xf0
> > [   39.801271] lr : dp_ctrl_set_clock_rate+0x8c/0xf0 [msm]
> > [   39.806737] sp : ffff800008adbbc0
> > [   39.810153] x29: ffff800008adbbc0 x28: 0000000000000000 x27: 0000000=
000000000
> > [   39.817501] x26: ffffb60107f74270 x25: ffff297a49b33c80 x24: 0000000=
0202fbf00
> > [   39.824846] x23: 0000000000000001 x22: ffff297a4b400580 x21: 0000000=
000000020
> > [   39.832188] x20: ffffb600e3d78068 x19: 0000000000000000 x18: fffffff=
fffffffff
> > [   39.839541] x17: 6b6c63206e6f2030 x16: ffffb601063476c0 x15: 0720072=
007200720
> > [   39.846893] x14: 0720072007200720 x13: ffffb60107c622c8 x12: 0000000=
000000765
> > [   39.854229] x11: 0000000000000277 x10: 0101010101010101 x9 : ffffb60=
107c622c8
> > [   39.861565] x8 : 00000000ffffefff x7 : 0000000000000000 x6 : ffffb60=
107cba2c8
> > [   39.868902] x5 : 0000000000000000 x4 : ffff297cbe8619d8 x3 : 0000000=
000000000
> > [   39.876240] x2 : 0000000000000000 x1 : ffffb600e3d78068 x0 : 0000000=
000000000
> > [   39.883594] Call trace:
> > [   39.886124]  __pi_strcmp+0x1c/0xf0
> > [   39.889638]  dp_ctrl_enable_mainlink_clocks+0x98/0x110 [msm]
> > [   39.895537]  dp_ctrl_on_link+0x98/0x3f0 [msm]
> > [   39.900096]  dp_display_process_hpd_high+0xa8/0x100 [msm]
> > [   39.905731]  dp_display_usbpd_attention_cb+0x164/0x1a4 [msm]
> > [   39.911629]  dp_hpd_oob_event+0x74/0xa4 [msm]
> > [   39.916195]  dp_display_oob_hotplug_event+0x1c/0x2c [msm]
> > [   39.921831]  dp_oob_hotplug_event+0x18/0x24 [msm]
> > [   39.926756]  drm_connector_oob_hotplug_event+0x40/0x60 [drm]
> > [   39.932686]  pmic_glink_altmode_worker+0x7c/0x194 [pmic_glink_altmod=
e]
> > [   39.939398]  process_one_work+0x1d0/0x350
> > [   39.943526]  worker_thread+0x13c/0x460
> > [   39.947390]  kthread+0x17c/0x190
> > [   39.950722]  ret_from_fork+0x10/0x20
> > [   39.954416] Code: f24008ff 540003e1 f2400807 54000241 (f8408402)
> > [   39.960684] ---[ end trace 0000000000000000 ]---
> >
> > Regards,
> > Bjorn
>
>
>
> --
> With best wishes
> Dmitry



--=20
With best wishes
Dmitry
