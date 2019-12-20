Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144AA1281C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2019 19:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfLTSBk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Dec 2019 13:01:40 -0500
Received: from foss.arm.com ([217.140.110.172]:53822 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727438AbfLTSBk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Dec 2019 13:01:40 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 124921FB;
        Fri, 20 Dec 2019 10:01:40 -0800 (PST)
Received: from arrakis.emea.arm.com (arrakis.cambridge.arm.com [10.1.197.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 620DA3F67D;
        Fri, 20 Dec 2019 10:01:39 -0800 (PST)
Date:   Fri, 20 Dec 2019 18:01:37 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     will@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] arm64: Add qcom Kconfig fragment
Message-ID: <20191220180137.GF16428@arrakis.emea.arm.com>
References: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1576850160-1564-1-git-send-email-loic.poulain@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Dec 20, 2019 at 02:56:00PM +0100, Loic Poulain wrote:
> Add qcom Kconfig fragment which enables the appropriate symbols for
> support of Qualcomm based boards, like the 'popular' dragonboards.
> This permits to fully support the boards upstream without having to
> rely on downstream deconfig changes.
> 
> This patch has been tested with Dragonboard-410c and Dragonboard-820c.
> 
> qcom.config fragment has been generated with ./script/diffconfig
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Please add these to defconfig (and make sure they don't break the single
kernel image).

NAK for this patch.

-- 
Catalin
