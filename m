Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0571212726D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 01:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727063AbfLTAbA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Dec 2019 19:31:00 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:35431 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726963AbfLTAbA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Dec 2019 19:31:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1576801859; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=NYkaSg/yIOVM8Zt4nI2tIa2sDjh7Ya1C7IesYRlw4WY=;
 b=HiOEloIv88y1z5burFoKHlWm5PLyyoH3wlUHHcoSescuNc0yA9J8bmCOoTQBcac5io7fN4pL
 S3HpFdst88sRdVf1bXFyzcJzh/Ybt7MgpvGwnMSOxpOHdRQ01vW5o0p8u+gS3dp2+aHtmMj+
 HgVRCG7rjFjQ+J6BlIqPIH7+afk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5dfc1642.7f782f9a17a0-smtp-out-n02;
 Fri, 20 Dec 2019 00:30:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8463CC447A6; Fri, 20 Dec 2019 00:30:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: cang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68F59C4479F;
        Fri, 20 Dec 2019 00:30:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 20 Dec 2019 08:30:57 +0800
From:   cang@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, asutoshd@codeaurora.org,
        nguyenb@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>,
        linux-scsi@vger.kernel.org, kernel-team@android.com,
        saravanak@google.com, Mark Salyzyn <salyzyn@google.com>,
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
In-Reply-To: <20191219145206.GW2536@vkoul-mobl>
References: <763d7b30593b31646f3c198c2be99671@codeaurora.org>
 <20191217092433.GN2536@vkoul-mobl>
 <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
 <20191217150852.GO2536@vkoul-mobl>
 <CAOCk7Np691Hau1FdJqWs1UY6jvEvYfzA6NnG9U--ZcRsuV5=Zw@mail.gmail.com>
 <75f7065d08f450c6cbb2b2662658ecaa@codeaurora.org>
 <20191218041200.GP2536@vkoul-mobl>
 <983c21bb5ad2d38e11c074528d8898b9@codeaurora.org>
 <20191219142145.GV2536@vkoul-mobl>
 <CAOCk7NrKRXsTffNyQFt_tQmdNq7+SaH+kAJVk8AAPJWJjPxYYw@mail.gmail.com>
 <20191219145206.GW2536@vkoul-mobl>
Message-ID: <3dcdc4f7f090e1f1dd45d499bef0a4d1@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-12-19 22:52, Vinod Koul wrote:
> On 19-12-19, 07:25, Jeffrey Hugo wrote:
>> On Thu, Dec 19, 2019 at 7:21 AM Vinod Koul <vkoul@kernel.org> wrote:
>> >
>> > On 19-12-19, 15:12, cang@codeaurora.org wrote:
>> > > On 2019-12-18 12:12, Vinod Koul wrote:
>> > > > On 18-12-19, 02:44, cang@codeaurora.org wrote:
>> >
>> > >
>> > > Aside of the phy settings, your DT needs some modifications too,
>> > > seems you copied most of them from sdm845.
>> > > https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=3834a2e92229ef26d30de28acb698b2b23d3e397
>> > >
>> > > <--snip-->
>> > > > +           ufs_mem_phy: phy@1d87000 {
>> > > > +                   compatible = "qcom,sm8150-qmp-ufs-phy";
>> > > > +                   reg = <0 0x01d87000 0 0x18c>;
>> > >
>> > > The size 0x18c is wrong, in the code you are even accessing registers
>> > > whose offsets are beyond 0x18c, see
>> > >
>> > > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE0     0x1ac
>> > > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE0     0x1b0
>> > > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE1_MODE1     0x1b4
>> > > #define QSERDES_V4_COM_BIN_VCOCAL_HSCLK_SEL           0x1bc
>> > > #define QSERDES_V4_COM_BIN_VCOCAL_CMP_CODE2_MODE1     0x1b8
>> > >
>> > > FYI, the total size of serdes registers is 0x1c0.
>> >
>> > Yeah I will update it to 0x1c0
>> >
>> > >
>> > > <--snip-->
>> > > > +                   ufs_mem_phy_lanes: lanes@1d87400 {
>> > > > +                           reg = <0 0x01d87400 0 0x108>,
>> > > > +                                 <0 0x01d87600 0 0x1e0>,
>> > > > +                                 <0 0x01d87c00 0 0x1dc>,
>> > >
>> > > Same as above, see
>> > >
>> > > #define QPHY_V4_MULTI_LANE_CTRL1                      0x1e0
>> > >
>> > > FYI, the total size of PCS registers is 0x200
>> > >
>> > > > +                                 <0 0x01d87800 0 0x108>,
>> > > > +                                 <0 0x01d87a00 0 0x1e0>;
>> > > > +                           #phy-cells = <0>;
>> > > > +                   };
>> > > <--snip-->
>> >
>> > So I managed to fix it by configuring QPHY_SW_RESET in
>> > qcom_qmp_phy_com_init() before invoking the configuration. That makes it
>> > work for me. Will send patches shortly
>> 
>> So, you are going to send some fixes to make sm8150 work.  We also
>> need the extended timeout for all platforms, yes?  Who is going to
>> send up the patch for the timeout?  All of this should be -rc material
>> since Can's change caused these issues to appear, and thus impact
>> users, no?
> 
> yeah I have tested a timeout of 10ms and seems to look good for me on
> sm8150 and sdm845. I will be sending the patches in few minutes :) and
> yes the timeout should be marked to 5.5 fixes
> 
> Thanks

Hi Vinod,

Good to know it works for you. Vivek Gautam, who is the author QCOM UFS 
PHY
driver, has left QCOM. Please add Asutosh Das(asutoshd@codeaurora.org),
Bao D. Nguyen(nguyenb@codeaurora.org) and me for QCOM UFS PHY changes.

Actually, without this change, your PHY is not even re-initialized at 
all
during kernel bootup, it just retains whatever it was configured in 
UEFI,
yet you are still saying this is a regression. The extended timeout is 
what
UFS PHY has to take for a full initialization.

Regards,
Can Guo.
