Return-Path: <linux-arm-msm+bounces-48527-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B90F8A3C403
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:46:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0305E17331E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E571FCFD3;
	Wed, 19 Feb 2025 15:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gdt7bzMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681A1F8ADD;
	Wed, 19 Feb 2025 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739979727; cv=none; b=F81SVJZT2mFN7CtVFqI4yF5y3phFKbgnC+x1q2QIsdosSjQsgG0WfYItmTTIPkMAbXirEoVE4pH7C0agNO4XVrVybJQNVGGFEkScSyWq082frWAff5/YxBHJ0R7X/kGRkk84T7So5dNTbFGWPGPePcE0aOWiKjX3OmUCzlvpCyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739979727; c=relaxed/simple;
	bh=geER51S41RNCfVdmfqtnicROAYVEJrmu19y32aczQfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phbAdx1yqTzpumJtG7sU0hS1GXnU1j2O+LPJ5YE1Fd37BxgKEIAlkK9xT5DdIrCreKnOVwxrGaP4JHkkaKXAVvQQy6Pij8DD/xE/aqZgkJAWjunhr/oUHYAj354f+WuzSloagfoF4haJ4R2o46kenqlZEzKmsHn6QR3eGf8dGJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gdt7bzMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D13C4CED6;
	Wed, 19 Feb 2025 15:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739979725;
	bh=geER51S41RNCfVdmfqtnicROAYVEJrmu19y32aczQfw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gdt7bzMWG2DKA6OmrGxPnnu4t2JoVnq06fY0IvQ/+4tV6w3GOcV+fxZ2Jai68XsHB
	 oEjSu7lNqpG8cfjHcP1p4cL2muXLm4odthSv+zau1+a8b+vMQ3CyeUXvu4v7JBofx8
	 wIadLU4eTKJ1MujLt7vZF56WIsTDHThFWHeVshicXCsqxHqlEzwBfvcScSmSO18/hm
	 tthBmT3CEdwQ9x8rp8L2HefrHxfD/nm7xhkptba9ax5Vtw/YimP6R5tjPDPFT4mcZ/
	 d5I21o996uoa1WQ3EnwIolpPP79VfJY36fzlpJgreSPSg6hkwSXcSJ32MUzobMgEUt
	 AZJDFlZvVK+6Q==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkmDF-000000003Xl-3bav;
	Wed, 19 Feb 2025 16:42:14 +0100
Date: Wed, 19 Feb 2025 16:42:13 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/4] arm64: dts: qcom: x1e80100: Add GPU cooling
Message-ID: <Z7X71VDghr_UxAdm@hovoldconsulting.com>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
 <20250219-x1e80100-thermal-fixes-v1-3-d110e44ac3f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-3-d110e44ac3f9@linaro.org>

On Wed, Feb 19, 2025 at 12:36:20PM +0100, Stephan Gerhold wrote:
> Unlike the CPU, the GPU does not throttle its speed automatically when it
> reaches high temperatures. With certain high GPU loads it is possible to
> reach the critical hardware shutdown temperature of 120°C, endangering the
> hardware and making it impossible to run certain applications.
> 
> Set up GPU cooling similar to the ACPI tables, by throttling the GPU speed
> when reaching 95°C and polling every 200ms.
> 
> Cc: stable@vger.kernel.org
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for fixing this, looks good to me:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

