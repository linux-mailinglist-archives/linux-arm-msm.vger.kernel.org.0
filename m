Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7960D73A87F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jun 2023 20:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjFVSpW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jun 2023 14:45:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231361AbjFVSpS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jun 2023 14:45:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C16D1FF7
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687459467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=90xtq2DpQNgaWvX2FSvn2ErlpVQgwDlyMDGGEqzIOfQ=;
        b=R6PbRV+5PYCMsZ1dqVhlK9tmMPhFTRjfCcPuLiVmagjZInp8LFQxvJYuUU4PrzTl0dOKgS
        iIVRd8Ye26FCstGgO3+8nFFqJY+VmVtTmbo5DZbnZyawnpLBk93dNxHahr5/ssWh/34xSf
        ABiDPWPoq7W5NT42Vcs1zohsNBBVgtM=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-Nnv7_1SeNo6GnCb5oYW2Xw-1; Thu, 22 Jun 2023 14:44:26 -0400
X-MC-Unique: Nnv7_1SeNo6GnCb5oYW2Xw-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-39c7f771ddcso6856482b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jun 2023 11:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687459465; x=1690051465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90xtq2DpQNgaWvX2FSvn2ErlpVQgwDlyMDGGEqzIOfQ=;
        b=EI3YUeG0iCDCoe/PWIRFdVRXVxwXVv0WzAYWbAVbW/VTQl6ZU/56numMF77kE/qqaq
         BTp4PJ7/bRjjVIQIK+ygiFp7yVN/jfXEqseQcAyc+RPo1oSAk0kH77Zv2BZanobWFp/K
         hmHwwaLb6b/oM5lt+f++y0kQX2J0fQ7tHdEoe3iV2v+7Hr3K44EmGDW/9VPbVizX0M8n
         vy5dHgBVvVdP7XA9hBnEnFyHE+1YPPnkG0CkzeAqIubQF17+fX+r/uLyPdSPw4AbQrhO
         b4mRiV3nCptHTqAm0aFBwbMqtUowjrCs3UtYl5cWlEahWqV0CG5FrQ5uJ9Kkp/Y47o+O
         pjfQ==
X-Gm-Message-State: AC+VfDxtt3JIRUX87qi7vbShPoQ43v+1LvswyoEGDCflCZVIh4uCj2u9
        bCKzNX8C79QXOctAoYURIrgtMH9cO/AfrU4mOLtB1svZNF8isGpwAP7rlgqwdERb1ZQ5+8rI6Aj
        KzymBzDsbHHlbmgdJSyCEXtr8Lg==
X-Received: by 2002:a05:6808:220d:b0:39e:db80:b7fb with SMTP id bd13-20020a056808220d00b0039edb80b7fbmr13787368oib.10.1687459465542;
        Thu, 22 Jun 2023 11:44:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uBmDku1D7bVUS1j7y42y/lZBDMjw1PD7CSH2JQYElqmtLzVCaGHmHGzMHwReGfkMLaxyXwQ==
X-Received: by 2002:a05:6808:220d:b0:39e:db80:b7fb with SMTP id bd13-20020a056808220d00b0039edb80b7fbmr13787355oib.10.1687459465252;
        Thu, 22 Jun 2023 11:44:25 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::f])
        by smtp.gmail.com with ESMTPSA id q14-20020a056808200e00b003896e31867esm3398479oiw.49.2023.06.22.11.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 11:44:24 -0700 (PDT)
Date:   Thu, 22 Jun 2023 13:44:22 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RESEND PATCH v2 0/5] arm64: dts: qcom: enable ethernet on
 sa8775p-ride
