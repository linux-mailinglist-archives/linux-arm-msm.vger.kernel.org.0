Return-Path: <linux-arm-msm+bounces-28653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2CE953996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 050B6286930
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:02:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF7938FB0;
	Thu, 15 Aug 2024 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="nOYyU/HV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEBE56B72;
	Thu, 15 Aug 2024 18:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723744916; cv=none; b=NzFeIwZNoT+3FGFkSqf7cGftYa6sYR+LlxIaLEZi01msRLcvW56FSQLT5z//+pM67e14YfuDwgyw2nGsUp/zGva/AnqaygbxUbv1DPS6aAMhrgDtC2tDAB3PnLLtbkprCG5X6nBbuSxYI0Mjmm/3M/SZ5ObP5BiyS8YazprIitc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723744916; c=relaxed/simple;
	bh=HYwfMo0K/Gt9iYOzLfHZ6D1SREPEGKGNLO4RLOGH448=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFmOcPPLqdDuRtyTuyb5Ig3jdlLa84pUgcH1egod6cMqcdorOBiomBe0849bfTyLdaMUMIcuYPNGfxGAW6iXzuYHWJ9tZn7Cr65zVhtI2CjZ12TR02tdyL3rIJjuPjeTLbzYwq2nqH+STRkNkrznxw7AaB8UidrQInuLN3hHQUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=nOYyU/HV; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4WlCcd513QzlgMVQ;
	Thu, 15 Aug 2024 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723744910; x=1726336911; bh=yT0RqXodjMAtgIiWhthhECrz
	n6cjcaKOeoiwa/p789M=; b=nOYyU/HVWTYijWZkbjq4O03aRXDq8dTMrPGH8TLp
	EfhpVSg6GISdUpXU+JLqGzgVlVEYkfWRCHO0yAYcVgz6k+IutSDpZ1SxpnxWbtmu
	ISb02KjCwWzZFEnmwOAWIE2Yb+HqFTq7t7AgdfN9UsIQwNuPDW1hKPWlqhr2/dpn
	hP6+x7rw+AVtANx8HmcT56kutiNFdlFrCb+MQETQ3/k0cwRnzBG7F+WCiaZWDxWD
	8oRy4BlxfYPSCaNJOFDDxmHI1siZfY5H+gvGislTgkwd2+JIP63zKswIjL5H4/tO
	iJwyff+57o15JJ154I4A8+cTGn8gfuMGyz0OY0TvjbPMZQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 7GMJuFi0ha6k; Thu, 15 Aug 2024 18:01:50 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4WlCcX63cSzlgT1H;
	Thu, 15 Aug 2024 18:01:48 +0000 (UTC)
Message-ID: <4b24453a-3f4e-4707-8c3a-2dbb0040281d@acm.org>
Date: Thu, 15 Aug 2024 11:01:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] ufs: qcom: Add UFSHCD_QUIRK_BROKEN_LSDBS_CAP for
 SM8550 SoC
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-3-b373afae888f@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240815-ufs-bug-fix-v2-3-b373afae888f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> SM8550 SoC supports the UFSHCI 3.0 spec, but it reports a bogus value of
> 1 in the reserved 'Legacy Queue & Single Doorbell Support (LSDBS)' field of
> the Controller Capabilities register. This field is supposed to read 0 as
> per the spec.
> 
> But starting with commit 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap
> when !mcq"), ufshcd driver is now relying on the LSDBS field to decide when
> to use the legacy doorbell mode if MCQ is not supported. And this ends up
> breaking UFS on SM8550:
> 
> ufshcd-qcom 1d84000.ufs: ufshcd_init: failed to initialize (legacy doorbell mode not supported)
> ufshcd-qcom 1d84000.ufs: error -EINVAL: Initialization failed with error -22
> 
> So use the UFSHCD_QUIRK_BROKEN_LSDBS_CAP quirk for SM8550 SoC so that the
> ufshcd driver could use legacy doorbell mode correctly.
> 
> Fixes: 0c60eb0cc320 ("scsi: ufs: core: Check LSDBS cap when !mcq")

Since this patch depends on the previous two patches, the previous two
patches probably need a "Cc: stable" tag. Otherwise the stable
maintainers will have a hard time figuring out which patches this patch
depends on.

Since this patch by itself looks good to me:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


