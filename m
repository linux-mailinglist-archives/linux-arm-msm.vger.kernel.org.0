Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A506D76AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2019 14:40:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbfJOMkN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Oct 2019 08:40:13 -0400
Received: from 8bytes.org ([81.169.241.247]:47562 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728158AbfJOMkN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Oct 2019 08:40:13 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id DB4B72DF; Tue, 15 Oct 2019 14:40:11 +0200 (CEST)
Date:   Tue, 15 Oct 2019 14:40:08 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org, marijns95@gmail.com,
        Andy Gross <agross@kernel.org>, Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v4 1/7] firmware: qcom: scm: Add function to set IOMMU
 pagetable addressing
Message-ID: <20191015124008.GB17570@8bytes.org>
References: <20191001220205.6423-1-kholk11@gmail.com>
 <20191001220205.6423-2-kholk11@gmail.com>
 <20191015111454.GG14518@8bytes.org>
 <CAK7fi1YZXW=mqC5HWtfBWsioAq-duejAk6RgtD8npKZR=af38w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7fi1YZXW=mqC5HWtfBWsioAq-duejAk6RgtD8npKZR=af38w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 15, 2019 at 02:33:47PM +0200, AngeloGioacchino Del Regno wrote:
> Il giorno mar 15 ott 2019 alle ore 13:14 Joerg Roedel
> <joro@8bytes.org> ha scritto:
> >
> > On Wed, Oct 02, 2019 at 12:01:59AM +0200, kholk11@gmail.com wrote:
> > > From: "Angelo G. Del Regno" <kholk11@gmail.com>
> > >
> > > Add a function to change the IOMMU pagetable addressing to
> > > AArch32 LPAE or AArch64. If doing that, then this must be
> > > done for each IOMMU context (not necessarily at the same time).
> >
> > This patch lacks a Signed-off-by.
> >
> 
> I'm sorry for that. Should I resend or is it enough for me to write it here?
> 
> Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>

Please resend, but you are free to wait for the reviews/acks from Rob
Clark, which I'd like to see on the series.

Regards,

	Joerg
