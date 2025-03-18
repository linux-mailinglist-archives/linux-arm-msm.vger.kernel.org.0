Return-Path: <linux-arm-msm+bounces-51690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 356DFA66EEC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 09:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B082F7A46E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 08:48:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99181FDE2E;
	Tue, 18 Mar 2025 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lw0oHinV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995291581EE;
	Tue, 18 Mar 2025 08:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742287783; cv=none; b=uoiTvOvLlmNUpqcRxoWpoCFMOp2B5VrQVw2PLAzPhqF4eqVXSyuO+Qy/5/kRo+lOBkhQr1P+VbGBf52CTfBnG4B7cKzzypp/hrXahPrYJIWJYT51uMTHfTV7XDbI5MknbJTNkPRYam2zsuee764mlV9Q7S8fPxkIaXk4H5EiPKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742287783; c=relaxed/simple;
	bh=LT8Be0w97IXB5NCzERknR1RxHatwswhPBFFNSAAz2lw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W6Nd+UjPOI0rabx/jkR7NoZJVhWSoY+WCkx4hk6uHxzkoImN1aund1QhMujtlDTNSgk1yQSRjDNRFmqmvwAmH6HEdaQJjUoVWA639dQed3o/H6AoqgsLeRlkVXln2VmTPP0Iq7rcfF9axFFLz/EUCCqHAJrJXiZ6halYtQm4gV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lw0oHinV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21ED6C4CEDD;
	Tue, 18 Mar 2025 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287783;
	bh=LT8Be0w97IXB5NCzERknR1RxHatwswhPBFFNSAAz2lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lw0oHinV8//6Bhpbl6LJKqZzVXdE4SVKncyCOOFQhwBPSkkrU93FqeG9dvehrRKuC
	 2cKAMrbPOy3Onm8w0nc0LkXmdGBSZtVuZ1Le4wKXxVqamnwhi4k/s4TaRfF5hsZXZ6
	 BJrlAjo7G06j7rhcECTkYyGxF7pfkkJvdjp6DIV4c8h3vxd/UipW46VUj/5uK+IrxE
	 m+ARwvwxtQfO9vxQ6tBtoyabe9yCQuomCiPlEoRWK1kea5WYyxHRbpxc1812mBpxEu
	 OWOFkoKfC4ogTt5cuwTwW4ZdcRG2JM+W9IFAd4g5t/2XINm4N2K1WZIuC0+yXZVDtA
	 SALucCdycfr4g==
Date: Tue, 18 Mar 2025 09:49:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: qcom,wcnss: Document local-mac-address
Message-ID: <20250318-benevolent-bat-of-politeness-119c9a@krzk-bin>
References: <20250317-wcnss-local-mac-v1-1-c7c60d4427be@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317-wcnss-local-mac-v1-1-c7c60d4427be@ixit.cz>

On Mon, Mar 17, 2025 at 09:26:05PM +0100, David Heidelberg wrote:
> The device and driver do support setting a custom MAC address.
> 
> Fixes: c49e9e95f4d1 ("dt: binding: Add Qualcomm WCNSS control binding")
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> index fd6db0ca98eb7e56d7399f55c408844d5e782805..6938dc4ccc2175a65f6f53c6d073fb72cf498b2c 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,wcnss.yaml
> @@ -68,6 +68,8 @@ properties:
>            - const: tx
>            - const: rx
>  
> +      local-mac-address: true

Which referenced binding provides the definition of this property (its
type)? AFAIK, that's not a property of Wifi nodes.

Best regards,
Krzysztof


