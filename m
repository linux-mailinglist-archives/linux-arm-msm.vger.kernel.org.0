Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D8B5122860
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 11:09:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbfLQKJ4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 05:09:56 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:64160 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726824AbfLQKJ4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 05:09:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576577395; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=7Y+z/2hCe+eL535u7J9jGr581hvy3D7TLhGjhBGsAnw=;
 b=TRdi7k64UtfN7O+39t+I4vftzpmdF6nMmF9IR//mE9U/aPTP5WWTsM15k0PL5DQtUWMwn+4l
 T8jW4wJ5HahNKMet272PLWxhR3rmfCDcXTRfiSd8Kc12B+YGKjCCrVSKuRd8H2g4RMhxqoK6
 a0F2ha97824tbu741bRyaW5VR9Y=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df8a971.7fe30a22eea0-smtp-out-n03;
 Tue, 17 Dec 2019 10:09:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3505CC447A2; Tue, 17 Dec 2019 10:09:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EAE1BC433CB;
        Tue, 17 Dec 2019 10:09:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 17 Dec 2019 18:09:49 +0800
From:   cang@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
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
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for host
 controller
In-Reply-To: <20191217092433.GN2536@vkoul-mobl>
References: <1573798172-20534-1-git-send-email-cang@codeaurora.org>
 <1573798172-20534-3-git-send-email-cang@codeaurora.org>
 <20191216190415.GL2536@vkoul-mobl>
 <CAOCk7NpAp+DHBp-owyKGgJFLRajfSQR6ff1XMmAj6A4nM3VnMQ@mail.gmail.com>
 <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
 <20191217041342.GM2536@vkoul-mobl>
 <763d7b30593b31646f3c198c2be99671@codeaurora.org>
 <20191217092433.GN2536@vkoul-mobl>
Message-ID: <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-17 17:24, Vinod Koul wrote:
> Hi Can,
> 
> On 17-12-19, 15:10, cang@codeaurora.org wrote:
>> On 2019-12-17 12:13, Vinod Koul wrote:
>> > Hi Can,
>> >
>> > On 17-12-19, 08:37, cang@codeaurora.org wrote:
>> > > On 2019-12-17 03:12, Jeffrey Hugo wrote:
>> > > > On Mon, Dec 16, 2019 at 12:05 PM Vinod Koul <vkoul@kernel.org> wrote:
>> > > > >
>> > > > > Hi Can,
>> > > > >
>> > > > > On 14-11-19, 22:09, Can Guo wrote:
>> > > > > > Add reset control for host controller so that host controller can be reset
>> > > > > > as required in its power up sequence.
>> > > > >
>> > > > > I am seeing a regression on UFS on SM8150-mtp with this patch. I think
>> > > > > Jeff is seeing same one lenove laptop on 8998.
>> > > >
>> > > > Confirmed.
>> > > >
>> > > > >
>> > > > > 845 does not seem to have this issue and only thing I can see is
>> > > > > that on
>> > > > > sm8150 and 8998 we define reset as:
>> > > > >
>> > > > >                         resets = <&gcc GCC_UFS_BCR>;
>> > > > >                         reset-names = "rst";
>> > > > >
>> > >
>> > > Hi Jeffrey and Vinod,
>> > >
>> > > Thanks for reporting this. May I know what kind of regression do you
>> > > see on
>> > > 8150 and 8998?
>> > > BTW, do you have reset control for UFS PHY in your DT?
>> > > See 71278b058a9f8752e51030e363b7a7306938f64e.
>> > >
>> > > FYI, we use reset control on all of our platforms and it is
>> > > a must during our power up sequence.
>> >
>> > Yes we do have this and additionally both the DTS describe a 'rst' reset
>> > and this patch tries to use this.
>> >
>> > Can you please tell me which platform this was tested on how the reset
>> > was described in DT
>> >
>> > Thanks
>> 
>> Hi Vinod,
>> 
>> If you are using the 8998's DT present on upstream, you may also need 
>> to
>> enable
>> device reset on your platform. (We usually do a device reset before 
>> call
>> ufshcd_hba_enable())
>> Given that 845 works fine, it may be the difference you have with 845. 
>> 845
>> has device
>> reset support ready in upstream code, you can check sdm845-mtp.dts.
>> It is same for 8150, which is a lack of device reset support in 
>> upstream
>> code base.
> 
> I am using 8150mtp and you can see the DTS at [1]
> with this patch I get phy timeout error
> 
> [    2.532594] qcom-qmp-phy 1d87000.phy: phy initialization timed-out
> 
> If i revert this patch the Timeout goes away. UFS node for this 
> platform
> is enabled in [2] and [3]
> 
> I did add the GPIO as well for testing but that doesnt work, only thing
> that makes it work is rename the reset line to something other that 
> 'rst'
> 
> I found that with this patch the reset is invoked twice, not sure why!
> 
> The 845 does not define a reset 'rst' but both 8150 and 8998 define
> that!
> 
> [1]:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next
> [2]:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3834a2e92229ef26d30de28acb698b2b23d3e397
> [3]:
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3e5bf28d2c3981f949e848eec8a60e0b9b61189d
>> 
>> To enable UFS device reset, please see
>> 1. 
>> https://lore.kernel.org/linux-arm-msm/20190828191756.24312-4-bjorn.andersson@linaro.org/
>> 2. 53a5372ce326116f3e3d3f1d701113b2542509f4
> 
> Yes both are added for UFS and I am testing with these..
>> 
>> FYI, I tested the patch on 8250 and its family platforms. In my build, 
>> I
>> ported
>> change in #2 to my code base (in your case, make change to
>> drivers/pinctrl/qcom/pinctrl-msm8998.c) and enable the GPIO in DT like
>> sdm845-mtp.dts
> 
> Please see drivers/pinctrl/qcom/pinctrl-sm8150.c upstream
> 
>>         reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
> 
> Yup, added:
> 
>         reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;

Hi Vinod,

What do you mean by the reset is invoked twice?

Renaming 'rst' to something else equals disabling this patch.

You said 845 has not this problem, I thought you tested the patch on 845 
with
the same 'rst' defined on 8998 and 8150. If 'rst' is not present in 
845's DT,
it means this patch has no impact on 845.

Actually, in our code base, we are not using phy-qcom-qmp.c. Instead,
we are using phy-qcom-ufs.c. phy-qcom-ufs.c is the one we use in all of 
our
mobile projects. Although both have the same functionality,
but in phy-qcom-ufs.c, the PCS ready bit polling timeout is 1000000us,
while in phy-qcom-qmp.c the PCS ready bit polling timeout is 1000us.
Would you mind give below change a try?

FYI, I tried the opposite change on my board (decrease the PCS polling 
timeout
used in phy-qcom-ufs.c), I did see PCS polling timeout, which is the 
same failure
you encountered.

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c 
b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 39e8deb..0ee9149 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -66,7 +66,7 @@
  /* QPHY_V3_PCS_MISC_CLAMP_ENABLE register bits */
  #define CLAMP_EN                               BIT(0) /* enables i/o 
clamp_n */

-#define PHY_INIT_COMPLETE_TIMEOUT              1000
+#define PHY_INIT_COMPLETE_TIMEOUT              1000000
  #define POWER_DOWN_DELAY_US_MIN                        10
  #define POWER_DOWN_DELAY_US_MAX                        11

On 845, if there is 'rst'

Thanks.
