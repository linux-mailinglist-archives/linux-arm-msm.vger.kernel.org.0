Return-Path: <linux-arm-msm+bounces-87708-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F4DCF8CEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBBB7303D308
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 14:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF42631283C;
	Tue,  6 Jan 2026 14:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="Go8Gbhse"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49232.qiye.163.com (mail-m49232.qiye.163.com [45.254.49.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BCC309EF5;
	Tue,  6 Jan 2026 14:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767709660; cv=none; b=IVic8MIesZM9FbGoIdM6CDMHK3x1iyhY1gIh+8fjftc2e71sQeRtVcabzgAZ9eb1MVXMMlIROUhq/ORl2AqGLnUcR5ki2enAq0hh4tKrUL1Z3HcOZUXXl5N9tJ2z+ltcCV2xJfim1o2fEC5fQg2MAWXpgXwdqn2R6aT52yQm/8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767709660; c=relaxed/simple;
	bh=ToE8gyk4FirfJyMrhReTabCaLN2Uo5Ev0/HcD6mg0DI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iFzG3etV8BA0YDlDWA+pYJje1CgWimXhp2bwgqMdkdkf5hrR1VoMFnIUaoJzKd0W4XI8sHp+msLYxUBWYy+IzB1ReojwcKiNRo7yGETDPOcK7uu/nxa8XE3h5883kuYQwF3z6YKz9xlaqdxXfUILE5KjTOVe4gVkv0f7ZSTG2DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=Go8Gbhse; arc=none smtp.client-ip=45.254.49.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2fb2159b3;
	Tue, 6 Jan 2026 22:27:31 +0800 (GMT+08:00)
Message-ID: <7547e933-1cbd-4bf9-bc8a-fb0c78b11337@rock-chips.com>
Date: Tue, 6 Jan 2026 22:27:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V4 3/4] scsi: ufs: core Enforce minimum pm level for sysfs
 configuration
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>, mani@kernel.org,
 alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9b93b4b0c409cckunm3f97de73835c7b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh1PQlYdSUMeSBhJT08dHhpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Go8GbhseksVywX5IMKvUb6TcqeN5YAKAtngAXPwLywNpt8Lphfzfoichif0aoh7Vsc2bodV2yZTXLzQ3U9vieavxPuhsGYGYaI1TdaYihLYvwSR0bhhbTI1KPojWg6hoJ93jf5WHw6VK+T/smhVRMcFLBrklthvqoPXjHGjwE4M=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=r39NgvTJsx9tvCPQ4R1VMYjGBJfIwI59kCIM14n3iXQ=;
	h=date:mime-version:subject:message-id:from;

在 2026/01/06 星期二 21:40, Ram Kumar Dwivedi 写道:
> Some UFS platforms only support a limited subset of power levels.
> Currently, the sysfs interface allows users to set any pm level
> without validating the minimum supported value. If an unsupported
> level is selected, suspend may fail.
> 
> Introduce an pm_lvl_min field in the ufs_hba structure and use it
> to clamp the pm level requested via sysfs so that only supported
> levels are accepted. Platforms that require a minimum pm level
> can set this field during probe.
> 
> Signed-off-by: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>
> ---
>   drivers/ufs/core/ufs-sysfs.c | 2 +-
>   include/ufs/ufshcd.h         | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
> index b33f8656edb5..02e5468ad49d 100644
> --- a/drivers/ufs/core/ufs-sysfs.c
> +++ b/drivers/ufs/core/ufs-sysfs.c
> @@ -141,7 +141,7 @@ static inline ssize_t ufs_sysfs_pm_lvl_store(struct device *dev,
>   	if (kstrtoul(buf, 0, &value))
>   		return -EINVAL;
>   
> -	if (value >= UFS_PM_LVL_MAX)
> +	if (value >= UFS_PM_LVL_MAX || value < hba->pm_lvl_min)

It makes sense that some platform support a limited subset of power
levels. But each level is in increasing order of power savings, and you
set it to UFS_PM_LVL_5. Don't you support UFS_PM_LVL_0 the full active
mode?

>   		return -EINVAL;
>   
>   	if (ufs_pm_lvl_states[value].dev_state == UFS_DEEPSLEEP_PWR_MODE &&
> diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
> index 19154228780b..ac8697a7355b 100644
> --- a/include/ufs/ufshcd.h
> +++ b/include/ufs/ufshcd.h
> @@ -972,6 +972,7 @@ struct ufs_hba {
>   	enum ufs_pm_level rpm_lvl;
>   	/* Desired UFS power management level during system PM */
>   	enum ufs_pm_level spm_lvl;
> +	enum ufs_pm_level pm_lvl_min;
>   	int pm_op_in_progress;
>   
>   	/* Auto-Hibernate Idle Timer register value */


