Return-Path: <linux-arm-msm+bounces-46969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF657A29859
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 19:05:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5113A7DAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2025 18:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00231FC113;
	Wed,  5 Feb 2025 18:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="Jn3gehq4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557421A83ED;
	Wed,  5 Feb 2025 18:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738778730; cv=none; b=KYsn/9JkgeAtgKTbkaVz5ak1Sy2zKmoWMX+fMALuk14wWPNDXqlfURcC0D5RR9H7G/MLYPkduw03qppYOyrhZvW3kcQV5kBfXvH+uAx2KgrCiMPIr5pdr6Hwrggx0OnphUFYD8w7Gp/NEWqzX0DXe/1dwQFiTxUoJre3eothgrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738778730; c=relaxed/simple;
	bh=u9THNJNlK4Ig8rbMdkTFRiv/3uggXcjrIU/zvweJiQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUbhJFqLMVV6AZnvmlo68Zx03GMs+k/CdTyp6gNccvUFqTsYFIbr+vuN087FkRSoe32ewo9kE+bF7K/xTq/Qj2CakvkFu+44m/ZgQt3lJDAGCN3XXoXWmnW60oEG1Ec0lavXmzT3JwL942KRyrWKwFzwBCrPVullDwb+Hkg7bI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=Jn3gehq4; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yp7SS5JXSzlgTwJ;
	Wed,  5 Feb 2025 18:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738778721; x=1741370722; bh=1+ByGhU6PxT7HAAh+0cFTdT9
	w9cJ2p3K1b66s2diWiM=; b=Jn3gehq4h+2i3IDxXFq57//DZwt22v1w97Xyd0Kt
	1E11yyErdyzfYLtXqSRq6jRfeOpO3oxrtDbMFAMVJSl0NbFISBjI9kwXSdmpqLJJ
	sHLFm4LZlmxTME4NWRoL+FN6PT/s8uXtOjf1rL4KD9G7tdFqtA0d4DS1G+Pv7xQW
	Gqip36tvC6B1zikv4kXdgEwqnj73zwAs17TgxWTCy7+wjc5/lsw9GSBTrcbtvkbf
	HZblQ0mY0n4WxYAyU75LweLzoJJ11qIJq1Rd48OuIp9DMVqnKlrj5yWlb7UjdC51
	JHX510JdzJeK1ZQ1qmJNL8NeZtX5Eg4jsrkfQ64gpNDaZQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id EwRptKSezPrN; Wed,  5 Feb 2025 18:05:21 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Yp7SB5cRyzlgTw2;
	Wed,  5 Feb 2025 18:05:14 +0000 (UTC)
Message-ID: <22e97196-5828-4c7f-8e95-4865bf24612c@acm.org>
Date: Wed, 5 Feb 2025 10:05:13 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/8] scsi: ufs: core: Check if scaling up is required
 when disable clkscale
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
 <20250203081109.1614395-7-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250203081109.1614395-7-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/3/25 12:11 AM, Ziqi Chen wrote:
> When disabling clkscale via the clkscale_enable sysfs entry, UFS driver
> shall perform scaling up once regardless. Check if scaling up is required
> or not first to avoid repetitive work.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
> ---
>   drivers/ufs/core/ufshcd.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index ebab897080a6..bd93119a177d 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -1777,6 +1777,10 @@ static ssize_t ufshcd_clkscale_enable_store(struct device *dev,
>   	freq = clki->max_freq;
>   
>   	ufshcd_suspend_clkscaling(hba);
> +
> +	if (!ufshcd_is_devfreq_scaling_required(hba, freq, true))
> +		goto out_rel;
> +
>   	err = ufshcd_devfreq_scale(hba, freq, true);
>   	if (err)
>   		dev_err(hba->dev, "%s: failed to scale clocks up %d\n",

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

