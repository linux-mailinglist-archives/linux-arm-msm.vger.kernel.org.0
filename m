Return-Path: <linux-arm-msm+bounces-84797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1E6CB128D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Dec 2025 22:19:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 94CC1302258A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Dec 2025 21:19:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B091930CDA9;
	Tue,  9 Dec 2025 21:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fd6lSjtb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC630C62F;
	Tue,  9 Dec 2025 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765315147; cv=none; b=QxDwngD84RP+KSgNJXZxGqSEN9kfqANVp7LfmH5jXZ10naS6YuCaDjys14omhmzwefqNc6/L/oMjli+oF+x539+/u7KeCHsOFHRXZWiSVOMo1dTsZrZDzHqUOJoemR9/50KY7uDgLsp+B5+uQsMLEyUyjZacBxlz+jGIVZVk6do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765315147; c=relaxed/simple;
	bh=pDSgft3va/X+kqW8q1URovj4IThmlNfci9JAAQluSds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JBtuhkXfQyKnoZWiC6KgkIyaf6hXLNvmeTYmqErPAafKaDR+1GyesR+7BK+15NJTBwpV8UghHy95X3SBxXqmxn91xN9aQ16hMkRDHIR2P29BxRtzWR+xLLIMGSoCS8LFpjJJ1kSqF9GvfO5a6rZhzXOgY1wohIj5ZKnQg97VJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fd6lSjtb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4480BC4CEF5;
	Tue,  9 Dec 2025 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765315146;
	bh=pDSgft3va/X+kqW8q1URovj4IThmlNfci9JAAQluSds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fd6lSjtbq8lGthxyj1Q76N1Jfsg5QS3SbhTzwHObRq71hVx3naLJ1zsTIGjirxeK1
	 Vk405Qm0okSikGQiDAyujF9mZDEKQ5ZBjZJ5rs0DRy41r+4VtuIfQLJnuduXhdXeOC
	 h3zOtiqg1041jp8nNBK4B14IGvHbjogTUxz4bZvwbD4/5fpOZbEiMr75dwyEuV7kPd
	 uJlAJTyH9Z4Y089hswCRzxdwF4ZXov/02Ylkc0MVsO4ShyMtjqhwtB7SSYNKb0QPox
	 QhRuUEGLYdnrh960qyeuTD6DQ6ga7fR9EDtmDt7COacYbyubn+nWxFXT+yEtjOzu+J
	 XxOlz2OgSZHtg==
Date: Tue, 9 Dec 2025 15:19:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	phone-devel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH] dt-bindings: remoteproc: qcom,adsp: Re-add cx-supply
Message-ID: <176531514393.1121410.3278248360744028841.robh@kernel.org>
References: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251207-adsp-cx-fixup-v1-1-0471bf2c5f33@lucaweiss.eu>


On Sun, 07 Dec 2025 19:35:35 +0900, Luca Weiss wrote:
> Some boards (e.g. sdm845-samsung-starqltechn) provide a cx-supply
> reference for the SLPI PAS.
> 
> The Linux driver unconditionally tries getting "cx" and "px" supplies,
> so it actually is used.
> 
> Fixes: 3d447dcdae53 ("dt-bindings: remoteproc: qcom,adsp: Make msm8974 use CX as power domain")
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's literally one board using this upstream, judging from that I'm
> not sure this is a misuse of cx-supply or what exactly. An alternative
> to this patch is of course removing the usage in
> sdm845-samsung-starqltechn, but as it stands right now the patch under
> "Fixes" introduces a dtbs_check warning.
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


