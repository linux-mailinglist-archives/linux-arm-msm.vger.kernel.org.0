Return-Path: <linux-arm-msm+bounces-76267-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8A0BC2BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 23:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C926934D57F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 21:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D38F246BB8;
	Tue,  7 Oct 2025 21:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="boZ4+MiJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DC323C38C;
	Tue,  7 Oct 2025 21:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759872562; cv=none; b=FT6P7kqvre4QFj7VMFdPzUFtdycMonta+zkgscJHQcNqUFAHp6nQ7DyuuvvpCy9tFCLpAI+tJXi1RM8E47I+te1rkF1M23EgavZTr8xKL0ZLbZjKzt/gairUOq2aJdR/8Eg6AVI9RCRZ/as05hFWk2pldTnoFtBoHvUhjMRNbGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759872562; c=relaxed/simple;
	bh=8zTYQetH1CJvKwa/5RQeXhjfC0WF0D72X3ZuYBqoH3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8H378cV5+xaQLeNENtWbGFRCJePfHv/zMIuVs4yR6p+/h9fu0rTPx0sWfYgCgV9ioJ05YGNQxuBEkazyjhVd/KomHdadrAP6Rq3vZAwY7/ixcZ3lm5kB4IyTjOeullIpfX40WVZfbBDuxpd68fut42CiFtVMAMSNzn9xouerI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=boZ4+MiJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1FEC4CEF1;
	Tue,  7 Oct 2025 21:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759872561;
	bh=8zTYQetH1CJvKwa/5RQeXhjfC0WF0D72X3ZuYBqoH3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boZ4+MiJ+GZclBlA/YAUpnZq62Y5IaVHOEiAbU0D4If3HDAuNn3wiue1ji+urbMiN
	 77uKc499gCyUSoJk1bR6eYRx/vP0pU9MTHfQhRoPNnSfBT/8eDNrg71QQuN6dMtozL
	 hP3s4KzZdLUEBrFonmF8VWCEP1aZcBlG1j1lnnj3cignbNSPGmCMOhyqJuMOnpfFZt
	 nj5JUWLkMk9hNIdld7JfN3koCvK8/xghpsi3/5A+DgFDQEMWYDq8QusuPtT3F31dlF
	 jTvn1iG08c1V42OzaGEJBOd6k4AgpU9XJnrO2rAHVF6UzE8Ae1kYmzexbYWihHNaIi
	 pgtgVxM1z+xtA==
Date: Tue, 7 Oct 2025 14:29:20 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 04/12] soc: qcom: mdtloader: Add PAS context aware
 qcom_mdt_pas_load() function
Message-ID: <jlpxaewyitfnms7qmesrsghkwkowabgzo4i4n25kiyp4n5ccvb@cs6txshdju4b>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
 <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-4-de841623af3c@oss.qualcomm.com>

On Tue, Oct 07, 2025 at 10:18:49PM +0530, Mukesh Ojha wrote:
> Add a PAS context-aware qcom_mdt_pas_load() function for remote
> processor drivers, which can use the context pointer returned from
> qcom_scm_pas_ctx_init() to perform metadata verification and memory
> setup via SMC calls.
> 
> The qcom_mdt_pas_load() and qcom_mdt_load() functions are almost
> similar. Clients using the PAS context-based data structure can adopt
> qcom_mdt_pas_load(), and in the future, all users of qcom_mdt_load()
> could be migrated to use qcom_mdt_pas_load() instead.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 29 +++++++++++++++++++++++++++++
>  include/linux/soc/qcom/mdt_loader.h | 11 +++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index a5c80d4fcc36..31855836b251 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -486,5 +486,34 @@ int qcom_mdt_load_no_init(struct device *dev, const struct firmware *fw,
>  }
>  EXPORT_SYMBOL_GPL(qcom_mdt_load_no_init);
>  
> +/**
> + * qcom_mdt_pas_load() - load the firmware which header is loaded as fw
> + *

Could you please reword it to make it clear?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

