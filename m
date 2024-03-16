Return-Path: <linux-arm-msm+bounces-14298-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 096B787DB33
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Mar 2024 19:15:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35D451C21223
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Mar 2024 18:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF881C288;
	Sat, 16 Mar 2024 18:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGO14Efz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1A1C280;
	Sat, 16 Mar 2024 18:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710612923; cv=none; b=XqwqwVUgyXi7mEbHrLSDAJBEk/Y1rr8anD9jZF1DEFZPl3Kjb1f+bF3tlfS8YvunH8pzdw9wFoWI0obiWjCSpRBT05ESXlC90UQVDlZHBJICIaWm82TX9UGzWP5U7lm4NA02LZFcyB5vOaBfuFyDDn+v7aq8RyRCRhjA0LiJRSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710612923; c=relaxed/simple;
	bh=V//TwedK/AnsVBQfdsSSLaT/4HIGJD4riXx1ogetloU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Em1Lw+iU9Aa6fxtz7zA+asZTjixtN+jEgjL+Sixrsk0THRBdvJRxRVd84u0O2xKStl5flggixmOX6UovA8J+xdwyKSRXONTPNB0Swtz9FlI8TKB8PMMtE1FudI0mEw6qRP81k2jENbHCWtR5ztk2bogvo4QWFalpv90pQU5PA2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGO14Efz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBD97C433C7;
	Sat, 16 Mar 2024 18:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710612922;
	bh=V//TwedK/AnsVBQfdsSSLaT/4HIGJD4riXx1ogetloU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GGO14EfzMSeW4Bt0YP8UpyofGtNiQYmbC4EJJutLOdr5r+yuowJQwcwxYljH1SnzH
	 6Uj0hY6/kF0KumUvm+2sp6eNt0s3B9KJiednJFu3cXmBVFMLMyPBFHf5E5vlpcEdgR
	 xtWGOrRdDZh2dwBSFsHnV2LCMf1N4XoUkx2DMSsfGUXWQ/pHPtz0YSa1DPqa1inLag
	 PHqei6+9kpKVq0UAljb7Nk5vD7N+hWTNgz6dFgNKB+9cFLmXrznmIPRlx3a2E4rgIe
	 0YF6AX0jMGOFXPZloyl8WUDqGAWpuq9xb9sRWCkVKXQbhcubYAG4idsMYQ75mXBCKo
	 3O2/RtPlAMYkw==
Date: Sat, 16 Mar 2024 13:15:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v4 5/7] remoteproc: qcom: adsp: add configuration for
 in-kernel pdm
Message-ID: <razzdajlb4qkje2hyzqcrtsxvvlxwtkw3bpe6x6wckae5dp2ug@4gk6otou575o>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
 <20240311-qcom-pd-mapper-v4-5-24679cca5c24@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240311-qcom-pd-mapper-v4-5-24679cca5c24@linaro.org>

On Mon, Mar 11, 2024 at 05:34:05PM +0200, Dmitry Baryshkov wrote:
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
[..]
>  static int qcom_rproc_pds_attach(struct qcom_adsp *adsp, const char **pd_names,
> @@ -375,10 +382,14 @@ static int adsp_start(struct rproc *rproc)
>  	int ret;
>  	unsigned int val;
>  
> -	ret = qcom_q6v5_prepare(&adsp->q6v5);
> +	ret = qcom_pdm_add_domains(adsp->domains, adsp->num_domains);

As we're not defining the PDs based on the loaded firmware, and you're
doing the reinitialization-dance of the server on each add/remove of
domains I think it would be better to just register these at probe time.

Regards,
Bjorn

