Return-Path: <linux-arm-msm+bounces-31967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBABE97BEE1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 17:58:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B529D282FCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Sep 2024 15:58:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D317F1C9868;
	Wed, 18 Sep 2024 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrM6Db1K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A34291C9860;
	Wed, 18 Sep 2024 15:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726675127; cv=none; b=F+YeC5GhY3efTbbx3RvPUDA9036Ed3F/9ekQWa5oRxcLl7r1lN71NzSfp8rgmsvQBU00edsyqZV67qx0XRKC0+fG2dpcYbuX6HJAmkRbeifeZZ49RrMvZHqiseFPX7DxejrhmrU+aDbBa55y/rYCalEzt6QTVBjs1pSwqVBv9Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726675127; c=relaxed/simple;
	bh=3Ehcf0Muo6/3lqnKcZgCyy7ZYOx4YiAwDNOLa4o7j8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DPc5t3JclfHwX7EzRCUajpXDJdmDyZ1AZwaoVO6mh3rS72C6hiJ4X9/lety1Un8TdateULM1/IqP9wK324yZW00I/yv/bgQBkmbgFdzTBbo6r85KzkcS6vVaV5akrjS7QxG7l11SMZ7keMvjzuPadjqNmBqILNmGaCMZ8eD4pYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrM6Db1K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FF5C4CEC2;
	Wed, 18 Sep 2024 15:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726675127;
	bh=3Ehcf0Muo6/3lqnKcZgCyy7ZYOx4YiAwDNOLa4o7j8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hrM6Db1K47zLHdsdpHdmo1R/9hYgvC1tQFTpXokO3tUTqKofSIr38rWdD5x/xCUft
	 2PCtgFN+xbVSj272uKgKPIlTrU7pXb222HKh4idgztpdBDrKQvo4D+5azUmRf3d1H1
	 +FKLf950P8lQUawqa4B2STQ5d1TIFlnPrXc3IjY8LxJbRgwEDM8c4bIdyAqFP7f6o1
	 GlgMzzxmHEgEPzBEB0UWWMoP2DFBwtZ44P2/8wWeA4IOYYp8OZdwPmdp0iYMZHXIA1
	 Mc+jDDQOnM26kIDSkbZA4ZLIvoEhbPwuX5iyPf+LSyYjSIzFmQIT3MZyUkCHYXvyGI
	 4tGJHl+nzY3Lw==
Date: Wed, 18 Sep 2024 10:58:45 -0500
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: coresight: Update the pattern
 of ete node name
Message-ID: <20240918155845.GA1629400-robh@kernel.org>
References: <20240913092430.31569-1-quic_jinlmao@quicinc.com>
 <20240913092430.31569-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913092430.31569-2-quic_jinlmao@quicinc.com>

On Fri, Sep 13, 2024 at 02:24:28AM -0700, Mao Jinlong wrote:
> The device full name is embedded trace extension. There is no good fit
> in generic names list for the embedded trace extension. ETE is abbreviation
> of embedded trace extension and the number is the CPU number that ete is
> associated.

It looks like you've just changed things for all the existing users 
which would not be okay. However, it looks like there aren't any in 
tree, so the change is fine, but you need to mention this.

> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> index f725e6940993..0a88e14e7db3 100644
> --- a/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,embedded-trace-extension.yaml
> @@ -23,7 +23,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^ete([0-9a-f]+)$"
> +    pattern: "^ete-[0-9]+$"
>    compatible:
>      items:
>        - const: arm,embedded-trace-extension
> @@ -55,13 +55,13 @@ examples:
>  
>  # An ETE node without legacy CoreSight connections
>    - |
> -    ete0 {
> +    ete-0 {
>        compatible = "arm,embedded-trace-extension";
>        cpu = <&cpu_0>;
>      };
>  # An ETE node with legacy CoreSight connections
>    - |
> -   ete1 {
> +   ete-1 {
>        compatible = "arm,embedded-trace-extension";
>        cpu = <&cpu_1>;
>  
> -- 
> 2.46.0
> 

