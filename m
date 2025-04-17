Return-Path: <linux-arm-msm+bounces-54647-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B899A9200A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 16:43:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E65A3A740A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:43:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB832517B9;
	Thu, 17 Apr 2025 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A2cl2VpN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0022517A7;
	Thu, 17 Apr 2025 14:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901017; cv=none; b=UG/ydPsw2bLHtud4qk5SYOFpSTGmfnNk+qZ22zCgMtwBdrH4sx05aQD4MBzXgWBu7RCvR9fAyf6NXUX3PLrFaFBahzkw+0WYHA55i26UWuljnFeBTnnRKGi3D+/2jjOFv129iX31em9QJbpMuO3/2IbIEVAia5U68v3j21klrsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901017; c=relaxed/simple;
	bh=S5ZVaseqUuvrABoaIpwk0yu6FEYrxOLklzkrs//Q+eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQXthp6X8IC0ueYret/w18hvpz5Kd3YANABzcC4GO21l6j8r1Ek4STK2aQeq0vwlwV5rQf8WiImM43L2ERwsjdWjOs+0b8D6XleCUaEXUkUvJg/ZZmtYmyGuRAGL7LGwKOyJJ/xFGweSfjZpCddPG5v6pISohQo07UZAl/C+iOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A2cl2VpN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90346C4CEEA;
	Thu, 17 Apr 2025 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744901016;
	bh=S5ZVaseqUuvrABoaIpwk0yu6FEYrxOLklzkrs//Q+eQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2cl2VpN0eoon2IuVVtJZ84THZGWSgoQt4AZf+EudG7D3pBjk/4CeZCY4GHhhtOZU
	 7fKp+/5U3Q5+/e/h65mXl++6XQPlOAqSWJiRPYKsHlJkzVeG3YB6uW8LIIfwGz8HV9
	 BATM0TdruGKibHKJFXc59Ub6l+6n2Pd3EZAfcC+uagnoAtCP7aBtAV6HyeSwOe4++F
	 x2SQCUuvfW6hhiY/iRdYI0QsGw8N30r3V753hxkx/WKHHv9rnO2PHmDZK4jFjmUULx
	 E/Z7HXHFW8OjsAjPLlJzv7nmP87tZrEW6csnYlxs3kg2u5deILG849IgbAXljxAVu0
	 0O+Xlob8ylo2w==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5QSm-0000000016t-457c;
	Thu, 17 Apr 2025 16:43:37 +0200
Date: Thu, 17 Apr 2025 16:43:36 +0200
From: Johan Hovold <johan@kernel.org>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
Message-ID: <aAETmEB4liEf29bP@hovoldconsulting.com>
References: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz>

On Thu, Apr 17, 2025 at 01:38:39PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> comparing with CRD and other dts for a more complete support of the 7X
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
 
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>

Unrelated change.

> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>

Not needed with another unrelated change further down dropped.

>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  
>  #include "x1e80100.dtsi"

> +&pm8550ve_8_gpios {
> +	misc_3p3_reg_en: misc-3p3-reg-en-state {
> +		pins = "gpio6";
> +		function = "normal";
> +		bias-disable;
> +		input-disable;
> +		output-enable;
> +		drive-push-pull;
> +		power-source = <1>; /* 1.8 V */
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +	};
> +};

Unrelated change.

Johan

