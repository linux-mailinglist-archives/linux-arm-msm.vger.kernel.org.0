Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09FEE1222ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 05:17:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727441AbfLQENt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 23:13:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:35914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbfLQENt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 23:13:49 -0500
Received: from localhost (unknown [171.61.91.91])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 95A23206E6;
        Tue, 17 Dec 2019 04:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576556028;
        bh=TQMMeBBZrVKYEy0YvA+gnlD3IzbyNHER3EDmj07O190=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xJmHkIQcN4IiGutvhNuTe5LhQqWgs03XXk8b1vSQECWNfA31QEDiw7XQ2/6Omsx+L
         N3Ne/OmncLMpEHBBhuRJ82BZkKTT5/xa3O8cO6H5Fl9aYEjvFfC4ZmAy6ZhgmY/V+A
         Uurc8yJvr+4ET0UVLz/jET1qyN23Kv7XeGPf4dz0=
Date:   Tue, 17 Dec 2019 09:43:42 +0530
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
Message-ID: <20191217041342.GM2536@vkoul-mobl>
References: <1573798172-20534-1-git-send-email-cang@codeaurora.org>
 <1573798172-20534-3-git-send-email-cang@codeaurora.org>
 <20191216190415.GL2536@vkoul-mobl>
 <CAOCk7NpAp+DHBp-owyKGgJFLRajfSQR6ff1XMmAj6A4nM3VnMQ@mail.gmail.com>
 <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <091562cbe7d88ca1c30638bc10197074@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Can,

On 17-12-19, 08:37, cang@codeaurora.org wrote:
> On 2019-12-17 03:12, Jeffrey Hugo wrote:
> > On Mon, Dec 16, 2019 at 12:05 PM Vinod Koul <vkoul@kernel.org> wrote:
> > > 
> > > Hi Can,
> > > 
> > > On 14-11-19, 22:09, Can Guo wrote:
> > > > Add reset control for host controller so that host controller can be reset
> > > > as required in its power up sequence.
> > > 
> > > I am seeing a regression on UFS on SM8150-mtp with this patch. I think
> > > Jeff is seeing same one lenove laptop on 8998.
> > 
> > Confirmed.
> > 
> > > 
> > > 845 does not seem to have this issue and only thing I can see is
> > > that on
> > > sm8150 and 8998 we define reset as:
> > > 
> > >                         resets = <&gcc GCC_UFS_BCR>;
> > >                         reset-names = "rst";
> > > 
> 
> Hi Jeffrey and Vinod,
> 
> Thanks for reporting this. May I know what kind of regression do you see on
> 8150 and 8998?
> BTW, do you have reset control for UFS PHY in your DT?
> See 71278b058a9f8752e51030e363b7a7306938f64e.
> 
> FYI, we use reset control on all of our platforms and it is
> a must during our power up sequence.

Yes we do have this and additionally both the DTS describe a 'rst' reset
and this patch tries to use this.

Can you please tell me which platform this was tested on how the reset
was described in DT

Thanks
-- 
~Vinod
