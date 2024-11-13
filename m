Return-Path: <linux-arm-msm+bounces-37787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 398189C711A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 14:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B129B2A6A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB831EE018;
	Wed, 13 Nov 2024 13:28:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28DD3198E96;
	Wed, 13 Nov 2024 13:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731504531; cv=none; b=Zmt6p//obrnZ8lqkzd5UMbWinaPShqYN5VUtxhMIBeq1ZNtILJ3h5WFSDDA8zLBa3H4oWSKUqobH6IgNe+xjYy1xWLmecBFx3g4zE9UOrfYM22nuevkkKjWUG28T5SdTYKXJOhFPNL2wTRtLid2hzSSdrtEdrRp2zSyLeb9SpP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731504531; c=relaxed/simple;
	bh=pX8JITPcEXhaiBInmyV3s2awwzyAdbyKOqtBZizTfyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VTQ6jC4yZuHbVlHEP4ZTQ4X1BuO+y5lRgHrtAC2Gozua9KVRbBa8rCwTxW9LNH5wrM+FkC+U+UM8QPbiC2UrZWPMVhM35dKJs8jqglmh1RhOeUklOoKyDgpIupTIaV1Bp68W3jgq4eP3wTYE6smFaTpTpVVVi8mvy0mViGtAhbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60D7A1655;
	Wed, 13 Nov 2024 05:29:18 -0800 (PST)
Received: from [10.1.29.78] (Suzukis-MBP.cambridge.arm.com [10.1.29.78])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7E5D43F66E;
	Wed, 13 Nov 2024 05:28:46 -0800 (PST)
Message-ID: <c002b839-310e-4c68-acc3-c3433c16e1fe@arm.com>
Date: Wed, 13 Nov 2024 13:28:45 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Coresight: Narrow down the matching range of tpdm
Content-Language: en-GB
To: Songwei Chai <quic_songchai@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241009091728.1638-1-quic_songchai@quicinc.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241009091728.1638-1-quic_songchai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2024 10:17, Songwei Chai wrote:
> The format of tpdm's peripheral id is 1f0exx. To avoid potential
> conflicts in the future, update the .id_table's id to 0x001f0e00.
> This update will narrow down the matching range and prevent incorrect
> matches. For example, another component's peripheral id might be
> f0e00, which would incorrectly match the old id.
> 
> Fixes: b3c71626a9333b0b29f9921a39ce ("Coresight: Add coresight TPDM source driver")
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index b7d99e91ab84..3230d76aed90 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1308,8 +1308,8 @@ static void tpdm_remove(struct amba_device *adev)
>    */
>   static struct amba_id tpdm_ids[] = {
>   	{
> -		.id = 0x000f0e00,
> -		.mask = 0x000fff00,
> +		.id	= 0x001f0e00,
> +		.mask	= 0x00ffff00,
>   	},
>   	{ 0, 0, NULL },
>   };
> 


Looks good to me, will queue this for v6.14. Apologies for missing the 
v6.13 cycle

Suzuki

