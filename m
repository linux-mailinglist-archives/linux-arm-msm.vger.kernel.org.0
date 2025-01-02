Return-Path: <linux-arm-msm+bounces-43774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB9E9FF6E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 09:27:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3A2E97A0566
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2025 08:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B96B195381;
	Thu,  2 Jan 2025 08:27:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BB8194AE8;
	Thu,  2 Jan 2025 08:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735806452; cv=none; b=W3XL9vM17xghHg4Ya06di++AhijdG2oxuPSCWKrpHfF5VpG/f8D3G29DZ0oUl1RfG9OQi8CxuljkYnsdlhf7hO/3x0e0VBIXE1Ml4+f1CRaX3jpB1Knt6g/S+IeFi4Sa/t4j4qpuoEbzgbknAzD6PcW0aVtpE+Y8Cqr0wGZ486c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735806452; c=relaxed/simple;
	bh=jj1bjsradIPuDbRav1ItQLF43xl1UABPEGV66bx+jLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uoe8Zhean0XkWzVXqW8ROgWWSk2VeEsCgClaTaFvAliNOwHNvV8glEQjtZKKqYVddfxCuRqaeNUfy5fPD/fWRe9ZANUtMYVN+rZRFZKUlACTcxa8tTBAwm6bcF/P6mJtm4/YDEE0KcrdNJYmioFJwJp1qLzRekET6RUzU4Bvc/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175EFC4CEDC;
	Thu,  2 Jan 2025 08:27:30 +0000 (UTC)
Date: Thu, 2 Jan 2025 09:27:28 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Daniil Titov <daniilt971@gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom,rpmcc: Add MSM8937
 compatible
Message-ID: <2jrroiexnyyw4u7sko3ooafbwe253tahz4sxxocvv6auyovu4g@ja362bwbnb5t>
References: <20241231-rpmcc-v1-0-1212df9b2042@mainlining.org>
 <20241231-rpmcc-v1-1-1212df9b2042@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241231-rpmcc-v1-1-1212df9b2042@mainlining.org>

On Tue, Dec 31, 2024 at 05:00:49PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> From: Daniil Titov <daniilt971@gmail.com>
>=20
> Document the qcom,rpmcc-msm8937 compatible.
>=20
> Signed-off-by: Daniil Titov <daniilt971@gmail.com>
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


