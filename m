Return-Path: <linux-arm-msm+bounces-84523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C1FCA9777
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 23:14:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2E40F301A363
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 22:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618B52D0615;
	Fri,  5 Dec 2025 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="COVTV4vc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339A93B8D67;
	Fri,  5 Dec 2025 22:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972889; cv=none; b=Af+2PIVAasAfSAZMX3iL/bSOnq6QdodIm5UiHQwvLBV3NAkG6fZB4u0hN3iaaXqSclB5hgFKe99C8ftf+BcItdXBgPrC33lDGOKldxCBRoPOHhgEKWfc7ufpEoYpcW2o8JIUAgUqzcZveUM4JjcC1qhlYJKScHrtEwVxJhpcF/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972889; c=relaxed/simple;
	bh=LISwd8ekZoyTEA0AAB8S0aRFUfqc53M7sSGdSQgPYno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZVGBbhVLbae3O9urRNqwn/14CM02ypXNSBBWQkBNIvpbUscKx8IYYg395n65WmJNFmPIDxlOZHbckZN6lXcqMJ93r5f4YcN1mVUaOqNxRdnvkUjwGGz+PgkWlOXM4SgQb3YfVznTeBc+A+WzbzXZf5ocZgLqiL6lODFqt8K7i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=COVTV4vc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE4D8C4CEF1;
	Fri,  5 Dec 2025 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764972889;
	bh=LISwd8ekZoyTEA0AAB8S0aRFUfqc53M7sSGdSQgPYno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=COVTV4vclrEtLW+WsSrrQxGUQ1aDZwpqyu7yjY7l//+cvK4XMTgQQjf3cYSsGe2G+
	 P/TpLBZbyzNTPJn0JoZMzkT+QqGkG4oc4DQKIQbWxhSKicIIbXWQMgbzZXXxqtq7Kt
	 I1u0fcnJqmZNQLkqEDAiarWTkBc74bVzWG3YPMMVb5XarsVGdMx1KRct3qIJoGYovx
	 XVMnAKLQcS90f7foR+mvTQbwoiCVhFgqwpuFLRiBgeCXQU7sokl7F5LVGPyCGdq1IH
	 qt2L3G614e7yCkQNkXoLL6bA4yS1WlmceTKkp5UxAh++wFvrnRlWp5TI8371K7PiEV
	 jhkNqx8tsAoXA==
Date: Fri, 5 Dec 2025 16:21:07 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 11/14] firmware: qcom_scm: Add
 qcom_scm_pas_get_rsc_table() to get resource table
Message-ID: <p3t7ggu7wg74knfa4x6kauelfalgi6yx7xdgsoemwekpzogetg@a7xwv2s3zxmw>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <20251121-kvm_rproc_v8-v8-11-8e8e9fb0eca0@oss.qualcomm.com>
 <86f3cb9f-e42d-40f9-9103-1a4953c66c71@oss.qualcomm.com>
 <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124152538.wt3kzztqmpr76hsx@hu-mojha-hyd.qualcomm.com>

On Mon, Nov 24, 2025 at 08:55:38PM +0530, Mukesh Ojha wrote:
> On Mon, Nov 24, 2025 at 12:48:31PM +0100, Konrad Dybcio wrote:
> > On 11/21/25 12:01 PM, Mukesh Ojha wrote:
> > > Qualcomm remote processor may rely on Static and Dynamic resources for
> > > it to be functional. Static resources are fixed like for example,
> > > memory-mapped addresses required by the subsystem and dynamic
> > > resources, such as shared memory in DDR etc., are determined at
> > > runtime during the boot process.
> > > 
> > > For most of the Qualcomm SoCs, when run with Gunyah or older QHEE
> > > hypervisor, all the resources whether it is static or dynamic, is
> > > managed by the hypervisor. Dynamic resources if it is present for a
> > > remote processor will always be coming from secure world via SMC call
> > > while static resources may be present in remote processor firmware
> > > binary or it may be coming qcom_scm_pas_get_rsc_table() SMC call along
> > > with dynamic resources.
> > > 
> > > Some of the remote processor drivers, such as video, GPU, IPA, etc., do
> > > not check whether resources are present in their remote processor
> > > firmware binary. In such cases, the caller of this function should set
> > > input_rt and input_rt_size as NULL and zero respectively. Remoteproc
> > > framework has method to check whether firmware binary contain resources
> > > or not and they should be pass resource table pointer to input_rt and
> > > resource table size to input_rt_size and this will be forwarded to
> > > TrustZone for authentication. TrustZone will then append the dynamic
> > > resources and return the complete resource table in output_rt
> > > 
> > > More about documentation on resource table format can be found in
> > > include/linux/remoteproc.h
> > > 
> > > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > ---
> > 
> > [...]
> > 
> > > +int qcom_scm_pas_get_rsc_table(struct qcom_scm_pas_context *ctx, void *input_rt,
> > > +			       size_t input_rt_size, void **output_rt,
> > > +			       size_t *output_rt_size)
> > > +{
> > > +	unsigned int retry_num = 5;
> > > +	int ret;
> > > +
> > > +	do {
> > > +		*output_rt = kzalloc(*output_rt_size, GFP_KERNEL);
> > > +		if (!*output_rt)
> > > +			return -ENOMEM;
> > > +
> > > +		ret = __qcom_scm_pas_get_rsc_table(ctx->pas_id, input_rt,
> > > +						   input_rt_size, output_rt,
> > > +						   output_rt_size);
> > > +		if (ret)
> > > +			kfree(*output_rt);
> > > +
> > > +	} while (ret == -EAGAIN && --retry_num);
> > 
> > Will firmware return -EAGAIN as a result, or is this to handle the
> > "buffer too small case"?
> 
> The latter one where a re-attempt could pass..
> 

But why would we need more than 1 retry here? In what cases do we expect
that the first attempt is too small, and then the next 4 attempts are
also going to be too small?

Why is 5 a good number?

Regards,
Bjorn

> > 
> > I think the latter should use a different errno (EOVERFLOW?) and print
> > a message since we decided that it's the caller that suggests a suitable
> > output buffer size
> 
> Agree with error code..
> 
> This is kept on the caller side keeping future in mind. where we can have
> resource table coming from the client and it needs to go to TZ for
> authentication.
> 
> Are you suggesting to move this retry on the caller side ?
> 
> Just for information, once video patches becomes ready, we may bring this
> qcom_mdt_pas_map_devmem_rscs()[1] helper for video or any other client
> should be do this here as well ?
> 
> I wanted to optimize this path, where caller is making a guess and
> gets the updated output size in return.
> 
> [1]
> https://lore.kernel.org/lkml/20250819165447.4149674-9-mukesh.ojha@oss.qualcomm.com/#t
> 
> > 
> > In case it doesn't make sense for the caller to share their expectations,
> > the buffer could be allocated (and perhaps resized if necessary) internally
> > with some validation (i.e. a rsctable likely won't be 5 GiB)
> 
> Are you saying output_size as well should be checked and it should not be
> greater than something like UINT_MAX or something.. ?
> 
> +	*output_rt_size = res.result[2];
> 
> 
> > 
> > Konrad
> 
> -- 
> -Mukesh Ojha

