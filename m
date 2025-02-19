Return-Path: <linux-arm-msm+bounces-48526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2FA3C3BC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 16:36:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 782031764AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 15:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF091F8BBD;
	Wed, 19 Feb 2025 15:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6OSmOqv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F14201DE8BE;
	Wed, 19 Feb 2025 15:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739979396; cv=none; b=X8lAqFiB9/fYYr/CCk9im5lq3XX73+HKyKYqn66ghMFPAuefPQMsRlivTKDvw3h42YDIaoTSdCH36ykMwXVBNS/2HvOzMkDIplJXOss6qBIwfyRIDdP2VT4+zDk6Rj4jCe0m6LoTJgIgmrM9k/gN9ozbg6o43BzlFXUrM6mPXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739979396; c=relaxed/simple;
	bh=a3GoHWAtbGEX5SYxHIAKqAqipfDcxdOpT8UtE5+wBX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=strVpxjpvdwfiYIvjjlD+X8rSmE6g+Zhk6heBdCRHB0YhlOxYZoYPGKWsvCX8gWrnVz5xzjcsvVTlfdglT0wgR2McRthWooj7PKvh/pmLrRbZ8Haqh8GR6auP0WtDIovjQFMGx7tt7wcLOjTSt6ohL7g8gPO4bQbqSyFBOUF77E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6OSmOqv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6725FC4CED1;
	Wed, 19 Feb 2025 15:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739979395;
	bh=a3GoHWAtbGEX5SYxHIAKqAqipfDcxdOpT8UtE5+wBX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S6OSmOqvmKP3TboFyrwmpiegR2HtvWZGRS7d7jlMNPqXqXpwjFTFPi69O64bRQqYj
	 3GQWH5zdJusYM5PEz5SuPTF5evUA7UZufw3EO4janDzg2fKTJ7vWyi8B6dWJG1+kSC
	 +RydITHFHvkQcQ3I98uQcHeY6ZkhWFQSDSnaNIrU9Bq+QZtI5iw5bXPY2QTwma++a9
	 0MHb6EZkmknga/aHnHYx506KNrdNzF5xcGvG0qwqDSbTL1PF1XbnQe4aBig9S/sK+r
	 a/+jbDzeQOHG94QmZKn7Z+YPpMsM9+4qX90HQygA6xQnersG3Sgx9BPWgnoHN0qtgu
	 BFi9lM1T1QjkQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tkm7x-000000003PB-0mbg;
	Wed, 19 Feb 2025 16:36:45 +0100
Date: Wed, 19 Feb 2025 16:36:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Akhil P Oommen <quic_akhilpo@quicinc.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] arm64: dts: qcom: x1e80100: Apply consistent
 critical thermal shutdown
Message-ID: <Z7X6jZev8fpoq0Ih@hovoldconsulting.com>
References: <20250219-x1e80100-thermal-fixes-v1-0-d110e44ac3f9@linaro.org>
 <20250219-x1e80100-thermal-fixes-v1-2-d110e44ac3f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250219-x1e80100-thermal-fixes-v1-2-d110e44ac3f9@linaro.org>

On Wed, Feb 19, 2025 at 12:36:19PM +0100, Stephan Gerhold wrote:
> The firmware configures the TSENS controller with a maximum temperature of
> 120°C. When reaching that temperature, the hardware automatically triggers
> a reset of the entire platform. Some of the thermal zones in x1e80100.dtsi
> use a critical trip point of 125°C. It's impossible to reach those.
> 
> It's preferable to shut down the system cleanly before reaching the
> hardware trip point. Make the critical temperature trip points consistent
> by setting all of them to 115°C and apply a consistent hysteresis.
> The ACPI tables also specify 115°C as critical shutdown temperature.
> 
> Cc: stable@vger.kernel.org
> Fixes: 4e915987ff5b ("arm64: dts: qcom: x1e80100: Enable tsens and thermal zone nodes")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>

> @@ -8483,7 +8483,7 @@ trip-point1 {
>  				};
>  
>  				cpu-critical {
> -					temperature = <110000>;
> +					temperature = <115000>;

Have you asked the authors where this lower limit came from (or
determined it was just copy pasta some other way)?

>  					hysteresis = <1000>;
>  					type = "critical";
>  				};

> @@ -8737,7 +8737,7 @@ trip-point0 {
>  				};
>  
>  				video-critical {
> -					temperature = <125000>;
> +					temperature = <115000>;
>  					hysteresis = <1000>;
>  					type = "critical";
>  				};

Ok, make sense to backport the first patch as well then.

Looks good to me:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

