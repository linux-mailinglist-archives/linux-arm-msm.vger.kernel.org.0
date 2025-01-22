Return-Path: <linux-arm-msm+bounces-45858-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F90A19883
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:36:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99C50164BB9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 628CE215774;
	Wed, 22 Jan 2025 18:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="xsO2xiBx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B900620FA9C;
	Wed, 22 Jan 2025 18:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570958; cv=none; b=hdubO8uGmi9dsFe447/TM0H6xCnkXq4H2e+JQ/fEMUSEraNdiS4P6fyRf9nITA+vgGWeSz7K7b2/qOT2fJQBwaXyfcuFVU96dLkCwILlVUhEg1NTnQS9T3bP38Xaxx77WI7p9C3aTRMPp326qWfSkk4fa7hhUKwqiqO/7UN/iQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570958; c=relaxed/simple;
	bh=r8XTOzdE6US772Q0uKpgcea1Qu4dwxu6Uj+ACOCHd9c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShiAxbh1397gF56jgKCbM79P9HjjNbRT+FYlGJy5ucZm8JtqCPuoEpPV6SKDMpdTOz/eVcUMPbM3WvfHaZc/7Oi50+PEkcnZ3veEeprqdON14nr0pc02jqREQ5/ZyED0oZfeuk3tvfmBKazHlkm6jbigcnHNPs5qz8Cvdh8pJCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=xsO2xiBx; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YdXp40yXwzlgT1M;
	Wed, 22 Jan 2025 18:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737570951; x=1740162952; bh=lbOLLWHfqYKemhHZzXvaqc7r
	OZKbQzqw0KUaPUZ24v4=; b=xsO2xiBxMrUr9KaUZ5cswAhHuFHA06vGon+OI4/d
	ZC5jx/upBPwo99/ujuoKYCvZxiYALCZDJe2L97NEuPEzgLa/doUJZiJWL6R7WD37
	/Hvr7qxF8LfXoaVe+KTwG1FIncZYT5W0UNq6Ll/B9hRSfQ6lRkVi5vohFKDj0iMO
	ESQ5FPl2ewrq/LC34CTwktjFi8lTCbdQCbBUprMd8caN/rLO0Urolsbaa8IMFhf5
	S3dgJ3BFbt87TZMLOLnhhR+YznRI1J7g0CRhNmgGgK/txpb6ZCTIVaNrkaqyNNhk
	oosKqByvaThKUx2TusTl0KqFnRz0KfXoUvcwor2KQh1R8w==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id lPGkF7kg3QDE; Wed, 22 Jan 2025 18:35:51 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXns6sLDzlgTWQ;
	Wed, 22 Jan 2025 18:35:45 +0000 (UTC)
Message-ID: <115e51ed-14e3-49f0-bd88-73391475df8d@acm.org>
Date: Wed, 22 Jan 2025 10:35:43 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] ABI: sysfs-driver-ufs: Add missing UFS sysfs
 addributes
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Keoseong Park <keosung.park@samsung.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-9-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-9-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> +What:		/sys/bus/platform/drivers/ufshcd/*/clkscale_enable
> +What:		/sys/bus/platform/devices/*.ufs/clkscale_enable
> +Date:		January 2025
> +Contact:	Ziqi Chen <quic_ziqichen@quicinc.com>
> +Description:
> +		This file shows the status of UFS clock scaling enablement
> +		and it can be used to enable/disable clock scaling.
> +
> +		The file is read write.

Please improve the grammar of this and other descriptions, e.g. by 
changing the above description into the following: "Whether or not
clock scaling is enabled. This attribute is read/write."

Thanks,

Bart.

