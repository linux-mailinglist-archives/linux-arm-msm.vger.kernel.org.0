Return-Path: <linux-arm-msm+bounces-53993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 74765A85B94
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71F63462354
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B16D238C28;
	Fri, 11 Apr 2025 11:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQncZjRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C5421146C;
	Fri, 11 Apr 2025 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370736; cv=none; b=ImyqEZZ8quJUW2f+/iIkYURbdjLTmxnXZ4oz3zYJJzZ58IYjy2FY4aSl6nIpH+Lj9bOPQcqcJ94t0s6X700Gsk/8CKC+PXMeWQPfRI3UxPzloIGOHfcJXIXwTMDPpXBkHgiQcsrMZkH91uCCa5n8W63j4WRjQWIu7MdJtnBgQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370736; c=relaxed/simple;
	bh=5l3bqjZl+ty/hdXtbzKmsUlfDUP//EXNCWO3BwwnVQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lgwymuv6AdKZ01miUvIWFZNRtluOiCqHMI6vGnCB1SiQtA782hMyWW+zAzMuga4AGSLeIYM1Vfwv4Y+B1HjLzBn8oGKAOYPl4cPCo0C4fMJxJcrHUBKX4dmKxpP8MzZdX118j6Msj5ILlRju6K5J1FSC8pMSoR4fw5mPncXSvYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQncZjRG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DB1EC4CEE2;
	Fri, 11 Apr 2025 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744370735;
	bh=5l3bqjZl+ty/hdXtbzKmsUlfDUP//EXNCWO3BwwnVQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQncZjRG98uxDMN44XqlPZgt2NTT1cJrmCzifzTQ06fCVUeVrzZO+mlHhzEzZTook
	 40DFfj0FeXvdmtQvAqyO/jwcDP87tWUZW/h6Q2O4m6WxsxICdWfn4wS8aFeMKeuEf6
	 OLojEheGa/9fonpiJPwxbKsdWX012NMXe2SkCDtvjQUXW4v7FKe7HAkaQxpb73gi5H
	 Nb5gUb/lbzggKqlmLktJovekl56AkBz4hrHgoyVoXVhBu/I67rdCCf2GuyOIA5omEx
	 mq3pDblo5+6DAQyOeTUJFGWMgunPGqJznLdeoOs6yJhAw+0seM00HF4yeoMhvXFjBp
	 1Vg6AV4KtiZow==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u3CVv-000000008SK-29OY;
	Fri, 11 Apr 2025 13:25:39 +0200
Date: Fri, 11 Apr 2025 13:25:39 +0200
From: Johan Hovold <johan@kernel.org>
To: jens.glathe@oldschoolsolutions.biz,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Message-ID: <Z_j8M2Q0J3LuANAF@hovoldconsulting.com>
References: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
 <20250410-hp-x14-v2-1-d36414704a0a@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410-hp-x14-v2-1-d36414704a0a@oldschoolsolutions.biz>

[ +CC: Stephan ]

On Thu, Apr 10, 2025 at 12:07:28PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The usb_1_1 port doesn't have the PS8830 repeater, but apparently some
> MUX for DP altmode control. After a suggestion from sgerhold on
> '#aarch64-laptops' I added gpio-sbu-mux nodes from the x1e80100-QCP
> tree, and this appears to work well. It is still guesswork, but
> working guesswork.

Did you confirm the three GPIOs experimentally, for example, by making
sure that inverting the enable signal polarity breaks USB?

> +	usb-1-ss1-sbu-mux {
> +		compatible = "onnn,fsusb42", "gpio-sbu-mux";
> +
> +		enable-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
> +		select-gpios = <&tlmm 178 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 = <&usb_1_ss1_sbu_default>;
> +		pinctrl-names = "default";

>  };
>  
>  &apps_rsc {
> @@ -1424,6 +1451,30 @@ reset-n-pins {
>  		};
>  	};
>  
> +	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
> +		mode-pins {
> +			pins = "gpio177";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			output-high;
> +		};

This is more of a question for Stephan who added this to QCP [1], but
why is this mode pin here and what does it do?

It's not part of the binding for the mux (which indeed only has two
control signals according to the datasheet) so it looks like something
is not modelled correctly.

> +
> +		oe-n-pins {
> +			pins = "gpio179";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +
> +		sel-pins {
> +			pins = "gpio178";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +	};

Johan

[1] https://lore.kernel.org/all/20241212-x1e80100-qcp-dp-v1-2-37cb362a0dfe@linaro.org/

