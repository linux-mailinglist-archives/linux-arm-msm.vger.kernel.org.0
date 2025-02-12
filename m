Return-Path: <linux-arm-msm+bounces-47710-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EFA31FDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 08:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14054167746
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 07:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F55204581;
	Wed, 12 Feb 2025 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYoDD1SV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B1620409F;
	Wed, 12 Feb 2025 07:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739344759; cv=none; b=NC1Z7YwDg3eJODFYzIi9xsNhb4tu5cJ//kMUBSzW88u2xhP6TQxZsPplj1XeOnGOrgEAHyd775CSDD75V/9g0UovDZn68YbMsd4nXbGpoDLPRdQw2pfdRASIiwstCi4mih5qHyjpXqhOdotXTR4XR493k7RV9GhnVBfNADOuRNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739344759; c=relaxed/simple;
	bh=50otnKv3QeYe+zi3WyRq677Uu3pZwT8n+nUYUcCin9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NE6rXD3wmme3AgbcEQzDha2i3yxMphwsvcQQT9dKG5xqS+jQk9sI5SiZ4o8pQnTRgxx+b6aa7H3+1RjLQ5kktnVVeyr7tSfeP4xGPoiw13MQhiDzD2mpbjnnjl/Hw5JzCvYRlhgSIxcV/5WhzaZ9OT4+VwyUNXiGZmr37H61d9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYoDD1SV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220C1C4CEE5;
	Wed, 12 Feb 2025 07:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739344758;
	bh=50otnKv3QeYe+zi3WyRq677Uu3pZwT8n+nUYUcCin9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HYoDD1SVGRgRbRIchNgawiDjyygFgGvBsPzJptEj0pDxvdq12bl66uesre+e/nQAn
	 0q5TSeqijWWto7cm5gIEvaySwaSky3HHMR172YLLkYaaHzdW74Ze8MIijNchj+htt2
	 cM5uz7e2PfJMqvYWQm8eLWrT505rYv7UdtE408LF+q4jS6jXy9oYAyjP7EMaY1TyEN
	 AwvvZU4QDgBcQHhWIXRmZDA8B1kOsXG4Azn583+bOAD18vr5uAuJM/5vpQPxz6xLDS
	 jAzCm3I5AFMfinNYwJw+mqblWWW3jcTk4SrUQMYjdt+/WDXMZHs2rzp5EdXq3EbxN9
	 Od1nldY7As1qQ==
Date: Wed, 12 Feb 2025 08:19:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: qcom,wcnss-pil: Add
 support for single power-domain platforms
Message-ID: <20250212-lush-sparkling-manatee-6a7c2c@krzk-bin>
References: <20250206-wcnss-singlepd-v2-0-9a53ee953dee@lucaweiss.eu>
 <20250206-wcnss-singlepd-v2-1-9a53ee953dee@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250206-wcnss-singlepd-v2-1-9a53ee953dee@lucaweiss.eu>

On Thu, Feb 06, 2025 at 08:56:47PM +0100, Luca Weiss wrote:
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>=20
> Support platforms such as MSM8226 and MSM8974 with only one power rail
> (CX) modelled as power domain while MX and PX are regulators.
>=20
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> [luca: reword commit message, expand based on feedback from
>  Stephan Gerhold]
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
>  .../bindings/remoteproc/qcom,wcnss-pil.yaml        | 45 ++++++++++++++++=
+-----
>  1 file changed, 36 insertions(+), 9 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


