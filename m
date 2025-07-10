Return-Path: <linux-arm-msm+bounces-64351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C62B0001C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 13:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2C0D1C8759B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54A42E54AF;
	Thu, 10 Jul 2025 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HubwSBRY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2CD2E5432;
	Thu, 10 Jul 2025 11:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145642; cv=none; b=D1dh2Nd9NUPoDxgLQKyiEAn0r1y1NB4U6l4mNUKfCGvaDf0Ayu7yAo2I/CAUUtMdxwTigtzKD40UxikxRRysLy3LXRubFqdh9wvaQrD7KaiZcvH3lJnaa0RlWos6CgYobggfxh7YlvGTJnvIM0oE+sq+Prix8N2x+HDc1F3LoDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145642; c=relaxed/simple;
	bh=cP0YccyJ7Yk/7NkZ0wkAWEv1jfHKscTcSiPWI1OSaEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aoFvq/V42+l2YMIysfVqHTn8VXqa1E/igyLPsddHWFqFLS6p0odOXReAoYQvpriNk3IyUnrmF/omtSKAoAyiSaxBMp0SYW3MINwkGC0HlT54nhc4+ytALOTcdHj+51FDSGAgDXyyOy/mUNGZcFZeNKDyOfef0vSO471cnBRTwUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HubwSBRY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D291FC4CEE3;
	Thu, 10 Jul 2025 11:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752145642;
	bh=cP0YccyJ7Yk/7NkZ0wkAWEv1jfHKscTcSiPWI1OSaEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HubwSBRYx9IEb9EKj8DZFkbR21tO2VOA+6fqxxJ5OF2hK0PkWBlnlachA9wlCk7WE
	 +kQ/jEblR1G04I4sWZDFGCQXJNT0zWDdxw4ZnFwUWgiJRS3GKIwSqf5bnf93r3DmKP
	 3VOGJ3Lk9i/j3f+rMAbx/fTgPhK6IyjwHCk1t3gNHqEQdN0H65qF74jKcsDuzk8t3Z
	 fxQ6iv7mnU8TBpCLbiVrJMtpaabtHy8gbPC89bBFffiEHSmUb3tdg/Vn+TP36EVohP
	 sWjHQhhs3f9oh4yOh/q+SAAtMqi8NSRSDUbvuM7ofeNRgvG8LMzCvfAUUqDH6xd7rP
	 n+FzMYlyjx5Fg==
Date: Thu, 10 Jul 2025 13:07:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v2 2/4] dt-bindings: phy: qcom,snps-eusb2: document the
 Milos Synopsys eUSB2 PHY
Message-ID: <20250710-little-zebra-of-priority-f1fdaa@krzk-bin>
References: <20250709-sm7635-eusb-phy-v2-0-4790eeee7ae0@fairphone.com>
 <20250709-sm7635-eusb-phy-v2-2-4790eeee7ae0@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250709-sm7635-eusb-phy-v2-2-4790eeee7ae0@fairphone.com>

On Wed, Jul 09, 2025 at 11:18:16AM +0200, Luca Weiss wrote:
> Document the Synopsys eUSB2 PHY on the Milos SoC by using the SM8550 as
> fallback.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


