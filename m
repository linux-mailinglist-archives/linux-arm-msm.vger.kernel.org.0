Return-Path: <linux-arm-msm+bounces-35566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9A9AC16F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 10:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60F48282A70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 08:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6966615746E;
	Wed, 23 Oct 2024 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A0JHCcVe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1BA155CBD;
	Wed, 23 Oct 2024 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729671889; cv=none; b=G1Is5BtmqpOuPkiE5d6eejRLDoWbo8+CUUldonR7gpDl4vspMDiVfMShFExDjK0xg3Dh+Gep3sW5u1TlTyczhecq8xJIsmVb3Ljk5VbKqS2kJnHHfX895AZ/aI1LUnERpSncW16tUizoJCpgmhh0Y/8Eu/AdgAyVuZCsE0mrKjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729671889; c=relaxed/simple;
	bh=4yP73HtRCp3DmzJMhejh/GRuwAGOrXikGClaKmY8Ozw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ey56jXeRxQUXM5M86yPp2TuKT0OT4yInTFjmc/iI4yTR3HlccKb3SMJ6LSu6jQpZ+OCDcbwm7cGHOwv0rqiAoS8tzvHv23SDHfPe0vsa4+uSBW/LiNDuVG0qKKWnEweL758/k/5vLlIwSV/0/I9vuC59ZjxRryQSgXVcFA9by1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A0JHCcVe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95C6C4CEC6;
	Wed, 23 Oct 2024 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729671888;
	bh=4yP73HtRCp3DmzJMhejh/GRuwAGOrXikGClaKmY8Ozw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0JHCcVeSsOq8tvFBGOTgnqkO+p+2X3K+jfANAWc2Ykan4ggC8bdrbYKICMvXkvBJ
	 ANND3zJGS82wWglPDf38F8shllfTbE/Lx+2u+z6ZasudQHUGNSNYy83dyrT2/k2kZU
	 rUztVU1mnetRuE7M+tzHTp7QL70g24qTiFh0lwwRh0nNHLbnPlmopXyMpscF+HIjVv
	 NBua7v8B+KhE3fIBSZkpkeYLLPEi7znsVaj9e8zG/LxwyJh+JWcQDJt19CFeVNYJfG
	 KZEyJTwPWh6tEsHHejePo4d50i/CnRqebV5dEOL52lI6QdaBHN33h9SGvVBxXISp+g
	 biDxeT38Z6FiQ==
Date: Wed, 23 Oct 2024 10:24:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Document
 sm8750 PDC
Message-ID: <yacz3xrtlgpgj26cdlhgexur6gc3ifytiy4biuii73zpcbjx2r@rmbewkesnxqh>
References: <20241021230439.2632480-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021230439.2632480-1-quic_molvera@quicinc.com>

On Mon, Oct 21, 2024 at 04:04:39PM -0700, Melody Olvera wrote:
> Document the PDC block on the sm8750 SoC.
> 
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


