Return-Path: <linux-arm-msm+bounces-22491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C8D905A17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 19:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AFEDF1F23027
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 17:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9361802DF;
	Wed, 12 Jun 2024 17:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rsEIbaL3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6925170824;
	Wed, 12 Jun 2024 17:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718214262; cv=none; b=chlZvwEG0WDbdspjmYZUq65xHgtXtDYuwLfinm2qn6E8Ia/m4tnGV1UBfDxq0mSl5UDt8DqZo139I5PKMHYCdyiXayPaSQNprgGqN18/P8YwxfSBYxPiZe+9wp3IH/cGnM9S4WGPaAu8z6Nx1fUXE9rmrdXWFTpKG5dQ7fjmfds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718214262; c=relaxed/simple;
	bh=X/W4+RBIDg73ZY+dLTQoYPcN2GOZNe5RdPBV8OPN5i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHipL20Q8yb7nEWqXuVpjw5aqmOClmY6dc1A5/ZqNixpvS/FwR2fI6tqmcSh8Zvq/+So3ghsTljLzFXJMB/5C0JG1qII4mraevOptpEDbN2DqjRnlv9Z2+OTl5c3YXtv9GeF0QI/O8JKnvPSooEbDC0KtMvD9hy/LQofLWo02dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rsEIbaL3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9837C116B1;
	Wed, 12 Jun 2024 17:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718214262;
	bh=X/W4+RBIDg73ZY+dLTQoYPcN2GOZNe5RdPBV8OPN5i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rsEIbaL3TaGu65Vzwpc66Y55Cq6oFPsp5UqG5dLb/0hshXQYvgusTLkQ7B6NSvpIg
	 nYSv7fo28HcBka3HtEql7X9qdOPUeFx0zCaNSBux12UwWGJ2JFIMA82+y/c92vxHwt
	 /v6gnBr3KgFXofosdzL7jADZP7qsOfjTUKiOx/J0sg8PgrkrMzn0kLuYz0qV5sOFOw
	 QJxkIPIwYg5HWFc9l8kghshlwxcspdZIaG17nWh6fuYjSjP3wiaGV36AaZLCseFylY
	 Jv0oQfJUxUVfFipFXezBeuBnrHKSe7wUkK4XYqvcEHAHaHigFoIKymKxuSsMXIvsF3
	 yq7YDwZg+vs5A==
Date: Wed, 12 Jun 2024 23:14:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v3 1/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-phy-8998
Message-ID: <ZmnecsZrtNoggI3X@matsya>
References: <20240606-hdmi-tx-v3-0-9d7feb6d3647@freebox.fr>
 <20240606-hdmi-tx-v3-1-9d7feb6d3647@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-hdmi-tx-v3-1-9d7feb6d3647@freebox.fr>

On 06-06-24, 18:07, Marc Gonzalez wrote:
> HDMI PHY block embedded in the APQ8098.

Why is the patch titled display/msm, this is phy patch and it should be
tagged as such..

Pls update

> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index 83fe4b39b56f4..78607ee3e2e84 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -14,6 +14,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,hdmi-phy-8996
> +      - qcom,hdmi-phy-8998
>  
>    reg:
>      maxItems: 6
> 
> -- 
> 2.34.1

-- 
~Vinod

