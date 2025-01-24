Return-Path: <linux-arm-msm+bounces-46045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F82CA1B101
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 08:39:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92DFA188998E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 07:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E3791D8E1D;
	Fri, 24 Jan 2025 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m299zHQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668B13AC1;
	Fri, 24 Jan 2025 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737704352; cv=none; b=XHjHxtimQdfwq/PANglQTdKlCT33/Qh+2uf6NcQiXIV/tG7ZykZYSuqTAlcDl1z3MuHhbrODGAMm/vkZbGXjECDKFt2GvZlT5iZLPBfaBssCH+WdzTpVMYEMjyTlCf8F4OMMb/I1mXI/cEB4aKCGP3RXrws1c50rZvQwoLXNyRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737704352; c=relaxed/simple;
	bh=G8q15h6IsDOD4LQJQB5VGPoicFwDLIJTNfZolKmAslI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGdFoH82ODgp25RIspgnvtMucGs8rYHhjcA4T+alKBmwdJelBW19BqqBZxZZLlBGPUBDo2VuWFvVwKIZ6mtSzaRXW4xC5zGVJk9ary27gDAwFoeAgHuG5cIlufnhHx/+vzjeoBj+nCYT2QeklTwYhMjd4Eb/3JX4XuYCCHMfWY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m299zHQB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CF9C4CEE1;
	Fri, 24 Jan 2025 07:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737704352;
	bh=G8q15h6IsDOD4LQJQB5VGPoicFwDLIJTNfZolKmAslI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m299zHQBNHTeNuZe7VNB+LF7p7kkvbO6hOTPO+lJEXxWflhGCP7PfjAyksjh7ZFtr
	 zVBMQXpSfdAMGULjTa/TeiskIvyYNus3JaqXfvj6BAlFIeOOaUlqSKcfinh1Q3mDt4
	 dF91iFkYoDk3UiGmYMoZW2WH7XSR2z1TXf5BWpvQp0rxP10d4rgLv2OcLGSZRIYYa/
	 ZTC1k2SfY02I6sZBiyahZj2BrJbiWUSekzEjdGQGBqwui2VARkTZoC+5s9aqfHxW85
	 oN/E8967beb12RZ2B2HCLNAdqiX7wQxjl4h1K9s4/HSPnv9IuJEWVlxOX/927ZYb5E
	 yLtNJHthUOciQ==
Date: Fri, 24 Jan 2025 13:08:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	"@thinkpad"@web.codeaurora.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Eric Biggers <ebiggers@google.com>, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-scsi@vger.kernel.org, andre.draszik@linaro.org,
	peter.griffin@linaro.org, willmcvicker@google.com,
	kernel-team@android.com, stable@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 0/4] soc: qcom: ice: fix dev reference leaked through
 of_qcom_ice_get
Message-ID: <20250124073857.qwnl4ozccsictom5@thinkpad>
References: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250117-qcom-ice-fix-dev-leak-v2-0-1ffa5b6884cb@linaro.org>

On Fri, Jan 17, 2025 at 02:18:49PM +0000, Tudor Ambarus wrote:
> Hi!
> 
> Recently I've been pointed to this driver for an example on how consumers
> can get a pointer to the supplier's driver data and I noticed a leak.
> 
> Callers of of_qcom_ice_get() leak the device reference taken by
> of_find_device_by_node(). Introduce devm_of_qcom_ice_get().
> Exporting qcom_ice_put() is not done intentionally as the consumers need
> the ICE intance for the entire life of their device. Update the consumers
> to use the devm variant and make of_qcom_ice_get() static afterwards.
> 
> This set touches mmc and scsi subsystems. Since the fix is trivial for
> them, I'd suggest taking everything through the SoC tree with Acked-by
> tags if people consider this fine. Note that the mmc and scsi patches
> depend on the first patch that introduces devm_of_qcom_ice_get().
> 
> Thanks!
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in v2:
> - add kernel doc for newly introduced devm_of_qcom_ice_get().
> - update cover letter and commit message of first patch.
> - collect R-b and A-b tags.
> - Link to v1: https://lore.kernel.org/r/20250116-qcom-ice-fix-dev-leak-v1-0-84d937683790@linaro.org
> 
> ---
> Tudor Ambarus (4):
>       soc: qcom: ice: introduce devm_of_qcom_ice_get
>       mmc: sdhci-msm: fix dev reference leaked through of_qcom_ice_get
>       scsi: ufs: qcom: fix dev reference leaked through of_qcom_ice_get
>       soc: qcom: ice: make of_qcom_ice_get() static
> 
>  drivers/mmc/host/sdhci-msm.c |  2 +-
>  drivers/soc/qcom/ice.c       | 51 ++++++++++++++++++++++++++++++++++++++++++--
>  drivers/ufs/host/ufs-qcom.c  |  2 +-
>  include/soc/qcom/ice.h       |  3 ++-
>  4 files changed, 53 insertions(+), 5 deletions(-)
> ---
> base-commit: b323d8e7bc03d27dec646bfdccb7d1a92411f189
> change-id: 20250110-qcom-ice-fix-dev-leak-bbff59a964fb
> 
> Best regards,
> -- 
> Tudor Ambarus <tudor.ambarus@linaro.org>
> 

-- 
மணிவண்ணன் சதாசிவம்

