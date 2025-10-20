Return-Path: <linux-arm-msm+bounces-77964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CBEBF0710
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CB4818A19DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534402F1FE5;
	Mon, 20 Oct 2025 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKbKauid"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1579E2EC086;
	Mon, 20 Oct 2025 10:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760954988; cv=none; b=pEOJNpz/JNV1UFLRPTRudcbFrULQQL34VTHEb+Ek3aAcB7ayQVBORmf9XHDNZ4OgozAa+pzqsJtShJctcEjYkLJqHYPRXIilZSVBauNa0LPI9H8Fx/Gna6GfArMU4IbYUM+2MnGXU9JhW6Ntd9avGG8XUX9Cry1gw0Uue+9qRN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760954988; c=relaxed/simple;
	bh=X9Lg2JO4IruFhRgxQn0J2lbHj+iGOTg0TQ0F6mFzILY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C0/bNWvLvgRxCXjvZZyPwf/52JnSVISeKM06sDPBBWGrwfAHrbFilBAv8VvnYyQRO0Uw2AEv/q7hyo1rs/SKt0VlH9RWQk3eN02oqOPBLoXq3nJcHGz9txtwhhQhZlMxvXQ7LBwNsVj4kV7emtB9hn7rsX79Imhwe5YsLZoee+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKbKauid; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E74FC4CEF9;
	Mon, 20 Oct 2025 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760954987;
	bh=X9Lg2JO4IruFhRgxQn0J2lbHj+iGOTg0TQ0F6mFzILY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kKbKauidVwXpi1BhMalBJEErsC2r16WTq4b81i2FGvql7R/i7ghGU2CqMLRegJA3v
	 RrSjPY608f/U50/eoukbbXDA8Uiel6Jp9ZFm2yzBqGiNITcZAYXnlVbhIhoxQlC86J
	 eXHL/lLGkSbyGaUfKwPBYZ8+67QKQiZKz2RdYzO0Sls1f9v+Syy7cnxLQz4dTlNeKd
	 pldHhiCs6hQJ9YMmK6z6mx63YF7ggUftEzy6+JP7AgPQgUTrdHKbbY8q/5UevdPOSe
	 Hpc3vP5cuOZoBqpqcNhtTv/oYQB/JZ0V8UOViI1dAF1SvvHjNL+0DT0+cftS2IO/Km
	 XJ4RCYJ19JfZA==
Date: Mon, 20 Oct 2025 12:09:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ram Prakash Gupta <quic_rampraka@quicinc.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	quic_pragalla@quicinc.com, quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com, 
	Sachin Gupta <quic_sachgupt@quicinc.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: mmc: Add dll-presets values for
 HS400 and HS200 modes
Message-ID: <20251020-talented-inquisitive-bulldog-64aba0@kuoka>
References: <20251013145316.1087274-1-quic_rampraka@quicinc.com>
 <20251013145316.1087274-2-quic_rampraka@quicinc.com>
 <cb753c72-70ca-44b9-a33c-af2b1c7e69c8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb753c72-70ca-44b9-a33c-af2b1c7e69c8@kernel.org>

On Tue, Oct 14, 2025 at 02:06:46AM +0200, Krzysztof Kozlowski wrote:
> On 13/10/2025 16:53, Ram Prakash Gupta wrote:
> > From: Sachin Gupta <quic_sachgupt@quicinc.com>
> > 
> > Document the 'dll-presets' property for MMC device tree bindings.
> > The 'dll-presets' property defines the DLL configurations for HS400
> > and HS200 modes.
> > 
> > QC SoCs can have 0 to 4 SDHCI instances, and each one may need
> > different tuning.
> > 
> > Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> > Signed-off-by: Ram Prakash Gupta <quic_rampraka@quicinc.com>
> > ---
> >  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > index 594bd174ff21..f7b3b1ced3ce 100644
> > --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> > @@ -138,6 +138,11 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> >      description: platform specific settings for DLL_CONFIG reg.
> >  
> > +  qcom,dll-presets:
> > +    maxItems: 10
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    description: platform specific settings for DLL registers.
> 
> One of my questions, never answered in original submission and in your
> versions, was to see the DTS user of it. I still do not see the DTS user.

There is no answer, so I mark the patch as changes requested.

Best regards,
Krzysztof


