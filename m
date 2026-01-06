Return-Path: <linux-arm-msm+bounces-87704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A07ACCF8AEA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 15:08:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7693301C92F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 13:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8D21F0E29;
	Tue,  6 Jan 2026 13:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ivXSWcis"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017D915ADB4;
	Tue,  6 Jan 2026 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767707806; cv=none; b=jn5mB6BtLNgZfZ9P5E3o+Wxa8AGdJuQRMru/nYjAC3KZnIX63cSwDfS6/W+y9z6xsbCZSizzRxYQi+65T8izv8gQ4BR56vjupuE7VqQDf28ZlX6kFTdJgdUauoZpE6iD8aETVXKca01aVsAbKFxjw04auN+0lj4Q/YpGMz/KeqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767707806; c=relaxed/simple;
	bh=pfQiOuZ4XOOOotDbPS1EoD1xSf8srGOyZ0ZupqTSqac=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8IiqZ662Ze9qFoInVX/mFXi5yCjvvvGcKTc0rh/NCjm+EoAyZWuhE04B27mTWB+02SNJPkvSJ9jFET0xUytjNh3UC+e9d4ZBe0ppMbFl4N2jhvtZs0pyrxMYHXEpOJt6QGo609RPOJB/dPBBBaLWYUW0q28Oly7UcpG+uPCWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ivXSWcis; arc=none smtp.client-ip=199.89.1.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dlt4k2K3Pz1XM6J5;
	Tue,  6 Jan 2026 13:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1767707795; x=1770299796; bh=HHxxMZqBE2l+kDaygIMQhIid
	nhwPw5dkZDBjh6m6dJQ=; b=ivXSWcisYW3pcvdx/7sZaRhda+sQZ1ahVadlGjBR
	o02d+Dk/H2yJ86zNL8dKwMNyG8vZMxXHKxMXoUndHrWzu7lt/2hMWBJyTH4DTfAs
	CJTwXinq8rkCn8tLdUXS4z9GU3FC4pD1UOKGm5obmbr6EcHEShe+kex7e467pH89
	oWoIQOJS+kIJcNl2/OYxywsIZV+DJRqIe+tLIKTEXEr36LuoYZLebK0HuZHPwUTu
	0tYpoPawGMV6yVGOQSMjm+L3IZhmNPEitFgR9qaGNGTWispkUrJnD1n0qo3FYx6f
	5arXD5vkGze6Rw1Rtr4WgsJxil+fm6fsD3yh0FSu5cv0MQ==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id SwVQiiFuNJm7; Tue,  6 Jan 2026 13:56:35 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dlt4c0rB5z1XPpVB;
	Tue,  6 Jan 2026 13:56:31 +0000 (UTC)
Message-ID: <280591c4-5522-4d38-b22a-efe9ba456cb2@acm.org>
Date: Tue, 6 Jan 2026 05:56:30 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 3/4] scsi: ufs: core Enforce minimum pm level for sysfs
 configuration
To: Ram Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>, mani@kernel.org,
 alim.akhtar@samsung.com, avri.altman@wdc.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260106134008.1969090-1-ram.dwivedi@oss.qualcomm.com>
 <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260106134008.1969090-4-ram.dwivedi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/26 5:40 AM, Ram Kumar Dwivedi wrote:
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

Please do not introduce new kernel-doc warnings and update the 
documentation block above this data structure when adding new members.

Thanks,

Bart.

