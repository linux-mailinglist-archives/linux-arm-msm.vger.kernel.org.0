Return-Path: <linux-arm-msm+bounces-21783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4BE8FD29B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 18:15:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3608B1F240C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 16:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D42193091;
	Wed,  5 Jun 2024 16:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XcHfo9Cb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C2F155CAA;
	Wed,  5 Jun 2024 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717604089; cv=none; b=u0Kx+w/GaJ1iue7mXN2mqTuGRX6qQNT0aUStkeluCQ4NxtMpFQ3V2kosTtMfFj8eNLQVrC3A3LPBsDbio/MJRiNBAf6I+mNCOzT2iUjaY01UZBRNTMiM3VK3os6/WSS5ART22kjB8kw+CJKNR4jpWL3/eop4cp2WzFS3C1FUn+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717604089; c=relaxed/simple;
	bh=ETNL+OTc/KNp7bQbtsZTHpTzFzHQa1ACxuTW788w61M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPyVQ8QkjHzMUIx0vxjnPmqane0eBMNeZjD5JUpL2wFJm+tIgvyIZTVovBlDHp7BCDJfXWju050y73zOZZaN7eaHNoGYroZcPXCywys6rsH9W7AECWZJTgvYrfyPjJuYeGbf5aeFcaQFVg0ROKMpRscrxScSdmp1SVPTb+SPd50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XcHfo9Cb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4E9C2BD11;
	Wed,  5 Jun 2024 16:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717604088;
	bh=ETNL+OTc/KNp7bQbtsZTHpTzFzHQa1ACxuTW788w61M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XcHfo9CbWLCsoP2s3rzzyBUM6IlTS8BoUfhIROOAH0O2RRbRwrBJyw0DEe+a1atjg
	 tCyPoPZK7t9SuzdwZnurFInMjRzphuw3rWvkhPmQntWSOXRzJ3XZdpGCYqbHP+/F6A
	 6ZWYvot8/VVWwSexU0SNWEI+r5XnG1/xDlWsNCvcWoSCY0Y5pF/V22QwgfHLslKZr1
	 j+Nnwp1HJFH28k48qt6FzLd5VB+cTetfpktPTgvh1HrAJvy8Cerps4eiovOwnFz9nx
	 Rg4CDCJUkElmh6Ss1hyKz6IdKd6i1joTBFPssorWSlGJX8xIh5eO+EbUbXRvJcZXq+
	 ozYMJUN7NXfAQ==
Date: Wed, 5 Jun 2024 10:14:46 -0600
From: Rob Herring <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Tingwei Zhang <quic_tingweiz@quicinc.com>,
	Yuanfang Zhang <quic_yuanfang@quicinc.com>,
	Tao Zhang <quic_taozha@quicinc.com>,
	songchai <quic_songchai@quicinc.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: Add trace-id for coresight
 dummy source
Message-ID: <20240605161446.GA3260204-robh@kernel.org>
References: <20240603094354.2348-1-quic_jinlmao@quicinc.com>
 <20240603094354.2348-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603094354.2348-2-quic_jinlmao@quicinc.com>

On Mon, Jun 03, 2024 at 02:43:50AM -0700, Mao Jinlong wrote:
> Add trace-id for static id support to coresight dummy source.

Why do you need this feature?

> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> ---
>  .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> index 6745b4cc8f1c..58d5db80926d 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
> @@ -38,6 +38,12 @@ properties:
>      enum:
>        - arm,coresight-dummy-source
>  
> +  trace-id:

arm,trace-id

> +    description: If dummy source needs static id support, use this to set trace id.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 111
> +
>    out-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>  
> -- 
> 2.41.0
> 

