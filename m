Return-Path: <linux-arm-msm+bounces-71717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2326BB4159C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 08:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3236541B1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 06:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACB422D8DDB;
	Wed,  3 Sep 2025 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ngkjGGEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A162D8DC2;
	Wed,  3 Sep 2025 06:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756882369; cv=none; b=WBmcyQ3RzjTWZS4PcIsnLbtsCWFBwNCV09Y6PXUWOFijEw1DGDpyNgH1XeG0HW8iHRai3mb6aSusnmTgemG0rAYcAKT/hiozeCMr4Nj4TiHBI8vFvq4VwTH9mRUyhP3Dh5/ETWJ9EvsUA7hu9RaszU134mEBVn62RuE3qnkT0cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756882369; c=relaxed/simple;
	bh=IYNlG9+JhhkXMMn/spCMJaSa/ZNno14iioZpwVryrHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pNARE7MYN5o25kLmEgC0U2QIJAEPQ0j50xvl/vEMjuB6tVB9/eFPMRhoeTvmpZp5WZdiQJsfta/Q94Sn3KkrkUitBrGRSC5SNGA54PJnwFLmHD4YCKL/bUFsJf2EmXPE4uSxgEkJfbTOhBkxg4JlokJbq4WcdUY4VthqYaLxJdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ngkjGGEB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6186FC4CEF1;
	Wed,  3 Sep 2025 06:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756882369;
	bh=IYNlG9+JhhkXMMn/spCMJaSa/ZNno14iioZpwVryrHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ngkjGGEBsvtl/+LflwQESb6V1LZN+yJkVlNCDOTVA0GyzYzoQdyyKlhW8RgWGlkms
	 ciVLeWXY42d3AwISvz0lr7PIEygFWz2Mi+0P/LTQyw8BSaJJBOq4T8PXBtZ7m7EJ6i
	 X5uYTHgj6d+D10i035hepD6QbzyanjMnwfkP5sBwDRKKHeNABP7RG37mCFqZSpjJht
	 4NNXLC2BjXMwqCCPHfVGC82tuTtrxIEeM4UFb5twkKtcTKhaxoELUbSS2PNw7cXGqZ
	 DqsJa9IWJlfr6h0F9ZkLalKpYjx/uUSNvSD9aEi+aoxsakQq45IAUfGI1acCMjkqgW
	 qVF2x/PJ7YdNw==
Date: Wed, 3 Sep 2025 08:52:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: display: bridge: simple: document
 the Realtek RTD2171 DP-to-HDMI bridge
Message-ID: <20250903-beneficial-logical-silkworm-14f4d2@kuoka>
References: <20250902-topic-x1e80100-hdmi-v2-0-f4ccf0ef79ab@linaro.org>
 <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250902-topic-x1e80100-hdmi-v2-1-f4ccf0ef79ab@linaro.org>

On Tue, Sep 02, 2025 at 11:00:28AM +0200, Neil Armstrong wrote:
> The Realtek RTD2171 chipset is a transparent DisplayPort 1.4 to
> HDMI 2.0 bridge.
> 
> This chipset is usually found in USB-C To HDMI Adapters and Docks,
> or laptops to provide HDMI display output.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


