Return-Path: <linux-arm-msm+bounces-90959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNTiGczveWnG1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:15:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6327A021E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 40A09300BD93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6D929AAFA;
	Wed, 28 Jan 2026 11:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hI9/K97m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394972BB1D;
	Wed, 28 Jan 2026 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769598920; cv=none; b=SDxazshCYQ6wybxpNX9UDwZiveMQrZtxt+gegkSBnPV4jr7Xc8Wm65tpv6yTH2fJmRTAualylU20aWsf/p/U5ZPx2IY17j1ftIoYgiVX5dC6aEWN1UEcK4BT55WB+GotYri8lulZBmGwGQ7aMohFvKAuB5XbArBGf9pZ120G23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769598920; c=relaxed/simple;
	bh=Fb0fMEDD6ZR7daPrE/6sMtAD0Jctu4kGLYUcvng94+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zq8LakwZIgHXh0X0hF7xXrZo0gh/OPOqlL+Bxf7kI6eorelrOW4ZdIUMf0rcPuREAIyXPq+S0AmezP2eI2pZJajK5puuysbDjKJwJ4acJv+RcXraLwEOcVEqhfD4hYAn9xOxfyH573DhYObR57JFirVLzCJ6lPiT+Kr8Atgocxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hI9/K97m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D9ADC4CEF1;
	Wed, 28 Jan 2026 11:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769598919;
	bh=Fb0fMEDD6ZR7daPrE/6sMtAD0Jctu4kGLYUcvng94+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hI9/K97m6S/Wh3ZGQA2xy3R0jbF4o0prfjNWI67x5eUe2KjqAkC5NbdFNyf0oX7SL
	 Q/KnqSVrPnt0h1d/pEB2zLhaWuqJIr6GASCD9R1J+AdRC9wNwvGAZjqsJ5+uHryEBH
	 67afJKP5vmWLA19klqjK0OlIeALT7/wZYNuO8rKsak0I31B5LY6N1hWfgVVFcXUdty
	 JoADCsCwKF9yNZo1P10pRmqxpespzJ1v7e0mYUIuOiVJvlhMNwq4qgeNtkdoeJcSOs
	 ZfYWW3SOFAaojGLlwqh6/apmGvIvEFuwE2PTNmjBaxFJcIrTiPJ6xc8hCAZIsesw6N
	 AkdkmIIgvQhAw==
Date: Wed, 28 Jan 2026 12:15:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Luca Weiss <luca.weiss@fairphone.com>, Taniya Das <taniya.das@oss.qualcomm.com>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: qcom: document the Eliza
 Global Clock Controller
Message-ID: <20260128-unique-cow-of-vitality-e9fdc1@quoll>
References: <20260127-eliza-clocks-v2-0-ccee9438b5c8@oss.qualcomm.com>
 <20260127-eliza-clocks-v2-1-ccee9438b5c8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260127-eliza-clocks-v2-1-ccee9438b5c8@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90959-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6327A021E
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 05:03:19PM +0200, Abel Vesa wrote:
> From: Taniya Das <taniya.das@oss.qualcomm.com>
> 
> Add bindings documentation for the Global Clock Controller on Qualcomm
> Eliza SoC. Reuse the Milos bindings schema since the controller resources
> are exactly the same, even though the controllers are incompatible between
> them.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/clock/qcom,milos-gcc.yaml  |   9 +-
>  include/dt-bindings/clock/qcom,eliza-gcc.h         | 218 +++++++++++++++++++++
>  2 files changed, 225 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
> index cf244c155f9a..539a0a804152 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,milos-gcc.yaml
> @@ -8,16 +8,21 @@ title: Qualcomm Global Clock & Reset Controller on Milos
>  
>  maintainers:
>    - Luca Weiss <luca.weiss@fairphone.com>
> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>  
>  description: |
>    Qualcomm global clock control module provides the clocks, resets and power
>    domains on Milos.
>  
> -  See also: include/dt-bindings/clock/qcom,milos-gcc.h
> +  See also:
> +   - include/dt-bindings/clock/qcom,eliza-gcc.h
> +   - include/dt-bindings/clock/qcom,milos-gcc.h
>  
>  properties:
>    compatible:
> -    const: qcom,milos-gcc
> +    enum:
> +      - qcom,milos-gcc
> +      - qcom,eliza-gcc

Misordered.

Best regards,
Krzysztof


