Return-Path: <linux-arm-msm+bounces-63983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E74AFC52A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E05F4282D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6566329E0F4;
	Tue,  8 Jul 2025 08:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxvoE/46"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3E225A32;
	Tue,  8 Jul 2025 08:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962407; cv=none; b=LMFswBBkqJ8E3P3IGUWamM89Uk6lX7OVxyYQQdcQ2kV/i3BHltUYIYnHpdHEm/L5o9xvskieu6M9VoV6sri8p8D2rlsHclpS04+wgB+Bb4twTFmsIxySQm+6d9/PLtox+hE/+VSCqc3nsajhlBfHJ5lwcSjwV6uwA7ltLn1o6SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962407; c=relaxed/simple;
	bh=IdEEqJgpLKbcD7sTVbhaftdzJWqxKOBVJK3x+y+VwFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dSHngFEAJ7NFEYX1I5mv2BvXJjRXhN+njqIxYfz9Zh9ONwvFr8hLUAapaAGVb5Ef8fkVRJ61yRgU6baATXSaaH4kbhatAW114obFrnbk9182zxlmlRsmqwtVINauhETQG0Wf72tQ2PTOFyVnJf66iC0eLzDdp/ShR/lvE1sZtRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxvoE/46; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DF1C4CEED;
	Tue,  8 Jul 2025 08:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751962406;
	bh=IdEEqJgpLKbcD7sTVbhaftdzJWqxKOBVJK3x+y+VwFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QxvoE/464GhLEIcXv9+UpERUaYoXdEvY5UPkSzKbcXrTx1hpxW24jlLLzgUWdGNGJ
	 T6Utld4A0nBBlZtsXZdssxrdGzUtWsxGRM6A1WnVucznAo0zsGriIMlmPw1WkGzT5p
	 bmizdgE0azGBVtoFsBPuEA6N/A4+nyxnTFzqvxbkofa7AJRZsE3Jf4veoxO6+/0bSB
	 lzTuZG06juX5Bmqp7LUQ3x9ep5pAwGUBcET9OASXXNVnmgRDwNIq2vy/YM0aBzPhhO
	 5LL47dQFz2uTXpbw3WNKZmXPlFa6ZQ47Q4MNDZC0icjT0MZa9q8efKtuSE0Vc8bGUx
	 qvkIUbkHb8PBw==
Date: Tue, 8 Jul 2025 10:13:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Document
 qcom,tune-res-fsdif
Message-ID: <20250708-unicorn-of-ancient-excellence-e8945c@krzk-bin>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-1-19d85541eb4c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-1-19d85541eb4c@fairphone.com>

On Wed, Jun 25, 2025 at 11:14:56AM +0200, Luca Weiss wrote:
> Document the FS Differential TX Output Resistance Tuning value found on
> the eUSB2 repeater on Qualcomm PMICs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> index 27f064a71c9fb8cb60e8333fb285f0510a4af94f..6bfd11657e2992735998063b3ca390e04a03930d 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> @@ -52,6 +52,12 @@ properties:
>      minimum: 0
>      maximum: 7
>  
> +  qcom,tune-res-fsdif:
> +    $ref: /schemas/types.yaml#/definitions/uint8
> +    description: FS Differential TX Output Resistance Tuning

Resistance is in Ohms, tuning could be in dB, so I wonder what are the
actual units here. Neither commit msg nor this description helps me to
understand that.

Best regards,
Krzysztof


