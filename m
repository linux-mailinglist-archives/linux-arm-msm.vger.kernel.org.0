Return-Path: <linux-arm-msm+bounces-63985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3F2AFC555
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA25B17EB24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57FED29E110;
	Tue,  8 Jul 2025 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFvC7GU2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEAB1B0F1E;
	Tue,  8 Jul 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751962922; cv=none; b=HVa8Zbz9ZYW7DXS+igzTRwiFfaAAdUkaxgYJ2d2eq3ghQGOjSKuWl7stm/QvoFCUP1nMB5E2bvbl1b9qUrpjMaQ5OjEBXXU6wGU4sdB64i3Qzm/ooWQ1oYWK7BNLPCWY89RFoiAAU3jXhnwIm9fTSvTnyBSIRb2HqE+80Z5j/sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751962922; c=relaxed/simple;
	bh=Xy3Qimr/6H1RzjOUBUNoF0Q63KzUY/WreVnonIIwPoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZEEp3rpSdpOnDy9NlLs0/VAe0qNd5JvexOXvqc3mVuxOsHUkfpEfALt8q+aIWuXb8t1I9KLNdUvCeVruGDgb6vpk3OfzYzC+jsalgXQNy/cU1bj/gcKCJXscJakTmewncegfagc8r2GY5w42wL4lhn1OlXjHFPAHiSkvDuT/xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFvC7GU2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7FAAC4CEED;
	Tue,  8 Jul 2025 08:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751962921;
	bh=Xy3Qimr/6H1RzjOUBUNoF0Q63KzUY/WreVnonIIwPoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NFvC7GU2ensgRjBqo4FLbNOfSIRi9ngQPU6c0RA0ieXxRDYMQhU32wnNLPBBhCyC7
	 Xnc7s9Hp5E/rqUoFRrXi/h5mSvcqUVnoPa0OZV4Lxgd9qJETZCe758O0fXXKxsHtPm
	 R3cjHn/1J/UQLMZijZucqd1RctntJ/0XYnPAiGEiPky3LoGnYUuOco2ZItX1x1i1DA
	 uknMc+LM9c+HdumaSEA9FGudaOgw1qltE3sk6rktnwgX6xPvVSPAqtJu0lQ2nbQ3Me
	 oMuDOeKXT6EGBN4S9fmK+FTijWC5kXfrrvdmpK4P9oVWu3zA9PZ3WCSasrRSq9zuRq
	 XnVUR/9vRomEQ==
Date: Tue, 8 Jul 2025 10:21:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: phy: qcom,snps-eusb2-repeater: Document
 qcom,tune-res-fsdif
Message-ID: <20250708-stoic-slim-bison-ac55ee@krzk-bin>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
 <20250625-sm7635-eusb-repeater-v1-1-19d85541eb4c@fairphone.com>
 <20250708-unicorn-of-ancient-excellence-e8945c@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250708-unicorn-of-ancient-excellence-e8945c@krzk-bin>

On Tue, Jul 08, 2025 at 10:13:24AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jun 25, 2025 at 11:14:56AM +0200, Luca Weiss wrote:
> > Document the FS Differential TX Output Resistance Tuning value found on
> > the eUSB2 repeater on Qualcomm PMICs.
> > 
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > index 27f064a71c9fb8cb60e8333fb285f0510a4af94f..6bfd11657e2992735998063b3ca390e04a03930d 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
> > @@ -52,6 +52,12 @@ properties:
> >      minimum: 0
> >      maximum: 7
> >  
> > +  qcom,tune-res-fsdif:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: FS Differential TX Output Resistance Tuning
> 
> Resistance is in Ohms, tuning could be in dB, so I wonder what are the
> actual units here. Neither commit msg nor this description helps me to
> understand that.

I checked and the values are in Ohms.

Best regards,
Krzysztof


