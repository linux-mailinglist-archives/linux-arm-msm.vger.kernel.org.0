Return-Path: <linux-arm-msm+bounces-71744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 108E0B41759
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 09:56:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35345189CFF3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 07:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C16B2E2EE5;
	Wed,  3 Sep 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CR/k8E0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694241E98E6;
	Wed,  3 Sep 2025 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886162; cv=none; b=PdMRftb60KozEBYjmk30b4TbMRppTTOLleuIdabfTTyGCvN2A+HefUvPrv5dd37yM8Z3dxXn9eBnTPlUEKZTfEoDjD2wsuRYA4kkZF7TZckfp2JBK6pK8zDyLJmsWvTJmB5I/O/GeVA9zKfvPyp2bvcT/i7XKeunUnMSMwBzpu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886162; c=relaxed/simple;
	bh=WmhHqUUx+HVECDShxhT+FGRZ6haAnZle3DlNSAyxg3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FFMfb2D9ZX8ExVzEAGInRBtXfSvmHvIA7M8LxEfXJ6Q5fVJaglGHYIRXkJT8GHmcX71Wjdy3LyLkGZpncN0VOn9ZSVgfN8dusvlvfmT+Gtcae1f0LYCZMWHN9PKjb0LRaDOO5RxyddZAGXkElklEA3POmcAgMAm3zukcQ1Ti/HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CR/k8E0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412DFC4CEF0;
	Wed,  3 Sep 2025 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886161;
	bh=WmhHqUUx+HVECDShxhT+FGRZ6haAnZle3DlNSAyxg3M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CR/k8E0Bgtqr0iYlE5Mn9gViyYbEPJ2AoDTF1Zcyn6uDsoL/ezKaHF0fzzg6JvS/0
	 ynKAyIAAYK5c5Cl2zkKISeTboUC2S4qoFo33CNuaUWOd+xymIn2kFbTRs/5YRq4V7N
	 teh5hmgMO8q3aFS8V7zBkkQbVFf4vIRY+8ZUJMcSRyGcGaNtEft8UuH1LgnYZtHikP
	 uPWi/Qdrgb0iPAv/TWM8n+ivVbeInTi18KP435JdpxT9hKRnT7JLyhELX4OedDTjUf
	 ZRPh7x35IBa5pJqdcSh21WQ+4aHtEkUa5zASX9Baes+5nZpGQpful7ZSgCVquHyQOf
	 7lfGkP5fk6gYw==
Date: Wed, 3 Sep 2025 09:55:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: srini@kernel.org, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: dt-bindings: qcom,sm8250: Add glymur sound card
Message-ID: <20250903-sociable-corgi-of-grandeur-d1dc76@kuoka>
References: <20250902140044.54508-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250902140044.54508-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902140044.54508-3-srinivas.kandagatla@oss.qualcomm.com>

On Tue, Sep 02, 2025 at 03:00:40PM +0100, Srinivas Kandagatla wrote:
> Document the bindings for the glymur sound card which is
> audioreach based architecture.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


