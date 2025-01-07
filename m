Return-Path: <linux-arm-msm+bounces-44211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8C2A04BAB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 22:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C1743A5B05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 21:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D451F8920;
	Tue,  7 Jan 2025 21:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tZ96DGpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AEA1F8914;
	Tue,  7 Jan 2025 21:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285412; cv=none; b=cyvEi+udDli8G5DO/bvda8+lIbIcCTsqzISVDdRe37uLVsJ7a1lFfhhre1yXGkCev0dGD/n2vyF7ZxQp6dklo8B60PdwpVWiU81zJ/Kw2tPLGCOoWYMI4q3gQqrLH5+YpILqP9kuasCKQp0IlRAEn6i7mvCIJB06vDdaq1U3qL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285412; c=relaxed/simple;
	bh=ac6y/Dz/2pY1MzjvhpThvPDoZJ/PH81sANKCYDwfnFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BeXgmRpnJv3FBZnylru/zGvIjdkwG1jRXg7ZbX4C3fUOWiQK/y09Gj5A+FR2N7Ado6Jo5Kg0+g1DLXXVA99vsWk+zBZtEALC6s4v+xOblvviPIuw+v3U38bnCYXbLpQQoUtgRll3sS+lqKvFx+RfynQTB4ZVBZibo4zH8JcnBys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tZ96DGpV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C48C4CEE4;
	Tue,  7 Jan 2025 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736285411;
	bh=ac6y/Dz/2pY1MzjvhpThvPDoZJ/PH81sANKCYDwfnFc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tZ96DGpVyYejpIudGq3GbE5JSUKls64N4vnwevP+GWRZCXZfEDDhdheH5Qq822oFv
	 3zK6zH+Q8tJfKpnp0Rr2eJA6D/sEcwFLtD+rDO1s4NAjatJR+Zb4pRSXa7gHgXOBNe
	 nBvMN8yGmejJ3U5KM4bgI/NpqlPbsFcGC6g/xVrEM4MKMXtUuYVZuLVljT+8OYnaM0
	 62y1l4/iO7Mq514KHp/heaotnjhkoHzy9UrkFcs/N6I8A3VphQBAN2r9IvcO4nRuOe
	 kB6KdeV7XeK5kBv0lA5ZZgjV+B/Hubzvxj3awQXtQ/X6moTNbdiPHvWTWJJARwvDYS
	 cY+n2QuZKToEA==
Message-ID: <9ef3daa8-cdb1-49f2-8d19-a72d6210ff3a@kernel.org>
Date: Tue, 7 Jan 2025 23:30:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] dmaengine: qcom: bam_dma: Avoid writing unavailable
 register
To: Md Sadre Alam <quic_mdalam@quicinc.com>, vkoul@kernel.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org
Cc: quic_mmanikan@quicinc.com, quic_srichara@quicinc.com,
 quic_varada@quicinc.com, robin.murphy@arm.com, u.kleine-koenig@baylibre.com,
 martin.petersen@oracle.com, fenghua.yu@intel.com, av2082000@gmail.com,
 linux-kernel@vger.kernel.org
References: <20241220094203.3510335-1-quic_mdalam@quicinc.com>
Content-Language: en-US
From: Georgi Djakov <djakov@kernel.org>
In-Reply-To: <20241220094203.3510335-1-quic_mdalam@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.12.24 11:42, Md Sadre Alam wrote:
> Avoid writing unavailable register in BAM-Lite mode.
> BAM_DESC_CNT_TRSHLD register is unavailable in BAM-Lite
> mode. Its only available in BAM-NDP mode. So only write
> this register for clients who is using BAM-NDP.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---

My Dragonboard db845c fails to boot on recent linux-next releases and
git bisect points to this patch. It boots again when it's reverted.

[..]

>   
>   	bchan->reconfigure = 0;
> @@ -1192,10 +1199,11 @@ static int bam_init(struct bam_device *bdev)
>   	u32 val;
>   
>   	/* read revision and configuration information */
> -	if (!bdev->num_ees) {
> -		val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
> +	val = readl_relaxed(bam_addr(bdev, 0, BAM_REVISION));
> +	if (!bdev->num_ees)
>   		bdev->num_ees = (val >> NUM_EES_SHIFT) & NUM_EES_MASK;
> -	}
> +
> +	bdev->bam_revision = val & REVISION_MASK;

The problem seems to occur when we try to read the revision for the
slimbus bam instance at 0x17184000 (which has "qcom,num-ees = <2>;").

Thanks,
Georgi

