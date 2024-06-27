Return-Path: <linux-arm-msm+bounces-24515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D761E91ACEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 18:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A45F1C20BC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 16:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A37B01993A9;
	Thu, 27 Jun 2024 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="SMp24Mxu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F4519754D;
	Thu, 27 Jun 2024 16:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719506191; cv=none; b=ns8dOTURKGcWme9lCLrKRHLD2NjKAitGDUf7okv3DhLp5NZn1DqD/SQWqIOL+hvSq+mmRrvE9x/yAxIUHER8Vn2F2EcuPGE23BJVrOCGxe4EjdgAEJ4t5laM5C/je53kAwIHwRUGRsYTMd+aiYEgw/nYQ8QBLncAn6ly+hO9mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719506191; c=relaxed/simple;
	bh=Xlb8JpKDef6O0O8CZb72geLLbQ39bVwYYg/GCwPmj0c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G5ws9pV2DUqrrsckiDE74KovnaSGZzTMx46FMUz/FCzOhxzaz7gi3gWAZFg1B2P0ZIVj8C7PflvdozdDtReDJO0GQV5eU1nIKH9lsnHYUqYQA+b38h3nAGu5q8oIlt2f6LidW0K4/HG70kJaC0rdA5YJJwGI9zpHNjYJyI7Brg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=SMp24Mxu; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4W942j4H7dz6Cnv3g;
	Thu, 27 Jun 2024 16:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1719506184; x=1722098185; bh=uGZuyqH+Y1kAAIZS0KDXO8d/
	1BuydkxnPixFAb8HbPI=; b=SMp24MxuX735UDT0vSYSozv8GwnpygdMgj1df8E+
	VxVo/JWXxXlG/SnIWfTAlYZJN4uJD0BPHtuqOwkjIx9PG3Pd7rXxLlC7EbiTiHag
	hk3hzb1IA6TdU/5ND88kQahiJjPSs/xse9TfOBEtoyMpwCSQsU6oKljp5u7ZKatb
	J4539HqAwhaaIhJ8hHboWU88db2hc1BohEbnU9K2t3eK/9jRDHT8FH2V7rTep9fg
	rrEv+m/rCO1JnkS4LnM186jQX0aWMJInc7YP5HLwhLXEM0MS4J9OWspQfpGmK6B/
	j9S5RWo1xJzlpS2+f54rHBey97k+P29YSrWITPqx2XA+TQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id mLZED6yliAmK; Thu, 27 Jun 2024 16:36:24 +0000 (UTC)
Received: from [100.125.79.228] (unknown [104.132.1.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4W942b1h2gz6Cnv3Q;
	Thu, 27 Jun 2024 16:36:22 +0000 (UTC)
Message-ID: <036f0300-e55f-4f12-a416-93f54be025a8@acm.org>
Date: Thu, 27 Jun 2024 09:36:22 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 0/2] Suspend clk scaling when there is no request
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_cang@quicinc.com,
 quic_nguyenb@quicinc.com, quic_pragalla@quicinc.com,
 quic_nitirawa@quicinc.com
References: <20240627083756.25340-1-quic_rampraka@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240627083756.25340-1-quic_rampraka@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/24 1:37 AM, Ram Prakash Gupta wrote:
> Changes since V1:
> 	- Address minor review comment.

This is too vague. Please be more specific in patch changelogs.

Thanks,

Bart.


