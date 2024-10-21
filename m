Return-Path: <linux-arm-msm+bounces-35171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7B9A5D65
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 09:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4FD1F215DB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 07:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8389F199933;
	Mon, 21 Oct 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fpNDBTmB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EE623D7;
	Mon, 21 Oct 2024 07:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496744; cv=none; b=IdA+XORK9ffiAUMYRhfYKQIcAlV+hR18HufRQ1fMD6YmAToUTxQxrbHKsnpbyYIXECCXPaYSHT2/PRMZVbCZJ2/DHmYp1PY69JBWd6owNcFT1JLkdELkE8dBwc7zyOEkQeJbN9EXeN2ig1x9rw9A6NbqbkSF0FOGWTwJVRbvM9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496744; c=relaxed/simple;
	bh=k0JBCA1SqsahxzTieK3bxMlc5zxnUhsbpCaMacQbsPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djyzE+dvm4JdNNYzt3EV2qdHQT5oAjDODNuvYrMsG55dgiIVSReCXPvRx1e9IwbWMoRI085W9DEh15FJawun5R9a/JYe4wb39X5HsUTvMQ86+mE90WuUnkv4qZAPLvmmw2cnCe0nVrV347e+mo/mQ6uQWw64ivMRjDfCUT2TQ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fpNDBTmB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BFDC4CEC3;
	Mon, 21 Oct 2024 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729496743;
	bh=k0JBCA1SqsahxzTieK3bxMlc5zxnUhsbpCaMacQbsPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fpNDBTmBIX/9P/nZ5MtpztCXpIlTKPRqz8VtOKnGW1ANTOCW9FcTFElUf6RhofXoB
	 qzDYFIXK0eT00kilo1mRAG4LwQi6FU23H3Rn1ZI81qHiiB7T165L5S/dW+gEmS6yLu
	 taWM6BGo7FO7gQ4Y0mF7RYZ2d9HFIFZ7/ERvf/LDlKpoCyxxcagPrcNP+HOIpZmaII
	 JQZJUXSmThE+2nh1Kkpku6mNzzsORQU6IeBtdIPbOY1YxFukvn9nYP1A2eBDSxx6lU
	 Y2u5fF3PGag99dbJ0ioaSk3gZ5cQXmCjYV0tiO27AH6wBtP3p3xnePgwldS/y5aGKy
	 1/mRAvCDzUKuQ==
Date: Mon, 21 Oct 2024 09:45:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: iommu: arm,smmu: Add Qualcomm SAR2130P
 compatible
Message-ID: <ce2zfuesgjodsres5r72hw6afrdytekccau64bfsj6r3wafjpy@4az5j5xmywxm>
References: <20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241018-sar2130p-iommu-v2-1-64c361fceac8@linaro.org>

On Fri, Oct 18, 2024 at 11:28:46AM +0300, Dmitry Baryshkov wrote:
> Document compatible for ARM-500 SMMU controller on Qualcomm SAR2130P
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Added Qualcomm to the commit message as the bindings are not
>   Qualcomm-specific (Krzysztof)
> - Constraint SMMU clocks on the corresponding platform (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20241017-sar2130p-iommu-v1-1-29d75f91fcf5@linaro.org

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


