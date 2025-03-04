Return-Path: <linux-arm-msm+bounces-50193-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD86A4E069
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 15:16:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A34F1169F0C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Mar 2025 14:14:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775C5204F6C;
	Tue,  4 Mar 2025 14:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VMIW/0bK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49100204C0C;
	Tue,  4 Mar 2025 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741097643; cv=none; b=E9dsWt/O+/CBQ2iGS+1OM9UczK76GMyg8lFcEy7TNNTlkNlJVhTLK2xfd6cVEp/Z1tsrm6dKEe2DMKO//OYevmcegbhAvbqkI/Ju1RqtcDKcrYbOWETkIoQoET7En2rxOUfEB4fbSisDe+Q6629PHgdGAfW+bDvm1ZfKvv0oHLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741097643; c=relaxed/simple;
	bh=OV2CJNpd5RbwY36OXuv9fH3F4quuWs+tUzGPKWB+dfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DHZIxszB74F99lUfbJc4p8xj/E37B6t9ySiwI9X4uo0v63DsCUhsNOA8dPmV2HhWq/1y0UsQx0FgRSPUdH7CIOBLLKoeFhtZKcVRdA4HSqN4TYitykzNaZe3TcPTkJZtNSasz9isg9AY4gAijeq7BOl2lRkBcCTjHQH7/vhUck8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VMIW/0bK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE3DC4CEE5;
	Tue,  4 Mar 2025 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741097642;
	bh=OV2CJNpd5RbwY36OXuv9fH3F4quuWs+tUzGPKWB+dfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMIW/0bKjE1tZRI1Rs4ZbR6vix5C+Lkx3ktgfcBNXMYTo7IpY2nynzK3XXIcmMoJA
	 guRel6Y8URIZeXm6QdNsdATb3Pc+sUCVkPiGk+2xSM7UiPu6PXVFbJADiEUNDnB4N9
	 Wg45jZb1/yRt0R9ubWsPvXxDrhpYL3gdBZnuN02PbQBIiZyfcSrLr7mmqhjqslUSPb
	 KihOCuDjdjvIdQT0ZLL8r0IC7DlY5UsPstzds7CXOK5dw1P8s2jyDcfayAtYyGt4wA
	 OaiWrUTG1igICyRY17FzDyFKTgnzf3Uj+uzenZjOMLiwg2kxo7xLwgY5mf1DCdzBg4
	 0WPPq+tBH0M/g==
Date: Tue, 4 Mar 2025 08:14:01 -0600
From: Rob Herring <robh@kernel.org>
To: Gabriel Gonzales <semfault@disroot.org>
Cc: linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
Message-ID: <20250304141401.GA2537006-robh@kernel.org>
References: <20250304043742.9252-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304043742.9252-1-semfault@disroot.org>

On Tue, Mar 04, 2025 at 12:37:39PM +0800, Gabriel Gonzales wrote:
> Document the Xiaomi Redmi Note 8, which is based off the SM6125 SoC

Period.

Perhaps mention where ginkgo comes from. It's not clear if one looks at 
just the commit msg or just the schema.

> 
> Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index 618a87693..52f7b217b 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1020,6 +1020,7 @@ properties:
>        - items:
>            - enum:
>                - sony,pdx201
> +              - xiaomi,ginkgo
>                - xiaomi,laurel-sprout
>            - const: qcom,sm6125
>  
> -- 
> 2.47.0
> 

