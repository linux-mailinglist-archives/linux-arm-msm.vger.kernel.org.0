Return-Path: <linux-arm-msm+bounces-36537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD369B767A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 09:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17C861F2332E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 08:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D609B16E860;
	Thu, 31 Oct 2024 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pmoC2mo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80BB148832;
	Thu, 31 Oct 2024 08:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730363355; cv=none; b=SBSqbBS5AwM/oc9tD3dBlssX8HOOndT2Iq46szNCpWg6nM00LJ4w+iOce5Lc8mKZRDmmKQ8SZxfg7dfXBJqLvi0c1JJmqPMg9j3xQ8aSM3LiD8NZE+Rv1JJT0nSB8UN7kuea0gKNWeyJarODiFdqxseuW4OOIRLuyLR1G/mv3ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730363355; c=relaxed/simple;
	bh=HUJKSjVqr/C9IyyCjAqJ8nw6R24KeTevM9EzbDzH414=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kN05K6+PRhIeVdRaXc/ZNVTWvtMTM0rBZe/Thpi67b9stljF6FWDov1LHq4chERogDx6UBHxFnqO3z2UvitS+SC3laHs2aa3WU8ayJVXJ1ME4Gm+q8tzX5Lnz13pgRH/1Dl48wSLC+AWpqWKKxHPE7odYvSFp9uosMpmMvuM+jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pmoC2mo0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B5ACC4CED2;
	Thu, 31 Oct 2024 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730363355;
	bh=HUJKSjVqr/C9IyyCjAqJ8nw6R24KeTevM9EzbDzH414=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pmoC2mo0J3M/qIU1U/SMCdyF1ptX5aYWAPYcvOJbdd7nE6wipU78blWRyaJfyCuPh
	 X8UTrjZvw5WJf1qUs9HUvvlwIgKUeg5RJ9VSLMViS6OhnUWCpLN8SfSs+OL2jOeI9x
	 yYWdeMsC/kX9S3YhBYwcr9IbI/dmC9PtB7e37m7Yjuxr9iA4GhoE0Ea9wjnhFRFX+q
	 nBUk8g93cvcSrxifpgasc+xSHtgtS79RYA+DwlS8wbdUYl9pv3bq30GQWZkFlhNFqk
	 0ZKvkPxrtVa7IZd5/ejnaZwF6+9CBjgwEw+S2YK8LW7EKAFldwT3D3ZXynh003nAtA
	 dTm2Ei+rs05JA==
Date: Thu, 31 Oct 2024 09:29:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: arm: qcom: add missing elements to the SoC
 list
Message-ID: <hmk4d4dzasvas6o6xzdmvevdxmpaw6aszejt65ele4gqseljtz@njj52e4n24xd>
References: <20241029-qcom-missing-socs-v1-1-c5bf587b0afc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241029-qcom-missing-socs-v1-1-c5bf587b0afc@gmail.com>

On Tue, Oct 29, 2024 at 06:35:25PM +0100, Gabor Juhos wrote:
> There are multiple compatible strings defined in the json schema
> for SoCs which are not included in the SoC elements list. Extend
> the list with those items for completeness.
> 
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


