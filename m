Return-Path: <linux-arm-msm+bounces-59069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 432EDAC1067
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 17:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E28C11BC7E3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 15:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB2D299AAF;
	Thu, 22 May 2025 15:54:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B6C299942;
	Thu, 22 May 2025 15:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747929251; cv=none; b=kFwWUz8TbGa8Vw/uNYk+7XG8z4irRdpaqqihO5o5Lrl4P2g2njVKE8tx5zo8T6WZquF+OpMB7HTMGuScC7/9pBNQQRUsKzs5ISWaxzbsZXWWmF6u8fy4Qxx7LSItwdOOa4xVxRGLR3RSHgScqYXhMN4kZd/HkT8s8FcQ5eCQ5vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747929251; c=relaxed/simple;
	bh=nirOL8Ac4SK3JQENRHKVh1BD1QuVRdEa+pOfJFvPSLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V2Dau7aVoCZF206o4ZQyaNURlRqxycxQkCn/TSwCENYP1p+9EP0P/o0UQVNxflWROuuNGqbm3hOa/ThyKmDYWOjLgTm56PAuFzSnLtzbip/M9MsIIzPYxW1ufBBOcvvl8DrZOuZmPLt7HzdEGhgfJ2dxZUcACi1KWS9LDZuY20E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E61551A2D;
	Thu, 22 May 2025 08:53:53 -0700 (PDT)
Received: from [10.57.47.3] (unknown [10.57.47.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 676C53F5A1;
	Thu, 22 May 2025 08:54:06 -0700 (PDT)
Message-ID: <e92a61a9-0244-4509-ad81-8ef26700dca5@arm.com>
Date: Thu, 22 May 2025 16:54:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615: fix a crash issue caused by
 infinite loop for Coresight
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250522005016.2148-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/05/2025 01:50, Jie Gan wrote:
> An infinite loop has been created by the Coresight devices. When only a
> source device is enabled, the coresight_find_activated_sysfs_sink function
> is recursively invoked in an attempt to locate an active sink device,
> ultimately leading to a stack overflow and system crash. Therefore, disable
> the replicator1 to break the infinite loop and prevent a potential stack
> overflow.
> 
> replicator1_out   ->   funnel_swao_in6   ->   tmc_etf_swao_in   ->  tmc_etf_swao_out
>       |                                                                     |
> replicator1_in                                                     replicator_swao_in
>       |                                                                     |
> replicator0_out1                                                   replicator_swao_out0
>       |                                                                     |
> replicator0_in                                                     funnel_in1_in3
>       |                                                                     |
> tmc_etf_out <- tmc_etf_in <- funnel_merg_out <- funnel_merg_in1 <- funnel_in1_out
> 
> [call trace]
>     dump_backtrace+0x9c/0x128
>     show_stack+0x20/0x38
>     dump_stack_lvl+0x48/0x60
>     dump_stack+0x18/0x28
>     panic+0x340/0x3b0
>     nmi_panic+0x94/0xa0
>     panic_bad_stack+0x114/0x138
>     handle_bad_stack+0x34/0xb8
>     __bad_stack+0x78/0x80
>     coresight_find_activated_sysfs_sink+0x28/0xa0 [coresight]
>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>     ...
>     coresight_find_activated_sysfs_sink+0x5c/0xa0 [coresight]
>     coresight_enable_sysfs+0x80/0x2a0 [coresight]
> 
> side effect after the change:
> Only trace data originating from AOSS can reach the ETF_SWAO and EUD sinks.
> 
> Fixes: bf469630552a ("arm64: dts: qcom: qcs615: Add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

It is not easy to fix this in CoreSight driver. Given this is a platform
specific issue, lets fix this in the DT. I will explore the option of
fixing this in the driver.


Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



