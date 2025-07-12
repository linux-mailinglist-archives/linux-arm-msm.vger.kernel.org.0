Return-Path: <linux-arm-msm+bounces-64686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D608B02C70
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 20:27:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91296189D886
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Jul 2025 18:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF26277C95;
	Sat, 12 Jul 2025 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZWXW1XZg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335C2274FCE;
	Sat, 12 Jul 2025 18:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752344865; cv=none; b=Eta/7YNuh+NbHIp7N6aH7Jv76tExqSZsJc4ASVy5DSHraKzD4YM29MSomS2KROlZ8kZcgt7gsxi4GHjk9qCWz96PQA0erCVIHA3ZuA5l8bDJs8wzNdG4wNAJ9wg7iPs0dPOP6tcAG39IJ1R7ydmIEkXbiNfYYuMFOGe1VTuer6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752344865; c=relaxed/simple;
	bh=W4g+kjPJ3K8wnVxOEoch4S5NoRMOytbxldAomVbV/v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8r2Ib13tHgYrpK0zJvB+zmbAR3n3SZN1KoEH+EfaNlPERbvLJ3bUYfekUopkJUuZNWJmRttQ6MC0kR3qm0GqJuhMS4WNyJNIJsjAG2kUXWdQnKYoQQ9iDeydxinCsH6VNkYvcox+0cU9flgdUxNBFcBEwl71j+JJkxLa/+fYbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZWXW1XZg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52CFDC4CEEF;
	Sat, 12 Jul 2025 18:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752344864;
	bh=W4g+kjPJ3K8wnVxOEoch4S5NoRMOytbxldAomVbV/v0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZWXW1XZgDikeuWRB5J/Tz5ESJdFkvhkISXQGON87SCIAGEOr3D+w2+8g32CMtr5mL
	 hzpMhb5xonrIZeSJj+vuO88OTjh9J35oiByaffCj//mgGHgwQmR5/y+OZLiZ4tvJ3X
	 YVKZoLYq5E8Ihj3aXPObLsFKC1XuAMNr1cPtwcSL7C1pbP0NGJiKuFmjDRIZYOyva2
	 lk8nxcIYd81fT0y5Ejj/tlcZBKrLP6JJJAFE3FHIirlCUsYw5uSpDSA7JF/Y9t5cBX
	 NHPBBpLkauCZGqVfrnzFOtYR8ei3eohbb8br5X3qWaXyQIj+Jn85sI76Lrikv0w2on
	 efi92+bYdR9Zw==
Message-ID: <acd5b3e3-5370-49a4-aad9-b1001aa0eb5a@kernel.org>
Date: Sat, 12 Jul 2025 19:27:42 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc: fastrpc: Use of_reserved_mem_region_to_resource()
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Srinivas Kandagatla <srini@kernel.org>,
 Amol Maheshwari <amahesh@qti.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250703183455.2074215-1-robh@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20250703183455.2074215-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/3/25 7:34 PM, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different. "memory-region" is optional, so
> failed lookup is not an error. But then an error in
> of_reserved_mem_lookup() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Reviewed-by: Srinivas Kandagatla <srini@kernel.org>


Greg, there are no more patches for fastrpc for this cycle, can you
please pick this up via char-misc tree?


thanks,
Srini



>  drivers/misc/fastrpc.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 378923594f02..53e88a1bc430 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2262,8 +2262,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	int i, err, domain_id = -1, vmcount;
>  	const char *domain;
>  	bool secure_dsp;
> -	struct device_node *rmem_node;
> -	struct reserved_mem *rmem;
>  	unsigned int vmids[FASTRPC_MAX_VMIDS];
>  
>  	err = of_property_read_string(rdev->of_node, "label", &domain);
> @@ -2306,20 +2304,17 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		}
>  	}
>  
> -	rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
> -	if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
> +	if (domain_id == SDSP_DOMAIN_ID) {
> +		struct resource res;
>  		u64 src_perms;
>  
> -		rmem = of_reserved_mem_lookup(rmem_node);
> -		if (!rmem) {
> -			err = -EINVAL;
> -			goto err_free_data;
> -		}
> +		err = of_reserved_mem_region_to_resource(rdev->of_node, 0, &res);
> +		if (!err) {
> +			src_perms = BIT(QCOM_SCM_VMID_HLOS);
>  
> -		src_perms = BIT(QCOM_SCM_VMID_HLOS);
> -
> -		qcom_scm_assign_mem(rmem->base, rmem->size, &src_perms,
> +			qcom_scm_assign_mem(res.start, resource_size(&res), &src_perms,
>  				    data->vmperms, data->vmcount);
> +		}
>  
>  	}
>  


