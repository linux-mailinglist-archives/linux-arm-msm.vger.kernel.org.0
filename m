Return-Path: <linux-arm-msm+bounces-33655-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3399643D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:58:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AB18EB270C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E775B18E36C;
	Wed,  9 Oct 2024 08:54:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CF4D18DF81;
	Wed,  9 Oct 2024 08:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728464088; cv=none; b=CVWcye0hcKCkq9+wBQWwQyPWMeBFkyLa/VMcCbHMNUNuak9E3smvVn3AxCUCgIP3lLgRAap/PP0UhW/B4r0jLcjEExpVlQ6jYK7bww3eWoczZUVXOv8T7olCyVUJfF8s/uLrCO50ZpbH8N4LKryl+bKnn1ShGYbh1gdwb7jASC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728464088; c=relaxed/simple;
	bh=kTx1HT+m4F9ANgXU0SkEaOvA6/R2Zm4LE6P8bmqeMUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ij3dSbF/z/y3CwsJotyKGW0huHdcC8YpiHiYaiUhCao0/s0SubLrU4j8uncFa6MoVAuwBvf+QxicCPkNHbamPxjNHlXnZeVzLR6Tq37UkBJ1pibVI5Qlwg3NDmm0bDNXgJUJM3yZ2Jwm67yA2OaiyUMpDn3m58019NCs+4gLGEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 301B1FEC;
	Wed,  9 Oct 2024 01:55:15 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC6773F64C;
	Wed,  9 Oct 2024 01:54:43 -0700 (PDT)
Message-ID: <a7fc66fe-0fb3-4d2c-8f23-03ccd46a4766@arm.com>
Date: Wed, 9 Oct 2024 09:54:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Coresight: Narrow down the matching range of tpdm
To: Songwei Chai <quic_songchai@quicinc.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241009085042.1098-1-quic_songchai@quicinc.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20241009085042.1098-1-quic_songchai@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2024 09:50, Songwei Chai wrote:
> The format of tpdm's peripheral id is 1f0exx. To avoid potential
> conflicts in the future, update the .id_table's id to 0x001f0e00.
> This update will narrow down the matching range and prevent incorrect
> matches. For example, another component's peripheral id might be
> f0e00, which would incorrectly match the old id.
> 
> Signed-off-by: Songwei Chai <quic_songchai@quicinc.com>
> ---
>   drivers/hwtracing/coresight/coresight-tpdm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
> index b7d99e91ab84..8e2985d17549 100644
> --- a/drivers/hwtracing/coresight/coresight-tpdm.c
> +++ b/drivers/hwtracing/coresight/coresight-tpdm.c
> @@ -1308,8 +1308,8 @@ static void tpdm_remove(struct amba_device *adev)
>    */
>   static struct amba_id tpdm_ids[] = {
>   	{
> -		.id = 0x000f0e00,
> -		.mask = 0x000fff00,
> +		.id = 0x001f0e00,
> +		.mask = 0x00ffff00,
>   	},
>   	{ 0, 0, NULL },
>   };
> 

Please could you add "Fixes" tag for this ? You don't want an old kernel 
detect something else as TPDM, so this must go to stable kernels.
Also, while at it, please could you intend the id and mask values with
tabs, so it is easier to what exactly we are matching ? e.g,


	.id	= 0x001f0e00,
	.mask	= 0x00ffff00,

Kind regards
Suzuki



