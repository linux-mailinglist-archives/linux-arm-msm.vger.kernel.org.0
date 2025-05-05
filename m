Return-Path: <linux-arm-msm+bounces-56744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6351BAA8C50
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 08:31:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73A1C7A70AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 06:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6DA1C3BE2;
	Mon,  5 May 2025 06:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FzlRqPgq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69950208CA;
	Mon,  5 May 2025 06:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746426693; cv=none; b=LvY9bUuIB/dXuAUMxGWf1OUYVqOFQEie5/2sUaVUd6kLojw+YKWJGRpAkyATGv7v/M0eVT7TjpGQUN3tR+YYsVW6NYM/8fhgQOVmIPdeDBXSUO0xySD+P5S6dvPhPJ/9cOEZVY9Fp6+a/NUuERT+cU673WieT5Pov+SrQG2+LBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746426693; c=relaxed/simple;
	bh=TPq3wA5AUJQSq3qJ8lHKPyiKkhZdMGK5y84c2O0b42I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/qK3joRSiOxzkqr+DrIsL2/2LZDCTktg3ZB1XQJSVGfgPj7+Nfk+kxWNNXGFvSCl3RzGW99RN5gz8kJ4vAXGgpEALrZWdz32AET/udTgu8NaIwYAWlR78dtKuPRCPYyAre8uJjM2Czas/efQ0hAViuLOB2qkMfVIlryMTJR/80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FzlRqPgq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442D5C4CEE4;
	Mon,  5 May 2025 06:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746426691;
	bh=TPq3wA5AUJQSq3qJ8lHKPyiKkhZdMGK5y84c2O0b42I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FzlRqPgqY0uhKs/g+qRRJYf5cr96PV6o5dw2lVtQpchnXH2b+56uMsVHgkjeQaUtj
	 r0qVT2BioOx3ffGmWvQoBbdPDaiPhuQ1/tv94iDHkDGg8eVnxqVD7NTl0WkyDjQk7e
	 cyt6JLH0XbWA9ULmgn2DKbfO+KOBk0jrMkXky3kw+3VZmvkLFUiGohcekYJYZuuiP1
	 pPmwWD44xWgI/oknx4N+Uv1Wb4KdIP4kny7wxMICA4BaAnv+1ubo3yTuahuMkYxRFs
	 dGYKS0B7pSoC8p2y5pRbPJwIFXnYGTKQPesWkeNfNt6+0cNuBSvAlPlzyLW4la0AQr
	 Utz0PEeSuAjSA==
Date: Mon, 5 May 2025 08:31:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Praveen Talari <quic_ptalari@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
	devicetree@vger.kernel.org, psodagud@quicinc.com, djaggi@quicinc.com, 
	quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, 
	quic_mnaresh@quicinc.com, quic_shazhuss@quicinc.com, Nikunj Kela <quic_nkela@quicinc.com>
Subject: Re: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
Message-ID: <20250505-ostrich-of-impossible-conversion-a0f8ac@kuoka>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
 <20250502171417.28856-2-quic_ptalari@quicinc.com>
 <20250504-hilarious-ultra-grebe-d67e7d@kuoka>
 <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6f97510c-eb6c-4f3b-b219-aa8d895b060b@quicinc.com>

On Mon, May 05, 2025 at 08:00:32AM GMT, Praveen Talari wrote:
> Hi Krzysztof
> 
> On 5/4/2025 10:39 PM, Krzysztof Kozlowski wrote:
> > On Fri, May 02, 2025 at 10:44:10PM GMT, Praveen Talari wrote:
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts
> > > +  - power-domains
> > > +  - power-domain-names
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > > +    serial@990000 {
> > > +        compatible = "qcom,sa8255p-geni-uart";
> > > +        reg = <0x990000 0x4000>;
> > > +        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
> > Why isn't here wakeup interrupt? Commit msg also does not help me to
> > understand why number of interrupts varies.
> 
> Currently we are not using wake-irq because it is optional for our current
> implementation.

Great explanation. I asked why is it optional, answer because it is
optional.

What does it mean optional? This is part of the SoC, so how given one,
fixed SoC can have it routed or not routed in the same time?

Best regards,
Krzysztof


