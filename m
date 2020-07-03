Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15FE6213CD3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 17:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726447AbgGCPia (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 11:38:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:42100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726147AbgGCPia (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 11:38:30 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D794421927;
        Fri,  3 Jul 2020 15:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593790709;
        bh=EaZyRGMJ3DZGnCZucHhtrQQ2FHW+M2zRfFOKdqaQ88Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=snFx2Z60KTiip9uWRHw81DrSwKdtITBeMj0S7UBYCn7duUGPMMevfo6FRnHEaSEaJ
         z8EYaMQgdT7ISklcQDM7jy8dgai4MALaQhWlxe4mgs1kX2bKwQuxoSn1TYjaKtYuUy
         02dgEQmdo241zSeWdyXwXIRJOCRXfhw/TFhz7QQ8=
Date:   Fri, 3 Jul 2020 16:38:24 +0100
From:   Will Deacon <will@kernel.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Przywara <andre.przywara@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH 3/3] arm64: Add KRYO4XX silver CPU cores to erratum list
 1530923 and 1024718
Message-ID: <20200703153824.GA19327@willie-the-truck>
References: <7335e7fa1303a56a5e60339ed0c5d619@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7335e7fa1303a56a5e60339ed0c5d619@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 03, 2020 at 08:04:04PM +0530, Sai Prakash Ranjan wrote:
> On 2020-07-03 19:25, Will Deacon wrote:
> > On Tue, Jun 30, 2020 at 11:30:55PM +0530, Sai Prakash Ranjan wrote:
> > > KRYO4XX silver/LITTLE CPU cores with revision r1p0 are affected by
> > > erratum 1530923 and 1024718, so add them to the respective list.
> > > The variant and revision bits are implementation defined and are
> > > different from the their Cortex CPU counterparts on which they are
> > > based on, i.e., r1p0 is equivalent to rdpe.
> > 
> > So just to confirm, revisions prior to rdpe are unaffected, or do those
> > parts simply not exist?
> > 
> 
> There is one revision prior to this r0p1(r7pc) which has a different part
> number and are used in v1 of SoCs which are limited to only internal test
> platforms in the early stages of bringup and not used in actual devices out
> there, so I did not add it to the list but they are affected. Plus we would
> need to add another MIDR_QCOM_KRYO_4XX_SILVER_V1 if we are supporting them
> which I thought was not worth it when devices with those CPUs are not
> available.

Thanks, just wanted to make sure. Sounds like we can safely assume those
parts don't exist.

Will
