Return-Path: <linux-arm-msm+bounces-69832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D26B2CE53
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 22:54:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 473685A29FC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3397340DAD;
	Tue, 19 Aug 2025 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gzsgm6I8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B782853F1;
	Tue, 19 Aug 2025 20:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755636834; cv=none; b=VgUNJqSqKMdi4/JF3ANztkr9PoDjjzHeF0rHFMWfS1+9GfnORbtTgQ1vq9Lex8ArkVidQIAFzHuAHQI2RJQI6tkOalBJIZFRb0KJokKa5NmuCp5/FPVmnU5zEXz7voY/MJ0xpZefqWLJzgM43UMqPXaSbfkTQ8XiW1I1rYNbero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755636834; c=relaxed/simple;
	bh=Ct16rkVZw82v7+uuxySxZhhLvccFn3UN87vyKAsTQPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3eou/r4dKuEoDkvlivWl+G5QriC8+oHhmwDG0vUyNEqmFBEz1gaXGiMZNle4+7jHgzZhfitfM/pSJ35phe2VtVTdPNZJKPZmOW8vYGnU1aXg5AuW8eNaPEZVf9xjHBaAzMzjysDCLSDCR4BGs4ADA86wQAo9IPM+zXxLUi9yGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gzsgm6I8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D627C4CEF1;
	Tue, 19 Aug 2025 20:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755636834;
	bh=Ct16rkVZw82v7+uuxySxZhhLvccFn3UN87vyKAsTQPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gzsgm6I8sfNPAtW9b0QYKaMZGXnqrH3IRcpRZPdEko6oKUiWSb505KYj9NVzShETN
	 I/rbrEDVEA96kIxJzu9QFOeSltKLutm/vCRqE1q3/EiNTi9hqHlnJ8qwEcRmlwUbA+
	 QbRp0+XlR0UWF1KriqrTa4Nn9HyTpm6HT9VjNIqK6CDa5ue4Zmcfa098mampciG1HC
	 mji+qAcLMYKG7gIpIYfVercpggeF5JEODBpTvpVgnGpHjENNWlZ1Pj89qkBf7f/bXx
	 Zny7A8dZ6k/VSxe0VPsLPAkfFfG2gDgiu7Rhd7Zq/HMq/vQQt2BGlfyZ2VdHjX59GM
	 f0kfoko2pOi8Q==
Date: Tue, 19 Aug 2025 15:53:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] soc: qcom: ubwc: more fixes and missing platforms
Message-ID: <5czfssozoq3hthm4j5jecads45itqczu7xlxosxbp3ihhhqxwv@p2fnp3tuzale>
References: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814-more-ubwc-v1-0-d520f298220d@oss.qualcomm.com>

On Thu, Aug 14, 2025 at 10:22:19AM +0300, Dmitry Baryshkov wrote:
> Add missing configuration for several platforms and correct
> configuration for several other platforms.
> 
> Note: I'm not sure how to handle MSM8956/76 platforms. MDSS definitely
> doesn't have UBWC support. This doesn't provide a threat for now (as
> MDP5 driver doesn't provide UBWC support), but if we were to switch
> these platforms to the DPU driver, we might need to filter them out.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Acked-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Dmitry Baryshkov (4):
>       soc: qcom: ubwc: use no-uwbc config for MSM8917
>       soc: qcom: ubwc: add more missing platforms
>       soc: qcom: add configuration for MSM8929
>       soc: qcom: use no-UBWC config for MSM8956/76
> 
>  drivers/soc/qcom/ubwc_config.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> ---
> base-commit: 0b6974bb4134ca6396752a0b122026b41300592f
> change-id: 20250814-more-ubwc-d56e4bccc23d
> 
> Best regards,
> -- 
> With best wishes
> Dmitry
> 

