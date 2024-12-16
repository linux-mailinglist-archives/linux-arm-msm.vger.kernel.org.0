Return-Path: <linux-arm-msm+bounces-42320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6A29F2D1D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 10:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 652C61883675
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 09:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 377A8201100;
	Mon, 16 Dec 2024 09:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPg7QYkH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BAC347B4;
	Mon, 16 Dec 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734341993; cv=none; b=PfRdMPd19bxFQddrWLrLF+YNjiM6U2/xRtmriKlGld0WyWqJCnNM+HkNoO3cBOZm6WEi08FXjzfa1AKWAZ6AOjeWfsofBUelQHXjs7esCdL/F6ErMi9AkeFyakzDvvj8BHe+vMmx7MNU2O9b4ouxhPPrmh+OzCfgLmfXEDTKub0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734341993; c=relaxed/simple;
	bh=Noet9CaazzQbUxDP3jlUjci//p8ZmHg5ytb0poaBeSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mvfbrtLkFLjhGbc9VgH4PZD4lAf09f28rbA1XKc01rITVIqwhpBV2oCiA8ARM9aKM0YCGiaIj+5jhbXcqOBDPbgEflYYTBdiSoJZqwGpXp+KThFoHWPFG33dQ8jpiQCQ94KwK0W8EV8XNQVZ9ZuCAunBGeu36R7JyKtiZ91yJqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPg7QYkH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A632C4CED0;
	Mon, 16 Dec 2024 09:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734341992;
	bh=Noet9CaazzQbUxDP3jlUjci//p8ZmHg5ytb0poaBeSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dPg7QYkHgCIBeZAkDMgsiOONxQRoLefzvS3eQj7pks5uj3zAjewbrKbOw+eLfPyOp
	 J0LnonXM/39JiJQdZfKmFApk1D4T+mH97ZyjpnLxGGA4xrXrlc82o9tKSYUnuvVBUb
	 6T41ZXO4sir8GWcbjhfOhBnthu5SdzuYn46qMWNPjb8sSjihEhBV34k5MOtvIBfDAo
	 cSSs1Bjh2RpZUEkEs85qcDARcae1h4oR/UTMeAWKDdP1xBp6v96V2IxEOucXdMR7o1
	 sYBqjjUMolfIP8aT9nLWp7cxP7mIFe1KxFAJ5IQM9rHsxku4CapRijYtCmZ8haJsS/
	 yAGe27XwjIiLg==
Date: Mon, 16 Dec 2024 10:39:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2 2/4] dt-bindings: display/msm/gmu: Document RGMU
Message-ID: <fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw>
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-2-47f3b312b178@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241213-qcs615-gpu-dt-v2-2-47f3b312b178@quicinc.com>

On Fri, Dec 13, 2024 at 05:01:04PM +0530, Akhil P Oommen wrote:
> RGMU a.k.a Reduced Graphics Management Unit is a small state machine
> with the sole purpose of providing IFPC support. Compared to GMU, it

What is IFPC?

> doesn't manage GPU clock, voltage scaling, bw voting or any other
> functionalities. All it does is detect an idle GPU and toggle the
> GDSC switch. So it doesn't require iommu & opp table.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/gmu.yaml | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> index b1bd372996d57138a0e80f8d93df09943775fdfa..6889dda7d4be71535dff1a62ca30f980bfc6128d 100644
> --- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
> @@ -27,6 +27,7 @@ properties:
>            - pattern: '^qcom,adreno-gmu-x[1-9][0-9][0-9]\.[0-9]$'
>            - const: qcom,adreno-gmu
>        - const: qcom,adreno-gmu-wrapper
> +      - const: qcom,adreno-rgmu
>  
>    reg:
>      minItems: 1
> @@ -267,12 +268,14 @@ allOf:
>        properties:
>          compatible:
>            contains:
> -            const: qcom,adreno-gmu-wrapper
> +            enum:
> +              - qcom,adreno-gmu-wrapper
> +              - qcom,adreno-rgmu

Does your new rgmu has clocks, interrupts etc? If yes, define them. If
not, disallow them.

Best regards,
Krzysztof


