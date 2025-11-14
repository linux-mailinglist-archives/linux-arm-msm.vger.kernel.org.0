Return-Path: <linux-arm-msm+bounces-81797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 50427C5BE78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 09:13:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C624B35401B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A22BB2F6939;
	Fri, 14 Nov 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nvNIya+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AD82F5311;
	Fri, 14 Nov 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763107992; cv=none; b=meQA8VgQNbzqNYz0WQABGdfNbQLgrRrhCf7VmbyPyIPKIxXEP0pZf+ksNvVxd2huVRSyfq0jm8+5EU/mSTmrXfE3XpzA5BEqKsJi7gtDKxYADxAUwY8SzqX4QNi2qqIG3KBvngZwBMQ+KVXi7WDsCmIzIDX11uUipGHsE6sCK8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763107992; c=relaxed/simple;
	bh=PuJH4AZc5Qy8bJbMBrsiC84XGEAmby/s9fedLtlTjns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsaKelapiT2cr7p7BLdWlJROqXsgJqK90tUbhsZFPHwiilK54cxxBVymmj8ynITQalQd0saWLG2RamQb6vMI1oPaqpFANVP6CM/yE9xhjDg1wx62HXnxcEDxQ5aX/d4ZcfnFuFseqs+rpe5myP63Nq42sIYmgRRJ3F9R7p+FTV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nvNIya+/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B39DC4CEF1;
	Fri, 14 Nov 2025 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763107992;
	bh=PuJH4AZc5Qy8bJbMBrsiC84XGEAmby/s9fedLtlTjns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nvNIya+/w/lTkrZb3XeEDlwqzQGzESD7Zqm8tOMrRVCij0fdxX3OCJyaRIAYUiDh0
	 Ks//Bc3vb0jUqxzpz94HFBcit1vB9uc28bLbha2uqg+GqsX/tIHE08+uYFTP0uPx3f
	 XR6sMfFAoeOkzrOiXMG2RStEJUyxYFIjPE1ZDmFOxxcFaIRUJbxC3o63/A02SaGFiH
	 NWrhKNZbxyPcQS4SsZun/YVjVeF1o4PbqxsyjZdAQ3yTSG/BpbARfkxn1oAbM2A/vx
	 ZFLW3IqsFmaup5yYsAnnNyNk92b/jKhnkrDFHeY+3ez/ec8EKCL8Jn+UePm9xPlBh3
	 qabHbd3W2mALg==
Date: Fri, 14 Nov 2025 09:13:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Casey Connolly <casey.connolly@linaro.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 01/12] dt-bindings: panel: Convert Samsung SOFEF00
 DDIC into standalone yaml
Message-ID: <20251114-uptight-nondescript-whippet-fba10c@kuoka>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
 <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251113-sofef00-rebuild-v2-1-e175053061ec@ixit.cz>

On Thu, Nov 13, 2025 at 06:57:35PM +0100, David Heidelberg wrote:
> Reason for moving from simple panel is this DDIC has three supplies,
> while panel-simple-dsi is limited to one.
> 
> Previous compatible only described the DDIC, but didn't include panel
> connected to it. Let's fix it, and offer bindings authors two
> compatibles to distinguish the connected panel.
> 
> Basic description for SOFEF00 DDIC with attached panels
> 
>  - Samsung AMS601NT22 6.01 inch, 1080x2160 pixels, 18:9 ratio
>  - Samsung AMS628NW01 6.28 inch, 1080x2280 pixels, 19:9 ratio
> 
> There is only one user which uses samsung,sofef00 and it's updated to
> comply within this patch series.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


