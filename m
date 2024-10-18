Return-Path: <linux-arm-msm+bounces-34879-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6A79A36E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 09C8AB24755
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:18:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FC6185B6E;
	Fri, 18 Oct 2024 07:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/h6/L+8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A61B178389;
	Fri, 18 Oct 2024 07:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235909; cv=none; b=MKpHmD25OFnrfjsa/4Gmk+2cq4JPjXykC/Yndq5qZzbfQZi9I7JneKObdUmKwOsMqezmm6vD8Tb+SesPf3O4J/N2E7ZLTrtiLLCMhpScpWI83WJwHK0/ykVekF6DW9liRNaNhnoZ8sE3cJqIiWDRm/l+nj9Day2nI8qt57r5TU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235909; c=relaxed/simple;
	bh=ehOETYkuKIotttopeo2dULCGCO76r/IrdQtVGIyU9K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=umObgNnm2JXd9d/Hx72iRRKF+liC8I1zatoim6xmT5xJBaho8Ehb4kL0jKqCLt+tqJUwCajVXY06Xo3eGHUxnjZTxtnm04Lh+H+eSzxIwSNkzushFiPVkmsQQ6YSY+Ww2DLb/jZosX6WCZ4AHhW4a0C+JGuxNdRL1q3nXoMAV6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/h6/L+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02C99C4CEC3;
	Fri, 18 Oct 2024 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729235908;
	bh=ehOETYkuKIotttopeo2dULCGCO76r/IrdQtVGIyU9K0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/h6/L+87yLd4I9FZNmo0d8rCaZygT91GgQHJsBNzvO/qcqUUasBaUGncoZvxo5KY
	 WUOqCXAfTmRwkuWO1gSrQvr5xjSx4LnZ9QtHqMd+Ed4pyaC1rvxAyZ66UH4lg7oZHg
	 cFxbwFuF//rPcD4lh2oF8ugZ6zmyq/bdg47ZVXO+DZ89g1X4WY+S7q53BynkpWrwRm
	 0av0e+JOkSnLrgGVHmVqrmW9KyLsfAa5xIT/XoZIyZhFUzisxEFhCOcSkLxXI2We7f
	 O8oIoWgyJE5WR1Zh/XNSNvy1nwagnpyFdwpEoB6t/Tt9Y+JEjz+s6MI4c6H9Z0YMHd
	 /pHB1k71WBNvQ==
Date: Fri, 18 Oct 2024 09:18:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: iommu: arm,smmu: Add SAR2130P compatible
Message-ID: <pzbwj6e4oc2oufacybzmcjlrnhbk6wwgk3ebyyg7fdldgttqtn@fvvqr2nbjpvg>
References: <20241017-sar2130p-iommu-v1-1-29d75f91fcf5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-iommu-v1-1-29d75f91fcf5@linaro.org>

On Thu, Oct 17, 2024 at 09:06:36PM +0300, Dmitry Baryshkov wrote:
> Document compatible for ARM-500 SMMU controller on SAR2130P platform.

s/SAR2130P/Qualcomm SAR2130P/

You also need to update the if:then: sections.

Best regards,
Krzysztof


