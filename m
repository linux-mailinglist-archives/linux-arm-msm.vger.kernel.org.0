Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C780A2C5CB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 20:50:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729702AbgKZTuG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 14:50:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:38216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727742AbgKZTuG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 14:50:06 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606420206;
        bh=Uqf9BuKRk/dOTbpKSfELiBTUWgVWZhuSZolpm0VCqjI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=J/Ec/MA72xruWl+W1WK8I9e1YuNeMrUMEDN8cveskKlzrG3nXJzFcwrZbYfVv8t8b
         PZz2GO5wDGO4JfyL4dY55qiHvK1hzyo3BIldMCT6thCurgDB6ttgkX3wqIff9u2CvQ
         9CFNJTVmver14wvXKbXJzPm6FLVvh7nj7u3Wbfq8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] arm64: dts: fixes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160642020611.4652.12882405129721397036.git-patchwork-notify@kernel.org>
Date:   Thu, 26 Nov 2020 19:50:06 +0000
References: <20201126015457.6557-1-elder@linaro.org>
In-Reply-To: <20201126015457.6557-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 25 Nov 2020 19:54:54 -0600 you wrote:
> The first patch in this series changes the IOMMU specification for
> the IPA node in "sc7180.dtsi" to identify two streams distinctly,
> rather than specifying them with a mask.  This was inspired by
> something Bjorn did recently for IPA in "sdm845.dtsi".
> 
> The second and third just replace 0 with GIC_SPI in two IPA
> interrupt specifications.
> 
> [...]

Here is the summary with links:
  - [1/3] arm64: dts: qcom: sc7180: limit IPA iommu streams
    https://git.kernel.org/qcom/c/8f34831d3659
  - [2/3] arm64: dts: qcom: sc7180: use GIC_SPI for IPA interrupts
    https://git.kernel.org/qcom/c/cfee3ea05cf2
  - [3/3] arm64: dts: qcom: sdm845: use GIC_SPI for IPA interrupts
    https://git.kernel.org/qcom/c/0fc0f4b6aded

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


