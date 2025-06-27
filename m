Return-Path: <linux-arm-msm+bounces-62868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E3DAEBFAA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 21:20:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724C5560FE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 19:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34292066F7;
	Fri, 27 Jun 2025 19:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IBcBUYti"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84692200110;
	Fri, 27 Jun 2025 19:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751052032; cv=none; b=SYuVoBWlDHDigEhM8QLorCgwlyGM27hzAQE22rEQRo3zwEdvZYtXMPqL/WGlKdUCeadko04Nhd1LyUuVORcx1ntUHmSfxTA2Oa+2OQlKjjVmSTrCHrrmvaC6FvoLacFpSJaEE7lLBc2QuYNcDdueJA/3iZsylCyqdzP6PIeGIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751052032; c=relaxed/simple;
	bh=VaKOniGPPILBfInlAjKHbWQfcB4xEXhSatu6tEtFjIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PmnMK42hbzFRSZo3K74TBBmSxwkNxViJ2UbEow/bJAc89N7FctDiaZdkyC5JLlpqNZQ14UKb+CbvldldUcxajdk5XeCyyWwVNC6KPpLZ3jUsa5K1TezjhlE7krdW7g0Z8itBBzvr8d8CAUDESk5HS1bE/S9jTf3ricREmx4FzXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IBcBUYti; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBECAC4CEE3;
	Fri, 27 Jun 2025 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751052031;
	bh=VaKOniGPPILBfInlAjKHbWQfcB4xEXhSatu6tEtFjIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBcBUYtiGaajUJpOCPzWNlBLhS+vZUfw6XIUU91jxSvduGAvh7sf8y9kaQ9hDjcIV
	 GBNJsK/dJxBIPXunFQf9cT7oAV2XWoOd8gsIceMNsF3U5TBRYrUHnPwOh9ZFkrPuZT
	 ml1Zr/HfF1y4TuwtSHplqzAEQ4Rym89VCmziaNSZZQPMVOLXglic4S2eTe7NMMYnw3
	 T0Yhou10zP0qtOD6TIPFB17S9z1Oa7hv01VTrk8Yw7sOknU/fwreWwkdZh9L5uR4r4
	 i/eU43gslT8fSp2ZMn+yRsOEgN4crXIWrwlPbYB/kRyUmmvIoqlAS47+kB2rVN+Dqz
	 RnIqMN2q6XHqw==
Date: Fri, 27 Jun 2025 14:20:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	Len Brown <len.brown@intel.com>, Al Viro <viro@zeniv.linux.org.uk>,
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: arm: qcom: Add Ntmer TW220
Message-ID: <175105202975.4032463.9073046524218764575.robh@kernel.org>
References: <20250617092929.1492750-1-mitltlatltl@gmail.com>
 <20250617092929.1492750-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617092929.1492750-3-mitltlatltl@gmail.com>


On Tue, 17 Jun 2025 17:29:27 +0800, Pengyu Luo wrote:
> The Ntmer TW220 is a WOS tablet based on the Qualcomm SC8280XP
> platform. This device is also known as Robo&kala 2-in-1 Laptop.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


