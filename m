Return-Path: <linux-arm-msm+bounces-69295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F44CB2722A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 00:49:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66371A23C41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 22:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5B12853FA;
	Thu, 14 Aug 2025 22:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqDCwQKK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232862820CB;
	Thu, 14 Aug 2025 22:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755211379; cv=none; b=gLOPdKuRj66V11k0CPUq8+k6Ap3wDNfmm0Qn5Vfw2WMppNBXW87V6a4hCqODcDDPbyeKMjaatE2NXcj15EDigFDiHRAOa3CO2mH/X7Q7zKwzrke7PrjxTXk2qvTF+TmyrSGDCVmGITEunm1wolODrU7wcbA7QIWAFelfY9pJtG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755211379; c=relaxed/simple;
	bh=EXYID1DQZNvp8ko5yQcdAojT8GVsj+vCFjSTUgEPMYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAT2KWnPjCRHRLgWQTVP8PgbdlvW1vpld+C8aSWvN0xjhD4/mjId+DLFJxhc4fB4guXMWtfaS8N8t9SwXrR5oNHg46vicdh4GC7/JJpxdu1gWgnOTlFIquOwDFfoGaSPyClUA8dGT7sBPc4+17xfwa3Q/AJr3qfjHyTfgwv9ZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqDCwQKK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E49AC4CEED;
	Thu, 14 Aug 2025 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755211378;
	bh=EXYID1DQZNvp8ko5yQcdAojT8GVsj+vCFjSTUgEPMYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jqDCwQKKodWGi2aoDMhh4VFfJsfX8z/ZGVwIOlYWLGfU8N8dLiOnw8aPUDtK33ozn
	 XHYlwVqQEYDbLW8NC1CfTqjOBylIseYqtVX5MmQEncKUTcUIEWnr2/NSqBamGdiXMo
	 9r9/BZ8aD2hMEsC7VFF4YViy3Udb1coCl+bS3j/87SPV1atLQ0/CokiXkcMYdli/8f
	 kGTg1WYK3O0UqGzB/5WNRFl9PfoygHeQ9BbRE21tzjrr8CVe/BmzIZL7A5ShiplyLK
	 /SwsFS+TKTl/xMtMDlWWQLUeoAFGQqij+S+IwQGOiMZ3k9cUAZa5auaiP/eLN8Dj7k
	 t1WHglpeot+IA==
Date: Thu, 14 Aug 2025 17:42:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, Mahadevan <quic_mahap@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Sean Paul <sean@poorly.run>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Message-ID: <175521137747.4052414.4732058801340253621.robh@kernel.org>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
 <20250809-dp_mst_bindings-v5-4-b185fe574f38@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-dp_mst_bindings-v5-4-b185fe574f38@oss.qualcomm.com>


On Sat, 09 Aug 2025 12:16:18 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP controller schema documents assigned-clocks and
> assigned-clock-parents. However these assignments should not be a part
> of the ABI: there are no actual requirements on the order of the
> assignments, MST cases require different number of clocks to be
> assigned, etc.
> 
> Instead of fixing up the documentation, drop the assigned-clock-parents
> and assigned-clocks from the bindings. The generic clock/clock.yaml
> already covers these properties.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


