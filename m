Return-Path: <linux-arm-msm+bounces-63978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCD5AFC4E8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:01:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DE1E3AB261
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4697229B232;
	Tue,  8 Jul 2025 08:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oH6QrbS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129DA10A1F;
	Tue,  8 Jul 2025 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961658; cv=none; b=sgSgWDecpfxSZ5dCY9E9xLLDN3AS/0LR0O9HSo2v2UFESn5mWwVZbjbCQzBabDIXUCSOXr64/LwTJGodsWqo6xVZRHb7H9Qv1ixW+0gQ5LvSXe1TsNgdi+nXULZSaebXzIjtReXmfN61W7SmGQfcJ/XHXuJfuQsx13vFr9zcZsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961658; c=relaxed/simple;
	bh=jdS3BEKP95D3Rrf9pnCS5mK68sq8SKb7VurqMKU0HCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=om+FJ5wjTzQL3mavAF2sYxZH0MFqfKUv42PjqGaDw9+yMwRKxJHr+mY34H2HTaUJ8OLmiif+NEZop3Bao6edMqfn4BKQ/Q0gV+BJ6zKANaopVfcqXsHjLgApzd7dlTiOtOqFLpI6+RLagCVqiT7IAK7b1hMpyHvGRdKTUhf8AUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oH6QrbS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BEDC4CEF0;
	Tue,  8 Jul 2025 08:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751961657;
	bh=jdS3BEKP95D3Rrf9pnCS5mK68sq8SKb7VurqMKU0HCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oH6QrbS0wvPdemLePIKRnzt7juvhMVuJNd23Dfrk2JaiMQvv06TjcD/rBKAqsg2VZ
	 MFT4W9KIJD2RvWB9trBGxN+vMuFgZncAi/65cOoDrAWx5dE7RAZjpR9eejeq7Yit2O
	 4Zq2WDNb2WCCOgnn8yUknYUyCImONw99yrTY7gpJcDi8hcXSJHQ2RnL7+ORA6sgJD+
	 iO967RVsMxEzL6O3Y6laYkTNDE8Ts3HXUWFExdNB3dTAZsu5nFSJZWCMMhZalfwxo2
	 gFc35rJIw9zW7IB8lsUaGxMULpV8pAoZeI5kJmSZ2RUoZVSENMf8fQ333F8pdahXgQ
	 rWqCbfa1HRQ5A==
Date: Tue, 8 Jul 2025 10:00:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: qcom: document the Milos TCSR
 Clock Controller
Message-ID: <20250708-swinging-sly-pegasus-c31dbd@krzk-bin>
References: <20250707-sm7635-clocks-misc-v2-0-b49f19055768@fairphone.com>
 <20250707-sm7635-clocks-misc-v2-3-b49f19055768@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250707-sm7635-clocks-misc-v2-3-b49f19055768@fairphone.com>

On Mon, Jul 07, 2025 at 11:56:39AM +0200, Luca Weiss wrote:
> Add bindings documentation for the Milos (e.g. SM7635) TCSR Clock
> Controller.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


