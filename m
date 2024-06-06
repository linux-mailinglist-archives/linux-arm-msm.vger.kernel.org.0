Return-Path: <linux-arm-msm+bounces-21838-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA928FDCF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 04:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDA131C21D20
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 02:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBC2EEDB;
	Thu,  6 Jun 2024 02:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pva7hIlu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F64139D;
	Thu,  6 Jun 2024 02:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717642035; cv=none; b=hX3rw9wwiB/6Eaj/pAJf/vHzKsW0ye/4AkZWdK1S8dbcLgWzHjc4KJlDsSbXr5fqQyhppYK5F5v3xbfZHhXZXqNE19oGimxdBHNiTbRa5CsMqNuvXThY1w2KiLUcbA7j2jps+hDCwcEATK5JaOaZHL4wLhIwv+W7wymm/gqK4ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717642035; c=relaxed/simple;
	bh=OCJiEgy9tJAw6Ik8v8Mb0iBolC0aO+z8IdgdtggPJdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PD25pacvfXg7Ul8FaKe1aUXQ/r6pJL6aKFMn9CA0r/JSSMQmUP80Qy0T+Clwk4U1DDMRKT7Fvpn017xuyIhTfDrRk4Gn4kLmaN4YSkDlzcKPYWhw5SrKaWejisDi5F+VFTQ6sX16t8qLqNswcxec15Nn+wVeJn0E/fkUZifi3zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pva7hIlu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D08C3277B;
	Thu,  6 Jun 2024 02:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717642034;
	bh=OCJiEgy9tJAw6Ik8v8Mb0iBolC0aO+z8IdgdtggPJdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pva7hIluK+c2WHXSoybcZIJFmICZmGe708BkvN6oa4Wpqmrcx8Wbpn0/sUSFAoTjn
	 5BguwC3eq/XeACNnWq/7Tp/qV+BEimyLSxQWTc0+TpIY1HRVXPCVDiJTguO7rkXacy
	 ZX8AywrSvpcKE8fh5dThXZXCQ67fsFDFtylcZzMGLftPXm9CVKuQYvgeiQK/ulamAX
	 uT9ooP+vUIxVuCSzzKClZk6gAMLEJ/eS0CxWvT7XQbxD9M9SBEo1+PO0m6PNboAajW
	 bbcIJQBZOE5PpylYzQ/2xobpwaI7A+v6vHFKEHztXOkRgetqJ9uWUH34OZ6zCQsujJ
	 ALYDo/zpajQLA==
Date: Wed, 5 Jun 2024 21:47:11 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-crd: add USB DisplayPort audio
Message-ID: <gqcbvowfma7l4lmqeom4pczjnl5anxtn5brsp3ttu4fisgcw7u@ax4eqlpfqnc4>
References: <20240604094947.98191-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604094947.98191-1-krzysztof.kozlowski@linaro.org>

On Tue, Jun 04, 2024 at 11:49:47AM GMT, Krzysztof Kozlowski wrote:
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-crd.dts b/arch/arm64/boot/dts/qcom/x1e80100-crd.dts
[..]
> @@ -836,6 +868,7 @@ &mdss {
>  };
>  
>  &mdss_dp0 {

I don't seem to have this node, did I loose a patch somewhere?

Regards,
Bjorn

> +	sound-name-prefix = "DisplayPort0";
>  	status = "okay";
>  };