Message-ID: <20230622184422.4e72vtqk53nnx42g@halaney-x13s>
References: <20230622120142.218055-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230622120142.218055-1-brgl@bgdev.pl>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 22, 2023 at 02:01:37PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Bjorn,
> 
> Now that all other bits and pieces are in next, I'm resending the reviewed
> DTS patches for pick up. This enables one of the 1Gb ethernet ports on
> sa8775p-ride.
> 
> Bartosz Golaszewski (5):
>   arm64: dts: qcom: sa8775p: add the SGMII PHY node
>   arm64: dts: qcom: sa8775p: add the first 1Gb ethernet interface
>   arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY
>   arm64: dts: qcom: sa8775p-ride: add pin functions for ethernet0
>   arm64: dts: qcom: sa8775p-ride: enable ethernet0
> 
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts | 109 ++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi     |  42 +++++++++
>  2 files changed, 151 insertions(+)
> 
> -- 
> 2.39.2
> 

Tested-by: Andrew Halaney <ahalaney@redhat.com>

note, I did uncover a bug in stmmac (imo) wrt unbalanced calls to
serdes_powerup/serdes_powerdown() which I plan on trying to fix shortly.

Not really related to any of the Qualcomm specific bits though. This
looks good to me.

You can trigger the bug I mentioned by removing the dwmac-qcom-ethqos module:

    [  174.893710] ------------[ cut here ]------------
    [  174.898459] unbalanced disables for vreg_l5a
    [  174.902868] WARNING: CPU: 5 PID: 584 at drivers/regulator/core.c:2996 _regulator_disable+0xe8/0x1c8
    [  174.912150] Modules linked in: r8152 rfkill marvell dwmac_qcom_ethqos(-) stmmac_platform stmmac qcom_pon crct10dif_ce spi_geni_qcom i2c_qcom_geni phy_qcom_qmp_usb pcs_xpcs phy_qcom_snps_femto_v2 qcom_wdt socinfo fuse ufs_qcom phy_qcom_qmp_ufs
    [  174.934171] CPU: 5 PID: 584 Comm: modprobe Not tainted 6.4.0-rc7-next-20230622-00006-gb4d4b58e3c81-dirty #29
    [  174.944250] Hardware name: Qualcomm SA8775P Ride (DT)
    [  174.949438] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    [  174.956578] pc : _regulator_disable+0xe8/0x1c8
    [  174.961143] lr : _regulator_disable+0xe8/0x1c8
    [  174.965709] sp : ffff800082c13b50
    [  174.969114] x29: ffff800082c13b50 x28: ffff592b4c692d00 x27: 0000000000000000
    [  174.976431] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
    [  174.983750] x23: ffff592b40dd8c90 x22: ffff592b40f47490 x21: ffff592b41a72000
    [  174.991067] x20: ffff592b409c6900 x19: ffff592b409c6900 x18: 0000000000000006
    [  174.998385] x17: 3630333230322d74 x16: ffffcc489c71e6f8 x15: ffff800082c135d0
    [  175.005702] x14: 0000000000000000 x13: 61356c5f67657276 x12: 20726f662073656c
    [  175.013019] x11: fffffffffffe0000 x10: ffffcc489ea33488 x9 : ffffcc489c27aa10
    [  175.020336] x8 : 00000000ffffefff x7 : ffffcc489ea33488 x6 : 80000000fffff000
    [  175.027654] x5 : ffff5939bb92acc8 x4 : 0000000000000000 x3 : 0000000000000000
    [  175.034971] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff592b4c692d00
    [  175.042289] Call trace:
    [  175.044802]  _regulator_disable+0xe8/0x1c8
    [  175.049010]  regulator_disable+0x4c/0x98
    [  175.053040]  phy_power_off+0x90/0xe0
    [  175.056714]  qcom_ethqos_serdes_powerdown+0x28/0x48 [dwmac_qcom_ethqos]
    [  175.063510]  stmmac_dvr_remove+0xa0/0x178 [stmmac]
    [  175.068440]  stmmac_pltfr_remove+0x2c/0x80 [stmmac_platform]
    [  175.074255]  platform_remove+0x34/0x80
    [  175.078107]  device_remove+0x54/0x90
    [  175.081783]  device_release_driver_internal+0x1dc/0x240
    [  175.087150]  driver_detach+0x58/0xa8
    [  175.090824]  bus_remove_driver+0x74/0xd0
    [  175.094856]  driver_unregister+0x38/0x70
    [  175.098887]  platform_driver_unregister+0x1c/0x30
    [  175.103721]  qcom_ethqos_driver_exit+0x18/0x1b8 [dwmac_qcom_ethqos]
    [  175.110160]  __arm64_sys_delete_module+0x1a8/0x298
    [  175.115082]  invoke_syscall+0x50/0x128
    [  175.118936]  el0_svc_common.constprop.0+0xcc/0xf8
    [  175.123770]  do_el0_svc+0x40/0xa8
    [  175.127178]  el0_svc+0x2c/0x88
    [  175.130318]  el0t_64_sync_handler+0x100/0x130
    [  175.134795]  el0t_64_sync+0x190/0x198
    [  175.138560] ---[ end trace 0000000000000000 ]---
    [root@dhcp19-243-249 ~]# 

