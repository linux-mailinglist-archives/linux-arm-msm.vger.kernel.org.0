Return-Path: <linux-arm-msm+bounces-50803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70568A59020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 10:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2AF616BDDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 09:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD9A226188;
	Mon, 10 Mar 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pFXbmNKm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF25192D83;
	Mon, 10 Mar 2025 09:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741600007; cv=none; b=dJvja/q1YkoHNW6EZcXiupYw58Kw2sKp/4vh8kT9Rc8Twt3oClfGgADTkTkKt0YRAkeuLKT9LibQLOpaHAbM3s65H4gmW5WR7hU7IeZT9ev6VBVmeEgFLJex+xpAiGtKz2KfUYyvr4tbC9A2oylrRIZaVpH2xYizXHKr3FtnyoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741600007; c=relaxed/simple;
	bh=xNRn1g+n+FbsGD9Q4eXPkUuxwEu8HiEOIxL1FVQKVoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CRAuDCVQILVXUxQFtazge48Vv9LENwkYw8lE0BuCa/vWhDTQrr+mXTUQbj6Z/PYNRFBuZmw32oP84Y4hKnAsoJOa3YNLsVb4lfbxidyVJLciEJbq1MlXuGqhmiJpGmJZiux46DNMYxmPG4/2tQBX6N5jfGwa26C52fwQ0zPkdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pFXbmNKm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62EF9C4CEEC;
	Mon, 10 Mar 2025 09:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741600007;
	bh=xNRn1g+n+FbsGD9Q4eXPkUuxwEu8HiEOIxL1FVQKVoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pFXbmNKmF8LeSO66XZccPEIW6grIwOx4Ho/leWE2Hd6XJqthmnLJSLrU1SSBBtHdU
	 bOjjvpqa+uIINCEI2I7ASRxCt//3YfSEmRbiQYXuw6xLC3HiwU6cmRi42jiziLALn6
	 Lwoay39DJjES/ELE0ukF8WZ20rnCGIudDJndXvgDDcgxZailrEANdRi9JVv+pwX5mw
	 N4DqeJnQSZcRsbBlBFp0MwMeZWDLWnxSndlKMOo5Az5yV/cqJAtJ+UStMAIOUPuvqS
	 /MwmMo/tqe1KM+AVDcaiuuyzp9+eLtxGfZhXnGCqCUCMrM3CtuHQvkFz6eIB8A92yY
	 xKTW2Q+OB6Jqw==
Date: Mon, 10 Mar 2025 10:46:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Gonzales <semfault@disroot.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
Message-ID: <20250310-fractal-ultra-anteater-ebfc36@krzk-bin>
References: <20250304043742.9252-1-semfault@disroot.org>
 <20250308013019.10321-1-semfault@disroot.org>
 <20250308013019.10321-2-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250308013019.10321-2-semfault@disroot.org>

On Sat, Mar 08, 2025 at 09:30:11AM +0800, Gabriel Gonzales wrote:
> Document the Xiaomi Redmi Note 8 (codenamed ginkgo),
> which is based off the SM6125 SoC.
> 

Do not attach (thread) your patchsets to some other threads (unrelated
or older versions). This buries them deep in the mailbox and might
interfere with applying entire sets.

> Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

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


