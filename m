Return-Path: <linux-arm-msm+bounces-63940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B76AFBA1B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 19:50:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D14A1AA6788
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 17:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2847F231837;
	Mon,  7 Jul 2025 17:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="xnupcNkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 003.mia.mailroute.net (003.mia.mailroute.net [199.89.3.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7393F21770A;
	Mon,  7 Jul 2025 17:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.3.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751910650; cv=none; b=fJDYplVmt8YH/dLAtE9LGVyeGsfbrNcVxCRsg08ddijIUvFYRXhLxqiPb1LT2e6Z/xW5YVTq1agmhQVB6QbvFOchEarvrsbSMY6lbbzb6xi5g/s0ruSE+L3TgFPyR17eM+eXsN2kxrnT3Vk3YAmKNne7lfPWY29D1mK9XPldlrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751910650; c=relaxed/simple;
	bh=bWqq5VI5rM+xTTvRhUEto41GORSxdAOsIasqjf/8aF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REWI4ePtwerGUjYRwx8eLXX6KE5R0oIfYnUG4AGmj5J1BpH1h17xFU693Q+ux+OgYiRw0K4KY5yv4+MuqBkCHJzzbs2/mWVt5IHHy4/sTapa9oblSmLoXufV4Od02u8r1LzqDZ2vPDrLfo4ODWg6D0tCWucBDP8rentPfU4R2Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=xnupcNkR; arc=none smtp.client-ip=199.89.3.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4bbWxM2vdVzlgqV7;
	Mon,  7 Jul 2025 17:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1751910644; x=1754502645; bh=bWqq5VI5rM+xTTvRhUEto41G
	ORSxdAOsIasqjf/8aF8=; b=xnupcNkRwBkFaQB7PjBtkme1RBB2WtfiP7nJ3unG
	A1UYlO7N7NqIIbXGoHUZ9gEAu6J4W9DhPn/lryTo/NhJkfvotyk90cdxzdiu0uxS
	z6FhlyuZym70zBvaHTEZl/njmXlTFu6hlBoQrYhmyxttJgS9EhWnmgAiID2Oguf7
	PaPmaGGwZD/6NU7k1CuM3tlbzncZIZ60juA78X65NOSdPDH00YlwhPRT/uCeVbMG
	t8vg9QBYnsw8uvCLGnKBlfeXXRDZlH0hOJ4b4fYG6cmQjMIVdiYPOxDyYfwxixgC
	a3i25BDHH07nNpkFAiYWpIXYGxpFO9f3eDmvFIKm+lmGzw==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id G3h456CMYERV; Mon,  7 Jul 2025 17:50:44 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4bbWx808nlzlgqV5;
	Mon,  7 Jul 2025 17:50:35 +0000 (UTC)
Message-ID: <60434d76-3c74-4c0f-8ee6-77fd9f69029b@acm.org>
Date: Mon, 7 Jul 2025 10:50:33 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/RFT 1/5] ufs: ufs-qcom: Fix UFS base region name in
 MCQ case
To: Konrad Dybcio <konradybcio@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Asutosh Das <quic_asutoshd@quicinc.com>,
 Stanley Chu <stanley.chu@mediatek.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 Can Guo <quic_cang@quicinc.com>, Nitin Rawat <quic_nitirawa@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250704-topic-qcom_ufs_mcq_cleanup-v1-0-c70d01b3d334@oss.qualcomm.com>
 <20250704-topic-qcom_ufs_mcq_cleanup-v1-1-c70d01b3d334@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250704-topic-qcom_ufs_mcq_cleanup-v1-1-c70d01b3d334@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/4/25 10:36 AM, Konrad Dybcio wrote:
> There is no need to reinvent the wheel. There are no users yet, and the
> dt-bindings were never updated to accommodate for this, so fix it while
> we still easily can.

The patch description should explain why this patch is considered a fix
and also why the kernel driver is modified instead of the device tree.

Thanks,

Bart.

