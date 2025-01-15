Return-Path: <linux-arm-msm+bounces-45114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA83A11FD9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 314F93A3A89
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81CEC248BD1;
	Wed, 15 Jan 2025 10:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZjWphd3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12399248BC5;
	Wed, 15 Jan 2025 10:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937545; cv=none; b=LFRigisOWSFHlN/aVMX9/XTdFxDliUx7/1eZsyvmrsNnHeKv7DhSKKJ1fJjYYPqf8qjIOtM/sYiK9gKe5qLUFqkBRW/RJoP93887cmQbWwt7FsaS5h0XYzIYAEg/np+j+AXkRfk4uxG3ibhgMbhcAgL+ciU6wM5wIQbW6Tds08U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937545; c=relaxed/simple;
	bh=BDmmDTMbU/uNszGvP4NUn942q9SEQaBjpANyylyizHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia7rGEHlCYhuvFu6gLmo4lYKschQOxQaB6Yhjr0xEPGH61INkD2Dh7rPOMiq8QuGLPAOX8X/irYbrHksl3z+sCvuDQZFgNrcVWrLRFO4FYpnBezCGb7XloLVyf9sOblF6vaWqwkGsTNjoyD08pRNGUyf5q7RjmrZY8uzoT6YTQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZjWphd3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3E3CC4CEDF;
	Wed, 15 Jan 2025 10:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736937544;
	bh=BDmmDTMbU/uNszGvP4NUn942q9SEQaBjpANyylyizHo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZjWphd3bXTfgjm1TURy21lr2qgovs87kwU2zXZPmElEJ+8UwlTnKv+YAvnhRW7KF
	 fhKPXxdbmqjtaHTeMAcAilU+093QticrAxJxDyE9qpp9DUDkRaRg+Uq4aKmeBvN1at
	 45FoSF+kIXtCCCy/6bgcfSffm1Aj4lA6vYVJn4786EDUOfjh9AMSmVz0WTf9/xLWvu
	 LYW1od9bfNqBk+9jPqHux+Gj96ylmgbvzrDPKL4e8qpM4eUfcur1ZGC6GixZNgA59K
	 2v8OYgNNGocTpCuxym2hGSJMKHAj4mW13Vcesu6QLUWUD0uV27LVuFfngb/6IDkJNA
	 5H1k2hKO05S1Q==
Date: Wed, 15 Jan 2025 11:39:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ricky Cheung <rcheung844@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v2 1/3] dt-bindings: vendor-prefixes: Add XiaoXun
 BiCheng Technology
Message-ID: <2zoq32mfqekfmksljslapksrj5po3rludllz5bmcuuiggq7trv@ma4luvmtdsm6>
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
 <20250114-xiaoxun-jz0145-v33-v2-1-495e986579ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-1-495e986579ce@gmail.com>

On Tue, Jan 14, 2025 at 10:46:48PM +0800, Ricky Cheung wrote:
> Add a vendor prefix for XiaoXun BiCheng Technology, which was an online
> store on TaoBao selling 4G LTE WiFi modems.
> 
> TaoBao mostly require stores to be operated by companies, so they are
> a valid vendor. However, this company has ended operations recently.
> 
> Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


