Return-Path: <linux-arm-msm+bounces-87524-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C94D4CF4B3B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 17:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB05630EB386
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 16:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA3634E777;
	Mon,  5 Jan 2026 15:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mQMY2dMl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE41D34E774;
	Mon,  5 Jan 2026 15:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767628717; cv=none; b=Lbxq0CKEhMnnyA+e7L4iefJzHd2cV4M2TK9cCXqP0F9a0dWKkBdGqGAR4+vuLp3qJVmG/GmWmjIBC25fu4fyCxZz8931zMgh36y7YsAQr2C3JXicZqNlrJMxzqFFspEMT3dp1J9aiQ0ca6waYww1W/V58wTAMCmdQKFmwLFkjPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767628717; c=relaxed/simple;
	bh=IwVqwO/wql9kjzzIZapNkNg8ZcCJb+RS8C0+amEfpZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eaOvs+YsBA3ngBTp7zi/iEwNlFmih8DaACXBpUYdI1jIusdq//+n5VV8JGKZr83GDNyjBixNPKacooZQXwR6wckyivq0ZXatVnMfb6c7yUynWutDM0y8WrkyuLiVBXVWNsLq3YlhReNtgri6sNguqcyS4Y2RJtloEz864w2HLh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mQMY2dMl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56A59C116D0;
	Mon,  5 Jan 2026 15:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628716;
	bh=IwVqwO/wql9kjzzIZapNkNg8ZcCJb+RS8C0+amEfpZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mQMY2dMlx6OrBwzX9ylvOjp7v073A0VfSedUB5VvMJKVTtco+PI8Zy3SATOCjVIjZ
	 mhJWu7Ehfg2sdPTTZMIjcpZly20G7UPR/Sk27W+7igVg1vhAx+EtrzW9uzUg+R1XYT
	 88CECi1WkAI5ClqT0LywrPIER7rIi7oVdQALPLU+TdGaWc6z/ct7ZUqz76sBR/f3SV
	 Ktz+XipIZEPewcTkmk+mJx1OvAIcL11pFKZifFEQSNdIvpAl1oY8wrFB4edAUZ8jw6
	 qx2+mVmXhjVWvx/clqOINXSoss79rnnBwCVbB/vj8mXKPyl4tU0WJamxa/hpX6mwgJ
	 y+Bfgv9oNDGAg==
Date: Mon, 5 Jan 2026 09:58:33 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: sm8650: Enable S5KJN1 image sensor
Message-ID: <v2ju7tu2cuedk6rnpidjrgkj7viz3dznwrlsu73w3ayon4mnx7@yacrjyyizhro>
References: <20251023025913.2421822-1-vladimir.zapolskiy@linaro.org>
 <176745617446.2631416.7464905538168539576.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <176745617446.2631416.7464905538168539576.b4-ty@kernel.org>

On Sat, Jan 03, 2026 at 10:02:59AM -0600, Bjorn Andersson wrote:
> 
> On Thu, 23 Oct 2025 05:59:10 +0300, Vladimir Zapolskiy wrote:
> > Enable Samsung S5KJN1 image sensor on SM8650-QRD and SM8650-HDK/RCC boards.
> > 
> > The changeset is based and tested on v6.18-rc2 and it has two dependencies:
> > 1) added Qualcomm SM8650 CAMSS support:
> > - https://lore.kernel.org/linux-media/20251017031131.2232687-1-vladimir.zapolskiy@linaro.org
> > 
> > 2) a new Samsung S5KJN1 camera sensor driver:
> > - https://lore.kernel.org/linux-media/20251023025356.2421327-1-vladimir.zapolskiy@linaro.org
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/3] arm64: dts: qcom: sm8650: Add description of MCLK pins
>       commit: 0ddb0d63453f320806727604702b6f6636a645c3
> [2/3] arm64: dts: qcom: sm8650-qrd: Enable CAMSS and Samsung S5KJN1 camera sensor
>       commit: 328407ba89ae6656c143967ba65465c50150aaf8
> [3/3] arm64: dts: qcom: sm8650-hdk: Add support for the Rear Camera Card overlay
>       commit: 1c20a021de58a23bdc264b91d75e944d19e49ba2
> 

Not sure how I missed Konrad's requests for the additional adjustments.
@Vladimir, please send follow up patches to correct the content that was
merged into linux-next.

Regards,
Bjorn

> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

