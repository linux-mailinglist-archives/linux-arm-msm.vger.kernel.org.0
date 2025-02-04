Return-Path: <linux-arm-msm+bounces-46865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD7A26F3F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 11:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 864E67A0F76
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Feb 2025 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B23C2080FD;
	Tue,  4 Feb 2025 10:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hDsZjieZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D040113C9D4;
	Tue,  4 Feb 2025 10:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738664497; cv=none; b=u24bfRvFNzDe0iSmpaacEOVZmroYQmxSWO31Us7prc0EpRuqQzEjhE0zwRBZX5FRIJlwvymi9NHoBgQX+K1MMNms63PgCLJr6ec31rXD2w1WA7VIFLwROe3pBCyUJkG+zc9yEgGGJ8ARCrcXeqTEHN8KVFkCf64tMatERbQG/2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738664497; c=relaxed/simple;
	bh=00+kGVXM3LxP5UsF8Zva7PTIxyRVIvkWbjAx/ETBsfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5eB2jOujfmm6k1ExcQ4vYQcHlmJBRnpiZklN2xy7IN8odAZchNSIMMDXMMT415/ruKmSjmoje73SfwTKVNzzWK9eVvR9jXg8JdP1VLwGTw4lWmUXMs5R01K6YebdtsENGLD89OSeFEPlB62ISlNtTj4xsljA+Uco9Q3zVNct6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hDsZjieZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B42C4CEDF;
	Tue,  4 Feb 2025 10:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738664497;
	bh=00+kGVXM3LxP5UsF8Zva7PTIxyRVIvkWbjAx/ETBsfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hDsZjieZ9IgA7l1DTrf36QSJpjKTG78gmtOmGGfqe4WLB+J7YBYwAsZT8qbuP/s2h
	 Wgs+YWjo3ihnzFPSGBs7eT1k6eJGDKpAPcL9oLUxq5iVd7MiwSCmNqJALgpFkONq1I
	 M+56XYpYIkdL/jhv/7KK00h3amizZ9/aAgJu0dohzHk6ABET04R4Ztaolg1SHoAujS
	 zXRz4lX/O/1ISSJeQ3Ee3PQY43eGGeSDEuxPdOQKa+PQrht8U2urjfo/okhqjJ5BdY
	 VgHv5MaFWIZx7Uu4OqUrbCZLM/PRDWNRdI7Sw8lyCZZXqAbxnIcPL6tniBukjjxSGp
	 swaprP1Yzl1Sg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tfG3q-000000000XO-0TeI;
	Tue, 04 Feb 2025 11:21:42 +0100
Date: Tue, 4 Feb 2025 11:21:42 +0100
From: Johan Hovold <johan@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>, konradybcio@kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 6.13 1/8] soc: qcom: pd-mapper: Add X1P42100
Message-ID: <Z6HqNgy_jUWwkMnV@hovoldconsulting.com>
References: <20250126164523.963930-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250126164523.963930-1-sashal@kernel.org>

On Sun, Jan 26, 2025 at 11:45:16AM -0500, Sasha Levin wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [ Upstream commit e7282bf8a0e9bb8a4cb1be406674ff7bb7b264f2 ]
> 
> X1P42100 is a cousin of X1E80100, and hence can make use of the
> latter's configuration. Do so.

This patch does not have a stable tag and makes no sense to backport as
support for this platform is not yet even in 6.14-rc1.

So please drop from all stable queues (if it's not too late for that
now).
 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Link: https://lore.kernel.org/r/20241221-topic-x1p4_soc-v1-3-55347831d73c@oss.qualcomm.com
> Signed-off-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 6e30f08761aa4..50aa54996901f 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -561,6 +561,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,sm8550", .data = sm8550_domains, },
>  	{ .compatible = "qcom,sm8650", .data = sm8550_domains, },
>  	{ .compatible = "qcom,x1e80100", .data = x1e80100_domains, },
> +	{ .compatible = "qcom,x1p42100", .data = x1e80100_domains, },
>  	{},
>  };

Johan

