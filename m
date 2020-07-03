Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E96DB213DA3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 18:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726147AbgGCQgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 12:36:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:46420 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726098AbgGCQgC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 12:36:02 -0400
Received: from localhost.localdomain (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73727207FF;
        Fri,  3 Jul 2020 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593794161;
        bh=Zj4p0k6Evf62RoQy5ZALCr3HLy17aEKw/bGOhLnj5JE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=a0UfZU9UbhUIQmoev0bU15pFdle/jQUTHR5f7Z3DnpkKDF2kyl3dSaJZkiJqIHcA/
         oA4q8yMFRpnUBauV7X4CjlfiOrO7pTM+MRiCwpvnDVvsxE5w6YwM9mktGpyTV0SXO2
         PmRylj5fdDGlBreX80cyYU08LcouNCUGkrCBI6Z4=
From:   Will Deacon <will@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     kernel-team@android.com, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org,
        Andre Przywara <andre.przywara@arm.com>,
        linux-arm-msm@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/3] Add Kryo4xx gold and silver cores to applicable errata list
Date:   Fri,  3 Jul 2020 17:35:51 +0100
Message-Id: <159379075677.633846.7965925264336434359.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 30 Jun 2020 23:30:52 +0530, Sai Prakash Ranjan wrote:
> This series adds the Kryo4xx gold/big and silver/LITTLE CPU cores to
> the errata list which are applicable to them based on the revisions
> of the Cortex CPU cores on which they are based on.
> 
> Patch 1 adds the MIDR value for Kryo4xx gold CPU cores.
> Patch 2 adds Kryo4xx gold CPU cores to erratum list 1463225 and 1418040.
> Patch 3 adds Kryo4xx silver CPU cores to erratum list 1530923 and 1024718.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/3] arm64: Add MIDR value for KRYO4XX gold CPU cores
      https://git.kernel.org/arm64/c/dce4f2807f69
[2/3] arm64: Add KRYO4XX gold CPU cores to erratum list 1463225 and 1418040
      https://git.kernel.org/arm64/c/a9e821b89daa
[3/3] arm64: Add KRYO4XX silver CPU cores to erratum list 1530923 and 1024718
      https://git.kernel.org/arm64/c/9b23d95c539e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
