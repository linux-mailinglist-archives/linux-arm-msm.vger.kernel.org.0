Return-Path: <linux-arm-msm+bounces-83530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 830A0C8D1C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 08:32:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 957C24E52B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 07:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8923F322C60;
	Thu, 27 Nov 2025 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSwmYIP9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE2931E107;
	Thu, 27 Nov 2025 07:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764228661; cv=none; b=bs2sT9F0kJkE3IpMcsYdLb+bLhF1kAU/fyys9sWhkowQVPC00YirdK38Mp1OPTHpnGxNnKjB62Qwc3QwSOGD4he0UjUpFjRxvbU3wmO0838ftMBzkJhSHOkjC0HWDEFm6uVdMhowrcp4LBrGQfVrdgzH1amqt33XK7fopKizX0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764228661; c=relaxed/simple;
	bh=BzSSbRUngkZLCHPiK66chBRHs0psXmRouSqUaQ+VoLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K/O6o/2oDC88OKtB2H+raugnr4DgGuuuaVHtdlwqAfQ8hKa+WqDQzvV0nRQxayhsYyBTnINBdeqKImwI/S1kDkut869ddepj+NkvDy3urqPFqneIb8snCx1k97o6XKxSjlUpohPPcGHDCBrXrkzy0McBGHVCMs2m7BMfXkU7ssA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSwmYIP9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 650D2C116B1;
	Thu, 27 Nov 2025 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764228661;
	bh=BzSSbRUngkZLCHPiK66chBRHs0psXmRouSqUaQ+VoLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSwmYIP9ynLIkEl3xQ6dmCibhUeC4ELNOwSg13QX8NMq6+dVofv3xfSBhFiSxdE63
	 jUFnuZslfO44Brd3yBXW5EzR2kElhkieD4Z6B+zvLRDuWKRlYkjfkTHfvXRay09/Eh
	 L9WEyaZEM6nt48XKsntmaLk1SSSzWwoF7l7OGN23kz33Q0TeksXy9V3od0j9ZLNTcg
	 pLnHbmfgEzCI/RZuqt4AU8+xJwHUdGtDm32qC9CCZHvsjlaEfGVWwYFFSahaR3dV3C
	 pD9tnUbdu78C3fyVR2lZGZ1vSPp8iyh8AL1OfUyvsRmcIEKz9+Ndxe03lW7IXcb6Sy
	 07ej9zMGISwZQ==
Date: Thu, 27 Nov 2025 08:30:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
Cc: kpallavi@qti.qualcomm.com, srini@kernel.org, amahesh@qti.qualcomm.com, 
	arnd@arndb.de, gregkh@linuxfoundation.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, quic_bkumar@quicinc.com, ekansh.gupta@oss.qualcomm.com, 
	linux-kernel@vger.kernel.org, quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jingyi.wang@oss.qualcomm.com, 
	aiqun.yu@oss.qualcomm.com, ktadakam@qti.qualcomm.com
Subject: Re: [PATCH v4 1/4] dt-bindings: misc: qcom,fastrpc: Add compatible
 for Kaanapali
Message-ID: <20251127-prehistoric-sponge-of-faith-efde44@kuoka>
References: <20251126094545.2139376-1-kumari.pallavi@oss.qualcomm.com>
 <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251126094545.2139376-2-kumari.pallavi@oss.qualcomm.com>

On Wed, Nov 26, 2025 at 03:15:42PM +0530, Kumari Pallavi wrote:
> Add a new compatible string "qcom,kaanapali-fastrpc" to support
> for Kaanapali SoC.

... and here you write WHY or provide background about hardware
differences, instead of writing what you did. We see what you did easily
- we can read the diff. Additionally your subject already said this, so
basically your commit msg is redundant...

I still do not know why Kaanapali needs this.

> 
> Signed-off-by: Kumari Pallavi <kumari.pallavi@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> index 3f6199fc9ae6..6c19217d63a6 100644
> --- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> +++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
> @@ -18,7 +18,10 @@ description: |
>  
>  properties:
>    compatible:
> -    const: qcom,fastrpc
> +    items:

No need to introduce items, wasn't here before. Just enum directly.

> +      - enum:
> +          - qcom,kaanapali-fastrpc
> +          - qcom,fastrpc
>  
>    label:
>      enum:
> -- 
> 2.34.1
> 

