Return-Path: <linux-arm-msm+bounces-21776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FEF8FD15B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 17:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3266A28AA4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 15:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4CCE3BBC2;
	Wed,  5 Jun 2024 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BnzG8Wg0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A678D27701;
	Wed,  5 Jun 2024 15:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717600066; cv=none; b=CnvaKU91C1ppSjUQoaO+/0FxZFUc+enBsf5Yhgh04PYUxCDz48SZ/QwXw0Q1YkSTih6mOadIadaZD8PFXP/RiJrHFar/9KiIliX9WcgTr8THXAz54VCzay39wDJ81AR64wKWd6a4ap6x0H/fKQw5D+hFvbHCh64v0T83ZtphfbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717600066; c=relaxed/simple;
	bh=IMUt0ekXJ4apSSniweRTbVmhFC29pe8F2jnTL2AM9T4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=CI7COX84hA9J/KMo9dpsiAtog7Z0wC1+iVRtKxuDMfhLrPLJdkkYL2BC2TWZ6fTJj8T/oNZkaU0w8IRgprUgFb4lQqiLtT5xGvrWy73LrGAJPb3yR3nqr3wIL5qx3b76TmahEQdlBynbWFINXx+xysYZ3V4PJgNugYVHJBrwlY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BnzG8Wg0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF3EC2BD11;
	Wed,  5 Jun 2024 15:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717600066;
	bh=IMUt0ekXJ4apSSniweRTbVmhFC29pe8F2jnTL2AM9T4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BnzG8Wg0Zt5DJDi9pZK6rmsVYCYqZeN8yycVYoIfh4GMW3nKz5m1TsG/vrY8D53vG
	 KwVX/3gLjCVi5iaHVnBLj/pqVJ21XgBsNMc97zMheXt2gbPRkMAgq1GQEpp46HtyOO
	 spapjVvndZ72f2Onvod+g1r5iCyRKJwb+i+vPxopMLPWzOnqrXzGxFWf5gVrQdn2Mx
	 l28Bex5INZ5G5qbe0aztee2n6tJNpw+OJ9Lsg2buALcbKrl2sGuw1wQmRXdEALs6mp
	 ZwWTq5pqSPPO2hWCmeFPn5OrUhrvHvLjcDqOu6jidi8cZlw56t8WYDtjo3NTFK+xTw
	 Mim/xFnVLYEjw==
Message-ID: <e989c960d72a3838178edbf43eedd02b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240605-dt-bindings-qcom-gcc-v2-1-f947b24f1283@linaro.org>
References: <20240605-dt-bindings-qcom-gcc-v2-0-f947b24f1283@linaro.org> <20240605-dt-bindings-qcom-gcc-v2-1-f947b24f1283@linaro.org>
Subject: Re: [PATCH v2 01/16] dt-bindings: clock: qcom,sm8450-videocc: reference qcom,gcc.yaml
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Del Regno <angelogioacchino.delregno@somainline.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Jonathan Marek <jonathan@marek.ca>, Konrad Dybcio <konrad.dybcio@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Loic Poulain <loic.poulain@linaro.org>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 05 Jun 2024 08:07:44 -0700
User-Agent: alot/0.10

Quoting Krzysztof Kozlowski (2024-06-05 01:09:28)
> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.=
yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> index bad8f019a8d3..74034e3f79b7 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
> @@ -39,26 +36,17 @@ properties:
>      description:
>        A phandle to an OPP node describing required MMCX performance poin=
t.
> =20
> -  '#clock-cells':
> -    const: 1
> -
> -  '#reset-cells':
> -    const: 1
> -
> -  '#power-domain-cells':
> -    const: 1
> -
>  required:
>    - compatible
> -  - reg
>    - clocks
>    - power-domains
>    - required-opps
> -  - '#clock-cells'
> -  - '#reset-cells'
>    - '#power-domain-cells'

Missed removing this one?

> =20
> -additionalProperties: false
> +allOf:
> +  - $ref: qcom,gcc.yaml#

Why not have a one-cell-clock-reset-power-domain.yaml binding that
combines all these things? It's quite common even outside of qcom.

