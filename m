Return-Path: <linux-arm-msm+bounces-46676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2869AA24E5B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 14:48:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0F731883440
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Feb 2025 13:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7451EC01E;
	Sun,  2 Feb 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHss+vjz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345421EB2E;
	Sun,  2 Feb 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738504119; cv=none; b=dpniLmaFMiJSHXVxlD0urTOkEj6a3Mc1OvxQf/FIErpELhz7+dFX+V0wZnseOVwXo/0LkaPPZM/mPEqLkLVNAF2US2hFZQNgSvZqfxzLU+SY3rS/LmJmcFMrZvgpfcBfGuOJH81DTjLBrvTcqJQh8D3Nkolta4yyw6Y6shOrZsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738504119; c=relaxed/simple;
	bh=9UGJxOoM+2AEsTdC1KW92vQZgHaW5qFedC+8uh8x970=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRUYJ8F0ziCmCsPSRdyE1g923XWMack5n8MjBzYpR9HgqSpEWAh6P9LWMKB1MX07KsUKMSbhO1VJdzi4qQa+r2YzlNGASlNnOaffFEk74zW/bosBVuIyeUZaVPw7n83vO5HrvnKAQe8KVz98oaTBCi532ufDvaLlwvH+BJYYnfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHss+vjz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631BDC4CEE3;
	Sun,  2 Feb 2025 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504119;
	bh=9UGJxOoM+2AEsTdC1KW92vQZgHaW5qFedC+8uh8x970=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHss+vjzbC+clATnxtw8TYih5PkaXKM7ox15sWk4xTylPRyAaBQxw4IWy2i3BkUU0
	 X+D2EmAjI2KvFbDr5CdXkWOozI0ot5/86j6ZcegKPvc7DL2y1pIGsKeF83hRu+UNHn
	 DOeQ9DWkbYo8wrtmHn1Ud5fZwdr6gI5XxXp11KSP9gb/MjCckbDz2aP/F6xvvoWM4w
	 ddCrRCOgfX9z8PQBlaQv71h+J6aAw5cDaxBictROmhVGKMoK8JP0Y3ZOqUkh40KEbI
	 7+uMYTlHz+Qlt4SfJ6nVp6MLyIsfxgUpTKcHzeNqPB7XnfDvlntFJJxcIrFTZNBcs7
	 QBt8+3Fzj26zw==
Date: Sun, 2 Feb 2025 14:48:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: net: bluetooth: qualcomm: document
 WCN3950
Message-ID: <20250202-shiny-holistic-bull-4d4cb2@krzk-bin>
References: <20250202-rb1-bt-v3-0-6797a4467ced@linaro.org>
 <20250202-rb1-bt-v3-1-6797a4467ced@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250202-rb1-bt-v3-1-6797a4467ced@linaro.org>

On Sun, Feb 02, 2025 at 02:15:57PM +0200, Dmitry Baryshkov wrote:
> WCN3950 is another member of the WiFi/BT WCN39xx family of the chips. It
> requires different firmware, so document it as a new compat string.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/net/bluetooth/qualcomm-bluetooth.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


