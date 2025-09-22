Return-Path: <linux-arm-msm+bounces-74470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC5B9331F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 22:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8775C1881DEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 20:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225503176F2;
	Mon, 22 Sep 2025 20:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mdQqbZfg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DEF1E32B7;
	Mon, 22 Sep 2025 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758572091; cv=none; b=uUjf/2B77QfHznyriPOf2A34c7PcsITmlf+A6W/F9tKKAXAm0B9FuiXHV2QNybtZIOthGxCvBkbdmR9TwSaSX5krXKjT6pGImoh6RuXuHMBwdlomjD7z+PRtGrspFVctrnPa5WvtA2e3NhaxI6BHgeD9ayGgSrGlW4RWyYjtLRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758572091; c=relaxed/simple;
	bh=n7onidEgsOlpaTA0bHqvezDw24pCCjyLfMiCT8xJbWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QqV3RskZ0wM+kq8f4SOBRFYhPJlPq8NkCexw8hAl0S5SwAbOHCKkpppTn1eb3v0Jb5ffPJl8UPWlcFub0TNe3l7S24Y1Zy0Q4b5KTCANMjulqxtdUhy2O9c4rNTpLsd+F5PIb/WPEh/tXyTTWJR99ZJNtXBP9MHD7U16CODvRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mdQqbZfg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C36C4CEF0;
	Mon, 22 Sep 2025 20:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758572090;
	bh=n7onidEgsOlpaTA0bHqvezDw24pCCjyLfMiCT8xJbWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mdQqbZfgkYFBXrVlz9w8YV7KeMdkJVHmaZi+yCE+ct1RDUWErD4fWAkOq468gUbzF
	 kwuGtAghvJ1UKanzQkz0bBsDj9PbS0r7sUpYUN1YIXuG6TssUBEAnHB2oP+4Uxf1UM
	 MuVUW9dbu4NXJO0E9eJpQBchM2rAYV0c7isLon4T2e8PEUl1Nea5KraVZtVRrRJNI+
	 /Ta5aSQoxBG6YS8Bxfr/Mf0PkZ0EA1V8YlQA5f4QTFUb/VKq0ieUnoKhqfc0ZZThu4
	 U5SiDwQzpAZDBK+7kEu2fSz6mai2vfOaF0pQYvC72vBhklIXZWhFggm79ga3m51zfd
	 S+02KzwGccjfg==
Date: Mon, 22 Sep 2025 15:14:49 -0500
From: Rob Herring <robh@kernel.org>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, kishon@kernel.org,
	vkoul@kernel.org, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 3/9] dt-bindings: phy: qcom-m31-eusb2: Add Glymur
 compatible
Message-ID: <20250922201449.GA1235521-robh@kernel.org>
References: <20250920032108.242643-1-wesley.cheng@oss.qualcomm.com>
 <20250920032108.242643-4-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920032108.242643-4-wesley.cheng@oss.qualcomm.com>

On Fri, Sep 19, 2025 at 08:21:02PM -0700, Wesley Cheng wrote:
> Add the Glymur compatible to the M31 eUSB2 PHY, and use the SM8750 as
> the fallback.
> 
> Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml   | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> index c84c62d0e8cb..b96b1ee80257 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
> @@ -15,9 +15,12 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - qcom,sm8750-m31-eusb2-phy
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,glymur-m31-eusb2-phy
> +          - const: qcom,sm8750-m31-eusb2-phy
> +      - const: qcom,sm8750-m31-eusb2-phy
>  
>    reg:
>      maxItems: 1
> @@ -53,8 +56,6 @@ required:
>    - compatible
>    - reg
>    - "#phy-cells"
> -  - clocks
> -  - clock-names

How is it compatible if clocks aren't required now? And clocks are 
suddenly no longer required on sm8750?

>    - resets
>    - vdd-supply
>    - vdda12-supply

