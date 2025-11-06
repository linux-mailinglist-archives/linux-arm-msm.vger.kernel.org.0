Return-Path: <linux-arm-msm+bounces-80535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AB916C39936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 09:27:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 235013505A1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 08:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3327C3019D3;
	Thu,  6 Nov 2025 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQOd+w87"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F933019D0;
	Thu,  6 Nov 2025 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417633; cv=none; b=VW8iF8vmDZ8LSxAi7XpTGg/riy9eJErvYfbneRhh01mhZ793pnj4Clrix8KUgGf9/JkwhNrVafNxhOlK7OKns8wqKzsH96Bwu6xR3NKsqbnHC3allsG5OPKATWfAU9iNdTKS7alPqIJ+q1LfIascFkTYa9i+qNmUI2eyKqEA/58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417633; c=relaxed/simple;
	bh=z5CUnIFcxYpg/qcDL2lc1ciSvozZtGdVoApOxfgjqgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hku8Btly+RogvN137rPiOZL9kInq3S/Fz5eTyIoeN+1isIisdOTyNaNIhk+Of6LNlVlasUzlbvaTR6reUIT6zFdzC7K4am5q0aocjMR3ugZlEHC2K+o16NhoUIDTa0+m5pOGW5FrkrMgigfI/KdJ3+l6ggCeCniRDsOggscSUxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQOd+w87; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0826FC4CEF7;
	Thu,  6 Nov 2025 08:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762417632;
	bh=z5CUnIFcxYpg/qcDL2lc1ciSvozZtGdVoApOxfgjqgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQOd+w87rTb48tKJAnd0inB2WzSV5a0mgZ47zMntQnFpgkEufy5/cnQ7e6tEfZmW6
	 RHsjIt5Ncs3gDLyzBBb8t3ryKP/gDwH/7LMaauPyDO8RvilYtIZ7VlYnRcjfUDdhah
	 vcQtaEIWBCTl7RhjHb6luE9120lUgo4yGlp9KTTn/BFgxj0IucaaYu7G/widQnZetC
	 fajiOSGMIXyckgVlxGYx544BbWABeofqcNFx4P+cG9pogOKQhF7iHW74JtWz37xT+z
	 9CZMnvBBKz8w+TkvhmOv9EBA8LaktBk4WgYtnlZ6hqfPjfjgpYhnfYlP3hcqDFs3cq
	 yrc6Cxomb9/yg==
Date: Thu, 6 Nov 2025 09:27:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, 
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-binding: arm: add CTCU device for hamoa
Message-ID: <20251106-imaginary-speedy-agama-c8f437@kuoka>
References: <20251106-enable-etr-and-ctcu-for-hamoa-v2-0-cdb3a18753aa@oss.qualcomm.com>
 <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106-enable-etr-and-ctcu-for-hamoa-v2-1-cdb3a18753aa@oss.qualcomm.com>

On Thu, Nov 06, 2025 at 09:57:25AM +0800, Jie Gan wrote:
> Document the CTCU compatible for Hamoa, enabling support for the
> CTCU device on the Hamoa platform.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Nothing changes, so same comment.

Best regards,
Krzysztof


