Return-Path: <linux-arm-msm+bounces-34890-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF26B9A3713
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:25:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FD7B1F21B82
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FF2184535;
	Fri, 18 Oct 2024 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmnJTYmG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F79A20E33B;
	Fri, 18 Oct 2024 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236299; cv=none; b=UnijR0Bf+qFnYmzVYXlr5+NjqosIqW8+FwHmoGnK3ahLIL8F45IwSzxR5xxhgRTEJkCjqlD6DR2rz8JrNJs6kxK0KdWc0Y0eWkdBEF5G/xmJoyU19r9SkHusF3ai3WuRTMGlpzUvTwskT2/PCkiCYiJLh0xFrU4+rBBrtG8p4j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236299; c=relaxed/simple;
	bh=vTT87dHTiDjMxOgUO1JW50iYpe12QbN7+UAxlwKLyyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=APo8aMHOpUvV5tCRpnsj+kHKI4g22rQXgGJmFWjKcrJki3rxn6RtO7/27OTUsJF1pILQejpkORlW05uJ7Nudl44JtOKS/uVnSdITd6QV9fTSbLbsuB1fmSGaBvfeNKZL1Tb9bCpM1NCVIEHNr5PSvx6EBVImk6RXTtoofNeZeY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmnJTYmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D18D1C4CEC3;
	Fri, 18 Oct 2024 07:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729236299;
	bh=vTT87dHTiDjMxOgUO1JW50iYpe12QbN7+UAxlwKLyyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CmnJTYmGwayr36G+UvKF6G54GZgbVS9RxhNUpbKgSQKw/2ApKfGa/vAZEclTAAB4Z
	 dLWh1OJYl7aWnPc7+JJVKU74xRjnAHH9p5WocUb9tqKzaMNtTh+yG9+L7mei5yICtO
	 kdOaMqHt7enS6SxOj3oO+TFxea28ZP6AppSubTSzWZimfroLbat8iL/9iZdk5AmdD2
	 ioAFu7VTI9JPEw5G6m9f7InMvRVCp/+zBAslBoaeeZI0RoBYMuTThhjpoqDPHOS4t7
	 YiVBMPjcc0rm2yPPaVZk+mCgX9fPm+jaAA6NtvVGid1GEeyDIZ9Hsgg+vzpR5A5uYk
	 /W7ryZ6jswfnQ==
Date: Fri, 18 Oct 2024 09:24:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: firmware: qcom,scm: Add SAR2130P compatible
Message-ID: <5idyfeua7gjtekurpppl47u6hfqnhqjmnuzch5x7bjacct7cae@3csymwdgtar3>
References: <20241017-sar2130p-scm-v1-1-cc74a6b75c94@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-scm-v1-1-cc74a6b75c94@linaro.org>

On Thu, Oct 17, 2024 at 09:20:16PM +0300, Dmitry Baryshkov wrote:
> Document compatible for the SCM firmware interface on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


