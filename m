Return-Path: <linux-arm-msm+bounces-21399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC28D73D6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 06:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98253281E46
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jun 2024 04:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0FC910A3D;
	Sun,  2 Jun 2024 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzGP96jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE6679C2;
	Sun,  2 Jun 2024 04:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717302558; cv=none; b=dw2b80nHxOwPiheMlNkSt0CTyykMw0AsBQPbTa98eEZlf+8LdnfcorHOH1MddezfcywTtKR5oahB4TWEnre0XMSQCbLW4qRAriPc+/062rJ/Gn9c73qx3n1QO9F5G0SnrnxQbCEA+bpiLll2KWazgAiZbwWlzFcgIsPy5nZWvkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717302558; c=relaxed/simple;
	bh=oYpwUgb3R9s21VRsk1J9qoySXDBYWtk7Ai56w1NOPwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j29MeOCoF68ADA6x+Lhi9sAy+YhoVMcDRHl2hnxXsDtMTx2EU6gkVT6Z3cycBwMAnHjOEpUWmvEpeKFgZlL5S7Si6bV537ZuW326Fkb1G85YcFXfjJ74KCDPyAEitYBgSqCEJ7waspkQFLIfCK/6prwNDJ2ORB75u15RXMHg228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzGP96jh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87BB2C2BBFC;
	Sun,  2 Jun 2024 04:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717302557;
	bh=oYpwUgb3R9s21VRsk1J9qoySXDBYWtk7Ai56w1NOPwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tzGP96jhia4fn4mO1OIp3fqdmG7bjAFymlOTMwLkOW9c8n/Kc9VlrZ41tTUx9oe8z
	 Kz1WGF9z41vlJW5ZfjsAE6XDAXyaMbhJbZZt0g9j7hX6fJ+F5iXV4JwwNvNPaSV5TB
	 slG6HBdr78658hTU2gzuKDKwGXEtI6KlLIDkPiBoy4EqDTe9BeerCyusDyjT71Zn6l
	 LOM8QBR0U1EgpKDidX009FSidAQkXS2B4yEnc5Lmx7i9wfMC5ZI9djpD+xOQHgupVU
	 eD+3akz/e+MV13A6LIfpWw1sjyhAoV2xAs+T21Z2P9/OhMKzSeEJUKUKL+A93UooJ6
	 283MPinGsm4/w==
Date: Sat, 1 Jun 2024 23:29:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Konrad Dybcio <konrad.dybcio@somainline.org>, 
	Jonathan Marek <jonathan@marek.ca>, Del Regno <angelogioacchino.delregno@somainline.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/16] dt-bindings: clock: qcom: reference qcom-gcc.yaml
Message-ID: <dqk2jxt44lh3e4hlkfflqjyzmaujwtrzgxe7kem2soua3yryxt@hykweb47ku37>
References: <20240531-dt-bindings-qcom-gcc-v1-0-b37d49fe1421@linaro.org>
 <l73uszlhnhyamfuwm7f6bbmockttwihsylkkgbyedkdseznlka@mtr5c7r4nqt4>
 <8ac8cc27-6c39-45fe-bdc2-40a310c815cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ac8cc27-6c39-45fe-bdc2-40a310c815cc@linaro.org>

On Fri, May 31, 2024 at 05:19:19PM GMT, Krzysztof Kozlowski wrote:
> On 31/05/2024 17:14, Dmitry Baryshkov wrote:
> > On Fri, May 31, 2024 at 03:52:18PM +0200, Krzysztof Kozlowski wrote:
> >> Hi,
> >>
> >> Unify Qualcomm clock controllers by referencing qcom,gcc.yaml where
> >> applicable.  Several existing bindings for these display/GPU/CAM clock
> >> controllers already do it.
> > 
> > The series looks good to me with a single point in mind. You are writing
> > that dispcc/videocc/etc are a variant of GCC. However GCC is a Global
> > Clock Controller. 
> 
> Yeah, that's simplification from my side and assumption that at first
> they designed GCC and then they copied the design to other blocks.
> 

That may or may not be the case, who knows... I also don't have a strong
opinion about tying it all to gcc.yaml if that work...

But the claim in the commit messages should the be that we inherit
gcc.yaml because it's convenient, not because all clock controllers are
derived from gcc.

Regards,
Bjorn

> > What about renaming qcom,gcc.yaml to
> > qcom,cc-common.yaml ? Then the rest makes total sense to me.
> 
> Several gpu/disp/cam clock controllers already include qcom,gcc.yaml, so
> I would say this should not be a requirement for this patchset.
> 
> We can rename, although it always is a bit of churn - git log needs
> special option, backporting is a bit trickier.
> 
> 
> Best regards,
> Krzysztof
> 

