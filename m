Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBE5343E3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 17:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389329AbfFMPs2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 11:48:28 -0400
Received: from ns.iliad.fr ([212.27.33.1]:60802 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731732AbfFMJTa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 05:19:30 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id EB8E320A52;
        Thu, 13 Jun 2019 11:19:28 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id D33D420732;
        Thu, 13 Jun 2019 11:19:28 +0200 (CEST)
Subject: Re: msm8996: qcom-qmp: apq8096-db820c fails to boot, reset back to
 fastboot and locks up
To:     Paolo Pisati <p.pisati@gmail.com>
References: <20190610134401.GA12964@harukaze>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Niklas Cassel <niklas.cassel@linaro.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <8cc440fd-9fd2-97a6-42e1-0a0b9c456d10@free.fr>
Date:   Thu, 13 Jun 2019 11:19:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190610134401.GA12964@harukaze>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Thu Jun 13 11:19:28 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/06/2019 15:44, Paolo Pisati wrote:

> From time to time, my apq8096-db820c fails to boot to userspace, reset back to
> fastboot and locks up: to easily reproduce the issue, i'm boot looping using a
> cron job with a 1 min reboot entry on the board while leaving a "while 1; do
> fastboot boot boot.img; done" on the host pc.
> 
> The issue is present in mainline up to 5.2-rc4, using defconfig and:
> 
> CONFIG_SCSI_UFS_QCOM=y
> CONFIG_PHY_QCOM_QMP=y
> CONFIG_PHY_QCOM_UFS=y
> 
> but was present in previous releases too (e.g. 4.14., 4.19, etc qcom-lt or
> mainline), where it's even easier to reproduce (e.g. takes way less reboots to
> trigger it).
> 
> These are the last lines printed out:
> ...
> [    7.407209] qcom-qmp-phy 34000.phy: Registered Qcom-QMP phy
> [    7.448058] qcom-qmp-phy 7410000.phy: Registered Qcom-QMP phy
> [    7.461859] ufs_qcom_phy_qmp_14nm 627000.phy: invalid resource
> [    7.535434] qcom-qmp-phy 34000.phy: phy common block init timed-out
> [    7.538596] phy phy-34000.phy.0: phy init failed --> -110
> [    7.550891] qcom-pcie: probe of 600000.pcie failed with error -110
> [    7.619008] qcom-pcie 608000.pcie: 608000.pcie supply vddpe-3v3 not found,
> using dummy regulator
> 
> Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
> S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.0-00301
> S - IMAGE_VARIANT_STRING=M8996LAB
> S - OEM_IMAGE_VERSION_STRING=crm-ubuntu68
> S - Boot Interface: UFS
> S - Secure Boot: Off
> ...
> 
> Full boot here: https://pastebin.ubuntu.com/p/rtjVrD3yzk/
> 
> Any idea what is going on? Am i doing something wrong?

Hmmm... this might be related to:

https://patchwork.kernel.org/patch/10976217/

Regards.
