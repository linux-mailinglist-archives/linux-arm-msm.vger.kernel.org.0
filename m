Return-Path: <linux-arm-msm+bounces-29332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A002295C6B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 09:39:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D4AE281CDF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Aug 2024 07:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42A2136E2E;
	Fri, 23 Aug 2024 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9k+qXRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B929828DC3;
	Fri, 23 Aug 2024 07:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724398770; cv=none; b=HezAOMDGlWgi3Nn2Y1802fVq4EeLyeNGeGllNS+kfSpGMQMDVzLE39kK8fSOXzh95u1i76kYpiZ/x0/xjKo7uGgxaBJX65fwdJ3OMbwDSxAuq5d5RN2n5k1reB9Ly2wbdfNS4vuePXW1DdyZ6stvOR4uryjyl3bR/1YtPOEj5LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724398770; c=relaxed/simple;
	bh=yrY4MvbAAsyshVBJLGoNFKybYVfSioJ4X11AzeVycvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWPw/8+oGdKiVg/Rh4Sw41U9abfJHhbvm5ZxbqmRQdJoI8tuQxYn+W84dtcC7nFEgMSKkxCJHr8aCioPkmiEc+LHD8KQvOiWpHsVoTWhYp/BYsuhUnembWABr4Q5duB4WBnpgbQ5LK15fXT9paGgYMkOQ9blMW9jvYs7gs144+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9k+qXRx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD8EC32786;
	Fri, 23 Aug 2024 07:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724398770;
	bh=yrY4MvbAAsyshVBJLGoNFKybYVfSioJ4X11AzeVycvw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9k+qXRxNWil19NhlGVhujfdVEVnD3rfjxAEd3po7vCFTT+V69Zy3isX9kiL7OR9h
	 jTgp0fMtQCBwgDdyDGxVBU0bHjn5UdzFNe6r7UJzkOeKTaZpzXLpQBxONzA9Fyftmv
	 JNJvGQxZ9Bfe9hM8UKpZtr+IKR8NsPU725aj3zswbYDY09JL9Aj45PhKXFbNJCMDFP
	 bLkPgamqpqdeBCzvO6u7hxunIxYul4l3YshRutRB0c13fSovt1Ndfj5A0eihIKp7nW
	 oAdmK1TdStHIVa8qJ/IVCC3mbgSOsLYYmSXYvZ4vKtvJpYtOa1/NqCcSngVup8NtZY
	 NMqr7aPhbthSA==
Date: Fri, 23 Aug 2024 09:39:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jinlong Mao <quic_jinlmao@quicinc.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: Add qcom,qmi-id for remote etm
Message-ID: <lklauccjrhrnnk7d4i3scpzgdva6isvidt3jjefk7xtpsg6hhb@w4w423apm7in>
References: <20240822064122.5231-1-quic_jinlmao@quicinc.com>
 <20240822064122.5231-2-quic_jinlmao@quicinc.com>
 <x45dqaramqjwqjmwf5fbagzsrzb4f4qaohpaaohrdfjkmq2oil@x3sz4jeqnmj5>
 <13ac63cb-8ef8-41e4-8758-82635cbfade4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <13ac63cb-8ef8-41e4-8758-82635cbfade4@quicinc.com>

On Fri, Aug 23, 2024 at 03:16:07PM +0800, Jinlong Mao wrote:
> 
> 
> On 2024/8/22 15:41, Krzysztof Kozlowski wrote:
> > On Wed, Aug 21, 2024 at 11:41:18PM -0700, Mao Jinlong wrote:
> > > qcom,qmi-id is the instance id used by qmi API to communicate with
> > > remote processor.
> > > 
> > > Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
> > > ---
> > >   .../bindings/arm/qcom,coresight-remote-etm.yaml        | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> > > index 4fd5752978cd..27e5f18bfedf 100644
> > > --- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
> > > @@ -20,6 +20,13 @@ properties:
> > >     compatible:
> > >       const: qcom,coresight-remote-etm
> > > +  qcom,qmi-id:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description:
> > > +      This id is used by qmi API to communicate with remote processor for
> > > +      enabling and disabling remote etm. Each processor has its unique instance
> > > +      id.
> > > +
> > >     out-ports:
> > >       $ref: /schemas/graph.yaml#/properties/ports
> > >       additionalProperties: false
> > > @@ -31,6 +38,7 @@ properties:
> > >   required:
> > >     - compatible
> > > +  - qcom,qmi-id
> > 
> > That's an ABI break.
> > 
> > Best regards,
> > Krzysztof
> Hi Krzysztof,
> 
> Sorry, I didn't get your point.
> Could you please share more details ?

Adding new required properties is an ABI break. Nothing in commit msg
explained why this is okay or even needed.

Best regards,
Krzysztof


