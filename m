Return-Path: <linux-arm-msm+bounces-42568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BF9F5033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 17:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C308016EC38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 16:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2261F76D5;
	Tue, 17 Dec 2024 15:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="RLKcZU7N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A121F8686;
	Tue, 17 Dec 2024 15:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450390; cv=none; b=Rjis6DCotfkSjQkW+VKibjKAc0FKVqNnC6uLvZ/t9C/5rGkk9M7A24izBoJOHIfk6lHIuA55ur9rNv7O33uv8Yp8ATScRsELZUf5oZsgNv6dbjlYU+QTsqYaVpYCWGlrUSXNsjzcwPhE+jX/F1HlBsbqdotDBrO1JWbvu3/NUvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450390; c=relaxed/simple;
	bh=i3HZyCNbTXfNbrY9ue4rrP2IEcvJUdMDkeKXosjtXgc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OiXObRt4k8xQhqEP+XqxWNvIL8riQ2r0FJSLnCiUU2Jj0bU7oueEBSHagEw6TKrYkrs+K10TQpJGMQSjRMRQ2Z5SEP9yz61XhWbyTCNom7STZURuF6wk7NRqbs0olIprynbQ9i32jpi9g92XtPAtDn6Titg6/pUmKQTnySKhU2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=RLKcZU7N; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YCLl75Pzcz6ClY8q;
	Tue, 17 Dec 2024 15:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1734450383; x=1737042384; bh=0IS9ZN1KJIudBiEPKF1EIXwM
	b6EIL7imS4BeeV9L3es=; b=RLKcZU7NAQhKKsOY0C+h/BeP/TLwvAKzIG4GXjy2
	lBFDE5WalvCTdfdcIFBDHkDwDvb/4EYowsJG5YWu79wj3XgwHZkA6kIyOIfU3ZGr
	SGk3d2jjEdztiVqV6vIUqRE2vHBjEKNjCB/KmT3zBF/co0lEccN71YODY5TPDDY/
	0o65cTpXou+EV/pm2dP0F2T76yvln2UMj6ExMw86wNRXVmgFNJTxruzprL30fSKd
	UqvIOSqr2nqzi6w+SDSytTM1fHhZNTomp53jvnH3hon1WwfL7KLSnmEfJ7xH3U/l
	PYzttL8LB1CqS55bOynCT3nsUpqbNgiE61m0h2h9tdpCyg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id timUKC8oMTww; Tue, 17 Dec 2024 15:46:23 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YCLky6shnz6ClbJ9;
	Tue, 17 Dec 2024 15:46:18 +0000 (UTC)
Message-ID: <65f95b01-8d2d-4e03-88a2-c501379f21ea@acm.org>
Date: Tue, 17 Dec 2024 07:46:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3] scsi: ufs: qcom: Enable UFS Shared ICE Feature
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
 manivannan.sadhasivam@linaro.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20241217144059.30693-1-quic_rdwivedi@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241217144059.30693-1-quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/17/24 6:40 AM, Ram Kumar Dwivedi wrote:
> +	unsigned int val[4] = { NUM_RX_R1W0, NUM_TX_R0W1, NUM_RX_R1W1, NUM_TX_R1W1 };
> +	unsigned int config;
> +
> +	if (!is_ice_config_supported(host))
> +		return;
> +
> +	config = val[0] | (val[1] << 8) | (val[2] << 16) | (val[3] << 24);

Has it been considered to change the data type of val[] from unsigned 
int into u8 or uint8_t? That would allow to use get_unaligned_le32() 
instead of the above bit-shift expression. Additionally, why has 
'config' been declared as 'int' instead of 'u32'?

Thanks,

Bart.

