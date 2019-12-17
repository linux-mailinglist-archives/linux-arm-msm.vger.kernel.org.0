Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78DFB122FC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 16:09:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfLQPJB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 10:09:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:51300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727797AbfLQPJA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 10:09:00 -0500
Received: from localhost (unknown [171.61.91.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 704FA24650;
        Tue, 17 Dec 2019 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576595339;
        bh=/L/YM9y3EQ7M7j9OCsHkTEAc9CxXqYwxEwd5UfUTk6Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0ZPiHOIUfYeqe3hTMlvEFMuq2TmDsxx8do47dSTBK2TGNl+oQKocRpRjU4uKWVbzl
         /Il8UsW1uG7zFY0EzWuje88/uPzAyK0J7uk9XsCVxkaQddP/Vxcjt//Ug8SsnCusDk
         YkC70lZ4aFsOO02BD5CoGYcBkAGTaXLss5AMVgx4=
Date:   Tue, 17 Dec 2019 20:38:52 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     cang@codeaurora.org
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, salyzyn@google.com,
        Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Pedro Sousa <pedrom.sousa@synopsys.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for
 host controller
Message-ID: <20191217150852.GO2536@vkoul-mobl>
References: <1573798172-20534-1-git-send-email-cang@codeaurora.org>
 <1573798172-20534-3-git-send-email-cang@codeaurora.org>
 <20191216190415.GL2536@vkoul-mobl>
 <CAOCk7NpAp+DHBp-owyKGgJFLRajfSQR6ff1XMmAj6A4nM3VnMQ@mail.gmail.com>
 <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
 <20191217041342.GM2536@vkoul-mobl>
 <763d7b30593b31646f3c198c2be99671@codeaurora.org>
 <20191217092433.GN2536@vkoul-mobl>
 <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17-12-19, 18:09, cang@codeaurora.org wrote:
> On 2019-12-17 17:24, Vinod Koul wrote:
> > Hi Can,
> > 
> > On 17-12-19, 15:10, cang@codeaurora.org wrote:
> > > On 2019-12-17 12:13, Vinod Koul wrote:
> > > > Hi Can,
> > > >
> > > > On 17-12-19, 08:37, cang@codeaurora.org wrote:
> > > > > On 2019-12-17 03:12, Jeffrey Hugo wrote:
> > > > > > On Mon, Dec 16, 2019 at 12:05 PM Vinod Koul <vkoul@kernel.org> wrote:
> > > > > > >
> > > > > > > Hi Can,
> > > > > > >
> > > > > > > On 14-11-19, 22:09, Can Guo wrote:
> > > > > > > > Add reset control for host controller so that host controller can be reset
> > > > > > > > as required in its power up sequence.
> > > > > > >
> > > > > > > I am seeing a regression on UFS on SM8150-mtp with this patch. I think
> > > > > > > Jeff is seeing same one lenove laptop on 8998.
> > > > > >
> > > > > > Confirmed.
> > > > > >
> > > > > > >
> > > > > > > 845 does not seem to have this issue and only thing I can see is
> > > > > > > that on
> > > > > > > sm8150 and 8998 we define reset as:
> > > > > > >
> > > > > > >                         resets = <&gcc GCC_UFS_BCR>;
> > > > > > >                         reset-names = "rst";
> > > > > > >
> > > > >
> > > > > Hi Jeffrey and Vinod,
> > > > >
> > > > > Thanks for reporting this. May I know what kind of regression do you
> > > > > see on
> > > > > 8150 and 8998?
> > > > > BTW, do you have reset control for UFS PHY in your DT?
> > > > > See 71278b058a9f8752e51030e363b7a7306938f64e.
> > > > >
> > > > > FYI, we use reset control on all of our platforms and it is
> > > > > a must during our power up sequence.
> > > >
> > > > Yes we do have this and additionally both the DTS describe a 'rst' reset
> > > > and this patch tries to use this.
> > > >
> > > > Can you please tell me which platform this was tested on how the reset
> > > > was described in DT
> > > >
> > > > Thanks
> > > 
> > > Hi Vinod,
> > > 
> > > If you are using the 8998's DT present on upstream, you may also
> > > need to
> > > enable
> > > device reset on your platform. (We usually do a device reset before
> > > call
> > > ufshcd_hba_enable())
> > > Given that 845 works fine, it may be the difference you have with
> > > 845. 845
> > > has device
> > > reset support ready in upstream code, you can check sdm845-mtp.dts.
> > > It is same for 8150, which is a lack of device reset support in
> > > upstream
> > > code base.
> > 
> > I am using 8150mtp and you can see the DTS at [1]
> > with this patch I get phy timeout error
> > 
> > [    2.532594] qcom-qmp-phy 1d87000.phy: phy initialization timed-out
> > 
> > If i revert this patch the Timeout goes away. UFS node for this platform
> > is enabled in [2] and [3]
> > 
> > I did add the GPIO as well for testing but that doesnt work, only thing
> > that makes it work is rename the reset line to something other that
> > 'rst'
> > 
> > I found that with this patch the reset is invoked twice, not sure why!
> > 
> > The 845 does not define a reset 'rst' but both 8150 and 8998 define
> > that!
> > 
> > [1]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next
> > [2]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3834a2e92229ef26d30de28acb698b2b23d3e397
> > [3]:
> > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3e5bf28d2c3981f949e848eec8a60e0b9b61189d
> > > 
> > > To enable UFS device reset, please see
> > > 1. https://lore.kernel.org/linux-arm-msm/20190828191756.24312-4-bjorn.andersson@linaro.org/
> > > 2. 53a5372ce326116f3e3d3f1d701113b2542509f4
> > 
> > Yes both are added for UFS and I am testing with these..
> > > 
> > > FYI, I tested the patch on 8250 and its family platforms. In my
> > > build, I
> > > ported
> > > change in #2 to my code base (in your case, make change to
> > > drivers/pinctrl/qcom/pinctrl-msm8998.c) and enable the GPIO in DT like
> > > sdm845-mtp.dts
> > 
> > Please see drivers/pinctrl/qcom/pinctrl-sm8150.c upstream
> > 
> > >         reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> > 
> > Yup, added:
> > 
> >         reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> 
> Hi Vinod,
> 
> What do you mean by the reset is invoked twice?
> 
> Renaming 'rst' to something else equals disabling this patch.
> 
> You said 845 has not this problem, I thought you tested the patch on 845
> with
> the same 'rst' defined on 8998 and 8150. If 'rst' is not present in 845's
> DT,
> it means this patch has no impact on 845.

To clarify: This problem is not seen in 845 with upstream kernel ie
5.5-rc1 but regression is observed in sm8150 and 8998 (Jeff)

And if I add the reset line to 845 (i am testing on dragon board
RB3, I am seeing same issue here as well)
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1374,6 +1374,8 @@
                        lanes-per-direction = <2>;
                        power-domains = <&gcc UFS_PHY_GDSC>;
                        #reset-cells = <1>;
+                       resets = <&gcc GCC_UFS_PHY_BCR>;
+                       reset-names = "rst";
 
                        iommus = <&apps_smmu 0x100 0xf>;
 

And on boot i am seeing UFS failing:

[    3.205567] qcom-qmp-phy 88eb000.phy: Registered Qcom-QMP phy
[    3.215440] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vdd-hba-supply regulator, assuming enabled
[    3.226315] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vccq-supply regulator, assuming enabled
[    3.236844] ufshcd-qcom 1d84000.ufshc: ufshcd_populate_vreg: Unable to find vccq2-supply regulator, assuming enabled
[    3.257053] scsi host0: ufshcd
[    3.275109] qcom-qmp-phy 1d87000.phy: phy initialization timed-out
[    3.283677] qcom_rpmh TCS Busy, retrying RPMH message send: addr=0x40904
[    3.290508] phy phy-1d87000.phy.0: phy poweron failed --> -110
[    3.296407] ufshcd-qcom 1d84000.ufshc: ufs_qcom_power_up_sequence: phy power on failed, ret = -110
[    3.360851] ufshcd-qcom 1d84000.ufshc: Controller enable failed
[    3.366838] ufshcd-qcom 1d84000.ufshc: Host controller enable failed

> Actually, in our code base, we are not using phy-qcom-qmp.c. Instead,
> we are using phy-qcom-ufs.c. phy-qcom-ufs.c is the one we use in all of our
> mobile projects. Although both have the same functionality,
> but in phy-qcom-ufs.c, the PCS ready bit polling timeout is 1000000us,
> while in phy-qcom-qmp.c the PCS ready bit polling timeout is 1000us.
> Would you mind give below change a try?

Sure and this seems to do the trick on 845 with resets defined, Jeff can
you try this on your laptop

But I dont get same result on sm8150-mtp, i am still seeing timeout with
1000000us.

The bigger question is why is the reset causing the timeout to be
increased for sdm845 and not to work in case of sm8150!

> FYI, I tried the opposite change on my board (decrease the PCS polling
> timeout
> used in phy-qcom-ufs.c), I did see PCS polling timeout, which is the same
> failure
> you encountered.
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c
> b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index 39e8deb..0ee9149 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -66,7 +66,7 @@
>  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
>  #define CLAMP_EN                               BIT(0) /* enables i/o
> clamp_n */
> 
> -#define PHY_INIT_COMPLETE_TIMEOUT              1000
> +#define PHY_INIT_COMPLETE_TIMEOUT              1000000
>  #define POWER_DOWN_DELAY_US_MIN                        10
>  #define POWER_DOWN_DELAY_US_MAX                        11
> 
> On 845, if there is 'rst'
> 
> Thanks.

-- 
~Vinod
