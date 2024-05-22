Return-Path: <linux-arm-msm+bounces-20268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06F8CC7E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 23:02:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06E80282329
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 May 2024 21:02:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87FD7CF30;
	Wed, 22 May 2024 21:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="dXWVEvto"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC1A1CAA6;
	Wed, 22 May 2024 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716411722; cv=none; b=CUbUiMgCfoFdbLxDEmnjwPPzO7SQM58kOz5viKbSu1lC7eA/qtoMY/t710LiMzeiHJN+zbSd7fC9n2C4AV8k+82TXi97zFxgGkeJlXBJQssB0p3LycsKrA8YNavMf29eNlftM2wnl3OTsaj1+3w2JT6tN4uY0A7WBVIcKLXoZnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716411722; c=relaxed/simple;
	bh=er7P36jIArk3ujM8x9Cy03xPyL1nefNS9QVEIwttV+U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gIonnEh6LtKuSAOocxNSgZFX3NIMucr2Dx9PmLYCbBXRIrC00mV66gpinkhNrAtM2BMmONMZo28aiWvzxj2VjatR3k3pur4sD4Q7tDvXZP34w8zSWTBk7hIrQysQWqZJvn4n2bLLC8QgzRVTJHM5vPh1uYgIKY2aCIsszHPWgqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=dXWVEvto; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4Vl3dh2jgnz6Cnk9V;
	Wed, 22 May 2024 21:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1716411715; x=1719003716; bh=Atjv96qq2OAJtNvHEuhpPZvH
	JqM/RL80by+9suRd8jY=; b=dXWVEvtowpQ/rT7tagj4HNILifmUfKkdishecPh+
	MZxW074xv03njCj4qBGGmx1YkWMVGBQtEdFWKWofKAsDhLmBEvMAN8rWI3YFGwIA
	Mqu0FHc338dszAqlPs6ayXz7Sz6+UBQTbGb77FJwgHgvT8X/yNaH88IR7A6R/r47
	ywyGHCk45eSBz9ZMVyvgg1+6rsrEpP4x8Qh6EAfoM9aLf2D+1XFU1EraKR1DIB23
	6EpH69ahHuOtVpXP4Dj4FeDKtF2ZXu/LHtLjOdCW5SeTPaykIsXq3dgcXrJZbZ33
	JYi5jljhi+70lM8JXqw7Y/CARw+rKZ5gn4Ju0h2crqSG1w==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id D78-WJJWmQKg; Wed, 22 May 2024 21:01:55 +0000 (UTC)
Received: from [100.96.154.26] (unknown [104.132.0.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4Vl3dW10Lrz6Cnk9B;
	Wed, 22 May 2024 21:01:50 +0000 (UTC)
Message-ID: <bdd52dc0-85dd-4000-b5dd-c2c22f5b8ba1@acm.org>
Date: Wed, 22 May 2024 14:01:49 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] scsi: ufs: qcom: Update the UIC Command Timeout
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, avri.altman@wdc.com, beanhuo@micron.com,
 adrian.hunter@intel.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <cover.1716359578.git.quic_nguyenb@quicinc.com>
 <8e5593feaac75660ff132d67ee5d9130e628fefb.1716359578.git.quic_nguyenb@quicinc.com>
 <2ec8a7a6-c2cd-4861-9a43-8a4652e0f116@acm.org>
 <f9595b82-66f9-dce2-7fba-c42b1eacf962@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <f9595b82-66f9-dce2-7fba-c42b1eacf962@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/24 13:56, Bao D. Nguyen wrote:
> On 5/22/2024 11:18 AM, Bart Van Assche wrote:
>> Since the described issue is only encountered during development, why to
>> modify the UIC command timeout unconditionally?
> 
> The vendors can enjoy the default 500ms UIC timeout if they prefer.
> As long as they don't write to hba->uic_cmd_timeout in the vendor's initialization routine, the default value of 500ms will be used.

Since this issue is not vendor specific, I think it would be better to
modify the UFSHCI core driver only. Has it been considered to introduce a
kernel module parameter for setting the UIC command timeout instead of the
approach of this patch? As you probably know there are multiple mechanisms
for specifying kernel module parameters, e.g. the bootargs parameter in the
device tree.

Thanks,

Bart.


