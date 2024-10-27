Return-Path: <linux-arm-msm+bounces-36086-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2239B2043
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 21:19:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 952711F214A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Oct 2024 20:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F4B817B50A;
	Sun, 27 Oct 2024 20:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlTWgCHP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C6317736;
	Sun, 27 Oct 2024 20:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730060357; cv=none; b=a72PxE+s32XFlgPLsVKpb/px0Le5sHxNdNJ9B6g6ik7Pp1OkVeMVmxsC1EDlxKM53vCjvcfJEQkuX2V13rARalaFWIavjxi4w8pn8mb8dEeMpRl05B4tvFZ5UJcdsu2u1z2DGedIG9CSiaQiNpc8vTTNH3fCHiALqhK8SjoSElc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730060357; c=relaxed/simple;
	bh=vs/zKde3mmVVEHbutSfzn9KaQYfcpV6gzt5pasJjJ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0BmTntAlIRcpcinkdB/iG1CJD7nf55Lz3RWg3P1R/DOEh/7cNofy+1NB77j6hm4Nlk3klaa543JRQaVeMlAiUCnHMM8wpXqXMpwhXAgpvKvZpFF14fPEiZdVFITNmSNsuQCdVqC7a39qev7e+aUBspUmFeTGiD/Fs+NEUnCrwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlTWgCHP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48727C4CEC3;
	Sun, 27 Oct 2024 20:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730060356;
	bh=vs/zKde3mmVVEHbutSfzn9KaQYfcpV6gzt5pasJjJ8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlTWgCHPyoE64masgPL2i8xPK+fQh8+rbiUYO1vWKaq7aD1OyOTkCis2rsgelsqna
	 WwfNr1NTsfDKE2ve/REtqNtYdbvj0GE8UnmDOQRHS1roEWelg7zIKXLDC6pLLqOejM
	 NIPuiAqQ3UWu0Gicp1nb1fLMAwy1YeRf6UjyFuEPJ3+xgO8eEW2pcXKAxxaawmEzMu
	 KmG2kjQe/ZF/Y4VFhOk9skdi8oMWTpIvWy4uzA8cZJFm+KtkutGUv5MWd+5ZyzYa8C
	 gveOlWXXxLQpG1qJX1Y8mb8yVEoe1LVCNPXMUtkRhxREkhENneY3Ygs2ewrontaqyY
	 jszG+UVtUsg2g==
Date: Sun, 27 Oct 2024 21:19:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Merck Hung <merckhung@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: Add Microsoft Windows Dev
 Kit 2023
Message-ID: <jcv5ywftxggskbcyzbjmgiacb7kii7zmioenf7jfrqafke7zks@ge4vfzxmxap6>
References: <20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz>
 <20241027-jg-blackrock-for-upstream-v4-1-703b254fc95f@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241027-jg-blackrock-for-upstream-v4-1-703b254fc95f@oldschoolsolutions.biz>

On Sun, Oct 27, 2024 at 02:02:16PM +0100, Jens Glathe wrote:
> Add compatible values for the Microsoft Windows Dev Kit (WDK2023)
> with its codename "blackrock". The Dev kit is a small desktop box
> based on the mainboard of the Surface pro 9 5G, intended for
> developers to test/build arm64-based Windows software.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
>

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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


