Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B932D2B92CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 13:50:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727086AbgKSMtd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 07:49:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:58370 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726495AbgKSMtd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 07:49:33 -0500
Received: from localhost (unknown [122.171.203.152])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2E4C320771;
        Thu, 19 Nov 2020 12:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605790172;
        bh=hXFi6CtGZSxav0zmnu3jho3+3VLGyLXbm+gUoORgMYs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=piuMob8R+MUetHZpMVcp+2exAl54jS0RoB2ZnmJVkAVU1WVsjd+hy0XYt/i4awpUj
         AL1EcByCPZVrmUM3X41zL5fk2za2KLsAaULFnhiGkMjM1SATGYhMqGSM7cbSFOpG1g
         IoQmlJJXU/toaqUlanCT3KEprT1AYRLop6VtDchg=
Date:   Thu, 19 Nov 2020 18:19:26 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Olof Johansson <olof@lixom.net>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, John Stultz <john.stultz@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: Enable QCOM_SCM as builtin
Message-ID: <20201119124926.GA2925@vkoul-mobl>
References: <20201118162528.454729-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118162528.454729-1-bjorn.andersson@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-11-20, 08:25, Bjorn Andersson wrote:
> The Qualcomm SCM driver was never explicitly enabled in the defconfig.
> Instead it was (apparently) selected by DRM_MSM and by the recent change
> to make it tristate now became =m.
> 
> Unfortunately this removes the ability for PINCTRL_MSM and ARM_SMMU to
> be =y and with deferred_probe_timeout defaulting to 0 this means that
> things such as UART, USB, PCIe and SDHCI probes with their dependencies
> ignored.
> 
> The lack of pinctrl results in invalid pin configuration and the lack of
> iommu results in the system locking up as soon as any form of data
> transfer is attempted from any of the affected peripherals.
> 
> Mark QCOM_SCM as builtin, to avoid this.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
