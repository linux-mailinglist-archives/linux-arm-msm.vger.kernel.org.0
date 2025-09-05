Return-Path: <linux-arm-msm+bounces-72355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D53FB4613E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 19:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 654F45C7B97
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95825313278;
	Fri,  5 Sep 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC1WPL05"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F4A3191DB;
	Fri,  5 Sep 2025 17:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757094934; cv=none; b=inmnbAtaRJ04YFk+fJ2Ei5/9nWzHLnLmK7RVAtizxYSAhEAoBftvYo013Bxvk7d4vgKuxKvoQwfodawblQVf8Gy+W9kY95odQfzu8HeYmUDTotCFGbAo+ojy+RRrt6XdPcYCurc3JAAPdn7EllvHe1prqO0WVmej7aqAqof+A10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757094934; c=relaxed/simple;
	bh=kxPKwim24wd3P0Q4hx3iHWtMZu2xEhC+EYQ41X3JC4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kt1NSuGQS33bI+9FN9B+WQDfdmQMVj0bpSG3vTPYIAJKNATxTUQQQKbfTUg9ySx6lazCt4QVifGYLLEcRtDX5lLCtDH2ICW4jq2bbvkIc4fy9Cvd3lUkIX0C+q2sh2mfKguNmKqsg/jPxWoPEFhkwBpPKC+WO9cDqZC9qTMFITs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC1WPL05; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C1EC4CEF1;
	Fri,  5 Sep 2025 17:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757094934;
	bh=kxPKwim24wd3P0Q4hx3iHWtMZu2xEhC+EYQ41X3JC4M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IC1WPL05DV1aCcDN5QWVBGAilHhhrUtqhcJsR2c76fPIoKvzW94NrTmTTPUEvHyP1
	 hiEJtOH0l5RGdTEz1/kKtRkLNEgLflMaNclEHuuMlxBHp7SUQaHRFV7lzsLDg1k75T
	 GAuq31e7wcIqlDYB9qtJolnrl3QOmyKpXn0264TCkq6mn5S1PLuO75flRlrxu3/qGa
	 Mw6VPyERel0/9i+OhwbF0qBdKNu7GQ+Xm79S6VuJVUaN6o3hTWJtlES37Q4XVdR2z0
	 3d90TtdbNO080dJycgmBCymoiaSeLWQeY52SD5pWAXw+BqcyV3rwxLuSyuxQq+8J1U
	 yQo1Oby2VkaTg==
Date: Fri, 5 Sep 2025 12:55:33 -0500
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: do not
 reference whole usb-switch.yaml
Message-ID: <20250905175533.GA1000951-robh@kernel.org>
References: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-5b4a51c8c5a8@linaro.org>

On Tue, Sep 02, 2025 at 06:10:05PM +0200, Neil Armstrong wrote:
> Both bindings describe a different layout of the ports properties,
> leading to errors when validating DT using this PHY bindings as
> reported by Rob Herring.
> 
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/all/175462129176.394940.16810637795278334342.robh@kernel.org/
> Fixes: 3bad7fe22796 ("dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp: Reference usb-switch.yaml to allow mode-switch")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml    | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> index c8bc512df08b5694c8599f475de78679a4438449..5005514d7c3a1e4a8893883497fd204bc04e12be 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
> @@ -73,8 +73,11 @@ properties:
>      description:
>        See include/dt-bindings/phy/phy-qcom-qmp.h
>  
> -  mode-switch: true
> -  orientation-switch: true
> +  mode-switch:
> +    $ref: /schemas/usb/usb-switch.yaml#properties/mode-switch
> +
> +  orientation-switch:
> +    $ref: /schemas/usb/usb-switch.yaml#properties/orientation-switch

This is a pattern we try to avoid with references at a property level. I 
prefer you make port and ports not required in usb-switch.yaml.

Rob

