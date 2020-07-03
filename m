Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C341213B67
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 15:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbgGCNzV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 09:55:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:41266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbgGCNzV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 09:55:21 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D200520870;
        Fri,  3 Jul 2020 13:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593784520;
        bh=LYtBYFacL8R1TAxLJFOEGnnwPZ8/WoXG9dG09CLghYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gllGRRNtRU9MPHwaDbChZNnom+nyiuZybvO0sRjPBJ8VOX+4314xKVwNXcuD7A05e
         Y1TmYcYC6kKWBX8xqMAOtV1zO7lCcImpb5/IlgeWscAEEi+Cx50zbutV+QliLgifGQ
         17ITLWRaGjh5Wvm2HimXgNx9WUoqmUkDfXY6VRKw=
Date:   Fri, 3 Jul 2020 14:55:15 +0100
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
Message-ID: <20200703135515.GA19230@willie-the-truck>
References: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
 <7013e8a3f857ca7e82863cc9e34a614293d7f80c.1593539394.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7013e8a3f857ca7e82863cc9e34a614293d7f80c.1593539394.git.saiprakash.ranjan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 30, 2020 at 11:30:55PM +0530, Sai Prakash Ranjan wrote:
> KRYO4XX silver/LITTLE CPU cores with revision r1p0 are affected by
> erratum 1530923 and 1024718, so add them to the respective list.
> The variant and revision bits are implementation defined and are
> different from the their Cortex CPU counterparts on which they are
> based on, i.e., r1p0 is equivalent to rdpe.

So just to confirm, revisions prior to rdpe are unaffected, or do those
parts simply not exist?

Cheers,

Will
