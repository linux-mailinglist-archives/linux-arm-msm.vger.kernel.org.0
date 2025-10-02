Return-Path: <linux-arm-msm+bounces-75766-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19362BB25C0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 04:26:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B820A4A4BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 02:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF71E23BF96;
	Thu,  2 Oct 2025 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jyYWipnU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6B723A989;
	Thu,  2 Oct 2025 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759372000; cv=none; b=UttDYrDOCsmSnH9lmSQXO40PM9QTePScnoT+qz5Gz9DNni9XNFJyzqOe/s37unhMVAmEldzDDkzsCU70H/X2Ax+i2qSEMfioRkmfuEjP/o3/QrS9VSdjCevB43J0nYXUBUgra+i+lsFlHJhOdzEwZVwcRNaDsQbsO52uTJBqxto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759372000; c=relaxed/simple;
	bh=jio3I8WcuBf/06ND5WbRbHDa0i4qR4KjQPln7l7gD8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoVIDI3nW4tsBA+t2UkO7DyNtEIio654guyflEpZ10NfXszLXmyuhV6U1Zwhs3C4voosOCG7JZBRUkd9Y6LkTGL4lJKEmWgmCh4WZg9S75PYsEzAIKxyuUQhMIpzKwDl16ekFd1tPRw9TCl1B0NMvToWyeojB2GTz1CRhtzFMYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jyYWipnU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90EBC4CEF1;
	Thu,  2 Oct 2025 02:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759372000;
	bh=jio3I8WcuBf/06ND5WbRbHDa0i4qR4KjQPln7l7gD8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyYWipnULAxoK8P9AWK8DM6ZRCqnqr/vx1syy3oFJLkC018RaFcPakMHS4ohiYZug
	 bSQj9Ari3mb+94+6Q/GdLy2itnE+iAsmcFOmK5OBln+6QLDF/b4Mz5KhlAgEytcjQL
	 r2uE1ZarqjwNssrZ1DhXIYj5J9xu4qRfK8PTWcXNM1rtl8JRXKUjDdsNWq+xWyogc1
	 ztdHEs7tuemI6reMDFG2uikJPLarwcoqpnoh8ei5mLSXpo0HO6XzTwyu7a5UkF0ny+
	 5Ie76TS/R1KH4dwZgxvjja2gCgsO/4c6TP/WFqBSc1d3YnjZV4rIeE45DlCjNWUEiB
	 v2QZARaNL+jGg==
Date: Wed, 1 Oct 2025 21:26:38 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom,x1e80100-gcc: Add missing
 USB4 clocks/resets
Message-ID: <175937199767.2925546.4280245351480159227.robh@kernel.org>
References: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
 <20250926-topic-hamoa_gcc_usb4-v1-1-25cad1700829@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-topic-hamoa_gcc_usb4-v1-1-25cad1700829@oss.qualcomm.com>


On Fri, 26 Sep 2025 14:03:45 +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Some of the USB4 muxes, RCGs and resets were not initially described.
> 
> Add indices for them to allow extending the driver.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../bindings/clock/qcom,x1e80100-gcc.yaml          | 62 ++++++++++++++++++++--
>  include/dt-bindings/clock/qcom,x1e80100-gcc.h      | 61 +++++++++++++++++++++
>  2 files changed, 119 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


