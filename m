Return-Path: <linux-arm-msm+bounces-34710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 901279A1DFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 11:16:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1F881C21BE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 09:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90351D517A;
	Thu, 17 Oct 2024 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMGDaF8J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A5965CB8;
	Thu, 17 Oct 2024 09:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156586; cv=none; b=t4aQJ600RhQQYmke2vfQbXd9KjBR6g6O634SveJrhxkAUYkPCWfM5Kg1izwkNjOvxwJ0HZuIcHMaSzWQIzviJN81zoTayXC/pi1fI++0RKj2s+A6PsgqfCy/K2tnISF8ObX6mvlHRd1E3lIaouscciTX+lHixkpUcdVWL589fOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156586; c=relaxed/simple;
	bh=PVfIhZ+yvdkMBOoyus7ZYqbbJgRP7trgPxTUrrapJQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G5iLVZnYRE5tErUUAkBtdLcS/Z+BARJdjbmS0tLwXH+rQaNB92LfdK4Te6rtucaFrDxOhmb1a3uKWA9MIZ8E7MrxAovvZEXxBb7McHvb10UhnxPbgyBpSayWgXQDb+1mKiXbqVrjZLukF6v9/sRmnwdwHH2GDmT3ZK1o1dfP50g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMGDaF8J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DD8C4CEC3;
	Thu, 17 Oct 2024 09:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729156586;
	bh=PVfIhZ+yvdkMBOoyus7ZYqbbJgRP7trgPxTUrrapJQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMGDaF8JqpWiMob4Bo5NrddT7Gshe4C+bs0eFxGkGsMo8w3Kv64cmh0kEDPJ8M+S/
	 sOKO4yRliujaG8O8MnOn2oyOYKgv+wtANfhkAsR9X2I/VmD5XAhl/MTA4LRXx/XLgf
	 8TeMjoyMzeMzL0Snw94bTZXfekTbziqx+Y4eT9+PiTZq4BTAnOvjfHk5USl+6dHrL2
	 6XbBeLIwIdKuMNkGQzm4bOOShwCsFaNSKlqe3zdXJ8pp9td3LoncEN5y9fLR2CGhIQ
	 5gpIANssklWapNlnv6ziUQPmmXRkjMZTKJ31rCjfZoXP1ZOp3qBj2isO6ckY68K0vy
	 zMuqLBLAvh3pg==
Date: Thu, 17 Oct 2024 11:16:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyle Deng <quic_chunkaid@quicinc.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, quic_tingweiz@quicinc.com, 
	quic_aiquny@quicinc.com, quic_sudeepgo@quicinc.com, quic_taozhan@quicinc.com, 
	quic_jiegan@quicinc.com
Subject: Re: [PATCH 2/3] dt-bindings: aoss: qcom: Document the qcs615 AOSS_QMP
Message-ID: <qbued4krjognpcyrpetvvjljf44vgqt6umolej4sgdr7n4oa3i@mcait5cuji7c>
References: <20241017025313.2028120-1-quic_chunkaid@quicinc.com>
 <20241017025313.2028120-3-quic_chunkaid@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017025313.2028120-3-quic_chunkaid@quicinc.com>

On Thu, Oct 17, 2024 at 10:53:12AM +0800, Kyle Deng wrote:
> Document the Always-On Subsystem Qualcomm Message Potocol(AOSS_QMP)
> on the Qualcomm qcs615 platform.
> 
> Signed-off-by: Kyle Deng <quic_chunkaid@quicinc.com>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

<form letter>
This is an automated instruction, just in case, because many review tags
are being ignored. If you know the process, you can skip it (please do
not feel offended by me posting it here - no bad intentions intended).
If you do not know the process, here is a short explanation:

Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions, under or above your Signed-off-by tag. Tag is "received", when
provided in a message replied to you on the mailing list. Tools like b4
can help here. However, there's no need to repost patches *only* to add
the tags. The upstream maintainer will do that for tags received on the
version they apply.

https://elixir.bootlin.com/linux/v6.5-rc3/source/Documentation/process/submitting-patches.rst#L577
</form letter>

Best regards,
Krzysztof


