Return-Path: <linux-arm-msm+bounces-72222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2114AB4512C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A4B56472C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 08:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4155F2FFDFB;
	Fri,  5 Sep 2025 08:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcwW800q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD5D2FF178;
	Fri,  5 Sep 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757060369; cv=none; b=gMHhPCvD4nbgaatqhlzThiNSTsCKA8c/21e89Hu19LBmh4INJoFKhy5A0Jg+2yWuQrrhIQaZ2F91SbuuhQEC01I6AQMGLnLusyU3PBEBfnojIAmEUsHewbbJaXnnl9lexvfufBjIPPdBnGKQpMsFPtQjvLw2gub+aVvAKHwrU0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757060369; c=relaxed/simple;
	bh=8hyk9W0dk6PBtSnPsb1Yu/jNChS6pHTMZ/Hv7oN0kgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8HOn0VsItkczWkKv/NqSbM4fDhEkPU/P8t6xQuZldddGZH7LU47Ff2f+gLedtN2QCmGRjy+e8BioFN1ky9eYFDTgrUxne62Tj1w4eWhNlGN4EyyVO2dEHGWgvPrYJc9CtkesLo1i+pMde9K/blgPQVTlYkrRu+JsX3aqkz9WBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcwW800q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAD0C4CEF1;
	Fri,  5 Sep 2025 08:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757060368;
	bh=8hyk9W0dk6PBtSnPsb1Yu/jNChS6pHTMZ/Hv7oN0kgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JcwW800qzULc0Fc5qsNO+72UyRQEDRHrRdKIo/Dq+KeLtxdHFNoJRbBIhsqNXJJSi
	 S0+xldXonTWvJcXrMb/ZgugRS9oSWAQw6TaJTbpelK/sZu8pmWSPh8tn5rhzku51aP
	 5IBBkMLyQb/Tt30G+m8VFuUn8GvUCqznddVoJOWRogBTWd5aqNdFlw6/n9pm1h2vEr
	 yE/WgCzNGYKQOTEwSTvxY9Plan3mvPjv9bgGA7Oi+6KiH1PNIXKMguXDGrselocPyo
	 HmeoPMrH8WQFsM62c/PHj93wO76Q74CCL6olr139AQb3ljjl8Zn+ATvVCBx1MucEDE
	 XDOi/XUlM/+2Q==
Date: Fri, 5 Sep 2025 10:19:26 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: platform: Add Lenovo Thinkpad T14s EC
Message-ID: <20250905-melodic-outgoing-crow-0ddfa8@kuoka>
References: <20250905-thinkpad-t14s-ec-v2-0-7da5d70aa423@collabora.com>
 <20250905-thinkpad-t14s-ec-v2-1-7da5d70aa423@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250905-thinkpad-t14s-ec-v2-1-7da5d70aa423@collabora.com>

On Fri, Sep 05, 2025 at 03:09:31AM +0200, Sebastian Reichel wrote:
> Add binding for the EC found in the Thinkpad T14s Gen6 Snapdragon,
> which is based on the Qualcomm X1 Elite. Some of the system LEDs
> and extra keys are only accessible via the EC.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
>  .../lenovo,thinkpad-t14s-ec.yaml                   | 50 ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


