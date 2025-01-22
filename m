Return-Path: <linux-arm-msm+bounces-45852-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1A3A19853
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 19:21:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 240641882A87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4ABA215075;
	Wed, 22 Jan 2025 18:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="QeyQ8Lj3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A87185B62;
	Wed, 22 Jan 2025 18:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737570053; cv=none; b=jUKM+1s1S98fpxnRmV4qYZwzyCfldgoFzR3ZdT9iy6lCesb3nKmlIMopDz9CZpBcaQefO6iD5ZdumZ50EmAN9VXLizOTjKAMjn0tczuKfvqPAM1eDH4HR156xRmQLL5DUqWnvqnVFF7S4B9m9RET0Q3K1NONm6WEFB/JT65veFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737570053; c=relaxed/simple;
	bh=EnJB4w784i2wXyaASdBk/fe8Rjz/KQyaKeSAU6XGEwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ns19YGmypJXsnxoZkVJ8QnHrJ47tYJ2JnfAOBbsTB/PDFhvIZQ88qm0X3MTMSbygGWwlfOGxXxGiyWBmAgrlHl/lVs/e7dV1aJXyBn3DyZbrZLjtvnxG5VWVM/3gnx3rviJZMhnxlfPHIkVn29kWZyapC4dsV9GXC5hA7/fDBag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=QeyQ8Lj3; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4YdXSg4yVZz6CmQyl;
	Wed, 22 Jan 2025 18:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737570046; x=1740162047; bh=EnJB4w784i2wXyaASdBk/fe8
	Rjz/KQyaKeSAU6XGEwQ=; b=QeyQ8Lj3XBbind2ti9a4eB2fX8TV+kcuIqtWP+et
	OIdAcIvqaDNQ6aXWRtBE/ChiiAjjmTzKNxuNlBSfLiU3GxV7Hol0WouDvKhL/bdb
	P5avnOKv4qMiOxNdR0FtfqDhVZ0wNwuLNSKA22WZ1LOsfV4orxsC0udIB4DYpVr0
	ljlJA1NaJ4c1zulN6ZwlGvUe+AH8w6M1KXcEmKW5tvPZXtS0/yUDeKSp7rq4HZzh
	rN7m2lYtf6OMpnOGN//NMSPjEPClG08rNAb+R4FBpuPUoo/+FEOz2zCVjhqOvqwa
	QTrGSPVE5ESTKmnZzQP2AlHCwq0h4IGq/Gu4wl3EE3NOJQ==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id GoBUjt8SPe-2; Wed, 22 Jan 2025 18:20:46 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4YdXST1NBlz6CmQyY;
	Wed, 22 Jan 2025 18:20:40 +0000 (UTC)
Message-ID: <032a703e-1a96-4d6e-a4b1-bb4153550f1d@acm.org>
Date: Wed, 22 Jan 2025 10:20:39 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] scsi: ufs: qcom: Pass target_freq to clk scale pre
 and post change
To: Ziqi Chen <quic_ziqichen@quicinc.com>, quic_cang@quicinc.com,
 mani@kernel.org, beanhuo@micron.com, avri.altman@wdc.com,
 junwoo80.lee@samsung.com, martin.petersen@oracle.com,
 quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
 quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-3-quic_ziqichen@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250122100214.489749-3-quic_ziqichen@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 2:02 AM, Ziqi Chen wrote:
> scaling up, the devfreq may decide to scale the clock to an intermidiate

intermidiate -> intermediate

Thanks,

Bart.

