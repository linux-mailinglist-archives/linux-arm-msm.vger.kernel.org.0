Return-Path: <linux-arm-msm+bounces-71953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A39B42DB0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 01:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 642E53B71FF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 23:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF622FC009;
	Wed,  3 Sep 2025 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djuAXn5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA452ECD1C;
	Wed,  3 Sep 2025 23:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756943501; cv=none; b=tjXgkKD5E2ilhYfSx1RrJRomzkcdIw8YCJvUkqpRyFXYvXynD1JPbDV3ZLCF+c+gKElrNyl96B9fGvLxv1zCbmF3+MsiKqzuSBlSspsjUaVkSSLEtwurZ2WSULqFiWDaNbb1jzwIn+EuCEyMWItyndiLt1RbLeKZ1/d3Dey+8xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756943501; c=relaxed/simple;
	bh=jIL8HMWY74/M006Uey55mR2tjICrYWUq/L0Z06cYtog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OQtg4YxqC57mW5C2z5OxptRUmoNeIiHysZBqmZ1ULfd8mC/rdJh3Lpe1KmEMVGnf+0tJ737nWL18ksTaWv39wfGBg5YGgRrkbpMpiU67zzRrFKTmkCVW4k7gGPLmKBI4ZsNlQaPNVCHrgLjdtihMlUR5VoJo14uGq7trd3IxQkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djuAXn5V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672BBC4CEF4;
	Wed,  3 Sep 2025 23:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756943501;
	bh=jIL8HMWY74/M006Uey55mR2tjICrYWUq/L0Z06cYtog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=djuAXn5VMQ2y8yvgwfyLrjCfR0TOF/VhEJFie2YmnDBAgTJfdhGOjeuRbcxYx904B
	 u8Tc2QDnzzxNnEVjJQJGw33t1B8PaE6UrAdHpk1Q6msSjjQi2+pbCEPx23xZ/dvQVl
	 xcBUC3z51wgl7Zt3W2618KrCm0pzg4s/QIlfh2lazmDsBvci0kTlQ4lIqX43ipS2Rd
	 A8A8vZHxFSUQTShZrZuZ3g0k9HTmxjPzO6xfcAJHOPXZsK0kYyfhhNnnoLidGnpG2A
	 csByR51yJjs4O/EaFr4JeOHOX+Y4WgHN4oSFXZWLVg4aKURLRvnwC1gkYSGygApklV
	 8HI4j6rXSdTSA==
Date: Wed, 3 Sep 2025 18:51:38 -0500
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abel.vesa@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom-edp: Add missing clock for
 X Elite
Message-ID: <20250903235138.GA3348310-robh@kernel.org>
References: <20250903-phy-qcom-edp-add-missing-refclk-v2-0-d88c1b0cdc1b@linaro.org>
 <20250903-phy-qcom-edp-add-missing-refclk-v2-1-d88c1b0cdc1b@linaro.org>
 <11155d6c-cc11-4c5b-839b-2456e88fbb7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11155d6c-cc11-4c5b-839b-2456e88fbb7f@oss.qualcomm.com>

On Wed, Sep 03, 2025 at 03:37:25PM +0200, Konrad Dybcio wrote:
> On 9/3/25 2:37 PM, Abel Vesa wrote:
> > On X Elite platform, the eDP PHY uses one more clock called
> > refclk. Add it to the schema.
> > 
> > Cc: stable@vger.kernel.org # v6.10
> > Fixes: 5d5607861350 ("dt-bindings: phy: qcom-edp: Add X1E80100 PHY compatibles")
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  .../devicetree/bindings/phy/qcom,edp-phy.yaml      | 28 +++++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > index eb97181cbb9579893b4ee26a39c3559ad87b2fba..a8ba0aa9ff9d83f317bd897a7d564f7e13f6a1e2 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
> > @@ -37,12 +37,15 @@ properties:
> >        - description: PLL register block
> >  
> >    clocks:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 3
> >  
> >    clock-names:
> > +    minItems: 2
> >      items:
> >        - const: aux
> >        - const: cfg_ahb
> > +      - const: refclk
> 
> "ref"?

Certainly more consistent with other QCom phy bindings.

