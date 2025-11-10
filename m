Return-Path: <linux-arm-msm+bounces-80912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5DAC450A4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A096E188CF7A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 05:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 836982765F5;
	Mon, 10 Nov 2025 05:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="2Gy3//a6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF0B1EF092;
	Mon, 10 Nov 2025 05:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762753977; cv=none; b=QM5PSY/y3v/Wi7iWs86MBzg5MsP7MqnDGb4GX3kQuHn6NAw/I5F4JOj66Ai83Oqbx7qjMhMJGs1CZmf6hJnCGKuJ4NmfYQQz3uADaGBbtO3DsmIKd9HHc3SNC3rM827renRgejimQxenLiHmYs+qfMOv5HV8H7mAjQV4fb/AK3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762753977; c=relaxed/simple;
	bh=l8pvYNu1efbXKXmuuk15Uztlwn70OgzcQV4gvJ7m9cI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzNqYEzJs09fLzBJf9gLmQq458x4jS6fdapIkvvdgz5sYdAYe9K//DgQ/ABTo9iJnA27jOmz8IB1DTghDT31c70dCwcaCpyMR6qoUfm5GIJ+qtZV8seP0seKQMRXcGiUZBKapz9Ag2o5lSiSyjrZhX5GDa9/AQ0FFHw8nucMr10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=2Gy3//a6; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=dlGtUJhDtfIO4wsN+b5wZaU1sv9YpDEMHaPl8mff6cM=; b=2Gy3//a626W6kFbHFHLfIpohJE
	gCl5BNmuw1v4+spdaV6qW9bzZcdB5oEMz1Cs+ZA2dXsIcotjYYRS2dmYn7UMGLPpXFky6mzesAcfi
	UMTJzj9hLnmJ7wjMWZ9vQBYU7Z1LDGsialWICFNR6AHavAfQ8yoMhA/fXwo0+lzyqJFDA8YqLfPD7
	HFZJ0/pqOwoPTQNieKQIEsFUkAsHm4gy0LmluPdvh2tRFDSCosFaFH9J+JrbsYSoekUVHoIu29XGc
	zdeTrhCD49banweQdnnkvD3B1t7BQFiYLOP/0V+zBtbtySbtK6QcUg/5gEAYc4btNqF3jNgfoAyC5
	e9NwTGjA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIKpZ-00000004nbU-48x9;
	Mon, 10 Nov 2025 05:52:46 +0000
Message-ID: <0c6eb45b-0e9a-4bb0-9ee0-71752cbbe9c5@infradead.org>
Date: Sun, 9 Nov 2025 21:52:45 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Format DBC states table in sysfs ABI
 documentation
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
 Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/25 7:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> These are caused by DMA Bridge channel (DBC) states list in sysfs ABI
> docs. Format it as a table to fix them.
> 
> Fixes: f286066ed9df38 ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/ABI/stable/sysfs-driver-qaic | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-driver-qaic b/Documentation/ABI/stable/sysfs-driver-qaic
> index e5876935e62b34..c767a93342b3c9 100644
> --- a/Documentation/ABI/stable/sysfs-driver-qaic
> +++ b/Documentation/ABI/stable/sysfs-driver-qaic
> @@ -3,14 +3,17 @@ Date:		October 2025
>  KernelVersion:	6.19
>  Contact:	Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>  Description:	Represents the current state of DMA Bridge channel (DBC). Below are the possible
> -		states,
> -		IDLE (0) -		DBC is free and can be activated
> -		ASSIGNED (1) -		DBC is activated and a workload is running on device
> -		BEFORE_SHUTDOWN (2) -	Sub-system associated with this workload has crashed and
> +		states:
> +
> +		===================	==========================================================
> +		IDLE (0)		DBC is free and can be activated
> +		ASSIGNED (1)		DBC is activated and a workload is running on device
> +		BEFORE_SHUTDOWN (2)	Sub-system associated with this workload has crashed and
>  					it will shutdown soon
> -		AFTER_SHUTDOWN (3) -	Sub-system associated with this workload has crashed and
> +		AFTER_SHUTDOWN (3)	Sub-system associated with this workload has crashed and
>  					it has shutdown
> -		BEFORE_POWER_UP (4) -	Sub-system associated with this workload is shutdown and
> +		BEFORE_POWER_UP (4)	Sub-system associated with this workload is shutdown and
>  					it will be powered up soon
> -		AFTER_POWER_UP (5) -	Sub-system associated with this workload is now powered up
> +		AFTER_POWER_UP (5)	Sub-system associated with this workload is now powered up
> +		===================	==========================================================
>  Users:		Any userspace application or clients interested in DBC state.

-- 
~Randy

