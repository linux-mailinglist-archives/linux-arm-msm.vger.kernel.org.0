Return-Path: <linux-arm-msm+bounces-31371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D33972325
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 22:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E86512854DB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 20:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80BA473440;
	Mon,  9 Sep 2024 20:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jY87U5vD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57EAB1F95E;
	Mon,  9 Sep 2024 20:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725912401; cv=none; b=QUVyTDemF9wWnKdW890HqkXzkG5SBe+uQE10Y3moPkiFXCsil+fld0ggIj1ySM6rGX08szRkMPAYCRy64v3mRWyWOM3JX2WJWhy0MP7MVj0ARH1vhmHPPr7B/H+x9+aNcnRX+0ISdUog6QT7vgu4nh9Ru/2ATHYh8z4f9ulsRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725912401; c=relaxed/simple;
	bh=Azpac5t4aKzQzRCwhPLHp6adeu4g/s2FxmB9RbTtBiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KJ3oGnPlAgKTi66fpVzo+6qQWBizFmW4stuPTbtDwDw+a2YvU7EohknHYgoaVv5wTqKFfFf5ZmJLN1uQ7VzwpMPYZAql7lQOL0e2gkogbee1x97M5TZRenrYH+2qLFss+rx4K/9QhnRLwyTBIkPteKG8Ft/5KQDp37eTf+Xkn58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jY87U5vD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2013EC4CEC5;
	Mon,  9 Sep 2024 20:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725912400;
	bh=Azpac5t4aKzQzRCwhPLHp6adeu4g/s2FxmB9RbTtBiE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jY87U5vDSeLbZGrNVVCpSsn++zyq2Obt7LoAeLX4OJhXg0OYdojvYhneMlDjbCpMQ
	 b6qyeyWANvwi1+S87gvml3ehEoVIf6gE1o0IAKEf7kgWO5F5hlQ03hfs9ACk7h/OTm
	 eekO8U4qAqPLLnQ5c/zj8yy2d0aZHw1SzwgkodgECHgkwmMQxJrjee/A+19vnhaLQt
	 IU7NnIcwIRBFvSpeCy2CV4bUuzl3ufwolnEwuOeTlyf2s9AcDmi3LGT8wC07GGKvSk
	 kVXSH4WPjcm0l/QgfoBZhiVX8EOfuZmHLOnDkgvdGFkZQkN4R/OfzRRyeTlBbG/BIk
	 SYTKGp0lShnbA==
Message-ID: <9302887d-c98c-4a98-9d68-9de778f1b1ae@kernel.org>
Date: Mon, 9 Sep 2024 22:06:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] firmware: qcom: scm: fix a NULL-pointer dereference
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Andrew Halaney
 <ahalaney@redhat.com>, Elliot Berman <quic_eberman@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rudraksha Gupta <guptarud@gmail.com>,
 "Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20240909-tzmem-null-ptr-v1-0-96526c421bac@linaro.org>
 <20240909-tzmem-null-ptr-v1-1-96526c421bac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240909-tzmem-null-ptr-v1-1-96526c421bac@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9.09.2024 8:38 PM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Some SCM calls can be invoked with __scm being NULL (the driver may not
> have been and will not be probed as there's no SCM entry in device-tree).
> Make sure we don't dereference a NULL pointer.
> 
> Fixes: 449d0d84bcd8 ("firmware: qcom: scm: smc: switch to using the SCM allocator")
> Reported-by: Rudraksha Gupta <guptarud@gmail.com>
> Closes: https://lore.kernel.org/lkml/692cfe9a-8c05-4ce4-813e-82b3f310019a@gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..8bac4915c211 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -216,7 +216,7 @@ static DEFINE_SPINLOCK(scm_query_lock);
>  
>  struct qcom_tzmem_pool *qcom_scm_get_tzmem_pool(void)
>  {
> -	return __scm->mempool;
> +	return __scm ? __scm->mempool : NULL;
>  }


Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

