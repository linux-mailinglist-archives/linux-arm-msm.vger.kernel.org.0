Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2BD24E96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 May 2019 14:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728097AbfEUMDj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 May 2019 08:03:39 -0400
Received: from ns.iliad.fr ([212.27.33.1]:54096 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbfEUMDi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 May 2019 08:03:38 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 85B36206B9;
        Tue, 21 May 2019 14:03:36 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 79B1C1FF2B;
        Tue, 21 May 2019 14:03:36 +0200 (CEST)
Subject: Re: [PATCH v2 7/9] arm64: dts: qcom: msm8998: Add PSCI cpuidle low
 power states
To:     Amit Kucheria <amit.kucheria@linaro.org>
References: <cover.1558430617.git.amit.kucheria@linaro.org>
 <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Gross <agross@kernel.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <a7514c68-d2d3-ce9e-bc4b-f484bb5bf3cf@free.fr>
Date:   Tue, 21 May 2019 14:03:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <49cf5d94beb9af9ef4e78d4c52f3b0ad20b7c63f.1558430617.git.amit.kucheria@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Tue May 21 14:03:36 2019 +0200 (CEST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21/05/2019 11:35, Amit Kucheria wrote:

> Add device bindings for cpuidle states for cpu devices.
> 
> Cc: Marc Gonzalez <marc.w.gonzalez@free.fr>
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 50 +++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> index 3fd0769fe648..54810980fcf9 100644
> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
> @@ -78,6 +78,7 @@
>  			compatible = "arm,armv8";
>  			reg = <0x0 0x0>;
>  			enable-method = "psci";
> +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0 &LITTLE_CPU_SLEEP_1>;
>  			efficiency = <1024>;
>  			next-level-cache = <&L2_0>;
>  			L2_0: l2-cache {


NB: this patch does not apply cleanly to v5.2-rc1  ;-)

86f93c93dd50 arm64: dts: msm8998: efficiency is not valid property

commit 86f93c93dd5005f0aeb8ce84c2113e21a6006c7d
Author:     Amit Kucheria <amit.kucheria@linaro.org>
AuthorDate: Fri Mar 29 15:42:08 2019 +0530
Commit:     Andy Gross <agross@kernel.org>
CommitDate: Tue Apr 9 23:08:17 2019 -0500

After manually fixing up the trivial conflict, the DTB builds without errors.

I then enable
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_CPUIDLE=y

(because I'm using a board-specific tiny defconfig)

And... the system starts to boot, hangs a few seconds, then silently reboots:

scsi 0:0:0:3: Direct-Access     SAMSUNG  KLUBG4G1CE-B0B1  0800 PQ: 0 ANSI: 6
sd 0:0:0:1: [sdb] 16384-byte physical blocks
sd 0:0:0:2: [sdc] 2048 4096-byte logical blocks: (8.39 MB/8.00 MiB)
sd 0:0:0:2: [sdc] 16384-byte physical blocks

Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.XF.1.2.2-00157-M8998LZB-1
S - IMAGE_VARIANT_STRING=Msm8998LA


Looks like the "helpful" behavior of the secure OS...

Regards.
