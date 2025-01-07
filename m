Return-Path: <linux-arm-msm+bounces-44062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4AA0341D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 01:42:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F03B83A38D9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 00:42:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B9817991;
	Tue,  7 Jan 2025 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SY6zOW/N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6622594A5;
	Tue,  7 Jan 2025 00:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736210558; cv=none; b=XL51vw6ZuoGd7xMJ+vQ76K5h2gTCRPM3h0M/MmHEa1TqKeRNuDyizxLNXw90vRmHKTNGJOA4tApmmhMQd1PfU1SfRKKwZk4c8quv82QrYbtwTRHjezrinWa5wULzo5hVHs7OvNJm7D8EammcBS5ZdCw4CHyXc4Q5vaqW1Hj54w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736210558; c=relaxed/simple;
	bh=rGiCH08uLDI69Fa0pYChPboMa1zYbbNXJyi0jiojE3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKjhZaqGh5y303hG8tzQNrRDdSNwPJn4WLzN0MdlgrFaCXMrewbhMQPiiZtDeAOQwy6V6QmCOLuZoblcXXYPHAdWO9it9UuXvfe1jB1IJrVH4SsnIC/exiptTSSE5jAorL+SRRbkSpk7dtugl2B2RqWpMAEjRhlk0jpyc8ZIrak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SY6zOW/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 319A7C4CED2;
	Tue,  7 Jan 2025 00:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736210558;
	bh=rGiCH08uLDI69Fa0pYChPboMa1zYbbNXJyi0jiojE3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SY6zOW/N6b4BCSsAqywn4GbkecXjt1W1aSkTD2Kon77imb0N6VcDz0HotFhGA2F0a
	 p/MP/udYHH4vZeNKMCyMs7XRoFsZteJMHExB0myeELAM7cbWqrbr+BNXSHnaBGjLy/
	 6giyMUGjWuSy96qjXJv+HW/mDq0o0XByLFQY1LWGq14c/nyAORu2sCRXLWBuKFhv5a
	 tUXCHkArDd580URD6KjrOb1qelWLUK+AY/8qAkjMtJLkzdFOzRGsIpvDN5Z1SuwopZ
	 zFreoie098r/DbPtNFdVBtyyA7BHOrldnlGHxkfNZX0qu/h+7iQqZlNv1wUHTt0fa+
	 4Qr+DOkdIJvKQ==
Date: Mon, 6 Jan 2025 18:42:35 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Mukesh Ojha <quic_mojha@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Kuldeep Singh <quic_kuldsing@quicinc.com>, Elliot Berman <quic_eberman@quicinc.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com>, 
	Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] firmware: qcom: scm: Handle various probe
 ordering for qcom_scm_assign_mem()
Message-ID: <o5oz3scbvsvutv43uqgh74xzfxituzieaa57o6mzomdyr3qixo@2j4ogsbu255o>
References: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-0-9061013c8d92@linaro.org>
 <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-3-9061013c8d92@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209-qcom-scm-missing-barriers-and-all-sort-of-srap-v2-3-9061013c8d92@linaro.org>

On Mon, Dec 09, 2024 at 03:27:56PM +0100, Krzysztof Kozlowski wrote:
> The SCM driver can defer or fail probe, or just load a bit later so
> callers of qcom_scm_assign_mem() should defer if the device is not ready.
> 
> This fixes theoretical NULL pointer exception, triggered via introducing
> probe deferral in SCM driver with call trace:
> 
>   qcom_tzmem_alloc+0x70/0x1ac (P)
>   qcom_tzmem_alloc+0x64/0x1ac (L)
>   qcom_scm_assign_mem+0x78/0x194
>   qcom_rmtfs_mem_probe+0x2d4/0x38c
>   platform_probe+0x68/0xc8
> 
> Fixes: d82bd359972a ("firmware: scm: Add new SCM call API for switching memory ownership")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> I am not sure about commit introducing it (Fixes tag) thus not Cc-ing
> stable.
> ---
>  drivers/firmware/qcom/qcom_scm.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 5d91b8e22844608f35432f1ba9c08d477d4ff762..93212c8f20ad65ecc44804b00f4b93e3eaaf8d95 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1075,6 +1075,9 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
>  	int ret, i, b;
>  	u64 srcvm_bits = *srcvm;
>  
> +	if (!qcom_scm_is_available())
> +		return -EPROBE_DEFER;

This API is generally called from places other than probe, making the
return of EPROBE_DEFER undesirable. While not pretty, a client depending
on the scm driver to be probed is expected to call
qcom_scm_is_available().

qcom_rmtfs_mem_probe() does this right before calling
qcom_scm_assign_mem(), am I misunderstanding the case you're describing?

Regards,
Bjorn

> +
>  	src_sz = hweight64(srcvm_bits) * sizeof(*src);
>  	mem_to_map_sz = sizeof(*mem_to_map);
>  	dest_sz = dest_cnt * sizeof(*destvm);
> 
> -- 
> 2.43.0
> 

