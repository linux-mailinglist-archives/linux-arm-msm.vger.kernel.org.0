Return-Path: <linux-arm-msm+bounces-80913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51245C450AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 06:53:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52AA23AE9BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 05:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9692E973D;
	Mon, 10 Nov 2025 05:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t33S40t5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CB01FAC4B;
	Mon, 10 Nov 2025 05:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762753979; cv=none; b=RqY6uOTV2TaY3EyQFX3k2ElHEHhcvnyKCzkdidJbxjPOntWkCrUeR7LRd2E18/zx5BE6N1gycguWxLVw0NC0T4aSJi3NawMloO9upmuGBBQGzdE93m5OMoqPW/hckP/FT6g/u76+xFFGd8EnEEpY+Xtodq6I2BF+stR1t6ou8P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762753979; c=relaxed/simple;
	bh=ZeyNDo8J1kEw1S8GuZNn6SoaFlPaXHaRkpA1Lq+i9Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MM5aQONdrYZFX0rfryCf4d6ReVlrhcobuVDDWZp8TYrCI06WXMjpYSYPjT7F2flzRVoW9smKVDWcxVd6dLGpSAOkkalMWCE7iewgn8Zw9d4awSmI6LggbYlJguWH4qCnV+BfuFWnOCXD1EyDNDFj+vGtLxCU6szg7VgUx6BIng0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=t33S40t5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=ujt5kyh3yZXlIjgcf/Imi7ABgkTD37MOcMdswmYo1uA=; b=t33S40t5S/Nqnj3m1Czys+EHPI
	ComOKV4C5qtPY0hJR25sf9mTUFVfcMEdvNPZ/tfqIlsoqwgIlRGImNRDMbSV+7zcG+yH3e6gIu/+O
	Q++GI34yiX4Gmcv/PsenUgTPWBrDjbj+dHw4I/T3blqA5g0ABQqMgLd+CQIx10CzEOeIixDjivtNx
	UtgyPvqFSKpuJbrvtk52xTAEQBEi/Hzf+EY3iXlWAwBfQeyFISpI2aIrV+KUX/bxS+jwusTVsnerw
	MWB8O0nPzqb1htDE2ZV0oULp4bR+e0LcgFjpsR+qDdVe7D09aMRRqIN7ZcUHGSDJkxUm/Sczqvu6P
	V1akjewQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIKpe-00000004nbU-37hG;
	Mon, 10 Nov 2025 05:52:50 +0000
Message-ID: <d401ecce-2e7f-445c-a18d-cccb15c5fc46@infradead.org>
Date: Sun, 9 Nov 2025 21:52:50 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] accel/qaic: Separate DBC_STATE_* definition list
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
 <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251110035952.25778-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/9/25 7:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/accel/qaic/aic100.rst:502: ERROR: Unexpected indentation. [docutils]
> Documentation/accel/qaic/aic100.rst:504: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> 
> Fix these by separating DBC_STATE_* definition list from preceding
> paragraph.
> 
> Fixes: 9675093acea04c ("accel/qaic: Implement basic SSR handling")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110132401.200d88bd@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/accel/qaic/aic100.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/accel/qaic/aic100.rst b/Documentation/accel/qaic/aic100.rst
> index 3b287c3987d269..41331cf580b118 100644
> --- a/Documentation/accel/qaic/aic100.rst
> +++ b/Documentation/accel/qaic/aic100.rst
> @@ -498,6 +498,7 @@ it desires to recover the workload.
>  
>  When SSR occurs for a specific NSP, the assigned DBC goes through the
>  following state transactions in order:
> +
>  DBC_STATE_BEFORE_SHUTDOWN
>  	Indicates that the affected NSP was found in an unrecoverable error
>  	condition.

-- 
~Randy

