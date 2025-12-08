Return-Path: <linux-arm-msm+bounces-84629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E74DBCAC3AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Dec 2025 07:54:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32F4A305E345
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Dec 2025 06:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F61312815;
	Mon,  8 Dec 2025 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mbi02B0H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448023126B9;
	Mon,  8 Dec 2025 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765175049; cv=none; b=HImaVqqifYm+KibY6ufmM29Yv80dB0cR7KDQnty3ACJBJ85oigAboOC1UoWmSY/LriZmfKUEcTBo7iGayjmNh6AljjOGNziKTBJGgJ/QcqASgGLvkARcvqqsKmt2HSUnaPDfhw1xTIT0Kx65lVyesOPHLNGVqXH8cpqC8jFbqlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765175049; c=relaxed/simple;
	bh=fcQDly3nR01UDzrOKCsb2aU3590D+hoW7kkdRPWqlkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yj1wKZ+ilk16fPx3HyrQ8DSf+nfDZHu6hAzctn1rmXmqojnuWNBxSGB3UkC1NFF5vDT/CRFU0M9q1jq0RGak4jCp4UXAn5TNGub/SfR5e04rVJrx9SSolrp/R95rUzb/xx12+fA6iWKRmladON9FXFv9QbVvVILSChnO9HVeArU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mbi02B0H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87ABCC4CEF1;
	Mon,  8 Dec 2025 06:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765175048;
	bh=fcQDly3nR01UDzrOKCsb2aU3590D+hoW7kkdRPWqlkQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mbi02B0HFlKmEXxZejwEnyQ5E7y9vZimBKGnCzCgw2hxDJYiUXh5GjMphYbj8tLEu
	 1gWIYJajazNAI+nFpjE/wDf5XHlcwQ3kJ5kdxal/tMzP1fshpWC47PyWq2pLcfxi9J
	 M+yfGGN3hb/jIbMThQZ3PZuwd9FtChiCC8dCvwZCGAHJNlYckD9B805FCsSVhCJU+p
	 YVNrUmmFHjWsOSMqP2RXqa42+1Mp9kKJwV35bOBSTszxpnOz9Eb4ia2QXXhdhnLoiM
	 dRcu3ELA98qfZDKFsd/faHpcraZCmoc3DLlQ4Q8GUM3FNQtuID2FgZnQeZ4ucNaj5Y
	 oDnftW3NvIXiQ==
Date: Mon, 8 Dec 2025 07:24:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Georg Gottleuber <ggo@tuxedocomputers.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ettore Chimenti <ettore.chimenti@linaro.org>, Srinivas Kandagatla <srini@kernel.org>, 
	stefan.schmidt@linaro.org, stephan.gerhold@linaro.org, wse@tuxedocomputers.com, 
	cs@tuxedo.de
Subject: Re: [PATCH v2 4/6] dt-bindings: arm: qcom: Add Medion SPRCHRGD device
Message-ID: <20251208-outstanding-rough-giraffe-a4921f@quoll>
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
 <20251204155212.230058-5-ggo@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251204155212.230058-5-ggo@tuxedocomputers.com>

On Thu, Dec 04, 2025 at 04:52:06PM +0100, Georg Gottleuber wrote:
> Introduce new binding for the Medion SPRCHRGD 14 S1 notebook with
> X1E78100 SoC.
> 
> Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


