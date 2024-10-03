Return-Path: <linux-arm-msm+bounces-33040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBE98F470
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 18:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37E9F2820FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 16:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E60E1A4F04;
	Thu,  3 Oct 2024 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xx777kdn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90B51527B4;
	Thu,  3 Oct 2024 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727974100; cv=none; b=pMw6XPZu0RhEfqcip7EwRus+3dwkF5LB8UTSKOJmwuTLeyzI7nV+D+PbkOxwuTJD+dXCt5/6z/TpysDMS2gVFty5wXRWbTBPliAfvqGHRDdfK0K7ZEv/hNPqY4ToQCHRluN/MIbAAI/n+H4fc8Z3lVZiP4s/viWB3bgGqaxTkiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727974100; c=relaxed/simple;
	bh=+Qa9dKaycAhBRYIrsw+LWF3SLzloCUMxztuqxkQ01wM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h7SvaGd83HPMxvn8I8m+5Oc7RYyt/hxs7UNLl2xp6//P2al8/Xfxm502PlzvyRSu6n591Cs7jCBth4/bCjC7g0pVm8b5lFqdGNq5UguRUZamytdMXoSMb5iRHq69uCvdDo/dzSJU7250Z6rq2Qpp50CEa4acWp34RJOh7XczuUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xx777kdn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BF20C4CEC5;
	Thu,  3 Oct 2024 16:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727974099;
	bh=+Qa9dKaycAhBRYIrsw+LWF3SLzloCUMxztuqxkQ01wM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xx777kdnc3tch5DRdjRa9JbwLb4MLmM2MxRanYyJW2QfqJ0Qll6QmcgDF9fqX9SYk
	 UkXxhpqfVfbmrbOm/RTxL58LD8uklTYebjtLja6+ul4cOW5k4vBOjjl6o8/jZII3sY
	 BSQAZh6687xuad/hq/L5jt/CbaZkvRsbYSIEwH1BQxJnhysM8eVlH5GyercFqUO9Pa
	 fXvKWR+ULspFHYp12q+72fFLyFJEuftVGEd7M5/mpStkolRzyKZL7KeYQSrxXlSXFW
	 mX0OyIPR2VNQ7Q28rGSUna681NPSlAYHyciLZ/xkMoEj+Ok5G9TgiLtr91z/yq94oL
	 BQcfnHY1AjEww==
Message-ID: <c30baaca-beaf-485c-88b4-984febf06519@kernel.org>
Date: Thu, 3 Oct 2024 18:48:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 1/2] firmware: qcom: scm: Introduce
 CP_SMMU_APERTURE_ID
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
 <20241002-adreno-smmu-aparture-v1-1-e9a63c9ccef5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20241002-adreno-smmu-aparture-v1-1-e9a63c9ccef5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3.10.2024 5:01 AM, Bjorn Andersson wrote:
> The QCOM_SCM_SVC_MP service provides QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> which is used to trigger the mapping of register banks into the SMMU
> context for per-processes page tables to function (in case this isn't
> statically setup by firmware).
> 
> This is necessary on e.g. QCS6490 Rb3Gen2, in order to avoid "CP | AHB
> bus error"-errors from the GPU.
> 
> Introduce a function to allow the msm driver to invoke this call.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

Tested-by: Konrad Dybcio <konradybcio@kernel.org> # FP5
Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

