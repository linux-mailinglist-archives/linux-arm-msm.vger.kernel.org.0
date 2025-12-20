Return-Path: <linux-arm-msm+bounces-86012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4992CD2C06
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 10:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2A34F3001639
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 09:17:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8482D2FE598;
	Sat, 20 Dec 2025 09:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WD04EP1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8D92FE577;
	Sat, 20 Dec 2025 09:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766222254; cv=none; b=MtA3ccADWjQRBR9YFg+UEAP6g3w2+YvAoSWN3X9fm5YTxsYvxE0GNPc1nW/Yfr2lQAEZExtyXm//EjH0pOCMVTEsEwfPQnAsqk9PYwL2VasuS9ngwk0lo/u4+IA7p2e4s1fZv6a3ZUJae7RfIzyPZRt3SnUEuFLbB/+Mt4wZzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766222254; c=relaxed/simple;
	bh=+jTxt28fw4qnhNHpHKvUV1SQFK1gzA7qo8dTmeuYUOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mK9gjrP3jncC76aCpxtWWuMm4et8hrH+UCNkYK66AS21GBRxlkT7Olz1gPEY/Mb/nAaWFLSFwjAtyHvwtKgbONR7yYvTrA15FDt3HpyIGcO7fJcMrvtOk9F3m3Xa7i21K993GTK3hSBky6gqFRhG2LfY4ARNXbWB5N63/t7oGAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WD04EP1X; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04627C4CEF5;
	Sat, 20 Dec 2025 09:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766222253;
	bh=+jTxt28fw4qnhNHpHKvUV1SQFK1gzA7qo8dTmeuYUOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WD04EP1XXqvqkxpnwP16ZBSod7NMhGBMnZEmQKMN7MCbZJsHFnFAWWatkonkyZcR0
	 kMbB9ia4JhimbHvWG79OfSLvAvrfcvw1VyTuNvOElRAoBoXywa32YT1sDHZl9G9sYB
	 3+94agXESpgRmDgs9LL+Z5/1Li++ulUPKd8PbYuHdULGXqAy8+y52fFJnlKb0bsN99
	 lFkPs4rS7Mdqc1XHj7WOCbkpXKXW5eFXXOGjkDEzJds4f0JPc8BeJcGEpqEigXkayl
	 dR5oNrH8Itbg5UY5PWLrc4fHRbHuZelBTm5NBhPeLVW2yW8YueabrpdRR2JDiutYsG
	 iPRlkdwAxP2EA==
Date: Sat, 20 Dec 2025 10:17:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
	Matthias Kaehlcke <mka@chromium.org>, J =?utf-8?Q?=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Catalin Popescu <catalin.popescu@leica-geosystems.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Pin-yen Lin <treapking@chromium.org>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: Add binding for Genesys Logic
 GL3590 hub
Message-ID: <20251220-economic-gay-firefly-1873a9@quoll>
References: <20251220063537.3639535-1-swati.agarwal@oss.qualcomm.com>
 <20251220063537.3639535-2-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251220063537.3639535-2-swati.agarwal@oss.qualcomm.com>

On Sat, Dec 20, 2025 at 12:05:34PM +0530, Swati Agarwal wrote:
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - usb5e3,625
> +    then:
> +      properties:
> +        peer-hub: true
> +        vdd-supply: false

This is not true. I clearly see VP33, AVDD and VP10 (and maybe more)
supplies. Not only in pin list, but high level diagram clearly marks two
supplies.

Please read again datasheet carefully, because that's your task, not
mine. I do not have even access to most of the datasheets, so  you
expecting me to do it is just unfair.

Best regards,
Krzysztof


