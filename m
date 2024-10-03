Return-Path: <linux-arm-msm+bounces-33041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FB798F4A4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 269EC1C2140A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B41021A76A3;
	Thu,  3 Oct 2024 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUBgoeXr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9F74437A;
	Thu,  3 Oct 2024 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974558; cv=none; b=e/YBSA9+E8upA/Xc6zBoPhizdbecYeo6m65dQM32rpF9ENq35YT8OMj3xnccLaQrqR11m//QijHz8i2z3gdcf4hbugMtRwBEQNDja5iStVf+SS6KhSlO3NaoNMPtdxvfYd5GDI/VHESGOANsbiZu+HRPGDPanzzHh0rXAjFk2qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974558; c=relaxed/simple;
	bh=imNR9DXTopukjHkwo5tclh0f1T0zRA2E8rGys8K3ZBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u7jre2HlWrTetvGUqa6KhspxLb7H4xQ6enLYUkYxLfURU4JpCCmB8ktBF3ERnzDXyDDF2YG80jUPD8VvbWo4VDyfOX92TLmzjO2a3hq7mPHtIdkptvI+r/8LZcUEV8qOgnxcFgH6yd2PzmEgDs/gr7lDuytjy9R9PQr6Biz/vtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUBgoeXr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECFA5C4CEC5;
	Thu,  3 Oct 2024 16:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727974558;
	bh=imNR9DXTopukjHkwo5tclh0f1T0zRA2E8rGys8K3ZBI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mUBgoeXrHyFZRDnDFpzUHsyrA3zf4FusfHuV2snFvZRImM4+j7hwtqq+ZrBSE5D3n
	 +rdmASkKWd/fwNc4EiIKOPcuKRL4ovfbG9e1T9T9utn0siEstG84ngnVYNVQFCKR0H
	 a2nMO5EGxHa9Gv8oLd6M163qG4tqe/Oe5OvANnNKq+BwMbj3m9IVAePMwhALF/qYrn
	 77GTVxyHvspOo/svDpB5dNVt4uLddhwrn3bThmnrF22a9wjH96M7wDNnTfJssFDbNi
	 VSg4b7UjtZOwHotpEY7baNida1iiOa+A+XTaFlC/g2xvW30DztVq2ee2fMhPjLRbFl
	 5ZyH4Wd0XM2Hw==
Message-ID: <b084d738-19dd-469a-8ac8-e72c76e0997c@kernel.org>
Date: Thu, 3 Oct 2024 18:55:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 2/2] drm/msm/adreno: Setup SMMU aparture for
 per-process page table
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20241002-adreno-smmu-aparture-v1-0-e9a63c9ccef5@oss.qualcomm.com>
 <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241002-adreno-smmu-aparture-v1-2-e9a63c9ccef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.10.2024 5:01 AM, Bjorn Andersson wrote:
> Support for per-process page tables requires the SMMU aparture to be
> setup such that the GPU can make updates with the SMMU. On some targets
> this is done statically in firmware, on others it's expected to be
> requested in runtime by the driver, through a SCM call.
> 
> One place where configuration is expected to be done dynamically is the
> QCS6490 rb3gen2.
> 
> The downstream driver does this unconditioanlly on any A6xx and newer,
> so follow suite and make the call.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Not all A6xx targets support PPPT (e.g. A619 on SM6375 - but A619 on SM6350
does..). We already print some error messages when that's the case, I think
this may add one more.

Nonetheless, I think that sticks to the accepted status quo where lacking
PPPT is a bug, so..

Tested-by: Konrad Dybcio <konradybcio@kernel.org> # FP5
Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad


