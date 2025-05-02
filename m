Return-Path: <linux-arm-msm+bounces-56454-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99140AA6AE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 08:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FC943B5D22
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 06:49:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F3C1266581;
	Fri,  2 May 2025 06:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOdlXVlj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5C725334E;
	Fri,  2 May 2025 06:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746168575; cv=none; b=r3kKzzSoh0m5z+wlZQpUsFg+Jh594rKcpTP4Htv1l/TtobgHWznrpqiL72y2LR66g+TxI00mEIgZRGg81T1iAofGm+xsZ38ErStiKheMHzyGBzMdiUqTago5E700pB0RiyZMUS989hj3NLihEN70aJVmoXTTMJIesz5Vv3nZoro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746168575; c=relaxed/simple;
	bh=dGN47Ro0uCC5XKy5XSVOiQ3yspkfGNTo/e6V7ceLXaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u01p2ZRH3MOMKiL3NRCQs+Bfhlh5Xa4zzd2rOzqo7Ug5M97rObsut8Yvqvd+ooDVXymAV1JQQxLphymJu2DlHAPzEgtb8NCqiiABl/4ezHCm3TFBgCXx4ir5NO0PQjfcB4XMwo2HWWTzzyfxV1FbN6133iPonPg7ZKn5w51gMG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOdlXVlj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2426C4CEE9;
	Fri,  2 May 2025 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746168574;
	bh=dGN47Ro0uCC5XKy5XSVOiQ3yspkfGNTo/e6V7ceLXaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nOdlXVlj6Mr8GAmMPUz8LF9bG6SShA5teaal1jii2B0jV8mFN62oycgZdQ4iU3nQj
	 lQ6of1M/LarZpeL20NNCiCJo/c/5KsrGOcXBBKkUdAhCKHJYp6wDnGrgAHf84MaAuN
	 PiuS84nALY9rlxgniXgZS6Mgx3GkTC4MGamNJ6ILr5xuOAusRNooj2bU0hkIehS7tO
	 G+OburuoHQaSMbGi8UxsAbwwXhwv3r/7xCvKtlRKIr+AWexvqKNH5BRK3VhcIwsiRT
	 A6NDamwQyyn2S3HGTTiEOaG5l/xcD3c+B9pYezYKNFKXgngD1QGJpjUwr6jrn4AnhX
	 NqkLk9ymDM0UA==
Date: Fri, 2 May 2025 08:49:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: clock: Add Qualcomm SC8180X Camera
 clock controller
Message-ID: <20250502-pink-chamois-of-expression-0dc36f@kuoka>
References: <20250430-sc8180x-camcc-support-v2-0-6bbb514f467c@quicinc.com>
 <20250430-sc8180x-camcc-support-v2-2-6bbb514f467c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250430-sc8180x-camcc-support-v2-2-6bbb514f467c@quicinc.com>

On Wed, Apr 30, 2025 at 04:08:56PM GMT, Satya Priya Kakitapalli wrote:
> +  clocks:
> +    items:
> +      - description: Camera AHB clock from GCC
> +      - description: Board XO source
> +      - description: Sleep clock source
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      A phandle and PM domain specifier for the MMCX power domain.
> +
> +  required-opps:
> +    maxItems: 1
> +    description:
> +      A phandle to an OPP node describing required MMCX performance point.
> +
> +allOf:

allOf: block goes after required: block. See example-schema or other
bindings.

Now I really wonder what did you take as an example, because none of the
files have such order, and this suggest you base your code on something
old or wrong.

> +  - $ref: qcom,gcc.yaml#

Best regards,
Krzysztof


