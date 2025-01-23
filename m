Return-Path: <linux-arm-msm+bounces-46005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 20293A1A94D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 19:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDF963A83AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2025 18:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA35215625A;
	Thu, 23 Jan 2025 18:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="PJVt9p5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B9E154C07;
	Thu, 23 Jan 2025 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737655373; cv=none; b=Jkzd5LTyfmhqrj4fJjgf4X450TyzVn123Av0rZWVxSbEjxFOa0YSDhCW1GqHqd5UfDj7b/eOG+Q5IakOTs/GzJXEb2rW6WxnwZWWGWxDkitzYsZVZuTxp7rocbY3HOxmRlIsS9clHwau3aGxfXUKfwGrG2bBfdOBuuKyTJN0J5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737655373; c=relaxed/simple;
	bh=IQ23k7DgELJHPisXJDjODcjTmt8fE5b1E3B+SAErn54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QP2b4lTOyzGWPUHBgtyrTTcvN8X64ESz+YkKLFzU4im2IK2Qpwu2IRiGsmDY6HkHOq0+cYIby6ENcLx38UVMn2H38D48C8JYcuYMNT7d9+8UTEokNsgRdwJjniw75feLzIYe7bMbPevPvNuFvysYvr4fgJpa7VH05AkJuR+QV5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=PJVt9p5Z; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Yf81R3QKMz6CmQtD;
	Thu, 23 Jan 2025 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1737655362; x=1740247363; bh=WIJVbTEo0h5RhJGwRqPjf0Bs
	0I+xKtRiGutiyLdgKfA=; b=PJVt9p5Z0ol5VAp/vtzqbnyfHrTuC+GFspSIboLY
	CKi6TbkDiQ+4S/MKPd7G5Xow+Sqk5OmLmROf76Z78e/6k9MmCkblR4gQgrw0+rP5
	6S2hR/YBX7PlQm/ajKp4I8P3RIMVwLq3yJTQ4W3IxsSmmn7Zjup04lsqxGLMdt+Y
	CGVH++zhFdHud5UWmYgz+D+qovGyBXxp/wPmIcbWsFHS1uGTJB6L0Jkd4/FtVr+2
	hy4UL3Ph6HW8j6YwA2s3ectd1oe1SMV1NDutGGktxPkyznTVZ4fEhFf4Qw/lLRk3
	talt2XGQ8cjN5bz5y/m+CK6cKrQPiH5UuzEUVzJkXpOHVw==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6RkP4OS1-S08; Thu, 23 Jan 2025 18:02:42 +0000 (UTC)
Received: from [192.168.50.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Yf8154CYZz6CmQyM;
	Thu, 23 Jan 2025 18:02:32 +0000 (UTC)
Message-ID: <9337b005-f468-471c-97e1-f4059ed4283d@acm.org>
Date: Thu, 23 Jan 2025 10:02:32 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] scsi: ufs: core: Enable multi-level gear scaling
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
 Maramaina Naresh <quic_mnaresh@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <20250122100214.489749-6-quic_ziqichen@quicinc.com>
 <da2df1b2-5d32-4fcf-8298-6d045b4f7d42@acm.org>
 <bd7f88a8-8e59-464b-ac2d-3c75739076ae@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <bd7f88a8-8e59-464b-ac2d-3c75739076ae@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/22/25 11:41 PM, Ziqi Chen wrote:
> We use memcpy() here is due to memcpy() can be faster than direct 
> assignment. We don't worry about safety because they are same struct 
> "ufs_pa_layer_attr" so that we can ensure the accuracy of number of 
> bytes and member type.

The memcpy() call we are discussing is not in the hot path so it doesn't
have to be hyper-optimized. Making the compiler perform type checking is
more important in this code path than micro-optimizing the code.

Additionally, please do not try to be smarter than the compiler. 
Compilers are able to convert struct assignments into a memcpy() call if
there are good reasons to assume that the memcpy() call will be faster.

Given the small size of struct ufs_pa_layer_attr (7 * 4 = 28 bytes),
memberwise assignment probably is faster than a memcpy() call. The trunk
version of gcc (ARM64) translates a memberwise assignment of struct 
ufs_pa_layer_attr into the following four assembler instructions (x0 and
x1 point to struct ufs_pa_layer_attr instances, q30 and q31 are 128 bit
registers):

         ldr     q30, [x1]
         ldr     q31, [x1, 12]
         str     q30, [x0]
         str     q31, [x0, 12]

Thanks,

Bart.


