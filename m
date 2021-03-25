Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FCE33494CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 16:00:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbhCYO7k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 10:59:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231225AbhCYO7T (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 10:59:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 639D761A0F;
        Thu, 25 Mar 2021 14:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616684359;
        bh=89AGHW8+EGljajNu3MeDUxKz32WiCO/dlRAg9lyx4E0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fep51D+SIvV5jSZcW9owmJSuzKzyyLLLg2XN/qCGWZ+qHqrK/LUNvSejDMve94DQX
         S2/d68ADk9fkxRsyOA78tbwmCHXVQh0KsnN16vvrYaros1o7/oFo6J9zDgwhO13Pux
         z8U0Ok9Re9RE6swGihXG0JdUaj6Xey11G6DFPD/gOT3vrcLfRwnp6TaaSJ+eyvGZ8+
         nLO2r+LobX5kzawTf6w21AG67oRDcmu3SMMJA/6n/ovJQwRTK2Ha06xj1yl5JeuUSn
         4kp46VoJqmsfkifEUBGVEW8OVXVPQT9yHz7ldBqY0yw1/1XJ6GCIEHsZlCMtUAEE6Y
         1ZXPIkoipMPXQ==
Date:   Thu, 25 Mar 2021 14:59:15 +0000
From:   Will Deacon <will@kernel.org>
To:     Shawn Guo <shawn.guo@linaro.org>, lorenzo.pieralisi@arm.com
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-qcom: create qcom_smmu_impl for ACPI boot
Message-ID: <20210325145914.GC15172@willie-the-truck>
References: <20210301074021.20059-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210301074021.20059-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

[+ Lorenzo]

On Mon, Mar 01, 2021 at 03:40:21PM +0800, Shawn Guo wrote:
> Though qcom_adreno_smmu_impl is not used by ACPI boot right now,
> qcom_smmu_impl is already required at least to boot up Lenovo Flex 5G
> laptop.  Let's check asl_compiler_id in IORT header to ensure we are
> running a QCOM SMMU and create qcom_smmu_impl for it.
> 
> !np is used to check ACPI boot, because fwnode of SMMU device is
> a static allocation and thus has_acpi_companion() doesn't work here.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)

I don't know what a "asl_compiler_id" is, but it doesn't sound like it
has an awful lot to do with the SMMU.

Lorenzo -- any idea what we should be doing here instead? Probably not
using ACPI?

Will
