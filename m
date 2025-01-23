Return-Path: <linux-arm-msm+bounces-46004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1FA1A93D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 18:51:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9683ACA7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 17:50:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E1431C549E;
	Thu, 23 Jan 2025 17:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="mjgcItbL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4771BD9E7;
	Thu, 23 Jan 2025 17:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654575; cv=none; b=JIWw57TxXv6+3XJfY6X3fabVrCdydbnlyE/7rdnPquRTQYuReUZHHWewDKvdJAHpd1Q6VtTUeX0xgLxRPI+ULNMPiyBtJNemsCFSGVkg/J/ewuwJNmc/R4kg5yAYgtVaKb/gqAPDjiaWoiIAqgsUxaTiSiNI6ouMO4ZaqmaYjjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654575; c=relaxed/simple;
	bh=miVVr580sYZE66njxD8FvNJvRkUXu7CmYi66iMZyhIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OvqJuW6oNro5mTgwqAxMPUM9Lg8ClAGYin6kZzMz33SDAWtcZ4/mEL9eiZro26aZqqZqfRt3oa9S+yL//u5a2GHqQiLMZ0yzcQUORwT1nX3OZWQnE+Am0sdss5KqSs64bHfpUSgxz+rB9WdlwzUsKT9e3bKKmwRLAXE60ZDvcwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=mjgcItbL; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Yf7jy6KL1z6CmQwN;
	Thu, 23 Jan 2025 17:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737654557; x=1740246558; bh=zwgguoJUxh3EORdVSnm84eN3
	F+KG5CH+2yFVSvOvd2I=; b=mjgcItbLpHTh/dXs3MO7rjHZpO+jcEnRiPObAB4I
	yS6geIpgM/k1rawdPa8nKWEeBpn61mnqitv5djss1ZWij85Q4kdbYWgxV+bOnQzl
	c9eW4Z1Jx/0m5OosoYv6nvm7mqVYbRIXA/+O2mHfvQxd3Db0UipNj9Mq4dAkwMBj
	jEl0/kSzq77WgeD60SrOY28nHUsetAatxEW8Kb5h1SroSYZ/1AXKt9T/JRLHSL6S
	1LVxxOQbkElmP/8Jry82SDyAmuI3FVlD55HT8p2OcO/MfcpDdvnxFb2gEcf0Vf/T
	49LmcwGCWyFR4e6BM5sn/2LPGx8BX1804/U8suOdc67/iA==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id btafVZT1akpc; Thu, 23 Jan 2025 17:49:17 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Yf7jf1DXsz6CmR08;
	Thu, 23 Jan 2025 17:49:09 +0000 (UTC)
Message-ID: <cc07ebd1-fa93-46be-991b-c14e4222750c@acm.org>
Date: Thu, 23 Jan 2025 09:49:07 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] scsi: ufs: core: Add a vops to map clock frequency
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
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-4-quic_ziqichen@quicinc.com>
 <a0359746-2cf0-4db3-891d-b4cb4ff6c163@acm.org>
 <b998f9b5-9965-4cc5-9e76-4ae743596f6b@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <b998f9b5-9965-4cc5-9e76-4ae743596f6b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 11:40 PM, Ziqi Chen wrote:
> In ufshcd-priv.h , the function name of all vop wrapping APIs have the 
> same prefix "ufshcd_vops", I need to use the same format as them.

That sounds fair to me.

> As for return the gear value as the function result. In our original 
> design, we also return gear result for this function, but finally we 
> want to use return value to indicate the status , e.g,, if vendor 
> doesn't implement this vop, we return -EOPNOTSUPP , if there is no 
> matched gear to the freq , we return -EINVAL. Although we didn't check 
> the return value in this series, we still want to preserve this 
> extensibility in case this function be used to other where in the future.

There are many functions in the Linux kernel that either return a
negative error code or a positive value in case of success. Regarding
future extensibility, we can't know how this function will evolve in the
future. This is not an argument to keep the approach of separate error
codes (return value) and gear values (gear argument).

Thanks,

Bart.


