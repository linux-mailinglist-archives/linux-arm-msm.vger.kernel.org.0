Return-Path: <linux-arm-msm+bounces-31264-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ADEE8971562
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 12:35:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 63C251F2349A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 10:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4291B2EFA;
	Mon,  9 Sep 2024 10:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpiVlMBq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F190F5733A;
	Mon,  9 Sep 2024 10:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725878097; cv=none; b=EoXzyY+o3io7laidYl3K+FbQjWpaCFNuFTKtGSXJmyA++UsldZexeSpRa2VLO6yvKemMU0heuL2Hp1UAxJgel/HEMnWTH+HrTQhEnwdrdILaIrTxP0UBCYNDU/H+gnp3hO5w0TBAQUUMasrIN+dAiT8bCUfZrZvWN0g9GUyF77k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725878097; c=relaxed/simple;
	bh=mdd27egtpKHNtkcd8KHdlrUC/vkGITQ+FHnGZUqhHrI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ERmtvxUy/LHlgNY+qOOfE0WIrGVNRoVhGfwlAyjDdyZWotlLveneNyWJwHhjetWbiyaAmkXzayKI8HwKLBQHIcolqWU7Q17yRsfc6WU9AzcgEZ2KPRwYhspRmkIZGKFJ3tSldkQnzgwCnDKaoOotcWW3nMKRRyaoqzosIKBfR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpiVlMBq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B00C4CEC5;
	Mon,  9 Sep 2024 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725878096;
	bh=mdd27egtpKHNtkcd8KHdlrUC/vkGITQ+FHnGZUqhHrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OpiVlMBqdGcHOBcffmsy0taA3NAfevwxc0gX7CcNbrlf816tIFGoTJQBpftmZg4Iz
	 rDaSSQhYQ0Ee4FDW4yWaG8ZJanu6Uzuo+pC79kyjxcWarvnQeIy+pBsHASGSPi2XAq
	 bYJG07aezgdwBFJQ6ccXxZ/k2tgZrbLnlRm2oXJ91gjbR6eQIpdeL2Hws7LftZ88xh
	 KvhpyPSoFt0hwU+f4+CWKo9+5D+RkhrH2rLM1MRiEuNU1lwHN+dcn4BAg07XAdlwf4
	 IX4VovOTV0urvcTanoY3XWRP8YFTOUUpPjP6msiaU1Cptvqz/yrR7LYiVvGZYd6eA1
	 nMBTOFZBc5cKQ==
Message-ID: <c77ab7a8-49aa-447b-b7ac-18dd5c2eeecb@kernel.org>
Date: Mon, 9 Sep 2024 12:34:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: allow returning NULL from crete_address_space
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8.09.2024 7:59 PM, Dmitry Baryshkov wrote:
> Under some circumstance

Under what circumstances?

This branch is only taken if there's a .create_private_address_space
callback and it only seems to be there on a[67]xx.

a6xx_create_address_space returns:

- an ERR_PTR if msm_iommu_pagetable_create() fails
- retval of msm_gem_address_space_create() otherwise
   - retval of msm_iommu_pagetable_create() is nullchecked here
     again because we apparently we want to be double sure
   - err_ptr(-enomem) is returned if allocating aspace fails
   - otherwise aspace is allocated somewhere

Konrad

