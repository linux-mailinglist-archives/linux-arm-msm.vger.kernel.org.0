Return-Path: <linux-arm-msm+bounces-70916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0A1B36DEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 17:37:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44074361DCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 15:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6879F2C1596;
	Tue, 26 Aug 2025 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="bYCicNHc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 004.mia.mailroute.net (004.mia.mailroute.net [199.89.3.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C505C275846;
	Tue, 26 Aug 2025 15:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222646; cv=none; b=h5HiafqqfgZwfz/7NvrKy15IWh0x0YJ0IrgJS4oowmyRMfitrvbw8QMEAnVvFGKP0s1QNb5RLBmz/+H2dDlSCUs6PWMgV2I8hGTGePKHJnwDCyC2cTzCu9eH5IL5JZDdwZZMnx1A60aziBZVN8Z5WznTxA3qANcaQmGQqfoL5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222646; c=relaxed/simple;
	bh=p5Ia2UkL1gSkUpVbyg44R0xxKioiOVXdPhRaJnyPKKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmH/DOD0Gt3XQGLj13Wj4xCxtPU0JWFi593OydMHMfcaspCTGDQYrG5liCYCJfVun9aVb4a6OhDpbwzDigbR34Z/bCxvsqHJvUEIhnlTXHjnCLYLVw2ZyRrhoTa3N2mCJUSbRzJ0ugNnf6zFjikA4rGUJaVvEMx2EB88byP3Khk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=bYCicNHc; arc=none smtp.client-ip=199.89.3.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cBBcM6FRTzm0xkM;
	Tue, 26 Aug 2025 15:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1756222641; x=1758814642; bh=Aty5rBS8ib98Ag2efoWSBCwL
	80kil2PQtshbYyKaoJs=; b=bYCicNHcB4CRxzTtHu+to111Wa4NfJcLDX5hk353
	NqIeoqKHFkgH2s6CcbFgtxGlt5bQTrSudmixhfSyJqT76uHhK9UeIwl6EFHwLK+e
	6dr9VJ3vf6z53QumY7nlBzacSFsaxwzDRi3hr+hxA0TEw16MuDB9cFPRwlrEUcZH
	G5aUf3vJ5FbYekLcEOqMcBZimgYrsM6vulPrrWo9tDMj0YWghMf8DuX2y7WuJQb3
	5HNRXCuPvSoiXiKTaR+NFUtbqssfMuVD8LYJjNGt83IVlWip34brUecyFJYoBPJP
	oHw5OZjNfMLsXlSZWB4msjcUIvL1FiGi3tkeMPi8QP+z9g==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id PAwBTlCF_ECP; Tue, 26 Aug 2025 15:37:21 +0000 (UTC)
Received: from [172.20.6.188] (unknown [208.98.210.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cBBc76jw6zm174K;
	Tue, 26 Aug 2025 15:37:10 +0000 (UTC)
Message-ID: <db0a8b86-b048-489b-9b23-6987f48e9419@acm.org>
Date: Tue, 26 Aug 2025 08:37:10 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 4/4] ufs: ufs-qcom: Add support for limiting HS gear
 and rate
To: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, mani@kernel.org, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250826150855.7725-1-quic_rdwivedi@quicinc.com>
 <20250826150855.7725-5-quic_rdwivedi@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250826150855.7725-5-quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/25 8:08 AM, Ram Kumar Dwivedi wrote:
> +	if (host_params->hs_tx_gear != hs_gear_old) {
> +		host->phy_gear = host_params->hs_tx_gear;
> +	}

The recommended style in Linux kernel code is not to surround single
statements with braces.

Thanks,

Bart.

