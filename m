Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 260589824B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2019 20:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfHUSEw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 21 Aug 2019 14:04:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:54756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726752AbfHUSEw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 21 Aug 2019 14:04:52 -0400
Received: from localhost (unknown [106.51.111.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 85B782082F;
        Wed, 21 Aug 2019 18:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566410691;
        bh=12d5mAia6Nci/1nnpscWPRKoHA2zZnwXwYankubmlok=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ztr7e8tcpkQkXjgfl3MT5ui6EGWu0Ocy1I7RW4cVCnI+YfFVDWR5nmZZIsQvfPLw8
         jEgZ52U4K23Uz8I3r2pBsmubMYbmTEd+RkPiruZTKdyW35Hgd2KcTWF/bjHxoYlAaT
         GWS7pMVYDeaBGayF+bPHRJD7OdtY9iqbQMdR9P/M=
Date:   Wed, 21 Aug 2019 23:33:39 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Amit Kucheria <amit.kucheria@verdurent.com>
Cc:     Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 8/8] arm64: dts: qcom: sm8150: Add apps shared nodes
Message-ID: <20190821180339.GK12733@vkoul-mobl.Dlink>
References: <20190820172351.24145-1-vkoul@kernel.org>
 <20190820172351.24145-10-vkoul@kernel.org>
 <CAHLCerOKd8Nr9hnKKMZawoUxopcUDfez=xMB34t7s0=2ZpnDVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHLCerOKd8Nr9hnKKMZawoUxopcUDfez=xMB34t7s0=2ZpnDVg@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 21-08-19, 14:13, Amit Kucheria wrote:
> On Tue, Aug 20, 2019 at 10:55 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > Add hwlock, pmu, smem, tcsr_mutex_regs, apss_shared mailbox, apps_rsc
> > including the rpmhcc child nodes to the SM8150 DTSI
> > +
> >                 spmi_bus: spmi@c440000 {
> 
> Sort by address here.

Yes will fix, thanks for spotting!

-- 
~Vinod
