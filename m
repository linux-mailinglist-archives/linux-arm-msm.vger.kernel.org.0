Return-Path: <linux-arm-msm+bounces-31187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599E96FDC7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Sep 2024 00:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 405071C21723
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 22:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBCF41598EE;
	Fri,  6 Sep 2024 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AU6hM6vP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D43D15748E;
	Fri,  6 Sep 2024 22:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725660210; cv=none; b=cVGVU03gekJIXN4ilgHbNAKObYlVyOSBT6k6dHhX/n5t3FHvzEs8bWwUEVJE4gzfaaB+2eS98pdEWCfzyZq2JWib3GI+m10Dnmt4diQaScqLRDYpA01VMmjlKpUW4EF2TuI6DMGuw/xieTRrxJgBRhypVirb1jQuBTQ7KjzKuOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725660210; c=relaxed/simple;
	bh=L0W4HDSLnaP+pn3BjhT0QyxYstEQC5ZtSyu/iFtJAkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7RUItJG7wzAYwCXUK7CqA10FfyDVYdYz2Ur+WIBNO1uqZVqq5DdqO86dLG6XjQDXkF+/zMkDMPS7iMkKkptGsd3p+KzVggjDcjZcislLtA30/IybpAdsfNKK0LL9xMSIcushPORNdtShvSmxaDiIJsZH9raUOnltDO3O4fSA1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AU6hM6vP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13034C4CEC4;
	Fri,  6 Sep 2024 22:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725660210;
	bh=L0W4HDSLnaP+pn3BjhT0QyxYstEQC5ZtSyu/iFtJAkc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AU6hM6vPA5Agx76y4In0AXTLXVOOhhESslWQTBdv58XrfQmtMmXIsBUpbuRfWbmiM
	 bbZrtehB6FMXHP5DUwvA1w1zwnzoAyMXc0NUggB3XDkAyIIKkM1FSU3hA3qNCGfVi+
	 kZOMKWm1E5EKZF6IgWV90tof5dWzDdPGc4YoYSuW3dsd0Wcsypsyr0bUgQoPBgNABt
	 ZaN6We6gV/2U2xeQs5jnl6sMdTOVmlugXGDR8Hmwh9QWYQR4OPI+sihzZ6bWTpiCsi
	 /gEgHQfnJoWXfVvmYGdGLFpaIVjYiHIy5lJRPTqtRwH8aLFlYtocSpUwFA91UaiONk
	 VZDK6HGEUZOCQ==
Date: Fri, 6 Sep 2024 17:03:29 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: quic_psodagud@quicinc.com, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, kernel@quicinc.com,
	tglx@linutronix.de, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: interrupt-controller: qcom-pdc: document
 support for SA8255p
Message-ID: <172566020817.2280011.10138910976692002708.robh@kernel.org>
References: <20240905191510.3775179-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240905191510.3775179-1-quic_nkela@quicinc.com>


On Thu, 05 Sep 2024 12:15:10 -0700, Nikunj Kela wrote:
> Add compatible for pdc interrupt controller representing support on
> SA8255p.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---
> 
> Changes in v3:
> 	- Removed the patch from original series[1]
> 
> Changes in v2:
> 	- Added Reviewed-by tag
> 
> [1]: https://lore.kernel.org/all/20240903220240.2594102-1-quic_nkela@quicinc.com/
> ---
>  .../devicetree/bindings/interrupt-controller/qcom,pdc.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!


