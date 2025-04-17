Return-Path: <linux-arm-msm+bounces-54603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5274A9137D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 08:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66056189EBA3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 06:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E58A1EB5CE;
	Thu, 17 Apr 2025 06:05:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A811DE4C8;
	Thu, 17 Apr 2025 06:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744869916; cv=none; b=qJ59up96KGHqgKJrpStRfjxGGeTyNr3i+LvpNxX0PElEuFuXDG9DvzyTm5FJE2ugVkaQ3NBPsY9XukakTKgZh1RpI4wDxPmUu45Vu2zuPIob21YQUG13QOU2shIJkncvXmhdE4ZRZc1z9mTUkKGOHAkOE6W20NdSH++/9qDSZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744869916; c=relaxed/simple;
	bh=d1bITkSF/1KWQgNW4k9o5k35hPOn5MgTtZiEbflkd+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qb74GFPYfgeKyzfBQthksmrjt2olwHsProQCMoh1ejMNhyCgrIReB9+d1pOJRW7P22xWWsA2qcJtGNSQWODVKAJmYRvUYGR+vc/ZQaGRS8SZPKzxXCMczgF4slegTfrwT/Ll9FEf6NBF3+KO9R/mdubOKWsKpsDW7DvVjZG++JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A2AC4CEE4;
	Thu, 17 Apr 2025 06:05:15 +0000 (UTC)
Date: Thu, 17 Apr 2025 08:05:13 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Add Parade PS8833 Type-C
 retimer variant
Message-ID: <20250417-quick-aardwark-of-art-abdcb5@shite>
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
 <20250416232345.5240-2-alex.vinarskis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416232345.5240-2-alex.vinarskis@gmail.com>

On Thu, Apr 17, 2025 at 01:20:48AM GMT, Aleksandrs Vinarskis wrote:
> Appears to behave similarly to Parade PS8830. Found on some Qualcomm
> Snapdragon X1 devices, such as Asus Zenbook A14.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/parade,ps8830.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

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


