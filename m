Return-Path: <linux-arm-msm+bounces-45857-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B04A19872
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 486A1169838
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158BC214226;
	Wed, 22 Jan 2025 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="KXgDgxwN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAE8212B0F;
	Wed, 22 Jan 2025 18:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570758; cv=none; b=eZylw2cDBI6JgxxHAQRMebxm6O9JkZGpOzHj4YYb0Y/3XdgmiNM/7s7TLhnONEz6o/RfG0YK+WaFTr1TVZfuErDLJGPLazj0VmZMxJL8XPYARakIi6A/VeCxjzEy6YvwOcRWsD9PETnk1bfHxffHjyDiwrpQkLssLUylmhHJSIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570758; c=relaxed/simple;
	bh=H6Rg9O6xjeDG8attwsDwaqjElCMWGeouMSk9T0qMzrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N34YWP8JBJRXkZ0JEf195hBsQRHPygYQmPA2SLM5foIpZvrtAVwRoacxMMQxwNfCv7PO1SEM/GzMUtCwWoK1b3w4WL+AWFUy+IvsCmH681yqNWdkKPspvDkXwDLtPbQ2MaDPw3xzQ1rRx6/rb/gQjLuVbcwPE7vRW0E0PGOEsLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=KXgDgxwN; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YdXkC5jggz6CmQyd;
	Wed, 22 Jan 2025 18:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737570748; x=1740162749; bh=4YbAsES10OzkZHtSlMHH26ax
	BYf+EpHPO5Oh6Lh3Hmc=; b=KXgDgxwN+ZsaEO3TMuc+1lodF2Zahj7fmCpoUloz
	qlv069Hpyix4FfFKmBAXcJaeXQubCn6WIemlCVPHxvVWcNJh6fmcw93MiRdTWu6O
	E49mNI9q6K6qJ2Qk4H1V+Ryd+ojN/Tl9gnI3yfD2GglGcI2DrEOPMF2xoDCNjGYR
	4pknZAA4Ue3YmYuUuCQ2hBHD/ic2kRvPDn91+8CqRXOhp0/FnfQA8C+8bA9P3cGO
	77720E8bLiSpyn+twDE18/IddBNawf7XAGCGDa3weZV7wMNNKeNApqAsNXKJUbSK
	h8FWb9yIdDqlX1XU4f1ssBz8gwTtnae9lz5n7pGoLPJUUA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id z7kscFRNT3V0; Wed, 22 Jan 2025 18:32:28 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXjy1Rx0z6CmQyb;
	Wed, 22 Jan 2025 18:32:21 +0000 (UTC)
Message-ID: <da2df1b2-5d32-4fcf-8298-6d045b4f7d42@acm.org>
Date: Wed, 22 Jan 2025 10:32:19 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] scsi: ufs: core: Enable multi-level gear scaling
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Peter Wang <peter.wang@mediatek.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Andrew Halaney <ahalaney@redhat.com>,
 Maramaina Naresh <quic_mnaresh@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-6-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-6-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> +	if (target_gear) {
> +		memcpy(&new_pwr_info, &hba->pwr_info,
> +		       sizeof(struct ufs_pa_layer_attr));

Why memcpy() instead of an assignment? The advantage of an assignment is 
that the compiler can perform type checking.

Thanks,

Bart.


