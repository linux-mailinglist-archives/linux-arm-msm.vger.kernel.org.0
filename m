Return-Path: <linux-arm-msm+bounces-78928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CA2C0E3F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 15:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CC333B3987
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Oct 2025 14:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C882BD5AF;
	Mon, 27 Oct 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSINh/R2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F54A2797B5;
	Mon, 27 Oct 2025 14:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573653; cv=none; b=Y28RaD26/dGDceN5azyQJKVtFBUhuZlGc7gTXoZMQxo3CSTAmakCiW/AItKHNyLaTgdLufncl4hZktvI+zvhNw5yUw+nF+MfGBHCJuQArKfz+iF2nBkq45rQN1XZ/0EpuBHw5S3e9L5OX6W1Z4UNJOcna6Ln0ocMO8/+BY2nrn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573653; c=relaxed/simple;
	bh=cI5UkVL9m1fqP/3JizSr2bZRNqQZcgW7vO6CVyE+9Wo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hJYYWSVA65eNGtWNEfx579viho+MvJtvONKwSaVncRO6qaqW/t8+P8ufMAGIyOlbL5CkMZF6RcjiSF/5R+iQODdy36g53YdtPlIg2La0kazqoyksBOmTTxc8ptLeqwjywIEXwKReplP565PL9WHKrctgCj/nVX3wFnQnxh+jTok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSINh/R2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAF4C4CEF1;
	Mon, 27 Oct 2025 14:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761573653;
	bh=cI5UkVL9m1fqP/3JizSr2bZRNqQZcgW7vO6CVyE+9Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSINh/R2b6K7gZt5irOCjtem5/v7uYotuid7sjdJj8puKg2oqclwuQ7a9Zy9NzEKz
	 xTX3fdgYsaqv2duSGgpPY845Yd6q2Cq10b9O6brBVkSPds6exrqdKbTcc0+E8Q2yRi
	 vBUy79UV6ckACiS7f2ZAGNwWbsrY8ITNuQGrhwS7PuAee6Fg+XGPIsMOP3NdCw+ZVC
	 rUqLESPU0DSewSjl2kW16iHsA9x2m5rY94hisKWwHsB2dgKG6hkfEAgRguDLbgSAQj
	 MW61LctI+aeC/FAS8H/Wb61Ri5NgOBZwddAp8IpFZ7KtHUS80QI/qQ1Ww47gdqPMjU
	 OcdCbE16Ja+Fg==
Date: Mon, 27 Oct 2025 09:00:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Simona Vetter <simona@ffwll.ch>, Jessica Zhang <jesszhan0024@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	dri-devel@lists.freedesktop.org, phone-devel@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] dt-bindings: panel: Add Samsung S6E3FC2X01 DDIC
 with panel
Message-ID: <176157364786.341627.9808596288039785278.robh@kernel.org>
References: <20251023-s6e3fc2x01-v5-0-8f8852e67417@ixit.cz>
 <20251023-s6e3fc2x01-v5-1-8f8852e67417@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-s6e3fc2x01-v5-1-8f8852e67417@ixit.cz>


On Thu, 23 Oct 2025 22:24:25 +0200, David Heidelberg wrote:
> Basic description for S6E3FC2X01 DDIC with attached panel AMS641RW.
> 
> Samsung AMS641RW is 6.41 inch, 1080x2340 pixels, 19.5:9 ratio panel
> 
> This panel has three supplies, while panel-simple-dsi is limited to one.
> There is no user of this compatible, nor the compatible make sense.
> Remove it from simple DSI panel definitions.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../bindings/display/panel/panel-simple-dsi.yaml   |  3 -
>  .../bindings/display/panel/samsung,s6e3fc2x01.yaml | 81 ++++++++++++++++++++++
>  MAINTAINERS                                        |  5 ++
>  3 files changed, 86 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


