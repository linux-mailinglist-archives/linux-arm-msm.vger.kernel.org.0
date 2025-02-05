Return-Path: <linux-arm-msm+bounces-46967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217C8A2984B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:03:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 822763A7DF9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:03:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A69A1FC113;
	Wed,  5 Feb 2025 18:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="T1g2ZbHa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C317083A;
	Wed,  5 Feb 2025 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778625; cv=none; b=VNTLsTlutYQvBJ92ELK+DYWo+Y8CKrKTob54F1sPAM0+talch8kVPdnBDQef5/IrXIBfchhguiXKgA4D+XYskHddNGWfYLOG+KzgMmv5ql7Ibp46GMJW0ZEKZgIsfwdJ1H1oC9lvf8RV0+wcyuYYfeO6/KwHuhcH6JOU/701BWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778625; c=relaxed/simple;
	bh=royuI/E+7leT2Uq1SjjqB0KrM6PlHd1SLtHhwujCYDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A8x2p1Aop42mHk9k/NSnFx0r/o4bRw3Um+fAWQPJ8E9Nxg8jMgVdvqEhbcC52pSeVeitV0EQh5uJhyBeYdCSXabeEjglc+vMAX5R9nEexfdZg3WvqSsNfug5Im5B4jJSMk0xgFShWvuj/SI7/wykCasJ5yZAZ8Knk9+xgS33kFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=T1g2ZbHa; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yp7QR2GCzzlgTwJ;
	Wed,  5 Feb 2025 18:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738778615; x=1741370616; bh=royuI/E+7leT2Uq1SjjqB0Kr
	M6PlHd1SLtHhwujCYDI=; b=T1g2ZbHaVlHj8gaqiJDjU71IGT/fHUimDgWqxTNQ
	5gcQYBNE1b4wbRS/Aapext53euk4LCW30c4OUZvzzvpdLSn/lz5RXiiyg/kdXVbf
	jzRVSVc0Ie9p7Upu4lzsGuHAQijlqGloQlH2eRVl42tVF+h9NPc9CBzEyiOmh5/3
	EnLR3R+H5X8JpptNhp4OOGUIwPRoHKVMggO+8kb+yY6UnP9vsIfRuv/VHx5Pulfy
	FPmD1TqbYbVtTrxKuJ715wy6A0xIQ5nmeNiey7dobWv0ENj2oO2cd03RJnFc3ReE
	ox8+ErwXIUcx3biAHNKbcBu1eZBlvTTMhWfOFIl2p18Tvg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id u5OM-VCt7SVa; Wed,  5 Feb 2025 18:03:35 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7Q76WkzzlgTw2;
	Wed,  5 Feb 2025 18:03:27 +0000 (UTC)
Message-ID: <8eb1563d-b2a4-41e5-ace1-7632cdf71d30@acm.org>
Date: Wed, 5 Feb 2025 10:03:26 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] scsi: ufs: core: Add a vop to map clock frequency
 to gear speed
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
 Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <20250203081109.1614395-4-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-4-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 12:11 AM, Ziqi Chen wrote:
> Add a vop to map UFS host controller clock frequencies to the maximum
> supported UFS high speed gear speeds. During clock scaling, we can map the
> target clock frequency, demanded by devfreq, to the maximum supported gear
> speed, so that devfreq can scale the gear to the highest gear speed
> supported at the target clock frequency, instead of just scaling up/down
> the gear between the min and max gear speeds.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

