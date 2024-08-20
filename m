Return-Path: <linux-arm-msm+bounces-29155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A64E5958FBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 23:34:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D910C1C20A4D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 21:33:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C442D18DF87;
	Tue, 20 Aug 2024 21:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="nqd5pbYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD5245008;
	Tue, 20 Aug 2024 21:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724189636; cv=none; b=tTT5LgoLP8LIQRf/e6PDQ2iEQFNVvTtphp3+z5hLm1sqC0fkTfRJeTwwa2dIRZt7yWNkCAJSZrLZOuhX3QwK2aY0vswv/P8T1Dqfm0gvyvyobb45C39R1OQinWirFyDEoA+TlQBDS/lJnwawpoGO4Wehkn4+o0iNu38inechI9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724189636; c=relaxed/simple;
	bh=XBai1S/ggudAnspnqU47KRpMsgHcZt+Non8IXyvGhJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hpn7OhqgWVw+/xyycPRUSpF/0ec0rCR2tjR31A0yAkOsuhebp/NLSbbvZGBG39hhjHGLUnbPL6ATz7PKnOjkMNHXouFJ/PGMNAhgsTbGceeO8U1VjAiHEOgBpYNmlg/DZNiAu7wevpdFQqDVljvN5NgrDU4hye0C1yC1lykCf5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=nqd5pbYN; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WpN4z02Msz6ClY8w;
	Tue, 20 Aug 2024 21:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1724189631; x=1726781632; bh=72jJxxXESfQ1jsxRf+WmOrLA
	39Twj36t2BvDfZbRLO4=; b=nqd5pbYN5ahaf+7NctiQve5Ayc4Ru9WT/KyBJzKA
	IASOGdjHKhkSDQenDupogwBQorlwoLQuYLxe1Nr5UkF1v+qUiP04+c17EmDaK8TL
	Dwe98s8oEHjceYjWQHKsYmaWk8JfKD3QnHaDEekWrojDULxbz87OQQkatlMJa65b
	kBiOl/YGh+3pXHhXJNtjlTZIwS29RLjwez4LAfzGMqA2V+bZ2pZ6hndkegMBwJNj
	M1w5H6gWedSlKI7DVvYZGDC34VM1AoBaP0qtlwOPZWn5HFpIxlfMk68FA77gHjWd
	uhpTITzVvr5dpEu/OyB8waqA7+UGp8pWXXIZaPeTG6d9JA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id u4BZMkYsQ2qw; Tue, 20 Aug 2024 21:33:51 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WpN4q4XGLz6ClY8n;
	Tue, 20 Aug 2024 21:33:47 +0000 (UTC)
Message-ID: <6e23410b-7c79-4df7-acf8-32d2b1af6bee@acm.org>
Date: Tue, 20 Aug 2024 14:33:45 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] scsi: ufs: ufs-qcom: Add DELAY_BEFORE_LPM quirk for
 Micron and Skhynix
To: Manish Pandey <quic_mapa@quicinc.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_bhaskarv@quicinc.com, quic_narepall@quicinc.com,
 quic_rampraka@quicinc.com
References: <20240820123756.24590-1-quic_mapa@quicinc.com>
 <20240820123756.24590-3-quic_mapa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240820123756.24590-3-quic_mapa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/20/24 5:37 AM, Manish Pandey wrote:
>   static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
>   	/* add UFS device specific quirks */
> +	{ .wmanufacturerid = UFS_VENDOR_MICRON,
> +	  .model = UFS_ANY_MODEL,
> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
> +	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
> +	  .model = UFS_ANY_MODEL,
> +	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
>   	{}
>   };

What makes these quirks specific for Qualcomm controllers? Are these
quirks perhaps required for all UFSHCI controllers?

Thanks,

Bart.



