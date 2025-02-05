Return-Path: <linux-arm-msm+bounces-46971-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 908E4A2987B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:13:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28569164C86
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E051FC7EA;
	Wed,  5 Feb 2025 18:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="G0BKd4vC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7172A14F9E7;
	Wed,  5 Feb 2025 18:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738779186; cv=none; b=QDoOxLd5EOfEssN6Dhl0hpnGNmwmc4gtu6/o6z/Wz4NLHGl69MEfl/mQXcGbOs8CazNhUblhFPkDxbJBPIKxw27J0AskRNMApVS1hZSc0UzaftIkJBSOCNyZiXIlqrFaM7YF4P5wwT/9cnfkYI79aXL7+tG9WCFwPBB2c3PEzug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738779186; c=relaxed/simple;
	bh=Up/qq84r5S/UYhXFTh8In9C34CQSWCRxH4/J+jHx9Ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CTc9bWQPkqI8CxO2tLsiN1n4BXz/D/8SGAxoPWDAUCtXyUEb1C918sJ3NCDIY47OvObCK05HbkfQF0v19HS3HgwQNYlTucg2XN8alB0XkUaL2JQ8br3ft6nGvmcXb9+RDo5mMRckOd8NViHQphr4/8V6dl7Bjo6Qy8Q1ijYXykM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=G0BKd4vC; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Yp7dC5dByz6CmLxY;
	Wed,  5 Feb 2025 18:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738779175; x=1741371176; bh=HEmpdHhzE2vU2QVoWRp2+Ebu
	PduQnjFGmo2WB4b4xlk=; b=G0BKd4vCbygEYnk4FihlhKIYkoAwpDCDXlFiY5SR
	dLTZF7iBDGbHfLNtd82jMjhOsNF/lt5te9akmECpZAAiRE3DtFRPSQWUuusvkv+W
	G+5wYrDQqpaIkNJwMG0DSD1F8Gt/6JL5a+L7T8F4ulxKe4OIi70P9raftJF+SrK5
	zS5XK0PoLVBWfsmX2CfvptE84mKPxduf+9YmAe8cxgo1zSRk7UarbOlEe9TKZJpA
	9iuAOrgG3pLDVw+ckqRRqHH12XHZz+ln3jOm4o5jWMt9pN1f61YD2EOaQiBq3m8l
	VJSRmJ1DX78qMA5R4c+gzWYWrfvQbbHVBL+RKcTgxzShJg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id k9WYAbFLhfcS; Wed,  5 Feb 2025 18:12:55 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7cy6KcTz6CmM6c;
	Wed,  5 Feb 2025 18:12:50 +0000 (UTC)
Message-ID: <07c3d640-d2d7-4edb-b62e-0926e5e7c7c8@acm.org>
Date: Wed, 5 Feb 2025 10:12:49 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 attributes
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Keoseong Park <keosung.park@samsung.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-9-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-9-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 12:11 AM, Ziqi Chen wrote:

Please change the patch title from "Add missing UFS sysfs attributes" 
into "Add missing UFS sysfs attribute documentation". This patch does 
not add any sysfs attributes - it adds missing documentation.

> +What:		/sys/bus/platform/drivers/ufshcd/*/clkscale_enable
> +What:		/sys/bus/platform/devices/*.ufs/clkscale_enable
> +Date:		January 2025
> +Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
> +Description:
> +		This file shows whether the UFS clock scaling is enabled or not.
> +		And it can be used to enable/disable the clock scaling by writing
> +		1 or 0 to this file.
> +
> +		The file is read/write.
> +
> +What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_enable
> +What:		/sys/bus/platform/devices/*.ufs/clkgate_enable
> +Date:		January 2025
> +Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
> +Description:
> +		This file shows whether the UFS clock gating is enabled or not.
> +		And it can be used to enable/disable the clock gating by writing
> +		1 or 0 to this file.
> +
> +		The file is read/write.
> +
> +What:		/sys/bus/platform/drivers/ufshcd/*/clkgate_delay_ms
> +What:		/sys/bus/platform/devices/*.ufs/clkgate_delay_ms
> +Date:		January 2025
> +Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
> +Description:
> +		This file shows and sets the number of milliseconds of idle time
> +		before the UFS driver start to perform clock gating. This can
                                       ^^^^^
                                       starts
> +		prevent the UFS from frequently performing clock gate/ungate.
                                                                  ^^^^^^^
                                                          gating/ungating
> +
> +		The file is read/write.


Please change the word "file" into "attribute" to make the sysfs 
attribute documentation consistent with the sysfs documentation for
other kernel drivers.

Thanks,

Bart.

