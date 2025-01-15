Return-Path: <linux-arm-msm+bounces-45115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE900A11FDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 11:39:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E11616208B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 10:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E72248BC8;
	Wed, 15 Jan 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFCv0kb5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89188248BA4;
	Wed, 15 Jan 2025 10:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736937552; cv=none; b=OW9372RZtpEWKEwnZlAVmqj/GG46mIgBiJtTFWygpvSXb/zq+xS3QwxPjGFqkUeWq1YDYh7po5oSarhAXAbrnJhIMYYLOUOl3RSE+E0Rqoxvbg403ArfJdI8tK9XcDuc3gwa9s+WQj26TAgxQOjJz8kDYzUaQKL073lQD38SA3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736937552; c=relaxed/simple;
	bh=Z5PxgUHA1C3o2hJJT66Ag1Osldjw3HpgzxrWVkAjGx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLEOhxkrbNW25Fnhx46vtmvvsznqT7mMZ3b+dRk0Gn+RiytedKjYymoRaLeHxmGvSkTjBNVPAMBpe1lUex5ly1/sUv1OBA+sCck8vnReFQuDbcroZ4XRyV1Nko/OjoJYHBsunsm5DjbQM/tcuAnKw/PCLiJ7iYLG24ZhAvDGVSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFCv0kb5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55379C4CEDF;
	Wed, 15 Jan 2025 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736937552;
	bh=Z5PxgUHA1C3o2hJJT66Ag1Osldjw3HpgzxrWVkAjGx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WFCv0kb5YZdrj7roPCjzxg96HxfiYJVXu7TxshEvt0CUa2spaTSCd5o31UyONlkBS
	 i5PXG9ncdQulpJcLklxCffxzzEyc2XH2/cq5Ot6KNnveaDExhz0B83Y6/ksrdsh9rk
	 QNOswmxTDCDfI/RmSjOKNp+fveRSIGkegz+vxbXsXpJ8/wOPWeU5p0G5Ft9ebVSKIf
	 nQig8SvNHgl0QOHg0O+7zfgXuh5sKcRXp61Rd8a2V2w9QjlvCpE5InRLnL/tUP0BJN
	 gzkBp2Qso/vJc66ul8wwMYRCk+zaqAc31Sx95YFuCztzRru2mlJZEoUB+TfkiwibAT
	 rpwULY/US5XJQ==
Date: Wed, 15 Jan 2025 11:39:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ricky Cheung <rcheung844@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/3] dt-bindings: arm: qcom: Add XiaoXun JZ0145
 v33
Message-ID: <mfseo6iqp3jsi4zweyi5ric65hkwitohp42fguck2iujvsw3zv@4cxsrgyket55>
References: <20250114-xiaoxun-jz0145-v33-v2-0-495e986579ce@gmail.com>
 <20250114-xiaoxun-jz0145-v33-v2-2-495e986579ce@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250114-xiaoxun-jz0145-v33-v2-2-495e986579ce@gmail.com>

On Tue, Jan 14, 2025 at 10:46:49PM +0800, Ricky Cheung wrote:
> Document the MSM8916-based 4G LTE WiFi modem.
> 
> Signed-off-by: Ricky Cheung <rcheung844@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


