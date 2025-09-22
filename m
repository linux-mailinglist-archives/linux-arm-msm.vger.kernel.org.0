Return-Path: <linux-arm-msm+bounces-74474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C14B933B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 22:29:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A1C119077A8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 20:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BA4311955;
	Mon, 22 Sep 2025 20:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xzj8NSRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A1C2AE68;
	Mon, 22 Sep 2025 20:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758572962; cv=none; b=WMe2+3HmZNQstCnRnbai03+MxbUbuah482ESgxeSREJMM7qp0Kpad5xouubYWz/dM2x3ZWjMZy9amWqxAmwGTFvGLQigNuNURg8+2tP30UWIU1N6YE+fxpPdfEu0Cc7Xu27Pttw1GkV9ExQtUiRZpJrk7Pp6KokhBB9j+D5BkSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758572962; c=relaxed/simple;
	bh=NHqia+Ky4WBJqsYqstgFB+541LM71n6NxiCPBPEen7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdwHSk8n5SsZOfkOzMIhDu/ei/40EELSIK9oJ/d983wiF6kuvasl4IJK2gTGS+sZHvD83RwObuwZWEla5jWUjJRPU+KGarPeGthsUg5S7/daqMbIi7L1IQNCs/6W7fzUSSFB80ag4THPXprhE8BRq3Xr/4alJxO4DuRd+8NGUkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xzj8NSRh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C593C4CEF0;
	Mon, 22 Sep 2025 20:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758572958;
	bh=NHqia+Ky4WBJqsYqstgFB+541LM71n6NxiCPBPEen7I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xzj8NSRh56Ro4/R36u4lWQlslhpVvUecYqfG+UFTqA1vej8AU7qGv6RcOUwGhYrw3
	 7/YWFK2Tnj2FO1H+fzqaUjRzXo2oaVac2qwurFbVBCzrWxQVlQgpS2lbLXzN4ON/Sq
	 jHBQc0aNUSE8pyA1korfp1MImBUEm3r1P1yNJjsuRsYZQ9QltuDsuI5WonAO3Tq4Py
	 +WGE8nlU6x/ncNj2o4HiU0M9MvdvsQhFPtiPNF4bUkbAtUCd8CQI3HUGxYfoEM5P/4
	 1Fs6JmGpjAi7XONwhxBMY1Q474vp//LAfSIoCMRC4uxmv262p//fj7X3uNcUbNvvda
	 gRGrSZy10b3Qw==
Date: Mon, 22 Sep 2025 15:29:17 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Message-ID: <175857295701.1277953.1772407338158672337.robh@kernel.org>
References: <20250921-kvm_rproc_pas-v3-0-458f09647920@oss.qualcomm.com>
 <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-kvm_rproc_pas-v3-1-458f09647920@oss.qualcomm.com>


On Sun, 21 Sep 2025 01:10:59 +0530, Mukesh Ojha wrote:
> Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
> configuration for remote processor and when it is not present, the
> operating system must perform these configurations instead and for that
> firmware stream should be presented to the operating system. Hence, add
> iommus property as optional property for PAS supported devices.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


