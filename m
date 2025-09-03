Return-Path: <linux-arm-msm+bounces-71905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B6DB42574
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 17:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 317F31BC59E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 15:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E11DC242D76;
	Wed,  3 Sep 2025 15:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="ggEDovCQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED02E242D79;
	Wed,  3 Sep 2025 15:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913071; cv=none; b=oI/+yelz5Mc9gB8VmqJUtYfYlzkz10raNJjBIhJuJorNJCR9p1JQpDYovKdyVLTGa4UinJaPtEJfQVUWHWnxgd7zy7EUxbit0N6xjD/3qMikApoiEh8nCRJehtaIq3QtEfnU5Ab/mvQVWo8ykXreBKtfU1h1oVkTYnf7hIiUGG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913071; c=relaxed/simple;
	bh=FxY/B3joJwzgE3MTshI81Hc0PBEC9CCnkCfZIQGLlV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aRBEQuZrBb+ITNrKIU/H5/urIWA3EeAuOx0reUl2UVV8dj8G4Rp9DeNtNJpNzRbIzZCfaCCxx/MUZ0y8ejFGyjQGw/+aEYTckT19c2klFW3MF5qYhRT5iHpXkBBV4b7Er5EwPy9hNHmFRAM9vmAmRvUDHgJQq9e5G1XInankzOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=ggEDovCQ; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4cH5xk5Vn9zlgqTt;
	Wed,  3 Sep 2025 15:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756913061; x=1759505062; bh=FxY/B3joJwzgE3MTshI81Hc0
	PBEC9CCnkCfZIQGLlV4=; b=ggEDovCQyZk8/OPfahi+yLu2+F0d46bmEy6UWDq/
	ZlM9NJcivRWqhjCCt1Edqmvnt6wIoI6sBhLzXL3oQ7uJipi8o5VUzCmbRsuHl8t5
	USWzaEGrExVYgs2jQCra4yYOJ2hIXKHTnd1usD9tp995L83pvZ5uXAnU/VK8lvXo
	6nvO+CS111oN3Pg3opheAlt/EF1MsLJ/dul8Y/7SNRMJck4qgV3bOG8NZ+A817/y
	hqFstDLyXSPuFNI9uiee5Z3DaMIekVcqAFa7kzusnXjYbQj4xahleWf7KuCMhmbp
	YdL6ySasPxdlghkQTcI8dkNNFFieWdIO1Qi4WROSMb0A+w==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id LbHSZd9B7zNe; Wed,  3 Sep 2025 15:24:21 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4cH5xQ0Dx0zlgqV9;
	Wed,  3 Sep 2025 15:24:08 +0000 (UTC)
Message-ID: <c20dda3b-dac3-45d4-8552-bc420ae2af5f@acm.org>
Date: Wed, 3 Sep 2025 08:24:07 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 2/2] ufs: ufs-qcom: Refactor MCQ register dump logic
To: Nitin Rawat <nitin.rawat@oss.qualcomm.com>, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nitin Rawat <quic_nitirawa@quicinc.com>
References: <20250903074815.8176-1-nitin.rawat@oss.qualcomm.com>
 <20250903074815.8176-3-nitin.rawat@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250903074815.8176-3-nitin.rawat@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/3/25 12:48 AM, Nitin Rawat wrote:
> Refactor MCQ register dump to align with the new resource mapping.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

