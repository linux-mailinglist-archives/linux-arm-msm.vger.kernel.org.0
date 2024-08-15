Return-Path: <linux-arm-msm+bounces-28658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F27049539EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 20:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68131B23E7C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2024 18:25:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87FF4AEE9;
	Thu, 15 Aug 2024 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="AAk7gSyn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C9558BC;
	Thu, 15 Aug 2024 18:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746346; cv=none; b=USXXi7WvAbSOo+V1Wd20ET6s8VeRiHusMnN1Aoa+FTB9PVFq61WWvp8DY339FwpNJJ7tsO1tZUpfBmk1LE7D+hqxadhIQxtdMq32nFltdQnXMe3hy1DOcFvabSAXTg54xxFki2rdvpot/XREqTHgJZZKkmj3A6fZ/OEVFgo7oBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746346; c=relaxed/simple;
	bh=Ee4cFjfTg0tyq+RqSc6hp2lZ7U3JqxVr+2hZnz0S3jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzs4K5/SPH0G5kmsAQfh7+yKtCUsG1fKyNQQT06FAr8L9lkR4dDwnfx/tfHtBEoF1RXGfr/sgndMr/quq1uicM8c/1Yp6z0unTPT50pkqDk2NeiAphIoDofVHUzv8lj7gqOwlfKcGPGMXFa0y+p9A8HnyddtKY3jPTipmmXx7kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=AAk7gSyn; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4WlD881W4Nz6ClY8v;
	Thu, 15 Aug 2024 18:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1723746340; x=1726338341; bh=hE3VaP3ma4aR3hEOxamWB+Wb
	Z/BvUIw0sNIopWlbDao=; b=AAk7gSynSLdGv1aLnWJrVsDoETx4s6v71WBTUMny
	yeWXlR3tXbiJ1GgUeH0UD8IxK7bv41s7ErfVRgq+fasowouE1PEbSM8yXTjBrhIq
	XERaE6oQMR7F+JRIjK87nkdzsDydO2cTJbfxdSbWGyqBCerToW3f94nlr4Wbn6Dq
	9MvWl1s0q7yrJ+CHmVLATnUp3tCvL1D/2sVmlcKVqepvZ9JO9eKYIyUVsZ777FMt
	nMRGpCjWEW7ejCAD7crpDStr252kX700SgG0X7JLb6Ttdm33T8TSwS+RzNU3vEVF
	xDWI9XzBie8ft/NgZW/q10mrRoxXq/Awmc1Eo+DmejSwVg==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 0IzBVFWc3UJY; Thu, 15 Aug 2024 18:25:40 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4WlD8316W5z6ClY8s;
	Thu, 15 Aug 2024 18:25:38 +0000 (UTC)
Message-ID: <f79a87ba-4d2d-42f0-ab94-1e6821a482f2@acm.org>
Date: Thu, 15 Aug 2024 11:25:38 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ufs: core: Add a quirk for handling broken LSDBS
 field in controller capabilities register
To: manivannan.sadhasivam@linaro.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Kyoungrul Kim <k831.kim@samsung.com>,
 Amit Pundir <amit.pundir@linaro.org>
References: <20240815-ufs-bug-fix-v2-0-b373afae888f@linaro.org>
 <20240815-ufs-bug-fix-v2-2-b373afae888f@linaro.org>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20240815-ufs-bug-fix-v2-2-b373afae888f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/14/24 10:16 PM, Manivannan Sadhasivam via B4 Relay wrote:
> diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
> index 0b1787074215..8c9ff8696bcd 100644
> --- a/drivers/ufs/core/ufshcd.c
> +++ b/drivers/ufs/core/ufshcd.c
> @@ -2426,7 +2426,11 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
>   	 * 0h: legacy single doorbell support is available
>   	 * 1h: indicate that legacy single doorbell support has been removed
>   	 */
> -	hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
> +	if (!(hba->quirks & UFSHCD_QUIRK_BROKEN_LSDBS_CAP))
> +		hba->lsdbs_sup = !FIELD_GET(MASK_LSDBS_SUPPORT, hba->capabilities);
> +	else
> +		hba->lsdbs_sup = true;
> +
>   	if (!hba->mcq_sup)
>   		return 0;

An additional question: since the next patch only sets
UFSHCD_QUIRK_BROKEN_LSDBS_CAP for a board with a UFSHCI 3.0 controller,
do we really need the new quirk or can we replace the "!(hba->quirks &
UFSHCD_QUIRK_BROKEN_LSDBS_CAP)" test with a test that verifies that the
UFSHCI controller implements version 4.0 or later of the specification?

Thanks,

Bart.


