Return-Path: <linux-arm-msm+bounces-81701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AD575C5978F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 19:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 257F334F0AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 18:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7026030AD06;
	Thu, 13 Nov 2025 18:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVNb32t+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42176272E5A;
	Thu, 13 Nov 2025 18:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763058731; cv=none; b=cw5ZZDwu/8zGP2nwGgPkiWOGwUKobJ0E0r2Z+3okKVRt8fubLvnF3W0iMRfhJErcSTfVEyROo1UO9xgXlylvz8CYW1mNRXpc7FT6FMjB9SLqkOqqjaD3UT5MEKguGts/i4URl/r3V4i2SiYbBsP2IqZ5uVTXPXvCxrrJ579Ew6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763058731; c=relaxed/simple;
	bh=9k0cV4W4E2McMEpHp1lX7/djiZ/+GbilTaI5Qd996Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1+cJdPewhaW79rDCzTkPoF/rJkHIwN9glN9NA6HgROgOOHuINHcfVNfquOxIUnYff10SHc3s+Jfozx9RAcjSUJUfpGB79+98/PKd+nJjXLhwMGtgP+vm6bPQ77SLgGM0z4qQAWRri18LUzPUenPz4OZKLjMuNyTnNiCx9nkN8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVNb32t+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D935C4CEF7;
	Thu, 13 Nov 2025 18:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763058730;
	bh=9k0cV4W4E2McMEpHp1lX7/djiZ/+GbilTaI5Qd996Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVNb32t+Fx6zWayiyYsL5u5EliZBg+xwF8tM8HkzrHqKH5/4isdX35JmRhLPxHaJH
	 1CPnqMLSMNSGjqUia4DsuVnQjRNStybfKhQ7V90sVl6pvs9jOVYLljBkBHlA+AzPxR
	 VyAJewk07Ee6X73eO+3N1uBEFPhPwCJwk1gdKWTpVZC3RohnOG+KSbDiPExR8aAP0a
	 96o7oXqSO7vvA06Hq7A0ERK59yXOgOZu1gbqfSbF9U3XckIZXVP9kpgnsP4A17wXWm
	 Sa5wOIagNp0Uzz2B8CldEKZYIYFz1pigbXcCuBJuYHmat7fgjf/AjT7flveS74zyUi
	 uwqY++dzAFkuQ==
Date: Thu, 13 Nov 2025 12:36:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] soc: qcom: socinfo: add support for new fields in
 revisions 20,21,22, and 23
Message-ID: <3ebfephjmohck2y4upx6qe7yt7b6ocooe6ae5sfmom44oxz3fy@yeaiuy7ivpt5>
References: <20251113085432.1309629-1-ananthu.cv@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113085432.1309629-1-ananthu.cv@oss.qualcomm.com>

On Thu, Nov 13, 2025 at 12:55:06AM -0800, Ananthu C V wrote:
> add support for the below fields in socinfo structure:
> - v20:
>   * raw_package_type: type of the raw package
> - v21:
>   * partial_features_array_offset: position on array indexed by
>     ChipInfoPartType, each bit notes the corresponding component being
>     enabled or disabled
> - v22:
>   * cpu_cores_array_offset: position on array of cpu cores per cluster
> - v23:
>   * part_instances_offset: position on array of PlatformInfoPartInfoType
>     structures
>   * num_part_instances: length of the array of part_instances at
>     part_instances_offset
> 

Please see https://lore.kernel.org/r/20251104130906.167666-1-mukesh.ojha@oss.qualcomm.com

Regards,
Bjorn

> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/socinfo.c       | 4 ++++
>  include/linux/soc/qcom/socinfo.h | 9 +++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 963772f45489..a14aaad51f81 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -621,6 +621,10 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 23):
> +	case SOCINFO_VERSION(0, 22):
> +	case SOCINFO_VERSION(0, 21):
> +	case SOCINFO_VERSION(0, 20):
>  	case SOCINFO_VERSION(0, 19):
>  		qcom_socinfo->info.num_func_clusters = __le32_to_cpu(info->num_func_clusters);
>  		qcom_socinfo->info.boot_cluster = __le32_to_cpu(info->boot_cluster);
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 608950443eee..40903c54b526 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -82,6 +82,15 @@ struct socinfo {
>  	__le32 num_func_clusters;
>  	__le32 boot_cluster;
>  	__le32 boot_core;
> +	/* Version 20 */
> +	__le32 raw_package_type;
> +	/* Version 21 */
> +	__le32 partial_features_array_offset;
> +	/* Version 22 */
> +	__le32 cpu_cores_array_offset;
> +	/* Version 23 */
> +	__le32 part_instances_offset;
> +	__le32 num_part_instances;
>  };
>  
>  /* Internal feature codes */
> -- 
> 2.43.0
> 

