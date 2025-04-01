Return-Path: <linux-arm-msm+bounces-52920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16859A77451
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 08:11:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFDCB3A86BD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Apr 2025 06:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9940C1DF739;
	Tue,  1 Apr 2025 06:11:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876431DC9B3;
	Tue,  1 Apr 2025 06:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743487874; cv=none; b=tIwNuyc/AOE8s4blZzvttISVgoREbYAfhS6GDVadkdyU41fYCGG0c1Wfay1U8DpXLxQekRrzytGtQPa48h3kSvP0AP8jZ738sE5lWSPbr/pGVpsmXlBQhummt79b45foL3aA2L+K3xi0tkjBHGKJbxKF0WMn9ZFEmNf0fPPtAc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743487874; c=relaxed/simple;
	bh=H6bZLUpi2zBg2+Fzav3WdvijAmaC3L28dnnKrp9Brlk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBAzMXt9v0S+SV2f0slNRAWkG1LxY5oXYZHBKte9UzP5tQvG91a99GA5Lg8cB4TmuZWYWNS+/0kUNZHIU0akPGnqbldFzvMPbbrDgFI9GT1g2v11vAV/esbXQall79Xk+N07VfQWHMhuJWutOMMgJJjiNnzhiMf7fDMpuD7kd9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 385DC150C;
	Mon, 31 Mar 2025 23:11:15 -0700 (PDT)
Received: from [10.162.16.153] (unknown [10.162.16.153])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07B893F63F;
	Mon, 31 Mar 2025 23:11:07 -0700 (PDT)
Message-ID: <470e4a90-41c3-4974-a4d7-3073a7fcc737@arm.com>
Date: Tue, 1 Apr 2025 11:41:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix the wrong type of the trace_id in
 coresight_path
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Jie Gan <quic_jiegan@quicinc.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
 Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
References: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250401014210.2576993-1-jie.gan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/1/25 07:12, Jie Gan wrote:
> The trace_id in coresight_path may contain an error number which means a
> negative integer, but the current type of the trace_id is u8. Change the
> type to int to fix it.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Fixes: 3c03c49b2fa5 ("Coresight: Introduce a new struct coresight_path")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

LGTM

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
>  include/linux/coresight.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..c2bf10c43e7c 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -337,7 +337,7 @@ static struct coresight_dev_list (var) = {				\
>   */
>  struct coresight_path {
>  	struct list_head	path_list;
> -	u8			trace_id;
> +	int			trace_id;
>  };
>  
>  enum cs_mode {

