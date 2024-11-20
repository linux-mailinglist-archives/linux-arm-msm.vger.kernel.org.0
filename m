Return-Path: <linux-arm-msm+bounces-38421-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 159909D3527
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 09:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF8E8282D0A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 08:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 644BE167DAC;
	Wed, 20 Nov 2024 08:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPoFWemU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFC179972;
	Wed, 20 Nov 2024 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732090551; cv=none; b=Tv6JQTKRVq2oO9dYQkvGayOB+31FU24asIJ1peapCqdVCipLIfKOxzi5oAQBO52JRpv/CRM8qxVKbC9o2qmrXXIT36ZNED+Lwict1zKfApfyeQrW0xBG22PG1JyPpgNPoo8iaaO5RRjuniNJR3Q98yVQij0kMTfVGMxFAagv1Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732090551; c=relaxed/simple;
	bh=ER+is93n4lYOZttDpI/whgUvhKzjLaUNcd5aauAuCW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SMgqx5wACcgZvJBInElGMxjnArmzvoOrO6/KKrbpyZ+UNjkFJ2B+QAfwtIkFJwMd2FKNn60SvsUrheKQGA54oDj6+G4g5tXFSXA90jNDqzbtZSxuY59k351d2P19bn6Au5HySdbhbAq8Y9Xmxw44PADC4a/PH6si48xyDhtptgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPoFWemU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FA05C4CECD;
	Wed, 20 Nov 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732090550;
	bh=ER+is93n4lYOZttDpI/whgUvhKzjLaUNcd5aauAuCW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPoFWemUvcosfDODbudqdu2KmrGycJSiIYJuDUxLHcbbUptPN0Kg7iHWtZWkZi6c+
	 dQFaWH1VRHO1lSj6r8ah98lZtCW36YZRhtCJEMgqdA93rz7MqVQl5Cgh6uHxmekel8
	 Jp5pwA/jB8k8JeICEh4TgQ34UuJmgEE24u8pXphhYQ9zixyxdX9RepoEkNk/vSdrwM
	 vjL3R2hxKQ8j3sDQmljxY+kF4SRFe1pnU4WbtU0EE3QV5655QUjp+RqdD2VnCUG+Fs
	 Mv/kdavO8rhRWpxY9tCGBDzfc6yNkMLOvdWQJhppM+SYAQcZvaLDaPHGGGGsldrieY
	 cZvYhJy4pKStw==
Date: Wed, 20 Nov 2024 09:15:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 SM8750
Message-ID: <p3rrr4gwkd2zsfly2r5zouzmbs5pasd2qz6mala7xy2knbb6kx@l4yminvuy563>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-2-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241112002807.2804021-2-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:28:01PM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Update the documentation for clock rpmh driver on SM8750 SoCs.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


