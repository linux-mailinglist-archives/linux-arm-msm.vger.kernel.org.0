Return-Path: <linux-arm-msm+bounces-47992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA9AA35923
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 09:43:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F22C16B6A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 08:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F18227B94;
	Fri, 14 Feb 2025 08:43:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E84A226537;
	Fri, 14 Feb 2025 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739522589; cv=none; b=OFCgA3XiSd1xCrok1MMiKia0WbK6cPzizz2m7GRYszhamoOjjGomepLBtgwIH9yqzb17dzInSoWgHvD2k9HUEe5AKBoL1qX2SF6OjF0uz58kPiMXBrBk6lJ9jW4D5Nz2wcbYq2L2Dq25WnD3BmRdgN18fC2WMXiqknfAfyEjNRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739522589; c=relaxed/simple;
	bh=JBy8TF8KBKYgHbYn9ALir45oy6vUsjtumA8pxFNAE48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlWDkRaD4JzmE02H8AR3hgGFzwjRTwPfVsNjRIZD7o2aJAI1hC1FJfcRtjL1jVLukjJMkmGRJfz70lp1cHzEKdhQoLVgXifjwGZubcb+5AhlTFmOyJ6kwLsQBkiviz9GfrL8eBFs0Motjf8VzcP/w5dcUeymvXrwq8RJKrqs3Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AA5EC4CED1;
	Fri, 14 Feb 2025 08:43:08 +0000 (UTC)
Date: Fri, 14 Feb 2025 09:43:05 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom,rpmcc: Add SDM429
Message-ID: <20250214-agile-delicate-potoo-0d6ec3@krzk-bin>
References: <20250212-sdm429-rpm-v1-0-0a24ac19a478@mainlining.org>
 <20250212-sdm429-rpm-v1-1-0a24ac19a478@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250212-sdm429-rpm-v1-1-0a24ac19a478@mainlining.org>

On Wed, Feb 12, 2025 at 06:04:09PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> From: Daniil Titov <daniilt971@gmail.com>
>=20
> Document the qcom,rpmcc-sdm429 compatible and
> add BB_CLK3 clock definition.
>=20
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmcc.yaml | 2 ++
>  include/dt-bindings/clock/qcom,rpmcc.h                  | 4 ++++
>  2 files changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


