Return-Path: <linux-arm-msm+bounces-41815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FC9EFA15
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 18:57:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658941899C8E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA601215798;
	Thu, 12 Dec 2024 17:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="DRcEbENb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05212080D9;
	Thu, 12 Dec 2024 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734025918; cv=none; b=eQ32JYlflhVZ2jtRGS8h5LB3OfHxhBanEUMSoen2XuvHL4A7XfjObnsvPtrQukmjfSFj+i6yuQae2W7kyH2hnLidLZaatwQKyGTKzJ99G5k3gntzyKPZUv73LyFg4/2DGlblsXuijdhE9hPZxym5Ztpg1CbIemYUsTQXeuFWFWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734025918; c=relaxed/simple;
	bh=37De6D9LQ7LcziRlzSJ395yH/xzhUwZrp0FvITUNjDA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUKgLmr3abN2Lz5Wnk+S86UjiBSquBVxjASNfBiiJ0c98CMEZLZumARd5aNFr28l4/PwW6PP9tw92X5gCWxdR1XxaUCj+Val9yi1PH/IUVajPl3xaK6FpEcPFtOmhMkFhruPo4O1LmQr9K4QthshIVmvevDGgmb+hAjV95n00nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=DRcEbENb; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Y8KmD1sVDzlff0N;
	Thu, 12 Dec 2024 17:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1734025910; x=1736617911; bh=tds9zeWQEmz0GeQ0VraJwgrh
	HE7qE6Q6NGyFq0XBSbQ=; b=DRcEbENbmFV3uTHubYjJOW1PrBdr/4BGwbQtxuXY
	IqTlJBXgvQhJMSpWMMvg4PrjEo3kF44Nmhv2OYXYMBSEJMliPV294y0rfeNIFBKQ
	CmEuak5SV8hSpRDz9s61SqRMDrqFW2kEj9winVTXAKlZblbKMZbc38l69UUkvbJN
	0b2rFT7l3nsOcTVYWaijVO4OwiBGHJAGdmZlg2cF606ihWuLUjufhrxprVSSMiYY
	LZRUQgHUQRS5AecSAmXPKZ8ddPv5BVFdxVRwALIJc5P2YauAm/RuhCtiDUIwQaIo
	r2S/XZeP4XLbrJhrt5MvXR40gHOZ78i5j0YdCie4v9xerQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 8EDkbcjNz0Ah; Thu, 12 Dec 2024 17:51:50 +0000 (UTC)
Received: from [100.118.141.249] (unknown [104.135.204.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Y8Klz1Z48zlff0D;
	Thu, 12 Dec 2024 17:51:42 +0000 (UTC)
Message-ID: <8511253c-d496-4c87-9625-bcaefa440c64@acm.org>
Date: Thu, 12 Dec 2024 09:51:40 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] scsi: ufs: qcom: Suspend fixes
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>,
 Nitin Rawat <quic_nitirawa@quicinc.com>, stable@vger.kernel.org,
 Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20241211-ufs-qcom-suspend-fix-v1-0-83ebbde76b1c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 9:40 AM, Manivannan Sadhasivam via B4 Relay wrote:
> This series fixes the several suspend issues on Qcom platforms. Patch 1 fixes
> the resume failure with spm_lvl=5 suspend on most of the Qcom platforms. For
> this patch, I couldn't figure out the exact commit that caused the issue. So I
> used the commit that introduced reinit support as a placeholder.
> 
> Patch 3 fixes the suspend issue on SM8550 and SM8650 platforms where UFS
> PHY retention is not supported. Hence the default spm_lvl=3 suspend fails. So
> this patch configures spm_lvl=5 as the default suspend level to force UFSHC/
> device powerdown during suspend. This supersedes the previous series [1] that
> tried to fix the issue in clock drivers.

If Avri's comment is addressed, feel free to add my reviewed-by to this
series.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

