Return-Path: <linux-arm-msm+bounces-85041-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BF0CB5B8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 13:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 724173009C05
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 12:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5271830F551;
	Thu, 11 Dec 2025 12:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="nm6UdxKS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B7930F547
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765454443; cv=none; b=E+VBGdXOa1CUIDuZwOOfOjN1p/5ZGzl+TiTluAeEEx4+8K9wkeRULprj73Eyd93ClnBPt07lDTJSS2raB9ZTseXrNdnekpi4gzsb8EKqRIskjtaeWz2Ytcu6SCkxOALVITQgGY9P3Bo84eL1bygHc3yPYKElaQhe/gXuXRxVhyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765454443; c=relaxed/simple;
	bh=+ZsiVHVuvlmElCfiJh8VswoYYUYXDQoGo/7vAi2FBsE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3JOgQQNHQjTVdOjsvnt5RSskkPFq4yYJ92jm1QtmRe3kncFyJvyDM+nfx4yTitK5llbDjBnSEywRuB3Z5+nga5vrSddCgZV/KzELEIYYiSrLeChSP1JBbRmfpjs6QAwZbOhoBg3fjTr/ReW5yORsgGSCIwJwpWoukrjD1EFTdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=nm6UdxKS; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Message-ID: <3d1c6ffa-6c32-48f7-b8de-a2e7e0e43fbe@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1765454428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wcANbySnm/3IxhDfwAZaRbD9tP3Ny+4TLXwMj7cHLrw=;
	b=nm6UdxKSYMIYHr9CaMo6avv3lmC9scnh8DGbt/oP6TX7+TAKgt3O1gUKwzfotaZLDZ+FM1
	F/1A/dmWboBC+glEFH3rD2kV7ixKdDR8vZj0Y741vP1ptrMq//wpNS1UqlLTmqS5fhU6Fn
	Oqq7dsZn0V8lBMAVysV+lC+0O4cvnEBtEVnb6a2k+0iSSTTccp1Svm55RR2r2nkL1sUj62
	dOyXwvefcaihb32y13bSI1Bk/A2QwXqOarJJezvDiPafnTYqU0ku60Hcenx84rjcOAoWvV
	NwtTWLMuFQILyRO7ojvD+QCPm2dfC1ciQ2Wh+nTgtB9Gi/3fJaPE4B/E0FqU1g==
Date: Thu, 11 Dec 2025 15:00:24 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm630: fix gpu_speed_bin size
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@gmail.com>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
In-Reply-To: <20251211-sdm630-fix-gpu-v2-1-92f0e736dba0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 11.12.2025 04:27, Dmitry Baryshkov wrote:
> Historically sdm630.dtsi has used 1 byte length for the gpu_speed_bin
> cell, although it spans two bytes (offset 5, size 7 bits). It was being
> accepted by the kernel because before the commit 7a06ef751077 ("nvmem:
> core: fix bit offsets of more than one byte") the kernel didn't have
> length check. After this commit nvmem core rejects QFPROM on sdm630 /
> sdm660, making GPU and USB unusable on those platforms.
> 
> Set the size of the gpu_speed_bin cell to 2 bytes, fixing the parsing
> error. While we are at it, update the length to 8 bits as pointed out by
> Alexey Minnekhanov.
> 
> Fixes: b190fb010664 ("arm64: dts: qcom: sdm630: Add sdm630 dts file")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update cell length to 8 bits (Alexey)
> - Link to v1: https://lore.kernel.org/r/20251006-sdm630-fix-gpu-v1-1-44d69bdea59a@oss.qualcomm.com
> ---
>   arch/arm64/boot/dts/qcom/sdm630.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> index 8b1a45a4e56e..b383e480a394 100644
> --- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
> @@ -598,8 +598,8 @@ qusb2_hstx_trim: hstx-trim@240 {
>   			};
>   
>   			gpu_speed_bin: gpu-speed-bin@41a0 {
> -				reg = <0x41a2 0x1>;
> -				bits = <5 7>;
> +				reg = <0x41a2 0x2>;
> +				bits = <5 8>;
>   			};
>   		};
>   
> 
> ---
> base-commit: 008d3547aae5bc86fac3eda317489169c3fda112
> change-id: 20251004-sdm630-fix-gpu-f9786db8049a
> 
> Best regards,

Thanks for the fix! FWIW,

Reviewed-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

--
Regards,
Alexey Minnekhanov

