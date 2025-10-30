Return-Path: <linux-arm-msm+bounces-79598-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 56762C1EE94
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:09:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 24CD14E4DFD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 08:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF01032BF49;
	Thu, 30 Oct 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hk4e/BaF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC771285CB6;
	Thu, 30 Oct 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761811761; cv=none; b=EyS8r+VNQbxa1OCMDJuWzpu37YKqUE4QKA5SQNygOmT1BT2IoJdmpdnT7Dd7GUEdYdgfUkyxhoqVXYP0dC2TeX08lGbB0ImawT2NgDpXvAL/soGtMepVQQlgkfrrt8L0XQThqlh4ZVmRUgqE/XAV0wLwKXoz1JOwp4mT6v871+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761811761; c=relaxed/simple;
	bh=x8/BowhFRHOAH0ZdTZL9raHDW0IwMOYMmnVPArRrZms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Do3V2vzaCRlbQDfuZliq+r8JTalx8T1c2BStUj8tvZMfMfqEKHk+XuEd5kO1sXXcABOvOVsB/+nwr8rXSaD7jGvN0Snp7LaJEQ953iBEBYcWhiHyBFGs/0U3TG8ldQAPxGtqjNCrQ8W1YlYm4AQsW84CwEXvr/CtiNMJnNJC7u0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hk4e/BaF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF24CC4CEF1;
	Thu, 30 Oct 2025 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761811761;
	bh=x8/BowhFRHOAH0ZdTZL9raHDW0IwMOYMmnVPArRrZms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hk4e/BaF9H4N2OhzNCuZW9hA/Jtx5PApicPwNt1+cwQqC/Ic7yIM3DDeBSgkvoaIw
	 cVFpObRwHLfGju4uyjesVHeoUVL2POE/ZtBtjBrpCPpqJ5wg+DOvJcRer3py//cws+
	 ZijnKKnwBDVhEOIXxegasBhWh51hwKCj6emNXPXnCqv90vjyi99r20j6p9KHmgMy+r
	 kwEyaAdhp5patXgfCtE3sgX4d09Ma0u6q3upneyDejtaDSstpaif30XPyMJi7NgoyE
	 vbMgK/c9ta/+ZJ4iF5aY8qUg/8/Uy47uH73XKCKQEWK16X+xMoXyZgFBldmnpo0NS0
	 +f4Q+j1FY993Q==
Date: Thu, 30 Oct 2025 09:09:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, broonie@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, perex@perex.cz, tiwai@suse.com, 
	srini@kernel.org, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: pm4125-sdw: correct number of
 soundwire ports
Message-ID: <20251030-premium-intrepid-gaur-fbfc1e@kuoka>
References: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251029144636.357203-1-srinivas.kandagatla@oss.qualcomm.com>

On Wed, Oct 29, 2025 at 02:46:36PM +0000, Srinivas Kandagatla wrote:
> For some reason we ended up limiting the number of soundwire ports to 2
> in the bindings, the actual codec supports 4 rx and 5 tx ports.
> 
> Fixes: 88d0d17192c5 ("ASoC: dt-bindings: add bindings for pm4125 audio codec")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,pm4125-sdw.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


