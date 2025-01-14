Return-Path: <linux-arm-msm+bounces-45025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC27EA10BBA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 17:04:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4E93A295C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 16:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A9E015C15C;
	Tue, 14 Jan 2025 16:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCsq3Rc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07741553A3;
	Tue, 14 Jan 2025 16:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736870694; cv=none; b=nxDLtvZOCPxsDMPn82zRJwyJrMrutg8EiQBYC+KTrrRXLbEBoL0ooxLBS0gcAaWkodhyTGSvyd21cp4safxIHJ+sOpqcQPzilNDZlynKM/bYB2SWKlY1HZMDTMXnR3Uvhi6am3xm1jIxJDSe7RP9vK9dL8MdZ+f3uwtOCTKx9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736870694; c=relaxed/simple;
	bh=qhWdcZn1dnf9UswuIjBHrCxfXiNgcVjed/B1j0/Eqtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DuiADD7seGWcAzYrsk4KT43+EZ3MLn3gIZRQeAIerwVKnyu3U3bEGKNcmKdCMEVeNKJZDfQZg7yuh+oKeAaPZIVrZlMz7eYtuQpX/1cHmbYtvVI2wWgUp3F0GHzYNtuVBN/xAGR2T4ex7lQuKochqY80Jc+Qxf3tvH+FDoymsDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCsq3Rc2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C6FDC4CEDD;
	Tue, 14 Jan 2025 16:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736870693;
	bh=qhWdcZn1dnf9UswuIjBHrCxfXiNgcVjed/B1j0/Eqtg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCsq3Rc2qthMAhAiSM7c/C7pcVVoI80EmGwO2gE4wneNBcSqS/zBtMKa0HK+IvoYx
	 dPRNXLMNBWGPrE6PRGuA9MbsQ5O6hNqKuOKAFe4igczL9VghyWZUZ0wZbGNY0Dn5pS
	 st8HmWv/85vgO1xs2xewKdtW7FAsRvQA0pnqxzSxRO34vbX89L+gwdcz7lgboEeXFB
	 38psowrl69SdQ5KlOCu+5ED14AavMCyIl1CufyXnCG6vSFwlD8miyda2K1MTxBdQvz
	 4jYfUHGM98REpIS5LaQKW7t2hfx64iFMUhbq5a3seUklkxsCdr/fgTAp3NH6F588H0
	 MFKKBMNK75ieg==
Date: Tue, 14 Jan 2025 10:04:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mao Jinlong <quic_jinlmao@quicinc.com>
Cc: James Clark <james.clark@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mike Leach <mike.leach@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: arm: coresight: Update the pattern
 of ete node name
Message-ID: <173687067372.1133944.2572630345939017589.robh@kernel.org>
References: <20250107090031.3319-1-quic_jinlmao@quicinc.com>
 <20250107090031.3319-2-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107090031.3319-2-quic_jinlmao@quicinc.com>


On Tue, 07 Jan 2025 17:00:30 +0800, Mao Jinlong wrote:
> The device full name is embedded trace extension. There is no good fit
> in generic names list for the embedded trace extension. ETE is abbreviation
> of embedded trace extension and the number is the CPU number that ete is
> associated. Change the pattern of the node name as it won't affect any
> device tree node as of now.
> 
> Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../bindings/arm/arm,embedded-trace-extension.yaml          | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!


