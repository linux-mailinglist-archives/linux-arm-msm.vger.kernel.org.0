Return-Path: <linux-arm-msm+bounces-75753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B0BB236D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 03:06:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05D34177FAB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 01:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1272E401;
	Thu,  2 Oct 2025 01:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZ8+aC8d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26F9463;
	Thu,  2 Oct 2025 01:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367191; cv=none; b=Y6mjsKJw9GE8Zbkv6/wP9vPve+b5PRY5N3ebnpUuQQGpVtJxpyWlN0dZKYKQGz/+75M11wBpvKHueFHz9PlQVjbaFBdSS8h+mkDDtSLG486mBXS9kLM3uEXdxAeKnYDbj/N731yRUB57kV2YTFiPgh96BEh0TIs3Gi+PuKGE0Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367191; c=relaxed/simple;
	bh=Qxn/vhGkc5YTClXEb2b63hmCQHA2mOFB0BiYY8jg3wU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCdpj/Gy2l25N8Tz4eREGiZOvvs1qiJ7H1eIlh2b55VJgwgmjGqlTqzXEJbg2L/f7windZlZ0w7+iSD6Y+YUSakLV8YkRhOmAHX261JbLWY42nb29r9xEAlKaTmoQHr7VAFhCqKReAhhvczGltsLc3343HAE7RA/Y6+Bey/oqfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZ8+aC8d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6985C4CEF1;
	Thu,  2 Oct 2025 01:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759367191;
	bh=Qxn/vhGkc5YTClXEb2b63hmCQHA2mOFB0BiYY8jg3wU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZ8+aC8dTdtQ2vYii9GcDNFXDUWLLI84hMzyMsMRpfx/uSIJn5FRLTK+My05UDUJI
	 /tGSHNlpnsEBCyY6jbmuqnbSHbRzTcXFlcIwLXTebUKUpGRG6cuH/aJrFsY64DJyOu
	 kgdT0YR/LMvRMOt1Fh98f6sd6wHskduNeaMe+vUTkgvXUr79zXZG6DDXCXnqjy+OdC
	 UE7nBIYQmIdom3HGqBn7FNew8AVKEnF/8kHPzVwUsmLxjHQw9VqbX39ffc+cp5t6w+
	 OdgRWQyi4fzgk4sX3ES1qxai55PFMZiQ8S1AgQJ04O3VqQBO3HWPHJTDTsQJRRZldH
	 IiIm8ikZFw9Og==
Date: Wed, 1 Oct 2025 20:06:29 -0500
From: Rob Herring <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Casey Connolly <casey.connolly@linaro.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC with
 panel
Message-ID: <20251002010629.GA2816459-robh@kernel.org>
References: <20250925-s6e3fc2x01-v1-0-9293016768f7@ixit.cz>
 <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250925-s6e3fc2x01-v1-1-9293016768f7@ixit.cz>

On Thu, Sep 25, 2025 at 11:12:47AM +0200, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 77 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..489b6b52effe1e627ff5ef5891729c175ad71685
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e3fc2x01.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/samsung,s6e3fc2x01.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung S6E3FC2X01 AMOLED DDIC
> +
> +description: The S6E3FC2X01 is display driver IC with connected panel.
> +
> +maintainers:
> +  - David Heidelberg <david@ixit.cz>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: samsung,s6e3fc2x01-ams641rw

On second thought, this doesn't even tell me the resolution of the 
panel. The existing compatible you remove at least did that.

