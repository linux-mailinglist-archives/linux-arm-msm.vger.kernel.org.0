Return-Path: <linux-arm-msm+bounces-45031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB89A10E67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 18:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A35516A069
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:55:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B4BF1FBC93;
	Tue, 14 Jan 2025 17:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ro0Em/7m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23DF1EE7AC;
	Tue, 14 Jan 2025 17:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736877337; cv=none; b=bZXcxPZ5+zeL7naEl2eA/tku8P3hFogQfiVFPmdZFDyBgy36T3VT23X77XqGfLMAtIWxLXB9tfEXYtdAcahY36xnkGItx62FvfP/nHqufPO1M4YUH5FZdyvmZCxFKBXxxcKsJAZGeOd16Czq5cIxa448V7yAi5hDl+rwh6uwTQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736877337; c=relaxed/simple;
	bh=OHmL6w79Y9VGVpAbxGEP9bE0AQIQfKl+7BgRzpI7zGU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EVNro2im/DA1V6AzA5KrlQpV8vn/M4pTDRHrqyG0O97aJhxuu3JngsbNJQazFi3fGlqXgq7qMXtsFc8q0hpsPpNGiJDEKDUhpvueml78HiA2hDCPilrG+R6b0uHYad149y6hlCO4z7WZGJoKwdOfd/Wv0oUqnSpiZ16radjiqdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ro0Em/7m; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YXcH472G0z6CmQyd;
	Tue, 14 Jan 2025 17:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1736877321; x=1739469322; bh=rx+xxhgfz6Qv2U93Mr0uyJHH
	3Uz3OWpv7e13MnI9pr4=; b=ro0Em/7mo2qYSG+4wF8NaY7HMuHC5oECKV3t+la6
	KyggnwIpZUwBvFMlG1aBzhAHriMjCEYTdU8Sq0c9Td6MXxFqvZFuuB1TjiFVibKF
	Fu1xR8VK3avTZwS4Gxjt8skCD4CXyIlP8N2VSke98A6EMwChSlg+drCp47iTXAC6
	eZvCXQm+3ArjlzGzyA7LN5R5rQNL48EjR2Bzlq4VRz16S3Ret+SS9sZA1bWJa/BZ
	AQUb0q6hzLUOZUQMcqeVLWthLQ6ejbEGmhGb5dnGGUPOJ/mU228+s0lik61FMSep
	pZCHy6AFKDR6VgD6wd5+Is0RP8nqs49Q+D8+U5Jm3NTiJw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id BUc2kVQEpj2k; Tue, 14 Jan 2025 17:55:21 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YXcGt0mRjz6CmQyb;
	Tue, 14 Jan 2025 17:55:17 +0000 (UTC)
Message-ID: <58f1b701-68da-49c0-b2b1-e079bad4cd08@acm.org>
Date: Tue, 14 Jan 2025 09:55:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scsi: ufs: fix use-after free in init error and remove
 paths
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Eric Biggers <ebiggers@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250114-ufshcd-fix-v2-1-2dc627590a4a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 1/14/25 8:16 AM, Andr=C3=A9 Draszik wrote:
> +/**
> + * ufshcd_scsi_host_put_callback - deallocate underlying Scsi_Host and
> + *				   thereby the Host Bus Adapter (HBA)
> + * @host: pointer to SCSI host
> + */
> +static void ufshcd_scsi_host_put_callback(void *host)
> +{
> +	scsi_host_put(host);
> +}

Please rename ufshcd_scsi_host_put_callback() such that the function=20
name makes clear when this function is called instead of what the=20
function does.

Thanks,

Bart.