Just dumping the stack on serdes_powerdown/up calls you get the
following:

    [    6.179584] qcom-ethqos 23040000.ethernet eth0: PHY [stmmac-0:08] driver [Marvell 88E1510] (irq=POLL)
    [    6.189571] CPU: 0 PID: 323 Comm: NetworkManager Not tainted 6.4.0-rc7-next-20230622-00006-gb4d4b58e3c81-dirty #29
    [    6.200192] Hardware name: Qualcomm SA8775P Ride (DT)
    [    6.205373] Call trace:
    [    6.207896]  dump_backtrace+0x9c/0x100
    [    6.211752]  show_stack+0x20/0x38
    [    6.215160]  dump_stack_lvl+0x48/0x60
    [    6.218929]  dump_stack+0x18/0x28
    [    6.222335]  qcom_ethqos_serdes_powerup+0x20/0x70 [dwmac_qcom_ethqos]
    [    6.228957]  __stmmac_open+0x138/0x488 [stmmac]
    [    6.233634]  stmmac_open+0x4c/0xe8 [stmmac]
    [    6.237948]  __dev_open+0x108/0x1e8
    [    6.241535]  __dev_change_flags+0x194/0x218
    [    6.245834]  dev_change_flags+0x2c/0x80
    [    6.249778]  do_setlink+0x2b0/0xef8
    [    6.253363]  __rtnl_newlink+0x514/0x870
    [    6.257305]  rtnl_newlink+0x58/0x90
    [    6.260891]  rtnetlink_rcv_msg+0x134/0x390
    [    6.265100]  netlink_rcv_skb+0x64/0x138
    [    6.269046]  rtnetlink_rcv+0x20/0x38
    [    6.272721]  netlink_unicast+0x2f0/0x350
    [    6.276755]  netlink_sendmsg+0x1b0/0x430
    [    6.280789]  ____sys_sendmsg+0x1d8/0x2c8
    [    6.284826]  ___sys_sendmsg+0xb4/0x110
    [    6.288680]  __sys_sendmsg+0x8c/0xf0
    [    6.292357]  __arm64_sys_sendmsg+0x2c/0x40
    [    6.296570]  invoke_syscall+0x50/0x128
    [    6.300424]  el0_svc_common.constprop.0+0xcc/0xf8
    [    6.305253]  do_el0_svc+0x40/0xa8
    [    6.308662]  el0_svc+0x2c/0x88
    [    6.311804]  el0t_64_sync_handler+0x100/0x130
    [    6.316285]  el0t_64_sync+0x190/0x198
    <snip>
    [root@dhcp19-243-249 ~]# modprobe -r dwmac_qcom_ethqos
    [  174.562075] qcom-ethqos 23040000.ethernet eth0: stmmac_dvr_remove: removing driver
    [  174.570660] stmmac_pcs: Link Down
    [  174.580082] CPU: 5 PID: 584 Comm: modprobe Not tainted 6.4.0-rc7-next-20230622-00006-gb4d4b58e3c81-dirty #29
    [  174.590176] Hardware name: Qualcomm SA8775P Ride (DT)
    [  174.595363] Call trace:
    [  174.597881]  dump_backtrace+0x9c/0x100
    [  174.601744]  show_stack+0x20/0x38
    [  174.605154]  dump_stack_lvl+0x48/0x60
    [  174.608926]  dump_stack+0x18/0x28
    [  174.612339]  qcom_ethqos_serdes_powerdown+0x20/0x48 [dwmac_qcom_ethqos]
    [  174.619138]  stmmac_release+0x234/0x2e0 [stmmac]
    [  174.623893]  __dev_close_many+0xb4/0x160
    [  174.627920]  dev_close_many+0x8c/0x140
    [  174.631777]  unregister_netdevice_many_notify+0x140/0x7a0
    [  174.637320]  unregister_netdevice_queue+0xa0/0xe8
    [  174.642151]  unregister_netdev+0x2c/0x48
    [  174.646179]  stmmac_dvr_remove+0x88/0x178 [stmmac]
    [  174.651109]  stmmac_pltfr_remove+0x2c/0x80 [stmmac_platform]
    [  174.656925]  platform_remove+0x34/0x80
    [  174.660786]  device_remove+0x54/0x90
    [  174.664468]  device_release_driver_internal+0x1dc/0x240
    [  174.669834]  driver_detach+0x58/0xa8
    [  174.673514]  bus_remove_driver+0x74/0xd0
    [  174.677552]  driver_unregister+0x38/0x70
    [  174.681578]  platform_driver_unregister+0x1c/0x30
    [  174.686408]  qcom_ethqos_driver_exit+0x18/0x1b8 [dwmac_qcom_ethqos]
    [  174.692847]  __arm64_sys_delete_module+0x1a8/0x298
    [  174.697767]  invoke_syscall+0x50/0x128
    [  174.701617]  el0_svc_common.constprop.0+0xcc/0xf8
    [  174.706449]  do_el0_svc+0x40/0xa8
    [  174.709864]  el0_svc+0x2c/0x88
    [  174.713009]  el0t_64_sync_handler+0x100/0x130
    [  174.717482]  el0t_64_sync+0x190/0x198
    [  174.721919] qcom-ethqos 23040000.ethernet eth0: FPE workqueue stop
    [  174.779478] CPU: 5 PID: 584 Comm: modprobe Not tainted 6.4.0-rc7-next-20230622-00006-gb4d4b58e3c81-dirty #29
    [  174.789565] Hardware name: Qualcomm SA8775P Ride (DT)
    [  174.794754] Call trace:
    [  174.797267]  dump_backtrace+0x9c/0x100
    [  174.801123]  show_stack+0x20/0x38
    [  174.804528]  dump_stack_lvl+0x48/0x60
    [  174.808295]  dump_stack+0x18/0x28
    [  174.811700]  qcom_ethqos_serdes_powerdown+0x20/0x48 [dwmac_qcom_ethqos]
    [  174.818497]  stmmac_dvr_remove+0xa0/0x178 [stmmac]
    [  174.823429]  stmmac_pltfr_remove+0x2c/0x80 [stmmac_platform]
    [  174.829245]  platform_remove+0x34/0x80
    [  174.833097]  device_remove+0x54/0x90
    [  174.836772]  device_release_driver_internal+0x1dc/0x240
    [  174.842138]  driver_detach+0x58/0xa8
    [  174.845810]  bus_remove_driver+0x74/0xd0
    [  174.849841]  driver_unregister+0x38/0x70
    [  174.853870]  platform_driver_unregister+0x1c/0x30
    [  174.858702]  qcom_ethqos_driver_exit+0x18/0x1b8 [dwmac_qcom_ethqos]
    [  174.865140]  __arm64_sys_delete_module+0x1a8/0x298
    [  174.870061]  invoke_syscall+0x50/0x128
    [  174.873913]  el0_svc_common.constprop.0+0xcc/0xf8
    [  174.878745]  do_el0_svc+0x40/0xa8
    [  174.882153]  el0_svc+0x2c/0x88
    [  174.885292]  el0t_64_sync_handler+0x100/0x130
    [  174.889768]  el0t_64_sync+0x190/0x198

Need to figure out which one of those serdes_powerdown() calls to undo.

Thanks,
Andrew

