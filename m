Return-Path: <linux-arm-msm+bounces-46205-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 432A1A1D1B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 08:48:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCE33A2BC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 07:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7530A1FC119;
	Mon, 27 Jan 2025 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AcjVdmGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF86189B9D;
	Mon, 27 Jan 2025 07:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737964102; cv=none; b=GGgdxE4C6h2DedZosfZ74b1w4xef6ogl3/IRKNGrPW0Oav7+zri2f87rSWQ/GWSYSuhymKCxxOCbfzsOEUcW0gMDTJ6OqhN+M2zjE0Y4wv5SwFb5ZV0teAm9Jz+rtIVi0m9VUprEVnz3+94QD5QpST3zLBRf4KcWsAwjKMVVwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737964102; c=relaxed/simple;
	bh=tdXuqfRrBC8ui0Vd36c31GzT2w+e2Q3ACD1hOw81m98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lfJl0wAoFwqMk4SPZ/qsoUGCxUptKHIdWidvrG2K17VDwpAIpXvkH5sf9ZmMLcD13L0JJ8l0J1jBxZLU4qrP6VRb5AAqGOukrMUXJTZgGqFv8YK70HHBEfqIfCOTeZegBjxBozgaQgh3HupCZU3E9ewyskfTa687/L0kYe78x3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AcjVdmGd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23860C4CED2;
	Mon, 27 Jan 2025 07:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737964102;
	bh=tdXuqfRrBC8ui0Vd36c31GzT2w+e2Q3ACD1hOw81m98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcjVdmGd8JZH/b3AVWbFqLqZ6EHHwiQVbh5NvCFAFRqTYeH5iN995lPysvs6D5xqD
	 rHfLR0/mm4Z0MMWbxcGOirsKwNp2ZDlwogw7Jsgc1qBg935WRwww4S+A6QUIa0gMOL
	 mWcXC4pFSDUHpysN1TI5RLppERKn7Ojj/azsyejKdw59RCkdt/Cd8q5PWPqeCSMBtp
	 deNwL1CIGh9mYR9ab+Amiq3eZrs3H51dgdEtYRz1MH0bgvUcP2ZxTHtRXqtrRi3l0c
	 8fSfuk07SttHHgNm4o6VdulbiPa5jA2qBNUnjO/K1QV4kPCF/Q2q7TmzDr8GqZmZOB
	 znjT4v7cKgcFw==
Date: Mon, 27 Jan 2025 08:48:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
	Konrad Dybcio <konradybcio@kernel.org>, Matti =?utf-8?Q?Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/9] dt-bindings: remoteproc: qcom,msm8916-mss-pil:
 Support platforms with one power domain
Message-ID: <20250127-bee-of-strongest-cookies-cd1ace@krzk-bin>
References: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
 <20250126-msm8226-modem-v2-1-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250126-msm8226-modem-v2-1-e88d76d6daff@lucaweiss.eu>

On Sun, Jan 26, 2025 at 09:57:20PM +0100, Luca Weiss wrote:
> From: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
>=20
> Add support for platforms such as MSM8974 which have the mx voltage rail
> exposed as regulator and only cx voltage rail as power domain.
>=20
> Signed-off-by: Matti Lehtim=C3=A4ki <matti.lehtimaki@gmail.com>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> New patch in v2 split from previous first patch
>   - Improve description of changes
>   - Add one power domain changes to existing MSM8974
>   - Add missing minItems to other platforms
>   - Require mx-supply for MSM8974
> ---
>  .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  | 34 ++++++++++++++++=
+++---
>  1 file changed, 30 insertions(+), 4 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


