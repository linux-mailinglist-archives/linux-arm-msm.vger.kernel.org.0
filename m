Return-Path: <linux-arm-msm+bounces-44031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F7CA03026
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 20:08:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7028418820E2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2025 19:08:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CB51DE4EB;
	Mon,  6 Jan 2025 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1Wt0gKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BFB4503C;
	Mon,  6 Jan 2025 19:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190517; cv=none; b=qXJWLCXJLgJRM1mvLHITE0zdFVEOKaJSk/NrvsAwZD34glmJYntYNXGrrE+zLE8UBYVGm7fhBDpU8XD0IQPQjoBLkDmVBEEQh2LJY+fyjB8cElNgJXEBwUCklGZ9iG5QfEDVJMZtXwlzHyJNq6mmQZk+S74KmfnG3CA21B9terk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190517; c=relaxed/simple;
	bh=GMiVkgRZiI4cNUutUHzf6uG8V8/evE8TT4ulcbSK9n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSgU4CDK9ZZDUO+3aSI6lxj6em3JCJOrhaWhgoQ0V6az1LF0rUADgD0Uq6SA9IwzvPgKE+9riOwJpMjdginChhFgiNTE5rI6wKuLF3gPIhC4ulbgy34xPsceKsnyDIKtHy7DSz+bC/CUe/ryNV8IujSKD3qgcSC4ORRCmMOhoA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1Wt0gKv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03F9CC4CED2;
	Mon,  6 Jan 2025 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736190517;
	bh=GMiVkgRZiI4cNUutUHzf6uG8V8/evE8TT4ulcbSK9n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d1Wt0gKvoXFTr+LSpKxpeOyHfgv2J+Hz8A++IGlD1TRvQ4sxqqHB8zfzVVCu8/6fJ
	 hbkbNpbFR8HlBVlKqAmZ2VYzh4dn9AQS3zB5lDvvndXs5lo2oDbXIN2T8ZzmvjTQ7e
	 nvN22YRAVAiBsKn5NDFYufZIwLdbFEetKr40ngwGGcs5I9WPP0n7cyodRo7V1DltIt
	 hh0/7Pm4fr7o0GqWTeSiKAxsaiKCtAY/WPuNEvOVGTPp4fvEduhB0XQhUBDL9eLo8J
	 /UQD2mPBTC8NVhzYLi7FhWia7Z1nK29YSS2tpA6g46mHSRzDKDcXG062CRWbkWBRw4
	 5WC1TP+ksdduw==
Date: Mon, 6 Jan 2025 13:08:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Robert Marko <robimarko@gmail.com>, quic_tengfan@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, quic_tingweiz@quicinc.com,
	quic_aiquny@quicinc.com
Subject: Re: [PATCH v2 1/4] dt-bindings: qcom,pdc: document QCS8300 Power
 Domain Controller
Message-ID: <20250106190836.GA818287-robh@kernel.org>
References: <20240911-qcs8300_binding-v2-0-de8641b3eaa1@quicinc.com>
 <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911-qcs8300_binding-v2-1-de8641b3eaa1@quicinc.com>

On Wed, Sep 11, 2024 at 04:03:15PM +0800, Jingyi Wang wrote:
> Document Power Domain Controller for Qualcomm QCS8300. PDC is included
> in QCS8300 SoC. This controller acts as an interrupt controller, enabling
> the detection of interrupts when the GIC is non-operational.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Rob

