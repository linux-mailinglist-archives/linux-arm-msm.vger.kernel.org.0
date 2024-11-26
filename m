Return-Path: <linux-arm-msm+bounces-39166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFF79D9284
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 08:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05E10B2135F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Nov 2024 07:35:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825B5193419;
	Tue, 26 Nov 2024 07:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dx2pqvaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EC91885B8;
	Tue, 26 Nov 2024 07:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732606500; cv=none; b=LO9iohPJGDbCVodOCwuS3Ii2kVdzdCqXuhFpsqxlox+yWCqbG/rrRD26mFMrk3xFsavBtcmzlKMpPQzK7ubWgAyloWmeBRIOuHtwodrD9F34luV3w7N0JhWCteKBxq9cawarQ9fbYZED8vNkYaINu6YQ7x8ffQS+4kWqA+kGABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732606500; c=relaxed/simple;
	bh=wUr44H5GS4NSD1WGUipzyvMEA/+0GcABo061UQc51VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQliqVOuGVRks9dh3w3FK/DC4DiZLbZiufvWL0dfjclbqX1Zbcasz2rL6NCYofpnNfHmIM2kDVowIPl+YnzCPsVaBfj4EPF30ceJI+knMmpLjHy4YxZA8zVzM+kySBSGz3iRDbLl40TuxqMpQ13/zJiQqTabNY5RkSd/iJ/Fzx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dx2pqvaB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E174C4CECF;
	Tue, 26 Nov 2024 07:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732606499;
	bh=wUr44H5GS4NSD1WGUipzyvMEA/+0GcABo061UQc51VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dx2pqvaBxI74ZFOc90YuhwDywjiNY+QgR31y0ajpHqeZ84sQvfl8UAgZNTRiXhaQZ
	 BVhmswCqeDIYC9NodHrBlfkrqw7ZL7S/qpCaEh+jgFKMUP1byM4kniCcngOskoCMvp
	 eVCgXkJwIhRrInN7v3DgRwsc37J1jaqHnPpexz9dPfMEYeSE1qzk3KE1P6HvPfi8zV
	 RlbqyLIwzWKWCys6jWS2UK5uFFpXx0T9LZuTbF/fFXl1O5njZtJvKPANQ+N5/FebZL
	 OJBD4d7axZgkAm/AaNssiJD56OZXRxnE47rBx1hPdJeIE1MlcEHB+/Hj670EOad/8W
	 HTK0seABv6CQw==
Date: Tue, 26 Nov 2024 08:34:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Kalle Valo <kvalo@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/4] dt-bindings: arm: qcom: Add HP Omnibook X 14
Message-ID: <dgilzuguxfvzqndp4rjm4hlhejgporfvollk4sqwquk34g4pka@dinzg2kfk4x2>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
 <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241124-hp-omnibook-x14-v1-1-e4262f0254fa@oldschoolsolutions.biz>

On Sun, Nov 24, 2024 at 02:20:15PM +0100, Jens Glathe wrote:
> Add compatible values for the HP Omnibook X Laptop 14-fe0750ng,
> using "hp,omnibook-x14"
> 
> The laptop is based on the Snapdragon X Elite (x1e80100) SoC.
> 
> PDF link: https://www8.hp.com/h20195/V2/GetPDF.aspx/c08989140
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


