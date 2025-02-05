Return-Path: <linux-arm-msm+bounces-46968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8373A29856
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:05:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E3403A564E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E2A01FCCE1;
	Wed,  5 Feb 2025 18:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="SoGQU0Gz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80621FC0F7;
	Wed,  5 Feb 2025 18:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778696; cv=none; b=S8D1DJvsAb/8gudBiZzmu0B+OQaW48KmezcJDmmWYaLKCF1+qEV3qsrlZIVOAauFOToLNCsgtrOJn9s+EuU2Om+BPQdPSUXVShIZyJJO9SEDH0NOtNuFSxR4+nXRHIBffimFZ0SxPY3l2L7ZdW60tX0SCK0Oy9GSXBjX6MC3VqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778696; c=relaxed/simple;
	bh=mib2IK1k+7/K3RM8nAY15DoDsvvRPTx4E2ZcPHuXSIE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFh70s7bffhnBHNLmJxqxM4CLFrUE52cAYJlq4DdgVWY2zI3pi7C0emBXXx7dWoZGo/vCMAG6HoZOWZlgkxScUeWOypltOxyjeXAo5IUNTnWqoWNzNqmYYKfTMW6oEdHvugG6OCuJ7VhEUP7g0jzkGyFimNgkKbYc+Zwx5x+/aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=SoGQU0Gz; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yp7Rp2CJ0zlgTwJ;
	Wed,  5 Feb 2025 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738778688; x=1741370689; bh=mib2IK1k+7/K3RM8nAY15DoD
	svvRPTx4E2ZcPHuXSIE=; b=SoGQU0GzqBq3EGg3J6jxQQ9wUCmkYI2txr4mb9c/
	iHSv1GVNuchbk6s6HO8gduhMj9zApY0LI5CyJB+xK412UI27Oq9glI8JgpZFayEu
	9eEmzKHFQW+P5ThBlit9SPDZfFTHBfTEV5VMys/hvGB79zoClOxhL0eF5ilna31j
	Q7KH3Xc2AQpDRmXDATrfYsqnX+vnCWwG6kscgMD3lHq5MKuSJY9kqz0tIoLL8BEL
	G375wsem9SxEoJaKWdUdaBKnVOfzb5Reua6brttcOmD3vBJhIaACPFRYOa/dsn73
	vnnOcoqyPMYe5kt9Za1ztrTBZVK2VS9BCHqmejbFzVsX3Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id dH8zj7JU7UDo; Wed,  5 Feb 2025 18:04:48 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7RY55RBzlgTw2;
	Wed,  5 Feb 2025 18:04:40 +0000 (UTC)
Message-ID: <f551c5ce-5f9c-4893-8de5-d646145eb0e7@acm.org>
Date: Wed, 5 Feb 2025 10:04:39 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] scsi: ufs: core: Enable multi-level gear scaling
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
 open list <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-6-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-6-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 12:11 AM, Ziqi Chen wrote:
> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
> plans. However, the gear speed is only toggled between min and max during
> clock scaling. Enable multi-level gear scaling by mapping clock frequencies
> to gear speeds, so that when devfreq scales clock frequencies we can put
> the UFS link at the appropraite gear speeds accordingly.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

