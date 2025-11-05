Return-Path: <linux-arm-msm+bounces-80455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8E1C365C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 16:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929CB189A667
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 15:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751083314CC;
	Wed,  5 Nov 2025 15:23:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B6934D3A7;
	Wed,  5 Nov 2025 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762356201; cv=none; b=p6Uq+l+YXkG0+OOWxHEeHaLudiQNmc1AbiOiYD40fs0bUzxvhzlKpTsiWcveoeqXgswt+WIwrwKogb2mGKxMTSpRn0v+6/pBYW2jT1KTrOdYPuQNgD4Jg8omnPcc+wsi+ILTPAg6qUTehAT3eokABy5W28NWvQYpPfN1f65Gsko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762356201; c=relaxed/simple;
	bh=eg+hTn5TgiUK40EsvR7X2VRmnATInJSb7eAB3t/gwHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gpJp9GtdMASkf98Pm9aaieTe8C6ZsaO2nnP+2trzUDiJvjjY9gRAdWktdlTqfpcpLqo6KSHrnOvxbZfm17PfzzbAYh7E2V/BWH8WkO0zzk7qE1BotcHjRzB2OAaoIf2A3GqxEsAkVK7mXJV5Vx/h57KVMbrMfX712UHPMF3ZopM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E9901692;
	Wed,  5 Nov 2025 07:23:10 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 118C03F63F;
	Wed,  5 Nov 2025 07:23:17 -0800 (PST)
Date: Wed, 5 Nov 2025 15:23:16 +0000
From: Leo Yan <leo.yan@arm.com>
To: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Linu Cherian <lcherian@marvell.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3] coresight: ETR: Fix ETR buffer use-after-free issue
Message-ID: <20251105152316.GA281971@e132581.arm.com>
References: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-fix_etr_issue-v3-1-99a2d066fee2@oss.qualcomm.com>

On Tue, Oct 21, 2025 at 04:45:25PM +0800, Xiaoqi Zhuang wrote:
> When ETR is enabled as CS_MODE_SYSFS, if the buffer size is changed
> and enabled again, currently sysfs_buf will point to the newly
> allocated memory(buf_new) and free the old memory(buf_old). But the
> etr_buf that is being used by the ETR remains pointed to buf_old, not
> updated to buf_new. In this case, it will result in a memory
> use-after-free issue.
> 
> Fix this by checking ETR's mode before updating and releasing buf_old,
> if the mode is CS_MODE_SYSFS, then skip updating and releasing it.
> 
> Fixes: bd2767ec3df2 ("coresight: Fix run time warnings while reusing ETR buffer")
> Signed-off-by: Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>

Tested on my Juno board with below steps:

  1) Enable the first path: ETM2 -> ETR0
  echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
  echo 1 > /sys/bus/coresight/devices/etm2/enable_source

  2) Enlarge buffer size from 1MiB to 4MiB
  cat /sys/bus/coresight/devices/tmc_etr0/buffer_size
  0x100000
  echo 0x400000 > /sys/bus/coresight/devices/tmc_etr0/buffer_size

  3) Enable the second path: ETM0 -> ETR0
  echo 1 > /sys/bus/coresight/devices/etm0/enable_source

  4) Disable paths
  echo 0 > /sys/bus/coresight/devices/etm0/enable_source
  echo 0 > /sys/bus/coresight/devices/etm2/enable_source

Without this patch, the oops will be triggered when disable paths.
I can confirm this patch does dismiss the issue.

Tested-by: Leo Yan <leo.yan@arm.com>

> ---
> Changes in v3:
> - Add a fix tag for the fix patch.
> - Link to v2: https://lore.kernel.org/r/20251021-fix_etr_issue-v2-1-80c40c9cac8c@oss.qualcomm.com
> 
> Changes in v2:
> - Exit earlier to avoid allocating memory unnecessarily.
> - Link to v1: https://lore.kernel.org/r/20251020-fix_etr_issue-v1-1-902ab51770b4@oss.qualcomm.com
> ---
>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> index b07fcdb3fe1a..800be06598c1 100644
> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> @@ -1250,6 +1250,13 @@ static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
>  	 * with the lock released.
>  	 */
>  	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
> +
> +	/*
> +	 * If the ETR is already enabled, continue with the existing buffer.
> +	 */
> +	if (coresight_get_mode(csdev) == CS_MODE_SYSFS)
> +		goto out;
> +
>  	sysfs_buf = READ_ONCE(drvdata->sysfs_buf);
>  	if (!sysfs_buf || (sysfs_buf->size != drvdata->size)) {
>  		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
> 
> ---
> base-commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> change-id: 20251020-fix_etr_issue-02c706dbc899
> 
> Best regards,
> -- 
> Xiaoqi Zhuang <xiaoqi.zhuang@oss.qualcomm.com>
> 
> 

