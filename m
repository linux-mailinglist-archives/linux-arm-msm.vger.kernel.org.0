Return-Path: <linux-arm-msm+bounces-84155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 556B0C9E18C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 08:53:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56AF24E05C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 07:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A358129D260;
	Wed,  3 Dec 2025 07:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gua63jB4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705F62877CB;
	Wed,  3 Dec 2025 07:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764748394; cv=none; b=BzzVPvpx9e/6Q03aoCRZyHUfD00lTm5hDvQ1fSWu4R/gIR0AifcuthKDsqm4siku9sff0+9ijxkv4kbN92pdAMwHlAMwhTZpVeM5L7fV1pw8umVIjsgmoknaOLXXmxeehDFj50kGLSu2ttonO5QMhLrD/0TgUqZK3LNoheg+LAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764748394; c=relaxed/simple;
	bh=GIt1O1sdOnAcu1gdxb3neSe5Nxyh0jnePFmYRYssJk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/CrNeOJPcMCtzwhl5Wv+vI5LTiCFaIuSllaCheLY2Fty+UiugF1D5HweGtxleAYnlySpurJ9VvhdX4a2j0DxXhJ05V5cmTsk968Fz1tDAjTJmyX1KT9X1czfYyurgKZ9o9ED397alQ9VbdguTg3Mbx/i0YMxxw41Ew3XlJ+7xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gua63jB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF4CCC4CEFB;
	Wed,  3 Dec 2025 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764748393;
	bh=GIt1O1sdOnAcu1gdxb3neSe5Nxyh0jnePFmYRYssJk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gua63jB4vHJw+M/hLkKznQgJLnzHdioq6jffMYqiIOtHSaiBm+AGZaEL8IMEFjDoi
	 Ie2GnlO5x1MvcBSgpB6tollJPd4QAGQI3RHnBd92PH7iUAk9/+HSQ/cwKBmM+cajJU
	 PvSy0mDzHv2t8ZTUljlmCu6GOUvb/T1oN3NtnJ7O7DtABGHjNTX97g3dh813NQ4XhN
	 E+DWXNlTA4h79r6GJQkvoypbE2anbIj7r/jq1NjrQOK6O3lXOiV98PmLZQicpd/BAO
	 cPKNa1AnU8HRDZPMlCUOUclvhK1H/A02SewUL8/81zuhh+9BECozf73R+uhtK6x6+/
	 fRp48NM63vBgA==
Date: Wed, 3 Dec 2025 08:53:10 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Casey Connolly <casey.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, phodina@protonmail.com, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 2/8] dt-bindings: panel: sw43408: adjust to reflect
 the DDIC and panel used
Message-ID: <20251203-faithful-steadfast-leech-5fbf14@quoll>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
 <20251125-pixel-3-v4-2-3b706f8dcc96@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251125-pixel-3-v4-2-3b706f8dcc96@ixit.cz>

On Tue, Nov 25, 2025 at 09:29:37PM +0100, David Heidelberg wrote:
> Add compatible for used LG panel.
> SW43408 is not panel, but DDIC. The panel itself is the
> LG LH546WF1-ED01, so introduce combined compatible for it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../devicetree/bindings/display/panel/lg,sw43408.yaml       | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


