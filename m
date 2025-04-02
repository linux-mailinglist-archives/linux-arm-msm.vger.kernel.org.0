Return-Path: <linux-arm-msm+bounces-53003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CBFA78990
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 10:13:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A792416FC6C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 08:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FB9235364;
	Wed,  2 Apr 2025 08:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rr9k1ouJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B60023535E;
	Wed,  2 Apr 2025 08:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743581583; cv=none; b=ON3NLpzc56ABPw3tnw+5keNx/uPHBFbF4zpSnIkggb+QeE0c2IhPZ0GLlA3yiWlU9nY8BbwMy58pv2v5Ck8plK06JEVH7PnvlbSYbZYqfhDbNnNCnl/w5p5H2CWrSCI28mpG6B3oEaLdhv18bnJRdaqxVOr2GITYsDRFd+mvsik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743581583; c=relaxed/simple;
	bh=l8Pjlj2ZGEfBFtBkFpu2ySvFZzBn7nbrurB7Qcy4OsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmO7pbJFbVTxUBoDHGnlUXOyu+Dw2HJdnzymVQ+PEKPcVKOaqG/2m7Mp72khYXJxBW+ev3YsWHaTRI5jlI1ezhrLQ6x1Alc6b0n2s7syAN5tJP/mH/NAHoK/t4pPRPOcE0Nq6yIqzlwzlMLuU7xdHcA/L9NV8U9sQA6bZoM2NIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rr9k1ouJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6941C4CEED;
	Wed,  2 Apr 2025 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743581582;
	bh=l8Pjlj2ZGEfBFtBkFpu2ySvFZzBn7nbrurB7Qcy4OsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rr9k1ouJqicQ7v7ou4cq1RoZUzxFsjX8Q/DHBB5tFqQ1f+gVVxkCWM5vnCgwyzKLw
	 zKl+20UrrurXD1+GMZbUmXggV1sIGnafksq+dYIQBfFb9XzkB3SY4Phr05dssulbMa
	 7YQx3h9H3O1lIh9KSnHPX+PfCdMi69P9yPMvfZYhc7pabGbWpA8jYsD5+xgthahmXc
	 k7LC2CQj7K5tmIpvQcVwHvhFhdzigTaTF68dTjbmvsemw8241OoSPJkFUgUWpO/jDI
	 JiL/o/hUhyonZbu7WKxxg1IJ/ivKEZZp2U5m9aCp/bEtBHrShgZ18rL3OwRdfg3uhI
	 5SeNR9PUElcXA==
Date: Wed, 2 Apr 2025 10:12:59 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, andersson@kernel.org, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: qcom-cci: Document QCM2290
 compatible
Message-ID: <20250402-light-ibis-of-glee-bf6dcf@krzk-bin>
References: <y>
 <20250401143619.2053739-1-loic.poulain@oss.qualcomm.com>
 <20250401143619.2053739-2-loic.poulain@oss.qualcomm.com>
 <2b615806-8534-4964-ba35-dc75eaa4b413@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b615806-8534-4964-ba35-dc75eaa4b413@kernel.org>

On Tue, Apr 01, 2025 at 04:59:49PM +0200, Krzysztof Kozlowski wrote:
> On 01/04/2025 16:36, Loic Poulain wrote:
> > The CCI on QCM2290 is the interface for controlling camera sensor over I2C.
> > It requires only two clocks.
> > 
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/i2c/qcom,i2c-cci.yaml | 23 +++++++++++++++++--
> 
> Bindings patch goes before the user, usually.
> 
> >  1 file changed, 21 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> > index 73144473b9b2..1632e3c01ed2 100644
> > --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> > +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> > @@ -25,6 +25,7 @@ properties:
> >  
> >        - items:
> >            - enum:
> > +              - qcom,qcm2290-cci
> >                - qcom,sc7280-cci
> >                - qcom,sc8280xp-cci
> >                - qcom,sdm670-cci
> > @@ -44,11 +45,11 @@ properties:
> >      const: 0
> >  
> >    clocks:
> > -    minItems: 3
> > +    minItems: 2
> >      maxItems: 6
> >  
> >    clock-names:
> > -    minItems: 3
> > +    minItems: 2
> >      maxItems: 6
> >  
> >    interrupts:
> > @@ -119,6 +120,24 @@ allOf:
> >              - const: camss_top_ahb
> >              - const: cci_ahb
> >              - const: cci
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          oneOf:
> 
> That's odd syntax....
> 
> > +            - contains:
> > +                enum:
> > +                  - qcom,qcm2290-cci
> > +
> > +            - const: qcom,msm8996-cci
> 
> and not correct, which will be pointed out by tests. Are you sure this
> was tested? I guess you wanted only the first part of oneOf (so the
> contains and drop the oneOf).

As I expected, this wasn't tested and introduces several new warnings.

Best regards,
Krzysztof


