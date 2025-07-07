Return-Path: <linux-arm-msm+bounces-63952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A89AFBD38
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 23:09:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 839BF1AA589B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 21:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6497285C87;
	Mon,  7 Jul 2025 21:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="c79jGM2o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AD42857C6;
	Mon,  7 Jul 2025 21:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751922584; cv=none; b=kgHSiHbZZt25doMQEkxXHwR7iOaVhSUl7bfpk3OR44Dn87jCv+6XCStelYKjqOanQehq9CHxQafozKFgtkP11adFkuorkJ001zi/Um82OB1oE+7M0iL3ySYTblX8Elq6KoUgXcrKU7np8jPjapcAe8Px7pBhBo9EOka/98yA86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751922584; c=relaxed/simple;
	bh=KR3L9g3pCadHfqpRPsb15XaHk4wdhh99Q+TWkMSZl/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qqws4aPPDMOY+5oyeNuzGJaWupMDuHoZevOayUF3Y5UDBdlGCoVxj0/Uqjebxg9z8a9byquM9RwqacAmqnx68DmZYqU4DEnruYxpNNOF4IAcLdELe7wtBDKCt+o4V+mlmufitdumlWUlOqolIHKEK9MWX93XuAi/+BJEa9TgaWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=c79jGM2o; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bbcLs6GLqzlv4VM;
	Mon,  7 Jul 2025 21:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751922579; x=1754514580; bh=dRfytkfle3F/Uu3PA6L0oggv
	NxFFAgHeETxJSpCAi1s=; b=c79jGM2olG7mWvn6DDmGIxS8rNxa0xTPXlbYZjol
	dJ2OwrZWT0YQQGDrdtVE86tnoJSPlIEiWGK8/ANnj/tdzhuJ1NQOyFcLd8pk7jhD
	OR2NDx8XDgKhaz5eoAxG2j+497U+7kO2lKHet7URzw6aD3fneNd4IyA926PMLugQ
	Mz5AAjXs7tR7L9qMnLt/kMZtMsTAlQLxyarztfNM6Q2gNQFOjH49JkvsFlrUFkEA
	Y6268W78sFoNCSS4pqOnu1F6+hAsG7RjZTNd+kGFzkFmv6L/6zclfC1oOG/8ONn8
	yCBsIIwK/kpjLFQ0vLojXLcRkWZVgG882WxZLBY3Pp9yag==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xlLesTVfmTtE; Mon,  7 Jul 2025 21:09:39 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bbcLh3bC2zlgqVr;
	Mon,  7 Jul 2025 21:09:31 +0000 (UTC)
Message-ID: <39018410-4208-4ab6-bf74-7dbd32bdd10a@acm.org>
Date: Mon, 7 Jul 2025 14:09:30 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] scsi: ufs: core: Add ufshcd_dme_rmw to modify DME
 attributes
To: Nitin Rawat <quic_nitirawa@quicinc.com>, mani@kernel.org,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 avri.altman@wdc.com, ebiggers@google.com, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <20250707210300.561-1-quic_nitirawa@quicinc.com>
 <20250707210300.561-3-quic_nitirawa@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250707210300.561-3-quic_nitirawa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/7/25 2:02 PM, Nitin Rawat wrote:
> +/**
> + * ufshcd_dme_rmw - get modify set a dme attribute
> + * @hba - per adapter instance
> + * @mask - mask to apply on read value
> + * @val - actual value to write
> + * @attr - dme attribute
> + */
> +static inline int ufshcd_dme_rmw(struct ufs_hba *hba, u32 mask,
> +				 u32 val, u32 attr)
> +{
> +	u32 cfg = 0;
> +	int err = 0;

I don't think that it is necessary to zero-initialize 'err' because the
next statement overwrites the value of 'err'.

> +
> +	err = ufshcd_dme_get(hba, UIC_ARG_MIB(attr), &cfg);
> +	if (err)
> +		goto out;
> +
> +	cfg &= ~mask;
> +	cfg |= (val & mask);
> +
> +	err = ufshcd_dme_set(hba, UIC_ARG_MIB(attr), cfg);
> +
> +out:
> +	return err;
> +}
Since this code is not performance-critical, please move the function
definition into source file ufshcd.c.

Thanks,

Bart.

