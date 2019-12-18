Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFDE123E49
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2019 05:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbfLREMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 23:12:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:48974 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726454AbfLREMG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 23:12:06 -0500
Received: from localhost (unknown [106.51.106.0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C4812206EE;
        Wed, 18 Dec 2019 04:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576642324;
        bh=ZAbF2S9rwhQ5Np9UIx7sP+iPWCIl9l61NUz0CIKnVHI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y5PInxWYOG2Jj3uTvebbGJxeyCLoCi0XgpHGUvbshl6aIuXKTTvZDgzXd8AOcakIC
         NEGIc1JBjYtr6CJJsod3f2IJFWaClrrQoMeaTFt00m4/NRhCRyfyeh+MWMv7YpsnLJ
         I3JPsdTwz2q18iIkxNREgsVlAWYFhyzGywURMhSM=
Date:   Wed, 18 Dec 2019 09:42:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     cang@codeaurora.org
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
Subject: Re: [PATCH v5 2/7] scsi: ufs-qcom: Add reset control support for
 host controller
Message-ID: <20191218041200.GP2536@vkoul-mobl>
References: <20191216190415.GL2536@vkoul-mobl>
 <CAOCk7NpAp+DHBp-owyKGgJFLRajfSQR6ff1XMmAj6A4nM3VnMQ@mail.gmail.com>
 <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
 <20191217041342.GM2536@vkoul-mobl>
 <763d7b30593b31646f3c198c2be99671@codeaurora.org>
 <20191217092433.GN2536@vkoul-mobl>
 <fc8952a0eee5c010fe14e5f107d89e64@codeaurora.org>
 <20191217150852.GO2536@vkoul-mobl>
 <CAOCk7Np691Hau1FdJqWs1UY6jvEvYfzA6NnG9U--ZcRsuV5=Zw@mail.gmail.com>
 <75f7065d08f450c6cbb2b2662658ecaa@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <75f7065d08f450c6cbb2b2662658ecaa@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-12-19, 02:44, cang@codeaurora.org wrote:
 
> Hi Vinod and Jeffrey,
> 
> Let me summary here, now the 1000000us timeout works for both 845 and 8998.
> However, 8150 still fails.
> 
> > > The bigger question is why is the reset causing the timeout to be
> > > increased for sdm845 and not to work in case of sm8150! (Vinod)
> 
> I would not say this patch increases the timeout. With this patch,
> the PCS polling timeout, per my profiling, the PCS ready usually needs
> less than 5000us, which is the actual time needed for PCS bit to be ready.
> 
> The reason why 1000us worked for you is because, w/o the patch, UFS PHY
> registers are retained from pre-kernel stage (bootloader i.e.), the PCS
> ready
> bit was set to 1 in pre-kernel stage, so when kernel driver reads it, it
> returns
> 1, not even to be polled at all. It may seem "faster", but not the right
> thing to do, because kernel stage may need different PHY settings than
> pre-kernel stage, keeping the settings configured in pre-kernel stage is not
> always right, so this patch is needed. And increasing 1000us to 1000000us
> is the right thing to do, but not a hack.
> 
> As reg for the phy initialization timeout on 8150, I found there is
> something
> wrong with its settings in /drivers/phy/qualcomm/phy-qcom-qmp.c
> 
> static const struct qmp_phy_init_tbl sm8150_ufsphy_serdes_tbl[] = {
> 	QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01),
> 	QMP_PHY_INIT_CFG(QSERDES_V4_COM_SYSCLK_EN_SEL, 0xd9),
> 
> "QMP_PHY_INIT_CFG(QPHY_POWER_DOWN_CONTROL, 0x01)" should NOT appear in the
> serdes
> table! I haven't check who made this change, but please have a try after
> remove
> this line from sm8150_ufsphy_serdes_tbl.

That is me :) Looks like I made an error while porting from downstream. I
did a quick check to remove this and it doesn't work yet, let me recheck
the settings again ...

Thanks for your help!

-- 
~Vinod
