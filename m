Return-Path: <linux-arm-msm+bounces-66744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FD1B12746
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 01:22:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C216BAC3389
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 23:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B7E260575;
	Fri, 25 Jul 2025 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9vZtIgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E36725FA1D;
	Fri, 25 Jul 2025 23:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753485759; cv=none; b=XJZvxBFYpzOWo/qki8+NLG/VkCSnlpOt3kT89Y0h7s9BtI/6N5RTkan/tFj3V9BtkFP0KXT2g3VDXxOBsFTbJ7m2CKs6ldZGGuOuW75UZbSRwO4mEtzOq1VX3MYmIUBdAFBTcRwaTqu+XoA65/KN74eK8T2W+Z4bpLMJZdWJ97M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753485759; c=relaxed/simple;
	bh=6pdt6fOe5Ng2y+5SEcgtxmNL2gVOlsVaG2k9rbu1QfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dem6LC5uKvdz7wgNfPZREOuKSCSMGs+79rIKMSaP6KTU93iLBi1aCCjbgEil1CjeIwG6BKoni0qNla29zK8mqrTRll/hWM7GzAK8qvNXiWMVaunMWFW5wGWcJvCVV7+jjByvOND4xG4FUFinrB5WyrAN1E/u+WPEkLyy8i95u3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9vZtIgi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A71C4CEF5;
	Fri, 25 Jul 2025 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753485759;
	bh=6pdt6fOe5Ng2y+5SEcgtxmNL2gVOlsVaG2k9rbu1QfI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G9vZtIgibQSXkgj+hXMN2ee8Tm0V97h4S3Bx9cvE4gbBGys8DpRsq62//HMMYyiXw
	 /R/FxcQWcYQu2wJLcM3hbdIkJKHo9UzFQbS3PglyenXQrnKss/CzGcUMysU9T6FnuK
	 wzAwuWWXy0hEy52RXO8r0NrUs55U523/uK8EmB4Mwn+mAqB/taEtj6POcSzFOTzicP
	 Lba4YHFFcsyBkr93YkPsgESmOXFzWAPaVuHGUVmJehBk8sFmDNdK0cxFdusxGw502H
	 4e033E32crXYA8qmUAB6r984wIwSVXIhlE2NT0I3ewWIIMI5oMBlyYZLvwmXbCjd0E
	 sz67ZdA+z7Y3w==
Date: Fri, 25 Jul 2025 18:22:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: qcom: Drop redundant free-form SoC list
Message-ID: <175348575733.2021152.1272810357973183431.robh@kernel.org>
References: <20250724132436.77160-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724132436.77160-2-krzysztof.kozlowski@linaro.org>


On Thu, 24 Jul 2025 15:24:37 +0200, Krzysztof Kozlowski wrote:
> The schema and Devicetree specification defines how list of top-level
> compatibles should be created, thus first paragraph explaining this is
> completely redundant.
> 
> The list of SoCs is redundant as well, because the schema lists them.
> On the other hand, Linux kernel should not be place to store marketing
> names of some company products, so such list is irrelevant here.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/qcom.yaml         | 94 -------------------
>  1 file changed, 94 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


