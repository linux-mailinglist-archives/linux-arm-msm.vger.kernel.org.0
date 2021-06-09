Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B56DE3A1ADD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 18:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233406AbhFIQ2c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 12:28:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:58466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233160AbhFIQ2b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 12:28:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D6C461246;
        Wed,  9 Jun 2021 16:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623255997;
        bh=O6HW8I+joRCcMZI1bSIrpaEOalI+6d5uh3dG6p6sTUQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NQIpMaWEwYsz/aYkCkBw5ANl5HkArWNkfJjLP4PNCFmWkGdlqStntcPDc4oJ4pZQU
         1ZLoHpiH87YbJ76lTw1BubJ+kSrzbb4UmxLesTX7MnFUdaC+iEtF2pnTY6IM2/iRmz
         Hrzpvf8eS5WhYVSRAtxG3xwH4cB8GjCp2kcAExEZUbjYd/to0mSaqLEVUTb1JSu1UC
         6I/Zjkbdg3UguSsr+rYNgJKBUvjwr3oTBmAT2y3knHG1DDHsPvJ0ndYmXOKF/MG3Ww
         uz/PH/nWhBeTDbXbViKUVZvLLS6OcQ2XONzIJmPxio7HmGAVUMGvraWypNgW3XapRY
         eKVZ171cLMCjg==
From:   Will Deacon <will@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     catalin.marinas@arm.com, kernel-team@android.com,
        Will Deacon <will@kernel.org>,
        Hanjun Guo <guohanjun@huawei.com>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sudeep Holla <sudeep.holla@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Protect acpi_match_platform_list() call with CONFIG_ACPI
Date:   Wed,  9 Jun 2021 17:26:31 +0100
Message-Id: <162323595056.1544220.15839418112955891074.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210609015511.3955-1-shawn.guo@linaro.org>
References: <20210609015511.3955-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 9 Jun 2021 09:55:11 +0800, Shawn Guo wrote:
> The struct acpi_platform_list and function acpi_match_platform_list()
> defined in include/linux/acpi.h are available only when CONFIG_ACPI is
> enabled.  Add protection to fix the build issues with !CONFIG_ACPI.

Applied to will (for-joerg/arm-smmu/updates), thanks!

[1/1] iommu/arm-smmu-qcom: Protect acpi_match_platform_list() call with CONFIG_ACPI
      https://git.kernel.org/will/c/22c2d7189155

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
