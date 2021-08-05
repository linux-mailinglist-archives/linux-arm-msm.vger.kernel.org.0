Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A9B3E0DC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Aug 2021 07:32:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbhHEFcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Aug 2021 01:32:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:33560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230215AbhHEFca (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Aug 2021 01:32:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C6136052B;
        Thu,  5 Aug 2021 05:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628141536;
        bh=0d9ITY3n+IR/ztRu8jyGPFi1M/I8a79YswEq0M+6ozE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lvgcPpECNEm3cekkiiSK3r/K5B8HZPNtdiaPrkFYTX+Qbzoy1DTk84HLfuzZNsxOC
         CCm6qNEsx09RhqQ1HGUS2CF2paSTAcNUpdjFuVcqaPznfqibSQ7cmcLZbpERRhZECt
         7XxlNU2w1WiiHB2M3gDitKCDlCBbHniOwBB5DKmDtrOnorIYeekYCmDw/tl0/Sm3hx
         CcSsduOM0MKRQgw0+E7jjnKAfR+O3aHQAmDrWxGtSz5kn4ZOPakvhrxuYXtulCdqWq
         kLgrEf4Py9ZxxYYQvMqj0xxNhojgOgbtpjP4aJmowByU+ZhFk2SURSif8o3bHcrnm4
         4nvO4gGHlDG7w==
Date:   Thu, 5 Aug 2021 11:02:11 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, konrad.dybcio@somainline.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm MSM8996 CPU clock
 driver
Message-ID: <YQt327OiY9QJ6Wjn@matsya>
References: <20210804193042.1155398-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210804193042.1155398-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-08-21, 12:30, Bjorn Andersson wrote:
> The MSM8996 supports CPU frequency scaling, so enable the clock driver
> for this.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
